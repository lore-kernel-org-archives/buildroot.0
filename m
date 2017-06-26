From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 26 Jun 2017 23:13:11 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: fix plugins videonode egl x11
	header related compile failure
Message-ID: <20170626211311.10890-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add MESA_EGL_NO_X11_HEADERS define (as other egl projects do via
QT_EGL_NO_X11).

Fixes [1]:

  In file included from .../host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/egl.h:39:0,
                   from qsgvideonode_egl.h:48,
                   from qsgvideonode_egl.cpp:40:
  .../host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/eglplatform.h:119:22: fatal error: X11/Xlib.h: No such file or directory
   #include <X11/Xlib.h>
                      ^
  compilation terminated.
  make[5]: Leaving directory `.../build/qt5multimedia-5.8.0/src/plugins/videonode/egl'

[1] http://autobuild.buildroot.net/results/364/364a76bbf90251f9cae2abd3ef2e382758eae538

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...eonode-egl-fix-x11-header-related-compile.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/qt5/qt5multimedia/5.8.0/0001-plugins-videonode-egl-fix-x11-header-related-compile.patch

diff --git a/package/qt5/qt5multimedia/5.8.0/0001-plugins-videonode-egl-fix-x11-header-related-compile.patch b/package/qt5/qt5multimedia/5.8.0/0001-plugins-videonode-egl-fix-x11-header-related-compile.patch
new file mode 100644
index 0000000000..bbf2a94f6d
--- /dev/null
+++ b/package/qt5/qt5multimedia/5.8.0/0001-plugins-videonode-egl-fix-x11-header-related-compile.patch
@@ -0,0 +1,30 @@
+From 72e04823b49bb8ec5f126a172521c16f3281282d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 26 Jun 2017 23:01:32 +0200
+Subject: [PATCH] plugins/videonode/egl: fix x11 header related compile failure
+
+Add MESA_EGL_NO_X11_HEADERS define (as other egl projects do via
+QT_EGL_NO_X11).
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/plugins/videonode/egl/egl.pro | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/plugins/videonode/egl/egl.pro b/src/plugins/videonode/egl/egl.pro
+index 7151123..08ec149 100644
+--- a/src/plugins/videonode/egl/egl.pro
++++ b/src/plugins/videonode/egl/egl.pro
+@@ -3,6 +3,9 @@ TARGET = eglvideonode
+ QT += multimedia-private qtmultimediaquicktools-private
+ CONFIG += egl
+ 
++# Avoid X11 header collision, use generic EGL native types
++DEFINES += MESA_EGL_NO_X11_HEADERS
++
+ HEADERS += \
+     qsgvideonode_egl.h
+ 
+-- 
+2.11.0
+
-- 
2.11.0
