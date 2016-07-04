From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon,  4 Jul 2016 11:52:29 -0300
Subject: [Buildroot] [PATCH] minnowboard-max: Start X on boot and run a few
	demos
Message-ID: <20160704145229.23995-1-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we've merged nodm, the autologin display manager, we can
get rid of xinit, and startx hack and use nodm to start X on boot.
While here, let's start xterm and glmark2, just as demos.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
I've chosen the demo apps somewhat arbitrarily:
 * xterm because everyone loves terminals
 * glmark2 to test OpenGL

 board/minnowboard/fs-overlay-graphical/etc/X11/Xsession | 7 +++++++
 board/minnowboard/fs-overlay-graphical/root/.xinitrc    | 1 -
 board/minnowboard/fs-overlay-graphical/usr/bin/startx   | 6 ------
 configs/minnowboard_max-graphical_defconfig             | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
 create mode 100755 board/minnowboard/fs-overlay-graphical/etc/X11/Xsession
 delete mode 100644 board/minnowboard/fs-overlay-graphical/root/.xinitrc
 delete mode 100755 board/minnowboard/fs-overlay-graphical/usr/bin/startx

diff --git a/board/minnowboard/fs-overlay-graphical/etc/X11/Xsession b/board/minnowboard/fs-overlay-graphical/etc/X11/Xsession
new file mode 100755
index 000000000000..d8862f170cb1
--- /dev/null
+++ b/board/minnowboard/fs-overlay-graphical/etc/X11/Xsession
@@ -0,0 +1,7 @@
+# Start a terminal on the top left corner
+xterm -geom 80x30+0+0 &
+
+# OpenGL demo
+glmark2 &
+
+exec /usr/bin/openbox-session
diff --git a/board/minnowboard/fs-overlay-graphical/root/.xinitrc b/board/minnowboard/fs-overlay-graphical/root/.xinitrc
deleted file mode 100644
index 4274b24df1bc..000000000000
--- a/board/minnowboard/fs-overlay-graphical/root/.xinitrc
+++ /dev/null
@@ -1 +0,0 @@
-exec /usr/bin/openbox-session
diff --git a/board/minnowboard/fs-overlay-graphical/usr/bin/startx b/board/minnowboard/fs-overlay-graphical/usr/bin/startx
deleted file mode 100755
index 6f2c949d4607..000000000000
--- a/board/minnowboard/fs-overlay-graphical/usr/bin/startx
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-# Simplified custom startx script, which starts
-# the X server on vt7.
-
-xinit -- vt7
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index d84544be86c5..de803f023920 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -48,12 +48,12 @@ BR2_PACKAGE_FB_TEST_APP=y
 BR2_PACKAGE_XORG7=y
 BR2_PACKAGE_XSERVER_XORG_SERVER=y
 BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX=y
-BR2_PACKAGE_XAPP_XINIT=y
 BR2_PACKAGE_XAPP_XRANDR=y
 BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
 BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
 BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
 BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
+BR2_PACKAGE_NODM=y
 BR2_PACKAGE_XTERM=y
 BR2_PACKAGE_OPENBOX=y
 
-- 
2.9.0
