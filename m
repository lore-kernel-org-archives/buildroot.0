From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  3 May 2018 18:23:32 +0200
Subject: [Buildroot] [PATCH v3 0/5] Add Xilinx ZynqMP and ZCU106 board
 support
Message-ID: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset adds basic support for the ZynqMP family of ARM64
SoC+FPGA by Xilinx and for the ZCU106 board based on it.

This v3 addresses the comments received to v2 (thanks Thomas). The
main change is that the zynqmp-pmufw-binaries package does not exist
anymore: instead U-Boot downloads a single file using
EXTRA_DOWNLOADS. The rest are several sparse improvements that make
the whole work a lot cleaner.

The ZynqMP sets a few challenges that needed some work besides the
usual defconfig + readme that is enough for more classic and simple
SoCs.

First, it requires ARM Trusted Firmware in the U-Boot mkimage format,
not currently implemented. Nothing really hard here, this is addressed
in patch 2 (with a trivial preliminary cleanup in patch 1).

Patch 3 allows to pass an externally-supplied init file to U-Boot,
which is needed to boot boards not supported in the U-Boot source
code, or on the same boards but with a different configuration.

The next issue is the PMU (Platform Management Unit). It is a
Microblaze core that handles power and clock gating and the like, and
reprogramming it at runtime is necessary to boot any modern U-Boot and
Linux. Since we can't build Microblaze code out of the ARM64
toolchain, U-Boot obtains a pre-built binary using
EXTRA_DOWNLOADS. This is added in patch 4.

With all these in place, patch 5 just adds the defconfig and board
files.

Luca

Luca Ceresoli (5):
  arm-trusted-firmware: simplify release dir path
  arm-trusted-firmware: generate atf-uboot.ub image of bl31.bin
  uboot: zynqmp: allow to use custom psu_init files
  uboot: zynqmp: generate SPL image with PMUFW binary
  configs: add Xilinx ZCU106 board (ZynqMP SoC)

 DEVELOPERS                                         |   2 +
 board/zynqmp/genimage.cfg                          |  28 +++++
 ...1-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  53 ++++++++++
 .../0002-arm64-zynqmp-Enable-booting-to-ATF.patch  | 115 +++++++++++++++++++++
 board/zynqmp/post-image.sh                         |  13 +++
 board/zynqmp/readme.txt                            |  52 ++++++++++
 boot/arm-trusted-firmware/Config.in                |   8 ++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk  |  24 ++++-
 boot/uboot/Config.in                               |  43 ++++++++
 boot/uboot/uboot.mk                                |  35 +++++++
 configs/zynqmp_zcu106_defconfig                    |  31 ++++++
 11 files changed, 403 insertions(+), 1 deletion(-)
 create mode 100644 board/zynqmp/genimage.cfg
 create mode 100644 board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
 create mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
 create mode 100755 board/zynqmp/post-image.sh
 create mode 100644 board/zynqmp/readme.txt
 create mode 100644 configs/zynqmp_zcu106_defconfig

-- 
2.7.4
