From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:15:56 +0200
Subject: [Buildroot] [git commit] libgail: remove deprecated package
Message-ID: <20160908201712.581C380DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fd27816cb359696724dedc20141be50b10fea0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's unused and has been deprecated for some time now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                 |  1 -
 package/libgail/0001-Relax-X11-dependencies.patch | 42 -----------------------
 package/libgail/Config.in                         | 31 -----------------
 package/libgail/libgail.hash                      |  2 --
 package/libgail/libgail.mk                        | 22 ------------
 5 files changed, 98 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index aa2fc4b..332f05d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -959,7 +959,6 @@ menu "Graphics"
 	source "package/libfm-extra/Config.in"
 	source "package/libfreeglut/Config.in"
 	source "package/libfreeimage/Config.in"
-	source "package/libgail/Config.in"
 	source "package/libgdiplus/Config.in"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
diff --git a/package/libgail/0001-Relax-X11-dependencies.patch b/package/libgail/0001-Relax-X11-dependencies.patch
deleted file mode 100644
index 97e5656..0000000
--- a/package/libgail/0001-Relax-X11-dependencies.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cca72c48b5643fa62e1d55b7b181e147f5ba7fe9 Mon Sep 17 00:00:00 2001
-From: Lionel Landwerlin <llandwerlin@gmail.com>
-Date: Sun, 28 Mar 2010 21:47:38 +0200
-Subject: [PATCH] Relax X11 dependency
-
-Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
----
- configure.in      |    4 +++-
- gail/gailwindow.c |    2 +-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 3801655..abaf417 100644
---- a/configure.in
-+++ b/configure.in
-@@ -86,7 +86,9 @@ GTK_REQUIRED_VERSION=2.9.4
- PKG_CHECK_MODULES(DEP, $ATK_PACKAGES >= $ATK_REQUIRED_VERSION \
- 	$GTK_PACKAGES >= $GTK_REQUIRED_VERSION)
- 
--if test "$gail_native_win32" != "yes"; then
-+AC_ARG_ENABLE(x, [      --disable-x     disable x11 backend ],x11_backend=no,x11_backend=yes)
-+
-+if test "$gail_native_win32" != "yes" -a "$x11_backend" != "no"; then
- 
- PKG_CHECK_MODULES(X, x11, :, [
- # pkg-config modules not found (only present since X11R7 aka Xorg); use
-diff --git a/gail/gailwindow.c b/gail/gailwindow.c
-index 616b25e..add454b 100644
---- a/gail/gailwindow.c
-+++ b/gail/gailwindow.c
-@@ -1071,7 +1071,7 @@ gail_window_get_mdi_zorder (AtkComponent *component)
-   return get_window_zorder (widget->window);
- }
- 
--#elif defined (GDK_WINDOWING_WIN32)
-+#elif defined (GDK_WINDOWING_WIN32) || defined (GDK_WINDOWING_DIRECTFB)
- 
- static gint
- gail_window_get_mdi_zorder (AtkComponent *component)
--- 
-1.7.0.2
-
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
deleted file mode 100644
index 821a922..0000000
--- a/package/libgail/Config.in
+++ /dev/null
@@ -1,31 +0,0 @@
-config BR2_PACKAGE_LIBGAIL
-	bool "libgail"
-	depends on BR2_USE_WCHAR # pango -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
-	depends on BR2_USE_MMU # pango -> libglib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_DEPRECATED_SINCE_2015_08
-	select BR2_PACKAGE_PANGO
-	help
-	  GAIL provides accessibility support for gtk+ and
-	  libgnomecanvas by implementing AtkObjects for widgets in
-	  gtk+ and libgnomecanvas.
-
-	  The GAIL library is a GTK+ module. For example, if the
-	  module is loaded in a program which calls
-	  gtk_widget_get_accessible() for a GtkEntry an instance of
-	  GailEntry is returned. This module is normally used with the
-	  atk-bridge GTK+ module from at-spi to allow an assistive
-	  technology, e.g a screenreader, to query or drive the
-	  program.
-
-	  http://developer.gnome.org/projects/gap
-
-comment "libgail needs a toolchain w/ C++, wchar, threads"
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_DEPRECATED_SINCE_2015_08
diff --git a/package/libgail/libgail.hash b/package/libgail/libgail.hash
deleted file mode 100644
index 5cfd752..0000000
--- a/package/libgail/libgail.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gail/1.22/gail-1.22.3.sha256sum
-sha256	03f03029277eb4f0e2c15a825fe716245d8647ede0435645475110289b059ae8	gail-1.22.3.tar.bz2
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
deleted file mode 100644
index 4c5c868..0000000
--- a/package/libgail/libgail.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# libgail
-#
-################################################################################
-
-LIBGAIL_VERSION_MAJOR = 1.22
-LIBGAIL_VERSION = $(LIBGAIL_VERSION_MAJOR).3
-LIBGAIL_SOURCE = gail-$(LIBGAIL_VERSION).tar.bz2
-LIBGAIL_SITE = http://ftp.gnome.org/pub/gnome/sources/gail/$(LIBGAIL_VERSION_MAJOR)
-LIBGAIL_AUTORECONF = YES
-LIBGAIL_INSTALL_STAGING = YES
-LIBGAIL_LICENSE = LGPLv2+
-LIBGAIL_LICENSE_FILES = COPYING
-
-ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-LIBGAIL_CONF_OPTS += --disable-x
-endif
-
-LIBGAIL_DEPENDENCIES = host-pkgconf libgtk2 pango
-
-$(eval $(autotools-package))
