From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 21:59:05 +0100
Subject: [Buildroot] [git commit] qt5webkit: fix build issue with mesa3d
 w/out xcb
Message-ID: <20180227210121.273018137A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e46f9fde78e53740bd00c077275d3cd80d7792c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
MESA_EGL_NO_X11_HEADERS is defined[1].

A build issue happens when mesa3d is selected as then OpenGL EGL backend
but the XCB library is not selected.

This commit tells qmake to pass the cflag MESA_EGL_NO_X11_HEADERS to
make and prevent from including the missing X headers.

The issue QTBUG-66233 is opened in the Qt tracker[1].

Fixes:

	In file included from /home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39:0,
	                 from platform/graphics/opengl/Extensions3DOpenGLES.cpp:33:
	/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:118:22: fatal error: X11/Xlib.h: No such file or directory
	 #include <X11/Xlib.h>
	                      ^
	compilation terminated.
	Makefile.WebCore.Target:93596: recipe for target '.obj/platform/graphics/opengl/Extensions3DOpenGLES.o' failed

[1]: https://github.com/mesa3d/mesa/blob/79ee1b2ff0b85f4eeb4165d23a7943c28d3a3d93/include/EGL/eglplatform.h#L109-L125
[2]: https://bugreports.qt.io/browse/QTBUG-66233

[Peter: simplify logic]
Cc: Julien CORJON <corjon.j@ecagroup.com>
Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index e8d368fb01..5186671663 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -44,8 +44,15 @@ define QT5WEBKIT_PYTHON2_SYMLINK
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
+# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
+# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
+# the libxcb is not selected.
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)x$(BR2_PACKAGE_LIBXCB),yx)
+QT5WEBKIT_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
+endif
+
 define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBKIT_QMAKEFLAGS))
 endef
 
 define QT5WEBKIT_BUILD_CMDS
