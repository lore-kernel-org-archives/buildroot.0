From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 26 Dec 2008 15:36:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20081226153612.EF01F76F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-26 15:36:12 +0000 (Fri, 26 Dec 2008)
New Revision: 24553

Log:
libgtk: don't list cups/png/jpeg/tiff as hard dependencies

GTK can be compiled without the above, so don't list them as hard
dependencies, and simply adjust the build depending on what the user
has enabled.

Modified:
   trunk/buildroot/package/libgtk2/Config.in
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/Config.in
===================================================================
--- trunk/buildroot/package/libgtk2/Config.in	2008-12-26 15:36:09 UTC (rev 24552)
+++ trunk/buildroot/package/libgtk2/Config.in	2008-12-26 15:36:12 UTC (rev 24553)
@@ -2,13 +2,9 @@
 	bool "libgtk2"
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CUPS if BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
-	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_PKGCONFIG
-	select BR2_PACKAGE_TIFF
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX||BR2_PACKAGE_DIRECTFB
 	help
 	  The GTK+ version 2 graphical user interface library

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-12-26 15:36:09 UTC (rev 24552)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-12-26 15:36:12 UTC (rev 24553)
@@ -79,10 +79,11 @@
 		$(LIBGTK2_CONF_OPT_X)  \
 		$(LIBGTK2_CONF_OPT_DFB)
 
+LIBGTK2_DEPENDENCIES = pkgconfig libglib2 cairo pango atk
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	LIBGTK2_CONF_OPT += --with-gdktarget=directfb
-	LIBGTK2_DEPENDENCIES_EXTRA = directfb
+	LIBGTK2_DEPENDENCIES += directfb
 endif
 
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
@@ -91,11 +92,34 @@
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--with-gdktarget=x11
-	LIBGTK2_DEPENDENCIES_EXTRA = xlib_libXcomposite $(XSERVER) cups
+	LIBGTK2_DEPENDENCIES += xlib_libXcomposite $(XSERVER)
 else
 	LIBGTK2_CONF_OPT += --without-x
 endif
 
-LIBGTK2_DEPENDENCIES = uclibc pkgconfig libpng jpeg tiff $(LIBGTK2_DEPENDENCIES_EXTRA) libglib2 cairo pango atk
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBGTK2_DEPENDENCIES += libpng
+else
+LIBGTK2_CONF_OPT += --without-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBGTK2_DEPENDENCIES += jpeg
+else
+LIBGTK2_CONF_OPT += --without-libjpeg
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LIBGTK2_DEPENDENCIES += tiff
+else
+LIBGTK2_CONF_OPT += --without-libtiff
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBGTK2_DEPENDENCIES += cups
+else
+LIBGTK2_CONF_OPT += --disable-cups
+endif
+
 $(eval $(call AUTOTARGETS,package,libgtk2))
