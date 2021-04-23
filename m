From: Eugen Hristev <eugen.hristev@microchip.com>
Date: Fri, 23 Apr 2021 10:08:22 +0300
Subject: [Buildroot] [PATCH] boot: introduce at91bootstrap4
Message-ID: <20210423070822.1351638-1-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce new bootloader package for the next generation
of at91bootstrap, at91bootstrap4

AT91Bootstrap4 only supports devices: sam9x60, sama5d2, sama5d3,
sama5d4, sama7g5.

Based on at91bootstrap3 recipes.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 boot/Config.in                          |   1 +
 boot/at91bootstrap4/Config.in           | 103 ++++++++++++++++++++++++
 boot/at91bootstrap4/at91bootstrap4.hash |   3 +
 boot/at91bootstrap4/at91bootstrap4.mk   | 103 ++++++++++++++++++++++++
 4 files changed, 210 insertions(+)
 create mode 100644 boot/at91bootstrap4/Config.in
 create mode 100644 boot/at91bootstrap4/at91bootstrap4.hash
 create mode 100644 boot/at91bootstrap4/at91bootstrap4.mk

diff --git a/boot/Config.in b/boot/Config.in
index b3adbfc8bc..2e7eea542c 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -3,6 +3,7 @@ menu "Bootloaders"
 source "boot/afboot-stm32/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91bootstrap3/Config.in"
