/** Remove default mysql user **/
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

/** Setup mysql root password **/
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');

/** Create database and user for the project */
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO $DB_USER@'%';

/** Apply changes **/
FLUSH PRIVILEGES;
