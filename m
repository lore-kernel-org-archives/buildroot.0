From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:13:54 -0700
Subject: [Buildroot] [PATCH 03/18] boa: convert to gentargets
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/boa/boa.mk |   61 ++++++++++++++-------------------------------------
 1 files changed, 17 insertions(+), 44 deletions(-)

diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index a51de96..1b929b4 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -3,33 +3,19 @@
 # boa
 #
 #############################################################
+BOA_VERSION = 0.94.14rc21
+BOA_SOURCE = boa-$(BOA_VERSION).tar.gz
+BOA_SITE = http://www.boa.org/
+BOA_WORKDIR = $(BUILD_DIR)/boa_workdir
 
-BOA_VERSION=0.94.14rc21
-
-# Don't alter below this line unless you (think) you know
-# what you are doing! Danger, Danger!
-
-BOA_SOURCE=boa-$(BOA_VERSION).tar.gz
-BOA_CAT:=$(ZCAT)
-BOA_SITE=http://www.boa.org/
-BOA_DIR=$(BUILD_DIR)/boa-$(BOA_VERSION)
-BOA_WORKDIR=$(BUILD_DIR)/boa_workdir
-
-$(DL_DIR)/$(BOA_SOURCE):
-	$(call DOWNLOAD,$(BOA_SITE),$(BOA_SOURCE))
-
-$(BOA_DIR)/.unpacked: $(DL_DIR)/$(BOA_SOURCE)
-	$(BOA_CAT) $(DL_DIR)/$(BOA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(BOA_DIR)/.unpacked
-
-$(BOA_WORKDIR)/Makefile: $(BOA_DIR)/.unpacked
+define BOA_CONFIGURE_CMDS
 	rm -f $(BOA_WORKDIR)/Makefile
 	mkdir -p $(BOA_WORKDIR)
 	#CONFIG_SITE=package/boa/boa-config.site-$(ARCH)
-	(cd $(BOA_WORKDIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
+	(cd $(BOA_WORKDIR); \
 		$(TARGET_CONFIGURE_ARGS) \
-		$(BOA_DIR)/configure $(QUIET) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(@D)/configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -46,14 +32,14 @@ $(BOA_WORKDIR)/Makefile: $(BOA_DIR)/.unpacked
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 	)
-	touch $(BOA_WORKDIR)/Makefile
+endef
 
-$(BOA_WORKDIR)/src/boa $(BOA_WORKDIR)/src/boa_indexer: $(BOA_WORKDIR)/Makefile
-	rm -f $@
+define BOA_BUILD_CMDS
+	rm -f $(BOA_WORKDIR)/src/boa
 	$(MAKE) -C $(BOA_WORKDIR)
+endef
 
-$(BOA_WORKDIR)/.installed: $(BOA_WORKDIR)/src/boa $(BOA_WORKDIR)/src/boa_indexer
-	mkdir -p $(TARGET_DIR)/usr/sbin
+define BOA_INSTALL_TARGET_CMDS
 	cp -f $(BOA_WORKDIR)/src/boa $(TARGET_DIR)/usr/sbin/boa
 	mkdir -p $(TARGET_DIR)/usr/lib/boa
 	cp -f $(BOA_WORKDIR)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
@@ -61,26 +47,13 @@ $(BOA_WORKDIR)/.installed: $(BOA_WORKDIR)/src/boa $(BOA_WORKDIR)/src/boa_indexer
 	cp -f package/boa/boa.conf $(TARGET_DIR)/etc/boa
 	cp -f package/boa/mime.types $(TARGET_DIR)/etc/mime.types
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/boa $(TARGET_DIR)/usr/lib/boa/boa_indexer
-	touch $(BOA_WORKDIR)/.installed
+endef
 
-boa: $(BOA_WORKDIR)/.installed
-
-boa-source: $(DL_DIR)/$(BOA_SOURCE)
-
-boa-clean:
+define BOA_CLEAN_CMDS
 	-$(MAKE) -C $(BOA_WORKDIR) clean
 	rm -rf $(TARGET_DIR)/usr/sbin/boa \
 		$(TARGET_DIR)/usr/lib/boa/boa_indexer \
 		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
+endef
 
-boa-dirclean:
-	rm -rf $(BOA_DIR) $(BOA_WORKDIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_BOA),y)
-TARGETS+=boa
-endif
+$(eval $(call GENTARGETS,package,boa))
-- 
1.7.3
