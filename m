From: Patrick Williams <patrick@stwcx.xyz>
Date: Fri, 15 Apr 2016 10:40:34 -0500
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
Message-ID: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Elizabeth Liner <eliner@us.ibm.com>

This change will add in the custom _defconfig's to the buildroot
makefile so that when a _defconfig is in the custom directory it is
recognized correctly, and is able to be used.

Signed-off-by: Elizabeth Liner <eliner@us.ibm.com>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 63502d0..15ef194 100644
--- a/Makefile
+++ b/Makefile
@@ -845,6 +845,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
 		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
 
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/custom/configs/%_defconfig outputmakefile
+	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/custom/configs/$@ \
+		$< --defconfig=$(BR2_EXTERNAL)/custom/configs/$@ $(CONFIG_CONFIG_IN)
+
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
@@ -984,6 +988,12 @@ ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
 	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
+ifneq ($(wildcard $(BR2_EXTERNAL)/custom/configs/*_defconfig),)
+	@echo
+	@echo 'User-provided custom configs:'
+	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/custom/configs/*_defconfig))), \
+	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
+endif
 	@echo
 
 release: OUT = buildroot-$(BR2_VERSION)
-- 
2.6.3
