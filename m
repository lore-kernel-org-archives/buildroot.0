From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Oct 2014 16:06:00 +0200
Subject: [Buildroot] [PATCH] socfpga-cyclone5 Dev board support
In-Reply-To: <1399342751-7799-1-git-send-email-cdhmanning@gmail.com>
References: <1399342751-7799-1-git-send-email-cdhmanning@gmail.com>
Message-ID: <543A8AC8.9000808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/14 04:19, Charles Manning wrote:
> This is somewhat derived from the SocKit booard support.
> 
> It uses a fresher Linux and u-boot than SocKit. It also speeds the
> serial port up to 115200.
> 
> Signed-off-by: Charles Manning <cdhmanning@gmail.com>

 Hi Charles,

 Sorry for the late response - better late than never :).

 Basically, it looks good to me, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

but I have some minor comments below.

> ---
>  board/altera/cyclone5/post-image.sh |   10 ++++++++++
>  board/altera/cyclone5/readme.txt    |    3 +++
>  configs/altera_cyclone5_defconfig   |   29 +++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+)
>  create mode 100755 board/altera/cyclone5/post-image.sh
>  create mode 100644 board/altera/cyclone5/readme.txt
>  create mode 100644 configs/altera_cyclone5_defconfig
> 
> diff --git a/board/altera/cyclone5/post-image.sh b/board/altera/cyclone5/post-image.sh
> new file mode 100755
> index 0000000..ad70922
> --- /dev/null
> +++ b/board/altera/cyclone5/post-image.sh
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +#
> +# Altera Cyclone 5 Development Board post processing.
> +#
> +# A rip-off of the Sockit board support
> +# 2014, "Roman Diouskine" <roman.diouskine@savoirfairelinux.com>
> +# 2014, "Sebastien Bourdelin" <sebastien.bourdelin@savoirfairelinux.com>
> +
> +# create a DTB file copy with the name expected by the u-boot config
> +cp -af $BINARIES_DIR/socfpga_cyclone5_socdk.dtb  $BINARIES_DIR/socfpga.dtb

 Since it is a single file, -a is a bit weird. And personally I'd make it an
ln -f instead, but that's a matter of taste.


> diff --git a/board/altera/cyclone5/readme.txt b/board/altera/cyclone5/readme.txt
> new file mode 100644
> index 0000000..fe5a758
> --- /dev/null
> +++ b/board/altera/cyclone5/readme.txt
> @@ -0,0 +1,3 @@
> +Modifications to make a Cyclone 5 setup. This is derived from the buildroot
> +config first done for SocKit board. See boards/altera/sockit

 Maybe it's better to copy at least part of the text from that readme, because
not all of it applies (e.g. the U-Boot patch).

> +
> diff --git a/configs/altera_cyclone5_defconfig b/configs/altera_cyclone5_defconfig
> new file mode 100644
> index 0000000..df3b8c6
> --- /dev/null
> +++ b/configs/altera_cyclone5_defconfig
> @@ -0,0 +1,29 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_EABIHF=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_FPU_NEON=y
> +BR2_ARM_INSTRUCTIONS_THUMB2=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.13.5"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/cyclone5/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.rocketboards.org/linux-socfpga.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-3.13_14.02.02"

 If you repost, could you try with rel_socfpga-3.16_14.09.02 ? That would of
course also mean updating the kernel headers version.

> +BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_socdk"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_3=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.rocketboards.org/u-boot-socfpga.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_socfpga_v2013.01.01_14.02.02"

 Same here.


 Regards,
 Arnout

> +BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/altera/cyclone5"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
