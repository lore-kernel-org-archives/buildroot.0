From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Tue,  4 Mar 2014 14:50:02 +0000
Subject: [Buildroot] [PATCH 3/4] mysql: add mysql init script
In-Reply-To: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
References: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
Message-ID: <1393944603-3104-3-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 package/mysql/S97mysqld |   22 ++++++++++++++++++++++
 package/mysql/mysql.mk  |    5 +++++
 2 files changed, 27 insertions(+)
 create mode 100644 package/mysql/S97mysqld

diff --git a/package/mysql/S97mysqld b/package/mysql/S97mysqld
new file mode 100644
index 0000000..91ddb44
--- /dev/null
+++ b/package/mysql/S97mysqld
@@ -0,0 +1,22 @@
+#!/bin/sh
+#
+#MySQL init script.
+#
+case "$1" in
+	start)
+		/usr/bin/mysqld_safe &
+		;;
+	stop)
+		if test -f /var/lib/mysql/mysqld.pid ; then
+			PID=`cat /var/lib/mysql/mysqld.pid`
+			kill $PID
+		fi
+		;;
+	restart)
+		"$0" stop
+		"$0" start
+		;;
+	*)
+		echo "Usage: /etc/init.d/mysqld {start|stop|restart}"
+		;;
+esac
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 3b69bdc..c35fef5 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -89,6 +89,11 @@ endef
 
 MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_FOLDER
 
+define MYSQL_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/mysql/S97mysqld \
+		$(TARGET_DIR)/etc/init.d/S97mysqld
+endef
+
 else
 MYSQL_CONF_OPT += \
 	--without-server
-- 
1.7.10.4
