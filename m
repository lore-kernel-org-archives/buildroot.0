From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 5 Feb 2020 14:39:29 +0200
Subject: [Buildroot] [PATCH v4 9/9] board/nxp/ls1028ardb: new board
In-Reply-To: <20200205105227.13698-9-jerry.huang@nxp.com>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
 <20200205105227.13698-9-jerry.huang@nxp.com>
Message-ID: <CA+h21hq0rYdQ7zUu1CCTvu56FJ15d0YApbjSA0sAkFL6KXWoGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerry,

On Wed, 5 Feb 2020 at 12:54, Changming Huang <jerry.huang@nxp.com> wrote:
>
> This is to support NXP LS1028ARDB board in Buildroot.
> The board is setup to track the Linux at 4.19 via NXP LSDK-19.09.
>
> The target will build uboot and RCW binary with arm-trusted-firmware support.
>
> board/nxp/ls1028ardb/: scripts related with ls1028ardb
> nxp_ls1028ardb-64b_defconfig: defconfig boot from SD card
>
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
> changes since v3:
> 1. merge previous version patch 8 and patch 9 to one.
> 2. split RCW options BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE to another patch.
> 3. remove scritps about emmc and xspi.
> 4. remove xspi and emmc configuration.
> 5. add new option BR2_ROOTFS_OVERLAY for 10-network.rules.
> 6. modify u-boot environment scripts, remove all setting not used.
> 7. remove the scripts which is not used by default configuration.
>
> changes since v2:
> 1. Modify the qoriq-cadence-dp-firmware option in defconfig.
> 2. rename defconfig to nxp_ls1028*.
> 3. remove extra packages except busybox in defconfig.
> 4. modify the description of file genimage.xspi.cfg.template.
>
> changes since v1:
> 1. add new option in configs/freescale_ls1028ardb-xxxx_defconfig.
> ---
>  board/nxp/common/ls/busybox.config            |  9 ++
>  .../etc/udev/rules.d/10-network.rules         | 16 ++++
>  board/nxp/ls1028ardb/genimage.sd.cfg.template | 52 ++++++++++++
>  board/nxp/ls1028ardb/post-image.sh            | 57 +++++++++++++
>  board/nxp/ls1028ardb/readme.txt               | 61 +++++++++++++
>  .../nxp/ls1028ardb/u-boot-environment-sd.txt  | 13 +++
>  configs/nxp_ls1028ardb-64b_defconfig          | 85 +++++++++++++++++++
>  7 files changed, 293 insertions(+)
>  create mode 100644 board/nxp/common/ls/busybox.config
>  create mode 100644 board/nxp/ls1028ardb/enetc_init_overlay/etc/udev/rules.d/10-network.rules
>  create mode 100644 board/nxp/ls1028ardb/genimage.sd.cfg.template
>  create mode 100755 board/nxp/ls1028ardb/post-image.sh
>  create mode 100644 board/nxp/ls1028ardb/readme.txt
>  create mode 100644 board/nxp/ls1028ardb/u-boot-environment-sd.txt
>  create mode 100644 configs/nxp_ls1028ardb-64b_defconfig
>
> diff --git a/board/nxp/common/ls/busybox.config b/board/nxp/common/ls/busybox.config
> new file mode 100644
> index 0000000000..7074c65aa6
> --- /dev/null
> +++ b/board/nxp/common/ls/busybox.config
> @@ -0,0 +1,9 @@
> +#
> +# Additional Busybox Settings
> +#
> +CONFIG_TASKSET=y
> +CONFIG_FEATURE_TASKSET_FANCY=y
> +CONFIG_FEATURE_DF_FANCY=y
> +CONFIG_FEATURE_SEAMLESS_GZ=y
> +CONFIG_FEATURE_SEAMLESS_BZ2=y
> +CONFIG_FEATURE_SEAMLESS_XZ=y
> diff --git a/board/nxp/ls1028ardb/enetc_init_overlay/etc/udev/rules.d/10-network.rules b/board/nxp/ls1028ardb/enetc_init_overlay/etc/udev/rules.d/10-network.rules
> new file mode 100644
> index 0000000000..19f41634bd
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/enetc_init_overlay/etc/udev/rules.d/10-network.rules
> @@ -0,0 +1,16 @@
> +# ENETC rules
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.0", DRIVERS=="fsl_enetc", NAME:="eno0"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.1", DRIVERS=="fsl_enetc", NAME:="eno1"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.2", DRIVERS=="fsl_enetc", NAME:="eno2"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.6", DRIVERS=="fsl_enetc", NAME:="eno3"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.0", DRIVERS=="fsl_enetc_vf", NAME:="eno0vf0"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.1", DRIVERS=="fsl_enetc_vf", NAME:="eno0vf1"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.2", DRIVERS=="fsl_enetc_vf", NAME:="eno1vf0"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.3", DRIVERS=="fsl_enetc_vf", NAME:="eno1vf1"
> +# LS1028 switch rules
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p0", NAME="swp0"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p1", NAME="swp1"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p2", NAME="swp2"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p3", NAME="swp3"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p4", NAME="swp4"
> +ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p5", NAME="swp5"
> diff --git a/board/nxp/ls1028ardb/genimage.sd.cfg.template b/board/nxp/ls1028ardb/genimage.sd.cfg.template
> new file mode 100644
> index 0000000000..ab50e103c1
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/genimage.sd.cfg.template
> @@ -0,0 +1,52 @@
> +# Minimal SD card image for the NXP boards Template
> +#
> +# SD card image (sdcard.img) format:
> +# * the SD card must have 4 kB free space at the beginning,
> +# * U-Boot is dumped as is,
> +# * a FAT partition at offset 64 MB is containing Image and DTB files
> +# * a single root filesystem partition is required (ext2, ext3 or ext4)
> +#
> +
> +image boot.vfat {
> +  vfat {
> +    files = {
> +      %FILES%
> +    }
> +  }
> +  size = 256M
> +}
> +
> +image sdcard.img {
> +  hdimage {
> +  }
> +
> +  partition rcw {
> +    in-partition-table = "no"
> +    image = "bl2_sd.pbl"
> +    offset = 4096
> +  }
> +
> +  partition u-boot {
> +    in-partition-table = "no"
> +    image = "fip.bin"
> +    offset = 1M
> +  }
> +
> +  partition u-boot-environment {
> +    in-partition-table = "no"
> +    image = "uboot-env.bin"
> +    offset = 5M
> +  }
> +
> +  partition boot {
> +    partition-type = 0xC
> +    bootable = "true"
> +    image = "boot.vfat"
> +    offset = 64M
> +  }
> +
> +  partition rootfs {
> +    partition-type = 0x83
> +    image = "rootfs.ext2"
> +  }
> +}
> diff --git a/board/nxp/ls1028ardb/post-image.sh b/board/nxp/ls1028ardb/post-image.sh
> new file mode 100755
> index 0000000000..c655074386
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/post-image.sh
> @@ -0,0 +1,57 @@
> +#!/usr/bin/env bash
> +# args from BR2_ROOTFS_POST_SCRIPT_ARGS
> +# $2 linux building directory
> +# $3 buildroot top directory
> +# $4 u-boot building directory
> +
> +#
> +# dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
> +# in ${BR_CONFIG}, then prints the corresponding list of file names for the
> +# genimage configuration file
> +#
> +dtb_file()
> +{
> +       local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
> +
> +       for dt in $DTB_LIST; do
> +               echo -n "\"`basename $dt`.dtb\", "
> +       done
> +}
> +
> +#
> +# genimage.sd.cfg.template: Boot from SD
> +# genimage.emmc.cfg.template: Boot from eMMC
> +#
> +genimage_type()
> +{
> +       if grep -Eq "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"emmc\"$" ${BR2_CONFIG}; then
> +               echo "genimage.emmc.cfg.template"
> +       elif grep -Eq "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"sd\"$" ${BR2_CONFIG}; then
> +               echo "genimage.sd.cfg.template"
> +       fi
> +}
> +
> +main()
> +{
> +       local FILES="$(dtb_file) "ls1028a-dp-fw.bin", "Image""
> +       local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
> +       local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +       sed -e "s/%FILES%/${FILES}/" \
> +               board/nxp/ls1028ardb/$(genimage_type) > ${GENIMAGE_CFG}
> +
> +       rm -rf "${GENIMAGE_TMP}"
> +
> +       genimage \
> +               --rootpath "${TARGET_DIR}" \
> +               --tmppath "${GENIMAGE_TMP}" \
> +               --inputpath "${BINARIES_DIR}" \
> +               --outputpath "${BINARIES_DIR}" \
> +               --config "${GENIMAGE_CFG}"
> +
> +       rm -f ${GENIMAGE_CFG}
> +
> +       exit $?
> +}
> +
> +main $@
> diff --git a/board/nxp/ls1028ardb/readme.txt b/board/nxp/ls1028ardb/readme.txt
> new file mode 100644
> index 0000000000..713babd7c3
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/readme.txt
> @@ -0,0 +1,61 @@
> +LS1028ARDB board is one platform based on LS1028A silicon for industry,
> +which is supported in LSDK-19.09.
> +
> +One simple image file is created by buildroot, which includes RCW, uboot,
> +Linux kernel, rootfs and other necessary binaries for this board.
> +
> +To program the image file created by buildroot into the flash.
> +There are two way to do it:
> +
> +1. Program the image file on PC machine for SD card boot
> +  $ sudo dd if=./output/images/sdcard.img of=/dev/sdx
> +  # or in some other host machine:
> +  $ sudo dd if=./output/images/sdcard.img of=/dev/mmcblkx
> +
> +  # find the right SD Card device name in your host machine and replace the
> +  # ?sdx? or ?mmcblkx?.
> +
> +2. Program the image file on board for eMMC and XSPI boot
> +Make sure your board has ipaddr, netmask, and serverip defined to reach your
> +tftp server.
> +
> +  2.1 Program eMMC boot image file to eMMC chip
> +    # Make sure output/images/sdcard.img is stored to tftp server
> +    # Below command is one example
> +    => tftpboot 0xa0000000 sdcard.img
> +    => mmc dev 1
> +    => mmc erase 0 0x200000
> +    => mmc write 0xa0000000 0 0x200000
> +
> +    # The size "0x200000" will be changed when the image size is different.
> +
> +  2.2 Program XSPI boot image file to flash
> +    # Make sure output/images/xspi.cpio.img is stored to tftp server
> +    # Below command is one example
> +    => tftpboot 0xa0000000 xspi.cpio.img
> +    => sf probe
> +    => sf erase 0 $filesize
> +    => sf write 0xa0000000 0 $filesize
> +
> +3. Booting your new system
> +Before booting the new system, we should make sure the switch setting is right.
> +below switch setting is for each booting mode:
> +    +-----------+---------------------+
> +    |Boot mode  | Switch setting      |
> +    +---------------------------------+
> +    |SD boot    | SW2[1~4] = 0b?1000  |
> +    +---------------------------------+
> +    |eMMC boot  | SW2[1~4] = 0b?1001  |
> +    +---------------------------------+
> +    |XSPI boot  | SW2[1~4] = 0b?1111  |
> +    +-----------+---------------------+
> +
> +or we use following command to reset the board in uboot prompt:
> +  # boot from SD card
> +  => qixis_reset sd
> +
> +  # boot from eMMC chip
> +  => qixis_reset emmc
> +
> +  # boot from XSPI
> +  => qixis_reset qspi
> diff --git a/board/nxp/ls1028ardb/u-boot-environment-sd.txt b/board/nxp/ls1028ardb/u-boot-environment-sd.txt
> new file mode 100644
> index 0000000000..f91e6b585f
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/u-boot-environment-sd.txt
> @@ -0,0 +1,13 @@
> +baudrate=115200
> +bootcmd=setenv bootargs root=/dev/mmcblk0p2 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200 cma=256M video=1920x1080-32 at 60;mmcinfo;fatload mmc 0:1 ${dp_load} ${dp_file}; hdp load ${dp_load} ${dp_offset};fatload mmc 0:1 ${loadaddr} ${bootfile};fatload mmc 0:1 ${fdtaddr} ${fdtfile};booti ${loadaddr} - ${fdtaddr}
> +bootdelay=3
> +bootfile=Image
> +fdtfile=fsl-ls1028a-rdb.dtb
> +loadaddr=0xa0000000
> +fdtaddr=0xb0000000
> +dp_file=ls1028a-dp-fw.bin
> +dp_load=0x90000000
> +dp_offset=0x2000
> +stderr=serial
> +stdin=serial
> +stdout=serial
> diff --git a/configs/nxp_ls1028ardb-64b_defconfig b/configs/nxp_ls1028ardb-64b_defconfig
> new file mode 100644
> index 0000000000..ede72ff0ef
> --- /dev/null
> +++ b/configs/nxp_ls1028ardb-64b_defconfig
> @@ -0,0 +1,85 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Hostname and issue
> +BR2_TARGET_GENERIC_HOSTNAME="LS1028ARDB"
> +
> +# toolchain
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_LIBC="glibc"
> +
> +# Linux headers same as kernel
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +
> +# bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="ls1028ardb_tfa"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-19.09"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_FORMAT_BIN=n
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-dtb.bin"
> +BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
> +BR2_TARGET_UBOOT_ENVIMAGE=y
> +BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/nxp/ls1028ardb/u-boot-environment-sd.txt"
> +BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-19.09-V4.19"

