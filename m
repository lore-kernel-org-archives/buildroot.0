From: Will Newton <will.newton@gmail.com>
Date: Mon, 23 Jan 2012 16:35:38 +0000
Subject: [Buildroot] [PATCH 07/14] libecore: Add new package
Message-ID: <CAFbHwiT=bhg_jZAWkXgxdM9JkOrT3FoWksvxyO57MTbaTov4dQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/efl/Config.in            |    1 +
 package/efl/libecore/Config.in   |   36 ++++++++++++++++++++++
 package/efl/libecore/libecore.mk |   61 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libecore/Config.in
 create mode 100644 package/efl/libecore/libecore.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 27d1f95..3007783 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL

 source "package/efl/libeina/Config.in"
+source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"

diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
new file mode 100644
index 0000000..35c9966
--- /dev/null
+++ b/package/efl/libecore/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_LIBECORE
+	bool "libecore"
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Ecore is the event/X abstraction layer that makes doing
+	  selections, Xdnd, general X stuff, event loops, timeouts and
+	  idle handlers fast, optimized, and convenient.
+
+if BR2_PACKAGE_LIBECORE
+
+config BR2_PACKAGE_LIBECORE_DIRECTFB
+	bool "libecore DirectFB support"
+	select BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_LIBECORE_FB
+	bool "libecore framebuffer support"
+
+config BR2_PACKAGE_LIBECORE_SDL
+	bool "libecore SDL support"
+	select BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_LIBECORE_X
+	bool "libecore X support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+config BR2_PACKAGE_LIBECORE_X_XCB
+	bool "libecore XCB support"
+	depends on BR2_PACKAGE_LIBECORE_X
+	select BR2_PACKAGE_XCB_PROTO
+
+config BR2_PACKAGE_LIBECORE_EVAS
+	bool "libecore Evas support"
+	select BR2_PACKAGE_LIBEVAS
+
+endif # BR2_PACKAGE_LIBECORE
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
new file mode 100644
index 0000000..3082fcf
--- /dev/null
+++ b/package/efl/libecore/libecore.mk
@@ -0,0 +1,61 @@
+#############################################################
+#
+# libecore
+#
+#############################################################
+
+LIBECORE_VERSION = 1.1.0
+LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
+LIBECORE_SITE = http://download.enlightenment.org/releases/
+LIBECORE_INSTALL_STAGING = YES
+
+LIBECORE_DEPENDENCIES = host-pkg-config libeina
+
+HOST_LIBECORE_DEPENDENCIES = host-pkg-config host-libeina
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
+LIBECORE_DEPENDENCIES += xlib_libXext
+else
+LIBECORE_CONF_OPT += --disable-ecore-x
+endif
+
+ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
+LIBECORE_CONF_OPT += --enable-ecore-x-xcb
+LIBECORE_DEPENDENCIES += xcb-proto
+else
+LIBECORE_CONF_OPT += --disable-ecore-x-xcb
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
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.1
-------------- next part --------------
