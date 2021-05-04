From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 May 2021 22:51:31 +0200
Subject: [Buildroot] [PATCH v3 0/7] Support for the BeagleV platform
Message-ID: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a third iteration of the BeagleV patch series, which brings a
few fixes:

 * The post-build script of v1 calling "make printvars" was working
   only for in-tree builds. Following a comment from Frank Hunleth on
   the v1, it was changed in v2 to use "make -C ${O} printvars", which
   made out-of-tree builds work, but broke in-tree builds. So in this
   new version, we introduced a preliminary patch that exposes
   $(CONFIG_DIR) to post-build/post-image scripts, to make such "make
   printvars" invocations possible.

 * The beaglev_defconfig is updated to take into account the rename of
   the Git repositories by Starfive for Linux, U-Boot and OpenSBI.

 * Reviewed-by tags from Bin Meng are added on beaglev-ddrinit,
   beaglev-secondboot and the corresponding beaglev_defconfig
   update. Thanks Bin!

As usual, the whole thing is also available at:

  https://github.com/tpetazzoni/buildroot/commits/beaglev

Best regards,

Thomas Petazzoni

Thomas Petazzoni (7):
  package/Makefile.in: expose CONFIG_DIR to post-build/post-image
    scripts
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
 docs/manual/customize-post-image.txt          |   3 +-
 docs/manual/customize-rootfs.txt              |   3 +
 package/Makefile.in                           |   1 +
 .../riscv64-elf-toolchain.mk                  |  25 ++++
 18 files changed, 375 insertions(+), 7 deletions(-)
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
