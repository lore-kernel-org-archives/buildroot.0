From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 18:09:25 +0000
Subject: [Buildroot] [PATCH 2/8] boot/edk2: new package
In-Reply-To: <20200719180727.28202-1-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
Message-ID: <20200719180727.28202-3-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EDK2 is a modern, feature-rich, cross-platform firmware development environment
for the UEFI and PI specifications.

The initial version of this bootloader package makes it possible to build flash
device images for QEMU and ARM Fixed Virtual Platforms (FVP) in different
configurations targeting AArch64.

When building for ARM FVP there is a dependency on package/edk2-platforms for
additional platform description files.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 boot/Config.in                      |   1 +
 boot/arm-trusted-firmware/Config.in |   2 +-
 boot/edk2/Config.in                 |  59 +++++++++++++++
 boot/edk2/edk2.hash                 |   2 +
 boot/edk2/edk2.mk                   | 111 ++++++++++++++++++++++++++++
 5 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 boot/edk2/Config.in
 create mode 100644 boot/edk2/edk2.hash
 create mode 100644 boot/edk2/edk2.mk

diff --git a/boot/Config.in b/boot/Config.in
index b3adbfc8bc..1999d1ef7a 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -5,6 +5,7 @@ source "boot/at91bootstrap/Config.in"
 source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
+source "boot/edk2/Config.in"
 source "boot/barebox/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1ca5d7ea1..fdb469bb5e 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
 	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A) && \
