From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 15:23:44 +0200
Subject: [Buildroot] [PATCH] configs/beaglebone: bump kernel and U-Boot
 versions
In-Reply-To: <20210516180952.22014-1-vincent.stehle@laposte.net>
References: <20210516180952.22014-1-vincent.stehle@laposte.net>
Message-ID: <20210518132344.GL2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2021-05-16 20:09 +0200, Vincent Stehl? via buildroot spake thusly:
> - Bump kernel to version 5.10.30-ti-r3.
> - Bump U-Boot to version 2021.04.
> 
> Add mdev to the beaglebone_defconfig. This gives us automatic USB support,
> as the omap2plus kernel has most drivers as modules.
> 
> While at it, enable VFPv3 with 32 registers (instead of 16) and add a few
> comments to the defconfig.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Lothar Felten <lothar.felten@gmail.com>

Applied to next, thanks.

> ---
> I have tested on Beaglebone Black that UART, SD card, USB host, ethernet and
> HDMI work fine. I don't have the other beaglebones so testers are welcome!

Good enough for me, thanks!

> For auto-loading the modules we could also use eudev to be a bit more aligned
> with the '_qt5 defconfig but I think mdev is lighter. Let me know if eudev is
> preferred.

mdev is OK.

> Also if you don't like the defconfig comments just let me know and I can
> resubmit without them.

I tend to prefer that we have 'raw' defconfig files, i.e. ones that we
directly get from running 'make savedefconfig'. However, a few others
prefer cefconfigs that have comments, so I've applied your patch with
comments.

TBH, I would like we get rid of comments, because it makes it more
difficult to maintain and update defconfig files... But that's for
another series, if at all...

Thanks! :-)

Regards,
Yann E. MORIN.

> This updates de-synchronizes the versions with the ones in the '_qt5 defconfig;
> I hope this is ok. The '_qt5 defconfig is a bit more complicated to update as
> we need to update the sgx packages in sync. This can be done later on.
> 
> Best regards,
> Vincent.
> 
> 
>  configs/beaglebone_defconfig | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 9a4be13ec5..763696d1dd 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -1,31 +1,52 @@
> +# Architecture
>  BR2_arm=y
>  BR2_cortex_a8=y
> +BR2_ARM_FPU_VFPV3=y
> +
> +# Patches
>  BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +
> +# System
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +
> +# Image
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
> +
> +# Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.79-ti-r30)/linux-4.19.79-ti-r30.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Bootloader
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="MLO"
> +
> +# Required tools to create the SD image
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +
> +# Supporting host tools to build FIT image
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
