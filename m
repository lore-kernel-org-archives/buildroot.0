From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Apr 2008 00:03:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/file
	package/gettext package/lib etc...
Message-ID: <20080401070308.5C8F23C4B4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-01 00:03:07 -0700 (Tue, 01 Apr 2008)
New Revision: 21605

Log:
buildroot: additional -clean target fixes

Patch by Hebbar.


Modified:
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/libdrm/libdrm.mk
   trunk/buildroot/package/lzo/lzo.mk
   trunk/buildroot/package/pkgconfig/pkgconfig.mk
   trunk/buildroot/package/tslib/tslib.mk
   trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2008-04-01 06:51:59 UTC (rev 21604)
+++ trunk/buildroot/package/file/file.mk	2008-04-01 07:03:07 UTC (rev 21605)
@@ -105,7 +105,7 @@
 file: zlib uclibc $(TARGET_DIR)/$(FILE_TARGET_BINARY)
 
 file-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FILE_DIR2) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FILE_DIR2) uninstall
 	-$(MAKE) -C $(FILE_DIR2) clean
 
 file-dirclean:

Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2008-04-01 06:51:59 UTC (rev 21604)
+++ trunk/buildroot/package/gettext/gettext.mk	2008-04-01 07:03:07 UTC (rev 21605)
@@ -125,7 +125,7 @@
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
 
 gettext-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
 	-$(MAKE) -C $(GETTEXT_DIR) clean
 
 gettext-dirclean:

Modified: trunk/buildroot/package/libdrm/libdrm.mk
===================================================================
--- trunk/buildroot/package/libdrm/libdrm.mk	2008-04-01 06:51:59 UTC (rev 21604)
+++ trunk/buildroot/package/libdrm/libdrm.mk	2008-04-01 07:03:07 UTC (rev 21605)
@@ -64,7 +64,7 @@
 libdrm: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libdrm.so
 
 libdrm-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBDRM_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBDRM_DIR) uninstall
 	-$(MAKE) -C $(LIBDRM_DIR) clean
 
 libdrm-dirclean:

Modified: trunk/buildroot/package/lzo/lzo.mk
===================================================================
--- trunk/buildroot/package/lzo/lzo.mk	2008-04-01 06:51:59 UTC (rev 21604)
+++ trunk/buildroot/package/lzo/lzo.mk	2008-04-01 07:03:07 UTC (rev 21605)
@@ -54,7 +54,7 @@
 lzo: uclibc $(STAGING_DIR)/usr/lib/liblzo.a
 
 lzo-clean:
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) uninstall
+	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) uninstall
 	-$(MAKE) -C $(LZO_DIR) clean
 
 lzo-dirclean:

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2008-04-01 06:51:59 UTC (rev 21604)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2008-04-01 07:03:07 UTC (rev 21605)
@@ -55,7 +55,7 @@
 pkgconfig: uclibc $(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY)
 
 pkgconfig-clean:
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) uninstall
+	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) uninstall
 	-$(MAKE) -C $(PKGCONFIG_DIR) clean
 
 pkgconfig-dirclean:

Modified: trunk/buildroot/package/tslib/tslib.mk
===================================================================
--- trunk/buildroot/package/tslib/tslib.mk	2008-04-01 06:51:59 UTC (rev 21604)
+++ trunk/buildroot/package/tslib/tslib.mk	2008-04-01 07:03:07 UTC (rev 21605)
@@ -91,9 +91,8 @@
 	touch $(TSLIB_DIR)/.compiled
 
 tslib-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(TSLIB_DIR) uninstall
-	rm -f $(STAGING_DIR)/lib/libts.*
-	rm -f $(STAGING_DIR)/usr/lib/libts.*
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(TSLIB_DIR) uninstall
+	rm -f $(STAGING_DIR)/lib/libts.* $(STAGING_DIR)/usr/lib/libts.*
 	-$(MAKE) -C $(TSLIB_DIR) clean
 
 tslib-dirclean:

Modified: trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk	2008-04-01 06:51:59 UTC (rev 21604)
+++ trunk/buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk	2008-04-01 07:03:07 UTC (rev 21605)
@@ -58,8 +58,8 @@
 	touch $@
 
 xdata_xcursor-themes-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
+	-$(MAKE) prefix=$(STAGING_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
+	-$(MAKE) prefix=$(TARGET_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
 	-$(MAKE) -C $(XDATA_XCURSOR_THEMES_DIR) clean
 	-rm $(XDATA_XCURSOR_THEMES_DIR)/.installed
 	-rm $(XDATA_XCURSOR_THEMES_DIR)/.built

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-04-01 06:51:59 UTC (rev 21604)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-04-01 07:03:07 UTC (rev 21605)
@@ -25,7 +25,7 @@
 @echo "#endif" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#define $(strip $(1)) $(2)" >> $(U_BOOT_INC_CONF_FILE)
 endef
-	
+
 $(DL_DIR)/$(U_BOOT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(U_BOOT_SITE)/$(U_BOOT_SOURCE)
 
@@ -113,7 +113,7 @@
 u-boot: gcc $(BINARIES_DIR)/$(U_BOOT_BIN)
 
 u-boot-clean:
-	$(MAKE) -C $(U_BOOT_DIR) clean
+	-$(MAKE) -C $(U_BOOT_DIR) clean
 
 u-boot-dirclean:
 	rm -rf $(U_BOOT_DIR)
