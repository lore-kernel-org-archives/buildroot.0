From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 21:00:05 +0200
Subject: [Buildroot] [PATCH v3 00/10] ARM Cortex-M support and STM32
	defconfigs
Message-ID: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the v3 of the patches adding support for Cortex-M and STM32
defconfigs.

Changes since v2:

 - Rebased on top of master, dropping patches that have been merged
   along the way.

 - Added one patch that switches to using the upstream uClibc patch
   for ARM Thumb simplification.

 - Fixed sha256sum -> sha256 in elf2flt.hash, as noticed by Ezequiel
   Garcia.

 - Improved the commit log of patch "uclibc: context functions are not
   Thumb-compatible" according to Arnout's suggestion, and also added
   a comment in uclibc.mk to explain why we're disabling context
   functions.

 - Fix invalid paths in readme.txt for STM32 boards, as noticed by Lee
   Jones.

Thanks!

Thomas

Lee Jones (2):
  configs/stm32f429_disco: new configuration for STM32F429 Discovery
    board
  configs/stm32f469_disco: new configuration for STM32F469 Discovery
    board

Thomas Petazzoni (8):
  uclibc: use upstreamed patch for ARM Thumb simplification
  uclibc: context functions are not Thumb-compatible
  musl: build broken on Thumb, use ARM mode
  toolchain-buildroot: update glibc comment for noMMU
  toolchain-buildroot: don't show musl on noMMU platforms
  package/Makefile.in: adjust LDFLAGS for elf2flt
  elf2flt: use new upstream site and add ARM patch
  afboot-stm32: use the Buildroot toolchain

 board/stmicroelectronics/busybox-minimal.config    | 1057 ++++++++++++++++++++
 board/stmicroelectronics/stm32-post-build.sh       |    8 +
 board/stmicroelectronics/stm32f429-disco/flash.sh  |   20 +
 ...49-disco-don-t-force-init-in-chosen-boota.patch |   32 +
 .../stmicroelectronics/stm32f429-disco/readme.txt  |   30 +
 board/stmicroelectronics/stm32f469-disco/flash.sh  |   20 +
 ...-ARM-stm32-Identify-a-new-board-STM32F469.patch |   25 +
 ...upply-a-DTS-file-for-the-STM32F469-Discov.patch |  101 ++
 ...-Add-new-config-fragment-to-change-RAM-st.patch |   28 +
 .../patches/openocd/0001-add-config.patch          |   37 +
 .../patches/openocd/0002-flash-nor.patch           |   37 +
 .../stmicroelectronics/stm32f469-disco/readme.txt  |   19 +
 .../0001-Use-ld-instead-of-gcc-for-linking.patch   |   61 ++
 boot/afboot-stm32/afboot-stm32.mk                  |    2 +-
 configs/stm32f429_disco_defconfig                  |   18 +
 configs/stm32f469_disco_defconfig                  |   19 +
 package/Makefile.in                                |    2 +-
 .../0001-allow-to-build-arm-flat-binaries.patch    |  123 +++
 package/elf2flt/elf2flt.hash                       |    2 +
 package/elf2flt/elf2flt.mk                         |    8 +-
 package/musl/musl.mk                               |    6 +
 .../0001-arm-remove-use-of-USE_BX-option.patch     |   53 -
 ...implify-handling-of-Thumb-related-options.patch |  147 +++
 package/uclibc/0002-arm-remove-USE_BX-option.patch |   40 -
 .../0003-arm-remove-use-of-USE_LDREXSTREX.patch    |   49 -
 .../uclibc/0004-arm-remove-USE_LDREXSTREX.patch    |   34 -
 .../uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch  |   43 -
 package/uclibc/uclibc.mk                           |   11 +
 toolchain/toolchain-buildroot/Config.in            |    4 +
 29 files changed, 1811 insertions(+), 225 deletions(-)
 create mode 100644 board/stmicroelectronics/busybox-minimal.config
 create mode 100755 board/stmicroelectronics/stm32-post-build.sh
 create mode 100755 board/stmicroelectronics/stm32f429-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
 create mode 100644 board/stmicroelectronics/stm32f429-disco/readme.txt
 create mode 100755 board/stmicroelectronics/stm32f469-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-Identify-a-new-board-STM32F469.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-Supply-a-DTS-file-for-the-STM32F469-Discov.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-Add-new-config-fragment-to-change-RAM-st.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/readme.txt
 create mode 100644 boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch
 create mode 100644 configs/stm32f429_disco_defconfig
 create mode 100644 configs/stm32f469_disco_defconfig
 create mode 100644 package/elf2flt/0001-allow-to-build-arm-flat-binaries.patch
 create mode 100644 package/elf2flt/elf2flt.hash
 delete mode 100644 package/uclibc/0001-arm-remove-use-of-USE_BX-option.patch
 create mode 100644 package/uclibc/0001-arm-simplify-handling-of-Thumb-related-options.patch
 delete mode 100644 package/uclibc/0002-arm-remove-USE_BX-option.patch
 delete mode 100644 package/uclibc/0003-arm-remove-use-of-USE_LDREXSTREX.patch
 delete mode 100644 package/uclibc/0004-arm-remove-USE_LDREXSTREX.patch
 delete mode 100644 package/uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch

-- 
2.6.4