The LSDK has monthly bugfix releases and the most recent tag,
currently, is LSDK-19.09-update-311219-V4.19. There have been some
bugfixes since the tag you're proposing related to the Ethernet ports,
among other things. Shouldn't you use the most recently available tag?
Similar question for U-Boot and atf.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +
> +# Serial port config
> +BR2_TARGET_GENERIC_GETTY=y

I think getty on downstream Buildroot for LS1028A-RDB doesn't work
properly with this setting as y. What is different here?

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +
> +# required tools to create the microSD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nxp/ls1028ardb/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR) $(TOPDIR) $(UBOOT_DIR)"
> +
> +# busybox setting
> +BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/nxp/common/ls/busybox.config"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +
> +# packages for rcw
> +BR2_PACKAGE_HOST_QORIQ_RCW=y
> +BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE="sd"
> +BR2_PACKAGE_HOST_QORIQ_RCW_BIN="ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin"
> +
> +#Display port firmware
> +BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
> +
> +#eudev support
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_ROOTFS_OVERLAY="board/nxp/ls1028ardb/enetc_init_overlay"

Why is this called so specific "enetc_init_overlay" and not
"rootfs_overlay"? If we want to add more files to the rootfs in the
future, can't we just use the same rootfs overlay for that?

> +
> +# Arm-Trusted-Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-dtb.bin"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="LSDK-19.09"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="pbl"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES="host-qoriq-rcw"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd RCW=$(BINARIES_DIR)/rcw_1300_sdboot.bin"
> --
> 2.17.1
>

Thanks,
-Vladimir
