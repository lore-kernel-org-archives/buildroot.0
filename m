From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Mar 2018 18:44:43 +0100
Subject: [Buildroot] [PATCH v2 0/6] Add Xilinx ZynqMP and ZCU106 board
 support
Message-ID: <1520876689-2975-1-git-send-email-luca@lucaceresoli.net>
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
Linux. This is done in patches 4 and 5.

With all these in place, patch 6 just adds the defconfig and board
files.

Main changes since v1:
 - Do not add the huge psu_init files to Buildroot. Instead use the
   zcu106 support in the Xilinx master branch (but add two patches to
   fix it). The option to use a user-provided psu_init file is still
   present because many users will use the same board in a different
   configuration or a custom board.
 - Use a recent version of U-Boot. Upstream v2018.01 has been merged
   into the Xilinx master branch, which is a big step from the
   previous version based on upstream 2017.01. Xilinx has not tagged
   any version since that, so we use a SHA-1.
 - Split patch 4 in two as it was doing two different things.

Luca

Luca Ceresoli (6):
  arm-trusted-firmware: simplify release dir path
  arm-trusted-firmware: generate atf-uboot.ub for ZynqMP booting
  zynqmp-pmufw-binaries: new package
  uboot: zynqmp: generate SPL image with PMUFW binary
  uboot: zynqmp: allow to use custom psu_init files
  configs: add Xilinx ZCU106 board (ZynqMP SoC)

 DEVELOPERS                                         |  3 ++
 board/zynqmp/genimage.cfg                          | 28 +++++++++++
 ...1-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch | 56 ++++++++++++++++++++++
 ...arm64-zynqmp-zcu106-enable-booting-to-ATF.patch | 39 +++++++++++++++
 board/zynqmp/post-image.sh                         | 13 +++++
 board/zynqmp/readme.txt                            | 52 ++++++++++++++++++++
 boot/Config.in                                     |  1 +
 boot/arm-trusted-firmware/Config.in                |  9 ++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk  | 24 +++++++++-
 boot/uboot/Config.in                               | 33 +++++++++++++
 boot/uboot/uboot.mk                                | 25 ++++++++++
 boot/zynqmp-pmufw-binaries/Config.in               | 19 ++++++++
 .../zynqmp-pmufw-binaries.hash                     |  3 ++
 .../zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk | 26 ++++++++++
 configs/zynqmp_zcu106_defconfig                    | 31 ++++++++++++
 15 files changed, 361 insertions(+), 1 deletion(-)
 create mode 100644 board/zynqmp/genimage.cfg
 create mode 100644 board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
 create mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-zcu106-enable-booting-to-ATF.patch
 create mode 100755 board/zynqmp/post-image.sh
 create mode 100644 board/zynqmp/readme.txt
 create mode 100644 boot/zynqmp-pmufw-binaries/Config.in
 create mode 100644 boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.hash
 create mode 100644 boot/zynqmp-pmufw-binaries/zynqmp-pmufw-binaries.mk
 create mode 100644 configs/zynqmp_zcu106_defconfig

-- 
2.7.4
