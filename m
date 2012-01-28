From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:36:40 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2012.02/ext-toolchain-updates
Message-ID: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

What follows is a set of patches doing various improvements and
updates to the external toolchain support:

 * Fixes to the x86_64 handling of BR2_GCC_TARGET_ARCH and addition of
   the Atom processor variant. Those changes are needed to make a
   better usage of the Sourcery CodeBench x86/x86_64 toolchain (i.e,
   allow the selection of the available multilib variants).

 * Improve the logic to copy libraries from the toolchain to the
   staging directory and the target directory to handle the directory
   organization of the Sourcery CodeBench x86/x86_64 toolchain.

 * Improve the same logic to support multilib toolchains with multilib
   variants in directories of multiple levels. For example, the MIPS
   Sourcery CodeBench toolchain has many multilib variants, and some
   of them are in directories like mips16/soft-float/el/. This
   requires a small modification of the way we create the symlink that
   allows to fake the original sysroot location.

 * Expand the external toolchain wrapper to include
   BR2_TARGET_OPTIMIZATION.

 * Various updates to the available external toolchains: add ARM
   Sourcery CodeBench 2011.03, update the MIPS Sourcery CodeBench
   2011.03, add the PowerPC Sourcery CodeBench 2011.03, add the
   x86/x86_64 Sourcery CodeBench 2011.09, add the Blackfin 2011R1-RC4
   toolchain.

 * Document how to use the various multilib variants available.

 * Adjust the uClibc detection logic to support static-only
   toolchains.

 * Adds support for the Linaro 2012.01 toolchain.

Changes since the v1 posted on January 4th 2012:

 - Add comments mentionning that Atom processors are only supported
   since gcc 4.5 (Peter Korsgaard comment)

 - Re-add $(Q) where appropriate (Thomas De Schampheleire comment)

 - Replaced CodeSourcery by Mentor Graphics where appropriate (Thomas
   De Schampheleire comment)

 - Add support for the Linaro 2012.01 toolchain

This patchset has been tested by doing a Buildroot build of a simple
Busybox filesystem, with the following toolchains used as external
toolchains:

 * ARM CodeSourcery 2010q1, default multilib config (ARMv5)
 * ARM CodeSourcery 2011.03, ARMv4 multilib config
 * ARM CodeSourcery 2011.03, default multilib config (ARMv5)
 * ARM CodeSourcery 2011.09, Thumb2 multilib config
 * ARM CodeSourcery 2011.09, default multilib config (ARMv5)
 * Blackfin toolchain, with shared lib support
 * Blackfin toolchain, without shared lib support
 * Basic ARM Buildroot external toolchain with C++ support
 * Basic ARM Buildroot external toolchain without C++ support
 * ARM Buildroot toolchain with all features enabled (largefile, etc.)
 * ARM Buildroot toolchain without thread support
 * Crosstool-NG ARM eglibc toolchain
 * Crosstool-NG ARM uClibc toolchain
 * Crosstool-NG mipsel eglibc toolchain
 * x86 Buildroot toolchain with all features enabled
 * mipsel o32 Buildroot toolchain with all features enabled
 * PowerPC e500mc Buildroot toolchain with all features enabled
 * x86_64 Nocona Buildroot toolchain with all features enabled
 * Crosstool-NG mips uclibc toolchain
 * Crosstool-NG powerpc uclibc toolchain
 * Crosstool-NG x86_64 eglibc toolchain
 * CodeSourcery PowerPC 2010.09, 603 multilib variant
 * CodeSourcery PowerPC 2010.09, e500mc multilib variant
 * CodeSourcery PowerPC 2011.03, e500v2 variant
 * CodeSourcery PowerPC 2011.03, default multilib variant
 * CodeSourcery PowerPC 4.4, default multilib variant
 * CodeSourcery IA32 2010.09 x86_64 Core 2 toolchain
 * CodeSourcery IA32 2010.09 x86 Pentium 4 toolchain
 * Linaro ARM 2012.01 toolchain
 * CodeSourcery MIPS 2011.03, default multilib variant
 * CodeSourcery MIPS 4.4, default multilib variant
 * CodeSourcery SuperH 2010.09, noMMU
 * CodeSourcery Super 2011.03, default multilib variant

Best regards,

Thomas Petazzoni

The following changes since commit 5528286147492aafa8740c09db63290042b79cb0:

  rt-tests: fix build issues on uClibc (2012-01-03 09:15:17 +0100)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2012.02/ext-toolchain-updates

Thomas Petazzoni (16):
      Add x86_64 variants to BR2_GCC_TARGET_ARCH
      Add the Atom processor in the list of supported x86/x86_64 processors
      Improve external toolchain logic to support IA32 Sourcery CodeBench toolchain
      Support multilib variants in sub-subdirectories
      Expand external toolchain wrapper to custom flags
      external-toolchain: remove 2009q1 ARM Sourcery toolchain
      external-toolchain: add Sourcery CodeBench ARM 2011.09
      external-toolchain: bump MIPS 2011.03 from -93 to -110
      external-toolchain: add Sourcery CodeBench PowerPC 2011.03
      external-toolchain: add Sourcery CodeBench x86/x86_64 2011.09
      external-toolchain: Blackfin.uclinux.org 2011R1-RC4
      external-toolchain: details on selecting the multilib variants
      external-toolchain: run checks even on extracted toolchains
      external-toolchain: adjust check for uClibc static toolchains
      external-toolchain: fix description of PowerPC 2010.09 from Mentor Graphics
      external-toolchain: add support for Linaro 2012.01

 target/Config.in.arch                              |   17 ++
 toolchain/helpers.mk                               |   55 ++++-
 toolchain/toolchain-external/Config.in             |  222 ++++++++++++++++++--
 toolchain/toolchain-external/ext-tool.mk           |  100 +++++++--
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 +
 5 files changed, 345 insertions(+), 52 deletions(-)

Thanks,
-- 
Thomas Petazzoni
