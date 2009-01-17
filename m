From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sat, 17 Jan 2009 10:11:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: cairo libglib2
	libgtk2
Message-ID: <20090117101113.F050F7758B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-17 10:11:12 +0000 (Sat, 17 Jan 2009)
New Revision: 24895

Log:
Easier with one place for configure options for disabling gtk-doc


Modified:
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2009-01-17 02:13:15 UTC (rev 24894)
+++ trunk/buildroot/package/Makefile.autotools.in	2009-01-17 10:11:12 UTC (rev 24895)
@@ -248,6 +248,7 @@
 		--prefix=/usr \
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
+		$(DISABLE_DOCUMENTATION) \
 		$(QUIET) $($(PKG)_CONF_OPT)
 	$(Q)touch $@
 

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-01-17 02:13:15 UTC (rev 24894)
+++ trunk/buildroot/package/Makefile.in	2009-01-17 10:11:12 UTC (rev 24895)
@@ -345,6 +345,10 @@
 DISABLE_LARGEFILE= --disable-largefile
 endif
 
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+DISABLE_DOCUMENTATION=--without-html-dir --disable-gtk-doc
+endif
+
 ifneq ($(BR2_INET_IPV6),y)
 DISABLE_IPV6= --disable-ipv6
 endif

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-01-17 02:13:15 UTC (rev 24894)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-01-17 10:11:12 UTC (rev 24895)
@@ -46,7 +46,6 @@
 	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
 	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
-CAIRO_CONF_OPT += --disable-gtk-doc --without-html-dir
 
 CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig zlib libpng fontconfig $(CAIRO_DEPENDENCIES_EXTRA) pixman $(XSERVER) 
 

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-01-17 02:13:15 UTC (rev 24894)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-01-17 10:11:12 UTC (rev 24895)
@@ -48,8 +48,6 @@
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT = --enable-shared \
-	 	--disable-gtk-doc \
-		--with-html-dir=/dev/null \
 		--enable-static
 
 LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-17 02:13:15 UTC (rev 24894)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-17 10:11:12 UTC (rev 24895)
@@ -75,6 +75,7 @@
 		--disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug \
+		--without-html-dir \
 		$(DISABLE_LARGEFILE) \
 		$(LIBGTK2_CONF_OPT_X)  \
 		$(LIBGTK2_CONF_OPT_DFB)
