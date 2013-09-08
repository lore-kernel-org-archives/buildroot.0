From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Sep 2013 15:15:27 +0200
Subject: [Buildroot] [PATCH 1/3] Makefile: factorize *config dependencies
In-Reply-To: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378646129-4167-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All of the *config targets have common dependencies. Currently, the
only common dependency is the 'outputmakefile' target, but as we are
going to add one more, it makes sense to factorize these common
dependencies under the COMMON_CONFIG_DEPS variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 0d7476a..fc55b87 100644
--- a/Makefile
+++ b/Makefile
@@ -633,43 +633,46 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
 
-xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
+COMMON_CONFIG_DEPS = \
+	outputmakefile
+
+xconfig: $(BUILD_DIR)/buildroot-config/qconf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
+gconfig: $(BUILD_DIR)/buildroot-config/gconf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)
 
-menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
+menuconfig: $(BUILD_DIR)/buildroot-config/mconf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
+nconfig: $(BUILD_DIR)/buildroot-config/nconf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+config: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+oldconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)
 
-randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+randconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
 
-allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allyesconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)
 
-allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allnoconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --allnoconfig $(CONFIG_CONFIG_IN)
 
-randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+randpackageconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
@@ -680,7 +683,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		$< --randconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
@@ -691,7 +694,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		$< --allyesconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) \
@@ -699,23 +702,23 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+silentoldconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	$(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
 
-olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+olddefconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN)
 
-defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+defconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
-savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
-- 
1.8.1.2
