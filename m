From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:23 +0200
Subject: [Buildroot] [PATCHv2 00/25] OABI removal,
	ARM floating point improvements, EABIhf and Thumb2 support
Message-ID: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a patch series that:

 * removes support for OABI (patches contributed by Yann)
 * improves the support for various floating point possibilities on
   ARM
 * adds support for the ARM EABIhf ABI
 * adds support for the Thumb2 instruction set

Changes since v1:
 * Integration of Yann patches to remove OABI.
 * Integration of a gcc fix for the beaglebone_defconfig (patch 1)
 * Select soft float unconditionally on AVR32. Suggested by Peter.
 * Don't enable soft float by default on PowerPC. Suggested by Peter.
 * Integration of an additional patch doing some tab/spaces cleanup in
   arch/Config.in*
 * Support for the Thumb2 instruction set

In summary:

 * Patch 1 fixes a bug that was introduced by the recent conversion of
   the toolchain backend to packages. It fixes the build of the
   beaglebone_defconfig.

 * Patches 2 to 11 are Yann's patches that remove OABI support, and
   make a few simplifications after this removal. I've done a few
   modifications:

   - In patch "arch/arm: remove OABI option", I'm only removing the
     OABI option, and not removing completely the ABI choice, since
     the following patches are adding the EABIhf ABI choice.

   - I've merged the patches "arch/arm: remove setting gcc's apcs-gnu
     ABI (aka OABI)" and "arch/arm: drop 'if EABI' since it's always
     true now" since they are essentially doing the same thing.

   - I've removed "arch/arm: remove ARM_EABI symbol since there's no
     users left" since we're adding ARM_EABIHF afterwards.

 * Patch 12 introduces the BR2_GCC_TARGET_FLOAT and BR2_GCC_TARGET_FPU
   hidden options, that will be used by the Config.in.<arch> files to
   define which -mfloat-abi= and -mfpu= values they want.

 * Patch 13 moves BR2_SOFT_FLOAT as global hidden option, and adds
   per-architecture visible options. This will allow each architecture
   to do its own business in terms of floating point strategy
   selection, while still providing a global BR2_SOFT_FLOAT for
   Buildroot code that needs to know whether floating point is
   emulated in software or not.

 * Patch 14 is the core of the patch set, adding many new options to
   select various VFP versions for various ARM cores, and adding
   support for the EABIhf ARM ABI. A special attention has been made
   on the Config.in help texts, to help the user making the right
   choice in terms of VFP selection.

 * Patch 15 and 16 adjust gcc and binutils version availabilities
   according to the selected ABI or VFP version.

 * Patch 17 removes the BR2_VFP_FLOAT option that no longer makes any
   sense.

 * Patch 18 updates some defconfig that were using BR2_VFP_FLOAT.

 * Patch 19 updates the beaglebone_defconfig to use EABIhf.

 * Patch 20 updates the external toolchain Config.in options after the
   introduction of the VFP selection and EABIhf ABI.

 * Patch 21 adds a fix for EABIhf that consists in creating a specific
   symbolic link for the dynamic loader, which is needed when gcc 4.7
   is used with eglibc.

 * Patch 22, 23 and 24 add the support for Thumb2

 * Patch 25 makes some minor space vs. tabs cleanups.

Thanks,

Thomas

Thomas Petazzoni (15):
  gcc: use BR2_EXTRA_GCC_CONFIG_OPTIONS in gcc-initial and
    gcc-intermediate
  arch: introduce BR2_GCC_TARGET_{FPU,FLOAT}
  arch: Refactor BR2_SOFT_FLOAT into per-architecture options
  arch: improve ARM floating point support and add support for EABIhf
  binutils: exclude binutils versions that don't support EABIhf
  gcc: take into account ARM floating point capabilities
  toolchain: remove the old BR2_VFP_FLOAT option
  configs: update defconfigs after VFP option changes
  configs: use new EABIhf option for beaglebone_defconfig
  toolchain-external: update config options after EABIhf introduction
  gcc: create symbolic link to ld-linux in EABIhf/gcc 4.7/eglibc
  arch/arm: add support for Thumb2
  uclibc: use numbered patches for 0.9.33.2
  uclibc: add Thumb2 fixes
  arch: use tabs instead of spaces in Config.in files

