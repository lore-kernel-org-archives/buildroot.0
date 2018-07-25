From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 25 Jul 2018 16:35:35 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add Xilinx ZynqMP and ZCU106 board
 support
Message-ID: <20180725143538.25268-1-luca@lucaceresoli.net>
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

This v5 addresses the comments received to v4 by Joel (BR2_EXTERNAL
not working). It also fixes support for providing a PMU firmware as a
local file, while keeping the ability to download it.

I reordered the patches w.r.t. v4. Here's their summary.

The first issue is the PMU (Platform Management Unit). It is a
Microblaze core that handles power and clock gating and the like, and
reprogramming it during early boot is necessary to boot any modern
U-Boot and Linux. Since we can't build Microblaze code out of the
ARM64 toolchain, U-Boot obtains a pre-built binary either from a local
file or downloaded using EXTRA_DOWNLOADS. This is added in patch
1. Until v3, the PMUFW had to be copied inside the U-Boot source. With
a patch from upstream it is now possible to avoid the copy.

With this in place, patch 2 just adds the defconfig and board files.

Patch 3 allows to pass an externally-supplied init file to U-Boot,
which is needed to boot boards not supported in the U-Boot source
code, or on the same boards but with a different
configuration. Instead of copying the user-provided file inside the
U-Boot source as in v3, I applied a patch from upstream so U-Boot is
able to build that file without any copy. ZCU106 is supported by
mainline U-Boot with a default configuration and thus it does not need
this patch, so I have moved it at the end.

Luca


Luca Ceresoli (3):
  uboot: zynqmp: generate SPL image with PMUFW binary
  configs/zynqmp_zcu106_defconfig: add Xilinx ZCU106 board (ZynqMP SoC)
  uboot: zynqmp: allow to use custom psu_init files

 DEVELOPERS                                    |   2 +
 board/zynqmp/genimage.cfg                     |  28 +++
 ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 ++++++
 ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ++++++++++++
 ...ept-an-absolute-path-for-PMUFW_INIT_.patch |  68 +++++++
 ...ynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 ++++++++++++++++++
 board/zynqmp/post-image.sh                    |  13 ++
 board/zynqmp/readme.txt                       |  51 +++++
 boot/uboot/Config.in                          |  52 ++++++
 boot/uboot/uboot.mk                           |  34 ++++
 configs/zynqmp_zcu106_defconfig               |  34 ++++
 11 files changed, 623 insertions(+)
 create mode 100644 board/zynqmp/genimage.cfg
 create mode 100644 board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
 create mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
 create mode 100644 board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
 create mode 100644 board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
 create mode 100755 board/zynqmp/post-image.sh
 create mode 100644 board/zynqmp/readme.txt
 create mode 100644 configs/zynqmp_zcu106_defconfig

-- 
2.17.1
