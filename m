From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:34 -0000
Subject: [Buildroot] [git commit] boot/edk2: new package
Message-ID: <20210607144652.2984F81191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1074a37e783b023bd0491ba4f4f7acab7f289e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Support the use of EDK2 UEFI payloads as BL33 in ARM Trusted Firmware.

Signed-off-by: Dick Olsson <hi@senzilla.io>
[yann.morin.1998 at free.fr:
  - duplicate defaults in Config.in
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/Config.in                                    |   1 +
 boot/arm-trusted-firmware/Config.in               |  15 ++-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |   9 ++
 boot/edk2/Config.in                               | 108 ++++++++++++++++
 boot/edk2/edk2.hash                               |   3 +
 boot/edk2/edk2.mk                                 | 150 ++++++++++++++++++++++
 6 files changed, 285 insertions(+), 1 deletion(-)

diff --git a/boot/Config.in b/boot/Config.in
index 08d9ac06b2..ff98a49796 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -10,6 +10,7 @@ source "boot/beaglev-ddrinit/Config.in"
 source "boot/beaglev-secondboot/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
+source "boot/edk2/Config.in"
 source "boot/grub2/Config.in"
 source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index c06294040e..9d347550a4 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
 	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A) && \
-		   BR2_TARGET_UBOOT
+		   (BR2_TARGET_UBOOT || BR2_TARGET_EDK2)
 	help
 	  Enable this option if you want to build the ATF for your ARM
 	  based embedded device.
@@ -135,6 +135,19 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
 
 endif
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+	bool "Use EDK2 as BL33"
+	depends on BR2_TARGET_EDK2
+	help
+	  This option allows to embed EDK2 as the BL33 part of
+	  the ARM Trusted Firmware. It ensures that the EDK2 package
+	  gets built before ATF, and that the appropriate BL33
+	  variable pointing to the EDK2 is passed when building ATF.
+
+	  Do not choose this option if you intend to build ATF and EDK2
+	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
+	  build system, the dependency between ATF and EDK is reversed.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
 	string "Additional ATF make targets"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 0597cecf71..279658712b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -79,6 +79,15 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
 endif
 endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2
