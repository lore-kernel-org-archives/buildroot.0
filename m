From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  3 Feb 2020 17:21:57 -0800
Subject: [Buildroot] [PATCH v3 5/8] package/mariadb: rename variable in sysv
 startup script
In-Reply-To: <20200204012200.7273-1-bluemrp9@gmail.com>
References: <20200204012200.7273-1-bluemrp9@gmail.com>
Message-ID: <20200204012200.7273-5-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch renames MYSQL_PID to MYSQL_PIDFILE in the startup script. This
is in anticipation for some upcoming changes.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v2 -> v3:
  - separate changes into seperate patches (suggested by Thomas)
Changes v1 -> v2:
  - no change
---
 package/mariadb/S97mysqld | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
index 7f9ced31e9..ffd3712400 100644
--- a/package/mariadb/S97mysqld
+++ b/package/mariadb/S97mysqld
@@ -5,7 +5,7 @@
 
 MYSQL_LIB="/var/lib/mysql"
 MYSQL_RUN="/run/mysql"
-MYSQL_PID="$MYSQL_RUN/mysqld.pid"
+MYSQL_PIDFILE="$MYSQL_RUN/mysqld.pid"
 MYSQL_BIN="/usr/bin"
 
 wait_for_ready() {
@@ -41,7 +41,7 @@ start() {
 	# We don't use start-stop-daemon because mysqld has its own
 	# wrapper script.
 	printf "Starting mysql ... "
-	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PID --user=mysql \
+	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PIDFILE --user=mysql \
 		> /dev/null 2>&1 &
 	wait_for_ready
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
@@ -49,8 +49,8 @@ start() {
 
 stop() {
 	printf "Stopping mysql ... "
-	if [ -f $MYSQL_PID ]; then
-		kill `cat $MYSQL_PID` > /dev/null 2>&1
+	if [ -f $MYSQL_PIDFILE ]; then
+		kill `cat $MYSQL_PIDFILE` > /dev/null 2>&1
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 	else
 		echo "FAIL"
-- 
2.25.0
