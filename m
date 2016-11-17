From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Nov 2016 16:41:25 -0300
Subject: [Buildroot] [PATCH] mesa3d: add patch to fix wayland-scanner issues
Message-ID: <1479411685-6912-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d tries to use the pkg-config specified wayland-scanner when
wayland is enabled, which points to /usr/bin/wayland-scanner which is
incorrect.
The correct fix is trying to use the PATH wayland-scanner first if it's
available rather than the pkg-config specified one, since tweaking a
staging .pc file with a host binary is wrong. Fixes:
http://autobuild.buildroot.net/results/c0c/c0ca3778c390a33c27073553ca3bef7ac7c5784b/

Patch sent upstream:
https://lists.freedesktop.org/archives/mesa-dev/2016-November/135665.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ac-invert-order-for-wayland-scanner-check.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch

diff --git a/package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch
new file mode 100644
index 0000000..e32031e
--- /dev/null
+++ b/package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch
@@ -0,0 +1,39 @@
+From 60ee5191a0c074251862a15b12afdc9db0b2df38 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 17 Nov 2016 15:36:54 -0300
+Subject: [PATCH] configure.ac: invert order for wayland-scanner check
+
+When cross-compiling the .pc file might point to the wrong
+wayland-scanner binary (target rather than host) resulting in a
+non-executable and wrong scanner.
+Try searching the PATH first, and if that fails fall back into
+pkg-config.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5f30ae8..461792e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2025,11 +2025,11 @@ if test "x$with_egl_platforms" != "x" -a "x$enable_egl" != xyes; then
+     AC_MSG_ERROR([cannot build egl state tracker without EGL library])
+ fi
+ 
+-PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
+-        WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
+-        WAYLAND_SCANNER='')
++AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
+ if test "x$WAYLAND_SCANNER" = x; then
+-    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
++    PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
++            WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
++            WAYLAND_SCANNER='')
+ fi
+ 
+ # Do per-EGL platform setups and checks
+-- 
+2.7.3
+
-- 
2.7.3
