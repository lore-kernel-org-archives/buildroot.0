From: Dick Olsson <hi@senzilla.io>
Date: Fri, 18 Dec 2020 20:27:28 +0000
Subject: [Buildroot] [PATCH v3 04/11] boot/edk2: new package
In-Reply-To: <20201218202646.1060123-1-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
Message-ID: <20201218202646.1060123-5-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EDK2 is a modern, feature-rich, cross-platform firmware development
environment for the UEFI and PI specifications.

The initial version of this bootloader package makes it possible to
build firmware for the following seven configurations:

 * QEMU x86-64 pc machine
 * QEMU aarch64 virt machine, booting directly from flash
 * QEMU aarch64 virt machine, booting via the kernel protocol
 * QEMU aarch64 sbsa-ref machine
 * ARM FVP vexpress machine
 * Socionext SynQuacer Developerbox
 * SolidRun MacchiatoBin

When building for QEMU sbsa-ref, ARM FVP, Developerbox and MacchiatoBin
there is a dependency on package/edk2-platforms for additional platform
description files.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 3:

 * Added standard comment header
 * Removed spurious change
 * Using proper compiler flags
 * Added missing libuuid dependency with host-util-linux
 * Automated QEMU SBSA config dependency
 * Updated to 202008
 * Improved code comments
 * Added upstream patch to fix Python 3.9 build issues
 * Added support for Developerbox and MacchiatoBin

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
 boot/Config.in                                |   1 +
 ...GenFds-Compatibility-with-Python-3.9.patch |  35 ++++
 boot/edk2/Config.in                           |  88 ++++++++++
 boot/edk2/edk2.hash                           |   3 +
 boot/edk2/edk2.mk                             | 164 ++++++++++++++++++
 5 files changed, 291 insertions(+)
 create mode 100644 boot/edk2/0001-GenFds-Compatibility-with-Python-3.9.patch
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
diff --git a/boot/edk2/0001-GenFds-Compatibility-with-Python-3.9.patch b/boot/edk2/0001-GenFds-Compatibility-with-Python-3.9.patch
new file mode 100644
index 0000000000..dee976bb61
--- /dev/null
+++ b/boot/edk2/0001-GenFds-Compatibility-with-Python-3.9.patch
@@ -0,0 +1,35 @@
+From 685ad1d101677f967597a2956f3becd94b49c796 Mon Sep 17 00:00:00 2001
+From: Dick Olsson <hi@senzilla.io>
+Date: Fri, 18 Dec 2020 21:07:24 +0100
+Subject: [edk2/master PATCH 1/1] GenFds: Compatibility with Python 3.9
+
+Python 3.9 removed the tostring() and fromstring() methods:
+https://docs.python.org/3/whatsnew/3.9.html#removed
+
+Signed-off-by: Dick Olsson <hi@senzilla.io>
+---
+ BaseTools/Source/Python/GenFds/GenFdsGlobalVariable.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/Python/GenFds/GenFdsGlobalVariable.py b/BaseTools/Source/Python/GenFds/GenFdsGlobalVariable.py
+index dc1727c466..124dc43199 100644
+--- a/BaseTools/Source/Python/GenFds/GenFdsGlobalVariable.py
++++ b/BaseTools/Source/Python/GenFds/GenFdsGlobalVariable.py
+@@ -463,12 +463,12 @@ class GenFdsGlobalVariable:
+                     GenFdsGlobalVariable.SecCmdList.append(' '.join(Cmd).strip())
+             else:
+                 SectionData = array('B', [0, 0, 0, 0])
+-                SectionData.fromstring(Ui.encode("utf_16_le"))
++                SectionData.frombytes(Ui.encode("utf_16_le"))
+                 SectionData.append(0)
+                 SectionData.append(0)
+                 Len = len(SectionData)
+                 GenFdsGlobalVariable.SectionHeader.pack_into(SectionData, 0, Len & 0xff, (Len >> 8) & 0xff, (Len >> 16) & 0xff, 0x15)
+-                SaveFileOnChange(Output, SectionData.tostring())
++                SaveFileOnChange(Output, SectionData.tobytes())
+ 
+         elif Ver:
+             Cmd += ("-n", Ver)
+-- 
+2.25.1
+
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
new file mode 100644
index 0000000000..4e26c17cc6
--- /dev/null
+++ b/boot/edk2/Config.in
@@ -0,0 +1,88 @@
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
+config BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
+	bool "Socionext DeveloperBox"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+	select BR2_PACKAGE_HOST_EDK2_PLATFORMS
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  Configuration for the Socionext SynQuacer DeveloperBox (SC2A11).
+
+comment "Socionext DeveloperBox depends on ATF not using EDK2 as BL33"
+    depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+
+config BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
+	bool "SolidRun MacchiatoBin"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	select BR2_PACKAGE_HOST_EDK2_PLATFORMS
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  Configuration for the SolidRun MacchiatoBin.
+
+config BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA
+	bool "QEMU SBSA"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+	select BR2_PACKAGE_HOST_EDK2_PLATFORMS
+	help
+	  Configuration for QEMU targeting the SBSA reference platform.
+
+comment "QEMU SBSA depends on ATF not using EDK2 as BL33"
+    depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+
+endchoice
+
+endif
+
+comment "EDK2 needs a toolchain w/ gcc >= 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
new file mode 100644
index 0000000000..4b8271d5d5
--- /dev/null
+++ b/boot/edk2/edk2.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 1f8282faeea36d19ba3f8fd3c14070038fd785b76ee4d6270d35647df9346355  edk2-edk2-stable202008.tar.gz
+sha256 50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
new file mode 100644
index 0000000000..024b43bc25
--- /dev/null
+++ b/boot/edk2/edk2.mk
@@ -0,0 +1,164 @@
+################################################################################
+#
+# edk2
+#
+################################################################################
+
+EDK2_VERSION = edk2-stable202008
+EDK2_SITE = https://github.com/tianocore/edk2
+EDK2_SITE_METHOD = git
+EDK2_LICENSE = BSD-2-Clause
+EDK2_LICENSE_FILE = License.txt
+EDK2_DEPENDENCIES = host-python3 host-acpica host-util-linux
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
+# We set the variable EDK_EL2_NAME for platforms that may depend on EDK2 as
+# part of booting the EL2 context, like ARM Trusted Firmware (ATF). This way,
+# other bootloaders know what binary to build into in their firmware package.
+#
+# However, some platforms (e.g. QEMU SBSA, Socionext DeveloperBox) are built
+# differently where the dependency with ATF is reversed. In these cases EDK2
+# will package the firmware package instead.
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
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX),y)
+EDK2_DEPENDENCIES += host-edk2-platforms host-dtc arm-trusted-firmware
+EDK2_PACKAGE_NAME = Platform/Socionext/DeveloperBox
+EDK2_PLATFORM_NAME = DeveloperBox
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+EDK2_EL2_NAME = FVP_AARCH64_EFI
+EDK2_PRE_CONFIGURE_HOOKS += EDK2_OUTPUT_SOCIONEXT_DEVELOPERBOX
+EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
+EDK2_BUILD_OPTS += -D DO_X86EMU=TRUE
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN),y)
+EDK2_DEPENDENCIES += host-edk2-platforms host-dtc
+EDK2_PACKAGE_NAME = Platform/SolidRun/Armada80x0McBin
+EDK2_PLATFORM_NAME = Armada80x0McBin
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
+EDK2_EL2_NAME = ARMADA_EFI
+EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
+EDK2_BUILD_OPTS += -D INCLUDE_TFTP_COMMAND
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
+EDK2_DEPENDENCIES += host-edk2-platforms arm-trusted-firmware
+EDK2_PACKAGE_NAME = Platform/Qemu/SbsaQemu
+EDK2_PLATFORM_NAME = SbsaQemu
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+EDK2_PRE_CONFIGURE_HOOKS += EDK2_OUTPUT_QEMU_SBSA
+endif
+
+# Workspace setup.
+#
+# For some platforms we need to prepare the EDK2 workspace and link to the
+# ARM Trusted Firmware (ATF) binaries. This will enable EDK2 to bundle ATF
+# into its firmware package.
+
+define EDK2_OUTPUT_SOCIONEXT_DEVELOPERBOX
+	mkdir -p $(EDK2_OUTPUT_BASE)/Platform/Socionext/DeveloperBox
+	$(ARM_TRUSTED_FIRMWARE_DIR)/tools/fiptool/fiptool create \
+		--tb-fw $(BINARIES_DIR)/bl31.bin \
+		--soc-fw $(BINARIES_DIR)/bl31.bin \
+		--scp-fw $(BINARIES_DIR)/bl31.bin \
+		$(EDK2_OUTPUT_BASE)/Platform/Socionext/DeveloperBox/fip_all_arm_tf.bin
+endef
+
+define EDK2_OUTPUT_QEMU_SBSA
+	mkdir -p $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa
+	ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa/
+endef
+
+# Make and build options.
+#
+# Due to the uniquely scripted build system for EDK2 we need to export most
+# build environment variables so that they are available across edksetup.sh,
+# make, the build command, and other subordinate build scripts within EDK2.
+
+EDK2_MAKE_ENV += \
+	EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
+	EXTRA_OPTFLAGS="$(HOST_CPPFLAGS)"
+
+EDK2_BUILD_ENV += \
+	WORKSPACE=$(@D) \
+	PACKAGES_PATH=$(EDK2_PACKAGES_PATH) \
+	PYTHON_COMMAND=$(HOST_DIR)/bin/python3 \
+	IASL_PREFIX=$(HOST_DIR)/bin/ \
+	NASM_PREFIX=$(HOST_DIR)/bin/ \
+	GCC5_$(EDK2_ARCH)_PREFIX=$(TARGET_CROSS)
+
+EDK2_BUILD_OPTS += \
+	-t GCC5 \
+	-n `nproc` \
+	-a $(EDK2_ARCH) \
+	-b $(EDK2_BUILD_TYPE) \
+	-p $(EDK2_PACKAGE_NAME)/$(EDK2_PLATFORM_NAME).dsc
+
+define EDK2_BUILD_CMDS
+	mkdir -p $(EDK2_OUTPUT_BASE)
+	export $(EDK2_BUILD_ENV) && \
+	unset ARCH && \
+	source $(@D)/edksetup.sh && \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/BaseTools $(EDK2_MAKE_ENV) && \
+	build $(EDK2_BUILD_OPTS) all
+endef
+
+define EDK2_INSTALL_IMAGES_CMDS
+	cp -f $(@D)/Build/$(EDK2_BUILD_DIR)/$(EDK2_BUILD_TYPE)_GCC5/FV/*.fd $(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1
