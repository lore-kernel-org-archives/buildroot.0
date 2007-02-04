From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  4 Feb 2007 11:47:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: cairo dillo
	libgtk12 libgtk2 metacity p etc...
Message-ID: <20070204194743.5047748658@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-04 11:47:41 -0800 (Sun, 04 Feb 2007)
New Revision: 17769

Log:
- the $(XSERVER) target can be provided by different X server impls. Adjust users
- rdesktop needs an xserver impl


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/dillo/dillo.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/metacity/metacity.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/rdesktop/rdesktop.mk
   trunk/buildroot/package/rxvt/rxvt.mk
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/Makefile.in	2007-02-04 19:47:41 UTC (rev 17769)
@@ -111,3 +111,16 @@
 TARGET_CONFIGURE_OPTS+=CXX=""
 endif
 
+# X Windowing system
+
+XSERVER:=
+ifeq ($(strip $(BR2_PACKAGE_TINYX)),y)
+XSERVER+=tinyx
+endif
+ifeq ($(strip $(BR2_PACKAGE_XORG)),y)
+XSERVER+=xorg
+endif
+ifeq ($(strip $(BR2_PACKAGE_XGGI)),y)
+XSERVER+=xggi
+endif
+

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/cairo/cairo.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -134,7 +134,7 @@
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libcairo.so.2.*
 	touch -c $(TARGET_DIR)/lib/libcairo.so.2.9.3
 
-cairo: uclibc gettext libintl pkgconfig libglib2 xorg $(TARGET_DIR)/lib/libcairo.so.2.9.3
+cairo: uclibc gettext libintl pkgconfig libglib2 $(XSERVER) $(TARGET_DIR)/lib/libcairo.so.2.9.3
 
 cairo-clean:
 	rm -f $(TARGET_DIR)/lib/$(CAIRO_BINARY)

Modified: trunk/buildroot/package/dillo/dillo.mk
===================================================================
--- trunk/buildroot/package/dillo/dillo.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/dillo/dillo.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -38,7 +38,7 @@
 	$(MAKE) -C $(DILLO_DIR) DESTDIR=$(TARGET_DIR) install
 	touch $(DILLO_DIR)/.installed
 
-dillo:	uclibc xorg libglib12 libgtk12 jpeg libpng $(DILLO_DIR)/.installed
+dillo:	uclibc $(XSERVER) libglib12 libgtk12 jpeg libpng $(DILLO_DIR)/.installed
 
 dillo-source: $(DL_DIR)/$(DILLO_SOURCE)
 

Modified: trunk/buildroot/package/libgtk12/libgtk12.mk
===================================================================
--- trunk/buildroot/package/libgtk12/libgtk12.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/libgtk12/libgtk12.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -85,7 +85,7 @@
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgdk-1.2.so.0.9.1
 	touch -c $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
 
-libgtk12: uclibc libglib12 xorg $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
+libgtk12: uclibc libglib12 $(XSERVER) $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
 
 libgtk12-clean:
 	rm -f $(TARGET_DIR)/lib/libgtk* $(TARGET_DIR)/lib/libgdk*

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -150,7 +150,7 @@
 	cp package/libgtk2/gtk.immodules $(TARGET_DIR)/etc/gtk-2.0
 	touch -c $(TARGET_DIR)/lib/libgtk-x11-2.0.so.0
 
-libgtk2: uclibc png jpeg tiff xorg libglib2 \
+libgtk2: uclibc png jpeg tiff $(XSERVER) libglib2 \
 	cairo pango atk $(TARGET_DIR)/lib/libgtk-x11-2.0.so.0
 
 libgtk2-clean:

Modified: trunk/buildroot/package/metacity/metacity.mk
===================================================================
--- trunk/buildroot/package/metacity/metacity.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/metacity/metacity.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -138,7 +138,7 @@
 	(cd $(TARGET_DIR)/usr/share/themes; rm -rf Atlanta; ln -s Clearlooks Atlanta)
 	cp -a package/metacity/Xsession $(TARGET_DIR)/etc/X11/
 
