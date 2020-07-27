From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 27 Jul 2020 11:08:48 +0300
Subject: [Buildroot] [PATCH v2 2/6] boot/edk2: new package
In-Reply-To: <20200726100541.7710-3-hi@senzilla.io>
References: <20200726100541.7710-3-hi@senzilla.io>
Message-ID: <20200727080848.GA1615@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> EDK2 is a modern, feature-rich, cross-platform firmware development
> environment for the UEFI and PI specifications.
> 
> The initial version of this bootloader package makes it possible to
> build firmware for the following five configurations:
> 
>  * QEMU x86-64 pc machine
>  * QEMU aarch64 virt machine, booting directly from flash
>  * QEMU aarch64 virt machine, booting via kernel protocol
>  * QEMU aarch64 sbsa-ref machine
>  * ARM FVP vexpress machine
> 
> When building for QEMU sbsa-ref and ARM FVP there is a dependency
> on package/edk2-platforms for additional platform description files.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>

...


> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE
>  	bool "ARM Trusted Firmware (ATF)"
>  	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A) && \
> -		   BR2_TARGET_UBOOT
> +           BR2_TARGET_UBOOT

Just a nit: this spurious whitespace change should go to
the 5th patch in the series.

>  	help
>  	  Enable this option if you want to build the ATF for your ARM
>  	  based embedded device.

...

> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> new file mode 100644
> index 0000000000..e889070d0c
> --- /dev/null
> +++ b/boot/edk2/edk2.mk

...

> +# Platform configuration.
> +#
> +# We set the variable EDK_EL2_NAME for platforms that may load EDK2 as part of
> +# the EL2 processor context, like ARM Trusted Firmware (ATF). This way, other
> +# bootloaders know what binary to include in their firmware package.
> +#
> +# However, the QEMU SBSA platform is a bit unique as there are different
> +# implicit assumptions on how this firmware should be packaged and run.
> +# The EDK2 build system itself will package the ATF binaries.
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
> +EDK2_EL2_NAME = QEMU_EFI
> +
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
> +EDK2_DEPENDENCIES += host-edk2-platforms
> +EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
> +EDK2_PLATFORM_NAME = ArmVExpress-FVP-AArch64
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
> +EDK2_EL2_NAME = FVP_AARCH64_EFI
> +
> +else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
> +EDK2_DEPENDENCIES += host-edk2-platforms arm-trusted-firmware
> +EDK2_PACKAGE_NAME = Platform/Qemu/SbsaQemu
> +EDK2_PLATFORM_NAME = SbsaQemu
> +EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
> +EDK2_PRE_CONFIGURE_HOOKS += EDK2_OUTPUT_QEMU_SBSA
> +endif
> +
> +# For QEMU SBSA we use EDK2_OUTPUT_BASE (which is already in the EDK2 path) to
> +# build the package structure that EDK2 expects for this specific platform.
> +define EDK2_OUTPUT_QEMU_SBSA
> +	mkdir -p $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa
> +	ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa/
> +endef

Am I correct assuming that bl1.bin and fip.bin are the ATF binaries
for  qemu_sbsa platform config ?

Regards,
Sergey
