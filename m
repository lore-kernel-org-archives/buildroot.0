From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 23 Jan 2015 22:20:07 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5multimedia: fix compile without opengl
In-Reply-To: <1422048008-13659-1-git-send-email-ps.report@gmx.net>
References: <1422048008-13659-1-git-send-email-ps.report@gmx.net>
Message-ID: <1422048008-13659-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ervideosurface-fix-compile-without-opengl.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/qt5/qt5multimedia/0001-qpaintervideosurface-fix-compile-without-opengl.patch

diff --git a/package/qt5/qt5multimedia/0001-qpaintervideosurface-fix-compile-without-opengl.patch b/package/qt5/qt5multimedia/0001-qpaintervideosurface-fix-compile-without-opengl.patch
new file mode 100644
index 0000000..578b79e
--- /dev/null
+++ b/package/qt5/qt5multimedia/0001-qpaintervideosurface-fix-compile-without-opengl.patch
@@ -0,0 +1,39 @@
+From bca9c8786da5b5bca47b873720cb0d576219d4a9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 23 Jan 2015 18:58:29 +0100
+Subject: [PATCH] qpaintervideosurface: fix compile without opengl
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/multimediawidgets/qpaintervideosurface.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/multimediawidgets/qpaintervideosurface.cpp b/src/multimediawidgets/qpaintervideosurface.cpp
+index 3a880de..667ecd3 100644
+--- a/src/multimediawidgets/qpaintervideosurface.cpp
++++ b/src/multimediawidgets/qpaintervideosurface.cpp
+@@ -95,8 +95,10 @@ QVideoSurfaceGenericPainter::QVideoSurfaceGenericPainter()
+         << QVideoFrame::Format_RGB32
+         << QVideoFrame::Format_ARGB32
+         << QVideoFrame::Format_RGB565;
++#if !defined(QT_NO_OPENGL) && !defined(QT_OPENGL_ES_1_CL) && !defined(QT_OPENGL_ES_1)
+     // The raster formats should be a subset of the GL formats.
+     if (QOpenGLContext::openGLModuleType() != QOpenGLContext::LibGLES)
++#endif
+         m_imagePixelFormats << QVideoFrame::Format_RGB24;
+ }
+ 
+@@ -137,8 +139,10 @@ QAbstractVideoSurface::Error QVideoSurfaceGenericPainter::start(const QVideoSurf
+     const QAbstractVideoBuffer::HandleType t = format.handleType();
+     if (t == QAbstractVideoBuffer::NoHandle) {
+         bool ok = m_imageFormat != QImage::Format_Invalid && !m_imageSize.isEmpty();
++#if !defined(QT_NO_OPENGL) && !defined(QT_OPENGL_ES_1_CL) && !defined(QT_OPENGL_ES_1)
+         if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGLES)
+             ok &= format.pixelFormat() != QVideoFrame::Format_RGB24;
++#endif
+         if (ok)
+             return QAbstractVideoSurface::NoError;
+     } else if (t == QAbstractVideoBuffer::QPixmapHandle) {
+-- 
+2.1.2
+
-- 
2.1.2
