From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  7 Sep 2019 11:40:15 +0200
Subject: [Buildroot] [PATCH v2 00/12] Add the support for Clang
 cross-compiler
Message-ID: <20190907094027.9537-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Last year Valentin Korenblit added during his internship at Smile,
llvm/clang packages to provide llvm/clang libraries for the target.
See the article from Valentin on Linuxembedded blog [1].

But Clang could not be used as a cross-compiler by Buildroot since
it was necessary to build the Linux kernel with GCC [2].

Recently, I've tried to build an aarch64 Linux kernel (5.2.7) with
Clang and it worked under Qemu [3]. I also tested for x86_64 but we need
the upcomming llvm/clang version 9 to build the kernel [4].
This new version add the support of "asm-goto" which was the last
missing part to be able to build the Linux kernel on x86_64 [5].
But for theses tests, only the kernel was built with Clang.

While testing the x86_64 kernel and it's rootfs built with Clang under Qemu,
I had a runtime issue during the userspace boot process (Busybox's init).
While searching about the issue, I discover the lowRISC blog from Lu??s Marques
about the same issue and tested the patch he contributed to the Busybox project
(Thanks!).

So, this series is about to complete the integration of Clang as cross-compiler
by using a toolchain-wrapper and fixing some build system infrastructure
(cmake, meson) to use Clang instead of GCC.

Add this new experimental option into "Advanced" menu since we are expecting
some build and runtime issues for number of packages (bootloaders, kernel).

For now, Clang cross-compiler can only be use as internal toolchain,
so it is build from the source which take a long time...

[1] http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot
[2] https://www.elinux.org/Buildroot:DeveloperDaysFOSDEM2018#LLVM.2FClang
[3] http://www.linuxembedded.fr/2019/08/my-first-linux-kernel-built-with-clang-compiler
[4] https://www.phoronix.com/scan.php?page=news_item&px=LLVM-9.0-RC3-Released
[5] https://www.phoronix.com/scan.php?page=news_item&px=LLVM-Asm-Goto-Merged
[6] https://www.lowrisc.org/blog/2019/07/large-scale-risc-v-llvm-testing-with-buildroot

Best regards,
Romain

v2: Fix pkg-meson (missing $) and keep TARGET_CROSS in sed command for other tools (as etc).
    Install the GCC external toolchain before executing realpath command.
	Move host-clang dependency to toolchain virtual package since host-clang now
	 depends on external-toolchain.
	Add Glibc toolchain dependency
	Use GCC to build Glibc for internal toolchain.

Romain Naour (12):
  package/clang: help host-clang to find our external toolchain
  package/llvm: add the version major variable
  package/clang: add the version major variable
  package/clang: install a toolchain-wrapper for the host clang
    cross-compiler
  linux: override CC for the case CC is not GCC
  package/meson: use TARGET_{CC,CXX} instead of TARGET_CROSS for cc and
    cpp
  package/busybox: fix applets runtime issue when building with clang
    cross-compiler
  package/clang: add a host entry for clang
  package/glibc: use GCC cross-compiler if Clang is used as
    cross-compiler
  core: allow to use Clang as cross-compiler
  toolchain: add a warning when Clang is used as cross-compiler
  linux: don't set -Wno-attribute-alias flag when Clang is used as
    cross-compiler

 Config.in                                     |  23 +++
 linux/linux.mk                                |   4 +-
 package/Config.in.host                        |   1 +
 package/Makefile.in                           |  13 +-
 ...use-BB_GLOBAL_CONST-where-applicable.patch | 173 ++++++++++++++++++
 ...hains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch |  76 ++++++++
 package/clang/Config.in.host                  |  19 ++
 package/clang/clang.mk                        |  51 +++++-
 package/glibc/glibc.mk                        |   5 +
 package/llvm/llvm.mk                          |   3 +-
 package/meson/cross-compilation.conf.in       |   4 +-
 package/meson/meson.mk                        |   2 +
 package/pkg-meson.mk                          |   2 +
 toolchain/Config.in                           |   6 +
 toolchain/toolchain/toolchain.mk              |   7 +
 15 files changed, 381 insertions(+), 8 deletions(-)
 create mode 100644 package/busybox/0003-use-BB_GLOBAL_CONST-where-applicable.patch
 create mode 100644 package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
 create mode 100644 package/clang/Config.in.host

-- 
2.21.0
