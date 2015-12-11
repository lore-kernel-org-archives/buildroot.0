From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Dec 2015 22:52:47 +0100
Subject: [Buildroot] [PATCH] mysql: fix start script for /run on separate
	tmpfs
Message-ID: <1449870767-19685-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recently the default skeleton was changed to have /run as a separate
tmpfs instead of a symlink to /tmp. /run is not world-writable, but
mysqld tries to write its PID file as user mysql. Therefore, it fails
to start.

To fix, create /run/mysql and give it to user mysql.

While we're at it, change the paths to /run instead of /var/run.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I don't think something similar needs to be done for systemd - AFAICS
no PID file is saved for systemd.
---
 package/mysql/S97mysqld | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/mysql/S97mysqld b/package/mysql/S97mysqld
index dd7f57f..1d87e68 100644
--- a/package/mysql/S97mysqld
+++ b/package/mysql/S97mysqld
@@ -7,16 +7,20 @@ case "$1" in
 			mysql_install_db --user=mysql --ldata=/var/mysql
 		fi
 
+		# mysqld runs as user mysql, but /run is only writable by root
+		# so create a subdirectory for mysql.
+		install -d -o mysql -g root -m 0700 /run/mysql
+
 		# We don't use start-stop-daemon because mysqld has
 		# its own wrapper script.
 		printf "Starting mysql..."
-		/usr/bin/mysqld_safe --pid-file=/var/run/mysqld.pid &
+		/usr/bin/mysqld_safe --pid-file=/run/mysql/mysqld.pid &
 		echo "done."
 		;;
 	stop)
 		printf "Stopping mysql..."
-		if test -f /var/run/mysqld.pid ; then
-			kill `cat /var/run/mysqld.pid`
+		if test -f /run/mysql/mysqld.pid ; then
+			kill `cat /run/mysql/mysqld.pid`
 		fi
 		echo "done."
 		;;
-- 
2.6.4
