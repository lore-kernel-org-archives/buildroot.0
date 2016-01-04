From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jan 2016 00:39:14 +0100
Subject: [Buildroot] [PATCH 1/2] Updated the Beaglebone configuration:
In-Reply-To: <1451854885-12011-1-git-send-email-clarocq@gmail.com>
References: <1451854885-12011-1-git-send-email-clarocq@gmail.com>
Message-ID: <568B02A2.5010708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Chris,

 The subject line of your patch should be something like:

configs: beaglebone: update kernel and uboot

On 03-01-16 22:01, Chris LaRocque wrote:
> From: Chris LaRocque <clarocq@L-Desktop.blhome.net>
> 
> Changed to Kernel from Beagleboard.org 4.1.13-ti-r36.
> added uboot 2015.10 patches from https://github.com/eewiki/u-boot-patches/blob/master/v2015.10/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
> Changed to the beagloeboard.org patched DTC from https://github.com/RobertCNelson/dtc.git bb.org-4.1-dt-overlays5

 The commit message should be wrapped at 72 columns.

 Also no need to quote the full URLs here, they're mentioned in the files below.
So the commit message could be something like:

configs: beaglebone: update kernel and uboot

Changed to linux 4.1.13-ti-r36 from beagleboard.org. Remove the no longer
applicable linux patch.

Changed to uboot 2015.10 and added a patch from eewiki.

Patch dtc to the beagleboard.org version.

Update kernel config to use in-tree bb.org_defconfig with config fragments.


[See below for an explanation of the last two sentences.]

> 
> Signed-off-by: Chris LaRocque <clarocq@gmail.com>
> ---
>  board/beaglebone/linux-3.12.config                 | 251 -------
>  ...cache-flush-management-symbols-when-MULTI.patch |  34 -
>  .../0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch   | 754 +++++++++++++++++++++

 Instead of including the full patch here, it's probably better to set

BR2_TARGET_UBOOT_PATCH="https://github.com/eewiki/u-boot-patches/raw/master/v2015.10/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch"


>  board/beaglebone/uEnv.txt                          |  14 +-
>  configs/beaglebone_defconfig                       |  43 +-
>  package/dtc/Config.in                              |   2 +-
>  package/dtc/Config.in.host                         |   2 +-
>  package/dtc/dtc.hash                               |   2 -
>  package/dtc/dtc.mk                                 |   6 +-

 This is not acceptable. This would change the DTC version for _all_ boards, not
just the beagleboard. We're not going to want this. Instead, a
beaglebone-specific patch should be added. What you should do is:

1. Set

BR2_GLOBAL_PATCH_DIR=board/beaglebone/patches


2. Download the four final commits from
https://github.com/pantoniou/dtc/commits/dt-overlays5
as four separate patch files in board/beaglebone/patches/dtc. Make sure they are
numbered 0001-... like the output of git-format-patch.


 Now when you build the dtc for beaglebone, the overlays patches will be applied
to it. Note: I haven't tested if there is a conflict between these patches and
the one we have in package/dtc/. If that is the case, you'll have to rework the
overlay patches to solve the conflict.


 BTW, if it would have been OK to modify the dtc package itself, then that
should have been a separate patch.

>  9 files changed, 804 insertions(+), 304 deletions(-)
>  delete mode 100644 board/beaglebone/linux-3.12.config
>  delete mode 100644 board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
>  create mode 100644 board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
>  delete mode 100644 package/dtc/dtc.hash

[snip]

> diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
> index e09fff5..b6de9ff 100644
> --- a/board/beaglebone/uEnv.txt
> +++ b/board/beaglebone/uEnv.txt
> @@ -1,3 +1,13 @@
> -bootpart=0:1
>  bootdir=
> -uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
> +bootfile=zImage
> +fdtfile=am335x-boneblack.dtb
> +loadaddr=0x80007fc0
> +fdtaddr=0x80F80000

 Aren't the defaults for these two OK?

> +loadfdt=fatload mmc 0:1 ${fdtaddr} ${fdtfile}
> +loaduimage=fatload mmc 0:1 ${loadaddr} ${bootfile}

 Minor nit: you're loading a zImage, not a uImage, so calling it loaduimage is
weird. Just call it loadimage like in the default environment.

