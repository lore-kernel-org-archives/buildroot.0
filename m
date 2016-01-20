From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 20 Jan 2016 22:26:22 +0100
Subject: [Buildroot] [PATCH V3 RESEND 0/5] Add ILP32 support in aarch64
In-Reply-To: <CAFy1UST4HUynS9ia2hRGWtE6j+XpYxaovAdVZkj+8yOG7PfSpg@mail.gmail.com>
References: <1439428605-17453-1-git-send-email-bamvor.zhangjian@linaro.org>
 <569A60E6.2030108@gmail.com>
 <CAFy1UST4HUynS9ia2hRGWtE6j+XpYxaovAdVZkj+8yOG7PfSpg@mail.gmail.com>
Message-ID: <569FFB7E.2000104@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bamvor,

Le 19/01/2016 05:00, Bamvor Zhang Jian a ?crit :
> Hi, Romain
> 
> On 01/16/2016 11:25 PM, Romain Naour wrote:
>> Hello Bamvor,
>>
>> Le 13/08/2015 03:16, Bamvor Jian Zhang a ?crit :
>>> This is third version of my patches. This previous versions are
>>> here[1][2]. The previous discussion, Gustavo agree that only external
>>> toolchain is in consideration at this time. I will try to work on the
>>> buildroot toolchain after current series patch is upstreamed.
>>>
>>> ILP32 is very useful when the user want to migrate from arm 32bit to
>>> 64bit with minimal risk. There is almost no code changes after
>>> migration. ILP32 could get the better performance compare with arm
>>> 32bit (use 64bit register and instruction instead of 32bit one) and
>>> aarch64 LP64 (the default ABI in aarch64).
>>>
>>> Our test show that the performance of ILP32 is roughly 10% better than
>>> arm64 LP64 while the footprint is 86% of LP64. Because of these, It is
>>> useful for both embedded and enterprise system.
>>>
>>> Here is the details definition of ILP32:
>>> ILP32 is elf32 with aarch64 assembly and is compiled by 64bit compiler.
>>> Refer the following table:
>>>
>>>   \-            |  arm 32bit  | arm64 ILP32 | arm64 LP64
>>> ----------------|-------------|-------------|-------------
>>> instruction set |   armv7-a   |   armv8-a   |   armv8-a
>>> int             |   32bit     |   32bit     |   32bit
>>> long            |   32bit     | **32bit**   |   64bit
>>> pointer         |   32bit     | **32bit**   |   64bit
>>>
>>> LP64 is the default ABI on arm64(Implies -mabi=lp64 while compiling),
>>> and the kernel remains in LP64 no matter ILP32 enables or not.
>>>
>>> These series patches introduce the big endian support in aarch64 and
>>> then add ILP32 special filename and menuconfig step by step.
>>>
>>> The test of build is based on linaro kernel[3] and toolchain built by
>>> linaro ABE environment[4], anyone could built this toolchain through
>>> the simpile abe script.
>>>
>>> This is my first time I try to contribute the buildroot, feedback is
>>> very appreciated. Sorry if there are some coding style issues.
>>
>> Thanks for this series and sorry for the long delay to reply...
>>
>> I tried to build a aarch64 ilp32 toolchain using the current abe master but it
>> seems that ilp32 support is not mainline yet.
>> I'm not sure we want to modify the Buildroot external toolchain code to use an
>> "experimental" toolchain (origin/will/ilp32 branch).
>>
>> Can you provide the command lines you used to build the toolchain ? on which abe
>> branch ? Otherwise we can't test your series.
> You could find the toolchain here[1]

Thanks but this is not a cross-toolchain:

file bin/aarch64-ilp32-linux-gnu-gcc
bin/aarch64-ilp32-linux-gnu-gcc: ELF 64-bit LSB executable, ARM aarch64, version
1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for
GNU/Linux 3.7.0, BuildID[sha1]=0727b9d5c173c83568f5d19cfc87a05540ec8b77, not
stripped

It seems that's a native toolchain.

