From: correa at uclibc.org <correa@uclibc.org>
Date: Tue,  7 Oct 2008 13:29:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20081007202927.B2E04F802A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-07 13:29:27 -0700 (Tue, 07 Oct 2008)
New Revision: 23621

Log:
widen options to configure directfb, patch by Micha Nelissen <micha@neli.hopto.org>

Modified:
   trunk/buildroot/package/directfb/Config.in
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/Config.in
===================================================================
--- trunk/buildroot/package/directfb/Config.in	2008-10-07 17:08:27 UTC (rev 23620)
+++ trunk/buildroot/package/directfb/Config.in	2008-10-07 20:29:27 UTC (rev 23621)
@@ -1,15 +1,10 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
+	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBSYSFS
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_TSLIB
 	help
 	  http://www.directfb.org/
 
-
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
 	depends on BR2_PACKAGE_DIRECTFB
@@ -17,3 +12,72 @@
 	help
 	  Enable use of multiple concurrent DirectFB applications
 	  http://www.directfb.org/
+
+config BR2_PACKAGE_DIRECTFB_XSERVER
+        bool "build with X server backend"
+        default n
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_UNIQUE
+        bool "enable unique window manager"
+        default n
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_ATI128
+        bool "compile ati128 graphics driver"
+        default n
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_CLE266
+        bool "compile cle266 graphics driver"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_MATROX
+        bool "compile matrox graphics driver"
+        default n
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_UNICHROME
+        bool "compile unichrome graphics driver"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_KEYBOARD
+        bool "compile keyboard input driver"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_PS2MOUSE
+        bool "compile PS2 mouse input driver"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
+        bool "compile serial mouse input driver"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_PNG
+        bool "enable PNG support"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+
+config BR2_PACKAGE_DIRECTFB_TSLIB
+        bool "enable touchscreen support"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+	select BR2_PACKAGE_TSLIB
+
+config BR2_PACKAGE_DIRECTFB_GIF
+        bool "enable GIF support"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_JPEG
+        bool "enable JPEG support"
+        default y
+        depends on BR2_PACKAGE_DIRECTFB
+	select BR2_PACKAGE_JPEG

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2008-10-07 17:08:27 UTC (rev 23620)
+++ trunk/buildroot/package/directfb/directfb.mk	2008-10-07 20:29:27 UTC (rev 23621)
@@ -5,25 +5,103 @@
 #############################################################
 #DIRECTFB_VERSION:=0.9.25.1
 #DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
-DIRECTFB_VERSION:=1.0.1
+DIRECTFB_MAJOR:=1.2
+DIRECTFB_VERSION:=1.2.6
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_CAT:=$(ZCAT)
 DIRECTFB_DIR:=$(BUILD_DIR)/DirectFB-$(DIRECTFB_VERSION)
+DIRECTFB_STAGING:=directfb-$(DIRECTFB_MAJOR)-0
+DIRECTFB_BIN:=usr/lib/libdirectfb-$(DIRECTFB_MAJOR).so.0
+DIRECTFB_DEP:=zlib
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
-DIRECTFB_MULTI:=--enable-multi
+DIRECTFB_MULTI:=--enable-multi --enable-fusion
 DIRECTFB_FUSION:=linux-fusion
 else
 DIRECTFB_MULTI:=
 DIRECTFB_FUSION:=
 endif
-ifeq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XSERVER),y)
+DIRECTFB_X:=--enable-x11
+else
 DIRECTFB_X:=--disable-x11
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
+DIRECTFB_UNIQUE:=--enable-unique
 else
-DIRECTFB_X:=--enable-x11
+DIRECTFB_UNIQUE:=--disable-unique
 endif
 
+DIRECTFB_GFX:=
+ifeq ($(BR2_PACKAGE_DIRECTFB_ATI128),y)
+DIRECTFB_GFX+= ati128
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_CLE266),y)
+DIRECTFB_GFX+= cle266
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_CYBER5K),y)
+DIRECTFB_GFX+= cyber5k
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_MATROX),y)
+DIRECTFB_GFX+= matrox
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_UNICHROME),y)
+DIRECTFB_GFX+= unichrome
+endif
+ifeq ($(DIRECTFB_GFX),)
+DIRECTFB_GFX:=none
+else
+comma:=,
+empty:=
+space:=$(empty) $(empty)
+DIRECTFB_GFX:=$(subst $(space),$(comma),$(strip $(DIRECTFB_GFX)))
+endif
+
+DIRECTFB_INPUT:=
+ifeq ($(BR2_PACKAGE_DIRECTFB_KEYBOARD),y)
+DIRECTFB_INPUT+= keyboard
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_PS2MOUSE),y)
+DIRECTFB_INPUT+= ps2mouse
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_SERIALMOUSE),y)
+DIRECTFB_INPUT+= serialmouse
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_TSLIB),y)
+DIRECTFB_INPUT+= tslib
+DIRECTFB_DEP+= tslib
+endif
+ifeq ($(DIRECTFB_INPUT),)
+DIRECTFB_INPUT:=none
+else
+comma:=,
+empty:=
+space:=$(empty) $(empty)
+DIRECTFB_INPUT:=$(subst $(space),$(comma),$(strip $(DIRECTFB_INPUT)))
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB_GIF),y)
+DIRECTFB_GIF:=--enable-gif
+else
+DIRECTFB_GIF:=--disable-gif
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB_PNG),y)
+DIRECTFB_PNG:=--enable-png
+DIRECTFB_DEP+= libpng
+else
+DIRECTFB_PNG:=--disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB_JPEG),y)
+DIRECTFB_JPEG:=--enable-jpeg
+DIRECTFB_DEP+= jpeg
+else
+DIRECTFB_JPEG:=--disable-jpeg
+endif
+
 $(DL_DIR)/$(DIRECTFB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DIRECTFB_SITE)/$(DIRECTFB_SOURCE)
 
