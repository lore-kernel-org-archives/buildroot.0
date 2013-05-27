From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 27 May 2013 10:16:55 +0100
Subject: [Buildroot] [PATCH] neard: add init script
Message-ID: <1369646215-16116-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/neard/S53neard | 33 +++++++++++++++++++++++++++++++++
 package/neard/neard.mk |  9 +++++++++
 2 files changed, 42 insertions(+)
 create mode 100755 package/neard/S53neard

diff --git a/package/neard/S53neard b/package/neard/S53neard
new file mode 100755
index 0000000..0a75941
--- /dev/null
+++ b/package/neard/S53neard
@@ -0,0 +1,33 @@
+#!/bin/sh
+#
+# Starts neard
+#
+
+NAME=neard
+DAEMON=/usr/libexec/nfc/$NAME
+
+# Exit gracefully if the package has been removed
+[ -x $DAEMON ] || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting $NAME: "
+    start-stop-daemon -S -q -p /var/run/${NAME}.pid -x $DAEMON -- -d '*'
+    echo "OK"
+    ;;
+  stop)
+    echo -n "Stopping $NAME: "
+    start-stop-daemon -K -q -p /var/run/${NAME}.pid
+    echo "OK"
+    ;;
+  restart|reload)
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart}"
+    exit 1
+esac
+
+exit $?
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index cc6aeac..57a434d 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -17,4 +17,13 @@ ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
 	NEARD_CONF_OPT += --enable-tools
 endif
 
+define NEARD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/neard/S53neard \
+		$(TARGET_DIR)/etc/init.d/S53neard
+endef
+
+define NEARD_UNINSTALL_INIT_SYSV
+	$(RM) $(TARGET_DIR)/etc/init.d/S53neard
+endef
+
 $(eval $(autotools-package))
-- 
1.8.1.2
