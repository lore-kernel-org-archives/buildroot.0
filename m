From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 21:43:51 +0100
Subject: [Buildroot] [git commit] Make savedefconfig save to a configured
	file.
Message-ID: <20130205204625.92D399A9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ed4996346c6504241c7a2c7541fefc914790219
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: slightly tweak help text]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
index 98db8b1..d9e5f24 100644
--- a/Makefile
+++ b/Makefile
@@ -56,7 +56,7 @@ DATE:=$(shell date +%Y%m%d)
 export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
+	%_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check print-version
 
@@ -592,6 +592,8 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
 
+endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
+
 # configuration
 # ---------------------------------------------------------------------------
 
@@ -602,7 +604,12 @@ $(BUILD_DIR)/buildroot-config/%onf:
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
@@ -680,7 +687,7 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -688,13 +695,15 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
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
index 298b5e9..63ea82d 100644
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
+called +defconfig+.  If you want to save it in another place, change
+the +BR2_DEFCONFIG+ option, or call make with +make savedefconfig
+BR2_DEFCONFIG=<path-to-defconfig>+.  The usual place is
++configs/<boardname>_defconfig+. The configuration can then be rebuilt by
+running +make <boardname>_defconfig+.
 
 Alternatively, you can copy the file to any other place and rebuild with
 +make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