+# Since the flash device name vary between platforms, we use the variable
+# provided by the EDK2 package for this. Using this variable here is OK
+# as it will expand after all dependencies are resolved, inside _BUILD_CMDS.
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	BL33=$(BINARIES_DIR)/$(call qstrip,$(BR2_TARGET_EDK2_FD_NAME).fd)
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
new file mode 100644
index 0000000000..150806899f
--- /dev/null
+++ b/boot/edk2/Config.in
@@ -0,0 +1,108 @@
+config BR2_TARGET_EDK2
+	bool "EDK2"
+	depends on BR2_x86_64 || BR2_aarch64
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_PACKAGE_EDK2_PLATFORMS
+	help
+	  EDK II is a modern, feature-rich, cross-platform firmware
+	  development environment for the UEFI and PI specifications.
+
+	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
+
+if BR2_TARGET_EDK2
+
+choice
+	prompt "Platform"
+	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
+	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
+
+config BR2_TARGET_EDK2_PLATFORM_OVMF_X64
+	bool "x86-64"
+	depends on BR2_x86_64
+	help
+	  Platform configuration for a generic x86-64 target.
+	  This platform will boot from flash address 0x0.
+	  It should therefore be used as the first bootloader.
+
+config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
+	bool "ARM Virt Qemu (flash)"
+	depends on BR2_aarch64
+	help
+	  Platform configuration for QEMU targeting the Virt machine.
+	  This platform will only boot from flash address 0x0.
+	  It should therefore be used as the first bootloader.
+
+config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
+	bool "ARM Virt Qemu (kernel)"
+	depends on BR2_aarch64
+	help
+	  Platform configuration for QEMU targeting the Virt machine.
+	  This platform can boot from either flash address 0x0 or via
+	  the Linux boot protocol. It can therefore be loaded by a
+	  previous bootloader like ARM Trusted Firmware or OP-TEE.
+
+config BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
+	bool "ARM SGI-575"
+	depends on BR2_aarch64
+	help
+	  Platform configuration for ARM SGI-575 on ARM's
+	  Fixed Virtual Platform (FVP).
+
+config BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
+	bool "ARM VExpress FVP Aarch64"
+	depends on BR2_aarch64
+	help
+	  Platform configuration for ARM Versatile Express targeting
+	  the Aarch64 Fixed Virtual Platform (FVP).
+
+config BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
+	bool "Socionext DeveloperBox"
+	depends on BR2_aarch64
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+	select BR2_PACKAGE_HOST_DTC
+	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
+	help
+	  Platform configuration for Socionext SynQuacer DeveloperBox
+	  (SC2A11).
+
+comment "Socionext DeveloperBox depends on ATF not using EDK2 as BL33"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+
+config BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
+	bool "SolidRun MacchiatoBin"
+	depends on BR2_aarch64
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	select BR2_PACKAGE_HOST_DTC
+	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
+	help
+	  Platform configuration for the SolidRun MacchiatoBin.
+
+config BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA
+	bool "QEMU SBSA"
+	depends on BR2_aarch64
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+	help
+	  Platform configuration for QEMU targeting the SBSA reference
+	  machine.
+
+comment "QEMU SBSA depends on ATF not using EDK2 as BL33"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+
+endchoice
+
+config BR2_TARGET_EDK2_FD_NAME
+	string
+	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_X64
+	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
+	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
+	default "BL33_AP_UEFI" if BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
+	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
+	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
+	default "ARMADA_EFI" if BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
+
+endif
+
+comment "EDK2 needs a toolchain w/ gcc >= 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
new file mode 100644
index 0000000000..f28e9ce841
--- /dev/null
+++ b/boot/edk2/edk2.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  04791c13b414a6d1877182a6d565cb762c30aa63e49bb4d495fca68ef4dd209d  edk2-edk2-stable202102-br1.tar.gz
+sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
new file mode 100644
index 0000000000..903fdfb89e
--- /dev/null
+++ b/boot/edk2/edk2.mk
@@ -0,0 +1,150 @@
+################################################################################
+#
+# edk2
+#
+################################################################################
+
+EDK2_VERSION = edk2-stable202102
+EDK2_SITE = https://github.com/tianocore/edk2
+EDK2_SITE_METHOD = git
+EDK2_LICENSE = BSD-2-Clause
+EDK2_LICENSE_FILE = License.txt
+EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
+EDK2_INSTALL_TARGET = NO
+EDK2_INSTALL_IMAGES = YES
+
+ifeq ($(BR2_x86_64),y)
+EDK2_ARCH = X64
+else ifeq ($(BR2_aarch64),y)
+EDK2_ARCH = AARCH64
+endif
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+EDK2_BUILD_TYPE = DEBUG
+else
+EDK2_BUILD_TYPE = RELEASE
+endif
+
+# Build system notes.
+#
+# The EDK2 build system is rather unique, so here are a few useful notes.
+#
+# First, builds rely heavily on Git submodules to fetch various dependencies
+# into specific directory structures. It might be possible to work around this
+# and rely on Buildroot's infrastructure, but using Git submodules greatly
+# simplifies this already complicated build system.
+#
+# Second, the build system is spread across various commands and stages.
+# Therefore, all build variables needs to be exported to be available
+# accordingly. The first stage will build $(@D)/BaseTools which contains
+# various tools and scripts for the host.
+#
+# Third, where applicable, the dependency direction between EDK2 and
+# ARM Trusted Firmware (ATF) will go in different direction for different
+# platforms. Most commonly, ATF will depend on EDK2 via the BL33 payload.
+# But for some platforms (e.g. QEMU SBSA or DeveloperBox) EDK2 will package
+# the ATF images within its own build system. In such cases, intermediary
+# "EDK2 packages" will be built in $(EDK2_BUILD_PACKAGES) in order for EDK2
+# to be able to use them in subsequent build stages.
+#
+# For more information about the build setup:
+# https://edk2-docs.gitbook.io/edk-ii-build-specification/4_edk_ii_build_process_overview
+
+EDK2_GIT_SUBMODULES = YES
+EDK2_BUILD_PACKAGES = $(@D)/Build/Buildroot
+EDK2_PACKAGES_PATH = $(@D):$(EDK2_BUILD_PACKAGES):$(STAGING_DIR)/usr/share/edk2-platforms
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
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
+EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
+EDK2_PLATFORM_NAME = ArmVExpress-FVP-AArch64
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX),y)
+EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
+EDK2_PACKAGE_NAME = Platform/Socionext/DeveloperBox
+EDK2_PLATFORM_NAME = DeveloperBox
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
+EDK2_BUILD_OPTS += -D DO_X86EMU=TRUE
+EDK2_PRE_BUILD_HOOKS += EDK2_PRE_BUILD_SOCIONEXT_DEVELOPERBOX
+
+define EDK2_PRE_BUILD_SOCIONEXT_DEVELOPERBOX
+	mkdir -p $(EDK2_BUILD_PACKAGES)/Platform/Socionext/DeveloperBox
+	$(ARM_TRUSTED_FIRMWARE_DIR)/tools/fiptool/fiptool create \
+		--tb-fw $(BINARIES_DIR)/bl31.bin \
+		--soc-fw $(BINARIES_DIR)/bl31.bin \
+		--scp-fw $(BINARIES_DIR)/bl31.bin \
+		$(EDK2_BUILD_PACKAGES)/Platform/Socionext/DeveloperBox/fip_all_arm_tf.bin
+endef
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN),y)
+EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
+EDK2_PACKAGE_NAME = Platform/SolidRun/Armada80x0McBin
+EDK2_PLATFORM_NAME = Armada80x0McBin
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
+EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
+EDK2_BUILD_OPTS += -D INCLUDE_TFTP_COMMAND
+
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
+EDK2_DEPENDENCIES += arm-trusted-firmware
+EDK2_PACKAGE_NAME = Platform/Qemu/SbsaQemu
+EDK2_PLATFORM_NAME = SbsaQemu
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+EDK2_PRE_BUILD_HOOKS += EDK2_PRE_BUILD_QEMU_SBSA
+
+define EDK2_PRE_BUILD_QEMU_SBSA
+	mkdir -p $(EDK2_BUILD_PACKAGES)/Platform/Qemu/Sbsa
+	ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_BUILD_PACKAGES)/Platform/Qemu/Sbsa/
+endef
+
+endif
+
+EDK2_BASETOOLS_OPTS = \
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
+	-n $(BR2_JLEVEL) \
+	-a $(EDK2_ARCH) \
+	-b $(EDK2_BUILD_TYPE) \
+	-p $(EDK2_PACKAGE_NAME)/$(EDK2_PLATFORM_NAME).dsc
+
+define EDK2_BUILD_CMDS
+	mkdir -p $(EDK2_BUILD_PACKAGES)
+	export $(EDK2_BUILD_ENV) && \
+	unset ARCH && \
+	source $(@D)/edksetup.sh && \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/BaseTools $(EDK2_BASETOOLS_OPTS) && \
+	build $(EDK2_BUILD_OPTS) all
+endef
+
+define EDK2_INSTALL_IMAGES_CMDS
+	cp -f $(@D)/Build/$(EDK2_BUILD_DIR)/$(EDK2_BUILD_TYPE)_GCC5/FV/*.fd $(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