Yann E. MORIN (10):
  package/uclibc: fix indentation (use tabs, not spaces)
  arch/arm: remove OABI option
  arch/arm: remove setting gcc's apcs-gnu ABI (aka OABI)
  package/uclibc: ARM OABI is no longer supported
  toolchain/helpers: ARM OABI is no longer supported
  linux: remove EABI conditional
  pkg-infra: dump all ARM OABI references when setting ABI
  toolchain/helpers: only check for an EABI toolchain
  package/owl-linux: drop check for EABI
  package/uClibc: drop ARM EABI conditions

 Config.in.legacy                                   |   9 +
 arch/Config.in                                     |  14 +-
 arch/Config.in.arm                                 | 259 +++++++++++++++++++--
 arch/Config.in.avr32                               |   4 +-
 arch/Config.in.bfin                                |   2 +-
 arch/Config.in.mips                                |  10 +
 arch/Config.in.powerpc                             |   9 +
 configs/beaglebone_defconfig                       |   3 +-
 configs/calao_snowball_defconfig                   |   3 +-
 configs/mx53loco_defconfig                         |   3 +-
 configs/qemu_arm_nuri_defconfig                    |   3 +-
 configs/qemu_arm_vexpress_defconfig                |   3 +-
 linux/linux.mk                                     |   5 +-
 package/Makefile.in                                |  15 +-
 package/binutils/Config.in.host                    |   3 +
 package/gcc/Config.in.host                         |  14 +-
 package/gcc/gcc-final/gcc-final.mk                 |  12 +
 package/gcc/gcc-initial/gcc-initial.mk             |   3 +-
 package/gcc/gcc-intermediate/gcc-intermediate.mk   |   3 +-
 package/gcc/gcc.mk                                 |  15 ++
 package/owl-linux/Config.in                        |   5 +-
 ...bc-0001-bits-time.h-sync-with-glibc-2.16.patch} |   9 +-
 ...on-of-MSG_WAITFORONE-and-MSG_CMSG_CLOEXE.patch} |  23 +-
 ...p3.patch => uclibc-0003-Add-dup3-syscall.patch} |  22 +-
 ...eps-add-__kernel_long-and-__kernel_ulong.patch} |   7 +-
 ...uclibc-0005-Patch-from-OpenWRT-for-avr32.patch} |  14 +-
 ...estore-stack-pointer-just-after-return-fr.patch |  42 ++++
 ...e.S-Add-missing-IT-instruction-for-Thumb2.patch |  29 +++
 ...8-arm-move-check-for-BX-to-its-own-header.patch | 257 ++++++++++++++++++++
 package/uclibc/Config.in                           |  11 +-
 package/uclibc/uclibc.mk                           |   4 +-
 toolchain/helpers.mk                               |  13 +-
 toolchain/toolchain-buildroot/Config.in.2          |  12 -
 toolchain/toolchain-common.in                      |  21 --
 toolchain/toolchain-external/Config.in             |  24 +-
 toolchain/toolchain-external/ext-tool.mk           |  20 +-
 .../toolchain-external/ext-toolchain-wrapper.c     |  12 +-
 37 files changed, 780 insertions(+), 137 deletions(-)
 rename package/uclibc/0.9.33.2/{uclibc-bits-time.h-sync-with-glibc-2.16.patch => uclibc-0001-bits-time.h-sync-with-glibc-2.16.patch} (82%)
 rename package/uclibc/0.9.33.2/{uclibc-define-MSG_CMSG_CLOEXEC.patch => uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CLOEXE.patch} (54%)
 rename package/uclibc/0.9.33.2/{uclibc-dup3.patch => uclibc-0003-Add-dup3-syscall.patch} (73%)
 rename package/uclibc/0.9.33.2/{uclibc-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch => uclibc-0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch} (98%)
 rename package/uclibc/0.9.33.2/{uclibc-OpenWRT-140-avr32_atomic_fix.patch => uclibc-0005-Patch-from-OpenWRT-for-avr32.patch} (50%)
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0008-arm-move-check-for-BX-to-its-own-header.patch

-- 
1.8.1.2
