From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:13:59 -0700
Subject: [Buildroot] [PATCH 08/18] ezxml: convert to gentargets
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-8-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/ezxml/ezxml.mk |   52 +++++++++++++----------------------------------
 1 files changed, 15 insertions(+), 37 deletions(-)

diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 3746b51..e29a7b5 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -3,45 +3,23 @@
 # ezxml
 #
 #############################################################
+EZXML_VERSION = 0.8.6
+EZXML_SOURCE = ezxml-$(EZXML_VERSION).tar.gz
+EZXML_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ezxml/
+EZXML_INSTALL_STAGING=YES
 
-EZXML_VERSION:=0.8.6
-EZXML_SOURCE:=ezxml-$(EZXML_VERSION).tar.gz
-EZXML_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ezxml/
-EZXML_DIR:=$(BUILD_DIR)/ezxml
-
-$(DL_DIR)/$(EZXML_SOURCE):
-	$(call DOWNLOAD,$(EZXML_SITE),$(EZXML_SOURCE))
-
-$(EZXML_DIR)/.unpacked: $(DL_DIR)/$(EZXML_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(EZXML_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(EZXML_DIR) package/ezxml/ ezxml-$(EZXML_VERSION)\*.patch
-	touch $@
-
-$(EZXML_DIR)/.configured: $(EZXML_DIR)/.unpacked
-	touch $@
-
-$(EZXML_DIR)/libezxml.a: $(EZXML_DIR)/.configured
+define EZXML_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
-	-f GNUmakefile -C $(EZXML_DIR)
-
-$(STAGING_DIR)/usr/lib/libezxml.a: $(EZXML_DIR)/libezxml.a
-	cp $(EZXML_DIR)/ezxml.h $(STAGING_DIR)/usr/include
-	cp $(EZXML_DIR)/libezxml.a $(STAGING_DIR)/usr/lib
+	-f GNUmakefile -C $(@D)
+endef
 
-ezxml: $(STAGING_DIR)/usr/lib/libezxml.a
+define EZXML_INSTALL_STAGING_CMDS
+	cp $(@D)/ezxml.h $(STAGING_DIR)/usr/include
+	cp $(@D)/libezxml.a $(STAGING_DIR)/usr/lib
+endef
 
-ezxml-source: $(DL_DIR)/$(EZXML_SOURCE)
+define EZXML_CLEAN_CMDS
+	-$(MAKE) -C $(@D) -f GNUmakefile clean
+endef
 
-ezxml-clean:
-	-$(MAKE) -C $(EZXML_DIR) -f GNUmakefile clean
-
-ezxml-dirclean:
-	rm -rf $(EZXML_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_EZXML),y)
-TARGETS+=ezxml
-endif
+$(eval $(call GENTARGETS,package,ezxml))
-- 
1.7.3
