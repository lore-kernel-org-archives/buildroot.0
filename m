From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 21:48:17 +0100
Subject: [Buildroot] [git commit] qt5wayland: fix build issue with mesa3d
 w/out xcb
Message-ID: <20180227210121.125F78137A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85483968bec8c5bb3332f61b22cc9be8f0ad15f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
MESA_EGL_NO_X11_HEADERS is defined[1].

A build issue happens when mesa3d is selected as then OpenGL EGL backend
but the XCB library is not selected.

This commit tells qmake to pass the cflag MESA_EGL_NO_X11_HEADERS to
make and prevent from including the missing X headers.

The issue QTBUG-66233 is opened in the Qt tracker[1].

Fixes:

	In file included from
	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39:0,
	                 from
	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtEglSupport/5.10.0/QtEglSupport/private/qt_egl_p.h:65,
	                 from
	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtEglSupport/5.10.0/QtEglSupport/private/qeglstreamconvenience_p.h:55,
	                 from
	../../../../hardwareintegration/compositor/wayland-egl/waylandeglclientbufferintegration.cpp:56:
	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22:
	fatal error: X11/Xlib.h: No such file or directory
	 #include <X11/Xlib.h>
	                      ^
	compilation terminated.
	Makefile:656: recipe for target
	'.obj/waylandeglclientbufferintegration.o' failed
	make[8]: *** [.obj/waylandeglclientbufferintegration.o] Error 1

[1]: https://github.com/mesa3d/mesa/blob/79ee1b2ff0b85f4eeb4165d23a7943c28d3a3d93/include/EGL/eglplatform.h#L109-L125
[2]: https://bugreports.qt.io/browse/QTBUG-66233

[Peter: simplify logic]
Cc: Julien CORJON <corjon.j@ecagroup.com>
Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5wayland/qt5wayland.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 0a7bdb8cf9..8a7f2e1fb5 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -26,6 +26,13 @@ ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
 QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
 endif
 
+# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
+# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
+# the libxcb is not selected.
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)x$(BR2_PACKAGE_LIBXCB),yx)
+QT5WAYLAND_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
+endif
+
 define QT5WAYLAND_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5WAYLAND_QMAKEFLAGS))
 endef
