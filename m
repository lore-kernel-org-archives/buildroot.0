From: kostap at marvell.com <kostap@marvell.com>
Date: Tue, 5 Feb 2019 09:40:28 +0200
Subject: [Buildroot] [PATCH 0/3] Support 32-bit code generation for Armv8
 targets
Message-ID: <20190205074031.7989-1-kostap@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Konstantin Porotchkin <kostap@marvell.com>

This patch set adds support for building images for SoC that make usage
of Armv8 application CPUs and Cortex-M/Cortex-R service CPUs.
The application CPU cross-toolchain is unable to generate 32-bit THUMB
code, therefore usage of secondary toolchain is needed.
The required pre-built toolchain is taken from ARM developers site and
installed in host filesystem only.
The patch set makes use of dual toolchain for adding support for Marvell
Armada 3700 SoC that uses both Cortex-A53 and Cortex-M3 CPUs for running
system firmware.

V2 changes:
patch #1 (arm-gnu-rm-toolchain)
- Remove Config.in.host
- Remove custom extract command
- Set installation path to $(HOST_DIR)/opt//opt/gcc-arm-none-eabi
- Update commit message according to review notes
patch #2 (a3700-utils-marvell) - no changes
patch #3 (a3700 boot image build support)
- Update CROSS_CM3 path in arm-trusted-firmware to reflect patch #1 changes

Konstantin Porotchkin (3):
  package: arm-gnu-rm-toolchain: Add ARM-RM toolchain
  boot: a3700-utils-marvell: Add Armada-3700 utilities
  boot: arm-trusted-firmware: add support for Marvell Armada 3700

 boot/Config.in                                |  1 +
 boot/a3700-utils-marvell/Config.in            | 46 +++++++++++++++++++
 .../a3700-utils-marvell.hash                  |  2 +
 .../a3700-utils-marvell.mk                    | 28 +++++++++++
 .../arm-trusted-firmware.mk                   |  7 +++
 package/Config.in.host                        |  1 +
 package/arm-gnu-rm-toolchain/Config.in.host   | 13 ++++++
 .../arm-gnu-rm-toolchain.hash                 |  2 +
 .../arm-gnu-rm-toolchain.mk                   | 22 +++++++++
 9 files changed, 122 insertions(+)
 create mode 100644 boot/a3700-utils-marvell/Config.in
 create mode 100644 boot/a3700-utils-marvell/a3700-utils-marvell.hash
 create mode 100644 boot/a3700-utils-marvell/a3700-utils-marvell.mk
 create mode 100644 package/arm-gnu-rm-toolchain/Config.in.host
 create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
 create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk

-- 
2.17.1
