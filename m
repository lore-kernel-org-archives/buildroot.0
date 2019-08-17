From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 16:26:07 +0200
Subject: [Buildroot] [git commit] package/qt5multimedia: fix build without
 opengl
Message-ID: <20190817142834.BD3AC817A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dac7df1775c97c68b4eda9468a972005d2e6f3f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/fc7bcc6b3ccf1e075dce43296b36e7e1cac417db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ue-when-no-opengl-in-QVideoSurfacePainter.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/qt5/qt5multimedia/5.12.4/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch b/package/qt5/qt5multimedia/5.12.4/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch
new file mode 100644
index 0000000000..1dc7701c08
--- /dev/null
+++ b/package/qt5/qt5multimedia/5.12.4/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch
@@ -0,0 +1,47 @@
+From 9bbf9f0d862b8d458e59690d36641618fb101b4e Mon Sep 17 00:00:00 2001
+From: Val Doroshchuk <valentyn.doroshchuk@qt.io>
+Date: Mon, 17 Jun 2019 15:20:22 +0200
+Subject: Fix compile issue when no opengl in QVideoSurfacePainter
+
+error: invalid use of incomplete type 'class QGLContext'
+
+Change-Id: I4bc9bd4231e663b187d3cef917b7a551ba614ba9
+Fixes: QTBUG-76405
+Reviewed-by: Andy Shaw <andy.shaw@qt.io>
+
+[Retrieved from:
+https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?id=9bbf9f0d862b8d458e59690d36641618fb101b4e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/multimediawidgets/qpaintervideosurface.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/multimediawidgets/qpaintervideosurface.cpp b/src/multimediawidgets/qpaintervideosurface.cpp
+index 440d5c858..6af0c7588 100644
+--- a/src/multimediawidgets/qpaintervideosurface.cpp
++++ b/src/multimediawidgets/qpaintervideosurface.cpp
+@@ -57,10 +57,6 @@
+ #ifndef GL_RGB8
+ #define GL_RGB8 0x8051
+ #endif
+-#endif
+-
+-#include <QtDebug>
+-QT_BEGIN_NAMESPACE
+ 
+ static void makeCurrent(QGLContext *context)
+ {
+@@ -70,6 +66,10 @@ static void makeCurrent(QGLContext *context)
+     if (handle && QOpenGLContext::currentContext() != handle)
+         handle->makeCurrent(handle->surface());
+ }
++#endif
++
++#include <QtDebug>
++QT_BEGIN_NAMESPACE
+ 
+ QVideoSurfacePainter::~QVideoSurfacePainter()
+ {
+-- 
+cgit v1.2.1
+
