From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 May 2020 21:52:16 +0200
Subject: [Buildroot] [PATCH] board: Add Kontron SMARC-sAL28 support
In-Reply-To: <20200510133106.25067-1-michael@walle.cc>
References: <20200510133106.25067-1-michael@walle.cc>
Message-ID: <20200510195216.GV12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-05-10 15:31 +0200, Michael Walle spake thusly:
> From: Michael Walle <michael.walle@kontron.com>
> 
> Now that upstream supports this board add buildroot support for it, too.
> 
> This supports:
>  - upstream linux kernel, 5.7-rc4 for now. Once 5.7 is released and
>    buildroot will switch to this kernel
>      BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>    can be removed.

Not necessarily. We have defconfigs that are using a speicifc version of
the mainstream kernel:

    configs/aarch64_efi_defconfig:BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
    configs/warp7_defconfig:BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"

So, it is also good to stick to a known-working version.

However, since we have weekly builds of the defconfigs, I believe that
it is also good to have to version choice, so that the latest kernel is
used, and so that we can detect build breakage.

Your pick.

>  - building an image which can be installed to eMMC or SD card.
>  - upstream u-boot patches are pending, therefore no support for
>    building a bootloader for now.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
[--SNIP--]
> diff --git a/board/kontron/smarc-sal28/linux.fragment b/board/kontron/smarc-sal28/linux.fragment
> new file mode 100644
> index 0000000000..748f96ab7a
> --- /dev/null
> +++ b/board/kontron/smarc-sal28/linux.fragment
> @@ -0,0 +1,14 @@
> +CONFIG_NET_DSA=m
> +CONFIG_NET_DSA_TAG_OCELOT=m
> +CONFIG_NET_DSA_MSCC_FELIX=m
> +CONFIG_CAN_FLEXCAN=m
> +CONFIG_FSL_ENETC=y
> +CONFIG_FSL_ENETC_VF=y
> +CONFIG_FSL_ENETC_HW_TIMESTAMPING=y

Thhat one is neither in 5.7-rc4, nor in master...

> +CONFIG_MSCC_OCELOT_SWITCH=m
> +CONFIG_PCIE_DW_PLAT_HOST=y
> +CONFIG_GPIO_MPC8XXX=y
> +CONFIG_SND_SOC_FSL_SAI=m
> +CONFIG_SND_SOC_WM8904=m
> +CONFIG_RTC_DRV_RV8803=y
> +CONFIG_COMMON_CLK_FSL_SAI=y
> diff --git a/board/kontron/smarc-sal28/post-build.sh b/board/kontron/smarc-sal28/post-build.sh
> new file mode 100755
> index 0000000000..08ad1d30c0
> --- /dev/null
> +++ b/board/kontron/smarc-sal28/post-build.sh

Naming a post-build script 'post-build.sh' is not very meaningful;
instead, it is better when the name of the script hints at what the
script does, like the genimage.sh script we use as a post-image script.

Maybe: 'gen-bootscript' ?

Also, adding the '.sh' extension is totally superfluous, and I tend to
dislike it for new scripts.

> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +BOARD_DIR="$(dirname $0)"
> +
> +# There is a BR2_TARGET_UBOOT_BOOT_SCRIPT option but it is only available
> +# if we are building u-boot :( Therefore, create the bootsript manually for
> +# now.

This comment is not very valuable in the script itself, where it is
destined to bit-rot. It makes sense to have it in the commit log,
though.

> +$MKIMAGE -C none -T script -d $BOARD_DIR/boot.cmd $TARGET_DIR/boot/boot.scr
> diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
> new file mode 100644
> index 0000000000..51c56caae1
> --- /dev/null
> +++ b/configs/kontron_smarc_sal28_defconfig
> @@ -0,0 +1,18 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/kontron/smarc-sal28/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="v5.7-rc4"

So, when 5.7 is tagged, you have two options:

  - drop the custom version, so the latest kernel is always used, both
    for the headers and the kernel itself;

  - stick to a known version (likely. 5.7!) and also force the headers
    to that version, with BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7 (to
    be introduced first, of course).

As I said above, I'm fine either way.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/kontron/smarc-sal28/linux.fragment"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -- 
> 2.20.1
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
