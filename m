From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 17 Jan 2018 10:26:21 +0000
Subject: [Buildroot] [PATCH v2] board: add support for ARC HS
 Development Kit (HSDK)
In-Reply-To: <20171219145554.17718-1-didin@synopsys.com>
References: <20171219145554.17718-1-didin@synopsys.com>
Message-ID: <1516184781.5058.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Are there any comments about this one?
Otherwise could you please consider applying that patch.

-Evgeniy

On Tue, 2017-12-19 at 17:55 +0300, Evgeniy Didin wrote:
> Synopsys DesignWare HSDK (which stands for ARC HS
> Development Kit) is the latest and greatest development
> platform that sports quad-core ARC HS38 in real silicon.
> 
> Most noticeable features of the board are:
> ?* Quad-core ARC HS38 CPU running at 1GHz
> ?* 4Gb of DDR
> ?* Built-in Vivante GPU (well supported via open source
> ???Etnaviv drivers)
> ?* Built-in Wi-Fi/Bluetooth module (RedPine RS-9113)
> 
> And as usual we have:
> ?* [micro] SD-card slot
> ?* 2 USB 2.0 ports
> ?* 1Gbit Ethernet port
> ?* Built-in Digilent JTAG probe
> ?* Serial port accessible via micro-USB port
> 
> Writing sdcard.img on SDcard creates two partitions:
> ?* FAT32 with uImage and uboot.env
> ?* EXT4 with root filesystem
> 
> We modify kernel config because in default hsdk kernel config
> CONFIG_INITRAMFS_SOURCE parameter is set and when we build
> rootfs separately (BR2_TARGET_ROOTFS_INITRAMFS is not set)
> error appears. Also we set up CONFIG_ARC_UBOOT_SUPPORT which
> enables usage of uboot variables in the boot process.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Changes since v1:
> -add entries in DEVELOPERS and .gitlab-ci.yml
> -change genimage-hsdk.cfg to genimage.cfg
> -enable BR2_TARGET_UBOOT_ENVIMAGE against mkenvimage in post-image.sh
> -add renaming "uboot-env.bin" to "uboot.env" in post-image.sh
> -changed tar to gzip when archiving sdcard.img
> ?.gitlab-ci.yml?????????????????????|??1 +
> ?DEVELOPERS?????????????????????????|??1 +
> ?board/synopsys/hsdk/genimage.cfg???| 26 +++++++++++++++++++++++++
> ?board/synopsys/hsdk/linux.fragment |??2 ++
> ?board/synopsys/hsdk/post-image.sh??| 18 ++++++++++++++++++
> ?board/synopsys/hsdk/uboot.env.txt??|??9 +++++++++
> ?configs/snps_hsdk_defconfig????????| 39
> ++++++++++++++++++++++++++++++++++++++
> ?7 files changed, 96 insertions(+)
> ?create mode 100644 board/synopsys/hsdk/genimage.cfg
> ?create mode 100644 board/synopsys/hsdk/linux.fragment
> ?create mode 100755 board/synopsys/hsdk/post-image.sh
> ?create mode 100644 board/synopsys/hsdk/uboot.env.txt
> ?create mode 100644 configs/snps_hsdk_defconfig
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 691669f7f1..00e3879f00 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -215,6 +215,7 @@ snps_arc700_axs101_defconfig: *defconfig
> ?snps_archs38_axs103_defconfig: *defconfig
> ?snps_archs38_haps_defconfig: *defconfig
> ?snps_archs38_vdk_defconfig: *defconfig
> +snps_hsdk_defconfig: *defconfig
> ?socrates_cyclone5_defconfig: *defconfig
> ?solidrun_macchiatobin_mainline_defconfig: *defconfig
> ?solidrun_macchiatobin_marvell_defconfig: *defconfig
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fe989c0775..9a93e423af 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -153,6 +153,7 @@ F:	package/wf111/
> ?
> ?N:	ARC Maintainers <arc-buildroot@synopsys.com>
> ?F:	arch/Config.in.arc
> +F:	board/synopsys
> ?
> ?N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ?F:	package/axfsutils/
> diff --git a/board/synopsys/hsdk/genimage.cfg
> b/board/synopsys/hsdk/genimage.cfg
> new file mode 100644
> index 0000000000..8928f704a2
> --- /dev/null
> +++ b/board/synopsys/hsdk/genimage.cfg
> @@ -0,0 +1,26 @@
> +image boot.vfat {
> +??vfat {
> +????files = {
> +??????"uboot.env",
> +??????"uImage"
> +????}
> +??}
> +??size = 100M
> +}
> +
> +image sdcard.img {
> +??hdimage {
> +??}
> +
> +??partition boot {
> +????partition-type = 0xC
> +????bootable = "true"
> +????image = "boot.vfat"
> +??}
> +
> +??partition rootfs {
> +????partition-type = 0x83
> +????image = "rootfs.ext4"
> +????size = 1G
> +??}
> +}
> diff --git a/board/synopsys/hsdk/linux.fragment
> b/board/synopsys/hsdk/linux.fragment
> new file mode 100644
> index 0000000000..53b9305e09
> --- /dev/null
> +++ b/board/synopsys/hsdk/linux.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_INITRAMFS_SOURCE=
> +CONFIG_ARC_UBOOT_SUPPORT=y
> diff --git a/board/synopsys/hsdk/post-image.sh
> b/board/synopsys/hsdk/post-image.sh
> new file mode 100755
> index 0000000000..e99a4a0b96
> --- /dev/null
> +++ b/board/synopsys/hsdk/post-image.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash
> +
> +BOARD_DIR="$(dirname $0)"
> +BOARD_NAME="$(basename ${BOARD_DIR})"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +rm -rf "${GENIMAGE_TMP}"
> +
> +mv ${BINARIES_DIR}/uboot-env.bin ${BINARIES_DIR}/uboot.env
> +
> +genimage???????????????????????????\
> +????????--rootpath "${TARGET_DIR}"?????\
> +????????--tmppath "${GENIMAGE_TMP}"????\
> +????????--inputpath "${BINARIES_DIR}"??\
> +????????--outputpath "${BINARIES_DIR}" \
> +????????--config "${GENIMAGE_CFG}"
> +gzip < ${BINARIES_DIR}/sdcard.img > ${BINARIES_DIR}/sdcard.img.gz
> +exit $?
> diff --git a/board/synopsys/hsdk/uboot.env.txt
> b/board/synopsys/hsdk/uboot.env.txt
> new file mode 100644
> index 0000000000..6bcfb56a77
> --- /dev/null
> +++ b/board/synopsys/hsdk/uboot.env.txt
> @@ -0,0 +1,9 @@
> +baudrate=115200
> +bootargs=console=ttyS3,115200n8 root=/dev/mmcblk0p2 rootwait
> +bootcmd=fatload mmc 0:1; bootm
> +bootdelay=2
> +bootfile=uImage
> +loadaddr=0x82000000
> +stderr=serial0 at f0005000
> +stdin=serial0 at f0005000
> +stdout=serial0 at f0005000
> diff --git a/configs/snps_hsdk_defconfig
> b/configs/snps_hsdk_defconfig
> new file mode 100644
> index 0000000000..1f699f5e8c
> --- /dev/null
> +++ b/configs/snps_hsdk_defconfig
> @@ -0,0 +1,39 @@
> +#Architecture
> +BR2_arcle=y
> +BR2_archs38=y
> +
> +#Linux headers
> +BR2_KERNEL_HEADERS_4_14=y
> +
> +#System
> +BR2_TARGET_GENERIC_HOSTNAME="hsdk"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
> +BR2_SYSTEM_DHCP="eth0"
> +
> +#Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
> +BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fr
> agment"
> +
> +#Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/synopsys/hsdk/post-image.sh"
> +
> +#Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_FORMAT_ELF=y
> +BR2_TARGET_UBOOT_ENVIMAGE=y
> +BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/synopsys/hsdk/uboot.env.txt"
> +BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x4000"
