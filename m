From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 26 Jan 2018 22:30:29 +0100
Subject: [Buildroot] [PATCH 0/5] Add Xilinx ZynqMP and ZCU106 board support
Message-ID: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset adds basic support for the ZynqMP family of ARM64
SoC+FPGA by Xilinx and for the ZCU106 board based on it.

The ZynqMP sets a few challenges that needed some work besides the
usual defconfig + readme that is enough for more classic and simple
SoCs.

First, it requires ARM Trusted Firmware in the U-Boot mkimage format,
not currently implemented. Nothing really hard here, this is addressed
in patch 2 (with a trivial preliminary cleanup in patch 1).

The next issue is the PMU (Platform Management Unit). It is a
Microblaze core that handles power and clock gating and the like, and
reprogramming it at runtime is necessary to boot any modern U-Boot and
Linux. Since we can't build Microblaze code out of the ARM64
toolchain, I've set up a repository with pre-built PMU firmwares and
added a new package that just downloads from there. This is similar to
the binaries-marvell and vexpress-firmware packages. This is added in
patch 3.

Finally, U-Boot needs some tweaks in order for the PMU firmware to
properly loaded and to initialize peripherals before starting
Linux. This is done in patch 4.

With all these in place, patch 5 just adds the defconfig and board
files.

Luca


Luca Ceresoli (5):
  arm-trusted-firmware: simplify release dir path
  arm-trusted-firmware: generate atf-uboot.ub for ZynqMP booting
  zynqmp-pmufw-binaries: new package
  u-boot: add customizations to boot on ZynqMP
  configs: add Xilinx ZCU106 board (ZynqMP SoC)

 DEVELOPERS                                         |     3 +
 board/zynqmp/genimage.cfg                          |    28 +
 board/zynqmp/post-image.sh                         |    13 +
 board/zynqmp/readme.txt                            |    52 +
 board/zynqmp/zcu106/psu_init_gpl.c                 | 20955 +++++++++++
 board/zynqmp/zcu106/psu_init_gpl.h                 | 35810 +++++++++++++++++++
 boot/Config.in                                     |     1 +
 boot/arm-trusted-firmware/Config.in                |     9 +
 boot/arm-trusted-firmware/arm-trusted-firmware.mk  |    23 +-
 boot/uboot/Config.in                               |    32 +
 boot/uboot/uboot.mk                                |    25 +
 boot/zynqmp-pmufw-binaries/Config.in               |    19 +
 .../zynqmp-pmufw-binaries.hash                     |     3 +
 .../zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk |    24 +
 configs/zynqmp_zcu106_defconfig                    |    31 +
 15 files changed, 57027 insertions(+), 1 deletion(-)
 create mode 100644 board/zynqmp/genimage.cfg
 create mode 100755 board/zynqmp/post-image.sh
 create mode 100644 board/zynqmp/readme.txt
 create mode 100644 board/zynqmp/zcu106/psu_init_gpl.c
 create mode 100644 board/zynqmp/zcu106/psu_init_gpl.h
 create mode 100644 boot/zynqmp-pmufw-binaries/Config.in
 create mode 100644 boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.hash
 create mode 100644 boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk
 create mode 100644 configs/zynqmp_zcu106_defconfig

-- 
2.7.4
