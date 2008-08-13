From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Wed, 13 Aug 2008 12:07:14 +0100
Subject: [Buildroot] [PATCH] Move pixman to package directory
Message-ID: <1218625634.12158.3.camel@lnx32dtp04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move pixman from x11r7 into package dir as it is not an x only library.

 Config.in                                 |    1 +
 pixman/Config.in                          |    8 ++++++++
 pixman/pixman.mk                          |   21 +++++++++++++++++++++
 x11r7/Config.in                           |    1 -
 x11r7/pixman/Config.in                    |    7 -------
 x11r7/pixman/pixman-0.10.0-no-tests.patch |   11 -----------
 x11r7/pixman/pixman.mk                    |   17 -----------------
 7 files changed, 30 insertions(+), 36 deletions(-)

Signed-off-by: daniel.j.laird <daniel.j.laird@nxp.com>

diff -urN buildroot.orig/package/Config.in buildroot/package/Config.in
--- buildroot.orig/package/Config.in	2008-08-13 10:44:43.000000000 +0100
+++ buildroot/package/Config.in	2008-08-13 12:00:06.000000000 +0100
@@ -374,6 +374,7 @@
 #XXX: maybe some of these should depend on !BR2_PACKAGE_XSERVER_none
 source "package/atk/Config.in"
 source "package/cairo/Config.in"
+source "package/pixman/Config.in"
 source "package/pango/Config.in"
 source "package/libdrm/Config.in"
 source "package/libglib12/Config.in"
diff -urN buildroot.orig/package/pixman/Config.in buildroot/package/pixman/Config.in
--- buildroot.orig/package/pixman/Config.in	1970-01-01 01:00:00.000000000 +0100
+++ buildroot/package/pixman/Config.in	2008-08-13 11:59:39.000000000 +0100
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PIXMAN
+	bool "pixman"
+	default n
+	depends on BR2_PACKAGE_CAIRO
+	help
+          pixman is a library that provides low-level pixel manipulation
+          features such as image compositing and trapezoid rasterization.
+
diff -urN buildroot.orig/package/pixman/pixman.mk buildroot/package/pixman/pixman.mk
--- buildroot.orig/package/pixman/pixman.mk	1970-01-01 01:00:00.000000000 +0100
+++ buildroot/package/pixman/pixman.mk	2008-08-13 12:04:55.000000000 +0100
@@ -0,0 +1,21 @@
+#############################################################
+#
+# pixman-0.10.0
+#
+#############################################################
+PIXMAN_VERSION = 0.10.0
+PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
+PIXMAN_SITE = http://www.cairographics.org/releases/
+PIXMAN_AUTORECONF = NO
+PIXMAN_INSTALL_STAGING = YES
+PIXMAN_INSTALL_TARGET = YES
+PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
+PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install install-data
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	PIXMAN_CONF_OPT_STATIC = --enable-static
+endif
+PIXMAN_CONF_OPT += $(PIXMAN_CONF_OPT_STATIC)
+PIXMAN_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,pixman))
diff -urN buildroot.orig/package/x11r7/Config.in buildroot/package/x11r7/Config.in
--- buildroot.orig/package/x11r7/Config.in	2008-08-13 10:44:45.000000000 +0100
+++ buildroot/package/x11r7/Config.in	2008-08-13 11:59:05.000000000 +0100
@@ -15,7 +15,6 @@
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
-		source package/x11r7/pixman/Config.in
 		source package/x11r7/pthread-stubs/Config.in
 		source package/x11r7/xlib_libFS/Config.in
 		source package/x11r7/xlib_libICE/Config.in
diff -urN buildroot.orig/package/x11r7/pixman/Config.in buildroot/package/x11r7/pixman/Config.in
--- buildroot.orig/package/x11r7/pixman/Config.in	2008-08-13 10:44:45.000000000 +0100
+++ buildroot/package/x11r7/pixman/Config.in	1970-01-01 01:00:00.000000000 +0100
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PIXMAN
-	bool "pixman"
-	help
-		Cairo pixel manager
-
-		http://cairographics.org/releases/
-
diff -urN buildroot.orig/package/x11r7/pixman/pixman-0.10.0-no-tests.patch buildroot/package/x11r7/pixman/pixman-0.10.0-no-tests.patch
--- buildroot.orig/package/x11r7/pixman/pixman-0.10.0-no-tests.patch	2008-08-13 10:44:45.000000000 +0100
+++ buildroot/package/x11r7/pixman/pixman-0.10.0-no-tests.patch	1970-01-01 01:00:00.000000000 +0100
@@ -1,11 +0,0 @@
---- a/Makefile.in.orig	2008-05-23 14:04:37.000000000 +0000
-+++ b/Makefile.in	2008-05-23 14:04:50.000000000 +0000
-@@ -198,7 +198,7 @@ sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = pixman test
-+SUBDIRS = pixman
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = pixman-1.pc
- USERNAME = $$USER
diff -urN buildroot.orig/package/x11r7/pixman/pixman.mk buildroot/package/x11r7/pixman/pixman.mk
--- buildroot.orig/package/x11r7/pixman/pixman.mk	2008-08-13 10:44:45.000000000 +0100
+++ buildroot/package/x11r7/pixman/pixman.mk	1970-01-01 01:00:00.000000000 +0100
@@ -1,17 +0,0 @@
-################################################################################
-#
-# pixman
-#
-################################################################################
-
-PIXMAN_VERSION = 0.10.0
-PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
-PIXMAN_SITE = http://cairographics.org/releases/
-PIXMAN_AUTORECONF = NO
-PIXMAN_INSTALL_STAGING = YES
-PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
-PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install install-data
-
-PIXMAN_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
-
-$(eval $(call AUTOTARGETS,package/x11r7,pixman))
