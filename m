From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 12:43:24 -0500
Subject: [Buildroot] [PATCH 2/7] zynq_zed: bump U-Boot to xilinx-v2016.2
In-Reply-To: <1468834703-27518-3-git-send-email-yamada.masahiro@socionext.com>
References: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
 <1468834703-27518-3-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <CANQCQpYK3x+YJjTp+DC0W1xJY5cBeBzOrPhJ0qoXGWfvjGU_iw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Jul 18, 2016 at 4:38 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This is the latest release tag in the Xilinx repository, based on
> U-Boot v2016.01 in the mainline.
>
> Commit 46d6a561be41 ("zedboard: Generate BOOT.BIN automatically")
> switched from the Xilinx GitHub repository to the U-Boot mainline,
> but this commit gets it back to the Xilinx GitHub repository for the
> following reasons:
>
>  - This defconfig still relies on the Xilinx's local repository for
>    the kernel.  The vendor does the best test for the combination of
>    U-Boot and the kernel with the same release tag (xilinx-v2016.2
>    in this case).
>
>  - At the time of commit 46d6a561be41, the u-boot-xlnx still needed
>    manual copy of ps7_init(_gpl).c/h in order to build a working SPL
>    image.  So, the mainline U-Boot had advantage in that point of
>    time.  However, the improvement in the mainline U-Boot was merged
>    into the u-boot-xlnx at the xilinx-v2015.3 release.  Now, the
>    mainline and the u-boot-xlnx are even in this point of view.
>
>  - The mainline U-Boot defaults to boot FIT, so something must be
>    done; either patch environments around with a local patch to
>    switch to uImage booting (current solution), or build an FIT
>    with a post build script (chromebook snow does this).  On the
>    other hand, the Xilinx repository defaults to uImage booting,
>    so it is straightforward, and needs no addition care.
>
> This commit does:
>
>  - Switch to the Xilinx custom git repository, and stick to the
>    xilinx-v2016.2 tag.
>
>  - Delete the local patch board/avnet/zedboard/uboot/0001...
>    since the Xilinx custom repository can boot uImage by default.
>
>  - Enable BR2_TARGET_UBOOT_FORMAT_IMG instead of ..._FORMAT_DTB_IMG
>    since all the Zynq boards in U-Boot enable CONFIG_OF_EMBED.
>
>  - Replace BR2_TARGET_UBOOT_ZYNQ_IMAGE with BR2_TARGET_UBOOT_SPL_NAME
>    since U-Boot can natively generate the Zynq boot image now. The
>    Zynq image support for mkimage tool was upstreamed at v2016.01
>    (so xilinx-v2016.1 as well), so no additional tool is needed
>    any more.
>
>  - Update readme.txt
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  board/avnet/zedboard/readme.txt                    | 52 ++++------------------
>  ...eate-zedboard-specific-U-Boot-environment.patch | 45 -------------------
>  configs/zynq_zed_defconfig                         | 10 ++---
>  3 files changed, 13 insertions(+), 94 deletions(-)
>  delete mode 100644 board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
>
> diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
> index 01ef97c..b2c30a3 100644
> --- a/board/avnet/zedboard/readme.txt
> +++ b/board/avnet/zedboard/readme.txt
> @@ -9,52 +9,16 @@ Steps to create a working system for Zedboard:
>
>  1) make zynq_zed_defconfig
>  2) make
> -3) copy files BOOT.BIN, u-boot-dtb.img, rootfs.cpio.uboot,
> -       uImage, zynq-zed.dtb into your SD card
> +3) All needed files will be available in the output/images directory.
> +   Create a FAT32 partition at the beginning of your SD Card and copy files:
> +     - boot.bin
> +     - u-boot.img
> +     - uImage
> +     - uramdisk.image.gz (should be renamed from rootfs.cpio.uboot)
> +     - devicetree.dtb (should be renamed from zynq-zed.dtb)
> +   into your SD card
>  4) boot your Zedboard
>
> -The expected output:
> -
> - U-Boot SPL 2015.07 (Jul 22 2015 - 12:01:55)
> - mmc boot
> - reading system.dtb
> - spl_load_image_fat_os: error reading image system.dtb, err - -1
> - reading u-boot-dtb.img
> - reading u-boot-dtb.img
> -
> - U-Boot 2015.07 (Jul 22 2015 - 12:01:55 +0200)
> -
> - Model: Zynq ZED Board
> - I2C:   ready
> - DRAM:  ECC disabled 512 MiB
> - MMC:   zynq_sdhci: 0
> - Using default environment
> - ...
> -
> -When using an older U-Boot then 2015.07, a working ps7_init.c
> -file is required to be installed into the U-Boot directory
> -structure. From 2015.07, the major Zynq-based boards are
> -supported without any manual intervention.
> -
> -Resulting system
> -----------------
> -A FAT32 partition should be created at the beginning of the SD Card
> -and the following files should be installed:
> -       /BOOT.BIN
> -       /zynq-zed.dtb
> -       /uImage
> -       /rootfs-cpio.uboot
> -       /u-boot-dtb.img
> -
> -
> -All needed files can be taken from output/images/
> -
> -BOOT.BIN, uImage and u-boot-dtb.img are direct copies of the same files
> -available on output/images/
> -
> -There is a patch attached that redefines the U-Boot's environment
> -to work with Buildroot out-of-the-box.
> -
>  You can alter the booting procedure by creating a file uEnv.txt
>  in the root of the SD card. It is a plain text file in format
>  <key>=<value> one per line:
> diff --git a/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch b/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
> deleted file mode 100644
> index 6dae31e..0000000
> --- a/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From a4c0058967a551385da5e16d2787d9f704cab225 Mon Sep 17 00:00:00 2001
> -From: Jan Viktorin <viktorin@rehivetech.com>
> -Date: Thu, 18 Jun 2015 16:26:02 +0200
> -Subject: [PATCH 2/2] zynq: Create zedboard-specific U-Boot environment
> -
> ----
> - include/configs/zynq_zed.h | 25 +++++++++++++++++++++++++
> - 1 file changed, 25 insertions(+)
> -
> -diff --git a/include/configs/zynq_zed.h b/include/configs/zynq_zed.h
> -index 946de95..2400a88 100644
> ---- a/include/configs/zynq_zed.h
> -+++ b/include/configs/zynq_zed.h
> -@@ -24,4 +24,28 @@
> -
> - #include <configs/zynq-common.h>
> -
> -+#undef CONFIG_EXTRA_ENV_SETTINGS
> -+#define CONFIG_EXTRA_ENV_SETTINGS \
> -+      "envload=mmc info && if fatload mmc 0 0x1000 uEnv.txt;"\
> -+      " then echo Importing uEnv.txt; env import -t 0x1000"  \
> -+      " $filesize; fi;\0"                                    \
> -+      "bootcmd=run envload; run $modeboot\0"                 \
> -+      "modeboot=sdboot\0"                                    \
> -+      "baudrate=115200\0"                                    \
> -+      "bootenv=uEnv.txt\0"                                   \
> -+      "devicetree_image=zynq-zed.dtb\0"                      \
> -+      "kernel_image=uImage\0"                                \
> -+      "ramdisk_image=rootfs.cpio.uboot\0"                    \
> -+      "fpga_image=system.bit\0"                              \
> -+      "sdboot=echo Booting from SD...; run fpgaboot;"        \
> -+      " fatload mmc 0 0x1000000 ${kernel_image}"             \
> -+      " && fatload mmc 0 0x2000000 ${ramdisk_image}"         \
> -+      " && fatload mmc 0 0x3000000 ${devicetree_image}"      \
> -+      " && bootm 0x1000000 0x2000000 0x3000000\0"            \
> -+      "fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image};"   \
> -+      " then echo Booting FPGA from ${fpga_image};"          \
> -+      " fpga info 0 && fpga loadb 0 0x1000000 $filesize;"    \
> -+      " else echo FPGA image ${fpga_image} was not found,"   \
> -+      " skipping...; fi;\0"
> -+
> - #endif /* __CONFIG_ZYNQ_ZED_H */
> ---
> -2.4.3
> -
> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> index 98b010e..84859bb 100644
> --- a/configs/zynq_zed_defconfig
> +++ b/configs/zynq_zed_defconfig
> @@ -17,10 +17,10 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
>  BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
> -BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/zedboard/uboot"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
