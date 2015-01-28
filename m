From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 28 Jan 2015 22:48:19 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5multimedia: fix compile without
 opengl
Message-ID: <trinity-9793f5a9-f1ef-4912-92e4-dc7acbb69ddc-1422481699290@3capp-gmx-bs31>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, Jan 25, 2015 at 03:03:53PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Fri, 23 Jan 2015 22:20:07 +0100, Peter Seiderer wrote:
> 
> > diff --git a/package/qt5/qt5multimedia/0001-qpaintervideosurface-fix-compile-without-opengl.patch b/package/qt5/qt5multimedia/0001-qpaintervideosurface-fix-compile-without-opengl.patch
> > new file mode 100644
> > index 0000000..578b79e
> > --- /dev/null
> > +++ b/package/qt5/qt5multimedia/0001-qpaintervideosurface-fix-compile-without-opengl.patch
> > @@ -0,0 +1,39 @@
> > +From bca9c8786da5b5bca47b873720cb0d576219d4a9 Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Fri, 23 Jan 2015 18:58:29 +0100
> > +Subject: [PATCH] qpaintervideosurface: fix compile without opengl
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +---
> > + src/multimediawidgets/qpaintervideosurface.cpp | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/src/multimediawidgets/qpaintervideosurface.cpp b/src/multimediawidgets/qpaintervideosurface.cpp
> > +index 3a880de..667ecd3 100644
> > +--- a/src/multimediawidgets/qpaintervideosurface.cpp
> > ++++ b/src/multimediawidgets/qpaintervideosurface.cpp
> > +@@ -95,8 +95,10 @@ QVideoSurfaceGenericPainter::QVideoSurfaceGenericPainter()
> > +         << QVideoFrame::Format_RGB32
> > +         << QVideoFrame::Format_ARGB32
> > +         << QVideoFrame::Format_RGB565;
> > ++#if !defined(QT_NO_OPENGL) && !defined(QT_OPENGL_ES_1_CL) && !defined(QT_OPENGL_ES_1)
> > +     // The raster formats should be a subset of the GL formats.
> > +     if (QOpenGLContext::openGLModuleType() != QOpenGLContext::LibGLES)
> > ++#endif
> > +         m_imagePixelFormats << QVideoFrame::Format_RGB24;
> > + }
> > + 
> > +@@ -137,8 +139,10 @@ QAbstractVideoSurface::Error QVideoSurfaceGenericPainter::start(const QVideoSurf
> > +     const QAbstractVideoBuffer::HandleType t = format.handleType();
> > +     if (t == QAbstractVideoBuffer::NoHandle) {
> > +         bool ok = m_imageFormat != QImage::Format_Invalid && !m_imageSize.isEmpty();
> > ++#if !defined(QT_NO_OPENGL) && !defined(QT_OPENGL_ES_1_CL) && !defined(QT_OPENGL_ES_1)
> > +         if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGLES)
> > +             ok &= format.pixelFormat() != QVideoFrame::Format_RGB24;
> > ++#endif
> 
> This is a bit scarce on details, and the first hunk that just removes
> the if condition looks a bit suspicious. Could we instead get a patch
> accepted upstream?

The original code in the first hunk disables Format_RGB24 in case of
QOpenGLContext::LibGLES, so it should be save to just remove the compare
and so enable Format_RGB24 if OpenGL is disabled.

The original code in the second hunk disables Format_RGB24 in case of
QOpenGLContext::LibGLES, so the right thing to do is to disable
the if statement (checking on QOpenGLContext::LibGLES case) and the next
line which sets ok to false in case of Format_RGB24...

But I searched upstream git, there is already a fix in 5.4.1/dev branch
fixing this problem ([1]), but as I think doing it the wrong way,
disabling Format_RGB24 for the non-OpenGL case ([2]), but a follow up
patch fixing the issue is on its way upstream ([3])...

Regards,
Peter

[1] https://qt.gitorious.org/qt/qtmultimedia/commit/2b181d546970d18a48a0f36f5d1a22418b61cd4d
[2] https://codereview.qt-project.org/101817
[3] https://codereview.qt-project.org/104811

> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
