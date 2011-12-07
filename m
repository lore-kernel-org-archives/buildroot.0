From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 21:31:22 +0100
Subject: [Buildroot] [git commit] xdm: install startup script
Message-ID: <20111207203229.015B48F8BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72a6bd4b5d2734f2c4f2f37589db3ba82829d770
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

install S99xdm to /etc/init.d to start XDM automatically

[Peter: Small cleanups]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xdm/S99xdm      |   25 +++++++++++++++++++++++++
 package/x11r7/xapp_xdm/xapp_xdm.mk |    7 +++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xdm/S99xdm b/package/x11r7/xapp_xdm/S99xdm
new file mode 100644
index 0000000..4dd1cd8
--- /dev/null
+++ b/package/x11r7/xapp_xdm/S99xdm
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+XDM_BIN=/usr/bin/xdm
+
+case "$1" in
+    start)
+        echo -n "Starting XDM: "
+        $XDM_BIN
+        echo "done"
+        ;;
+    stop)
+	echo "Stopping XDM"
+        killall -q xdm
+        ;;
+    restart)
+	$0 stop
+	$0 start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index ce38503..7268d5d 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -12,4 +12,11 @@ XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXa
 XAPP_XDM_CONF_OPT = --with-utmp-file=/var/adm/utmpx \
 		    --with-wtmp-file=/var/adm/wtmpx
 
+define XAPP_XDM_INSTALL_STARTUP_SCRIPT
+	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
+		$(TARGET_DIR)/etc/init.d/S99xdm
+endef
+
+XAPP_XDM_POST_INSTALL_TARGET_HOOKS += XAPP_XDM_INSTALL_STARTUP_SCRIPT
+
 $(eval $(call AUTOTARGETS))