-		   BR2_TARGET_UBOOT
+           BR2_TARGET_UBOOT
 	help
 	  Enable this option if you want to build the ATF for your ARM
 	  based embedded device.
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
new file mode 100644
index 0000000000..76b47f2fc5
--- /dev/null
+++ b/boot/edk2/Config.in
@@ -0,0 +1,59 @@
+config BR2_TARGET_EDK2
+	bool "EDK2"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	help
+	  EDK II is a modern, feature-rich, cross-platform firmware
+	  development environment for the UEFI and PI specifications.
+
+	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
+
+if BR2_TARGET_EDK2
+
+config BR2_TARGET_EDK2_DEBUG
+    bool "Debug build"
+    help
+      Use the debug build type.
+
+choice
+    prompt "Platform"
+    default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
+
+config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
+	bool "ARM Virt Qemu (flash)"
+	help
+	  Configuration for QEMU targeting the Virt machine.
+	  This platform will only boot from flash address 0x0.
+	  It should therefore be used as the first bootloader.
+
+config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
+	bool "ARM Virt Qemu (kernel)"
+	help
+	  Configuration for QEMU targeting the Virt machine.
+	  This platform can boot from either flash address 0x0 or via
+	  the Linux boot protocol. It can therefore be loaded by a
+	  previous bootloader like ARM Trusted Firmware or OP-TEE.
+
+config BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
+	bool "ARM VExpress FVP Aarch64"
+	select BR2_PACKAGE_HOST_EDK2_PLATFORMS
+	help
+	  Configuration for ARM Versatile Express targeting the
+	  Fixed Virtual Platform (FVP) AArch64 platform.
+
+config BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA
+	bool "QEMU SBSA"
+	select BR2_PACKAGE_HOST_EDK2_PLATFORMS
+	select BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	help
+	  Configuration for QEMU targeting the SBSA platform.
+
+	  Note that if you are building for the QEMU SBSA platform you
+	  should not configure EDK2 as the BL33 payload for ATF.
+	  The EDK2 build system itself will package the ATF binaries.
+
+endchoice
+
+endif
+
+comment "EDK2 needs a toolchain w/ gcc >= 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
new file mode 100644
index 0000000000..e9c7ac06f1
--- /dev/null
+++ b/boot/edk2/edk2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 251520730b53ec7d686fb07aabf0bdec0d8721ac3ca59fd3e6df5dde64f1d715  edk2-edk2-stable202005.tar.gz
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
new file mode 100644
index 0000000000..050b5703ad
--- /dev/null
+++ b/boot/edk2/edk2.mk
@@ -0,0 +1,111 @@
+EDK2_VERSION = edk2-stable202005
+EDK2_SITE = https://github.com/tianocore/edk2
+EDK2_SITE_METHOD = git
+EDK2_LICENSE = BSD-2-Clause
+EDK2_LICENSE_FILE = License.txt
+EDK2_DEPENDENCIES = host-python3 host-acpica
+
+# The EDK2 build system is rather special, so we're resorting to using its
+# own Git submodules in order to include certain build dependencies.
+EDK2_GIT_SUBMODULES = YES
+
+EDK2_INSTALL_IMAGES = YES
+
+ifeq ($(BR2_aarch64),y)
+EDK2_ARCH = AARCH64
+endif
+
+ifeq ($(BR2_TARGET_EDK2_DEBUG),y)
+EDK2_BUILD_TYPE = DEBUG
+else
+EDK2_BUILD_TYPE = RELEASE
+endif
+
+# EDk2 can be built with CLANG or GCC >= 5. But since Buildroot currently
+# only support GCC toolchains this option is assumed for now.
+EDK2_TOOLCHAIN_TYPE = GCC5
+
+# Packages path.
+#
+# The EDK2 build system will, for some platforms, depend on binary outputs
+# from other bootloader packages. Those dependencies need to be in the path
+# for the EDK2 build system, so we define this special directory here.
+EDK2_OUTPUT_BASE = $(BINARIES_DIR)/edk2
+
+ifeq ($(BR2_PACKAGE_HOST_EDK2_PLATFORMS),y)
+EDK2_PACKAGES_PATH = $(@D):$(EDK2_OUTPUT_BASE):$(BUILD_DIR)/host-edk2-platforms-$(EDK2_PLATFORMS_VERSION)
+else
+EDK2_PACKAGES_PATH = $(@D):$(EDK2_OUTPUT_BASE)
+endif
+
+# Platform name configuration.
+#
+# Defining EDK2_FD_NAME is important. This variable may be used by other
+# bootloaders (e.g. ATF) as they build firmware packages based on this file.
+#
+# However, the case of the QEMU SBSA platform is a bit unique as there are
+# different implicit assumptions on how this firmware should be packaged
+# and executed with ATF and the SBSA reference machine for QEMU.
+
+ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU),y)
+EDK2_PACKAGE_NAME = ArmVirtPkg
+EDK2_PLATFORM_NAME = ArmVirtQemu
+EDK2_FD_NAME = QEMU_EFI
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL),y)
+EDK2_PACKAGE_NAME = ArmVirtPkg
+EDK2_PLATFORM_NAME = ArmVirtQemuKernel
+EDK2_FD_NAME = QEMU_EFI
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
+EDK2_DEPENDENCIES += host-edk2-platforms
+EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
+EDK2_PLATFORM_NAME = ArmVExpress-FVP-AArch64
+EDK2_FD_NAME = FVP_AARCH64_EFI
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
+EDK2_DEPENDENCIES += host-edk2-platforms arm-trusted-firmware
+EDK2_PACKAGE_NAME = Platform/Qemu/SbsaQemu
+EDK2_PLATFORM_NAME = SbsaQemu
+EDK2_PRE_CONFIGURE_HOOKS += EDK2_OUTPUT_QEMU_SBSA
+endif
+
+# This will create the package path structure that EDK2 expect when building
+# flash devices for QEMU SBSA.
+define EDK2_OUTPUT_QEMU_SBSA
+	mkdir -p $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa && \
+	ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa/
+endef
+
+# Make build variables.
+EDK2_MAKE_OPTS += -C $(@D)/BaseTools
+EDK2_MAKE_TARGETS += \
+$(EDK2_TOOLCHAIN_TYPE)_$(EDK2_ARCH)_PREFIX="$(TARGET_CROSS)" \
+build -a $(EDK2_ARCH) -t $(EDK2_TOOLCHAIN_TYPE) -b $(EDK2_BUILD_TYPE) \
+-p $(EDK2_PACKAGE_NAME)/$(EDK2_PLATFORM_NAME).dsc $(EDK2_BUILD_OPTS) all
+
+define EDK2_BUILD_CMDS
+	export WORKSPACE=$(@D) && \
+	export PACKAGES_PATH=$(EDK2_PACKAGES_PATH) && \
+	export PYTHON_COMMAND=$(HOST_DIR)/bin/python3 && \
+	export IASL_PREFIX=$(BUILD_DIR)/host-acpica-$(ACPICA_VERSION)/generate/unix/bin/ && \
+	mkdir -p $(EDK2_OUTPUT_BASE) && \
+	source $(@D)/edksetup.sh && \
+	$(TARGET_MAKE_ENV) $(MAKE) $(EDK2_MAKE_OPTS) && $(EDK2_MAKE_TARGETS)
+endef
+
+# Location of the compiled flash device files is not consistent between
+# platform descriptions. So this install command have to test for the two
+# different locations.
+EDK2_FV1 = $(@D)/Build/$(EDK2_PLATFORM_NAME)/$(EDK2_BUILD_TYPE)_$(EDK2_TOOLCHAIN_TYPE)/FV
+EDK2_FV2 = $(@D)/Build/$(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)/$(EDK2_BUILD_TYPE)_$(EDK2_TOOLCHAIN_TYPE)/FV
+
+define EDK2_INSTALL_IMAGES_CMDS
+	if test -d $(EDK2_FV1); then \
+		cp $(EDK2_FV1)/*.fd $(BINARIES_DIR)/; \
+	elif test -d $(EDK2_FV2); then \
+		cp $(EDK2_FV2)/*.fd $(BINARIES_DIR)/; \
+	fi
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
