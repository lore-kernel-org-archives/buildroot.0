From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 21:57:39 +0100
Subject: [Buildroot] [PATCH v1 3/3] qt5wayland: fix build issue with
 mesa3d w/out xcb
In-Reply-To: <20180212042524.28675-4-gael.portay@savoirfairelinux.com>
 (=?utf-8?Q?=22Ga=C3=ABl?=
 PORTAY"'s message of "Sun, 11 Feb 2018 23:25:24 -0500")
References: <20180212042524.28675-1-gael.portay@savoirfairelinux.com>
 <20180212042524.28675-4-gael.portay@savoirfairelinux.com>
Message-ID: <87y3jem9q4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ga?l" == Ga?l PORTAY <gael.portay@savoirfairelinux.com> writes:

 > The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
 > MESA_EGL_NO_X11_HEADERS is defined[1].

 > A build issue happens when mesa3d is selected as then OpenGL EGL backend
 > but the XCB library is not selected.

 > This commit tells qmake to pass the cflag MESA_EGL_NO_X11_HEADERS to
 > make and prevent from including the missing X headers.

 > The issue QTBUG-66233 is opened in the Qt tracker[1].

 > Fixes:

 > 	In file included from
 > 	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39:0,
 > 	                 from
 > 	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtEglSupport/5.10.0/QtEglSupport/private/qt_egl_p.h:65,
 > 	                 from
 > 	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtEglSupport/5.10.0/QtEglSupport/private/qeglstreamconvenience_p.h:55,
 > 	                 from
 > 	../../../../hardwareintegration/compositor/wayland-egl/waylandeglclientbufferintegration.cpp:56:
 > 	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22:
 > 	fatal error: X11/Xlib.h: No such file or directory
 > 	 #include <X11/Xlib.h>
 > 	                      ^
 > 	compilation terminated.
 > 	Makefile:656: recipe for target
 > 	'.obj/waylandeglclientbufferintegration.o' failed
 > 	make[8]: *** [.obj/waylandeglclientbufferintegration.o] Error 1

 > [1]: https://github.com/mesa3d/mesa/blob/79ee1b2ff0b85f4eeb4165d23a7943c28d3a3d93/include/EGL/eglplatform.h#L109-L125
 > [2]: https://bugreports.qt.io/browse/QTBUG-66233

 > Cc: Julien CORJON <corjon.j@ecagroup.com>
 > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
 > ---
 >  package/qt5/qt5wayland/qt5wayland.mk | 9 +++++++++
 >  1 file changed, 9 insertions(+)

 > diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
 > index 0a7bdb8cf9..90ea01fe74 100644
 > --- a/package/qt5/qt5wayland/qt5wayland.mk
 > +++ b/package/qt5/qt5wayland/qt5wayland.mk
 > @@ -26,6 +26,15 @@ ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
 >  QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
 >  endif
 
 > +# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
 > +# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
 > +# the libxcb is not selected.
 > +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 > +ifneq ($(BR2_PACKAGE_LIBXCB),y)
 > +QT5WAYLAND_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
 > +endif
 > +endif

When we need to check for foo and !bar we normally write it as:

ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)x$(BR2_PACKAGE_LIBXCB),yx)
..

Committed after rewriting it like that, thanks.

-- 
Bye, Peter Korsgaard
