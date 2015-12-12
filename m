From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 12:03:55 +0100
Subject: [Buildroot] [git commit] mysql: fix start script for /run on
	separate tmpfs
Message-ID: <20151212110404.1782580AE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ff54bb7a48dc6b0705a382b56159d86b2f1c7e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recently the default skeleton was changed to have /run as a separate
tmpfs instead of a symlink to /tmp. /run is not world-writable, but
mysqld tries to write its PID file as user mysql. Therefore, it fails
to start.

To fix, create /run/mysql and give it to user mysql.

While we're at it, change the paths to /run instead of /var/run.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