@@ -46,32 +124,27 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/bin \
-		--sbindir=/sbin \
-		--libdir=/lib \
-		--libexecdir=/lib \
 		--sysconfdir=/etc \
-		--datadir=/share \
 		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/man \
-		--infodir=/info \
-		--with-gfxdrivers=cle266,unichrome \
+		--with-gfxdrivers=$(DIRECTFB_GFX) \
+		--with-inputdrivers=$(DIRECTFB_INPUT) \
+		--enable-static \
 		--enable-shared \
 		$(DIRECTFB_MULTI) \
 		$(DIRECTFB_X) \
-		--enable-jpeg \
-		--enable-png \
+		$(DIRECTFB_JPEG) \
+		$(DIRECTFB_PNG) \
+		$(DIRECTFB_GIF) \
+		$(DIRECTFB_UNIQUE) \
 		--enable-linux-input \
 		--enable-zlib \
 		--enable-freetype \
+		--enable-fbdev \
 		--disable-sysfs \
 		--disable-sdl \
 		--disable-vnc \
 		--disable-video4linux \
-		--disable-video4linux2 \
-		--enable-fusion )
+		--disable-video4linux2 )
 	touch $@
 
 $(DIRECTFB_DIR)/.compiled: $(DIRECTFB_DIR)/.configured
@@ -80,36 +153,39 @@
 		-C $(DIRECTFB_DIR)
 	touch $(DIRECTFB_DIR)/.compiled
 
-$(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(DIRECTFB_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libdirectfb.la
-	$(SED) "s,/lib/libfusion.la,$(STAGING_DIR)/usr/lib/libfusion.la,g" \
-		$(STAGING_DIR)/usr/lib/libdirectfb.la
-	$(SED) "s,/lib/libdirect.la,$(STAGING_DIR)/usr/lib/libdirect.la,g" \
-		$(STAGING_DIR)/usr/lib/libdirectfb.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libdirect.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libfusion.la
-	$(SED) "s,/lib/libdirect.la,$(STAGING_DIR)/usr/lib/libdirect.la,g" \
-		$(STAGING_DIR)/usr/lib/libfusion.la
-	touch -c $@
+$(STAGING_DIR)/$(DIRECTFB_BIN): $(DIRECTFB_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DIRECTFB_DIR) install
+	$(SED) "s, /usr/lib, $(STAGING_DIR)/usr/lib,g" \
+		$(STAGING_DIR)/usr/lib/libdirect.la \
+		$(STAGING_DIR)/usr/lib/libdirectfb.la \
+		$(STAGING_DIR)/usr/lib/libfusion.la \
+		`find $(STAGING_DIR)/usr/lib/directfb-$(DIRECTFB_MAJOR)-0/ -name '*.la'`
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		$(STAGING_DIR)/usr/bin/*directfb-config
 
-$(TARGET_DIR)/usr/lib/libdirectfb.so: $(STAGING_DIR)/usr/lib/libdirectfb.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libdirect* $(STAGING_DIR)/usr/lib/libfusion* $(TARGET_DIR)/usr/lib/
-	cp -rdpf $(STAGING_DIR)/usr/lib/directfb-* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
-		$(TARGET_DIR)/usr/lib/libdirectfb.so \
-		$(TARGET_DIR)/usr/lib/libdirect.so \
-		$(TARGET_DIR)/usr/lib/libfusion.so
+$(TARGET_DIR)/$(DIRECTFB_BIN): $(STAGING_DIR)/$(DIRECTFB_BIN)
+	cd $(STAGING_DIR)/usr/lib/; find $(DIRECTFB_STAGING) -type f -name '*.so' \
+		| xargs -IREPL install -Dm644 REPL $(TARGET_DIR)/usr/lib/REPL
+	mkdir -p $(TARGET_DIR)/usr/lib/directfb-$(DIRECTFB_MAJOR)-0/gfxdrivers
+	cp -dpf $(STAGING_DIR)/usr/lib/libfusion*.so.* $(TARGET_DIR)/usr/lib/
+ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libuniquewm*.so.* $(TARGET_DIR)/usr/lib/
+endif
+	cp -dpf $(STAGING_DIR)/usr/lib/libdirect*.so.* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
+		$(TARGET_DIR)/usr/lib/libdirect*.so.* \
+		$(TARGET_DIR)/usr/lib/libfusion*.so.*
+ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
+		$(TARGET_DIR)/usr/lib/libuniquewm*.so.*
+endif
 
-directfb: uclibc jpeg libpng freetype libsysfs tslib $(DIRECTFB_FUSION) \
-		$(TARGET_DIR)/usr/lib/libdirectfb.so
+directfb: uclibc $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION) $(TARGET_DIR)/$(DIRECTFB_BIN)
 
 directfb-clean:
 	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
 	-$(MAKE) -C $(DIRECTFB_DIR) clean
+	rm -f $(DIRECTFB_DIR)/.configured $(DIRECTFB_DIR)/.compiled
 
 directfb-dirclean:
 	rm -rf $(DIRECTFB_DIR)
