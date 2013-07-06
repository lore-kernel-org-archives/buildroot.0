From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Jul 2013 17:08:04 +0200
Subject: [Buildroot] [PATCH 0/8] ARM floating point improvements and EABIhf
	support
Message-ID: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a patch series that improves the support for the various
floating point possibilities on ARM, and adds support for the new
EABIhf ARM ABI. Until now, we only had a global BR2_SOFT_FLOAT option
to enable/disable soft-float support, and on ARM a BR2_VFP_FLOAT
option to enable -mfpu=vfp. This clearly isn't sufficient to take into
the various possibilities offered by the Cortex-A ARM cores.

In summary:

 * PATCH 1 introduces the BR2_GCC_TARGET_FLOAT and BR2_GCC_TARGET_FPU
   hidden options, that will be used by the Config.in.<arch> files to
   define which -mfloat-abi= and -mfpu= values they want.

 * PATCH 2 moves BR2_SOFT_FLOAT as global hidden option, and adds
   per-architecture visible options. This will allow each architecture
   to do its own business in terms of floating point strategy
   selection, while still providing a global BR2_SOFT_FLOAT for
   Buildroot code that needs to know whether floating point is
   emulated in software or not.

 * PATCH 3 is the core of the patch set, adding many new options to
   select various VFP versions for various ARM cores, and adding
   support for the EABIhf ARM ABI. A special attention has been made
   on the Config.in help texts, to help the user making the right
   choice in terms of VFP selection.

 * PATCH 4 and 5 adjust gcc and binutils version availabilities
   according to the selected ABI or VFP version.

 * PATCH 6 removes the BR2_VFP_FLOAT option that no longer makes any
   sense.

 * PATCH 7 updates some defconfig that were using BR2_VFP_FLOAT.

 * PATCH 8 updates the external toolchain Config.in options after the
   introduction of the VFP selection and EABIhf ABI.

I have tested the following combinations:
 * ARM926 soft-float EABI internal toolchain
 * Cortex-A8 softfp EABI internal toolchain, using VFPv3-D16
 * Cortex-A8 EABIhf toolchain, using VFPv3-D16
 * Cortex-A8 soft-float with the Arago toolchain (the libc/libm itself
   uses VFP instructions, but programs are properly built soft-float)
 * Cortex-A8 softfp with the Arago toolchain, using VFPv3-D16
 * Cortex-A8 EABIhf with the Linaro toolchain, using VFPv3-D16

For each case, it was run time tested on a Cortex-A8 real platform
(not Qemu), using a small demo program that makes a few floating point
computations, and the assembly code was checked to verify that we're
correctly in the soft-float, softfp or hard cases.

Thanks,

Thomas

Thomas Petazzoni (8):
  arch: introduce BR2_GCC_TARGET_{FPU,FLOAT}
  arch: Refactor BR2_SOFT_FLOAT into per-architecture options
  arch: improve ARM floating point support and add support for EABIhf
  binutils: exclude binutils versions that don't support EABIhf
  gcc: take into account ARM floating point capabilities
  toolchain: remove the old BR2_VFP_FLOAT option
  configs: update defconfigs after VFP option changes
  toolchain-external: update config options after EABIhf introduction

 Config.in.legacy                                   |   9 +
 arch/Config.in                                     |   9 +
 arch/Config.in.arm                                 | 221 ++++++++++++++++++++-
 arch/Config.in.avr32                               |  10 +
 arch/Config.in.mips                                |  10 +
 arch/Config.in.powerpc                             |  10 +
 configs/calao_snowball_defconfig                   |   3 +-
 configs/mx53loco_defconfig                         |   3 +-
 configs/qemu_arm_nuri_defconfig                    |   3 +-
 configs/qemu_arm_vexpress_defconfig                |   3 +-
 package/Makefile.in                                |   6 +
 package/binutils/Config.in.host                    |   3 +
 package/gcc/Config.in.host                         |  10 +
 package/gcc/gcc.mk                                 |  10 +
 toolchain/toolchain-buildroot/Config.in.2          |  12 --
 toolchain/toolchain-common.in                      |  21 --
 toolchain/toolchain-external/Config.in             |  24 ++-
 toolchain/toolchain-external/ext-tool.mk           |  15 +-
 .../toolchain-external/ext-toolchain-wrapper.c     |   9 +-
 19 files changed, 330 insertions(+), 61 deletions(-)

-- 
1.8.1.2
