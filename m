From: D. Olsson <hi@senzilla.io>
Date: Sun, 26 Jul 2020 10:06:50 +0000
Subject: [Buildroot] [PATCH v2 2/6] boot/edk2: new package
Message-ID: <20200726100541.7710-3-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Dick Olsson <hi@senzilla.io>

EDK2 is a modern, feature-rich, cross-platform firmware development
environment for the UEFI and PI specifications.

The initial version of this bootloader package makes it possible to
build firmware for the following five configurations:

 * QEMU x86-64 pc machine
 * QEMU aarch64 virt machine, booting directly from flash
 * QEMU aarch64 virt machine, booting via kernel protocol
 * QEMU aarch64 sbsa-ref machine
 * ARM FVP vexpress machine

When building for QEMU sbsa-ref and ARM FVP there is a dependency
on package/edk2-platforms for additional platform description files.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 2:

Review items from Thomas Petazzoni:

 * Fixed alphabetical inclusion of Config.in
 * Removed spurious change in ATF
 * Added architecture dependencies
 * Added hash for license file
 * Using host dir (instead of build dir) from edk2-platforms
 * Simplified _BUILD_CMDS
 * Simplified _INSTALL_IMAGES_CMDS

Other improvements:

 * Added support for x86-64 and OVMF
 * General cleanup and simplification
 * Improved code comments
 * Renamed variable EDK2_FD_NAME to EDK2_EL2_NAME to be more specific.
   This variable is only meaningful for platforms that build images
   intended to be used by other bootloaders in EL2 context (e.g. ATF).
---
 boot/Config.in                      |   1 +
 boot/arm-trusted-firmware/Config.in |   2 +-
 boot/edk2/Config.in                 |  68 ++++++++++++++++
 boot/edk2/edk2.hash                 |   3 +
 boot/edk2/edk2.mk                   | 117 ++++++++++++++++++++++++++++
 5 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 boot/edk2/Config.in
 create mode 100644 boot/edk2/edk2.hash
 create mode 100644 boot/edk2/edk2.mk

