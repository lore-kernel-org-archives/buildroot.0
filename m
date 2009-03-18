From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 19:18:46 +0000 (UTC)
Subject: [Buildroot] svn commit: [25721] trunk/buildroot/package/pkgconfig
Message-ID: <20090318191846.2E14776459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 19:18:45 +0000 (Wed, 18 Mar 2009)
New Revision: 25721

Log:
pkgconfig: use pkg-config-*-host build dir for host version

Modified:
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-18 19:18:40 UTC (rev 25720)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-18 19:18:45 UTC (rev 25721)
@@ -6,9 +6,9 @@
 PKGCONFIG_VERSION:=0.23
 PKGCONFIG_SOURCE:=pkg-config-$(PKGCONFIG_VERSION).tar.gz
 PKGCONFIG_SITE:=http://pkgconfig.freedesktop.org/releases/
-PKGCONFIG_DIR:=$(BUILD_DIR)/pkg-config-$(PKGCONFIG_VERSION)
-PKGCONFIG_CAT:=$(ZCAT)
-PKGCONFIG_BINARY:=pkg-config
+
+# pkgconfig for the host
+PKGCONFIG_HOST_DIR:=$(BUILD_DIR)/pkg-config-$(PKGCONFIG_VERSION)-host
 PKGCONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
 
 $(DL_DIR)/$(PKGCONFIG_SOURCE):
@@ -16,13 +16,15 @@
 
 pkgconfig-source: $(DL_DIR)/$(PKGCONFIG_SOURCE)
 
-$(PKGCONFIG_DIR)/.unpacked: $(DL_DIR)/$(PKGCONFIG_SOURCE)
-	$(PKGCONFIG_CAT) $(DL_DIR)/$(PKGCONFIG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PKGCONFIG_DIR) package/pkgconfig/ \*.patch
+$(PKGCONFIG_HOST_DIR)/.unpacked: $(DL_DIR)/$(PKGCONFIG_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(PKGCONFIG_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(@D) package/pkgconfig/ \*.patch
 	touch $@
 
-$(PKGCONFIG_DIR)/.configured: $(PKGCONFIG_DIR)/.unpacked
-	(cd $(PKGCONFIG_DIR); rm -rf config.cache; \
+$(PKGCONFIG_HOST_DIR)/.configured: $(PKGCONFIG_HOST_DIR)/.unpacked
+	(cd $(@D); rm -rf config.cache; \
 		./configure \
 		--prefix=$(HOST_DIR)/usr \
 		--sysconfdir=$(HOST_DIR)/etc \
@@ -31,21 +33,21 @@
 	)
 	touch $@
 
-$(PKGCONFIG_DIR)/$(PKGCONFIG_BINARY): $(PKGCONFIG_DIR)/.configured
-	$(MAKE) -C $(PKGCONFIG_DIR)
+$(PKGCONFIG_HOST_DIR)/.compiled: $(PKGCONFIG_HOST_DIR)/.configured
+	$(MAKE) -C $(@D)
 
-$(PKGCONFIG_HOST_BINARY): $(PKGCONFIG_DIR)/$(PKGCONFIG_BINARY)
-	$(MAKE) -C $(PKGCONFIG_DIR) install
+$(PKGCONFIG_HOST_BINARY): $(PKGCONFIG_HOST_DIR)/.compiled
+	$(MAKE) -C $(<D) install
 
 host-pkgconfig pkgconfig: $(PKGCONFIG_HOST_BINARY)
 
 host-pkgconfig-clean pkgconfig-clean:
-	rm -f $(addprefix $(PKGCONFIG_DIR)/,.unpacked .configured .compiled)
-	-$(MAKE) -C $(PKGCONFIG_DIR) uninstall
-	-$(MAKE) -C $(PKGCONFIG_DIR) clean
+	rm -f $(addprefix $(PKGCONFIG_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(PKGCONFIG_HOST_DIR) uninstall
+	-$(MAKE) -C $(PKGCONFIG_HOST_DIR) clean
 
 host-pkgconfig-dirclean pkgconfig-dirclean:
-	rm -rf $(PKGCONFIG_DIR)
+	rm -rf $(PKGCONFIG_HOST_DIR)
 
 #############################################################
 #
