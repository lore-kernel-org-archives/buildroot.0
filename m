From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:22:45 +0200
Subject: [Buildroot] [git commit] ser2net: add sysv init script
Message-ID: <20160723132330.CF3FC81DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cf4080087e7d7defa5fc50f42a3c6f94e3979be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas:
 - remove check for the ser2net binary
 - add check for the configuration file
 - use 'printf' instead of 'echo -n'
 - fix indentation where needed]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ser2net/S50ser2net | 43 +++++++++++++++++++++++++++++++++++++++++++
 package/ser2net/ser2net.mk |  5 +++++
 2 files changed, 48 insertions(+)

diff --git a/package/ser2net/S50ser2net b/package/ser2net/S50ser2net
new file mode 100644
index 0000000..200dfd0
--- /dev/null
+++ b/package/ser2net/S50ser2net
@@ -0,0 +1,43 @@
+#!/bin/sh
+#
+# Startup script for ser2net
+#
+
+start() {
+    printf  "Starting ser2net: "
+    if [ ! -f /etc/ser2net.conf ] ; then
+	echo "no configuration file"
+	exit 1
+    fi
+
+    start-stop-daemon -S -q --exec /usr/sbin/ser2net -- -P /var/run/ser2net.pid
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+    printf "Shutting down ser2net: "
+    start-stop-daemon -K -q -p /var/run/ser2net.pid
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+    stop
+    start
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
