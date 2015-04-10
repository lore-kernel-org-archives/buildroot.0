From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Date: Fri, 10 Apr 2015 17:16:53 +0800
Subject: [Buildroot] [RFC PATCH v2 0/5] Add ILP32 support in aarch64
In-Reply-To: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <55279505.6000803@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015/3/18 17:49, Zhang Jian(Bamvor) wrote:
Ping.
It seems that no response in recent four weeks.

bamvor
> This is second version of my patches. This previous version is here[1].
> The previous discussion, Gustavo agree that only external toolchain is in
> consideration at this time. I will try to work on the buildroot toolchain
> after current series patch is upstreamed.
> 
> ILP32 is very useful when the user want to migrate from arm 32bit to 64bit
> with minimal risk. There is no code changes and almost no footprint changes
> after migration. ILP32 could get the better performance compare with arm 32bit
> (use 64bit register and instruction instead of 32bit one) and aarch64 LP64
> (aarch64 default ABI).
> 
> Our test show that the performance of ILP32 is roughly 10% better than arm64
> LP64 while the footprint is 86% of LP64. Because of these, It is useful for
> both embedded and enterprise system.
> 
> Here is the details definition of ILP32:
> ILP32 is elf32 with aarch64 assembly and is compiled by 64bit compiler.
> Refer the following table:
> 
>   \-            |  arm 32bit  | arm64 ILP32 | arm64 LP64
> ----------------|-------------|-------------|-------------
> instruction set |   armv7-a   |   armv8-a   |   armv8-a
> int             |   32bit     |   32bit     |   32bit
> long            |   32bit     | **32bit**   |   64bit
> pointer         |   32bit     | **32bit**   |   64bit
> 
> LP64 is the default ABI on arm64(Implies -mabi=lp64 while compiling), and the
> kernel remains in LP64 no matter ILP32 enables or not.
> 
> These series patches introduce the big endian support in aarch64 and then add
> ILP32 special filename and menuconfig step by step.
> 
> The test of build is based on linaro kernel [2] and toolchain built by linaro
> ABE environment[3], anyone could built this toolchain through the simpile
> abe script.
> 
> This is my first time I try to contribute the buildroot, feedback is very
> appreciated. Sorry if there are some coding style issues.
> 
> changes since v1
> 1.  avoid mabi issue in gcc 4.8 while build aarch64 lp64.
> 2.  change default libc, toolchain for ilp32 build.
> 3.  others changes suggested by Gustavo.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-March/122115.html
> [2] https://git.linaro.org/kernel/linux-linaro-tracking.git
> [3] https://wiki.linaro.org/ABE
> 
> Zhang Jian(Bamvor) (5):
>   aarch64: add big endian(aarch64_be) support
>   aarch64: ilp32: handle special file name
>   aarch64: ilp32: add ilp32 compiler and linker flags
>   aarch64: ilp32: add ilp32 build config
>   aarch64: ilp32 defconfig examples
> 
>  Makefile                                           | 11 +++++-
>  arch/Config.in                                     | 12 +++++--
>  arch/Config.in.aarch64                             | 40 ++++++++++++++++++++-
>  configs/aarch64_be_defconfig                       |  2 ++
>  configs/aarch64_be_ilp32_defconfig                 |  8 +++++
>  configs/aarch64_ilp32_defconfig                    |  8 +++++
>  package/Makefile.in                                | 10 +++++-
>  package/gcc/Config.in.host                         |  3 +-
>  toolchain/Config.in                                |  2 ++
>  toolchain/helpers.mk                               |  4 +--
>  toolchain/toolchain-buildroot/Config.in            | 27 +++++++-------
>  toolchain/toolchain-external/Config.in             | 20 +++++++++++
>  toolchain/toolchain-external/toolchain-external.mk | 41 ++++++++++++++++++++--
>  13 files changed, 165 insertions(+), 23 deletions(-)
>  create mode 100644 configs/aarch64_be_defconfig
>  create mode 100644 configs/aarch64_be_ilp32_defconfig
>  create mode 100644 configs/aarch64_ilp32_defconfig
> 
