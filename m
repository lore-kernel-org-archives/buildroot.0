From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 14:17:51 +0300
Subject: [Buildroot] [PATCH] qt5base: fix build when egl headers need a
	definition
Message-ID: <1379503071-5446-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build with gpu-viv-bin-mx6q libraries was broken since it wasn't
using "-DEGL_API_FB=1" flag which is found in egl.pc.

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5base/qt5base-egl-cflags.patch |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/qt5/qt5base/qt5base-egl-cflags.patch

diff --git a/package/qt5/qt5base/qt5base-egl-cflags.patch b/package/qt5/qt5base/qt5base-egl-cflags.patch
new file mode 100644
index 0000000..7f9d779
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-egl-cflags.patch
@@ -0,0 +1,21 @@
+--- a/configure
++++ b/configure
+@@ -5391,6 +5391,7 @@
+         QMAKE_CFLAGS_EGL=`$PKG_CONFIG --cflags egl 2>/dev/null`
+         QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
+         QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
++        QMakeVar set QMAKE_CFLAGS_EGL "$QMAKE_CFLAGS_EGL"
+     fi       # detect EGL support
+     if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
+         CFG_EGL=yes
+--- a/mkspecs/features/egl.prf
++++ b/mkspecs/features/egl.prf
+@@ -14,6 +14,8 @@
+ } else {
+     INCLUDEPATH += $$QMAKE_INCDIR_EGL
+     LIBS_PRIVATE += $$QMAKE_LIBS_EGL
++    QMAKE_CFLAGS += $$QMAKE_CFLAGS_EGL
++    QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_EGL
+     LIBS += $$QMAKE_LFLAGS_EGL
+     for(p, QMAKE_LIBDIR_EGL) {
+         exists($$p):LIBS_PRIVATE += -L$$p
-- 
1.7.10.4
