From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 15 Jun 2014 13:38:20 +0200
Subject: [Buildroot] [PATCH 1/1] rpcbind : add startup script
Message-ID: <1402832300-17147-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpcbind must be started at boot time.
Without this any nfs mount will fail.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/rpcbind/S30rpcbind | 38 ++++++++++++++++++++++++++++++++++++++
 package/rpcbind/rpcbind.mk |  8 ++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 package/rpcbind/S30rpcbind

diff --git a/package/rpcbind/S30rpcbind b/package/rpcbind/S30rpcbind
new file mode 100644
index 0000000..85ebd6f
--- /dev/null
+++ b/package/rpcbind/S30rpcbind
@@ -0,0 +1,38 @@
+#!/bin/sh
+#
+# Starts rpcbind.
+#
+
+start() {
+	echo -n "Starting rpcbind: "
+	umask 077
+	start-stop-daemon -S -q -p /var/run/rpcbind.pid --exec /usr/bin/rpcbind
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping rpcbind daemon: "
+	start-stop-daemon -K -q -p /var/run/rpcbind.pid
+	echo "OK"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 19bdace..6a946f9 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -15,4 +15,12 @@ RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
 RPCBIND_DEPENDENCIES += libtirpc
 
+define RPCBIND_INSTALL_STARTUP_SCRIPT
+	[ -f $(TARGET_DIR)/etc/init.d/S30rpcbind ] || \
+		$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
+			$(TARGET_DIR)/etc/init.d/S30rpcbind
+endef
+
+RPCBIND_POST_INSTALL_TARGET_HOOKS += RPCBIND_INSTALL_STARTUP_SCRIPT
+
 $(eval $(autotools-package))
-- 
2.0.0
