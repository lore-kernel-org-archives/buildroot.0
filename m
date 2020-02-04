From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  3 Feb 2020 17:21:58 -0800
Subject: [Buildroot] [PATCH v3 6/8] package/mariadb: explicitly define
 logging directory to mysqld
In-Reply-To: <20200204012200.7273-1-bluemrp9@gmail.com>
References: <20200204012200.7273-1-bluemrp9@gmail.com>
Message-ID: <20200204012200.7273-6-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, mariadb creates logging files under the data directory.
This patch updates the startup scripts to log under /var/log/mysql.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v2 -> v3:
  - separate changes into seperate patches (suggested by Thomas)
Changes v1 -> v2:
  - no change
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
-- 
2.25.0
