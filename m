From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:05 +0800
Subject: [Buildroot] [PATCH 03/19] fbv : convert to autotools infrastructure
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-4-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/fbv/fbv.mk |   50 +++++++++++++++++---------------------------------
 1 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 44ce5c6..81ff40c 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -6,23 +6,15 @@
 FBV_VERSION:=1.0b
 FBV_SOURCE:=fbv-$(FBV_VERSION).tar.gz
 FBV_SITE:=http://s-tech.elsat.net.pl/fbv
-FBV_DIR:=$(BUILD_DIR)/fbv-$(FBV_VERSION)
-FBV_CAT:=$(ZCAT)
 FBV_BINARY:=fbv
-FBV_TARGET_BINARY:=usr/bin/$(FBV_BINARY)
+FBV_TARGET_BINARY:=usr/bin/fbv
 
-$(DL_DIR)/$(FBV_SOURCE):
-	$(call DOWNLOAD,$(FBV_SITE),$(FBV_SOURCE))
+FBV_INSTALL_STAGING = NO
+FBV_INSTALL_TARGET = YES
+FBV_DEPENDENCIES = libpng jpeg libungif
 
-fbv-source: $(DL_DIR)/$(FBV_SOURCE)
-
-$(FBV_DIR)/.unpacked: $(DL_DIR)/$(FBV_SOURCE)
-	$(FBV_CAT) $(DL_DIR)/$(FBV_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FBV_DIR) package/fbv/ \
-		fbv-$(FBV_VERSION)\*.patch fbv-$(FBV_VERSION)\*.patch.$(ARCH)
-	touch $@
-
-$(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
+#fbv donesn't support cross-compilation
+define FBV_CONFIGURE_CMDS
 	(cd $(FBV_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -30,27 +22,19 @@ $(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
 		--prefix=/usr \
 		--libs="-lz -lm" \
 	)
-	touch $@
+endef
 
-$(FBV_DIR)/$(FBV_BINARY): $(FBV_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(FBV_DIR)
+define FBV_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
 
-$(TARGET_DIR)/$(FBV_TARGET_BINARY): $(FBV_DIR)/$(FBV_BINARY)
-	install -D $(FBV_DIR)/$(FBV_BINARY) $(TARGET_DIR)/$(FBV_TARGET_BINARY)
+define FBV_INSTALL_TARGET_CMDS
+	install -D $(@D)/$(FBV_BINARY) $(TARGET_DIR)/$(FBV_TARGET_BINARY)
+endef
 
-fbv: libpng jpeg libungif $(TARGET_DIR)/$(FBV_TARGET_BINARY)
-
-fbv-clean:
+define FBV_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/$(FBV_TARGET_BINARY)
-	-$(MAKE) -C $(FBV_DIR) clean
+	-$(MAKE) -C $(@D) clean
+endef
 
-fbv-dirclean:
-	rm -rf $(FBV_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FBV),y)
-TARGETS+=fbv
-endif
+$(eval $(call AUTOTARGETS,package,fbv))
-- 
1.7.0.4
