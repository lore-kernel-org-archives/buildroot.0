From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue, 11 Oct 2016 13:56:13 +0100
Subject: [Buildroot] [RESEND] [PATCH v3 1/3] new package: atfirmware
In-Reply-To: <cover.1467737979.git.jpinto@synopsys.com>
References: <cover.1467737979.git.jpinto@synopsys.com>
Message-ID: <2f1d20f5e6ecdd434bdcc23fae1818f000c6a41e.1467737979.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new package to buildroot: atfirmware.
It is used to generate the necessary bootlader binaries for ARM64 boards.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
Changes v2->v3:
- atfirmware and scpfirmware were broken into 2 patches
Changes v1->v2:
- Nothing changed (just to keep up with patch set version).

 boot/Config.in                  |  1 +
 boot/atfirmware/Config.in       | 70 +++++++++++++++++++++++++++++++++
 boot/atfirmware/atfirmware.hash |  5 +++
 boot/atfirmware/atfirmware.mk   | 85 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 161 insertions(+)
 create mode 100644 boot/atfirmware/Config.in
 create mode 100644 boot/atfirmware/atfirmware.hash
 create mode 100644 boot/atfirmware/atfirmware.mk

diff --git a/boot/Config.in b/boot/Config.in
index 54760b9..ce0b50a 100644
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
-- 
1.8.1.5
