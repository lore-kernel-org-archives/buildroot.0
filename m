From: will_wagner at carallon.com <will_wagner@carallon.com>
Date: Wed,  4 Mar 2015 12:44:37 +0000
Subject: [Buildroot] [PATCH 1/1] qt5: bump version to 5.4.1
Message-ID: <1425473077-29791-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/qt5/qt5.mk                                 |   2 +-
 ...lify-use-of-__has_include-in-qlogging.cpp.patch |  54 ----
 ...ersions.cpp-Fix-build-on-big-endian-syste.patch |  51 ----
 ...cpp-Fix-build-on-mips-without-dsp-support.patch |  47 ----
 .../0001-Make-it-compile-with-no-opengl.patch      |  53 ----
 .../0002-Fix-build-failure-with-python3.patch      |  31 ---
 .../qt5webkit/0003-Fix-build-without-OpenGL.patch  | 291 ---------------------
 7 files changed, 1 insertion(+), 528 deletions(-)
 delete mode 100644 package/qt5/qt5base/0001-Simplify-use-of-__has_include-in-qlogging.cpp.patch
 delete mode 100644 package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch
 delete mode 100644 package/qt5/qt5base/0005-qdrawhelper.cpp-Fix-build-on-mips-without-dsp-support.patch
 delete mode 100644 package/qt5/qt5multimedia/0001-Make-it-compile-with-no-opengl.patch
 delete mode 100644 package/qt5/qt5webkit/0002-Fix-build-failure-with-python3.patch
 delete mode 100644 package/qt5/qt5webkit/0003-Fix-build-without-OpenGL.patch

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 3b8f7ec..e7485e1 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
 QT5_VERSION_MAJOR = 5.4
-QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt5base/0001-Simplify-use-of-__has_include-in-qlogging.cpp.patch b/package/qt5/qt5base/0001-Simplify-use-of-__has_include-in-qlogging.cpp.patch
deleted file mode 100644
index d54ef79..0000000
--- a/package/qt5/qt5base/0001-Simplify-use-of-__has_include-in-qlogging.cpp.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-0002-logging-Fix-build-with-uClibc.patch depends on this upstream patch.
-
-Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
-
-From d1d3c36e876464a9bae42565f086ded268ab5118 Mon Sep 17 00:00:00 2001
-From: Thiago Macieira <thiago.macieira@intel.com>
-Date: Wed, 17 Dec 2014 20:24:04 -0800
-Subject: [PATCH] Simplify use of __has_include in qlogging.cpp
-
-Easier to just #define it to 0
-
-Change-Id: Ife99fdca6564077762fa67c6d7a5becaf48655d8
-Reviewed-by: Olivier Goffart <ogoffart@woboq.com>
----
- src/corelib/global/qlogging.cpp | 21 +++++++++------------
- 1 file changed, 9 insertions(+), 12 deletions(-)
-
-diff --git a/src/corelib/global/qlogging.cpp b/src/corelib/global/qlogging.cpp
-index 0271573..50d35a6 100644
---- a/src/corelib/global/qlogging.cpp
-+++ b/src/corelib/global/qlogging.cpp
-@@ -72,20 +72,17 @@
- # include "private/qcore_unix_p.h"
- #endif
- 
--#if !defined QT_NO_REGULAREXPRESSION && !defined(QT_BOOTSTRAPPED)
--#ifdef __has_include
--#if __has_include(<cxxabi.h>) && __has_include(<execinfo.h>)
--#define QLOGGING_HAVE_BACKTRACE
--#endif
--#elif defined(__GLIBCXX__) && defined(__GLIBC__) // (because older version of gcc don't have __has_include)
--#define QLOGGING_HAVE_BACKTRACE
-+#ifndef __has_include
-+#  define __has_include(x) 0
- #endif
- 
--#ifdef QLOGGING_HAVE_BACKTRACE
--#include <qregularexpression.h>
--#include <cxxabi.h>
--#include <execinfo.h>
--#endif
-+#if !defined QT_NO_REGULAREXPRESSION && !defined(QT_BOOTSTRAPPED)
-+#  if (defined(__GLIBC__) && defined(__GLIBCXX__)) || (__has_include(<cxxabi.h>) && __has_include(<execinfo.h>))
-+#    define QLOGGING_HAVE_BACKTRACE
-+#    include <qregularexpression.h>
-+#    include <cxxabi.h>
-+#    include <execinfo.h>
-+#  endif
- #endif
- 
- #include <stdio.h>
--- 
-1.9.1
-
diff --git a/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch b/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch
deleted file mode 100644
index 1e7705f..0000000
--- a/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-qimage_conversions.cpp: Fix build on big endian systems
-
-Backporting an upstream patch to fix a qt5base build failure on big
-endian systems. This is the error message:
-
-image/qimage_conversions.cpp:2257:9: error: expected '}' before numeric 
-constant
-
-Upstream commit:
-
-  https://qt.gitorious.org/qt/qtbase/commit/404f4281fda764cafdaa5635db995dabc4f1de8c
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 404f4281fda764cafdaa5635db995dabc4f1de8c Mon Sep 17 00:00:00 2001
-From: Dmitry Shachnev <mitya57@gmail.com>
-Date: Tue, 9 Dec 2014 09:27:53 +0300
-Subject: [PATCH] qimage_conversions.cpp: Fix build on big endian systems
-
-Change-Id: I8149eb2deaa101daf85a957ff48c3a7140c43bbc
-Reviewed-by: Timo Jyrinki <timo.jyrinki@canonical.com>
-Reviewed-by: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
----
- src/gui/image/qimage_conversions.cpp |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/gui/image/qimage_conversions.cpp b/src/gui/image/qimage_conversions.cpp
-index 17563b1..858a0d9 100644
---- a/src/gui/image/qimage_conversions.cpp
-+++ b/src/gui/image/qimage_conversions.cpp
-@@ -2252,7 +2252,7 @@ Image_Converter qimage_converter_map[QImage::NImageFormats][QImage::NImageFormat
-         convert_ARGB_to_ARGB_PM,
- #else
-         0,
--        0
-+        0,
- #endif
-         0, 0, 0, 0
-     }, // Format_RGBA8888
-@@ -2281,7 +2281,7 @@ Image_Converter qimage_converter_map[QImage::NImageFormats][QImage::NImageFormat
- #else
-         0,
-         0,
--        0
-+        0,
- #endif
-         0, 0, 0, 0
-     }, // Format_RGBA8888_Premultiplied
--- 
-1.7.1
-
diff --git a/package/qt5/qt5base/0005-qdrawhelper.cpp-Fix-build-on-mips-without-dsp-support.patch b/package/qt5/qt5base/0005-qdrawhelper.cpp-Fix-build-on-mips-without-dsp-support.patch
deleted file mode 100644
index ede4d80..0000000
--- a/package/qt5/qt5base/0005-qdrawhelper.cpp-Fix-build-on-mips-without-dsp-support.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-qdrawhelper.cpp: Fix build on MIPS without DSP support
-
-The qt_memfill32_asm_mips_dsp function is only declared if 
-QT_COMPILER_SUPPORTS_MIPS_DSP is defined, so we can't reference it 
-unless the same macro is defined.
-
-Backporting an upstream patch to fix this issue.
-
-Upstream commit:
-
-  https://qt.gitorious.org/qt/qtbase/commit/2ca323ccd4f25f409eff8fc0c9804099b78c2bde
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 2ca323ccd4f25f409eff8fc0c9804099b78c2bde Mon Sep 17 00:00:00 2001
-From: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@theqtcompany.com>
-Date: Tue, 11 Nov 2014 13:11:54 +0100
-Subject: [PATCH] Android: Compile for MIPS
-
-The qt_memfill32_asm_mips_dsp function is only declared if
-QT_COMPILER_SUPPORTS_MIPS_DSP is defined, so we can't reference it
-unless the same macro is defined.
-
-Change-Id: Ib959b4b969b699ca78804394206266469b4ebf64
-Task-number: QTBUG-36017
-Reviewed-by: Paul Olav Tvete <paul.tvete@theqtcompany.com>
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
----
- src/gui/painting/qdrawhelper.cpp |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/gui/painting/qdrawhelper.cpp b/src/gui/painting/qdrawhelper.cpp
-index f2d27a0..6482cc5 100644
---- a/src/gui/painting/qdrawhelper.cpp
-+++ b/src/gui/painting/qdrawhelper.cpp
-@@ -6829,7 +6829,7 @@ void qInitDrawhelperAsm()
-     qt_fetch_radial_gradient = qt_fetch_radial_gradient_neon;
- #endif
- 
--#ifdef Q_PROCESSOR_MIPS_32
-+#if defined(Q_PROCESSOR_MIPS_32) && defined(QT_COMPILER_SUPPORTS_MIPS_DSP)
-     qt_memfill32 = qt_memfill32_asm_mips_dsp;
- #endif // Q_PROCESSOR_MIPS_32
- 
--- 
-1.7.1
-
diff --git a/package/qt5/qt5multimedia/0001-Make-it-compile-with-no-opengl.patch b/package/qt5/qt5multimedia/0001-Make-it-compile-with-no-opengl.patch
deleted file mode 100644
index 58e53e4..0000000
--- a/package/qt5/qt5multimedia/0001-Make-it-compile-with-no-opengl.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-qt5multimedia: Make it compile with no-opengl
-
-Backport an upstream patch to make it compile with no-opengl. Otherwise 
-it will fail showing an error message like this one:
-
-qpaintervideosurface.cpp:99:47: error: 'QOpenGLContext' has not been 
-declared
-
-Upstream commit:
-
-  https://qt.gitorious.org/qt/qtmultimedia/commit/2b181d546970d18a48a0f36f5d1a22418b61cd4d
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.org>
-
-From 2b181d546970d18a48a0f36f5d1a22418b61cd4d Mon Sep 17 00:00:00 2001
-From: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
-Date: Tue, 9 Dec 2014 15:34:10 +0100
-Subject: [PATCH] Make it compile with no-opengl
-
-Change-Id: I71358bb1268e5b28b66b1817a3ec0cd98459cfd2
-Reviewed-by: Friedemann Kleint <Friedemann.Kleint@theqtcompany.com>
-Reviewed-by: Yoann Lopes <yoann.lopes@theqtcompany.com>
----
- src/multimediawidgets/qpaintervideosurface.cpp |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/multimediawidgets/qpaintervideosurface.cpp b/src/multimediawidgets/qpaintervideosurface.cpp
-index 3a880de..2ab5dcb 100644
---- a/src/multimediawidgets/qpaintervideosurface.cpp
-+++ b/src/multimediawidgets/qpaintervideosurface.cpp
-@@ -96,7 +96,9 @@ QVideoSurfaceGenericPainter::QVideoSurfaceGenericPainter()
-         << QVideoFrame::Format_ARGB32
-         << QVideoFrame::Format_RGB565;
-     // The raster formats should be a subset of the GL formats.
-+#ifndef QT_NO_OPENGL
-     if (QOpenGLContext::openGLModuleType() != QOpenGLContext::LibGLES)
-+#endif
-         m_imagePixelFormats << QVideoFrame::Format_RGB24;
- }
- 
-@@ -137,7 +139,9 @@ QAbstractVideoSurface::Error QVideoSurfaceGenericPainter::start(const QVideoSurf
-     const QAbstractVideoBuffer::HandleType t = format.handleType();
-     if (t == QAbstractVideoBuffer::NoHandle) {
-         bool ok = m_imageFormat != QImage::Format_Invalid && !m_imageSize.isEmpty();
-+#ifndef QT_NO_OPENGL
-         if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGLES)
-+#endif
-             ok &= format.pixelFormat() != QVideoFrame::Format_RGB24;
-         if (ok)
-             return QAbstractVideoSurface::NoError;
--- 
-1.7.1
-
diff --git a/package/qt5/qt5webkit/0002-Fix-build-failure-with-python3.patch b/package/qt5/qt5webkit/0002-Fix-build-failure-with-python3.patch
deleted file mode 100644
index dc0854e..0000000
--- a/package/qt5/qt5webkit/0002-Fix-build-failure-with-python3.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fetched from: https://codereview.qt-project.org/#/c/99784/
-
-From e9d00f6279f9cfefc5a3144d5953bb7934aed418 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Thu, 13 Nov 2014 15:29:38 +0100
-Subject: [PATCH] Fix build failure with python3
-
-Task-number: QTBUG-33692
-Change-Id: I7a3bc6217110ce3a0bf5fee4b3b675dee39d8ac5
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- Source/JavaScriptCore/disassembler/udis86/itab.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/JavaScriptCore/disassembler/udis86/itab.py b/Source/JavaScriptCore/disassembler/udis86/itab.py
-index 3d50ad0..90bd3e0 100644
---- a/Source/JavaScriptCore/disassembler/udis86/itab.py
-+++ b/Source/JavaScriptCore/disassembler/udis86/itab.py
-@@ -314,7 +314,7 @@ class UdItabGenerator( ud_opcode.UdOpcodeTables ):
-         self.ItabH.write( "\n" )
- 
-         self.ItabH.write("\n/* itab entry operand definitions */\n");
--        operands = self.OperandDict.keys()
-+        operands = list( self.OperandDict.keys() )
-         operands.sort()
-         for o in operands:
-             self.ItabH.write("#define O_%-7s { %-12s %-8s }\n" %
--- 
-2.1.3
-
diff --git a/package/qt5/qt5webkit/0003-Fix-build-without-OpenGL.patch b/package/qt5/qt5webkit/0003-Fix-build-without-OpenGL.patch
deleted file mode 100644
index cf6aeee..0000000
--- a/package/qt5/qt5webkit/0003-Fix-build-without-OpenGL.patch
+++ /dev/null
@@ -1,291 +0,0 @@
-From 4ecb913768ff0806c6efdff4567ef5907f597e4a Mon Sep 17 00:00:00 2001
-From: Allan Sandfeld Jensen <allan.jensen@digia.com>
-Date: Tue, 6 Jan 2015 16:31:27 +0100
-Subject: [PATCH] Fix build without OpenGL
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The accelerated 2D canvas feature broke building without OpenGL due to
-missing feature checks.
-
-Task-number: QTBUG-43549
-Change-Id: I7e62751d5237e1c600bc784539c70db50bccfa22
-Reviewed-by: Ashish Kulkarni <kulkarni.ashish@gmail.com>
-Reviewed-by: Michael Br?ning <michael.bruning@theqtcompany.com>
----
- Source/WebCore/Target.pri                          |    4 ++--
- Source/WebCore/html/HTMLCanvasElement.cpp          |    2 +-
- Source/WebCore/platform/graphics/ImageBuffer.h     |    4 ++--
- .../platform/graphics/qt/ImageBufferDataQt.cpp     |   11 +++++------
- .../platform/graphics/qt/ImageBufferDataQt.h       |    7 ++++++-
- .../WebCore/platform/graphics/qt/ImageBufferQt.cpp |    4 ++++
- Tools/QtTestBrowser/launcherwindow.cpp             |    8 ++++----
- Tools/QtTestBrowser/launcherwindow.h               |    2 +-
- 8 files changed, 25 insertions(+), 17 deletions(-)
-
-diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
-index b9167d1..d1aad9f 100644
---- a/Source/WebCore/Target.pri
-+++ b/Source/WebCore/Target.pri
-@@ -2232,7 +2232,6 @@ HEADERS += \
-     platform/graphics/RoundedRect.h \
-     platform/graphics/qt/FontCustomPlatformData.h \
-     platform/graphics/qt/NativeImageQt.h \
--    platform/graphics/qt/QFramebufferPaintDevice.h \
-     platform/graphics/qt/StillImageQt.h \
-     platform/graphics/qt/TransparencyLayer.h \
-     platform/graphics/SegmentedFontData.h \
-@@ -2886,7 +2885,6 @@ SOURCES += \
-     platform/graphics/qt/IntPointQt.cpp \
-     platform/graphics/qt/IntRectQt.cpp \
-     platform/graphics/qt/IntSizeQt.cpp \
--    platform/graphics/qt/QFramebufferPaintDevice.cpp \
-     platform/graphics/qt/PathQt.cpp \
-     platform/graphics/qt/PatternQt.cpp \
-     platform/graphics/qt/StillImageQt.cpp \
-@@ -4146,6 +4144,7 @@ use?(3D_GRAPHICS) {
-         platform/graphics/gpu/Texture.h \
-         platform/graphics/gpu/TilingData.h \
-         platform/graphics/opengl/Extensions3DOpenGL.h \
-+        platform/graphics/qt/QFramebufferPaintDevice.h \
-         platform/graphics/texmap/TextureMapperGL.h \
-         platform/graphics/texmap/TextureMapperShaderProgram.h \
-         platform/graphics/texmap/coordinated/AreaAllocator.h \
-@@ -4182,6 +4181,7 @@ use?(3D_GRAPHICS) {
-         platform/graphics/opengl/GraphicsContext3DOpenGLCommon.cpp \
-         platform/graphics/opengl/Extensions3DOpenGLCommon.cpp \
-         platform/graphics/qt/GraphicsContext3DQt.cpp \
-+        platform/graphics/qt/QFramebufferPaintDevice.cpp \
-         platform/graphics/texmap/TextureMapperGL.cpp \
-         platform/graphics/texmap/TextureMapperShaderProgram.cpp \
-         platform/graphics/texmap/coordinated/AreaAllocator.cpp \
-diff --git a/Source/WebCore/html/HTMLCanvasElement.cpp b/Source/WebCore/html/HTMLCanvasElement.cpp
-index b856234..ae39959 100644
---- a/Source/WebCore/html/HTMLCanvasElement.cpp
-+++ b/Source/WebCore/html/HTMLCanvasElement.cpp
-@@ -586,7 +586,7 @@ void HTMLCanvasElement::createImageBuffer() const
-         return;
- 
-     RenderingMode renderingMode = shouldAccelerate(bufferSize) ? Accelerated : Unaccelerated;
--#if PLATFORM(QT)
-+#if PLATFORM(QT) && ENABLE(ACCELERATED_2D_CANVAS)
-     if (renderingMode == Accelerated) {
-         QWebPageClient* client = document()->page()->chrome().platformPageClient();
-         // The WebKit2 Chrome does not have a pageclient.
-diff --git a/Source/WebCore/platform/graphics/ImageBuffer.h b/Source/WebCore/platform/graphics/ImageBuffer.h
-index 7addde9..a30d052 100644
---- a/Source/WebCore/platform/graphics/ImageBuffer.h
-+++ b/Source/WebCore/platform/graphics/ImageBuffer.h
-@@ -95,7 +95,7 @@ namespace WebCore {
-         }
- 
-         static PassOwnPtr<ImageBuffer> createCompatibleBuffer(const IntSize&, float resolutionScale, ColorSpace, const GraphicsContext*, bool hasAlpha);
--#if PLATFORM(QT)
-+#if PLATFORM(QT) && ENABLE(ACCELERATED_2D_CANVAS)
-         static PassOwnPtr<ImageBuffer> createCompatibleBuffer(const IntSize&, float resolutionScale, ColorSpace, QOpenGLContext*);
- #endif
- 
-@@ -165,7 +165,7 @@ namespace WebCore {
-         // This constructor will place its success into the given out-variable
-         // so that create() knows when it should return failure.
-         ImageBuffer(const IntSize&, float resolutionScale, ColorSpace, RenderingMode, bool& success);
--#if PLATFORM(QT)
-+#if PLATFORM(QT) && ENABLE(ACCELERATED_2D_CANVAS)
-         ImageBuffer(const IntSize&, float resolutionScale, ColorSpace, QOpenGLContext*, bool& success);
- #endif
-     };
-diff --git a/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.cpp b/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.cpp
-index 4a16515..1235ce6 100644
---- a/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.cpp
-+++ b/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.cpp
-@@ -34,7 +34,6 @@
- #include "GraphicsSurface.h"
- #include "ImageData.h"
- #include "StillImageQt.h"
--#include "QFramebufferPaintDevice.h"
- 
- #include <QImage>
- #include <QPaintEngine>
-@@ -42,6 +41,7 @@
- #include <QPixmap>
- 
- #if ENABLE(ACCELERATED_2D_CANVAS)
-+#include "QFramebufferPaintDevice.h"
- #include "TextureMapper.h"
- #include "TextureMapperPlatformLayer.h"
- #include "TextureMapperGL.h"
-@@ -483,16 +483,12 @@ ImageBufferData::ImageBufferData(const IntSize& size)
-     initPainter();
- }
- 
-+#if ENABLE(ACCELERATED_2D_CANVAS)
- ImageBufferData::ImageBufferData(const IntSize& size, QOpenGLContext* compatibleContext)
- {
-     m_painter = new QPainter;
- 
--#if ENABLE(ACCELERATED_2D_CANVAS)
-     m_impl = new ImageBufferDataPrivateAccelerated(size, compatibleContext);
--#else
--    Q_UNUSED(compatibleContext);
--    m_impl = new ImageBufferDataPrivateUnaccelerated(size);
--#endif
- 
-     if (!m_impl->paintDevice())
-         return;
-@@ -501,11 +497,14 @@ ImageBufferData::ImageBufferData(const IntSize& size, QOpenGLContext* compatible
- 
-     initPainter();
- }
-+#endif
- 
- ImageBufferData::~ImageBufferData()
- {
-+#if ENABLE(ACCELERATED_2D_CANVAS)
-     if (m_impl->isAccelerated())
-         static_cast<QFramebufferPaintDevice*>(m_impl->paintDevice())->ensureActiveTarget();
-+#endif
-     m_painter->end();
-     delete m_painter;
-     delete m_impl;
-diff --git a/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.h b/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.h
-index 486b0d5..fcad887 100644
---- a/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.h
-+++ b/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.h
-@@ -29,10 +29,13 @@
- #include "Image.h"
- 
- #include <QImage>
--#include <QOpenGLContext>
- #include <QPainter>
- #include <QPaintDevice>
- 
-+#if ENABLE(ACCELERATED_2D_CANVAS)
-+#include <QOpenGLContext>
-+#endif
-+
- #include <wtf/RefPtr.h>
- 
- namespace WebCore {
-@@ -61,7 +64,9 @@ class ImageBufferData
- {
- public:
-     ImageBufferData(const IntSize&);
-+#if ENABLE(ACCELERATED_2D_CANVAS)
-     ImageBufferData(const IntSize&, QOpenGLContext*);
-+#endif
-     ~ImageBufferData();
-     QPainter* m_painter;
-     ImageBufferDataPrivate* m_impl;
-diff --git a/Source/WebCore/platform/graphics/qt/ImageBufferQt.cpp b/Source/WebCore/platform/graphics/qt/ImageBufferQt.cpp
-index 400743d..09c90a6 100644
---- a/Source/WebCore/platform/graphics/qt/ImageBufferQt.cpp
-+++ b/Source/WebCore/platform/graphics/qt/ImageBufferQt.cpp
-@@ -47,6 +47,7 @@
- 
- namespace WebCore {
- 
-+#if ENABLE(ACCELERATED_2D_CANVAS)
- ImageBuffer::ImageBuffer(const IntSize& size, float /* resolutionScale */, ColorSpace, QOpenGLContext* compatibleContext, bool& success)
-     : m_data(size, compatibleContext)
-     , m_size(size)
-@@ -58,6 +59,7 @@ ImageBuffer::ImageBuffer(const IntSize& size, float /* resolutionScale */, Color
- 
-     m_context = adoptPtr(new GraphicsContext(m_data.m_painter));
- }
-+#endif
- 
- ImageBuffer::ImageBuffer(const IntSize& size, float /* resolutionScale */, ColorSpace, RenderingMode /*renderingMode*/, bool& success)
-     : m_data(size)
-@@ -75,6 +77,7 @@ ImageBuffer::~ImageBuffer()
- {
- }
- 
-+#if ENABLE(ACCELERATED_2D_CANVAS)
- PassOwnPtr<ImageBuffer> ImageBuffer::createCompatibleBuffer(const IntSize& size, float resolutionScale, ColorSpace colorSpace, QOpenGLContext* context)
- {
-     bool success = false;
-@@ -83,6 +86,7 @@ PassOwnPtr<ImageBuffer> ImageBuffer::createCompatibleBuffer(const IntSize& size,
-         return nullptr;
-     return buf.release();
- }
-+#endif
- 
- GraphicsContext* ImageBuffer::context() const
- {
-diff --git a/Tools/QtTestBrowser/launcherwindow.cpp b/Tools/QtTestBrowser/launcherwindow.cpp
-index e2dcef3..d293397 100644
---- a/Tools/QtTestBrowser/launcherwindow.cpp
-+++ b/Tools/QtTestBrowser/launcherwindow.cpp
-@@ -177,9 +177,9 @@ void LauncherWindow::initializeView()
- #ifndef QT_NO_OPENGL
-         if (!m_windowOptions.useQOpenGLWidgetViewport)
-             toggleQGLWidgetViewport(m_windowOptions.useQGLWidgetViewport);
--#endif
-         if (!m_windowOptions.useQGLWidgetViewport)
-             toggleQOpenGLWidgetViewport(m_windowOptions.useQOpenGLWidgetViewport);
-+#endif
-         view->setPage(page());
- 
-         connect(view, SIGNAL(currentFPSUpdated(int)), this, SLOT(updateFPS(int)));
-@@ -407,7 +407,6 @@ void LauncherWindow::createChrome()
-     toggleQGLWidgetViewport->setChecked(m_windowOptions.useQGLWidgetViewport);
-     toggleQGLWidgetViewport->setEnabled(isGraphicsBased());
-     toggleQGLWidgetViewport->connect(toggleGraphicsView, SIGNAL(toggled(bool)), SLOT(setEnabled(bool)));
--#endif
- #if QT_VERSION >= QT_VERSION_CHECK(5, 4, 0)
-     QAction* toggleQOpenGLWidgetViewport = graphicsViewMenu->addAction("Toggle use of QOpenGLWidget Viewport", this, SLOT(toggleQOpenGLWidgetViewport(bool)));
-     toggleQOpenGLWidgetViewport->setCheckable(true);
-@@ -415,6 +414,7 @@ void LauncherWindow::createChrome()
-     toggleQOpenGLWidgetViewport->setEnabled(isGraphicsBased());
-     toggleQOpenGLWidgetViewport->connect(toggleGraphicsView, SIGNAL(toggled(bool)), SLOT(setEnabled(bool)));
- #endif
-+#endif
- 
-     QMenu* viewportUpdateMenu = graphicsViewMenu->addMenu("Change Viewport Update Mode");
-     viewportUpdateMenu->setEnabled(isGraphicsBased());
-@@ -802,9 +802,9 @@ void LauncherWindow::screenshot()
- #ifndef QT_NO_OPENGL
-     if (!m_windowOptions.useQOpenGLWidgetViewport)
-         toggleQGLWidgetViewport(m_windowOptions.useQGLWidgetViewport);
--#endif
-     if (!m_windowOptions.useQGLWidgetViewport)
-         toggleQOpenGLWidgetViewport(m_windowOptions.useQOpenGLWidgetViewport);
-+#endif
- }
- 
- void LauncherWindow::setEditable(bool on)
-@@ -997,7 +997,6 @@ void LauncherWindow::toggleQGLWidgetViewport(bool enable)
-     WebViewGraphicsBased* view = static_cast<WebViewGraphicsBased*>(m_view);
-     view->setViewport(enable ? new QGLWidget() : 0);
- }
--#endif
- 
- void LauncherWindow::toggleQOpenGLWidgetViewport(bool enable)
- {
-@@ -1013,6 +1012,7 @@ void LauncherWindow::toggleQOpenGLWidgetViewport(bool enable)
-     view->setViewport(enable ? new QOpenGLWidget() : 0);
- #endif
- }
-+#endif
- 
- void LauncherWindow::changeViewportUpdateMode(int mode)
- {
-diff --git a/Tools/QtTestBrowser/launcherwindow.h b/Tools/QtTestBrowser/launcherwindow.h
-index c470a5a..5cee7e5 100644
---- a/Tools/QtTestBrowser/launcherwindow.h
-+++ b/Tools/QtTestBrowser/launcherwindow.h
-@@ -180,8 +180,8 @@ protected Q_SLOTS:
- #endif
- #ifndef QT_NO_OPENGL
-     void toggleQGLWidgetViewport(bool enable);
--#endif
-     void toggleQOpenGLWidgetViewport(bool enable);
-+#endif
- 
-     void changeViewportUpdateMode(int mode);
-     void animatedFlip();
--- 
-1.7.1
-
-
-- 
2.1.4
