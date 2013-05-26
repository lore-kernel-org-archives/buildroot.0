From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:10 +0200
Subject: [Buildroot] [PATCH 00/20] Patches from the Patchwork Day
Message-ID: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that I collected/reworked during the
Patchwork Day. In summary:

 * Carlo Caione patches adding some Allwinner sunxi related packages
   and a defconfig for the cubieboard (based on the sunxi-specific
   kernel and not the mainline one).

 * Updates of external toolchains by Fabio Porcedda (ARM) and Sonic
   Zhang (Blackfin).

 * Rework + bump of Freescale i.MX stuff, addition of
   OpenGL/OpenVG/EGL implementation by Henk Fijnvandraat.

 * Some random stuff from me.

Best regards,

Thomas

Carlo Caione (3):
  sunxi-tools: new host/target package
  sunxi-boards: new package
  cubieboard: add support

Fabio Porcedda (2):
  toolchain-external: add support for 'Sourcery CodeBench ARM 2013.05'
  toolchain-external: remove support for 'Sourcery CodeBench ARM
    2011.03'

Henk Fijnvandraat (5):
  freescale-imx: new package directory
  imx-lib: move to the freescale-imx directory
  firmware-imx: move to the freescale-imx directory
  freescale-imx: bump to 1.1.0
  gpu-viv-bin-mx6q: new package

Sonic Zhang (1):
  toolchain: blackfin: Remove Blackfin toolchain 2011R1 release.

Thomas Petazzoni (7):
  dropbear: factorize the 'depends on BR2_PACKAGE_DROPBEAR'
  elf2flt: fix build when zlib is not installed on the host
  gcc: fix gcc 4.8 build when thread support is disabled
  flex: needs M4 at runtime
  Remove useless CVS related files
  network-manager: use a <pkg>_VERSION_MAJOR variable
  network-manager: bump to 0.9.8.0

Will Newton (2):
  numactl: new package
  poco: Add upstream patch to add support for aarch64.

 board/cubietech/cubieboard/boot.cmd                |    4 +
 board/cubietech/cubieboard/mkcubiecard.sh          |  119 ++++++++++++++++++++
 board/cubietech/cubieboard/post-build.sh           |   15 +++
 board/cubietech/cubieboard/readme.txt              |   59 ++++++++++
 configs/cubieboard_defconfig                       |   39 +++++++
 package/Config.in                                  |    6 +-
 package/Config.in.host                             |    1 +
 package/dropbear/Config.in                         |    8 +-
 package/flex/Config.in                             |    2 +
 package/flex/flex.mk                               |    1 +
 package/freescale-imx/Config.in                    |    8 ++
 package/{ => freescale-imx}/firmware-imx/Config.in |    0
 .../firmware-imx/firmware-imx.mk                   |    7 +-
 package/freescale-imx/freescale-imx.mk             |   13 +++
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |   30 +++++
 ...gpu-viv-bin-mx6q-0001-correct-HAL-include.patch |   16 +++
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |   79 +++++++++++++
 package/{ => freescale-imx}/imx-lib/Config.in      |    0
 package/{ => freescale-imx}/imx-lib/imx-lib.mk     |    5 +-
 .../network-manager/network-manager-execinfo.patch |   31 -----
 package/network-manager/network-manager.mk         |   37 +++---
 package/numactl/Config.in                          |   12 ++
 package/numactl/numactl.mk                         |   21 ++++
 package/poco/Config.in                             |    4 +-
 package/poco/poco-aarch64.patch                    |   39 +++++++
 package/sunxi-boards/Config.in                     |   19 ++++
 package/sunxi-boards/sunxi-boards.mk               |   17 +++
 package/sunxi-tools/Config.in                      |   10 ++
 package/sunxi-tools/Config.in.host                 |   12 ++
 package/sunxi-tools/sunxi-tools.mk                 |   37 ++++++
 support/gnuconfig/.cvsignore                       |    5 -
 toolchain/elf2flt/elf2flt.mk                       |    4 +-
 toolchain/elf2flt/elf2flt/.cvsignore               |    3 -
 toolchain/elf2flt/elf2flt/CVS/Entries              |   17 ---
 toolchain/elf2flt/elf2flt/CVS/Repository           |    1 -
 toolchain/elf2flt/elf2flt/CVS/Root                 |    1 -
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    2 +-
 toolchain/toolchain-external/Config.in             |   69 ++++--------
 toolchain/toolchain-external/ext-tool.mk           |   16 +--
 39 files changed, 617 insertions(+), 152 deletions(-)
 create mode 100644 board/cubietech/cubieboard/boot.cmd
 create mode 100755 board/cubietech/cubieboard/mkcubiecard.sh
 create mode 100755 board/cubietech/cubieboard/post-build.sh
 create mode 100644 board/cubietech/cubieboard/readme.txt
 create mode 100644 configs/cubieboard_defconfig
 create mode 100644 package/freescale-imx/Config.in
 rename package/{ => freescale-imx}/firmware-imx/Config.in (100%)
 rename package/{ => freescale-imx}/firmware-imx/firmware-imx.mk (85%)
 create mode 100644 package/freescale-imx/freescale-imx.mk
 create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/Config.in
 create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch
 create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
 rename package/{ => freescale-imx}/imx-lib/Config.in (100%)
 rename package/{ => freescale-imx}/imx-lib/imx-lib.mk (86%)
 delete mode 100644 package/network-manager/network-manager-execinfo.patch
 create mode 100644 package/numactl/Config.in
 create mode 100644 package/numactl/numactl.mk
 create mode 100644 package/poco/poco-aarch64.patch
 create mode 100644 package/sunxi-boards/Config.in
 create mode 100644 package/sunxi-boards/sunxi-boards.mk
 create mode 100644 package/sunxi-tools/Config.in
 create mode 100644 package/sunxi-tools/Config.in.host
 create mode 100644 package/sunxi-tools/sunxi-tools.mk
 delete mode 100644 support/gnuconfig/.cvsignore
 delete mode 100644 toolchain/elf2flt/elf2flt/.cvsignore
 delete mode 100644 toolchain/elf2flt/elf2flt/CVS/Entries
 delete mode 100644 toolchain/elf2flt/elf2flt/CVS/Repository
 delete mode 100644 toolchain/elf2flt/elf2flt/CVS/Root

-- 
1.7.9.5
