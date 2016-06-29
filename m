From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 29 Jun 2016 15:06:40 +1000
Subject: [Buildroot] [PATCH v3 3/6] Makefile: Generate %_defconfig recipes
	from macro.
In-Reply-To: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
Message-ID: <3d3897584bb1748c4135f0d54c9f5976e706a45a.1467176798.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Patrick Williams <patrick@stwcx.xyz>

To reduce duplication in the %_defconfig recipes with $(TOPDIR) and
$(BR2_EXTERNAL) versions, generate these from a macro.  The macro is
now called on a list of directories containing the appropriate ones.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 Makefile | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 9f3fc92..e78b9e2 100644
--- a/Makefile
+++ b/Makefile
@@ -842,13 +842,14 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
-		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
+define CREATE_DEFCONFIG_RECIPES
+%_defconfig: $$(BUILD_DIR)/buildroot-config/conf $1/%_defconfig outputmakefile
+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(TOPDIR)/configs/$$@ \
+		$$< --defconfig=$1/$$@ $$(CONFIG_CONFIG_IN)
+endef
 
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
-		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
+BR2_DEFCONFIG_PATHS=$(TOPDIR)/configs $(BR2_EXTERNAL)/configs
+$(foreach path,$(BR2_DEFCONFIG_PATHS),$(eval $(call CREATE_DEFCONFIG_RECIPES,$(path))))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
@@ -894,7 +895,7 @@ $(1): $$(BUILD_DIR)/buildroot-config/conf $(call CONFIG_FILE_LIST,$2 $3) outputm
 	@rm -rf $$(CONFIG_DIR)/.merge_config
 endef
 
-$(foreach d,$(TOPDIR)/configs $(BR2_EXTERNAL)/configs,$(eval -include $(d)/*.mk))
+$(foreach d,$(BR2_DEFCONFIG_PATHS),$(eval -include $(d)/*.mk))
 
 ################################################################################
 #
-- 
2.1.0
