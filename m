From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jul 2017 21:02:40 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: fix plugins videonode egl
 x11 header related compile failure
In-Reply-To: <20170703204654.751617d1@gmx.net>
References: <20170626211311.10890-1-ps.report@gmx.net>
 <20170702003332.771dd45c@windsurf>
 <20170702210127.7090df5b@gmx.net>
 <20170702231449.4a4d1832@windsurf>
 <20170703204654.751617d1@gmx.net>
Message-ID: <20170703210240.6a3f21bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Jul 2017 20:46:54 +0200, Peter Seiderer wrote:

> On Sun, 2 Jul 2017 23:14:49 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > Hello,
> > 
> > On Sun, 2 Jul 2017 21:01:27 +0200, Peter Seiderer wrote:
> >   
> > > Same fixing pattern as for qt5base (and for qtbase accepted upstream, see e.g. [1]),  
> > 
> > Well, [1] is about adding QT_EGL_NO_X11, which is a QT definition. It
> > is very different from MESA_EGL_NO_X11_HEADERS, which is an
> > OpenGL-level definition.  
> 
> The missing link is in file src/platformsupport/eglconvenience/qt_egl_p.h line 54ff:
> 
>  54 #ifdef QT_EGL_NO_X11
>  55 # define MESA_EGL_NO_X11_HEADERS // MESA
>  56 # define WIN_INTERFACE_CUSTOM    // NV
>  57 #endif // QT_EGL_NO_X11
>  58 
>  59 #ifdef QT_EGL_WAYLAND
>  60 # define WAYLAND // NV
>  61 #endif // QT_EGL_WAYLAND
>  62 
>  63 #include <EGL/egl.h>
>  64 #include <EGL/eglext.h>
> 
> QT_EGL_NO_X11 forces MESA_EGL_NO_X11_HEADERS before the egl headers are included...

Ah, okay, indeed. But still, I really think it should be the
responsibility of the OpenGL provider to define MESA_EGL_NO_X11_HEADERS
in its .pc files, rather than having this logic duplicated in all
packages "consuming" the OpenGL API.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
