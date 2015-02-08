From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 17:14:54 +0100
Subject: [Buildroot] [PATCH] qt5multimedia: Make it compile with
	no-opengl
In-Reply-To: <1423411498-12674-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1423411498-12674-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150208161454.GK4028@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-02-08 16:04 +0000, Vicente Olivert Riera spake thusly:
> Backport an upstream patch to make it compile with no-opengl. Otherwise
> it will fail showing an error message like this one:
> 
> qpaintervideosurface.cpp:99:47: error: 'QOpenGLContext' has not been
> declared
> 
> Upstream commit:
> 
>   https://qt.gitorious.org/qt/qtmultimedia/commit/2b181d546970d18a48a0f36f5d1a22418b61cd4d
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b77/b77cdf9b1cf6cafd5afef7337553bb32489207e5/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../0001-Make-it-compile-with-no-opengl.patch      |   53 ++++++++++++++++++++
>  1 files changed, 53 insertions(+), 0 deletions(-)
>  create mode 100644 package/qt5/qt5multimedia/0001-Make-it-compile-with-no-opengl.patch
> 
> diff --git a/package/qt5/qt5multimedia/0001-Make-it-compile-with-no-opengl.patch b/package/qt5/qt5multimedia/0001-Make-it-compile-with-no-opengl.patch
> new file mode 100644
> index 0000000..58e53e4
> --- /dev/null
> +++ b/package/qt5/qt5multimedia/0001-Make-it-compile-with-no-opengl.patch
> @@ -0,0 +1,53 @@
> +qt5multimedia: Make it compile with no-opengl
> +
> +Backport an upstream patch to make it compile with no-opengl. Otherwise 
> +it will fail showing an error message like this one:
> +
> +qpaintervideosurface.cpp:99:47: error: 'QOpenGLContext' has not been 
> +declared
> +
> +Upstream commit:
> +
> +  https://qt.gitorious.org/qt/qtmultimedia/commit/2b181d546970d18a48a0f36f5d1a22418b61cd4d
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.org>
> +
> +From 2b181d546970d18a48a0f36f5d1a22418b61cd4d Mon Sep 17 00:00:00 2001
> +From: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
> +Date: Tue, 9 Dec 2014 15:34:10 +0100
> +Subject: [PATCH] Make it compile with no-opengl
> +
> +Change-Id: I71358bb1268e5b28b66b1817a3ec0cd98459cfd2
> +Reviewed-by: Friedemann Kleint <Friedemann.Kleint@theqtcompany.com>
> +Reviewed-by: Yoann Lopes <yoann.lopes@theqtcompany.com>
> +---
> + src/multimediawidgets/qpaintervideosurface.cpp |    4 ++++
> + 1 files changed, 4 insertions(+), 0 deletions(-)
> +
> +diff --git a/src/multimediawidgets/qpaintervideosurface.cpp b/src/multimediawidgets/qpaintervideosurface.cpp
> +index 3a880de..2ab5dcb 100644
> +--- a/src/multimediawidgets/qpaintervideosurface.cpp
> ++++ b/src/multimediawidgets/qpaintervideosurface.cpp
> +@@ -96,7 +96,9 @@ QVideoSurfaceGenericPainter::QVideoSurfaceGenericPainter()
> +         << QVideoFrame::Format_ARGB32
> +         << QVideoFrame::Format_RGB565;
> +     // The raster formats should be a subset of the GL formats.
> ++#ifndef QT_NO_OPENGL
> +     if (QOpenGLContext::openGLModuleType() != QOpenGLContext::LibGLES)
> ++#endif
> +         m_imagePixelFormats << QVideoFrame::Format_RGB24;
> + }
> + 
> +@@ -137,7 +139,9 @@ QAbstractVideoSurface::Error QVideoSurfaceGenericPainter::start(const QVideoSurf
> +     const QAbstractVideoBuffer::HandleType t = format.handleType();
> +     if (t == QAbstractVideoBuffer::NoHandle) {
> +         bool ok = m_imageFormat != QImage::Format_Invalid && !m_imageSize.isEmpty();
> ++#ifndef QT_NO_OPENGL
> +         if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGLES)
> ++#endif
> +             ok &= format.pixelFormat() != QVideoFrame::Format_RGB24;
> +         if (ok)
> +             return QAbstractVideoSurface::NoError;
> +-- 
> +1.7.1
> +
> -- 
> 1.7.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
