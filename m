From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:20:57 +0200
Subject: [Buildroot] [PATCH 03/20] fbv : convert to autotools infrastructure
In-Reply-To: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c7071f7297385406143bc397418d4119b0048439.1277237892.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: cmchao <cmchao@gmail.com>

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Target installation is the default behaviour
 * No installation to staging is the default behaviour
 * Remove FBV_BINARY/FBV_TARGET_BINARY variables

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/fbv/fbv.mk |   50 +++++++++++++++-----------------------------------
 1 files changed, 15 insertions(+), 35 deletions(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 44ce5c6..7305c6e 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -6,23 +6,11 @@
 FBV_VERSION:=1.0b
 FBV_SOURCE:=fbv-$(FBV_VERSION).tar.gz
 FBV_SITE:=http://s-tech.elsat.net.pl/fbv
-FBV_DIR:=$(BUILD_DIR)/fbv-$(FBV_VERSION)
-FBV_CAT:=$(ZCAT)
-FBV_BINARY:=fbv
-FBV_TARGET_BINARY:=usr/bin/$(FBV_BINARY)
 
-$(DL_DIR)/$(FBV_SOURCE):
-	$(call DOWNLOAD,$(FBV_SITE),$(FBV_SOURCE))
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
@@ -30,27 +18,19 @@ $(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
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
+	install -D $(@D)/fbv $(TARGET_DIR)/usr/bin/fbv
+endef
 
-fbv: libpng jpeg libungif $(TARGET_DIR)/$(FBV_TARGET_BINARY)
+define FBV_CLEAN_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/fbv
+	-$(MAKE) -C $(@D) clean
+endef
 
-fbv-clean:
-	rm -f $(TARGET_DIR)/$(FBV_TARGET_BINARY)
-	-$(MAKE) -C $(FBV_DIR) clean
-
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
