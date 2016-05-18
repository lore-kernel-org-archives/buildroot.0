From: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 18 May 2016 14:25:26 -0500
Subject: [Buildroot] [PATCH 2/6] Makefile: Generate %_defconfig recipes from
	macro.
In-Reply-To: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
References: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <1463599530-28752-3-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To reduce duplication in the %_defconfig recipes with $(TOPDIR) and
$(BR2_EXTERNAL) versions, generate these from a macro.  The macro is
now called on a list of directories containing the appropriate ones.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 035d0ab..47e0d8a 100644
--- a/Makefile
+++ b/Makefile
@@ -840,23 +840,19 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
-		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
-
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
-		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
-
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig.merge outputmakefile
-	@cd $(TOPDIR)/configs && xargs -a $@.merge -x -P 1 $(TOPDIR)/support/kconfig/merge_config.sh -m -O $(CONFIG_DIR)
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(CONFIG_DIR)/.config \
-		$< --defconfig=$(CONFIG_DIR)/.config $(CONFIG_CONFIG_IN)
-
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig.merge outputmakefile
-	@cd $(BR2_EXTERNAL)/configs && xargs -a $@.merge -x -P 1 $(TOPDIR)/support/kconfig/merge_config.sh -m -O $(CONFIG_DIR)
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(CONFIG_DIR)/.config \
-		$< --defconfig=$(CONFIG_DIR)/.config $(CONFIG_CONFIG_IN)
+define CREATE_DEFCONFIG_RECIPES
+%_defconfig: $$(BUILD_DIR)/buildroot-config/conf $1/%_defconfig outputmakefile
+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(TOPDIR)/configs/$$@ \
+		$$< --defconfig=$1/$$@ $$(CONFIG_CONFIG_IN)
+
+%_defconfig: $$(BUILD_DIR)/buildroot-config/conf $1/%_defconfig.merge outputmakefile
+	@cd $1 && xargs -a $$@.merge -x -P 1 $$(TOPDIR)/support/kconfig/merge_config.sh -m -O $$(CONFIG_DIR)
+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(CONFIG_DIR)/.config \
+		$$< --defconfig=$$(CONFIG_DIR)/.config $$(CONFIG_CONFIG_IN)
+endef
+
+BR2_DEFCONFIG_PATHS=$(TOPDIR)/configs $(BR2_EXTERNAL)/configs
+$(foreach path,$(BR2_DEFCONFIG_PATHS),$(eval $(call CREATE_DEFCONFIG_RECIPES,$(path))))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
-- 
2.6.3
