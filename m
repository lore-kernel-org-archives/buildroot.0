From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 13:56:10 +0200
Subject: [Buildroot] [PATCH 3/3] rpcbind : add startup script
In-Reply-To: <1404129370-3090-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404129370-3090-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1404129370-3090-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sagaert Johan <sagaert.johan@skynet.be>

rpcbind must be started at boot time.
Without this any nfs mount will fail.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpcbind/S30rpcbind | 38 ++++++++++++++++++++++++++++++++++++++
 package/rpcbind/rpcbind.mk |  6 ++++++
 2 files changed, 44 insertions(+)
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
index 5699b29..f699b3d 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -16,4 +16,10 @@ RPCBIND_CONF_ENV += \
 RPCBIND_DEPENDENCIES += libtirpc
 RPCBIND_CONF_OPT += --with-rpcuser=root
 
+define RPCBIND_INSTALL_INIT_SYSV
+	[ -f $(TARGET_DIR)/etc/init.d/S30rpcbind ] || \
+		$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
+			$(TARGET_DIR)/etc/init.d/S30rpcbind
+endef
+
 $(eval $(autotools-package))
-- 
2.0.0
