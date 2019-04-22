From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:03 +0200
Subject: [Buildroot] [PATCH 07/12] core: drop now-useless prepare-kconfig
 rule
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <9e8bfa1f83c6e0bdb2de186172e9ea7b52af06dc.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This rule was added back in 9429e7b698 (core: introduce an intermediate
rule before the configurators) when the kconfig-side br2-external file
was generated separately from the Makefile-side one.

Now that they are generated together very early in the Makefile, we no
longer need this intermediate rule. Drop it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index d611eb9c02..34c0dd75be 100644
--- a/Makefile
+++ b/Makefile
@@ -937,9 +937,6 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
-.PHONY: prepare-kconfig
-prepare-kconfig: outputmakefile
-
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
 	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
@@ -959,19 +956,19 @@ COMMON_CONFIG_ENV = \
 	BASE_DIR=$(BASE_DIR) \
 	SKIP_LEGACY=
 
-xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig
+xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-gconfig: $(BUILD_DIR)/buildroot-config/gconf prepare-kconfig
+gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
 	@$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)
 
-menuconfig: $(BUILD_DIR)/buildroot-config/mconf prepare-kconfig
+menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-nconfig: $(BUILD_DIR)/buildroot-config/nconf prepare-kconfig
+nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 # For the config targets that automatically select options, we pass
@@ -979,11 +976,11 @@ config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 # no values are set for the legacy options so a subsequent oldconfig
 # will query them. Therefore, run an additional olddefconfig.
 
-randconfig allyesconfig alldefconfig allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+randconfig allyesconfig alldefconfig allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --$@ $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-randpackageconfig allyespackageconfig allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+randpackageconfig allyespackageconfig allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
@@ -991,15 +988,15 @@ randpackageconfig allyespackageconfig allnopackageconfig: $(BUILD_DIR)/buildroot
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --$@ $(CONFIG_CONFIG_IN)
 
-defconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 define percent_defconfig
 # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig prepare-kconfig
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
 	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
 		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
 endef
@@ -1007,7 +1004,7 @@ $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent
 
 update-defconfig: savedefconfig
 
-savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
-- 
2.14.1
