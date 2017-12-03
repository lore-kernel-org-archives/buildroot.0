From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Dec 2017 22:48:03 +0100
Subject: [Buildroot] [PATCH 0/8] Improve ATF to support additional platforms
Message-ID: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series combines work from Jagan Teki and Sergey Matyukevich
to support more platforms in our ATF (arm-trusted-firmware).

Jagan wants to support Allwinner A64/H5 platforms, which requires a
new build logic between ATF/U-Boot.

So far, the ARM Juno platform that we supported builds U-Boot and then
ATF. ATF encapsulates U-Boot as its BL33. The Allwinner platform takes
a different approach: ATF produces a BL31 binary, which is then
encapsulated by U-Boot. So in one case we have U-Boot then ATF, and in
the other case ATF then U-Boot.

In addition, in the ARM Juno case, we build a FIP image in ATF, while
in the Allwinner case we need to build only a BL31 image.

Jagan made a proposal to solve that, but I was not entirely happy with
the proposal, so here is a different proposal to solve the same
problem.

On top of that, Sergey wanted to support Marvell Armada 7K/8K
platforms. They have the same build logic as ARM Juno, so they require
less changes. However, we need to download the SCP firmware, so a
binaries-marvell package is needed (similar to
boot/vexpress-firmware/), and for some reason the DDR training code is
also shipped separately, so a boot/mv-ddr-marvell/ package is needed.

I have not taken the defconfig additions from Jagan and Sergey in this
series, assumming they would be rebased and reposted once this series
has been merged. Instead, I've added some short test cases for our
testing infrastructure.

Best regards,

Thomas

Jagan Teki (1):
  uboot: add support for bundling ATF BL31 into U-Boot

Sergey Matyukevich (3):
  mv-ddr-marvell: new package
  binaries-marvell: new package
  atf: add support for Marvell Armada SoCs

Thomas Petazzoni (4):
  arm-trusted-firmware: add option to enable/disable building FIP image
  arm-trusted-firmware: add
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
  arm-trusted-firmware: allow to generate the BL31 image
  support/testing: add tests for ATF

 DEVELOPERS                                        |  3 +
 boot/Config.in                                    |  2 +
 boot/arm-trusted-firmware/Config.in               | 24 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 30 +++++++--
 boot/binaries-marvell/Config.in                   | 32 +++++++++
 boot/binaries-marvell/binaries-marvell.hash       |  2 +
 boot/binaries-marvell/binaries-marvell.mk         | 22 +++++++
 boot/mv-ddr-marvell/Config.in                     | 10 +++
 boot/mv-ddr-marvell/mv-ddr-marvell.hash           |  2 +
 boot/mv-ddr-marvell/mv-ddr-marvell.mk             | 12 ++++
 boot/uboot/Config.in                              | 10 +++
 boot/uboot/uboot.mk                               |  5 ++
 configs/arm_juno_defconfig                        |  2 +
 support/testing/tests/boot/__init__.py            |  0
 support/testing/tests/boot/test_atf.py            | 79 +++++++++++++++++++++++
 15 files changed, 231 insertions(+), 4 deletions(-)
 create mode 100644 boot/binaries-marvell/Config.in
 create mode 100644 boot/binaries-marvell/binaries-marvell.hash
 create mode 100644 boot/binaries-marvell/binaries-marvell.mk
 create mode 100644 boot/mv-ddr-marvell/Config.in
 create mode 100644 boot/mv-ddr-marvell/mv-ddr-marvell.hash
 create mode 100644 boot/mv-ddr-marvell/mv-ddr-marvell.mk
 create mode 100644 support/testing/tests/boot/__init__.py
 create mode 100644 support/testing/tests/boot/test_atf.py

-- 
2.13.6
