From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed,  1 Jun 2016 11:49:39 +0100
Subject: [Buildroot] [PATCH v2 1/2] new packages: atfirmware and scpfirmware
In-Reply-To: <cover.1462269854.git.jpinto@synopsys.com>
References: <cover.1462269854.git.jpinto@synopsys.com>
Message-ID: <55c2e00336ebe97905fc5ae7fcc052e6cd22f0f7.1462269854.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds 2 new packages to buildroot: atfirmware and scpfirmware.
The first is used to generate the necessary bootlader binaries for ARM boards
and the second is a hidden package that only serves to get the scp binary
from Linaro repository to be used by ATFirmware (Juno requirement).

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
Changes v1->v2:
- Nothing changed (just to keep up with patch set version).

 boot/Config.in                  |  2 +
 boot/atfirmware/Config.in       | 70 +++++++++++++++++++++++++++++++++
 boot/atfirmware/atfirmware.hash |  5 +++
 boot/atfirmware/atfirmware.mk   | 85 +++++++++++++++++++++++++++++++++++++++++
 boot/scpfirmware/Config.in      | 23 +++++++++++
 boot/scpfirmware/scpfirmware.mk | 18 +++++++++
 6 files changed, 203 insertions(+)
 create mode 100644 boot/atfirmware/Config.in
 create mode 100644 boot/atfirmware/atfirmware.hash
 create mode 100644 boot/atfirmware/atfirmware.mk
 create mode 100644 boot/scpfirmware/Config.in
 create mode 100644 boot/scpfirmware/scpfirmware.mk

diff --git a/boot/Config.in b/boot/Config.in
index 54760b9..246d6a1 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -3,6 +3,7 @@ menu "Bootloaders"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
+source "boot/atfirmware/Config.in"
 source "boot/barebox/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub/Config.in"
@@ -11,6 +12,7 @@ source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/scpfirmware/Config.in"
 source "boot/uboot/Config.in"
 source "boot/xloader/Config.in"
 
