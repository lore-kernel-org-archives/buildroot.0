From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 21:51:40 +0200
Subject: [Buildroot] [git commit] core: drop now-useless prepare-kconfig rule
Message-ID: <20190803194903.B9CED8DFDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f879203cfce0a2d49391df4d6611fa7baca0babb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This rule was added back in 9429e7b698 (core: introduce an intermediate
rule before the configurators) when the kconfig-side br2-external file
was generated separately from the Makefile-side one.

Now that they are generated together very early in the Makefile, we no
longer need this intermediate rule. Drop it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
[Peter: also drop outdated reference in the manual]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                                 | 25 +++++++++++--------------
 docs/manual/adding-packages-asciidoc.txt |  2 --
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index 78a89f6830..bc5329bde3 100644
--- a/Makefile
+++ b/Makefile
@@ -932,9 +932,6 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
-.PHONY: prepare-kconfig
-prepare-kconfig: outputmakefile
-
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
 	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
@@ -954,19 +951,19 @@ COMMON_CONFIG_ENV = \
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
@@ -974,11 +971,11 @@ config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
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
@@ -986,15 +983,15 @@ randpackageconfig allyespackageconfig allnopackageconfig: $(BUILD_DIR)/buildroot
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
@@ -1002,7 +999,7 @@ $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent
 
 update-defconfig: savedefconfig
 
-savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
index d870c51088..f9688b36c7 100644
--- a/docs/manual/adding-packages-asciidoc.txt
+++ b/docs/manual/adding-packages-asciidoc.txt
@@ -65,8 +65,6 @@ information is (assuming the document name is +foo+) :
 
 * +FOO_DEPENDENCIES+, optional, the list of packages (most probably,
   host-packages) that must be built before building this document.
-  If a hook of your document needs to access the _Kconfig_ structure,
-  you may add +prepare-kconfig+ to the list of dependencies.
 
 There are also additional hooks (see xref:hooks[] for general information
 on hooks), that a document may set to define extra actions to be done at
