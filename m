From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Jun 2015 22:49:09 +0200
Subject: [Buildroot] [V2 4/4] A20-OLinuXino-Lime: new board (mali)
In-Reply-To: <1434741204-3988-5-git-send-email-francois.perrad@gadz.org>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
 <1434741204-3988-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <55848045.20708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Francois,

On 06/19/15 21:13, Francois Perrad wrote:
> config mali / sunxi like Cubieboard2
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 It would have been polite to mention in the cover letter or here why you don't
agree with my earlier suggestion to merge the two readme files. But no need to
change that, it's OK to keep them split.

 Again some minor documentation fixes below, otherwise:
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +How setting up the SD card

How to write the SD card

> +==========================
> +
> +Depending on the rootfs size, you might want to use a 2GB or larger SD-card.
> +The script `mksunxicard.sh` will take care of partitioning and formatting
> +the SD-card.
> +
> +BEWARE! This process will erase your SD card.
> +
> +Use `dmesg` to find out where the SD card is attached in the /dev tree
> +(<device>) and then:
> +
> +    # ./mksunxicard.sh <images_dir> <device>
> +
> +where:
> +    - <images_dir> is the directory containing the generated files (usually
> +    output/images)
> +    - <device> is the device file of the SD card (usually /dev/sdX)

/dev/sdX or /dev/mmcblkX

> +
> +
> +Finish
> +======
> +
> +Eject the SD card, insert it in the A20-OLinuXino-LIME board, and power it up.
> +
> diff --git a/configs/olimex_a20_olinuxino_mali_defconfig b/configs/olimex_a20_olinuxino_mali_defconfig
> new file mode 100644
> index 0000000..2af885d
> --- /dev/null
> +++ b/configs/olimex_a20_olinuxino_mali_defconfig
> @@ -0,0 +1,44 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +
> +# Kernel headers
> +BR2_KERNEL_HEADERS_3_4=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to use OLinuXino!"

Welcome to OLinuXino!


 Regards,
 Arnout

> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino_lime/boot-mali.cmd $(BINARIES_DIR)"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
> +# based on Linux version 3.4.103
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> +BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
> +
> +# sunxi packages
> +BR2_PACKAGE_SUNXI_TOOLS=y
> +BR2_PACKAGE_SUNXI_BOARDS=y
> +BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"
> +
> +# Bootloaders
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_VERSION="sunxi"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
> +# based on U-Boot 2014.04
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ea1ac32bf76eb60baef474c2516fc431b381d952"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
