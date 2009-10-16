From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Fri, 16 Oct 2009 13:54:43 +0200
Subject: [Buildroot] EFL in buildroot
In-Reply-To: <1255693819.28018.17.camel@coalu.atr>
References: <1255693819.28018.17.camel@coalu.atr>
Message-ID: <1255694083.28018.22.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[PATCH 4/6] Added libecore package

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
---
 package/efl/Config.in                           |    1 +
 package/efl/libecore/Config.in                  |   65 +++++++++++++++
 package/efl/libecore/libecore-fix_ecore_x.patch |   27 ++++++
 package/efl/libecore/libecore.mk                |   98 +++++++++++++++++++++++
 4 files changed, 191 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libecore/Config.in
 create mode 100644 package/efl/libecore/libecore-fix_ecore_x.patch
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
index 0000000..e45f31d
--- /dev/null
+++ b/package/efl/libecore/Config.in
@@ -0,0 +1,65 @@
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
+config BR2_PACAKGE_LIBECORE_EVAS_BUFFER
+	bool "libecore evas software buffer support"
+        select BR2_PACKAGE_LIBEVAS
+
+config BR2_PACAKGE_LIBECORE_EVAS_X11
+	bool "libecore evas x11 support"
+        select BR2_PACKAGE_LIBEVAS
+        depends on BR2_PACKAGE_X11R7
+
+config BR2_PACAKGE_LIBECORE_EVAS_X11_16
+	bool "libecore evas x11 16bits support"
+        select BR2_PACKAGE_LIBEVAS
+        depends on BR2_PACKAGE_X11R7
+
+config BR2_PACAKGE_LIBECORE_EVAS_XRENDER_X11
+	bool "libecore evas xrender x11 support"
+        depends on BR2_PACKAGE_X11R7
+        select BR2_PACKAGE_XLIB_LIBXRENDER
+        select BR2_PACKAGE_LIBEVAS
+
+config BR2_PACAKGE_LIBECORE_EVAS_XCB
+	bool "libecore evas xcb support"
+        depends on BR2_PACKAGE_X11R7
+        select BR2_PACKAGE_XCB_PROTO
+
+config BR2_PACAKGE_LIBECORE_EVAS_XRENDER_XCB
+	bool "libecore evas xrender xcb support"
+        depends on BR2_PACKAGE_X11R7
+        select BR2_PACKAGE_XCB_PROTO
+        select BR2_PACKAGE_XLIB_LIBXRENDER
+
+config BR2_PACAKGE_LIBECORE_EVAS_OPENGL_X11
+	bool "libecore evas opengl x11 support"
+        depends on BR2_PACKAGE_X11R7
+        select BR2_PACKAGE_LIBEVAS
+
+config BR2_PACAKGE_LIBECORE_EVAS_OPENGL_GLEW
+	bool "libecore evas opengl glew support"
+        select BR2_PACKAGE_LIBEVAS
+
+config BR2_PACAKGE_LIBECORE_EVAS_SDL
+	bool "libecore evas sdl support"
+        select BR2_PACKAGE_LIBEVAS
+        select BR2_PACKAGE_SDL
+
+config BR2_PACAKGE_LIBECORE_EVAS_DIRECTFB
+	bool "libecore evas directfb support"
+        select BR2_PACKAGE_LIBEVAS
+        select BR2_PACKAGE_DIRECTFB
+
+config BR2_PACAKGE_LIBECORE_EVAS_FB
+	bool "libecore evas frame buffer support"
+        select BR2_PACKAGE_LIBEVAS
+
+endif # BR2_PACKAGE_LIBECORE
diff --git a/package/efl/libecore/libecore-fix_ecore_x.patch b/package/efl/libecore/libecore-fix_ecore_x.patch
new file mode 100644
index 0000000..ca8b9da
--- /dev/null
+++ b/package/efl/libecore/libecore-fix_ecore_x.patch
@@ -0,0 +1,27 @@
+From 96ba4bdbbd1b4794996695b5964e8317dcb4739d Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
+Date: Fri, 16 Oct 2009 13:21:51 +0200
+Subject: [PATCH] Fix ECore compilation without X backend
+
+Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
+---
+ src/lib/ecore_x/Makefile.am |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/src/lib/ecore_x/Makefile.am b/src/lib/ecore_x/Makefile.am
+index 95e0684..7da08f1 100644
+--- a/src/lib/ecore_x/Makefile.am
++++ b/src/lib/ecore_x/Makefile.am
+@@ -6,7 +6,8 @@ SUBDIRS = xlib xcb
+ 
+ if BUILD_ECORE_X_XCB
+ DEP = xcb/libecore_x_xcb.la
+-else
++endif
++if BUILD_ECORE_X_XLIB
+ DEP = xlib/libecore_x_xlib.la
+ endif
+ 
+-- 
+1.6.4.3
+
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
new file mode 100644
index 0000000..c90ffed
--- /dev/null
+++ b/package/efl/libecore/libecore.mk
@@ -0,0 +1,98 @@
+#############################################################
+#
+# libecore
+#
+#############################################################
+
+LIBECORE_VERSION = 0.9.9.062
+LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
+LIBECORE_SITE = http://download.enlightenment.org/snapshots/2009-07-29/
+LIBECORE_AUTORECONF = YES
+LIBECORE_LIBTOOL_PATCH = YES
+LIBECORE_INSTALL_STAGING = YES
+LIBECORE_INSTALL_TARGET = YES
+
+LIBECORE_DEPENDENCIES = host-pkgconfig uclibc libeina
+
+LIBECORE_CONF_OPT = --disable-simple-x11
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_BUFFER),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-software-buffer
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-software-buffer
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_X11),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-software-x11
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-software-x11
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_X11_16),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-software-16-x11
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-software-16-x11
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_XRENDER_X11),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-xrender-x11
+LIBECORE_DEPENDENCIES += libevas xlib_libXrender
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-xrender-x11
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_XCB),y)
+#LIBECORE_CONF_OPT += --enable-ecore-evas-software-xcb
+LIBECORE_CONF_OPT += --enable-ecore-x-xcb
+LIBECORE_DEPENDENCIES += libevas xcb-proto
+else
+#LIBECORE_CONF_OPT += --disable-ecore-evas-software-xcb
+LIBECORE_CONF_OPT += --disable-ecore-x-xcb
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_XRENDER_XCB),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-xrender-xcb
+LIBECORE_DEPENDENCIES += libevas xcb-proto xlib_libXrender
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-xrender-xcb
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_OPENGL_X11),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-opengl-x11
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-opengl-x11
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_OPENGL_GLEW),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-opengl-glew
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-opengl-glew
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_SDL),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-software-sdl
+LIBECORE_DEPENDENCIES += libevas sdl
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-software-sdl
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_DIRECTFB),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-directfb
+LIBECORE_DEPENDENCIES += libevas directfb
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-directfb
+endif
+
+ifeq ($(BR2_PACAKGE_LIBECORE_EVAS_FB),y)
+LIBECORE_CONF_OPT += --enable-ecore-evas-fb
+LIBECORE_DEPENDENCIES += libevas
+else
+LIBECORE_CONF_OPT += --disable-ecore-evas-fb
+endif
+
+$(eval $(call AUTOTARGETS,package,libecore))
-- 
1.6.4.3
