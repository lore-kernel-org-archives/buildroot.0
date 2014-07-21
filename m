From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 23:52:52 +0200
Subject: [Buildroot] [git commit] mysql: add mysql init script
Message-ID: <20140721220624.5879B9C4CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47af166209deff81c3c6d2c1d5e3814f971a27f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: explicitly specify the path to the PID file, and also on the
first boot, generate the mandatory MySQL system tables so that the
MySQL daemon actually starts properly.]

Signed-off-by: Marcelo Guti??rrez <kuyurix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

merge init script
---
 package/mysql/S97mysqld |   30 ++++++++++++++++++++++++++++++
 package/mysql/mysql.mk  |    5 +++++
 2 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/mysql/S97mysqld b/package/mysql/S97mysqld
new file mode 100644
index 0000000..6f25403
--- /dev/null
+++ b/package/mysql/S97mysqld
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		if [ ! -d /var/mysql/mysql ] ; then
+			echo "Creating MySQL system tables..."
+			mysql_install_db --user=mysql --ldata=/var/mysql
+		fi
+
+		# We don't use start-stop-daemon because mysqld has
+		# its own wrapper script.
+		echo -n "Starting mysql..."
+		/usr/bin/mysqld_safe --pid-file=/var/run/mysqld.pid &
+		echo "done."
+		;;
+	stop)
+		echo -n "Stopping mysql..."
+		if test -f /var/run/mysqld.pid ; then
+			kill `cat /var/run/mysqld.pid`
+		fi
+		echo "done."
+		;;
+	restart)
+		$0 stop
+		$0 start
+		;;
+	*)
+		echo "Usage: /etc/init.d/mysqld {start|stop|restart}"
+		;;
+esac
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 44dcb7e..fec8b03 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -99,6 +99,11 @@ endef
 
 MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_FOLDER
 
+define MYSQL_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/mysql/S97mysqld \
+		$(TARGET_DIR)/etc/init.d/S97mysqld
+endef
+
 else
 MYSQL_CONF_OPT += \
 	--without-server
