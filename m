From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Date: Tue, 21 Jul 2015 17:14:27 +0800
Subject: [Buildroot] [PATCH V3 0/5] Add ILP32 support in aarch64
Message-ID: <1437470072-23782-1-git-send-email-bamvor.zhangjian@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>

This is third version of my patches. This previous version is
here[1][2]. The previous discussion, Gustavo agree that only external
toolchain is in consideration at this time. I will try to work on the
buildroot toolchain after current series patch is upstreamed.

ILP32 is very useful when the user want to migrate from arm 32bit to
64bit with minimal risk. There is almost no code changes after
migration. ILP32 could get the better performance compare with arm
32bit (use 64bit register and instruction instead of 32bit one) and
aarch64 LP64 (aarch64 default ABI).

Our test show that the performance of ILP32 is roughly 10% better than
arm64 LP64 while the footprint is 86% of LP64. Because of these, It is
useful for both embedded and enterprise system.

Here is the details definition of ILP32:
ILP32 is elf32 with aarch64 assembly and is compiled by 64bit compiler.
Refer the following table:

  \-            |  arm 32bit  | arm64 ILP32 | arm64 LP64
----------------|-------------|-------------|-------------
instruction set |   armv7-a   |   armv8-a   |   armv8-a
int             |   32bit     |   32bit     |   32bit
long            |   32bit     | **32bit**   |   64bit
pointer         |   32bit     | **32bit**   |   64bit

LP64 is the default ABI on arm64(Implies -mabi=lp64 while compiling),
and the kernel remains in LP64 no matter ILP32 enables or not.

These series patches introduce the big endian support in aarch64 and
then add ILP32 special filename and menuconfig step by step.

The test of build is based on linaro kernel[3] and toolchain built by
linaro ABE environment[4], anyone could built this toolchain through
the simpile abe script.

This is my first time I try to contribute the buildroot, feedback is
very appreciated. Sorry if there are some coding style issues.

changes since v2
1.  rebase on the patch have been .
    "827ba46 aarch64: add big endian(aarch64_be) support"
2.  Add "!BR2_aarch64_be" along with "!BR2_aarch64" in patch 1/5 according to
    the suggestion from Thomas.
3.  Improve the ifeq in patch 2/5 according to Gustavo.
4.  Do not pass invalid "-mabi" option to ld in patch 3/5 according to Gustavo.

changes since v1
1.  Avoid mabi issue in gcc 4.8 while build aarch64 lp64.
2.  Change default libc, toolchain for ilp32 build.
3.  Others changes suggested by Gustavo.

[1] http://lists.busybox.net/pipermail/buildroot/2015-March/122115.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-March/122424.html
[3] https://git.linaro.org/kernel/linux-linaro-tracking.git
[4] https://wiki.linaro.org/ABE


Bamvor Jian Zhang (5):
  aarch64: align aarch64_be config with aarch64s'
  aarch64: ilp32: handle special file name
  aarch64: ilp32: add ilp32 compiler and linker flags
  aarch64: ilp32: add ilp32 build config
  aarch64: ilp32 defconfig examples

 Makefile                                           |  6 +++
 arch/Config.in.aarch64                             | 36 ++++++++++++++++++
 configs/aarch64_be_defconfig                       |  2 +
 configs/aarch64_be_ilp32_defconfig                 |  8 ++++
 configs/aarch64_ilp32_defconfig                    |  8 ++++
 package/Makefile.in                                | 13 ++++++-
 package/binutils/Config.in                         |  4 +-
 package/binutils/Config.in.host                    |  5 ++-
 package/dropwatch/Config.in                        |  5 ++-
 package/gcc/Config.in.host                         | 11 +++---
 package/gdb/Config.in.host                         |  2 +-
 package/gpsd/Config.in                             |  2 +-
 package/lightning/Config.in                        |  5 ++-
 package/nginx/Config.in                            |  3 +-
 package/oprofile/Config.in                         |  6 ++-
 toolchain/Config.in                                |  2 +
 toolchain/helpers.mk                               |  5 ++-
 toolchain/toolchain-buildroot/Config.in            |  7 ++--
 toolchain/toolchain-external/Config.in             | 22 +++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 44 +++++++++++++++++++++-
 20 files changed, 169 insertions(+), 27 deletions(-)
 create mode 100644 configs/aarch64_be_defconfig
 create mode 100644 configs/aarch64_be_ilp32_defconfig
 create mode 100644 configs/aarch64_ilp32_defconfig

-- 
2.1.4
