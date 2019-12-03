From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 3 Dec 2019 03:48:41 +0200
Subject: [Buildroot] [PATCH v3 9/9] configs/nxp_ls1028ardb*: new board
In-Reply-To: <20191127071720.15623-9-jerry.huang@nxp.com>
References: <20191127071720.15623-1-jerry.huang@nxp.com>
 <20191127071720.15623-9-jerry.huang@nxp.com>
Message-ID: <CA+h21hqfCkbZWJTw52X1-hEv7rj3heGYxnAXHpwXpfjxWQxmag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Nov 2019 at 09:18, Changming Huang <jerry.huang@nxp.com> wrote:
>
> This is to support Freescale/NXP LS1028ARDB in Buildroot.
> The board is setup to track the Linux at 4.19 via NXP LSDK-19.09.
>
> The target will build uboot and RCW binary with arm-trusted-firmware support.
>
> board/nxp/ls1028ardb/: scripts related with ls1028ardb
> nxp_ls1028ardb-64b-emmc_defconfig: defconfig boot from emmc chip on board
> nxp_ls1028ardb-64b_defconfig: defconfig boot from SD card
> nxp_ls1028ardb-64b-xspi_defconfig: defconfig boot from FlexSPI chip on board
>
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
> changes since v2:
> 1. Modify the qoriq-cadence-dp-firmware option in defconfig.
> 2. rename defconfig to nxp_ls1028*.
> 3. remove extra packages except busybox in defconfig.
> 4. modify the description of file genimage.xspi.cfg.template.
>
> changes since v1:
> 1. add new option in configs/freescale_ls1028ardb-xxxx_defconfig.
> ---
>  .gitlab-ci.yml                                |  3 +
>  DEVELOPERS                                    |  2 +
>  .../nxp/ls1028ardb/genimage.emmc.cfg.template | 52 ++++++++++++
>  board/nxp/ls1028ardb/genimage.sd.cfg.template | 52 ++++++++++++
>  .../nxp/ls1028ardb/genimage.xspi.cfg.template | 55 ++++++++++++
>  board/nxp/ls1028ardb/kernel.its               | 59 +++++++++++++
>  board/nxp/ls1028ardb/ls1028-10-network.rules  | 16 ++++
>  board/nxp/ls1028ardb/post-cfg-udev.sh         | 10 +++
>  board/nxp/ls1028ardb/readme.txt               | 61 +++++++++++++
>  .../ls1028ardb/u-boot-environment-emmc.txt    | 22 +++++
>  .../nxp/ls1028ardb/u-boot-environment-sd.txt  | 21 +++++
>  .../ls1028ardb/u-boot-environment-xspi.txt    | 22 +++++
>  configs/nxp_ls1028ardb-64b-emmc_defconfig     | 85 +++++++++++++++++++
>  configs/nxp_ls1028ardb-64b-xspi_defconfig     | 85 +++++++++++++++++++
>  configs/nxp_ls1028ardb-64b_defconfig          | 85 +++++++++++++++++++
>  15 files changed, 630 insertions(+)
>  create mode 100644 board/nxp/ls1028ardb/genimage.emmc.cfg.template
>  create mode 100644 board/nxp/ls1028ardb/genimage.sd.cfg.template
>  create mode 100644 board/nxp/ls1028ardb/genimage.xspi.cfg.template
>  create mode 100644 board/nxp/ls1028ardb/kernel.its
>  create mode 100644 board/nxp/ls1028ardb/ls1028-10-network.rules
>  create mode 100755 board/nxp/ls1028ardb/post-cfg-udev.sh
>  create mode 100644 board/nxp/ls1028ardb/readme.txt
>  create mode 100644 board/nxp/ls1028ardb/u-boot-environment-emmc.txt
>  create mode 100644 board/nxp/ls1028ardb/u-boot-environment-sd.txt
>  create mode 100644 board/nxp/ls1028ardb/u-boot-environment-xspi.txt
>  create mode 100644 configs/nxp_ls1028ardb-64b-emmc_defconfig
>  create mode 100644 configs/nxp_ls1028ardb-64b-xspi_defconfig
>  create mode 100644 configs/nxp_ls1028ardb-64b_defconfig
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 22befa0427..08e6360ff7 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -223,6 +223,9 @@ nitrogen6sx_defconfig: { extends: .defconfig }
>  nitrogen6x_defconfig: { extends: .defconfig }
>  nitrogen7_defconfig: { extends: .defconfig }
>  nitrogen8m_defconfig: { extends: .defconfig }
> +nxp_ls1028ardb-64b-emmc_defconfig: { extends: .defconfig }
> +nxp_ls1028ardb-64b_defconfig: { extends: .defconfig }
> +nxp_ls1028ardb-64b-xspi_defconfig: { extends: .defconfig }
>  odroidxu4_defconfig: { extends: .defconfig }
>  olimex_a10_olinuxino_lime_defconfig: { extends: .defconfig }
>  olimex_a13_olinuxino_defconfig: { extends: .defconfig }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6fd8f8ee08..efe4039194 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -515,6 +515,8 @@ F:  configs/orangepi_plus_defconfig
>
>  N:     Changming Huang <jerry.huang@nxp.com>
>  F:     board/nxp/common/ls/
> +F:     board/nxp/ls1028ardb/
> +F:     configs/nxp_ls1028ardb*
>  F:     package/nxp/qoriq-cadence-dp-firmware/
>
>  N:     Chris Packham <judge.packham@gmail.com>
> diff --git a/board/nxp/ls1028ardb/genimage.emmc.cfg.template b/board/nxp/ls1028ardb/genimage.emmc.cfg.template
> new file mode 100644
> index 0000000000..3afbda494e
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/genimage.emmc.cfg.template
> @@ -0,0 +1,52 @@
> +# Minimal eMMC boot image for the NXP boards Template
> +#
> +# eMMC image (sdcard.img) format:
> +# * the eMMC must have 4 kB free space at the beginning,
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
> +    image = "bl2_emmc.pbl"
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
> diff --git a/board/nxp/ls1028ardb/genimage.xspi.cfg.template b/board/nxp/ls1028ardb/genimage.xspi.cfg.template
> new file mode 100644
> index 0000000000..1bc3a4ec49
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/genimage.xspi.cfg.template
> @@ -0,0 +1,55 @@
> +# Minimal XSPI (FlexSPI) image for the NXP boards Template
> +#
> +# FlexSPI image (xspi.cpio.img) format:
> +# * For ls1028ardb, the FlexSPI flash size is 256MB, erase size is 128KB
> +# * bl2_flexspi_nor.bpl: the RCW with ATF header
> +# * fib.bin: u-boot-dtb.bin binary with ATF header
> +# * Kernel.itb:
> +# *   offset 16MB, include Kernel, ramdisk file system and DTB file
> +#
> +flash xspi-256M-128K {
> +        pebsize = 128K
> +        numpebs = 2048
> +        minimum-io-unit-size = 128k
> +}
> +
> +image xspi.cpio.img {
> +  flash {
> +  }
> +  flashtype = "xspi-256M-128K"
> +
> +  partition rcw {
> +    in-partition-table = "no"
> +    image = "bl2_flexspi_nor.pbl"
> +    offset = 0
> +    size = 1M
> +  }
> +
> +  partition u-boot {
> +    in-partition-table = "no"
> +    image = "fip.bin"
> +    offset = 1M
> +    size = 4M
> +  }
> +
> +  partition u-boot-environment {
> +    in-partition-table = "no"
> +    image = "uboot-env.bin"
> +    offset = 5M
> +    size = 1M
> +  }
> +
> +  partition dp-firmware {
> +    in-partition-table = "no"
> +    image = "ls1028a-dp-fw.bin"
> +    offset = 0x940000
> +    size = 256K
> +  }
> +
> +  partition boot {
> +    in-partition-table = "no"
> +    image = "kernel.itb"
> +    offset = 16M
> +    size = 48M
> +  }
> +}
> diff --git a/board/nxp/ls1028ardb/kernel.its b/board/nxp/ls1028ardb/kernel.its
> new file mode 100644
> index 0000000000..08e9700f30
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/kernel.its
> @@ -0,0 +1,59 @@
> +/*
> + * Copyright 2019 NXP
> + *
> + * Changming Huang <jerry.huang@nxp.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0+
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +       description = "Image file for the LS1028A Linux Kernel";
> +       #address-cells = <1>;
> +
> +       images {
> +               kernel at 1 {
> +                       description = "ARM64 Linux kernel";
> +                       data = /incbin/("./Image.gz");
> +                       type = "kernel";
> +                       arch = "arm64";
> +                       os = "linux";
> +                       compression = "gzip";
> +                       load = <0x80080000>;
> +                       entry = <0x80080000>;
> +               };
> +               fdt at 1 {
> +                       description = "Flattened Device Tree blob";
> +                       data = /incbin/("./fsl-ls1028a-rdb.dtb");
> +                       type = "flat_dt";
> +                       arch = "arm64";
> +                       compression = "none";
> +                       load = <0x90000000>;
> +               };
> +               ramdisk at 1 {
> +                       description = "LS1028 Ramdisk";
> +                        data = /incbin/("./rootfs.cpio.gz");
> +                       type = "ramdisk";
> +                       arch = "arm64";
> +                       os = "linux";
> +                       compression = "gzip";
> +               };
> +       };
> +
> +       configurations {
> +               default = "config at 1";
> +               config at 1 {
> +                       description = "Boot Linux kernel";
> +                       kernel = "kernel at 1";
> +                       fdt = "fdt at 1";
> +                       ramdisk = "ramdisk at 1";
> +               };
> +               ls1028ardb {
> +                       description = "Boot Linux kernel";
> +                       kernel = "kernel at 1";
> +                       fdt = "fdt at 1";
> +                       ramdisk = "ramdisk at 1";
> +               };
> +       };
> +};
> diff --git a/board/nxp/ls1028ardb/ls1028-10-network.rules b/board/nxp/ls1028ardb/ls1028-10-network.rules
> new file mode 100644
> index 0000000000..19f41634bd
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/ls1028-10-network.rules
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
> diff --git a/board/nxp/ls1028ardb/post-cfg-udev.sh b/board/nxp/ls1028ardb/post-cfg-udev.sh
> new file mode 100755
> index 0000000000..311a93aee2
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/post-cfg-udev.sh
> @@ -0,0 +1,10 @@
> +#!/usr/bin/env bash
> +
> +main()
> +{
> +       cp board/nxp/ls1028ardb/ls1028-10-network.rules ${TARGET_DIR}/etc/udev/rules.d/10-network.rules

Shouldn't this be a part of a BR2_ROOTFS_OVERLAY fragment?

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
> diff --git a/board/nxp/ls1028ardb/u-boot-environment-emmc.txt b/board/nxp/ls1028ardb/u-boot-environment-emmc.txt
> new file mode 100644
> index 0000000000..01a97aa89d
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/u-boot-environment-emmc.txt
> @@ -0,0 +1,22 @@
> +baudrate=115200
> +bootcmd=setenv bootargs root=/dev/mmcblk1p2 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200 cma=256M video=1920x1080-32 at 60;mmc dev 1;mmcinfo;fatload mmc 1:1 ${dp_load} ${dp_file};hdp load ${dp_load} ${dp_offset};fatload mmc 1:1 ${loadaddr} ${bootfile};fatload mmc 1:1 ${fdtaddr} ${fdtfile};booti ${loadaddr} - ${fdtaddr}
> +bootdelay=3
> +bootfile=Image
> +fdtfile=fsl-ls1028a-rdb.dtb
> +eth2addr=00:1F:7B:63:35:E9

Do we really want to put a MAC address in the U-Boot environment? This
will work ok for the first board, but not so well for the second board
that you put in the same network.
And actually, do we want a U-Boot environment at all? The LSDK U-Boot
default environment is distroboot enabled. With the proper
extlinux.conf file generated by post-image.sh, it can load Buildroot
in a breeze with no custom script necessary:

label Buildroot %VERSION% - %BOARD%
  kernel %KERNEL%
  devicetree %DTB%
  append console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootwait

> +ethact=FM1 at DTSEC3
> +ethprime=FM1 at DTSEC3

There is certainly no DTSEC port on LS1028A.

> +fdt_high=0xffffffffffffffff
> +fdtcontroladdr=ffc01550
> +fman_ucode=ffc12090

And no FMan microcode.

> +hwconfig=fsl_ddr:bank_intlv=auto
> +initrd_high=0xffffffffffffffff
> +loadaddr=0xa0000000
> +fdtaddr=0xb0000000
> +dp_file=ls1028a-dp-fw.bin
> +dp_load=0x90000000
> +dp_offset=0x2000
> +stderr=serial
> +stdin=serial
> +stdout=serial
> +rollbackboot=setenv bootargs root=/dev/ram0 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200;mmcinfo;fatload mmc 0:1 ${loadaddr} ${bootfile};bootm ${loadaddr}

What does "rollbackboot" do?

> diff --git a/board/nxp/ls1028ardb/u-boot-environment-sd.txt b/board/nxp/ls1028ardb/u-boot-environment-sd.txt
> new file mode 100644
> index 0000000000..820989280f
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/u-boot-environment-sd.txt
> @@ -0,0 +1,21 @@
> +baudrate=115200
> +bootcmd=setenv bootargs root=/dev/mmcblk0p2 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200 cma=256M video=1920x1080-32 at 60;mmcinfo;fatload mmc 0:1 ${dp_load} ${dp_file}; hdp load ${dp_load} ${dp_offset};fatload mmc 0:1 ${loadaddr} ${bootfile};fatload mmc 0:1 ${fdtaddr} ${fdtfile};booti ${loadaddr} - ${fdtaddr}
> +bootdelay=3
> +bootfile=Image
> +fdtfile=fsl-ls1028a-rdb.dtb
> +eth2addr=00:1F:7B:63:35:E9
> +ethact=FM1 at DTSEC3
> +ethprime=FM1 at DTSEC3
> +fdt_high=0xffffffffffffffff
> +fdtcontroladdr=ffc01550
> +fman_ucode=ffc12090
> +hwconfig=fsl_ddr:bank_intlv=auto
> +initrd_high=0xffffffffffffffff
> +loadaddr=0xa0000000
> +fdtaddr=0xb0000000
> +dp_file=ls1028a-dp-fw.bin
> +dp_load=0x90000000
> +dp_offset=0x2000
> +stderr=serial
> +stdin=serial
> +stdout=serial
> diff --git a/board/nxp/ls1028ardb/u-boot-environment-xspi.txt b/board/nxp/ls1028ardb/u-boot-environment-xspi.txt
> new file mode 100644
> index 0000000000..5677cdddaa
> --- /dev/null
> +++ b/board/nxp/ls1028ardb/u-boot-environment-xspi.txt
> @@ -0,0 +1,22 @@
> +baudrate=115200
> +bootcmd=setenv bootargs root=/dev/ram0 rw earlycon=uart8250,0x21c0500 console=ttyS0,115200 cma=256M video=1920x1080-32 at 60; sf probe 0:0; sf read $dp_load $dp_start $dp_size; hdp load $dp_load $dp_offset; sf read $kernel_load $kernel_start $kernel_size && bootm $kernel_load
> +bootdelay=3
> +eth2addr=00:1F:7B:63:35:E9
> +ethact=FM1 at DTSEC3
> +ethprime=FM1 at DTSEC3
> +fdt_high=0xffffffffffffffff
> +fdtcontroladdr=ffc01550
> +fman_ucode=ffc12090
> +hwconfig=fsl_ddr:bank_intlv=auto
> +initrd_high=0xffffffffffffffff
> +kernel_load=0xa0000000
> +kernel_size=0x3000000
> +kernel_start=0x1000000
> +dp_load=0x90000000
> +dp_start=0x940000
> +dp_size=0x40000
> +dp_offset=0x2000
> +stderr=serial
> +stdin=serial
> +stdout=serial
> +rollbackboot=setenv bootargs root=/dev/ram0 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200;mmcinfo;fatload mmc 0:1 ${loadaddr} ${bootfile};bootm $loadaddr
> diff --git a/configs/nxp_ls1028ardb-64b-emmc_defconfig b/configs/nxp_ls1028ardb-64b-emmc_defconfig
> new file mode 100644
> index 0000000000..019889f5e0
> --- /dev/null
> +++ b/configs/nxp_ls1028ardb-64b-emmc_defconfig

Thomas, is there any way in Buildroot to use fragments for the board
configs, to avoid duplication? I couldn't find any way.

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
> +BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
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
> +BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/nxp/ls1028ardb/u-boot-environment-emmc.txt"
> +BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-19.09-V4.19"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +
> +# Serial port config
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +
> +# required tools to create the microSD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nxp/common/ls/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR) $(TOPDIR) $(UBOOT_DIR)"
> +
> +# busybox setting
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +
> +# packages for rcw
> +BR2_PACKAGE_HOST_QORIQ_RCW=y
> +BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE="emmc"
> +BR2_PACKAGE_HOST_QORIQ_RCW_BIN="ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.bin"
> +
> +#Display port firmware
> +BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
> +
> +#eudev support
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/nxp/ls1028ardb/post-cfg-udev.sh"
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
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_emmc.pbl"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="pbl"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES="host-qoriq-rcw"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=emmc RCW=$(BINARIES_DIR)/rcw_1300_emmcboot.bin"
> diff --git a/configs/nxp_ls1028ardb-64b-xspi_defconfig b/configs/nxp_ls1028ardb-64b-xspi_defconfig
> new file mode 100644
> index 0000000000..66241c4c79
> --- /dev/null
> +++ b/configs/nxp_ls1028ardb-64b-xspi_defconfig
> @@ -0,0 +1,85 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
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
> +BR2_TARGET_UBOOT_ENVIMAGE=y
> +BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/nxp/ls1028ardb/u-boot-environment-xspi.txt"
> +BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-19.09-V4.19"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image.gz"
> +
> +# Serial port config
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +
> +# required tools to create the microSD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nxp/common/ls/post-image-spi.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR) $(TOPDIR) $(UBOOT_DIR)"
> +
> +# busybox setting
> +BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/nxp/common/ls/busybox.config"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +
> +# packages for rcw
> +BR2_PACKAGE_HOST_QORIQ_RCW=y
> +BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE="flexspi_nor"
> +BR2_PACKAGE_HOST_QORIQ_RCW_BIN="ls1028ardb/R_SQPP_0x85bb/rcw_1500_gpu600.bin"
> +
> +#Display port firmware
> +BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
> +
> +#eudev support
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/nxp/ls1028ardb/post-cfg-udev.sh"
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
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_flexspi_nor.pbl"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="pbl"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES="host-qoriq-rcw"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=flexspi_nor RCW=$(BINARIES_DIR)/rcw_1500_gpu600.bin"
> diff --git a/configs/nxp_ls1028ardb-64b_defconfig b/configs/nxp_ls1028ardb-64b_defconfig
> new file mode 100644
> index 0000000000..fdb251058f
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
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +
> +# Serial port config
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +
> +# required tools to create the microSD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nxp/common/ls/post-image.sh"
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
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/nxp/ls1028ardb/post-cfg-udev.sh"
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
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks,
-Vladimir
