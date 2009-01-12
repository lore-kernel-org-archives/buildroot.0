From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Mon, 12 Jan 2009 15:22:42 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
Message-ID: <20090112152242.565A7766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-12 15:22:41 +0000 (Mon, 12 Jan 2009)
New Revision: 24801

Log:
Fix dependencies.


Modified:
   trunk/buildroot/package/cairo/Config.in
   trunk/buildroot/package/cairo/cairo.mk


Changeset:
Modified: trunk/buildroot/package/cairo/Config.in
===================================================================
--- trunk/buildroot/package/cairo/Config.in	2009-01-12 15:10:04 UTC (rev 24800)
+++ trunk/buildroot/package/cairo/Config.in	2009-01-12 15:22:41 UTC (rev 24801)
@@ -3,6 +3,7 @@
 	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX||BR2_PACKAGE_DIRECTFB
 	help

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-01-12 15:10:04 UTC (rev 24800)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-01-12 15:22:41 UTC (rev 24801)
@@ -41,15 +41,13 @@
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal
 
-CAIRO_CONF_OPT = --disable-gtk-doc --with-html-dir=/dev/null
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb \
-		--disable-gtk-doc --with-html-dir=/dev/null
+	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
 	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
+CAIRO_CONF_OPT += --disable-gtk-doc --with-html-dir=/dev/null
 
+CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig zlib libpng fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
 
-CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib libpng fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
-
 $(eval $(call AUTOTARGETS,package,cairo))
