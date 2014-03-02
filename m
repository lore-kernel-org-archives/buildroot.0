From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 21:05:05 +0100
Subject: [Buildroot] [git commit] Qt5: patches for linuxfb only systems
Message-ID: <20140302200559.4E80B9936B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee56c351b7ccc91f7a289372b3144e9f99c2a545
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Merged patches from the official qtbase/stable branch,
not part of 5.2.1.

Signed-off-by: Peter K??mmel <syntheticpp@gmx.net>
Acked-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...on-t-require-GL-when-build-with-no-opengl.patch |   28 ++++++++++++++
 ...5base-Fix-linuxfb-argument-mmsize-parsing.patch |   38 ++++++++++++++++++++
 2 files changed, 66 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-CMake-don-t-require-GL-when-build-with-no-opengl.patch b/package/qt5/qt5base/qt5base-CMake-don-t-require-GL-when-build-with-no-opengl.patch
new file mode 100644
index 0000000..e04bcc4
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-CMake-don-t-require-GL-when-build-with-no-opengl.patch
@@ -0,0 +1,28 @@
+From 02edc30764935d64f0994a9c592ca729f1c37410 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
+Date: Fri, 31 Jan 2014 22:28:19 +0100
+Subject: [PATCH] CMake: don't require GL when build with -no-opengl
+
+Task-number: QTBUG-36509
+Change-Id: I03451527ab91754d87ff2a43985952c7c7641826
+Reviewed-by: Stephen Kelly <stephen.kelly@kdab.com>
+---
+ src/gui/gui.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gui/gui.pro b/src/gui/gui.pro
+index 3203b41..f4c35a3 100644
+--- a/src/gui/gui.pro
++++ b/src/gui/gui.pro
+@@ -81,7 +81,7 @@ contains(QT_CONFIG, angle) {
+         !isEmpty(QMAKE_LIBDIR_OPENGL_ES2): CMAKE_OPENGL_LIBDIR = $$cmakePortablePaths($$QMAKE_LIBDIR_OPENGL_ES2)
+         CMAKE_GL_HEADER_NAME = GLES2/gl2.h
+         CMAKE_QT_OPENGL_IMPLEMENTATION = GLESv2
+-    } else {
++    } else:contains(QT_CONFIG, opengl) {
+         !isEmpty(QMAKE_INCDIR_OPENGL): CMAKE_GL_INCDIRS = $$cmakeTargetPaths($$QMAKE_INCDIR_OPENGL)
+         CMAKE_OPENGL_INCDIRS = $$cmakePortablePaths($$QMAKE_INCDIR_OPENGL)
+         CMAKE_OPENGL_LIBS = $$cmakeProcessLibs($$QMAKE_LIBS_OPENGL)
+-- 
+1.8.3.2
+
diff --git a/package/qt5/qt5base/qt5base-Fix-linuxfb-argument-mmsize-parsing.patch b/package/qt5/qt5base/qt5base-Fix-linuxfb-argument-mmsize-parsing.patch
new file mode 100644
index 0000000..3b9811b
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-Fix-linuxfb-argument-mmsize-parsing.patch
@@ -0,0 +1,38 @@
+From b1fb89055d4d1bc88b7b0b788ad8eca4f3641f9a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
+Date: Fri, 7 Feb 2014 13:12:37 +0100
+Subject: [PATCH] Fix linuxfb argument 'mmsize' parsing
+
+Parse first for 'mmsize' because the regex for 'size' also fits to 'mmsize'.
+
+Task-number: QTBUG-29133
+Change-Id: Idc4950270818e496d5d94a97a172b7c780f069b1
+---
+ src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
+index 735a43d..33a9523 100644
+--- a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
++++ b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
+@@ -333,6 +333,8 @@ bool QLinuxFbScreen::initialize()
+     foreach (const QString &arg, mArgs) {
+         if (arg == QLatin1String("nographicsmodeswitch"))
+             doSwitchToGraphicsMode = false;
++        else if (mmSizeRx.indexIn(arg) != -1)
++            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
+         else if (sizeRx.indexIn(arg) != -1)
+             userGeometry.setSize(QSize(sizeRx.cap(1).toInt(), sizeRx.cap(2).toInt()));
+         else if (offsetRx.indexIn(arg) != -1)
+@@ -341,8 +343,6 @@ bool QLinuxFbScreen::initialize()
+             ttyDevice = ttyRx.cap(1);
+         else if (fbRx.indexIn(arg) != -1)
+             fbDevice = fbRx.cap(1);
+-        else if (mmSizeRx.indexIn(arg) != -1)
+-            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
+     }
+ 
+     if (fbDevice.isEmpty()) {
+-- 
+1.8.3.2
+
