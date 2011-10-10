From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 10 Oct 2011 11:22:00 +0200
Subject: [Buildroot] [PATCH 3/3] xdm: install startup script
In-Reply-To: <1318238520-16580-1-git-send-email-yegorslists@googlemail.com>
References: <1318238520-16580-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1318238520-16580-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

install S99xdm to /etc/init.d to start XDM automatically

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_xdm/S99xdm      |   27 +++++++++++++++++++++++++++
 package/x11r7/xapp_xdm/xapp_xdm.mk |    6 ++++++
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/xapp_xdm/S99xdm

diff --git a/package/x11r7/xapp_xdm/S99xdm b/package/x11r7/xapp_xdm/S99xdm
new file mode 100644
index 0000000..57b5d92
--- /dev/null
+++ b/package/x11r7/xapp_xdm/S99xdm
@@ -0,0 +1,27 @@
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
+        /etc/init.d/S99xdm stop
+        /etc/init.d/S99xdm start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+
+exit 0
+
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 81e2acd..d0fc2fc 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -11,4 +11,10 @@ XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
 XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
 XAPP_XDM_CONF_OPT = --with-utmp-file=/var/adm/utmpx --with-wtmp-file=/var/adm/wtmpx
 
+define XAPP_XDM_INSTALL_STARTUP_SCRIPT
+	$(INSTALL) -m 0755 package/x11r7/xapp_xdm/S99xdm $(TARGET_DIR)/etc/init.d/S99xdm
+endef
+
+XAPP_XDM_POST_INSTALL_TARGET_HOOKS += XAPP_XDM_INSTALL_STARTUP_SCRIPT
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.1.1
