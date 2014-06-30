From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jun 2014 23:35:01 +0200
Subject: [Buildroot] [git commit] rpcbind : add startup script
Message-ID: <20140630213728.304129D0C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56141c1232e39acbec619a432a9aff510cea2eaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpcbind must be started at boot time.
Without this any nfs mount will fail.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpcbind/S30rpcbind |   38 ++++++++++++++++++++++++++++++++++++++
 package/rpcbind/rpcbind.mk |    6 ++++++
 2 files changed, 44 insertions(+), 0 deletions(-)

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
