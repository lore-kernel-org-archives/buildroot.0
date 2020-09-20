From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Sep 2020 16:21:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/gqview: drop package
Message-ID: <20200920142143.1415754-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                              |  7 +++++
 package/Config.in                             |  1 -
 package/gqview/0001-make.patch                | 11 --------
 .../gqview/0002-fix-build-with-gcc-10.patch   | 27 -------------------
 package/gqview/Config.in                      |  7 -----
 package/gqview/gqview.hash                    |  3 ---
 package/gqview/gqview.mk                      | 14 ----------
 7 files changed, 7 insertions(+), 63 deletions(-)
 delete mode 100644 package/gqview/0001-make.patch
 delete mode 100644 package/gqview/0002-fix-build-with-gcc-10.patch
 delete mode 100644 package/gqview/Config.in
 delete mode 100644 package/gqview/gqview.hash
 delete mode 100644 package/gqview/gqview.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8d948d2bb7..ae583b912f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_GQVIEW
+	bool "gqview package was removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is not maintained anymore
+	  (no release since 2006).
+
 config BR2_PACKAGE_WESTON_IMX
 	bool "weston-imx package was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0282a2069f..c85a3c6bd3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -360,7 +360,6 @@ comment "X applications"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
 	source "package/gmpc/Config.in"
-	source "package/gqview/Config.in"
 	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
 	source "package/midori/Config.in"
diff --git a/package/gqview/0001-make.patch b/package/gqview/0001-make.patch
deleted file mode 100644
index 0b1626ffc5..0000000000
--- a/package/gqview/0001-make.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/src/Makefile.in	2006-12-02 20:41:25.000000000 -0500
-+++ b/src/Makefile.in	2008-02-13 14:00:25.000000000 -0500
-@@ -200,7 +200,7 @@ SUBDIRS = icons
- DIST_SUBDIRS = icons
- INCLUDES = -I$(srcdir) -I$(builddir)    \
- 	-I$(top_srcdir) -I$(top_builddir)       \
--	-I$(includedir) $(GTK_CFLAGS)
-+	$(GTK_CFLAGS)
- 
- module_SLIK = \
- 	intl.h		\
diff --git a/package/gqview/0002-fix-build-with-gcc-10.patch b/package/gqview/0002-fix-build-with-gcc-10.patch
deleted file mode 100644
index 55791c78b9..0000000000
--- a/package/gqview/0002-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-fix build with gcc 10
-
-Define bar_exif_key_count and bar_exif_key_list as extern to avoid the
-following build failure with gcc 10 (which defaults to -fno-common):
-
-/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: info.o:(.rodata+0x0): multiple definition of `bar_exif_key_count'; bar_exif.o:(.rodata+0x0): first defined here
-/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: info.o:(.bss+0x0): multiple definition of `bar_exif_key_list'; bar_exif.o:(.data+0x0): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/ab19e23cae603b2aa6e696e4937d106883e78b76
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Naur gqview-2.1.5.orig/src/bar_exif.h gqview-2.1.5/src/bar_exif.h
---- gqview-2.1.5.orig/src/bar_exif.h	2020-09-09 20:32:50.506755031 +0200
-+++ gqview-2.1.5/src/bar_exif.h	2020-09-09 20:33:30.370755818 +0200
-@@ -24,8 +24,8 @@
- 
- /* these are exposed for when duplication of the exif bar's text is needed */
- 
--const gchar **bar_exif_key_list;
--const gint bar_exif_key_count;
-+extern const gchar **bar_exif_key_list;
-+extern const gint bar_exif_key_count;
- 
- gchar *bar_exif_validate_text(gchar *text);
- 
diff --git a/package/gqview/Config.in b/package/gqview/Config.in
deleted file mode 100644
index a654dc41fb..0000000000
--- a/package/gqview/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_GQVIEW
-	bool "gqview"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  GQview is an image viewer for Unix operating systems
-
-	  http://gqview.sourceforge.net/
diff --git a/package/gqview/gqview.hash b/package/gqview/gqview.hash
deleted file mode 100644
index 3d1330d4ff..0000000000
--- a/package/gqview/gqview.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  12fea494e607a69eff31cdca13d306ef1b0b3b7850be0f8b236f267d8f2e9546  gqview-2.1.5.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
deleted file mode 100644
index 0837630843..0000000000
--- a/package/gqview/gqview.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# gqview
-#
-################################################################################
-
-GQVIEW_VERSION = 2.1.5
-GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
-GQVIEW_DEPENDENCIES = host-pkgconf libgtk2
-GQVIEW_CONF_ENV = LIBS="-lm"
-GQVIEW_LICENSE = GPL-2.0
-GQVIEW_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.28.0
