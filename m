From: correa at uclibc.org <correa@uclibc.org>
Date: Sat,  5 Jul 2008 08:14:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
Message-ID: <20080705151412.9A6323C650@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-07-05 08:14:11 -0700 (Sat, 05 Jul 2008)
New Revision: 22654

Log:
Fix #3584, when building cairo with DirectFB, depend on DirectFB

Modified:
   trunk/buildroot/package/cairo/Config.in
   trunk/buildroot/package/cairo/cairo.mk


Changeset:
Modified: trunk/buildroot/package/cairo/Config.in
===================================================================
--- trunk/buildroot/package/cairo/Config.in	2008-07-05 09:30:17 UTC (rev 22653)
+++ trunk/buildroot/package/cairo/Config.in	2008-07-05 15:14:11 UTC (rev 22654)
@@ -5,7 +5,7 @@
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_FONTCONFIG
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX||BR2_PACKAGE_DIRECTFB
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2008-07-05 09:30:17 UTC (rev 22653)
+++ trunk/buildroot/package/cairo/cairo.mk	2008-07-05 15:14:11 UTC (rev 22654)
@@ -43,8 +43,9 @@
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
+	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
 
-CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png fontconfig $(XSERVER) 
+CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png fontconfig $(CAIRO_DEPENDENCIES_EXTRA) $(XSERVER) 
 
 $(eval $(call AUTOTARGETS,package,cairo))
