From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 22:08:02 +0100
Subject: [Buildroot] [PATCH v2 00/17] ARM Cortex-M support and STM32
	defconfigs
Message-ID: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the v2 of the patches that add support for ARM Cortex-M and
STM32 defconfigs.

The changes from v1 are:

 - Added Arnout Acked-by on patch "arch/arm: introduce and use
   BR2_ARM_CPU_ARMV7M".

 - Added Arnout Reviewed-by on patch "arch/arm: add Cortex-M4 entry"

 - Replace the complicated COMPILE_IN_THUMB/USE_BX logic in uclibc.mk
   by patches against uClibc-ng that allow to completely get rid of
   those options. Then simplified uclibc.mk accordingly.

 - Remove hard-float suport for now, since there is no support for it
   in the kernel. Suggested by Arnout.

 - Use BR2_BINFMT_FLAT instead of BR2_USE_MMU to decide whether to
   disable DOPIC in uClibc. Suggested by Arnout.

 - Fix typo in DOPIC commit log. Noticed by Arnout.

 - Added Arnout Reviewed-by on patch "uclibc: NPTL thread
   implementation only available on MMU platforms".

 - In the patch that ensures musl is built for the ARM instruction set
   when Thumb1 is selected, clarify the comment. Suggested by Arnout.

 - Added Arnout Reviewed-by on package/Makefile.in: adjust LDFLAGS for
   elf2flt.

 - Add hash file to the elf2flt package. Suggested by Arnout.

 - Improve the elf2flt upstream change commit log, to explain more
   clearly why the patch from Waldemar is included in this
   commit. Done after a comment made by Arnout.

 - Merge the elf2flt --disable-werror into the elf2flt upstream change
   patch, since it's actually related (switching upstream has changed
   the source code, which is the reason for the new warnings that
   cause the build issues).

 - Switch to kernel 4.5 for the STM32 defconfigs

 - Regenerate Linux patches for STM32F469 since they were not applying
   correctly (reported by Maxime Coquelin).

Thanks!

Thomas

Lee Jones (2):
  configs/stm32f429_disco: new configuration for STM32F429 Discovery
    board
  configs/stm32f469_disco: new configuration for STM32F469 Discovery
    board

Thomas Petazzoni (15):
  arch/arm: introduce and use BR2_ARM_CPU_ARMV7M
  arch/arm: Cortex-M3 provides only Thumb-2
  arch/arm: add Cortex-M4 entry
  uclibc: add patches to simplify Thumb handling
  uclibc: remove USE_BX handling
  uclibc: gcc >= 4.9 can build a thumb/thread uclibc
  uclibc: disable DOPIC on ARM FLAT
  uclibc: context functions are not Thumb-compatible
  uclibc: NPTL thread implementation only available on MMU platforms
  musl: build broken on Thumb, use ARM mode
  toolchain-buildroot: update glibc comment for noMMU
  toolchain-buildroot: don't show musl on noMMU platforms
  package/Makefile.in: adjust LDFLAGS for elf2flt
  elf2flt: use new upstream site and add ARM patch
  afboot-stm32: use the Buildroot toolchain

 arch/Config.in.arm                                 |   10 +-
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
 .../0001-arm-remove-use-of-USE_BX-option.patch     |   53 +
 package/uclibc/0002-arm-remove-USE_BX-option.patch |   40 +
 .../0003-arm-remove-use-of-USE_LDREXSTREX.patch    |   49 +
 .../uclibc/0004-arm-remove-USE_LDREXSTREX.patch    |   34 +
 .../uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch  |   43 +
 package/uclibc/Config.in                           |    7 +-
 package/uclibc/uclibc.mk                           |   23 +-
 toolchain/toolchain-buildroot/Config.in            |    4 +
 30 files changed, 1897 insertions(+), 21 deletions(-)
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
 create mode 100644 package/uclibc/0001-arm-remove-use-of-USE_BX-option.patch
 create mode 100644 package/uclibc/0002-arm-remove-USE_BX-option.patch
 create mode 100644 package/uclibc/0003-arm-remove-use-of-USE_LDREXSTREX.patch
 create mode 100644 package/uclibc/0004-arm-remove-USE_LDREXSTREX.patch
 create mode 100644 package/uclibc/0005-arm-remove-COMPILE_IN_THUMB.patch

-- 
2.6.4
