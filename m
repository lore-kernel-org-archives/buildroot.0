From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 15 Dec 2019 13:33:25 -0800
Subject: [Buildroot] [PATCH v2 2/3] package/mariadb: update startup scripts
In-Reply-To: <20191215213326.10863-1-bluemrp9@gmail.com>
References: <20191215213326.10863-1-bluemrp9@gmail.com>
Message-ID: <20191215213326.10863-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The init scripts have been modified to create a directory under
/var/log/mysql and specify mysqld to use it for logging. The directory
test to call mysql_install_db has been redirected to /dev/null to prevent
an error message from showing if /var/lib/mysql does not exist.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/S97mysqld      | 19 +++++++++++++------
 package/mariadb/mysqld.service |  3 ++-
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
index 270eea51dd..9cb8ce0d1c 100644
--- a/package/mariadb/S97mysqld
+++ b/package/mariadb/S97mysqld
@@ -5,7 +5,9 @@
 
 MYSQL_LIB="/var/lib/mysql"
 MYSQL_RUN="/run/mysql"
-MYSQL_PID="$MYSQL_RUN/mysqld.pid"
+MYSQL_PIDFILE="$MYSQL_RUN/mysqld.pid"
+MYSQL_LOG="/var/log/mysql"
+MYSQL_LOGFILE="$MYSQL_LOG/mysqld.log"
 MYSQL_BIN="/usr/bin"
 
 wait_for_ready() {
@@ -21,7 +23,9 @@ wait_for_ready() {
 }
 
 start() {
-	if [ `ls -1 $MYSQL_LIB | wc -l` = 0 ] ; then
+	# stderr is redirected to prevent a warning
+	# if mysql lib directory doesn't exist
+	if [ `ls -1 $MYSQL_LIB 2> /dev/null | wc -l` = 0 ] ; then
 		printf "Creating mysql system tables ... "
 		$MYSQL_BIN/mysql_install_db --basedir=/usr \
 			--datadir=$MYSQL_LIB > /dev/null 2>&1
@@ -37,19 +41,22 @@ start() {
 	# so create a subdirectory for mysql.
 	install -d -o mysql -g root -m 0755 $MYSQL_RUN
 
+	# Also create logging directory as user mysql.
+	install -d -o mysql -g root -m 0755 $MYSQL_LOG
+
 	# We don't use start-stop-daemon because mysqld has its own
 	# wrapper script.
 	printf "Starting mysql ... "
-	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PID --user=mysql \
-		> /dev/null 2>&1 &
+	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PIDFILE --user=mysql \
+		--log-error=$MYSQL_LOGFILE > /dev/null 2>&1 &
 	wait_for_ready
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 
 stop() {
 	printf "Stopping mysql ... "
-	if [ -f $MYSQL_PID ]; then
-		kill `cat $MYSQL_PID` > /dev/null 2>&1
+	if [ -f $MYSQL_PIDFILE ]; then
+		kill `cat $MYSQL_PIDFILE` > /dev/null 2>&1
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 	else
 		echo "FAIL"
diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
index 3eaef173e1..0166a32dff 100644
--- a/package/mariadb/mysqld.service
+++ b/package/mariadb/mysqld.service
@@ -3,7 +3,8 @@ Description=MySQL database server
 
 [Service]
 ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql && chown -R mysql:mysql /var/lib/mysql'
-ExecStart=/usr/bin/mysqld_safe
+ExecStartPre=install -d -o mysql -g root -m 0755 /var/log/mysql
+ExecStart=/usr/bin/mysqld_safe --pid-file=/var/run/mysql/mysqld.pid --log-error=/var/log/mysql/mysqld.log
 Restart=always
 User=mysql
 RuntimeDirectory=mysql
-- 
2.24.1