> +console=ttyO0,115200n8
> +mmcroot=/dev/mmcblk0p2
> +mmcrootfstype=ext2
> +uenvcmd=mmc rescan; run loaduimage; run loadfdt; run fdtboot
> +fdtboot=run mmc_args; run mmcargs; bootz ${loadaddr} - ${fdtaddr}

 I don't think there's an mmcargs environment variable.

> +mmc_args=setenv bootargs console=${console} ${optargs} root=${mmcroot} rw rootfstype=${mmcrootfstype} rootwait
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index ddb583c..dea34d9 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -1,14 +1,33 @@
>  # architecture

 There are a bunch of things here that you copied from the .config file but that
actually aren't necessary (they're not even user-visible options so they'll be
completely ignored). You only need to explicitly set some options that are
removed by 'make defconfig' because they are default, not the hidden options.

> +BR2_ARCH_HAS_MMU_OPTIONAL=y

 This one.

>  BR2_arm=y
> +BR2_ARCH="arm"
> +BR2_ENDIAN="LITTLE"
> +BR2_GCC_TARGET_ABI="aapcs-linux"
> +BR2_GCC_TARGET_CPU="cortex-a8"
> +BR2_GCC_TARGET_FPU="neon"
> +BR2_GCC_TARGET_FLOAT_ABI="hard"
> +BR2_GCC_TARGET_MODE="arm"
> +BR2_ARCH_HAS_ATOMICS=y
> +BR2_BINFMT_SUPPORTS_SHARED=y
> +BR2_BINFMT_ELF=y
> +BR2_ARM_CPU_HAS_NEON=y
> +BR2_ARM_CPU_HAS_VFPV2=y
> +BR2_ARM_CPU_HAS_VFPV3=y
> +BR2_ARM_CPU_HAS_ARM=y
> +BR2_ARM_CPU_HAS_THUMB2=y
> +BR2_ARM_CPU_ARMV7A=y

 Everything above except BR2_arm=y

>  BR2_cortex_a8=y
>  BR2_ARM_EABIHF=y
> +BR2_ARM_FPU_NEON=y

 This is bad, because it might break some packages (at runtime) because of
non-IEEE-754 arithmetic).

> +BR2_ARM_INSTRUCTIONS_ARM=y

 This one can also be removed.

>  
>  # system
>  BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/measbone/post-image.sh"

 The measbone directory doesn't exist. Did you actually test this with a clean
repository?

>  
>  # filesystem
>  BR2_PACKAGE_AM33X_CM3=y
> @@ -17,14 +36,17 @@ BR2_TARGET_ROOTFS_EXT2=y
>  
>  # lock down headers to avoid breaking with new defaults
>  BR2_KERNEL_HEADERS_VERSION=y
> -BR2_DEFAULT_KERNEL_VERSION="3.12.10"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
> +BR2_DEFAULT_KERNEL_VERSION="4.1.13"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +BR2_DEFAULT_KERNEL_HEADERS="4.1.13"

 This one should be removed too.

>  
>  # bootloader
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
> +BR2_TARGET_UBOOT_LATEST_VERSION=y

 No, it should remain a custom version, not the latest version.

> +BR2_TARGET_UBOOT_VERSION="2015.10"
> +BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/beaglebone/patches/uboot/"

 The $(TOPDIR) part should be removed. And if you set BR2_GLOBAL_PATCH_DIR it's
not even needed. And of course you can point directly to the patch to be
downloaded instead of including it in buildroot.

> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="MLO"
> @@ -32,11 +54,12 @@ BR2_TARGET_UBOOT_SPL_NAME="MLO"
>  # kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"
> -BR2_LINUX_KERNEL_PATCH="board/beaglebone/patches/linux/"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/beagleboard/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.1.13-ti-r36"
> +BR2_LINUX_KERNEL_PATCH="board/measbone/patches/linux/"

 measbone still doesn't exist, and anyway no linux patch should be needed
anymore, so leave this out completely.


>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/output/build/linux-4.1.13-ti-r36/arch/arm/configs/bb.org_defconfig"

 You should instead set BR2_LINUX_KERNEL_USE_DEFCONFIG=y and
BR2_LINUX_KERNEL_DEFCONFIG="bb.org"

 Also, you should set

BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.1.config-fragment"

and of course create that file (see my comments in the next patch).

>  BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"

[snip]


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
