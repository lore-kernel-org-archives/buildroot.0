From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  5 Feb 2013 18:16:02 +0100
Subject: [Buildroot] [PATCH 4/4] Make savedefconfig save to a configured
	file.
In-Reply-To: <cover.1360084128.git.arnout@mind.be>
References: <cover.1360084128.git.arnout@mind.be>
Message-ID: <41e27bc2d2881606d1da299f6056d24bc9d34e78.1360084128.git.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Store BR2_DEFCONFIG in .config, and use it to update the original input
defconfig file after updating the configuration.  When a config is
created by using the BR2_DEFCONFIG=... option, this is saved in the
.config file; later runs of savedefconfig will update that same location.
It is also possible to configure this place in the interactive
configuration.

The BR2_DEFCONFIG value itself is not saved into the generated
defconfig, since Kconfig considers it at its default. This is
intentional, to avoid hard-coding an absolute path in the defconfig.
It will anyway be set again when the defconfig is used with the
'make BR2_DEFCONFIG=... defconfig' command.

As a side-effect of this change, the *config options have been moved out
of the BR2_HAVE_DOT_CONFIG condition.  This doesn't make any functional
difference, because the .config is still not read for the *config targets.
However, the defconfig and savedefconfig targets do need to include
.config now, which makes them slightly slower.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v4: Rebased against master.

v3: replaced foo_defconfig documentation with BR2_DEFCONFIG.
---
 Config.in                       |   12 ++++++++++++
 Makefile                        |   17 +++++++++++++----
 docs/manual/customize-store.txt |   10 ++++++----
 3 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/Config.in b/Config.in
index af77a83..4929a80 100644
--- a/Config.in
+++ b/Config.in
@@ -22,6 +22,18 @@ config BR2_HOSTARCH_NEEDS_IA32_LIBS
 
 source "arch/Config.in"
 
+config BR2_DEFCONFIG_FROM_ENV
+	string
+	option env="BR2_DEFCONFIG"
+
+config BR2_DEFCONFIG
+	string "Location to save buildroot config"
+	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
+	default "$(CONFIG_DIR)/defconfig"
+	help
+	  When running 'make savedefconfig', the defconfig file will be saved
+	  in this location.
+
 menu "Build options"
 
 menu "Commands"
diff --git a/Makefile b/Makefile
index ac59071..1476d97 100644
--- a/Makefile
+++ b/Makefile
@@ -56,7 +56,7 @@ DATE:=$(shell date +%Y%m%d)
 export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
+	%_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check print-version
 
@@ -594,6 +594,8 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
 
+endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
+
 # configuration
 # ---------------------------------------------------------------------------
 
@@ -604,7 +606,12 @@ $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
 	$(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
 
+DEFCONFIG = $(call qstrip,$(BR2_DEFCONFIG))
+
+# We don't want to fully expand BR2_DEFCONFIG here, so Kconfig will
+# recognize that if it's still at its default $(CONFIG_DIR)/defconfig
 COMMON_CONFIG_ENV = \
+	BR2_DEFCONFIG='$(call qstrip,$(value BR2_DEFCONFIG))' \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
@@ -682,7 +689,7 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -690,13 +697,15 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --savedefconfig=$(CONFIG_DIR)/defconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< \
+		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
+		$(CONFIG_CONFIG_IN)
 
 # check if download URLs are outdated
 source-check:
 	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
 
-endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
+.PHONY: defconfig savedefconfig
 
 #############################################################
 #
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 5d004ea..bf7bd14 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -20,13 +20,15 @@ Buildroot configuration
 ^^^^^^^^^^^^^^^^^^^^^^^
 
 For storing the buildroot configuration itself, buildroot offers the
-following command: +make savedefconfig+
+following command: +make savedefconfig+.
 
 This strips the buildroot configuration down by removing configuration
 options that are@their default value. The result is stored in a file
-called +defconfig+. Copy this file to +foo_defconfig+ in the +configs+
-directory. The configuration can then be rebuilt by running
-+make foo_defconfig+
+called +defconfig+.  If you want to save it in another place, update set
+the +BR2_DEFCONFIG+ option, or call make with +make savedefconfig
+BR2_DEFCONFIG=<path-to-defconfig>+.  The usual place is
++configs/<boardname>_defconfig+. The configuration can then be rebuilt by
+running +make <boardname>_defconfig+.
 
 Alternatively, you can copy the file to any other place and rebuild with
 +make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
-- 
1.7.10.4
