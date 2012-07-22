From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 19:17:48 +0200
Subject: [Buildroot] [git commit branch/next] lighttpd: add simple startup
	script
Message-ID: <20120802195258.F3A5D8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccda74f3c72d1c8809ee171e39a7712b23a03dc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/S50lighttpd |   37 +++++++++++++++++++++++++++++++++++++
 package/lighttpd/lighttpd.mk |    8 ++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/lighttpd/S50lighttpd b/package/lighttpd/S50lighttpd
new file mode 100644
index 0000000..752402c
--- /dev/null
+++ b/package/lighttpd/S50lighttpd
@@ -0,0 +1,37 @@
+#!/bin/sh
+#
+# Starts lighttpd.
+#
+
+start() {
+	echo -n "Starting lighttpd: "
+	start-stop-daemon -S -q -p /var/run/lighttpd.pid --exec /usr/sbin/lighttpd -- -f /etc/lighttpd/lighttpd.conf
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping lighttpd: "
+	start-stop-daemon -K -q -p /var/run/lighttpd.pid
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
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 48f733a..9f554cb 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -87,6 +87,14 @@ endef
 
 LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_CONFIG
 
+define LIGHTTPD_INSTALL_INIT_SCRIPT
+	[ -f $(TARGET_DIR)/etc/init.d/S50lighttpd ] || \
+		$(INSTALL) -D -m 755 package/lighttpd/S50lighttpd \
+			$(TARGET_DIR)/etc/init.d/S50lighttpd
+endef
+
+LIGHTTPD_POST_INSTALL_TARGET_HOOKS += LIGHTTPD_INSTALL_INIT_SCRIPT
+
 define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd
 	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd-angel
