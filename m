From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 14:57:20 +0100
Subject: [Buildroot] [git commit] package/mariadb: rename MYSQL_PID variable
 in sysv startup script
Message-ID: <20200204134625.682078B4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bbf01869f16f48667f6097f51871e058e4e3b7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consistency with the to-be-added MYSQL_LOGFILE variable.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
