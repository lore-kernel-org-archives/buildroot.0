From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 21 Jun 2018 23:26:22 +0200
Subject: [Buildroot] [PATCH v4 0/3] Add Xilinx ZynqMP and ZCU106 board
 support
Message-ID: <1529616385-15826-1-git-send-email-luca@lucaceresoli.net>
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

This v4 addresses the comments received to v3 by Thomas. The main
concern raised was that the code in v3 was copying some files into the
U-Boot source tree before compilation, so the build would find
them. This could not be done any better without changing the U-Boot
source code, and so I fixed it in the U-Boot makefiles in the first
place. With those changes to U-Boot, the Buildroot code has become a
lot leaner, now almost trivial.

The first 2 paches in my v3 series have already been applied.

Patch 1 allows to pass an externally-supplied init file to U-Boot,
which is needed to boot boards not supported in the U-Boot source
code, or on the same boards but with a different
configuration. Instead of copying the user-provided file inside the
U-Boot source as in v3, I applied a patch (submitted upstream) so
U-Boot is able to build that file without any copy.

The next issue is the PMU (Platform Management Unit). It is a
Microblaze core that handles power and clock gating and the like, and
reprogramming it at runtime is necessary to boot any modern U-Boot and
Linux. Since we can't build Microblaze code out of the ARM64
toolchain, U-Boot obtains a pre-built binary using
EXTRA_DOWNLOADS. This is added in patch 2. Until v3, the PMUFW had to
be copied inside the U-Boot source. With a patch, now upstream, it is
now possible to avoid the copy.

With all these in place, patch 5 just adds the defconfig and board
files.

Luca


Luca Ceresoli (3):
  uboot: zynqmp: allow to use custom psu_init files
  uboot: zynqmp: generate SPL image with PMUFW binary
  configs: add Xilinx ZCU106 board (ZynqMP SoC)

 DEVELOPERS                                         |   2 +
 board/zynqmp/genimage.cfg                          |  28 ++++
 ...1-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  53 +++++++
 .../0002-arm64-zynqmp-Enable-booting-to-ATF.patch  | 115 ++++++++++++++
 ...p-accept-an-absolute-path-for-PMUFW_INIT_.patch |  68 ++++++++
 ...ynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 +++++++++++++++++++++
 board/zynqmp/post-image.sh                         |  13 ++
 board/zynqmp/readme.txt                            |  51 ++++++
 boot/uboot/Config.in                               |  47 ++++++
 boot/uboot/uboot.mk                                |  27 ++++
 configs/zynqmp_zcu106_defconfig                    |  34 ++++
 11 files changed, 613 insertions(+)
 create mode 100644 board/zynqmp/genimage.cfg
 create mode 100644 board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
 create mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
 create mode 100644 board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
 create mode 100644 board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
 create mode 100755 board/zynqmp/post-image.sh
 create mode 100644 board/zynqmp/readme.txt
 create mode 100644 configs/zynqmp_zcu106_defconfig

-- 
2.7.4