-metacity: uclibc zlib xorg libgtk2 $(TARGET_DIR)/lib/*metacity*.so
+metacity: uclibc zlib $(XSERVER) libgtk2 $(TARGET_DIR)/lib/*metacity*.so
 
 metacity-clean:
 	-$(MAKE) -C $(METACITY_DIR) clean

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/pango/pango.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -154,7 +154,7 @@
 	cp package/pango/pangox.aliases $(TARGET_DIR)/etc/pango/
 	touch -c $(TARGET_DIR)/lib/libpango-1.0.so.0
 
-pango: uclibc gettext libintl pkgconfig libglib2 xorg cairo \
+pango: uclibc gettext libintl pkgconfig libglib2 $(XSERVER) cairo \
 	$(TARGET_DIR)/lib/libpango-1.0.so.0
 
 pango-clean:

Modified: trunk/buildroot/package/rdesktop/rdesktop.mk
===================================================================
--- trunk/buildroot/package/rdesktop/rdesktop.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/rdesktop/rdesktop.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -38,7 +38,7 @@
 	cp $(RDESKTOP_DIR)/rdesktop $(TARGET_DIR)/usr/bin
 	touch $(RDESKTOP_DIR)/.installed
 
-rdesktop: uclibc xorg openssl $(RDESKTOP_DIR)/.installed
+rdesktop: uclibc openssl $(XSERVER) $(RDESKTOP_DIR)/.installed
 
 rdesktop-source: $(DL_DIR)/$(RDESKTOP_SOURCE)
 

Modified: trunk/buildroot/package/rxvt/rxvt.mk
===================================================================
--- trunk/buildroot/package/rxvt/rxvt.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/rxvt/rxvt.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -63,12 +63,7 @@
 	cp -f $(RXVT_BINARY) $(TARGET_DIR)/usr/X11R6/bin
 	(cd $(TARGET_DIR)/usr/X11R6/bin; ln -fs rxvt xterm)
 
-ifeq ($(strip $(BR2_PACKAGE_TINYX)),y)
-rxvt: tinyx $(TARGET_DIR)/usr/X11R6/bin/rxvt
-endif
-ifeq ($(strip $(BR2_PACKAGE_XORG)),y)
-rxvt: xorg $(TARGET_DIR)/usr/X11R6/bin/rxvt
-endif
+rxvt: $(XSERVER) $(TARGET_DIR)/usr/X11R6/bin/rxvt
 
 rxvt-clean:
 	rm -f $(TARGET_DIR)/usr/X11R6/bin/rxvt

Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2007-02-04 19:20:45 UTC (rev 17768)
+++ trunk/buildroot/package/xorg/xorg.mk	2007-02-04 19:47:41 UTC (rev 17769)
@@ -44,9 +44,9 @@
 DEJAVU_DIR:=$(BUILD_DIR)/dejavu-ttf-$(DEJAVU_VERSION)
 
 # Install Xorg xserver
-XSERVER:=Xorg
-XORG_XSERVER:=$(XORG_DIR)/programs/Xserver/$(XSERVER)
-TARGET_XSERVER:=$(XORG_BINX)/$(XSERVER)
+XSERVER_BINARY:=Xorg
+XORG_XSERVER:=$(XORG_DIR)/programs/Xserver/$(XSERVER_BINARY)
+TARGET_XSERVER:=$(XORG_BINX)/$(XSERVER_BINARY)
 
 # figure out Xorg's idea of corresponding architecture name
 ifeq ($(BR2_alpha),y)
@@ -127,7 +127,7 @@
 		$(STRIP) $(XORG_PROGS)/$$file || /bin/true ; \
 	done
 	cp $(XORG_XSERVER) $(TARGET_XSERVER)
-	(cd $(XORG_BINX); ln -snf $(XSERVER) X)
+	(cd $(XORG_BINX); ln -snf $(XSERVER_BINARY) X)
 	$(STRIP) $(TARGET_XSERVER)
 	mkdir -p $(XORG_LIBX)/modules
 	cp -LRf $(XORG_DIR)/exports/lib/modules/ $(XORG_LIBX)/
