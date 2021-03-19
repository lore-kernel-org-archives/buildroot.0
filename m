From: D. Olsson <hi@senzilla.io>
Date: Fri, 19 Mar 2021 08:54:24 +0000
Subject: [Buildroot] [PATCH v4 02/10] boot/edk2: new package
In-Reply-To: <cfUXQAgDs4RPfVpR1ucb2kKFjIH4ReGNWctEOl4WA@cp4-web-032.plabs.ch>
References: <cfUXQAgDs4RPfVpR1ucb2kKFjIH4ReGNWctEOl4WA@cp4-web-032.plabs.ch>
Message-ID: <x8PFVLsmtr9ozZQct6EtUM_D3MONeuIIYEOYeQW9PKhUVnvJ7JdfnHRBrcGQpYBv29pZ4KGaa2HXLSzMooz6SH9Szs2Wfp2sek9z-zj2r6s=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I just noticed an issue with this edk2 patch due to some changes in Buildroot master in regards to git cache archive name changes.

I somehow did not catch this during my last test after rebasing. A new small iteration of this patch is coming soon!

D. Olsson
PGP: 8204A8CD

On Thu, Mar 18, 2021 at 16:42, Dick Olsson via buildroot <buildroot@busybox.net> wrote:

> EDK2 is a modern, feature-rich, cross-platform firmware development
> environment for the UEFI and PI specifications.
>
> The initial version of this bootloader package makes it possible to
> build firmware for the following seven configurations:
>
> * QEMU x86-64 pc machine
> * QEMU aarch64 virt machine, booting directly from flash
> * QEMU aarch64 virt machine, booting via the kernel protocol
> * QEMU aarch64 sbsa-ref machine
> * ARM FVP vexpress machine
> * Socionext SynQuacer Developerbox
> * SolidRun MacchiatoBin
>
> Signed-off-by: Dick Olsson <hi@senzilla.io>
>
> ---
>
> Revision 4:
>
> * Addressed review items from Yann Morin
> * Simplified the inline comments
> * Updated to HEAD as of 7 Jan, 2021
> * Removed upstream patch since it was merged on 4 Jan, 2021
> * edk2-platforms is now a permanent depednency. Most platform
> descriptions depend on it anyway and it makes an already complicated
> build setup a little bit simpler.
> * Removed EDK2_EL2_NAME and instead using Kconfig for the edk2 flash
> device names
> * Renamed EDK2_OUTPUT_BASE to EDK2_BUILD_PACKAGES and relocate it
> to $(@D)/Build
> * Renamed EDK2_MAKE_ENV to EDK2_BASETOOLS_OPTS to better indicate
> these are options for building EDK2 BaseTools for the host
> * Added architecture dependencies in Kconfig
> * Fixed indentation in Config.in
> * Using _PRE_BUILD_HOOKS instead of _PRE_CONFIGURE_HOOKS
> * Using BR2_JLEVEL
>
> Revision 3:
>
> * Added standard comment header
> * Removed spurious change
> * Using proper compiler flags
> * Added missing libuuid dependency with host-util-linux
> * Automated QEMU SBSA config dependency
> * Updated to 202008
> * Improved code comments
> * Added upstream patch to fix Python 3.9 build issues
> * Added support for Developerbox and MacchiatoBin
>
> Revision 2:
>
> Review items from Thomas Petazzoni:
>
> * Fixed alphabetical inclusion of Config.in
> * Removed spurious change in ATF
> * Added architecture dependencies
> * Added hash for license file
> * Using host dir (instead of build dir) from edk2-platforms
> * Simplified _BUILD_CMDS
> * Simplified _INSTALL_IMAGES_CMDS
>
> Other improvements:
>
> * Added support for x86-64 and OVMF
> * General cleanup and simplification
> * Improved code comments
> * Renamed variable EDK2_FD_NAME to EDK2_EL2_NAME to be more specific.
> This variable is only meaningful for platforms that build images
> intended to be used by other bootloaders in EL2 context (e.g. ATF).
>
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---
> boot/Config.in | 1 +
> boot/arm-trusted-firmware/Config.in | 2 +-
> boot/edk2/Config.in | 110 ++++++++++++++++++++
> boot/edk2/edk2.hash | 3 +
> boot/edk2/edk2.mk | 150 ++++++++++++++++++++++++++++
> 5 files changed, 265 insertions(+), 1 deletion(-)
> create mode 100644 boot/edk2/Config.in
> create mode 100644 boot/edk2/edk2.hash
> create mode 100644 boot/edk2/edk2.mk
>
> diff --git a/boot/Config.in b/boot/Config.in
> index b3adbfc8bc..5684517d93 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -8,6 +8,7 @@ source "boot/arm-trusted-firmware/Config.in"
> source "boot/barebox/Config.in"
> source "boot/binaries-marvell/Config.in"
> source "boot/boot-wrapper-aarch64/Config.in"
> +source "boot/edk2/Config.in"
> source "boot/grub2/Config.in"
> source "boot/gummiboot/Config.in"
> source "boot/lpc32xxcdl/Config.in"
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index c06294040e..b11dd67931 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -1,7 +1,7 @@
> config BR2_TARGET_ARM_TRUSTED_FIRMWARE
> bool "ARM Trusted Firmware (ATF)"
> depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A) && \
> - BR2_TARGET_UBOOT
> + (BR2_TARGET_UBOOT || BR2_TARGET_EDK2)
> help
> Enable this option if you want to build the ATF for your ARM
> based embedded device.
> diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
> new file mode 100644
> index 0000000000..25525fc471
> --- /dev/null
> +++ b/boot/edk2/Config.in
> @@ -0,0 +1,110 @@
> +config BR2_TARGET_EDK2
> + bool "EDK2"
> + depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> + select BR2_PACKAGE_EDK2_PLATFORMS
> + depends on BR2_x86_64 || BR2_aarch64
> + help
> + EDK II is a modern, feature-rich, cross-platform firmware
> + development environment for the UEFI and PI specifications.
> +
> + https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
> +
> +if BR2_TARGET_EDK2
> +
> +config BR2_TARGET_EDK2_DEBUG
> + bool "Debug build"
> + help
> + Use the debug build type.
> +
> +choice
> + prompt "Platform"
> + default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
> + default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
> +
> +config BR2_TARGET_EDK2_PLATFORM_OVMF_X64
> + bool "x86-64"
> + depends on BR2_x86_64
> + help
> + Configuration for x86-64.
> + This platform will boot from flash address 0x0.
> + It should therefore be used as the first bootloader.
> +
> +config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
> + bool "ARM Virt Qemu (flash)"
> + depends on BR2_aarch64
> + help
> + Configuration for QEMU targeting the Virt machine.
> + This platform will only boot from flash address 0x0.
> + It should therefore be used as the first bootloader.
> +
> +config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
> + bool "ARM Virt Qemu (kernel)"
> + depends on BR2_aarch64
> + help
> + Configuration for QEMU targeting the Virt machine.
> + This platform can boot from either flash address 0x0 or via
> + the Linux boot protocol. It can therefore be loaded by a
> + previous bootloader like ARM Trusted Firmware or OP-TEE.
> +
> +config BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
> + bool "ARM SGI-575"
> + depends on BR2_aarch64
> + help
> + Configuration for ARM SGI-575 on the Fixed Virtual Platform (FVP).
> +
> +config BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
> + bool "ARM VExpress FVP Aarch64"
> + depends on BR2_aarch64
> + help
> + Configuration for ARM Versatile Express targeting the
> + Fixed Virtual Platform (FVP) AArch64 platform.
> +
> +config BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
> + bool "Socionext DeveloperBox"
> + depends on BR2_aarch64
> + depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
> + depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> + select BR2_PACKAGE_HOST_DTC
> + help
> + Configuration for the Socionext SynQuacer DeveloperBox (SC2A11).
> +
> +comment "Socionext DeveloperBox depends on ATF not using EDK2 as BL33"
> + depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> +
> +config BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
> + bool "SolidRun MacchiatoBin"
> + depends on BR2_aarch64
> + depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
> + select BR2_PACKAGE_HOST_DTC
> + help
> + Configuration for the SolidRun MacchiatoBin.
> +
> +config BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA
> + bool "QEMU SBSA"
> + depends on BR2_aarch64
> + depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
> + depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> + help
> + Configuration for QEMU targeting the SBSA reference platform.
> +
> +comment "QEMU SBSA depends on ATF not using EDK2 as BL33"
> + depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> +
> +endchoice
> +
> +config BR2_TARGET_EDK2_FD_NAME
> + string
> + default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_X64
> + default "QEMU_EFI" \
> + if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU \
> + || BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
> + default "BL33_AP_UEFI" if BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
> + default "FVP_AARCH64_EFI" \
> + if BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64 \
> + || BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
> + default "ARMADA_EFI" if BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
> +
> +endif
> +
> +comment "EDK2 needs a toolchain w/ gcc >= 5"
> + depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
> new file mode 100644
> index 0000000000..41b2855686
> --- /dev/null
> +++ b/boot/edk2/edk2.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 12859b6ec8d7338434b8457bb7e74d0fd754a770e844d956ceac3f51a0844e28 edk2-248d08c5983b561549891fec54c213e1f354179c.tar.gz
> +sha256 50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80 License.txt
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> new file mode 100644
> index 0000000000..5268879e96
> --- /dev/null
> +++ b/boot/edk2/edk2.mk
> @@ -0,0 +1,150 @@
> +################################################################################
> +#
> +# edk2
> +#
> +################################################################################
> +
> +EDK2_VERSION = 248d08c5983b561549891fec54c213e1f354179c
> +EDK2_SITE = https://github.com/tianocore/edk2
> +EDK2_SITE_METHOD = git
> +EDK2_LICENSE = BSD-2-Clause
> +EDK2_LICENSE_FILE = License.txt
> +EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
> +EDK2_INSTALL_TARGET = NO
> +EDK2_INSTALL_IMAGES = YES
> +
> +ifeq ($(BR2_x86_64),y)
> +EDK2_ARCH = X64
> +else ifeq ($(BR2_aarch64),y)
> +EDK2_ARCH = AARCH64
> +endif
> +
> +ifeq ($(BR2_TARGET_EDK2_DEBUG),y)
> +EDK2_BUILD_TYPE = DEBUG
> +else
> +EDK2_BUILD_TYPE = RELEASE
> +endif
> +
> +# Build system notes.
> +#
> +# The EDK2 build system is rather unique, so here are a few useful notes.
> +#
> +# First, builds rely heavily on Git submodules to fetch various dependencies
> +# into specific directory structures. It might be possible to work around this
> +# and rely on Buildroot's infrastructure, but using Git submodules greatly
> +# simplifies this already complicated build system.
> +#
> +# Second, the build system is spread across various commands and stages.
> +# Therefore, all build variables needs to be exported to be available
> +# accordingly. The first stage will build $(@D)/BaseTools which contains
> +# various tools and scripts for the host.
> +#
> +# Third, where applicable, the dependency direction between EDK2 and
> +# ARM Trusted Firmware (ATF) will go in different direction for different
> +# platforms. Most commonly, ATF will depend on EDK2 via the BL33 payload.
> +# But for some platforms (e.g. QEMU SBSA or DeveloperBox) EDK2 will package
> +# the ATF images within its own build system. In such cases, intermediary
> +# "EDK2 packages" will be built in $(EDK2_BUILD_PACKAGES) in order for EDK2
> +# to be able to use them in subsequent build stages.
> +#
> +# For more information about the build setup:
> +# https://edk2-docs.gitbook.io/edk-ii-build-specification/4_edk_ii_build_process_overview
> +
> +EDK2_GIT_SUBMODULES = YES
> +EDK2_BUILD_PACKAGES = $(@D)/Build/Buildroot
> +EDK2_PACKAGES_PATH = $(@D):$(EDK2_BUILD_PACKAGES):$(STAGING_DIR)/usr/share/edk2-platforms
> +
> +ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
> +EDK2_DEPENDENCIES += host-nasm
> +EDK2_PACKAGE_NAME = OvmfPkg
> +EDK2_PLATFORM_NAME = OvmfPkgX64
> +EDK2_BUILD_DIR = OvmfX64
> +
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU),y)
> +EDK2_PACKAGE_NAME = ArmVirtPkg
> +EDK2_PLATFORM_NAME = ArmVirtQemu
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
> +
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL),y)
> +EDK2_PACKAGE_NAME = ArmVirtPkg
> +EDK2_PLATFORM_NAME = ArmVirtQemuKernel
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
> +
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
> +EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
> +EDK2_PLATFORM_NAME = ArmVExpress-FVP-AArch64
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
> +
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX),y)
> +EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
> +EDK2_PACKAGE_NAME = Platform/Socionext/DeveloperBox
> +EDK2_PLATFORM_NAME = DeveloperBox
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
> +EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
> +EDK2_BUILD_OPTS += -D DO_X86EMU=TRUE
> +EDK2_PRE_BUILD_HOOKS += EDK2_PRE_BUILD_SOCIONEXT_DEVELOPERBOX
> +
> +define EDK2_PRE_BUILD_SOCIONEXT_DEVELOPERBOX
> + mkdir -p $(EDK2_BUILD_PACKAGES)/Platform/Socionext/DeveloperBox
> + $(ARM_TRUSTED_FIRMWARE_DIR)/tools/fiptool/fiptool create \
> + --tb-fw $(BINARIES_DIR)/bl31.bin \
> + --soc-fw $(BINARIES_DIR)/bl31.bin \
> + --scp-fw $(BINARIES_DIR)/bl31.bin \
> + $(EDK2_BUILD_PACKAGES)/Platform/Socionext/DeveloperBox/fip_all_arm_tf.bin
> +endef
> +
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN),y)
> +EDK2_DEPENDENCIES += host-dtc
> +EDK2_PACKAGE_NAME = Platform/SolidRun/Armada80x0McBin
> +EDK2_PLATFORM_NAME = Armada80x0McBin
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
> +EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
> +EDK2_BUILD_OPTS += -D INCLUDE_TFTP_COMMAND
> +
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
> +EDK2_DEPENDENCIES += arm-trusted-firmware
> +EDK2_PACKAGE_NAME = Platform/Qemu/SbsaQemu
> +EDK2_PLATFORM_NAME = SbsaQemu
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
> +EDK2_PRE_BUILD_HOOKS += EDK2_PRE_BUILD_QEMU_SBSA
> +
> +define EDK2_PRE_BUILD_QEMU_SBSA
> + mkdir -p $(EDK2_BUILD_PACKAGES)/Platform/Qemu/Sbsa
> + ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_BUILD_PACKAGES)/Platform/Qemu/Sbsa/
> +endef
> +
> +endif
> +
> +EDK2_BASETOOLS_OPTS = \
> + EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
> + EXTRA_OPTFLAGS="$(HOST_CPPFLAGS)"
> +
> +EDK2_BUILD_ENV += \
> + WORKSPACE=$(@D) \
> + PACKAGES_PATH=$(EDK2_PACKAGES_PATH) \
> + PYTHON_COMMAND=$(HOST_DIR)/bin/python3 \
> + IASL_PREFIX=$(HOST_DIR)/bin/ \
> + NASM_PREFIX=$(HOST_DIR)/bin/ \
> + GCC5_$(EDK2_ARCH)_PREFIX=$(TARGET_CROSS)
> +
> +EDK2_BUILD_OPTS += \
> + -t GCC5 \
> + -n $(BR2_JLEVEL) \
> + -a $(EDK2_ARCH) \
> + -b $(EDK2_BUILD_TYPE) \
> + -p $(EDK2_PACKAGE_NAME)/$(EDK2_PLATFORM_NAME).dsc
> +
> +define EDK2_BUILD_CMDS
> + mkdir -p $(EDK2_BUILD_PACKAGES)
> + export $(EDK2_BUILD_ENV) && \
> + unset ARCH && \
> + source $(@D)/edksetup.sh && \
> + $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/BaseTools $(EDK2_BASETOOLS_OPTS) && \
> + build $(EDK2_BUILD_OPTS) all
> +endef
> +
> +define EDK2_INSTALL_IMAGES_CMDS
> + cp -f $(@D)/Build/$(EDK2_BUILD_DIR)/$(EDK2_BUILD_TYPE)_GCC5/FV/*.fd $(BINARIES_DIR)
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.24.3 (Apple Git-128)
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210319/1ed3466e/attachment.html>
