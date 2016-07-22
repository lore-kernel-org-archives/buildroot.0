From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 22 Jul 2016 16:08:58 +0100
Subject: [Buildroot] [PATCH] ser2net: add SYSV init script
Message-ID: <1469200138-56632-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ser2net/S50ser2net | 40 ++++++++++++++++++++++++++++++++++++++++
 package/ser2net/ser2net.mk |  5 +++++
 2 files changed, 45 insertions(+)
 create mode 100644 package/ser2net/S50ser2net

diff --git a/package/ser2net/S50ser2net b/package/ser2net/S50ser2net
new file mode 100644
index 0000000..d527485
--- /dev/null
+++ b/package/ser2net/S50ser2net
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# Startup script for ser2net
+#
+
+[ -f /usr/sbin/ser2net ] || exit 0
+
+start() {
+    echo -n  "Starting ser2net: "
+    start-stop-daemon -S -q --exec /usr/sbin/ser2net -- -P /var/run/ser2net.pid
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+    echo -n "Shutting down ser2net "
+    start-stop-daemon -K -q -p /var/run/ser2net.pid
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start)
+	    start
+	    ;;
+	stop)
+	    stop
+	    ;;
+	restart)
+	    restart
+	    ;;
+	*)
+	    echo "Usage: ser2net {start|stop|restart}"
+	    exit 1
+esac
+
+exit $?
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index ac64c3d..85b23ae 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -9,4 +9,9 @@ SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
+define SER2NET_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/ser2net/S50ser2net \
+		$(TARGET_DIR)/etc/init.d/S50ser2net
+endef
+
 $(eval $(autotools-package))
-- 
2.7.3
