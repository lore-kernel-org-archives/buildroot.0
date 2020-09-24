From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 24 Sep 2020 14:29:10 -0500
Subject: [Buildroot] [PATCH v2 1/3] package/uboot-tools: migrate
 BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
In-Reply-To: <20200924192912.51913-1-matthew.weber@rockwellcollins.com>
References: <20200924192912.51913-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Migrating the support for this feature to uboot-tools to gain the
ability to build env files when BR2_TARGET_UBOOT isn't selected.

Note: This patch creates a circular dependency with uboot until the
similar migration patch is merged for uboot scripts

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes 1 -> 2
[Arnout
 - Config legacy entries for strings and cleaned up bool entries to
   have all the selects required
 - Did some renaming in the makefile
 - Used env files directly
 - Added build check that env file existed when !uboot but env img
   creation is enabled
 - Added Note in this commit message about the circular dependency
 - Fixed dependency on uboot to be a host dependency
---
 Config.in.legacy                   | 42 ++++++++++++++++++++++
 boot/uboot/Config.in               | 43 -----------------------
 boot/uboot/uboot.mk                | 25 -------------
 package/uboot-tools/Config.in.host | 56 ++++++++++++++++++++++++++++--
 package/uboot-tools/uboot-tools.mk | 36 +++++++++++++++++++
 5 files changed, 132 insertions(+), 70 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ae583b912f..213984ac9c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,48 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_TARGET_UBOOT_ENVIMAGE
+	bool "u-boot env generation was moved"
+	select BR2_LEGACY
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
+	help
+	  Migrated U-Boot env generation to uboot-tools
+
+config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
+	string "The uboot env image source string has been renamed"
+	help
+	  Migrated U-Boot env generation to uboot-tools.
+	  New option is named BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE
+
+config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE_WRAP
+	bool
+	default y if BR2_TARGET_UBOOT_ENVIMAGE_SOURCE != ""
+	select BR2_LEGACY
+
+# Note: BR2_TARGET_UBOOT_ENVIMAGE_SOURCE is still referenced from package/uboot-tools/Config.in
+
+config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
+	string "The uboot env image size string has been renamed"
+	help
+	  Migrated U-Boot env generation to uboot-tools.
+	  New option is named BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE
+
+config BR2_TARGET_UBOOT_ENVIMAGE_SIZE_WRAP
+	bool
+	default y if BR2_TARGET_UBOOT_ENVIMAGE_SIZE != ""
+	select BR2_LEGACY
+
+# Note: BR2_TARGET_UBOOT_ENVIMAGE_SIZE is still referenced from package/uboot-tools/Config.in
+
+config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
+	bool "u-boot env generation was moved"
+	select BR2_LEGACY
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT
+	help
+	  Migrated U-Boot env generation to uboot-tools
+
 config BR2_PACKAGE_GQVIEW
 	bool "gqview package was removed"
 	select BR2_LEGACY
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a87a642581..668806dc50 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -533,49 +533,6 @@ config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
 	  In either case the resulting file will be given a .crc
 	  extension.
 
-menuconfig BR2_TARGET_UBOOT_ENVIMAGE
-	bool "Environment image"
-	help
-	  Generate a valid binary environment image from a text file
-	  describing the key=value pairs of the environment.
-
-	  The environment image will be called uboot-env.bin.
-
-if BR2_TARGET_UBOOT_ENVIMAGE
-
-config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
-	string "Source files for environment"
-	help
-	  Text files describing the environment. Files should have
-	  lines of the form var=value, one per line. Blank lines and
-	  lines starting with a # are ignored.
-
-	  Multiple source files are concatenated in the order listed.
-
-	  Leave empty to generate image from compiled-in env.
-
-config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
-	string "Size of environment"
-	help
-	  Size of envronment, can be prefixed with 0x for hexadecimal
-	  values.
-
-config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
-	bool "Environment has two copies"
-	help
-	  Some platforms define in their U-Boot configuration that the
-	  U-Boot environment should be duplicated in two locations (for
-	  extra safety). Check your U-Boot configuration for the
-	  CONFIG_ENV_ADDR_REDUND and CONFIG_ENV_SIZE_REDUND settings to
-	  see if this is the case for your platform.
-
-	  If it is the case, then you should enable this option to
-	  ensure that the U-Boot environment image generated by
-	  Buildroot is compatible with the "redundant environment"
-	  mechanism of U-Boot.
-
-endif # BR2_TARGET_UBOOT_ENVIMAGE
-
 config BR2_TARGET_UBOOT_BOOT_SCRIPT
 	bool "Generate a U-Boot boot script"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1831466780..9dbd06b64b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -312,21 +312,6 @@ define UBOOT_BUILD_OMAP_IFT
 		-c $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))
 endef
 
-ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
-UBOOT_GENERATE_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
-define UBOOT_GENERATE_ENV_IMAGE
-	$(if $(UBOOT_GENERATE_ENV_FILE), \
-		cat $(UBOOT_GENERATE_ENV_FILE), \
-		CROSS_COMPILE="$(TARGET_CROSS)" $(@D)/scripts/get_default_envs.sh $(@D)) \
-		>$(@D)/buildroot-env.txt
-	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
-		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
-		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
-		-o $(BINARIES_DIR)/uboot-env.bin \
-		$(@D)/buildroot-env.txt
-endef
-endif
-
 define UBOOT_INSTALL_IMAGES_CMDS
 	$(foreach f,$(UBOOT_BINS), \
 			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
@@ -338,7 +323,6 @@ define UBOOT_INSTALL_IMAGES_CMDS
 			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
 		)
 	)
-	$(UBOOT_GENERATE_ENV_IMAGE)
 	$(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
 		$(MKIMAGE) -C none -A $(MKIMAGE_ARCH) -T script \
 			-d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
@@ -443,15 +427,6 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
 endef
 
-ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
-ifeq ($(BR_BUILDING),y)
-ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
-$(error Please provide U-Boot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
-endif
-endif
-UBOOT_DEPENDENCIES += host-uboot-tools
-endif
-
 ifeq ($(BR2_TARGET_UBOOT_BOOT_SCRIPT),y)
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)),)
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 52a4c2ec30..a10835c589 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -37,6 +37,58 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	  public key is stored in a non-volatile place, any image can
 	  be verified in this way.
 
-endif
+endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
 
-endif
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
+	bool "Environment image"
+	help
+	  Generate a valid binary environment image from a text file
+	  describing the key=value pairs of the environment.
+
+	  This option can be useful to build enviornment configurations
+	  as part of a Linux / rootfs only defconfig instead of using
+	  post scripts. This supports a hardware use case of a single
+	  bootloader only defconfig but multiple Linux / rootfs
+	  defconfigs with different boot environments.
+
+	  The environment image will be called uboot-env.bin.
+
+if BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
+
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE
+	string "Source files for environment"
+	default BR2_TARGET_UBOOT_ENVIMAGE_SOURCE if BR2_TARGET_UBOOT_ENVIMAGE_SOURCE != "" # legacy
+	help
+	  Text files describing the environment. Files should have
+	  lines of the form var=value, one per line. Blank lines and
+	  lines starting with a # are ignored.
+
+	  Multiple source files are concatenated in the order listed.
+
+	  Leave empty to generate image from compiled-in env if a U-boot
+	  target build is configured (BR2_TARGET_UBOOT)
+
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE
+	string "Size of environment"
+	default BR2_TARGET_UBOOT_ENVIMAGE_SIZE if BR2_TARGET_UBOOT_ENVIMAGE_SIZE != "" # legacy
+	help
+	  Size of envronment, can be prefixed with 0x for hexadecimal
+	  values.
+
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT
+	bool "Environment has two copies"
+	help
+	  Some platforms define in their U-Boot configuration that the
+	  U-Boot environment should be duplicated in two locations (for
+	  extra safety). Check your U-Boot configuration for the
+	  CONFIG_ENV_ADDR_REDUND and CONFIG_ENV_SIZE_REDUND settings to
+	  see if this is the case for your platform.
+
+	  If it is the case, then you should enable this option to
+	  ensure that the U-Boot environment image generated by
+	  Buildroot is compatible with the "redundant environment"
+	  mechanism of U-Boot.
+
+endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
+
+endif # BR2_PACKAGE_HOST_UBOOT_TOOLS
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index a06c25998f..0cb58ef70b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -110,10 +110,46 @@ define HOST_UBOOT_TOOLS_BUILD_CMDS
 	$(BR2_MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) tools-only
 endef
 
+ifeq ($(BR2_TARGET_UBOOT),y)
+define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+		$(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
+		$(UBOOT_SRCDIR) \
+		>$(@D)/boot-env-defaults.txt
+endef
+HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
+endif
+
+ifneq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),)
+UBOOT_TOOLS_GENERATE_ENV_FILE = $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE))
+define HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE
+	$(HOST_DIR)/bin/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
+		$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT),-r) \
+		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
+		-o $(BINARIES_DIR)/uboot-env.bin \
+		$(if $(UBOOT_TOOLS_GENERATE_ENV_FILE), \
+		$(UBOOT_TOOLS_GENERATE_ENV_FILE), \
+		$(@D)/boot-env-defaults.txt)
+endef
+
+ifeq ($(BR_BUILDING),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE)),)
+$(error Please provide U-Boot environment size (BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE setting))
+endif
+ifeq ($(BR2_TARGET_UBOOT),)
+ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE),)
+$(error Please provide U-Boot environment file BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE setting))
+endif
+endif #BR2_TARGET_UBOOT
+endif #BR_BUILDING
+endif #BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
+
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/bin/mkimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
+	$(HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS)
+	$(HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE)
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
