From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 22:34:03 +0200
Subject: [Buildroot] [PATCH 08/21 v2] core: introduce an intermediate rule
	before the configurators
In-Reply-To: <cover.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <f1c8da473eedb96a899a5919b98d0a1959911626.1445545973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, all configurators depend on generating the out-of-tree
Makefile wrapper.

In an upcoming patch, we'll need to also generate a kconfig fragment,
so it will have to kick in before we run the configurators.

Introduce a new intermediate "prepare-kconfig" rule, so we can
commonalise the dependencies of the configurators. Move the dependency
on the Makefile wrapper to that new intermediate rule.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 Makefile | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 0e25bd1..21ad930 100644
--- a/Makefile
+++ b/Makefile
@@ -702,6 +702,8 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
+prepare-kconfig: outputmakefile
+
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
 	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
@@ -720,19 +722,19 @@ COMMON_CONFIG_ENV = \
 	BR2_EXTERNAL=$(BR2_EXTERNAL) \
 	SKIP_LEGACY=
 
-xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
+xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
+gconfig: $(BUILD_DIR)/buildroot-config/gconf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)
 
-menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
+menuconfig: $(BUILD_DIR)/buildroot-config/mconf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
+nconfig: $(BUILD_DIR)/buildroot-config/nconf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 # For the config targets that automatically select options, we pass
@@ -740,22 +742,22 @@ config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 # no values are set for the legacy options so a subsequent oldconfig
 # will query them. Therefore, run an additional olddefconfig.
 
-oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+oldconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)
 
-randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+randconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --randconfig $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allyesconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allyesconfig $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allnoconfig $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+randpackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
@@ -763,7 +765,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
@@ -771,7 +773,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
@@ -779,24 +781,24 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+silentoldconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	$(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
 
-olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+olddefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN)
 
-defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+defconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
 define PERCENT_DEFCONFIG
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig prepare-kconfig
 	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
 		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
 endef
 $(eval $(foreach d,$(TOPDIR) $(BR2_EXTERNAL),$(call PERCENT_DEFCONFIG,$(d))$(sep)))
 
-savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
-- 
1.9.1