+source "boot/at91bootstrap4/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
diff --git a/boot/at91bootstrap4/Config.in b/boot/at91bootstrap4/Config.in
new file mode 100644
index 0000000000..500cf7727f
--- /dev/null
+++ b/boot/at91bootstrap4/Config.in
@@ -0,0 +1,103 @@
+config BR2_TARGET_AT91BOOTSTRAP4
+	bool "AT91 Bootstrap 4"
+	depends on BR2_arm926t || BR2_cortex_a5 || BR2_cortex_a7
+	help
+	  AT91Bootstrap is a first level bootloader for the Microchip AT91
+	  devices. It integrates algorithms for:
+	  - Device initialization such as clock configuration, PIO
+	    settings...
+	  - Peripheral drivers such as PIO, PMC or SDRAMC...
+	  - Physical media algorithm such as DataFlash, NandFlash, NOR
+	    Flash...
+
+	  https://www.linux4sam.org/bin/view/Linux4SAM/AT91Bootstrap
+
+if BR2_TARGET_AT91BOOTSTRAP4
+
+choice
+
+	prompt "AT91 Bootstrap 4 version"
+
+config BR2_TARGET_AT91BOOTSTRAP4_LATEST_VERSION
+	bool "4.0.0-rc1"
+
+config BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  This option allows Buildroot to get the AT91 Bootstrap 4
+	  source code from a Git repository.
+
+config BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+endchoice
+
+config BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL_LOCATION
+	string "URL of custom AT91Bootstrap tarball"
+	depends on BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL
+
+if BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_GIT
+
+config BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_TARGET_AT91BOOTSTRAP4_VERSION
+	string
+	default "v4.0.0-rc1" if BR2_TARGET_AT91BOOTSTRAP4_LATEST_VERSION
+	default BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_REPO_VERSION \
+		if BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_GIT
+	default "custom"	if BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL
+
+config BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_PATCH_DIR
+	string "custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named at91bootstrap4-<something>.patch.
+
+	  Most users may leave this empty
+
+#
+# Configuration selection
+#
+
+choice
+	prompt "AT91 Bootstrap 4 configuration"
+	default BR2_TARGET_AT91BOOTSTRAP4_USE_DEFCONFIG
+
+config BR2_TARGET_AT91BOOTSTRAP4_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_TARGET_AT91BOOTSTRAP4_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_TARGET_AT91BOOTSTRAP4_DEFCONFIG
+	string "Defconfig name"
+	depends on BR2_TARGET_AT91BOOTSTRAP4_USE_DEFCONFIG
+	help
+	  Name of the at91bootstrap4 defconfig file to use, without the
+	  trailing _defconfig.  The defconfig is located at
+	  configs/ in the at91bootstrap4 tree.
+
+config BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_AT91BOOTSTRAP4_USE_CUSTOM_CONFIG
+	help
+	  Path to the at91bootstrap4 configuration file
+
+config BR2_TARGET_AT91BOOTSTRAP4_NEEDS_PYTHON3
+	bool "AT91Bootstrap4 requires host Python 3.x for NAND/PMECC scripts"
+	help
+	  Host Python 3.x needs to be installed to use the NAND/PMECC python scripts
+
+endif # BR2_TARGET_AT91BOOTSTRAP4
diff --git a/boot/at91bootstrap4/at91bootstrap4.hash b/boot/at91bootstrap4/at91bootstrap4.hash
new file mode 100644
index 0000000000..0408e73190
--- /dev/null
+++ b/boot/at91bootstrap4/at91bootstrap4.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6f0bab65b134cf3f5df7d5bf3b902c1217cba2f25aafb983350cd631a73db60d  at91bootstrap4-v4.0.0-rc1.tar.gz
+sha256  fd7a1ce5719bb7abf5e289da2e0ea8c933af3ba0f6ad03dbdbd2b7f54a77498a  main.c
diff --git a/boot/at91bootstrap4/at91bootstrap4.mk b/boot/at91bootstrap4/at91bootstrap4.mk
new file mode 100644
index 0000000000..0b46af767f
--- /dev/null
+++ b/boot/at91bootstrap4/at91bootstrap4.mk
@@ -0,0 +1,103 @@
+################################################################################
+#
+# at91bootstra44
+#
+################################################################################
+
+AT91BOOTSTRAP4_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_VERSION))
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_NEEDS_PYTHON3),y)
+AT91BOOTSTRAP3_DEPENDENCIES += host-python3
+endif
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL),y)
+AT91BOOTSTRAP4_TARBALL = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL_LOCATION))
+AT91BOOTSTRAP4_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP4_TARBALL)))
+AT91BOOTSTRAP4_SOURCE = $(notdir $(AT91BOOTSTRAP4_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP4_SOURCE)
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_GIT),y)
+AT91BOOTSTRAP4_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_REPO_URL))
+AT91BOOTSTRAP4_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP4_SOURCE)
+else
+AT91BOOTSTRAP4_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP4_VERSION))
+endif
+
+AT91BOOTSTRAP4_LICENSE = Microchip License
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_LATEST_VERSION),y)
+AT91BOOTSTRAP4_LICENSE_FILES = main.c
+endif
+
+AT91BOOTSTRAP4_CPE_ID_VENDOR = linux4sam
+AT91BOOTSTRAP4_CPE_ID_PRODUCT = at91bootstrap
+
+AT91BOOTSTRAP4_INSTALL_IMAGES = YES
+AT91BOOTSTRAP4_INSTALL_TARGET = NO
+
+AT91BOOTSTRAP4_CUSTOM_PATCH_DIR = \
+	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_PATCH_DIR))
+
+AT91BOOTSTRAP4_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
+
+ifneq ($(AT91BOOTSTRAP4_CUSTOM_PATCH_DIR),)
+define AT91BOOTSTRAP4_APPLY_CUSTOM_PATCHES
+	$(APPLY_PATCHES) $(@D) $(AT91BOOTSTRAP4_CUSTOM_PATCH_DIR) \*.patch
+endef
+
+AT91BOOTSTRAP4_POST_PATCH_HOOKS += AT91BOOTSTRAP4_APPLY_CUSTOM_PATCHES
+endif
+
+define AT91BOOTSTRAP4_BUILD_CMDS
+	$(MAKE) $(AT91BOOTSTRAP4_MAKE_OPTS) -C $(@D)
+endef
+
+define AT91BOOTSTRAP4_INSTALL_IMAGES_CMDS
+	cp $(@D)/build/binaries/*.bin $(BINARIES_DIR)
+endef
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_USE_DEFCONFIG),y)
+AT91BOOTSTRAP4_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_USE_CUSTOM_CONFIG),y)
+AT91BOOTSTRAP4_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_CONFIG_FILE))
+endif
+
+AT91BOOTSTRAP4_KCONFIG_EDITORS = menuconfig xconfig gconfig
+AT91BOOTSTRAP4_KCONFIG_OPTS = $(AT91BOOTSTRAP4_MAKE_OPTS)
+
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR_BUILDING),y)
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_USE_DEFCONFIG),y)
+# We must use the user-supplied kconfig value, because
+# AT91BOOTSTRAP4_KCONFIG_DEFCONFIG will at least contain
+# the trailing _defconfig
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_DEFCONFIG)),)
+$(error No at91bootstrap4 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP4_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_USE_CUSTOM_CONFIG),y)
+ifeq ($(AT91BOOTSTRAP4_KCONFIG_FILE),)
+$(error No at91bootstrap4 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_CONFIG_FILE setting)
+endif
+endif
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_REPO_URL)),)
+$(error No custom at91bootstrap4 repository URL specified. Check your BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_REPO_URL setting)
+endif
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_REPO_VERSION)),)
+$(error No custom at91bootstrap4 repository version specified. Check your BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_REPO_VERSION setting)
+endif
+endif
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL_LOCATION)),)
+$(error No custom AT91Bootstrap4 tarball specified. Check your BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL_LOCATION setting)
+endif # qstrip BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL_LOCATION
+endif # BR2_TARGET_AT91BOOTSTRAP4_CUSTOM_TARBALL
+
+endif # BR_BUILDING
+
+$(eval $(kconfig-package))
-- 
2.25.1