diff --git a/boot/Config.in b/boot/Config.in
index b3adbfc8bc..5684517d93 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -8,6 +8,7 @@ source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
+source "boot/edk2/Config.in"
 source "boot/grub2/Config.in"
 source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index e505dee9d0..7d0f6aa4e0 100644
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
index 0000000000..ccba277e40
--- /dev/null
+++ b/boot/edk2/Config.in
@@ -0,0 +1,68 @@
+config BR2_TARGET_EDK2
+	bool "EDK2"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_x86_64 || BR2_aarch64
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
+    default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
+    default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
+
+config BR2_TARGET_EDK2_PLATFORM_OVMF_X64
+    bool "x86-64"
+    help
+      Configuration for x86-64.
+      This platform will boot from flash address 0x0.
+      It should therefore be used as the first bootloader.
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
index 0000000000..b9cfe37cd2
--- /dev/null
+++ b/boot/edk2/edk2.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 251520730b53ec7d686fb07aabf0bdec0d8721ac3ca59fd3e6df5dde64f1d715  edk2-edk2-stable202005.tar.gz
+sha256 50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
new file mode 100644
index 0000000000..e889070d0c
--- /dev/null
+++ b/boot/edk2/edk2.mk
@@ -0,0 +1,117 @@
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
+ifeq ($(BR2_x86_64),y)
+EDK2_ARCH = X64
+else ifeq ($(BR2_aarch64),y)
+EDK2_ARCH = AARCH64
+endif
+
+ifeq ($(BR2_TARGET_EDK2_DEBUG),y)
+EDK2_BUILD_TYPE = DEBUG
+else
+EDK2_BUILD_TYPE = RELEASE
+endif
+
+# Packages path.
+#
+# The EDK2 build system will, for some platforms, depend on binary outputs
+# from other bootloader packages. Those dependencies need to be in the path
+# for the EDK2 build system, so we define this special directory here.
+EDK2_OUTPUT_BASE = $(BINARIES_DIR)/edk2
+
+ifeq ($(BR2_PACKAGE_HOST_EDK2_PLATFORMS),y)
+EDK2_PACKAGES_PATH = $(@D):$(EDK2_OUTPUT_BASE):$(HOST_DIR)/share/edk2-platforms
+else
+EDK2_PACKAGES_PATH = $(@D):$(EDK2_OUTPUT_BASE)
+endif
+
+# Platform configuration.
+#
+# We set the variable EDK_EL2_NAME for platforms that may load EDK2 as part of
+# the EL2 processor context, like ARM Trusted Firmware (ATF). This way, other
+# bootloaders know what binary to include in their firmware package.
+#
+# However, the QEMU SBSA platform is a bit unique as there are different
+# implicit assumptions on how this firmware should be packaged and run.
+# The EDK2 build system itself will package the ATF binaries.
+
+ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
+EDK2_DEPENDENCIES += host-nasm
+EDK2_PACKAGE_NAME = OvmfPkg
+EDK2_PLATFORM_NAME = OvmfPkgX64
+EDK2_BUILD_DIR = OvmfX64
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU),y)
+EDK2_PACKAGE_NAME = ArmVirtPkg
+EDK2_PLATFORM_NAME = ArmVirtQemu
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL),y)
+EDK2_PACKAGE_NAME = ArmVirtPkg
+EDK2_PLATFORM_NAME = ArmVirtQemuKernel
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
+EDK2_EL2_NAME = QEMU_EFI
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
+EDK2_DEPENDENCIES += host-edk2-platforms
+EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
+EDK2_PLATFORM_NAME = ArmVExpress-FVP-AArch64
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+EDK2_EL2_NAME = FVP_AARCH64_EFI
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
+EDK2_DEPENDENCIES += host-edk2-platforms arm-trusted-firmware
+EDK2_PACKAGE_NAME = Platform/Qemu/SbsaQemu
+EDK2_PLATFORM_NAME = SbsaQemu
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+EDK2_PRE_CONFIGURE_HOOKS += EDK2_OUTPUT_QEMU_SBSA
+endif
+
+# For QEMU SBSA we use EDK2_OUTPUT_BASE (which is already in the EDK2 path) to
+# build the package structure that EDK2 expects for this specific platform.
+define EDK2_OUTPUT_QEMU_SBSA
+	mkdir -p $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa
+	ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa/
+endef
+
+# Build commands.
+#
+# Due to the uniquely scripted build system for EDK2 we need to export all
+# build environment variables so that they are available across edksetup.sh,
+# make, the build command, and other subordinate build scripts within EDK2.
+
+EDK2_BUILD_ENV += \
+WORKSPACE=$(@D) \
+PACKAGES_PATH=$(EDK2_PACKAGES_PATH) \
+PYTHON_COMMAND=$(HOST_DIR)/bin/python3 \
+IASL_PREFIX=$(HOST_DIR)/bin/ \
+NASM_PREFIX=$(HOST_DIR)/bin/ \
+GCC5_$(EDK2_ARCH)_PREFIX=$(TARGET_CROSS)
+
+EDK2_BUILD_OPTS += -a $(EDK2_ARCH) -t GCC5 -b $(EDK2_BUILD_TYPE) -p $(EDK2_PACKAGE_NAME)/$(EDK2_PLATFORM_NAME).dsc
+EDK2_BUILD_TARGETS += all
+
+define EDK2_BUILD_CMDS
+	mkdir -p $(EDK2_OUTPUT_BASE)
+	export $(EDK2_BUILD_ENV) && \
+	source $(@D)/edksetup.sh && \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/BaseTools && \
+	build $(EDK2_BUILD_OPTS) $(EDK2_BUILD_TARGETS)
+endef
+
+define EDK2_INSTALL_IMAGES_CMDS
+	cp -f $(@D)/Build/$(EDK2_BUILD_DIR)/$(EDK2_BUILD_TYPE)_GCC5/FV/*.fd $(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
