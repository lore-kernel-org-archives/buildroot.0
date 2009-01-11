From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:35:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20090111203535.5995276736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:35:34 +0000 (Sun, 11 Jan 2009)
New Revision: 24762

Log:
Change name form DIRECTFB_MAJOR to DIRECTFB_VERSION_MAJOR, make patches version dependent

Modified:
   trunk/buildroot/package/directfb/Config.in
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/Config.in
===================================================================
--- trunk/buildroot/package/directfb/Config.in	2009-01-11 20:24:24 UTC (rev 24761)
+++ trunk/buildroot/package/directfb/Config.in	2009-01-11 20:35:34 UTC (rev 24762)
@@ -21,24 +21,29 @@
 config BR2_PACKAGE_DIRECTFB_UNIQUE
 	bool "enable unique window manager"
 	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_UNIMPLEMENTED
 
 config BR2_PACKAGE_DIRECTFB_ATI128
 	bool "compile ati128 graphics driver"
 	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_CLE266
 	bool "compile cle266 graphics driver"
 	default y
 	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_MATROX
 	bool "compile matrox graphics driver"
 	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
 	default y
 	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_KEYBOARD
 	bool "compile keyboard input driver"
@@ -49,6 +54,7 @@
 	bool "compile PS2 mouse input driver"
 	default y
 	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 	bool "compile serial mouse input driver"

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2009-01-11 20:24:24 UTC (rev 24761)
+++ trunk/buildroot/package/directfb/directfb.mk	2009-01-11 20:35:34 UTC (rev 24762)
@@ -5,14 +5,16 @@
 #############################################################
 #DIRECTFB_VERSION:=0.9.25.1
 #DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
-DIRECTFB_MAJOR:=1.2
+DIRECTFB_VERSION_MAJOR:=1.2
 DIRECTFB_VERSION:=1.2.6
+#DIRECTFB_VERSION:=1.3.0	is a development version
+#DIRECTFB_VERSION_MAJOR:=1.3
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_CAT:=$(ZCAT)
 DIRECTFB_DIR:=$(BUILD_DIR)/DirectFB-$(DIRECTFB_VERSION)
-DIRECTFB_STAGING:=directfb-$(DIRECTFB_MAJOR)-0
-DIRECTFB_BIN:=usr/lib/libdirectfb-$(DIRECTFB_MAJOR).so.0
+DIRECTFB_STAGING:=directfb-$(DIRECTFB_VERSION_MAJOR)-0
+DIRECTFB_BIN:=usr/lib/libdirectfb-$(DIRECTFB_VERSION_MAJOR).so.0
 DIRECTFB_DEP:=zlib
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
@@ -110,7 +112,7 @@
 
 $(DIRECTFB_DIR)/.unpacked: $(DL_DIR)/$(DIRECTFB_SOURCE)
 	$(DIRECTFB_CAT) $(DL_DIR)/$(DIRECTFB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DIRECTFB_DIR) package/directfb/ directfb\*.patch
+	toolchain/patch-kernel.sh $(DIRECTFB_DIR) package/directfb/ DirectFB-$(DIRECTFB_VERSION)\*.patch
 	touch $@
 
 $(DIRECTFB_DIR)/.configured: $(DIRECTFB_DIR)/.unpacked
@@ -155,14 +157,14 @@
 		$(STAGING_DIR)/usr/lib/libdirect.la \
 		$(STAGING_DIR)/usr/lib/libdirectfb.la \
 		$(STAGING_DIR)/usr/lib/libfusion.la \
-		`find $(STAGING_DIR)/usr/lib/directfb-$(DIRECTFB_MAJOR)-0/ -name '*.la'`
+		`find $(STAGING_DIR)/usr/lib/directfb-$(DIRECTFB_VERSION_MAJOR)-0/ -name '*.la'`
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		$(STAGING_DIR)/usr/bin/*directfb-config
 
 $(TARGET_DIR)/$(DIRECTFB_BIN): $(STAGING_DIR)/$(DIRECTFB_BIN)
 	cd $(STAGING_DIR)/usr/lib/; find $(DIRECTFB_STAGING) -type f -name '*.so' \
 		| xargs -IREPL install -Dm644 REPL $(TARGET_DIR)/usr/lib/REPL
-	mkdir -p $(TARGET_DIR)/usr/lib/directfb-$(DIRECTFB_MAJOR)-0/gfxdrivers
+	mkdir -p $(TARGET_DIR)/usr/lib/directfb-$(DIRECTFB_VERSION_MAJOR)-0/gfxdrivers
 	cp -dpf $(STAGING_DIR)/usr/lib/libfusion*.so.* $(TARGET_DIR)/usr/lib/
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libuniquewm*.so.* $(TARGET_DIR)/usr/lib/
@@ -178,6 +180,8 @@
 
 directfb: uclibc $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION) $(TARGET_DIR)/$(DIRECTFB_BIN)
 
+directfb-unpacked: $(DIRECTFB_DIR)/.unpacked
+
 directfb-clean:
 	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
 	-$(MAKE) -C $(DIRECTFB_DIR) clean
