From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2015 23:30:18 +0100
Subject: [Buildroot] [PATCH 3/7] Makefile: introduce a intermediate rule
	before the configurators
In-Reply-To: <cover.1426112628.git.yann.morin.1998@free.fr>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
Message-ID: <295445d168d33d004d60b7d496110f21b7a26021.1426112628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, all configurators depend on generating the out-of-tree
Makefile wrapper.

In an upcoming patch, we'll need to also generate a kconfig fragment, so
it will have to kick in before we run the configurators.

Introduce a new intermediat "prepare-kconfig" rule, so we can commonalise
the dependnecies of the confiurators. Move the dependency on the Makefile
wrapper to that new intermediate rule.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 8c82b53..7dde8da 100644
--- a/Makefile
+++ b/Makefile
@@ -693,6 +693,8 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
+prepare-kconfig: outputmakefile
+
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
 	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
@@ -710,43 +712,43 @@ COMMON_CONFIG_ENV = \
 	BR2_CONFIG=$(BR2_CONFIG) \
 	BR2_EXTERNAL=$(BR2_EXTERNAL)
 
-xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
+xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
+gconfig: $(BUILD_DIR)/buildroot-config/gconf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)
 
-menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
+menuconfig: $(BUILD_DIR)/buildroot-config/mconf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
+nconfig: $(BUILD_DIR)/buildroot-config/nconf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+oldconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)
 
-randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+randconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
 
-allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allyesconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)
 
-allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --allnoconfig $(CONFIG_CONFIG_IN)
 
-randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+randpackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
@@ -757,7 +759,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		$< --randconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
@@ -768,7 +770,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		$< --allyesconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) \
@@ -776,30 +778,30 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+silentoldconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	$(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
 
-olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+olddefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN)
 
-defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+defconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
 		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
 		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
 
-savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
-- 
1.9.1
