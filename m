From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 24 Dec 2009 01:35:14 +0100
Subject: [Buildroot] [PATCH 3/5] efl: added libecore package
In-Reply-To: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
References: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1261614916-8219-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/efl/Config.in            |    1 +
 package/efl/libecore/Config.in   |   81 +++++++++++++++++++++++++
 package/efl/libecore/libecore.mk |  124 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libecore/Config.in
 create mode 100644 package/efl/libecore/libecore.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 8c7514b..c542c00 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -8,6 +8,7 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
+source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"
 
diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
new file mode 100644
index 0000000..ba01cbf
--- /dev/null
+++ b/package/efl/libecore/Config.in
@@ -0,0 +1,81 @@
+config BR2_PACKAGE_LIBECORE
+	bool "libecore"
+	select BR2_PACKAGE_LIBEINA
+	help
+          Ecore is the event/X abstraction layer that makes doing
+          selections, Xdnd, general X stuff, event loops, timeouts and
+          idle handlers fast, optimized, and convenient.
+
+if BR2_PACKAGE_LIBECORE
+
+config BR2_PACKAGE_LIBECORE_DIRECTFB
+	bool "libecore directfb support"
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_LIBECORE_FB
+	bool "libecore framebuffer support"
+
+config BR2_PACKAGE_LIBECORE_SDL
+	bool "libecore sdl support"
+        depends on BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_LIBECORE_X
+	bool "libecore x support"
+        depends on BR2_PACKAGE_X11R7
+
+config BR2_PACKAGE_LIBECORE_EVAS
+	bool "libecore evas support"
+        select BR2_PACKAGE_EVAS
+
+if BR2_PACKAGE_LIBECORE_EVAS
+
+config BR2_PACKAGE_LIBECORE_EVAS_BUFFER
+	bool "libecore evas software buffer support"
+        select BR2_PACKAGE_LIBEVAS
+
+config BR2_PACKAGE_LIBECORE_EVAS_X11
+	bool "libecore evas x11 support"
+        depends on BR2_PACKAGE_X11R7
+
+config BR2_PACKAGE_LIBECORE_EVAS_X11_16
+	bool "libecore evas x11 16bits support"
+        depends on BR2_PACKAGE_X11R7
+
+config BR2_PACKAGE_LIBECORE_EVAS_XRENDER_X11
+	bool "libecore evas xrender x11 support"
+        depends on BR2_PACKAGE_X11R7
+        select BR2_PACKAGE_XLIB_LIBXRENDER
+
+config BR2_PACKAGE_LIBECORE_EVAS_XCB
+	bool "libecore evas xcb support"
+        depends on BR2_PACKAGE_X11R7
+        select BR2_PACKAGE_XCB_PROTO
+
+config BR2_PACKAGE_LIBECORE_EVAS_XRENDER_XCB
+	bool "libecore evas xrender xcb support"
+        depends on BR2_PACKAGE_X11R7
+        select BR2_PACKAGE_XCB_PROTO
+        select BR2_PACKAGE_XLIB_LIBXRENDER
+
+config BR2_PACKAGE_LIBECORE_EVAS_OPENGL_X11
+	bool "libecore evas opengl x11 support"
+        depends on BR2_PACKAGE_X11R7
+
+config BR2_PACKAGE_LIBECORE_EVAS_OPENGL_GLEW
+	bool "libecore evas opengl glew support"
+
+config BR2_PACKAGE_LIBECORE_EVAS_SDL
+	bool "libecore evas sdl support"
+        select BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_LIBECORE_EVAS_DIRECTFB
+	bool "libecore evas directfb support"
+        select BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_LIBECORE_EVAS_FB
+	bool "libecore evas frame buffer support"
+        select BR2_PACKAGE_LIBEVAS
+
+endif # BR2_PACKAGE_LIBECORE_EVAS
+
+endif # BR2_PACKAGE_LIBECORE
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
new file mode 100644
index 0000000..d040d15
--- /dev/null
+++ b/package/efl/libecore/libecore.mk
@@ -0,0 +1,124 @@
+#############################################################
+#
+# libecore
+#
+#############################################################
+
+LIBECORE_VERSION = 0.9.9.063
+LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
+LIBECORE_SITE = $(EFL_SNAPSHOT_URL)
+LIBECORE_INSTALL_STAGING = YES
+LIBECORE_INSTALL_TARGET = YES
+
+LIBECORE_DEPENDENCIES = host-pkg-config libeina
+
+# default options
+LIBECORE_CONF_OPT = --disable-simple-x11
+
+# libecore
+ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
+LIBECORE_CONF_OPT += --enable-ecore-directfb
+else
+LIBECORE_CONF_OPT += --disable-ecore-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
+LIBECORE_CONF_OPT += --enable-ecore-fb
+else
+LIBECORE_CONF_OPT += --disable-ecore-fb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_SDL),y)
+LIBECORE_CONF_OPT += --enable-ecore-sdl
+else
+LIBECORE_CONF_OPT += --disable-ecore-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
+LIBECORE_CONF_OPT += --enable-ecore-x
+else
+LIBECORE_CONF_OPT += --disable-ecore-x
+endif
+
+# libecore-evas
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_BUFFER),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-software-buffer
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-software-buffer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_X11),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-software-x11
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-software-x11
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_X11_16),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-software-16-x11
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-software-16-x11
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_XRENDER_X11),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-xrender-x11
+LIBECORE_DEPENDENCIES += xlib_libXrender
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-xrender-x11
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_XCB),y)
+#LIBECORE_CONF_OPT += --enable-ecore-evas-software-xcb
+LIBECORE_CONF_OPT += --enable-ecore-x-xcb
+LIBECORE_DEPENDENCIES += xcb-proto
+else
+#LIBECORE_CONF_OPT += --disable-ecore-evas-software-xcb
+LIBECORE_CONF_OPT += --disable-ecore-x-xcb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_XRENDER_XCB),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-xrender-xcb
+LIBECORE_DEPENDENCIES += xcb-proto xlib_libXrender
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-xrender-xcb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_OPENGL_X11),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-opengl-x11
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-opengl-x11
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_OPENGL_GLEW),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-opengl-glew
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-opengl-glew
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_SDL),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-software-sdl
+LIBECORE_DEPENDENCIES += sdl
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-software-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_DIRECTFB),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-directfb
+LIBECORE_DEPENDENCIES += directfb
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_EVAS_FB),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-fb
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-fb
+endif
+
+$(eval $(call AUTOTARGETS,package,libecore))
-- 
1.6.5.7
