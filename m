From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 3 Jul 2017 20:46:54 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: fix plugins videonode egl
 x11 header related compile failure
In-Reply-To: <20170702231449.4a4d1832@windsurf>
References: <20170626211311.10890-1-ps.report@gmx.net>
 <20170702003332.771dd45c@windsurf>
 <20170702210127.7090df5b@gmx.net>
 <20170702231449.4a4d1832@windsurf>
Message-ID: <20170703204654.751617d1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 2 Jul 2017 23:14:49 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sun, 2 Jul 2017 21:01:27 +0200, Peter Seiderer wrote:
> 
> > Same fixing pattern as for qt5base (and for qtbase accepted upstream, see e.g. [1]),
> 
> Well, [1] is about adding QT_EGL_NO_X11, which is a QT definition. It
> is very different from MESA_EGL_NO_X11_HEADERS, which is an
> OpenGL-level definition.

The missing link is in file src/platformsupport/eglconvenience/qt_egl_p.h line 54ff:

 54 #ifdef QT_EGL_NO_X11
 55 # define MESA_EGL_NO_X11_HEADERS // MESA
 56 # define WIN_INTERFACE_CUSTOM    // NV
 57 #endif // QT_EGL_NO_X11
 58 
 59 #ifdef QT_EGL_WAYLAND
 60 # define WAYLAND // NV
 61 #endif // QT_EGL_WAYLAND
 62 
 63 #include <EGL/egl.h>
 64 #include <EGL/eglext.h>

QT_EGL_NO_X11 forces MESA_EGL_NO_X11_HEADERS before the egl headers are included...

> 
> > but in general your are right, honor the given provider provided flags would be
> > the better solution...maybe something as suggested on the yocto meta-freescale
> > mailing list will work, see [2], [3]: 'egl.prf: Fix build error when egl headers
> > need platform definition'?
> 
> I'm not sure I fully understand those patches, but apparently they use
> more pkg-config flags from OpenGL, which is exactly the approach I
> suggest to investigate indeed.
> 
> BTW, the same thing should be done for Qt instead of
> package/qt/0012-OpenGL-EGL-Avoid-X11-header-collision.patch.

Will test the patch(es) the next days...

Regards,
Peter

> 
> Best regards,
> 
> Thomas
