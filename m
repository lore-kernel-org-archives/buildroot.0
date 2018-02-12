From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 11 Feb 2018 23:25:22 -0500
Subject: [Buildroot] [PATCH v1 1/3] qt5webkit: fix build issue with mesa3d
 w/out xcb
In-Reply-To: <20180212042524.28675-1-gael.portay@savoirfairelinux.com>
References: <20180212042524.28675-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180212042524.28675-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Cc: Julien CORJON <corjon.j@ecagroup.com>
Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 3b218a5385..5005f750a6 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -44,8 +44,17 @@ define QT5WEBKIT_PYTHON2_SYMLINK
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
+# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
+# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
+# the libxcb is not selected.
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifneq ($(BR2_PACKAGE_LIBXCB),y)
+QT5WEBKIT_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
+endif
+endif
+
 define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBKIT_QMAKEFLAGS))
 endef
 
 define QT5WEBKIT_BUILD_CMDS
-- 
2.15.1
