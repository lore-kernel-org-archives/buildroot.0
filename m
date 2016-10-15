From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:13:34 +0200
Subject: [Buildroot] [git commit] arm-trusted-firmware: new package
Message-ID: <20161015121350.0720A80746@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5a62990427284819d2f52607aefe2044eb4df6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
[Thomas:
 - Rename the package from atfirmware to arm-trusted-firmware, in order
   to match upstream.
 - Remove option to apply custom patches. We no longer add such options,
   and use the global patch directory instead.
 - Rename the repo URL/version options, in order to not be Git specific,
   in case support for fetching from other VCS is added later. This is
   consistent with how other bootloaders handle this.
 - Add license information.
 - Do not add a weird dependency on the vexpress-firmware package in
   Config.in. Instead, simply use it if it's available. Of course, some
   configurations (such as the juno configuration) will fail to build if
   vexpress-image is not enabled, but it's the responsibility of the
   user to create a config that builds.
 - Simplify misc aspects in the .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in                                     |  1 +
 boot/arm-trusted-firmware/Config.in                | 65 ++++++++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  3 +
 boot/arm-trusted-firmware/arm-trusted-firmware.mk  | 69 ++++++++++++++++++++++
 4 files changed, 138 insertions(+)

diff --git a/boot/Config.in b/boot/Config.in
index 6ffacc6..273c1c7 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -4,6 +4,7 @@ source "boot/afboot-stm32/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
+source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub/Config.in"
diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
new file mode 100644
index 0000000..2df8267
--- /dev/null
+++ b/boot/arm-trusted-firmware/Config.in
@@ -0,0 +1,65 @@
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	bool "ARM Trusted Firmware (ATF)"
+	depends on BR2_aarch64 && BR2_TARGET_UBOOT
+	help
+	  Enable this option if you want to build the ATF for your ARM
+	  based embedded device.
+
+	  https://github.com/ARM-software/arm-trusted-firmware
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE
+choice
+	prompt "ATF Version"
+	help
+	  Select the specific ATF version you want to use
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	bool "v1.2"
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
+	bool "Custom Git repository"
+
+endchoice
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION
+	string "URL of custom ATF tarball"
+
+endif
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
+	string
+	default "v1.2"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
+	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
+				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, ..
+
+endif
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
+	string "ATF platform"
+	help
+	  Target plaform to build for.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
+	string "Additional ATF build variables"
+	help
+	  Additional parameters for the ATF build
+	  E.G. 'DEBUG=1 LOG_LEVEL=20'
+
+endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000..e048e01
--- /dev/null
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 cbdd9b770ec1ab4933fc7f9f520daea5a364bb4dc964820fb017a0cf8c7df556 arm-trusted-firmware-v1.2.tar.gz
+md5 fac2c08bd74337fec2e14a98fc9f748f arm-trusted-firmware-v1.2.tar.gz
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
new file mode 100644
index 0000000..5acfab3
--- /dev/null
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# arm-trusted-firmware
+#
+################################################################################
+
+ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
+ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3c
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.md
+
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
+
+ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
+# Handle custom ATF tarballs as specified by the configuration
+ARM_TRUSTED_FIRMWARE_TARBALL = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
+ARM_TRUSTED_FIRMWARE_SITE = $(patsubst %/,%,$(dir $(ARM_TRUSTED_FIRMWARE_TARBALL)))
+ARM_TRUSTED_FIRMWARE_SOURCE = $(notdir $(ARM_TRUSTED_FIRMWARE_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
+else ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y)
+ARM_TRUSTED_FIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL))
+ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
+else
+ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
+endif
+
+ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
+
+ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
+
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	BL33=$(BINARIES_DIR)/u-boot.bin \
+	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
+	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
+	all fip
+
+ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
+endif
+
+define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
+			$(ARM_TRUSTED_FIRMWARE_MAKE_TARGET)
+endef
+
+define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
+	cp -dpf $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release/*.bin $(BINARIES_DIR)/
+endef
+
+# Configuration ckeck
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR_BUILDING),yy)
+
+ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
+ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))),)
+$(error No tarball location specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
+endif
+endif
+
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL)),)
+$(error No repository specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL)
+endif
+endif
+
+endif
+
+$(eval $(generic-package))
