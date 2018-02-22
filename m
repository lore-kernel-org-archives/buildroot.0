From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 22 Feb 2018 11:47:38 -0500
Subject: [Buildroot] [PATCH v1 0/3] qt5: fix build issue with mesa w/out
 xcb
In-Reply-To: <20180212042524.28675-1-gael.portay@savoirfairelinux.com>
References: <20180212042524.28675-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180222164738.kprf7kz2u3vywpxm@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Feb 11, 2018 at 11:25:21PM -0500, Ga?l PORTAY wrote:
> Hi all,
> 
> Julien Corjon and I have noticed a build issue with qtmultimedia,
> qtwayland and qtwebkit modules when using mesa3d (as EGL backend)
> without using XCB. When BR2_PACKAGE_LIBXCB is set the issue is gone.
> Julien has opened an issue in Qt tracker[1].
> 
> The mesa's EGL/eglplatform.h header includes X11 headers unless the
> macro MESA_EGL_NO_X11_HEADERS is defined[2].
> 
> 	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22: fatal error: X11/Xlib.h: No such file or directory
> 	 #include <X11/Xlib.h>
> 	                      ^
> 	compilation terminated.
> 
> The workaround tells qmake to pass the cflag MESA_EGL_NO_X11_HEADERS to
> make that prevents from including the missing X headers.
> 
> This workaround is performed in the situation when mesa3d is in use as
> OpenGL EGL backend and when XCB library is *not* compiled.
> 
> [1]: https://bugreports.qt.io/browse/QTBUG-66233
> [2]: https://github.com/mesa3d/mesa/blob/79ee1b2ff0b85f4eeb4165d23a7943c28d3a3d93/include/EGL/eglplatform.h#L109-L125
> 

As discussed with Thomas on the #buildroot channel:

	2018-02-16 09:01:14	kos_tom	gportay: I think the OpenGL implementation should provide those flags in its .pc file, and qt should pick them up from there

Hopefully, the MESA_EGL_NO_X11_HEADERS cflags is present the egl.pc file
from mesa3d:

	$ output/host/bin/pkg-config --cflags-only-other egl
	 -DMESA_EGL_NO_X11_HEADERS

I will work on a proper solution that will be integrated in every Qt
projects that are impacted by this issue.

I need time/help to hundersand how qmake works in order to append the
egl cflags given by pkg-config in qmake.

I almost sure that I will miss the release. So, would you agree to
accept this patch serie as a temporary workaround since it fixes a real
build issue?

> Regards,
> Ga?l PORTAY (3):
>   qt5webkit: fix build issue with mesa3d w/out xcb
>   qt5multimedia: fix build issue with mesa3d w/out xcb
>   qt5wayland: fix build issue with mesa3d w/out xcb
> 
>  package/qt5/qt5multimedia/qt5multimedia.mk | 11 ++++++++++-
>  package/qt5/qt5wayland/qt5wayland.mk       |  9 +++++++++
>  package/qt5/qt5webkit/qt5webkit.mk         | 11 ++++++++++-
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> -- 
> 2.15.1
>

Regards,
Gael
