From: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Date: Mon, 16 Mar 2015 18:00:08 +0800
Subject: [Buildroot] [PATCH 0/5] Add ILP32 support in aarch64
Message-ID: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ILP32 is very useful when the user want to migrate from arm 32bit to 64bit
with minimal risk. There is no code changes and almost no footprint changes
after migration. ILP32 could get the better performance compare with arm 32bit
(use 64bit register and instruction instead of 32bit one) and aarch64 LP64
(aarch64 default ABI).

Our test show that the performance of ILP32 is roughly 10% better than arm64
LP64 while the footprint is 86% of LP64. Because of these, It is useful for
both embedded and enterprise system.

Here is the details definition of ILP32:
ILP32 is elf32 with aarch64 assembly and is compiled by 64bit compiler.
Refer the following table:

  \-            |  arm 32bit  | arm64 ILP32 | arm64 LP64
----------------|-------------|-------------|-------------
instruction set |   armv7-a   |   armv8-a   |   armv8-a
int             |   32bit     |   32bit     |   32bit
long            |   32bit     | **32bit**   |   64bit
pointer         |   32bit     | **32bit**   |   64bit

LP64 is the default ABI on arm64(Implies -mabi=lp64 while compiling), and the
kernel remains in LP64 no matter ILP32 enables or not.

These series patches introduce the big endian support in aarch64 and then add
ILP32 special filename and menuconfig step by step.

The test of build is based on linaro kernel [1] and toolchain built by linaro
ABE environment[2].

This is my first time I try to contribute the buildroot, feedback is very
appreciated. Sorry if there are some coding style issues.

regards

bamvor

[1] https://git.linaro.org/kernel/linux-linaro-tracking.git
[2] https://wiki.linaro.org/ABE


Zhang Jian(Bamvor) (5):
  aarch64: add big endian(aarch64_be) support
  aarch64: ilp32: handle special file name
  aarch64: ilp32: add ilp32 compiler and linker flags
  aarch64: ilp32: add ilp32 menuconfig
  aarch64: ilp32 defconfig examples

 Makefile                                           |  9 +++++
 arch/Config.in                                     | 12 +++++--
 arch/Config.in.aarch64                             | 40 ++++++++++++++++++++-
 configs/aarch64_be_defconfig                       | 10 ++++++
 configs/aarch64_be_ilp32_defconfig                 | 12 +++++++
 configs/aarch64_ilp32_defconfig                    | 12 +++++++
 package/Makefile.in                                | 10 +++++-
 toolchain/helpers.mk                               |  4 +--
 toolchain/toolchain-external/toolchain-external.mk | 41 ++++++++++++++++++++--
 9 files changed, 142 insertions(+), 8 deletions(-)
 create mode 100644 configs/aarch64_be_defconfig
 create mode 100644 configs/aarch64_be_ilp32_defconfig
 create mode 100644 configs/aarch64_ilp32_defconfig

-- 
1.8.4.5
