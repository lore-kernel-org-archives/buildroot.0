From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 19:18:40 +0000 (UTC)
Subject: [Buildroot] svn commit: [25720] trunk/buildroot/package: pkgconfig
Message-ID: <20090318191840.D05A976459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 19:18:40 +0000 (Wed, 18 Mar 2009)
New Revision: 25720

Log:
pkgconfig: install into HOST_DIR

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-03-18 17:32:44 UTC (rev 25719)
+++ trunk/buildroot/package/Makefile.in	2009-03-18 19:18:40 UTC (rev 25720)
@@ -251,7 +251,7 @@
 		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
 		DEFAULT_LINKER="$(TARGET_LD)" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
-		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+		PKG_CONFIG="$(PKGCONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		STAGING_DIR="$(STAGING_DIR)"
 
@@ -296,7 +296,7 @@
 		ORIGINAL_LD_FOR_TARGET="$(TARGET_LD)" \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
-		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+		PKG_CONFIG="$(PKGCONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH)

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-18 17:32:44 UTC (rev 25719)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-18 19:18:40 UTC (rev 25720)
@@ -9,7 +9,7 @@
 PKGCONFIG_DIR:=$(BUILD_DIR)/pkg-config-$(PKGCONFIG_VERSION)
 PKGCONFIG_CAT:=$(ZCAT)
 PKGCONFIG_BINARY:=pkg-config
-PKGCONFIG_TARGET_BINARY:=usr/bin/pkg-config
+PKGCONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
 
 $(DL_DIR)/$(PKGCONFIG_SOURCE):
 	 $(call DOWNLOAD,$(PKGCONFIG_SITE),$(PKGCONFIG_SOURCE))
@@ -24,28 +24,27 @@
 $(PKGCONFIG_DIR)/.configured: $(PKGCONFIG_DIR)/.unpacked
 	(cd $(PKGCONFIG_DIR); rm -rf config.cache; \
 		./configure \
-		--prefix=/usr \
-		--sysconfdir=/etc \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
 		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
+		--disable-static \
 	)
 	touch $@
 
 $(PKGCONFIG_DIR)/$(PKGCONFIG_BINARY): $(PKGCONFIG_DIR)/.configured
 	$(MAKE) -C $(PKGCONFIG_DIR)
 
-$(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY): $(PKGCONFIG_DIR)/$(PKGCONFIG_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) install
-	rm -rf $(STAGING_DIR)/usr/share/man
+$(PKGCONFIG_HOST_BINARY): $(PKGCONFIG_DIR)/$(PKGCONFIG_BINARY)
+	$(MAKE) -C $(PKGCONFIG_DIR) install
 
-pkgconfig: uclibc $(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY)
+host-pkgconfig pkgconfig: $(PKGCONFIG_HOST_BINARY)
 
-pkgconfig-clean:
-	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) uninstall
+host-pkgconfig-clean pkgconfig-clean:
+	rm -f $(addprefix $(PKGCONFIG_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(PKGCONFIG_DIR) uninstall
 	-$(MAKE) -C $(PKGCONFIG_DIR) clean
 
-pkgconfig-dirclean:
+host-pkgconfig-dirclean pkgconfig-dirclean:
 	rm -rf $(PKGCONFIG_DIR)
 
 #############################################################
