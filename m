From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Nov 2020 00:01:56 +0100
Subject: [Buildroot] [PATCH] configs/mvebu: new defconfig for Turris MOX
In-Reply-To: <20201029215629.2120636-1-olteanv@gmail.com>
References: <20201029215629.2120636-1-olteanv@gmail.com>
Message-ID: <20201101000156.2f26a917@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vladimir,

Thanks for this contribution!

On Thu, 29 Oct 2020 23:56:29 +0200
Vladimir Oltean <olteanv@gmail.com> wrote:

>  DEVELOPERS                                 |    4 +
>  board/mvebu/cznic-turris-mox/boot.cmd      |   28 +
>  board/mvebu/cznic-turris-mox/genimage.cfg  |   10 +
>  board/mvebu/cznic-turris-mox/mox.config    | 1554 ++++++++++++++++++++
>  board/mvebu/cznic-turris-mox/post-build.sh |    3 +
>  configs/cznic_turris_mox_defconfig         |   46 +

We normally like to have a readme.txt file in
board/mvebu/cznic-turris-mox/ to explain how to use the defconfig.
Especially how to use the build results on the board. See other
readme.txt files in board/.

> diff --git a/board/mvebu/cznic-turris-mox/mox.config b/board/mvebu/cznic-turris-mox/mox.config
> new file mode 100644
> index 000000000000..07f8b801f3e0
> --- /dev/null
> +++ b/board/mvebu/cznic-turris-mox/mox.config

Instead of mox.config, could you call is linux.config or kernel.config ?

Also, this configuration files looks really huge, with lots of useless
things. There's really two options there:

 - Use the full-blown arm64 defconfig from the upstream kernel,
   optionally with a small fragment file to add a few more options that
   are needed for your platform.

 - Use a dedicated configuration like you're doing, but in this case,
   it should be reasonably tweaked to the platform, which clearly isn't
   the case here.



> @@ -0,0 +1,1554 @@
> +CONFIG_ACPI_CPPC_CPUFREQ=y
> +CONFIG_ALTERA_FREEZE_BRIDGE=y
> +CONFIG_ARMADA_37XX_RWTM_MBOX=y
> +CONFIG_ARMADA_37XX_WATCHDOG=y
> +CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM=y

Allwinner stuff.

> +CONFIG_ARM_IMX_CPUFREQ_DT=y

i.MX stuff.

> +CONFIG_ARM_RASPBERRYPI_CPUFREQ=y

RPi stuff.

> +CONFIG_DRM=y

DRM for a platform that has no display.

etc.

> diff --git a/board/mvebu/cznic-turris-mox/post-build.sh b/board/mvebu/cznic-turris-mox/post-build.sh
> new file mode 100755
> index 000000000000..808c94e94b57
> --- /dev/null
> +++ b/board/mvebu/cznic-turris-mox/post-build.sh
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
> +ln -sf boot/boot.scr $TARGET_DIR/boot.scr
> diff --git a/configs/cznic_turris_mox_defconfig b/configs/cznic_turris_mox_defconfig
> new file mode 100644
> index 000000000000..bd382db1769a
> --- /dev/null
> +++ b/configs/cznic_turris_mox_defconfig
> @@ -0,0 +1,46 @@
> +# Architecture
> +BR2_aarch64=y
> +# Armada 3720
> +BR2_cortex_a53=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="1G"
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# toolchain
> +BR2_TOOLCHAIN=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
> +BR2_TOOLCHAIN_USES_GLIBC=y
> +BR2_TOOLCHAIN_EXTERNAL_GLIBC=y

Please keep the default toolchain.

> +
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_LATEST_VERSION=y

Use a fixed kernel version, and not "the latest".

> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/mvebu/cznic-turris-mox/mox.config"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-turris-mox"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/mvebu/cznic-turris-mox/boot.cmd"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/mvebu/cznic-turris-mox/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mvebu/cznic-turris-mox/genimage.cfg"
> +
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y

This should be with the rest of the U-Boot boot script options.

> +# Serial port config
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyMV0"
> +
> +# required tools to create the microSD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +
> +BR2_TARGET_GENERIC_HOSTNAME="mox"
> +
> +BR2_USE_MMU=y

Not needed.

> +BR2_USE_WCHAR=y

Ditto.

Could you rework your patch and send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