It should be something like (from aarch64-linaro 2015.08)
file bin/aarch64-linux-gnu-gcc
bin/aarch64-linux-gnu-gcc: ELF 64-bit LSB executable, x86-64, version 1 (SYSV),
dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux
2.6.32, BuildID[sha1]=91a19539d0f6b0f38d599db648b4b5760000666a, not stripped

Can you provide a pre-build toolchain or a recipe to rebuild a aarch64 ipl32
toolchain ?

>>
>> Do you know if Linaro plans to release a ipl32 toolchain ?
> It seems that linaro will not release it before patches for ilp32 of kernel and
> glibc upstreamed.
> Here[2] is a status for ilp32 in linaro.

Thanks for the link.

Best regards,
Romain

> 
> Regards
> 
> Bamvor
> 
> [1] http://people.linaro.org/~maxim.kuvyrkov/bench-ilp32/
> [2] https://wiki.linaro.org/Platform/arm64-ilp32
> 
>> Best regards,
>> Romain Naour
>>
>>>
>>> changes since v2
>>> 1.  rebase on the patch have been .
>>>     "827ba46 aarch64: add big endian(aarch64_be) support"
>>> 2.  Add "!BR2_aarch64_be" along with "!BR2_aarch64" in patch 1/5 according to
>>>     the suggestion from Thomas.
>>> 3.  Improve the ifeq in patch 2/5 according to Gustavo.
>>> 4.  Do not pass invalid "-mabi" option to ld in patch 3/5 according to Gustavo.
>>>
>>> changes since v1
>>> 1.  Avoid mabi issue in gcc 4.8 while build aarch64 lp64.
>>> 2.  Change default libc, toolchain for ilp32 build.
>>> 3.  Others changes suggested by Gustavo.
>>>
>>> [1] http://lists.busybox.net/pipermail/buildroot/2015-March/122115.html
>>> [2] http://lists.busybox.net/pipermail/buildroot/2015-March/122424.html
>>> [3] https://git.linaro.org/kernel/linux-linaro-tracking.git
>>> [4] https://wiki.linaro.org/ABE
>>>
>>>
>>> Bamvor Jian Zhang (5):
>>>   aarch64: align aarch64_be config with aarch64s'
>>>   aarch64: ilp32: handle special file name
>>>   aarch64: ilp32: add ilp32 compiler and linker flags
>>>   aarch64: ilp32: add ilp32 build config
>>>   aarch64: ilp32 defconfig examples
>>>
>>>  Makefile                                           |  6 +++
>>>  arch/Config.in.aarch64                             | 36 ++++++++++++++++++
>>>  configs/aarch64_be_defconfig                       |  2 +
>>>  configs/aarch64_be_ilp32_defconfig                 |  8 ++++
>>>  configs/aarch64_ilp32_defconfig                    |  8 ++++
>>>  package/Makefile.in                                | 13 ++++++-
>>>  package/binutils/Config.in                         |  4 +-
>>>  package/binutils/Config.in.host                    |  5 ++-
>>>  package/dropwatch/Config.in                        |  5 ++-
>>>  package/gcc/Config.in.host                         | 11 +++---
>>>  package/gdb/Config.in.host                         |  2 +-
>>>  package/gpsd/Config.in                             |  2 +-
>>>  package/lightning/Config.in                        |  5 ++-
>>>  package/nginx/Config.in                            |  3 +-
>>>  package/oprofile/Config.in                         |  6 ++-
>>>  toolchain/Config.in                                |  2 +
>>>  toolchain/helpers.mk                               |  5 ++-
>>>  toolchain/toolchain-buildroot/Config.in            |  7 ++--
>>>  toolchain/toolchain-external/Config.in             | 22 +++++++++++
>>>  toolchain/toolchain-external/toolchain-external.mk | 44 +++++++++++++++++++++-
>>>  20 files changed, 169 insertions(+), 27 deletions(-)
>>>  create mode 100644 configs/aarch64_be_defconfig
>>>  create mode 100644 configs/aarch64_be_ilp32_defconfig
>>>  create mode 100644 configs/aarch64_ilp32_defconfig
>>>
>>
> 
