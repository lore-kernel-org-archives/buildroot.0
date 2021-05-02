From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 2 May 2021 12:39:55 +0200
Subject: [Buildroot] [PATCH v4 02/10] boot/edk2: new package
In-Reply-To: <cfUXQAgDs4RPfVpR1ucb2kKFjIH4ReGNWctEOl4WA@cp4-web-032.plabs.ch>
References: <cfUXQAgDs4RPfVpR1ucb2kKFjIH4ReGNWctEOl4WA@cp4-web-032.plabs.ch>
Message-ID: <CAK4VdL2JHVBsxMK=ByCSr4XCxmw_vRu4vupN0Bqqwnxx-3vp5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry for looking at these so late. Since I see no v5 yet, I have some
additional feedback below:

On Thu, Mar 18, 2021 at 4:50 PM Dick Olsson via buildroot
<buildroot@busybox.net> wrote:
> +config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
> +       bool "ARM Virt Qemu (flash)"
> +       depends on BR2_aarch64
> +       help
> +         Configuration for QEMU targeting the Virt machine.
> +         This platform will only boot from flash address 0x0.
> +         It should therefore be used as the first bootloader.
> +
> +config BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
> +       bool "ARM Virt Qemu (kernel)"
> +       depends on BR2_aarch64
> +       help
> +         Configuration for QEMU targeting the Virt machine.
> +         This platform can boot from either flash address 0x0 or via
> +         the Linux boot protocol. It can therefore be loaded by a
> +         previous bootloader like ARM Trusted Firmware or OP-TEE.
> +
> +config BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
> +       bool "ARM SGI-575"
> +       depends on BR2_aarch64
> +       help
> +         Configuration for ARM SGI-575 on the Fixed Virtual Platform (FVP).
> +
> +config BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
> +       bool "ARM VExpress FVP Aarch64"
> +       depends on BR2_aarch64
> +       help
> +         Configuration for ARM Versatile Express targeting the
> +         Fixed Virtual Platform (FVP) AArch64 platform.
> +
> +config BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
> +       bool "Socionext DeveloperBox"
> +       depends on BR2_aarch64
> +       depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
> +       depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> +       select BR2_PACKAGE_HOST_DTC
> +       help
> +         Configuration for the Socionext SynQuacer DeveloperBox (SC2A11).
> +
> +comment "Socionext DeveloperBox depends on ATF not using EDK2 as BL33"
> +    depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> +
> +config BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
> +       bool "SolidRun MacchiatoBin"
> +       depends on BR2_aarch64
> +       depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
> +       select BR2_PACKAGE_HOST_DTC
> +       help
> +         Configuration for the SolidRun MacchiatoBin.
> +
> +config BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA
> +       bool "QEMU SBSA"
> +       depends on BR2_aarch64
> +       depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
> +       depends on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> +       help
> +         Configuration for QEMU targeting the SBSA reference platform.

This platform list looks like it would be significant effort to maintain.
These are already 8 platforms and there would have to be a new config
option per platform and platform specific code in the recipe.

I wonder if these should be dropped and just have EDK2_PACKAGE_NAME
and EDK2_PLATFORM_NAME as string options here.
That would be more aligned to what is done for example in the kernel
or u-boot, where you have to specify the defconfig.
For the other dependencies, there could be
BR2_TARGET_EDK2_NEEDS_{nasm,dtc}, also similar to what is done in
kernel and u-boot.

If something really custom needs to be scripted per platform... maybe
for now it should go to the post-{build,image} scripts instead.

But I get it that it would be a bit less user friendly in the end. Thoughts?

> +ifeq ($(BR2_TARGET_EDK2_DEBUG),y)
> +EDK2_BUILD_TYPE = DEBUG
> +else
> +EDK2_BUILD_TYPE = RELEASE
> +endif

Maybe BR2_TARGET_EDK2_DEBUG can be dropped and EDK2_BUILD_TYPE made to
follow the global BR2_ENABLE_DEBUG.

Thanks





Erico
