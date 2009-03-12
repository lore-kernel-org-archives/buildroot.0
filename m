From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Mar 2009 10:21:22 +0000 (UTC)
Subject: [Buildroot] svn commit: [25626] trunk/buildroot/package: cairo
	libgtk2
Message-ID: <20090312102122.26FD876268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-12 10:21:21 +0000 (Thu, 12 Mar 2009)
New Revision: 25626

Log:
cairo: more fine grained configutation and fix dependencies

Modified:
   trunk/buildroot/package/cairo/Config.in
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/libgtk2/Config.in


Changeset:
Modified: trunk/buildroot/package/cairo/Config.in
===================================================================
--- trunk/buildroot/package/cairo/Config.in	2009-03-12 07:56:49 UTC (rev 25625)
+++ trunk/buildroot/package/cairo/Config.in	2009-03-12 10:21:21 UTC (rev 25626)
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_CAIRO
 	bool "cairo"
 	select BR2_PACKAGE_PKGCONFIG
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX||BR2_PACKAGE_DIRECTFB
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
@@ -14,3 +11,24 @@
 	  OpenGL (through glitz), Quartz, and XCB.
 
 	  http://cairographics.org/
+
+if BR2_PACKAGE_CAIRO
+
+config BR2_PACKAGE_CAIRO_PS
+	bool "postscript support"
+	select BR2_PACKAGE_ZLIB
+
+config BR2_PACKAGE_CAIRO_PDF
+	bool "pdf support"
+	select BR2_PACKAGE_ZLIB
+
+config BR2_PACKAGE_CAIRO_PNG
+	bool "png support"
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+
+config BR2_PACKAGE_CAIRO_SVG
+	bool "svg support"
+	select BR2_PACKAGE_CAIRO_PNG
+
+endif

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-03-12 07:56:49 UTC (rev 25625)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-03-12 10:21:21 UTC (rev 25626)
@@ -42,11 +42,47 @@
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal
 
 
+CAIRO_DEPENDENCIES = uclibc pkgconfig fontconfig pixman
+
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
-	CAIRO_DEPENDENCIES_EXTRA = directfb
+	CAIRO_CONF_OPT += --enable-directfb
+	CAIRO_DEPENDENCIES += directfb
+else
+	CAIRO_CONF_OPT += --disable-directfb
 endif
 
-CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig zlib libpng fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
+ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+	CAIRO_CONF_OPT += --enable-xlib --with-x
+	CAIRO_DEPENDENCIES += $(XSERVER)
+else
+	CAIRO_CONF_OPT += --disable-xlib --without-x
+endif
 
+ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
+	CAIRO_CONF_OPT += --enable-ps
+	CAIRO_DEPENDENCIES += zlib
+else
+	CAIRO_CONF_OPT += --disable-ps
+endif
+
+ifeq ($(BR2_PACKAGE_CAIRO_PDF),y)
+	CAIRO_CONF_OPT += --enable-pdf
+	CAIRO_DEPENDENCIES += zlib
+else
+	CAIRO_CONF_OPT += --disable-pdf
+endif
+
+ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
+	CAIRO_CONF_OPT += --enable-png
+	CAIRO_DEPENDENCIES += libpng
+else
+	CAIRO_CONF_OPT += --disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
+	CAIRO_CONF_OPT += --enable-svg
+else
+	CAIRO_CONF_OPT += --disable-svg
+endif
+
 $(eval $(call AUTOTARGETS,package,cairo))

Modified: trunk/buildroot/package/libgtk2/Config.in
===================================================================
--- trunk/buildroot/package/libgtk2/Config.in	2009-03-12 07:56:49 UTC (rev 25625)
+++ trunk/buildroot/package/libgtk2/Config.in	2009-03-12 10:21:21 UTC (rev 25626)
@@ -2,6 +2,8 @@
 	bool "libgtk2"
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PS
+	select BR2_PACKAGE_CAIRO_PDF
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_PKGCONFIG
