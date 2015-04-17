From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 17 Apr 2015 18:48:03 +0200
Subject: [Buildroot] [PATCH v2] Makefile: remove redundant mkdir from *config
In-Reply-To: <alpine.LFD.2.11.1504161841100.9373@localhost>
References: <alpine.LFD.2.11.1504161841100.9373@localhost>
Message-ID: <1429289283-15524-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first dependency of these targets is
$(BUILD_DIR)/buildroot-config/*conf
so the $(BUILD_DIR)/buildroot-config directory certainly exists.

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1->v2:
- Updated commit message with *conf, since it's sometimes qconf, nconf,
  ... (Robert)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Makefile b/Makefile
index 70d6b4a..6a28b28 100644
--- a/Makefile
+++ b/Makefile
@@ -694,23 +694,18 @@ COMMON_CONFIG_ENV = \
 	SKIP_LEGACY=
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)
 
 menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 # For the config targets that automatically select options, we pass
@@ -719,26 +714,21 @@ config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 # will query them. Therefore, run an additional olddefconfig.
 
 oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)
 
 randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --randconfig $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allyesconfig $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allnoconfig $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
@@ -747,7 +737,6 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
@@ -756,7 +745,6 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
@@ -765,30 +753,24 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	$(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
 
 olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN)
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
 		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
 		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
-- 
2.1.4
