From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 May 2021 13:36:47 +0200
Subject: [Buildroot] [PATCH RFC 0/4] Basic support for 64-bit kernel and
 32-bit userland
Message-ID: <20210518113652.29609-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hello,

Even though there are already cases where a 64-bit kernel is combined with
32-bit userland, like MIPS64n32, that Buildroot can support out-of-the-box,
there are other combinations that don't currently work.

At work, we have two such cases:
- 64-bit x86_64 kernel with 32-bit i386 userspace
- 64-bit aarch64 kernel with 32-bit arm userspace

This series adds basic support for these cases, with the limitation that the
user still needs to know what they are doing.

Patch 1 is a general improvement and can land even if you don't agree
with the rest.

Patch 2 handles the realization that 'KERNEL_ARCH' can mean two different
things, and that we need two separate variables.

Patch 3 makes it possible for users to specify the kernel architecture that
differs from the Buildroot notion of userspace architecture.

Patch 4 fixes the build of perf in this mixed 64-bit-kernel+32-bit-userspace
case.


As hinted above, users that would like to employ such scenarios still need to
know what they are doing:

- the correct value of BR2_KERNEL_ARCH_OVERRIDE is to be known by the user

- the toolchain should be capable of generating both 64-bit (kernel) output as
  well as 32-bit userspace output. This is typically done with a multilib
  toolchain, where the default output is 64-bit so that the kernel build does
  not require additional changes, while passing the correct '-mXXX' flag as
  BR2_TARGET_OPTIMIZATION for the userspace compilations.

- it is not possible to create one multilib toolchain that supports Aarch64 and
  (32-bit) ARM output. We have solved it by packaging two individual toolchains
  in one archive, with symlinks at top-level to the 32-bit toolchain, and
  some additional changes in Buildroot to make sure the 64-bit toolchain is
  used where needed (kernel, bootloader)

- BR2_KERNEL_64_USERLAND_32 is not automatically passed.


An alternative implementation would be to explicitly support certain
combinations, but this is less flexible.

Best regards,
Thomas



Thomas De Schampheleire (4):
  arch: move definition of KERNEL_ARCH to Config.in.<arch> files
  core: introduce NORMALIZED_ARCH as non-kernel replacement for
    KERNEL_ARCH
  core: introduce BR2_KERNEL_ARCH_OVERRIDE
  perf: fix compilation in case of i386 userspace with x86_64 kernel

 Makefile                                      | 22 +++++--------------
 arch/Config.in                                | 18 +++++++++++++++
 arch/Config.in.arc                            |  3 +++
 arch/Config.in.arm                            |  4 ++++
 arch/Config.in.csky                           |  3 +++
 arch/Config.in.m68k                           |  3 +++
 arch/Config.in.microblaze                     |  3 +++
 arch/Config.in.mips                           |  3 +++
 arch/Config.in.nds32                          |  3 +++
 arch/Config.in.nios2                          |  3 +++
 arch/Config.in.or1k                           |  3 +++
 arch/Config.in.powerpc                        |  3 +++
 arch/Config.in.riscv                          |  3 +++
 arch/Config.in.s390x                          |  3 +++
 arch/Config.in.sh                             |  3 +++
 arch/Config.in.sparc                          |  4 ++++
 arch/Config.in.x86                            |  4 ++++
 arch/Config.in.xtensa                         |  3 +++
 boot/barebox/barebox.mk                       | 10 ++++-----
 boot/uboot/uboot.mk                           |  6 ++---
 package/busybox/busybox.mk                    |  2 +-
 .../environment-setup/environment-setup.mk    |  2 +-
 package/kvmtool/kvmtool.mk                    |  4 ++--
 package/libselinux/libselinux.mk              |  2 +-
 package/linux-tools/linux-tool-perf.mk.in     |  7 ++++--
 .../linux-tools/linux-tool-selftests.mk.in    |  6 ++---
 package/olsr/olsr.mk                          |  4 ++--
 package/pciutils/pciutils.mk                  |  2 +-
 package/uboot-tools/uboot-tools.mk            | 10 ++++-----
 29 files changed, 104 insertions(+), 42 deletions(-)

-- 
2.26.3
