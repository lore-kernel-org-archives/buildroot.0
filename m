From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  2 May 2021 23:21:28 +0200
Subject: [Buildroot] [PATCH v2 0/6] Support for the BeagleV platform
Message-ID: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new version of the patch series adding support for the
BeagleV in Buildroot.

Here are the changes compared the first version:

 - Dropped the first two patches, as they have been merged upstream.

 - In the OpenSBI patch adding options to enable/disable image
   installation, take into account the reviews from Bin Meng how the
   ordering of options + a typo in the fw_jump option prompt.

 - In the beaglev_defconfig patch itself, use .out instead of .flash
   for the ready-to-be-flashed OpenSBI/U-Boot image, to be consistent
   with the extension documented by upstream, and also used by other
   firmware files for this platform.

 - In the beaglev_defconfig patch itself, fix the post-build script to
   work in out-of-tree situation, as pointed out by Frank Hunleth.

 - Fix the naming of the platform to BeagleV and the naming of the SoC
   to JH7100.

 - Add support for building the other firmware files that are used in
   the boot process of the BeagleV: secondboot and ddrinit. To keep
   the patch series easier to merge, this is done as a separate step
   from the main defconfig addition. Building those two firmware files
   requires a bare-metal RISC-V 64-bit toolchain, so a host package is
   created for that.

The branch at:

  https://github.com/tpetazzoni/buildroot/commits/beaglev

has been updated accordingly.

Best regards,

Thomas Petazzoni

Thomas Petazzoni (6):
  boot/opensbi: add options to enable/disable image installation
  configs/beaglev_defconfig: new defconfig
  package/riscv64-elf-toolchain: new package
  boot/beaglev-ddrinit: new package
  boot/beaglev-secondboot: new package
  configs/beaglev: enable building of low-level firmware

 DEVELOPERS                                    |   5 +
 board/beaglev/extlinux.conf                   |   4 +
 board/beaglev/genimage.cfg                    |  12 ++
 ...s-starfive-vic7100-adjust-fdt_addr_r.patch |  39 ++++++
 board/beaglev/post-build.sh                   |  17 +++
 board/beaglev/readme.txt                      | 122 ++++++++++++++++++
 boot/Config.in                                |   2 +
 boot/beaglev-ddrinit/Config.in                |   9 ++
 boot/beaglev-ddrinit/beaglev-ddrinit.mk       |  29 +++++
 boot/beaglev-secondboot/Config.in             |   9 ++
 boot/beaglev-secondboot/beaglev-secondboot.mk |  29 +++++
 boot/opensbi/Config.in                        |  20 +++
 boot/opensbi/opensbi.mk                       |  16 ++-
 configs/beaglev_defconfig                     |  37 ++++++
 .../riscv64-elf-toolchain.mk                  |  25 ++++
 15 files changed, 369 insertions(+), 6 deletions(-)
 create mode 100644 board/beaglev/extlinux.conf
 create mode 100644 board/beaglev/genimage.cfg
 create mode 100644 board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
 create mode 100755 board/beaglev/post-build.sh
 create mode 100644 board/beaglev/readme.txt
 create mode 100644 boot/beaglev-ddrinit/Config.in
 create mode 100644 boot/beaglev-ddrinit/beaglev-ddrinit.mk
 create mode 100644 boot/beaglev-secondboot/Config.in
 create mode 100644 boot/beaglev-secondboot/beaglev-secondboot.mk
 create mode 100644 configs/beaglev_defconfig
 create mode 100644 package/riscv64-elf-toolchain/riscv64-elf-toolchain.mk

-- 
2.30.2
