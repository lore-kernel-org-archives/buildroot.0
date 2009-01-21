From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 19:20:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20090121192010.3D0CF768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-21 19:20:08 +0000 (Wed, 21 Jan 2009)
New Revision: 24941

Log:
directfb: bump version and convert to Makefile.autotools.in format

Patch by Sven Neumann <s.neumann@phase-zero.de>

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2009-01-21 15:49:17 UTC (rev 24940)
+++ trunk/buildroot/package/directfb/directfb.mk	2009-01-21 19:20:08 UTC (rev 24941)
@@ -3,19 +3,16 @@
 # directfb
 #
 #############################################################
-#DIRECTFB_VERSION:=0.9.25.1
-#DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
 DIRECTFB_VERSION_MAJOR:=1.2
-DIRECTFB_VERSION:=1.2.6
+DIRECTFB_VERSION:=1.2.7
 #DIRECTFB_VERSION:=1.3.0	is a development version
 #DIRECTFB_VERSION_MAJOR:=1.3
-DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
+DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
-DIRECTFB_CAT:=$(ZCAT)
-DIRECTFB_DIR:=$(BUILD_DIR)/DirectFB-$(DIRECTFB_VERSION)
-DIRECTFB_STAGING:=directfb-$(DIRECTFB_VERSION_MAJOR)-0
-DIRECTFB_BIN:=usr/lib/libdirectfb-$(DIRECTFB_VERSION_MAJOR).so.0
-DIRECTFB_DEP:=zlib
+DIRECTFB_AUTORECONF = NO
+DIRECTFB_LIBTOOL_PATCH = NO
+DIRECTFB_INSTALL_STAGING = YES
+DIRECTFB_INSTALL_TARGET = YES
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
 DIRECTFB_MULTI:=--enable-multi --enable-fusion
@@ -105,96 +102,29 @@
 DIRECTFB_JPEG:=--disable-jpeg
 endif
 
-$(DL_DIR)/$(DIRECTFB_SOURCE):
-	$(call DOWNLOAD,$(DIRECTFB_SITE),$(DIRECTFB_SOURCE))
+DIRECTFB_CONF_OPT = \
+	--localstatedir=/var \
+	--with-gfxdrivers=$(DIRECTFB_GFX) \
+	--with-inputdrivers=$(DIRECTFB_INPUT) \
+	--enable-static \
+	--enable-shared \
+	--disable-explicit-deps \
+	$(DIRECTFB_MULTI) \
+	$(DIRECTFB_X) \
+	$(DIRECTFB_JPEG) \
+	$(DIRECTFB_PNG) \
+	$(DIRECTFB_GIF) \
+	$(DIRECTFB_UNIQUE) \
+	--enable-linux-input \
+	--enable-zlib \
+	--enable-freetype \
+	--enable-fbdev \
+	--disable-sysfs \
+	--disable-sdl \
+	--disable-vnc \
+	--disable-video4linux \
+	--disable-video4linux2
 
-directfb-source: $(DL_DIR)/$(DIRECTFB_SOURCE)
+DIRECTFB_DEPENDENCIES = uclibc $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION)
 
-$(DIRECTFB_DIR)/.unpacked: $(DL_DIR)/$(DIRECTFB_SOURCE)
-	$(DIRECTFB_CAT) $(DL_DIR)/$(DIRECTFB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DIRECTFB_DIR) package/directfb/ DirectFB-$(DIRECTFB_VERSION)\*.patch
-	touch $@
-
-$(DIRECTFB_DIR)/.configured: $(DIRECTFB_DIR)/.unpacked
-	(cd $(DIRECTFB_DIR); rm -f config.cache; \
-	ac_cv_header_linux_wm97xx_h=no \
-	ac_cv_header_linux_sisfb_h=no \
-	ac_cv_header_asm_page_h=no \
-	$(AUTO_CONFIGURE_TARGET) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--with-gfxdrivers=$(DIRECTFB_GFX) \
-		--with-inputdrivers=$(DIRECTFB_INPUT) \
-		--enable-static \
-		--enable-shared \
-		$(DIRECTFB_MULTI) \
-		$(DIRECTFB_X) \
-		$(DIRECTFB_JPEG) \
-		$(DIRECTFB_PNG) \
-		$(DIRECTFB_GIF) \
-		$(DIRECTFB_UNIQUE) \
-		--enable-linux-input \
-		--enable-zlib \
-		--enable-freetype \
-		--enable-fbdev \
-		--disable-sysfs \
-		--disable-sdl \
-		--disable-vnc \
-		--disable-video4linux \
-		--disable-video4linux2 )
-	touch $@
-
-$(DIRECTFB_DIR)/.compiled: $(DIRECTFB_DIR)/.configured
-	$(MAKE) PATH=$(STAGING_DIR)/usr/lib:$(PATH) \
-		$(TARGET_CONFIGURE_OPTS) \
-		-C $(DIRECTFB_DIR)
-	touch $(DIRECTFB_DIR)/.compiled
-
-$(STAGING_DIR)/$(DIRECTFB_BIN): $(DIRECTFB_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DIRECTFB_DIR) install
-	$(SED) "s, /usr/lib, $(STAGING_DIR)/usr/lib,g" \
-		$(STAGING_DIR)/usr/lib/libdirect.la \
-		$(STAGING_DIR)/usr/lib/libdirectfb.la \
-		$(STAGING_DIR)/usr/lib/libfusion.la \
-		`find $(STAGING_DIR)/usr/lib/directfb-$(DIRECTFB_VERSION_MAJOR)-0/ -name '*.la'`
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/*directfb-config
-
-$(TARGET_DIR)/$(DIRECTFB_BIN): $(STAGING_DIR)/$(DIRECTFB_BIN)
-	cd $(STAGING_DIR)/usr/lib/; find $(DIRECTFB_STAGING) -type f -name '*.so' \
-		| xargs -IREPL install -Dm644 REPL $(TARGET_DIR)/usr/lib/REPL
-	mkdir -p $(TARGET_DIR)/usr/lib/directfb-$(DIRECTFB_VERSION_MAJOR)-0/gfxdrivers
-	cp -dpf $(STAGING_DIR)/usr/lib/libfusion*.so.* $(TARGET_DIR)/usr/lib/
-ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libuniquewm*.so.* $(TARGET_DIR)/usr/lib/
-endif
-	cp -dpf $(STAGING_DIR)/usr/lib/libdirect*.so.* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
-		$(TARGET_DIR)/usr/lib/libdirect*.so.* \
-		$(TARGET_DIR)/usr/lib/libfusion*.so.*
-ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
-		$(TARGET_DIR)/usr/lib/libuniquewm*.so.*
-endif
-
-directfb: uclibc $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION) $(TARGET_DIR)/$(DIRECTFB_BIN)
-
-directfb-unpacked: $(DIRECTFB_DIR)/.unpacked
-
-directfb-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
-	-$(MAKE) -C $(DIRECTFB_DIR) clean
-	rm -f $(DIRECTFB_DIR)/.configured $(DIRECTFB_DIR)/.compiled
-
-directfb-dirclean:
-	rm -rf $(DIRECTFB_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-TARGETS+=directfb
-endif
+$(eval $(call AUTOTARGETS,package,directfb))