diff --git a/boot/atfirmware/Config.in b/boot/atfirmware/Config.in
new file mode 100644
index 0000000..b116144
--- /dev/null
+++ b/boot/atfirmware/Config.in
@@ -0,0 +1,70 @@
+config BR2_TARGET_ATFIRMWARE
+	bool "ARM Trusted Firmware (ATF)"
+	depends on BR2_aarch64 && BR2_TARGET_UBOOT
+	select BR2_TARGET_SCPFIRMWARE if BR2_TARGET_ATFIRMWARE_PLATFORM='juno'
+	help
+	  Enable this option if you want to build the ATF for your ARM based
+	  embedded device.
+
+if BR2_TARGET_ATFIRMWARE
+choice
+	prompt "version"
+	help
+	  Select the specific ATF version you want to use
+
+config BR2_TARGET_ATFIRMWARE_LATEST_VERSION
+	bool "v1.2"
+
+config BR2_TARGET_ATFIRMWARE_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_ATFIRMWARE_CUSTOM_GIT
+	bool "Custom Git repository"
+
+endchoice
+
+if BR2_TARGET_ATFIRMWARE_CUSTOM_TARBALL
+
+config BR2_TARGET_ATFIRMWARE_CUSTOM_TARBALL_LOCATION
+	string "URL of custom ARM Trusted Firmware tarball"
+
+endif
+
+config BR2_TARGET_ATFIRMWARE_VERSION
+	string
+	default "v1.2"	if BR2_TARGET_ATFIRMWARE_LATEST_VERSION
+	default "custom"	if BR2_TARGET_ATFIRMWARE_CUSTOM_TARBALL
+	default BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_VERSION if BR2_TARGET_ATFIRMWARE_CUSTOM_GIT
+
+config BR2_TARGET_ATFIRMWARE_CUSTOM_PATCH_DIR
+	string "Custom patch dir"
+	help
+	  If your ATF requires custom patches, add the path to the
+	  directory containing the patches here.
+
+if BR2_TARGET_ATFIRMWARE_CUSTOM_GIT
+
+config BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_REPO_URL
+	string "URL of custom Git repository"
+
+config BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_VERSION
+	string "Custom Git version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, ..
+
+endif
+
+config BR2_TARGET_ATFIRMWARE_PLATFORM
+	string "Name of ATF platform to build for"
+	help
+	  Target plaform to build for.
+	  E.G. If using ARM Juno, please type 'juno'
+
+config BR2_TARGET_ATFIRMWARE_ADDITIONAL_VARIABLES
+	string "Additional ATF build variables"
+	help
+	  Additional parameters for the ATF build
+	  E.G. 'DEBUG=1 LOG_LEVEL=20'
+
+endif
diff --git a/boot/atfirmware/atfirmware.hash b/boot/atfirmware/atfirmware.hash
new file mode 100644
index 0000000..05a90c7
--- /dev/null
+++ b/boot/atfirmware/atfirmware.hash
@@ -0,0 +1,5 @@
+# From https://github.com/ARM-software/arm-trusted-firmware/archive/v1.2.tar.gz
+# Locally calculated
+sha256 fac2c08bd74337fec2e14a98fc9f748f atfirmware-v1.2.tar.gz
+md5 fac2c08bd74337fec2e14a98fc9f748f atfirmware-v1.2.tar.gz
+
diff --git a/boot/atfirmware/atfirmware.mk b/boot/atfirmware/atfirmware.mk
new file mode 100644
index 0000000..e2744c0
--- /dev/null
+++ b/boot/atfirmware/atfirmware.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# ARM Trusted Firmware
+#
+################################################################################
+
+ATFIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ATFIRMWARE_VERSION))
+
+#package dependencies
+ATFIRMWARE_DEPENDENCIES += uboot
+
+ifeq ($(ATFIRMWARE_VERSION),custom)
+# Handle custom ATF tarballs as specified by the configuration
+ATFIRMWARE_TARBALL = $(call qstrip,$(BR2_TARGET_ATFIRMWARE_CUSTOM_TARBALL_LOCATION))
+ATFIRMWARE_SITE = $(patsubst %/,%,$(dir $(ATFIRMWARE_TARBALL)))
+ATFIRMWARE_SOURCE = $(notdir $(ATFIRMWARE_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(ATFIRMWARE_SOURCE)
+else ifeq ($(BR2_TARGET_ATFIRMWARE_CUSTOM_GIT),y)
+ATFIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_REPO_URL))
+ATFIRMWARE_SITE_METHOD = git
+endif
+
+ifneq ($(call qstrip,$(BR2_TARGET_ATFIRMWARE_CUSTOM_PATCH_DIR)),)
+define ATFIRMWARE_APPLY_CUSTOM_PATCHES
+	$(APPLY_PATCHES) $(@D) \
+		$(BR2_TARGET_ATFIRMWARE_CUSTOM_PATCH_DIR) \*.patch
+endef
+
+ATFIRMWARE_POST_PATCH_HOOKS += ATFIRMWARE_APPLY_CUSTOM_PATCHES
+endif
+
+ATFIRMWARE_INSTALL_IMAGES = YES
+
+# Automatically find the U-Boot binary
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME)),)
+ATFIRMWARE_PAYLOAD_PATH = $(BINARIES_DIR)/"u-boot.bin"
+else
+ATFIRMWARE_PAYLOAD_PATH = $(BINARIES_DIR)/$(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
+endif
+
+ATFIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ATFIRMWARE_PLATFORM))
+
+#if juno target is selected, then lets configured the expected SCP firmware binary
+ifeq ($(ATFIRMWARE_PLATFORM),juno)
+ATFIRMWARE_SCP_FIRMWARE="SCP_BL2=$(BINARIES_DIR)/scp-fw.bin"
+#configure the dependencie of scpfirmware package
+ATFIRMWARE_DEPENDENCIES += scpfirmware
+endif
+
+ATFIRMWARE_MAKE_OPTS += \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	BL33=$(call qstrip,$(ATFIRMWARE_PAYLOAD_PATH)) \
+	$(call qstrip,$(BR2_TARGET_ATFIRMWARE_ADDITIONAL_VARIABLES)) \
+	$(ATFIRMWARE_SCP_FIRMWARE) \
+	PLAT=$(ATFIRMWARE_PLATFORM) \
+	all fip
+
+define ATFIRMWARE_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) $(ATFIRMWARE_MAKE_OPTS) \
+	$(ATFIRMWARE_MAKE_TARGET)
+endef
+
+define ATFIRMWARE_INSTALL_IMAGES_CMDS
+	cp -dpf $(@D)/build/$(ATFIRMWARE_PLATFORM)/release/*.bin $(BINARIES_DIR)/ ;
+endef
+
+# Configuration ckeck
+ifeq ($(BR2_TARGET_ATFIRMWARE)$(BR_BUILDING),yy)
+
+ifeq ($(ATFIRMWARE_VERSION),custom)
+ifeq ($(call qstrip,$(BR2_TARGET_ATFIRMWARE_CUSTOM_TARBALL_LOCATION))),)
+$(error No tarball location specified. Please check BR2_TARGET_ATFIRMWARE_CUSTOM_TARBALL_LOCATION))
+endif
+endif
+
+ifeq ($(BR2_TARGET_ATFIRMWARE_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_REPO_URL)),)
+$(error No repository specified. Please check BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_REPO_URL)
+endif
+endif
+
+endif
+
+$(eval $(generic-package))
diff --git a/boot/scpfirmware/Config.in b/boot/scpfirmware/Config.in
new file mode 100644
index 0000000..f2acc24
--- /dev/null
+++ b/boot/scpfirmware/Config.in
@@ -0,0 +1,23 @@
+config BR2_TARGET_SCPFIRMWARE
+	bool
+	depends on BR2_aarch64
+
+if BR2_TARGET_SCPFIRMWARE
+
+config BR2_TARGET_SCPFIRMWARE_VERSION
+	string
+	default BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT_VERSION
+
+config BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT
+	bool
+	default "y"
+
+config BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT_REPO_URL
+	string
+	default "https://git.linaro.org/arm/vexpress-firmware.git"
+
+config BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT_VERSION
+	string
+	default "901f81977c3b367a2e0bf3d6444be302822d97a3"
+
+endif
diff --git a/boot/scpfirmware/scpfirmware.mk b/boot/scpfirmware/scpfirmware.mk
new file mode 100644
index 0000000..0508a21
--- /dev/null
+++ b/boot/scpfirmware/scpfirmware.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# System Control Processor (SCP) Firmware
+#
+################################################################################
+
+SCPFIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_SCPFIRMWARE_VERSION))
+SCPFIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_SCPFIRMWARE_CUSTOM_GIT_REPO_URL))
+SCPFIRMWARE_SITE_METHOD = git
+
+SCPFIRMWARE_INSTALL_IMAGES = YES
+
+define SCPFIRMWARE_INSTALL_IMAGES_CMDS
+	mv $(@D)/SOFTWARE/bl30.bin $(@D)/SOFTWARE/scp-fw.bin ;	\
+	cp -dpf $(@D)/SOFTWARE/scp-fw.bin $(BINARIES_DIR)/ ;
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.5
