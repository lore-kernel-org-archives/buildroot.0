From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Mar 2017 23:15:46 +0100
Subject: [Buildroot] [PATCH v1 1/2] qt5base: fix eglfs x11 header related
	compile failure
Message-ID: <20170310221547.32158-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add egl config and QT_EGL_NO_X11 define (as all other eglfs project
files do) to src/plugins/platforms/eglfs/eglfs-plugin.pro.

Fixes ([1]):

  In file included from .../host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/EGL/egl.h:39:0,
                   from ../../../../include/QtEglSupport/5.8.0/QtEglSupport/private/../../../../../src/platformsupport/eglconvenience/qt_egl_p.h:63,
                   from ../../../../include/QtEglSupport/5.8.0/QtEglSupport/private/qt_egl_p.h:1,
                   from api/qeglfsglobal_p.h:56,
                   from api/qeglfsintegration_p.h:54,
                   from qeglfsmain.cpp:41:
  .../host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/EGL/eglplatform.h:119:22: fatal error: X11/Xlib.h: No such file or directory
  compilation terminated.
  Makefile.eglfs-plugin:1024: recipe for target '.obj/qeglfsmain.o' failed
  make[2]: *** [.obj/qeglfsmain.o] Error 1
  make[2]: Leaving directory '.../qt5base-5.8.0/src/plugins/platforms/eglfs'
  Makefile:71: recipe for target 'sub-eglfs-plugin-pro-make_first-ordered' failed
  make[1]: *** [sub-eglfs-plugin-pro-make_first-ordered] Error 2

[1] http://lists.busybox.net/pipermail/buildroot/2017-March/186158.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...fs-fix-x11-header-related-compile-failure.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch

diff --git a/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch b/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch
new file mode 100644
index 000000000..0e8bcffa2
--- /dev/null
+++ b/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch
@@ -0,0 +1,36 @@
+From 8902f4d7b7c532592d1a34ad117698d3e380e9e1 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 10 Mar 2017 22:23:06 +0100
+Subject: [PATCH] eglfs: fix x11 header related compile failure
+
+Add egl config and QT_EGL_NO_X11 define (as all other eglfs project
+files do).
+
+Task-number: QTBUG-59427
+Change-Id: Ifbb11eae0fdf0e58c0b7feecb9a7914a889c8f77
+
+Upstream: https://codereview.qt-project.org/188158
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/plugins/platforms/eglfs/eglfs-plugin.pro | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/plugins/platforms/eglfs/eglfs-plugin.pro b/src/plugins/platforms/eglfs/eglfs-plugin.pro
+index cf4863975a..ec229796e5 100644
+--- a/src/plugins/platforms/eglfs/eglfs-plugin.pro
++++ b/src/plugins/platforms/eglfs/eglfs-plugin.pro
+@@ -2,6 +2,11 @@ TARGET = qeglfs
+ 
+ QT += eglfsdeviceintegration-private
+ 
++CONFIG += egl
++
++# Avoid X11 header collision, use generic EGL native types
++DEFINES += QT_EGL_NO_X11
++
+ SOURCES += $$PWD/qeglfsmain.cpp
+ 
+ OTHER_FILES += $$PWD/eglfs.json
+-- 
+2.11.0
+
-- 
2.11.0
