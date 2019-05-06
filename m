From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 May 2019 20:29:56 +0200
Subject: [Buildroot] [PATCH 00/15] Add gcc 9.1
Message-ID: <20190506183011.4856-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before adding gcc 9.1 [1] to Buildroot, add some fixes for issues discovered
by toolchain-builder [2] that are trigged by this new compiler version.
(disable powerpc Werror, uClibc-ng asm sparc and ARC glibc).

Then add gcc 9.1 for internal and extenal toolchain backend and switch gcc 8.x
as default compiler.

Thanks to Yann E. MORIN for providing a patch series that add new ARM cores
added by gcc 9.1.

Finally, enbable the new ork1 (openrisc) that will replace in the following
series the old gcc fork (gcc 5.x).

[1] https://gcc.gnu.org/gcc-9/changes.html
[2] https://gitlab.com/kubu93/toolchains-builder/pipelines/59794237

Romain Naour (9):
  package/glibc/arc: fix build issue with gcc-9.1
  board/qemu/ppc*: disable Werror while building ppc kernel with gcc >=
    9.1
  [RFC] package/uclibc: remove asm constraint
  arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_9
  toolchain: add gcc 9 entry
  package/gcc: add support for gcc 9.1
  toolchain-external: add gcc 9 entry
  package/gcc: switch to gcc 8.x as the default
  package/gcc: enable gcc 9.1 for ork1 (openrisc)

Yann E. MORIN (6):
  arch/arm: move dependency on 64-bit down to individual cores
  arch/arm: some cores have a different name with gcc-9
  arch/arm: saphira is in fact an armv8.4a
  arch/arm: add two new 64-bit-only armv8a cores
  arch/arm: add two new cortex-based armv8.2a cores
  arch/arm: add two new non-cortex-based armv8.2a cores

 arch/Config.in                                     |   4 +
 arch/Config.in.arm                                 |  95 ++++-
 .../linux/linux-ppc-disable-werror.fragment        |   1 +
 configs/qemu_ppc64_e5500_defconfig                 |   2 +-
 configs/qemu_ppc64_pseries_defconfig               |   1 +
 configs/qemu_ppc64le_pseries_defconfig             |   1 +
 configs/qemu_ppc_g3beige_defconfig                 |   1 +
 configs/qemu_ppc_mpc8544ds_defconfig               |   1 +
 configs/qemu_ppc_virtex_ml507_defconfig            |   1 +
 package/gcc/Config.in.host                         |   8 +-
 package/gcc/gcc.hash                               |   2 +
 package/gcc/gcc.mk                                 |   4 +-
 ...0001-Add-support-for-GCC-9-attribute-copy.patch | 402 +++++++++++++++++++++
 ...FC-sparc-syscalls.h-remove-asm-constraint.patch |  46 +++
 toolchain/Config.in                                |   5 +
 .../toolchain-external-custom/Config.in.options    |   6 +
 16 files changed, 560 insertions(+), 20 deletions(-)
 create mode 100644 board/fragments/linux/linux-ppc-disable-werror.fragment
 create mode 100644 package/glibc/arc-2018.09-release/0001-Add-support-for-GCC-9-attribute-copy.patch
 create mode 100644 package/uclibc/0003-RFC-sparc-syscalls.h-remove-asm-constraint.patch

-- 
2.14.5
