From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 14:57:20 +0100
Subject: [Buildroot] [git commit] package/mariadb: explicitly define logging
 directory to mysqld
Message-ID: <20200204134625.72E758B4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b653736ce48b6e62eae636f6c8fc94be776b985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, mariadb creates logging files under the data directory.
This patch updates the startup scripts to log under /var/log/mysql.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/S97mysqld      | 7 ++++++-
 package/mariadb/mysqld.service | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
index ffd3712400..b895014b54 100644
--- a/package/mariadb/S97mysqld
+++ b/package/mariadb/S97mysqld
@@ -6,6 +6,8 @@
 MYSQL_LIB="/var/lib/mysql"
 MYSQL_RUN="/run/mysql"
 MYSQL_PIDFILE="$MYSQL_RUN/mysqld.pid"
+MYSQL_LOG="/var/log/mysql"
+MYSQL_LOGFILE="$MYSQL_LOG/mysqld.log"
 MYSQL_BIN="/usr/bin"
 
 wait_for_ready() {
@@ -38,11 +40,14 @@ start() {
 	# so create a subdirectory for mysql.
 	install -d -o mysql -g root -m 0755 $MYSQL_RUN
 
+	# Also create logging directory as user mysql.
+	install -d -o mysql -g root -m 0755 $MYSQL_LOG
+
 	# We don't use start-stop-daemon because mysqld has its own
 	# wrapper script.
 	printf "Starting mysql ... "
 	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PIDFILE --user=mysql \
-		> /dev/null 2>&1 &
+		--log-error=$MYSQL_LOGFILE > /dev/null 2>&1 &
 	wait_for_ready
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
index 3eaef173e1..d9ea74ebc3 100644
--- a/package/mariadb/mysqld.service
+++ b/package/mariadb/mysqld.service
@@ -3,7 +3,8 @@ Description=MySQL database server
 
 [Service]
 ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql && chown -R mysql:mysql /var/lib/mysql'
-ExecStart=/usr/bin/mysqld_safe
+ExecStartPre=install -d -o mysql -g root -m 0755 /var/log/mysql
+ExecStart=/usr/bin/mysqld_safe --log-error=/var/log/mysql/mysqld.log
 Restart=always
 User=mysql
 RuntimeDirectory=mysql
