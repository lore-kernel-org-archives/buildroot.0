From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:06 +0100
Subject: [Buildroot] [PATCH 00/16] ARM Cortex-M support
Message-ID: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series of patches brings to Buildroot the support for ARM
Cortex-M systems. We already had the choice of Cortex-M3 in
menuconfig, but that was pretty much it. This set of patches bring
support for:

 - Building a Cortex-M toolchain with the internal toolchain
   backend. This is based on an initial patch from Paul Enman, around
   which numerous fixes have been added.

 - Cortex-M4, including EABIhf for FPv4-SP, the FPU used in some
   Cortex-M4. Note however that there doesn't seem to be any FPU
   support in the kernel yet for ARMv7-M, so in practice this cannot
   be used today.

 - Two defconfigs for Cortex-M4 platforms from STMicro. Those
   defconfigs were submitted by Lee Jones, and are included in this
   patch series after being tweaked to generate working configurations
   with the internal toolchain backend (plus other
   tweaks/simplifications).

 - Misc other fixes/improvements related to Cortex-M support, or
   building toolchains for Thumb/Thumb2.

The whole thing has been tested on STM32F429.

Thanks!

Thomas

Lee Jones (2):
  configs/stm32f429_disco: new configuration for STM32F429 Discovery
    board
  configs/stm32f469_disco: new configuration for STM32F469 Discovery
    board

Paul Enman (1):
  uclibc: Enable compile in thumb mode when selected

Thomas Petazzoni (13):
  arch/arm: introduce and use BR2_ARM_CPU_ARMV7M
  arch/arm: Cortex-M3 provides only Thumb-2
  arch/arm: add Cortex-M4 entry
  uclibc: disable DOPIC on ARM noMMU
  uclibc: NPTL thread implementation only available on MMU platforms
  musl: build broken on Thumb, use ARM mode
  toolchain-buildroot: update glibc comment for noMMU
  toolchain-buildroot: don't show musl on noMMU platforms
  arch/arm: add support for hard-float on Cortex-M4
  package/Makefile.in: adjust LDFLAGS for elf2flt
  elf2flt: use new upstream site and add ARM patch
  elf2flt: disable Werror to avoid build issues
  afboot-stm32: use the Buildroot toolchain

 arch/Config.in.arm                                 |   33 +-
 board/stmicroelectronics/busybox-minimal.config    | 1057 ++++++++++++++++++++
 board/stmicroelectronics/stm32-post-build.sh       |    8 +
 board/stmicroelectronics/stm32f429-disco/flash.sh  |   20 +
 ...49-disco-don-t-force-init-in-chosen-boota.patch |   32 +
 .../stmicroelectronics/stm32f429-disco/readme.txt  |   30 +
 board/stmicroelectronics/stm32f469-disco/flash.sh  |   20 +
 .../linux/0001-kernel-add-top-compatible.patch     |   25 +
 .../patches/linux/0002-kernel-new-dts-file.patch   |  114 +++
 .../linux/0003-kernel-config-frag-ram.patch        |   28 +
 .../patches/openocd/0001-add-config.patch          |   37 +
 .../patches/openocd/0002-flash-nor.patch           |   37 +
 .../stmicroelectronics/stm32f469-disco/readme.txt  |   19 +
 .../0001-Use-ld-instead-of-gcc-for-linking.patch   |   61 ++
 boot/afboot-stm32/afboot-stm32.mk                  |    2 +-
 configs/stm32f429_disco_defconfig                  |   18 +
 configs/stm32f469_disco_defconfig                  |   19 +
 package/Makefile.in                                |    2 +-
 .../0001-allow-to-build-arm-flat-binaries.patch    |  123 +++
 package/elf2flt/elf2flt.mk                         |    8 +-
 package/musl/musl.mk                               |    5 +
 package/uclibc/Config.in                           |    2 +
 package/uclibc/uclibc.mk                           |   28 +-
 toolchain/toolchain-buildroot/Config.in            |    4 +
 24 files changed, 1721 insertions(+), 11 deletions(-)
 create mode 100644 board/stmicroelectronics/busybox-minimal.config
 create mode 100755 board/stmicroelectronics/stm32-post-build.sh
 create mode 100755 board/stmicroelectronics/stm32f429-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
 create mode 100644 board/stmicroelectronics/stm32f429-disco/readme.txt
 create mode 100755 board/stmicroelectronics/stm32f469-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-kernel-add-top-compatible.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0002-kernel-new-dts-file.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0003-kernel-config-frag-ram.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/readme.txt
 create mode 100644 boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch
 create mode 100644 configs/stm32f429_disco_defconfig
 create mode 100644 configs/stm32f469_disco_defconfig
 create mode 100644 package/elf2flt/0001-allow-to-build-arm-flat-binaries.patch

-- 
2.6.4
