From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2012 01:45:31 +0200
Subject: [Buildroot] [PATCH 10/10] Make savedefconfig save to a configured
	file.
In-Reply-To: <1350776731-8467-1-git-send-email-arnout@mind.be>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
Message-ID: <1350776731-8467-11-git-send-email-arnout@mind.be>
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
---
 Config.in                       |   12 ++++++++++++
 Makefile                        |   17 +++++++++++++----
 docs/manual/customize-store.txt |    1 +
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index dab7787..670ce84 100644
--- a/Config.in
+++ b/Config.in
@@ -16,6 +16,18 @@ config BR2_HOSTARCH
 
 source "target/Config.in.arch"
 
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
index e257c61..f6b8ef8 100644
--- a/Makefile
+++ b/Makefile
@@ -56,7 +56,7 @@ DATE:=$(shell date +%Y%m%d)
 export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
+	%_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check print-version
 
@@ -556,6 +556,8 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
 
+endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
+
 # configuration
 # ---------------------------------------------------------------------------
 
@@ -566,7 +568,12 @@ $(BUILD_DIR)/buildroot-config/%onf:
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
@@ -638,7 +645,7 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -646,13 +653,15 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
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
index 6deed49..92d5378 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -156,6 +156,7 @@ the buildroot tree).
    * +BR2_TOOLCHAIN_CTNG_CONFIG+
    * +BR2_UCLIBC_CONFIG+
    * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
+1. Set +BR2_DEFCONFIG+ to +<path-to-board-directory>/buildroot.config+
 1. Create +<path-to-board-directory>/fs-overlay+ and fill it
    with additional files you need on your rootfs, e.g.
    +<path-to-board-directory>/etc/inittab+. Set +BR2_ROOTFS_OVERLAY+
-- 
1.7.10.4
