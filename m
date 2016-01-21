From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Date: Thu, 21 Jan 2016 17:03:19 +0800
Subject: [Buildroot] [PATCH V3 RESEND 0/5] Add ILP32 support in aarch64
In-Reply-To: <569FFB7E.2000104@gmail.com>
References: <1439428605-17453-1-git-send-email-bamvor.zhangjian@linaro.org>
 <569A60E6.2030108@gmail.com>
 <CAFy1UST4HUynS9ia2hRGWtE6j+XpYxaovAdVZkj+8yOG7PfSpg@mail.gmail.com>
 <569FFB7E.2000104@gmail.com>
Message-ID: <CAFy1USRK1QDrruMk+icMqELL3MtFZv8KTkDvOHZ9wrAEWNvCJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Romain

On 01/21/2016 05:26 AM, Romain Naour wrote:
> Hi Bamvor,
>
> Le 19/01/2016 05:00, Bamvor Zhang Jian a ?crit :
>> Hi, Romain
>>
>> On 01/16/2016 11:25 PM, Romain Naour wrote:
>>> Hello Bamvor,
[...]
>>> Can you provide the command lines you used to build the toolchain ? on which abe
>>> branch ? Otherwise we can't test your series.
>> You could find the toolchain here[1]
>
> Thanks but this is not a cross-toolchain:
>
> file bin/aarch64-ilp32-linux-gnu-gcc
> bin/aarch64-ilp32-linux-gnu-gcc: ELF 64-bit LSB executable, ARM aarch64, version
> 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for
> GNU/Linux 3.7.0, BuildID[sha1]=0727b9d5c173c83568f5d19cfc87a05540ec8b77, not
> stripped
>
> It seems that's a native toolchain.
>
> It should be something like (from aarch64-linaro 2015.08)
> file bin/aarch64-linux-gnu-gcc
> bin/aarch64-linux-gnu-gcc: ELF 64-bit LSB executable, x86-64, version 1 (SYSV),
> dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux
> 2.6.32, BuildID[sha1]=91a19539d0f6b0f38d599db648b4b5760000666a, not stripped
>
Yeap, it is not a cross compile. I use it in an aarch64 chroot environment in
x86. I feel it is enough to test these patches.
> Can you provide a pre-build toolchain or a recipe to rebuild a aarch64 ipl32
> toolchain ?
Linaro provide abe[1] to build toochain. You could follow this script[2] to know
how to use it. It seems that the server in tcwg is down. Hope, you could make
use of the method used by abe system.

Regards

Bamvor

[1] https://git.linaro.org/toolchain/abe.git/blob/refs/heads/benchmarking:/abe.sh
[2] https://git.linaro.org/toolchain/spec2xxx-utils.git/blob/refs/heads/test:/bench-ilp32.sh

>>>
>>> Do you know if Linaro plans to release a ipl32 toolchain ?
>> It seems that linaro will not release it before patches for ilp32 of kernel and
>> glibc upstreamed.
>> Here[2] is a status for ilp32 in linaro.
>
> Thanks for the link.
>
> Best regards,
> Romain
>
>>
>> Regards
>>
>> Bamvor
>>
>> [1] http://people.linaro.org/~maxim.kuvyrkov/bench-ilp32/
>> [2] https://wiki.linaro.org/Platform/arm64-ilp32
>>
>>> Best regards,
>>> Romain Naour
>>>
>>>>
>>>> changes since v2
>>>> 1.  rebase on the patch have been .
>>>>     "827ba46 aarch64: add big endian(aarch64_be) support"
>>>> 2.  Add "!BR2_aarch64_be" along with "!BR2_aarch64" in patch 1/5 according to
>>>>     the suggestion from Thomas.
>>>> 3.  Improve the ifeq in patch 2/5 according to Gustavo.
>>>> 4.  Do not pass invalid "-mabi" option to ld in patch 3/5 according to Gustavo.
>>>>
>>>> changes since v1
>>>> 1.  Avoid mabi issue in gcc 4.8 while build aarch64 lp64.
>>>> 2.  Change default libc, toolchain for ilp32 build.
>>>> 3.  Others changes suggested by Gustavo.
>>>>
>>>> [1] http://lists.busybox.net/pipermail/buildroot/2015-March/122115.html
>>>> [2] http://lists.busybox.net/pipermail/buildroot/2015-March/122424.html
>>>> [3] https://git.linaro.org/kernel/linux-linaro-tracking.git
>>>> [4] https://wiki.linaro.org/ABE
>>>>
>>>>
>>>> Bamvor Jian Zhang (5):
>>>>   aarch64: align aarch64_be config with aarch64s'
>>>>   aarch64: ilp32: handle special file name
>>>>   aarch64: ilp32: add ilp32 compiler and linker flags
>>>>   aarch64: ilp32: add ilp32 build config
>>>>   aarch64: ilp32 defconfig examples
>>>>
>>>>  Makefile                                           |  6 +++
>>>>  arch/Config.in.aarch64                             | 36 ++++++++++++++++++
>>>>  configs/aarch64_be_defconfig                       |  2 +
>>>>  configs/aarch64_be_ilp32_defconfig                 |  8 ++++
>>>>  configs/aarch64_ilp32_defconfig                    |  8 ++++
>>>>  package/Makefile.in                                | 13 ++++++-
>>>>  package/binutils/Config.in                         |  4 +-
>>>>  package/binutils/Config.in.host                    |  5 ++-
>>>>  package/dropwatch/Config.in                        |  5 ++-
>>>>  package/gcc/Config.in.host                         | 11 +++---
>>>>  package/gdb/Config.in.host                         |  2 +-
>>>>  package/gpsd/Config.in                             |  2 +-
>>>>  package/lightning/Config.in                        |  5 ++-
>>>>  package/nginx/Config.in                            |  3 +-
>>>>  package/oprofile/Config.in                         |  6 ++-
>>>>  toolchain/Config.in                                |  2 +
>>>>  toolchain/helpers.mk                               |  5 ++-
>>>>  toolchain/toolchain-buildroot/Config.in            |  7 ++--
>>>>  toolchain/toolchain-external/Config.in             | 22 +++++++++++
>>>>  toolchain/toolchain-external/toolchain-external.mk | 44 +++++++++++++++++++++-
>>>>  20 files changed, 169 insertions(+), 27 deletions(-)
>>>>  create mode 100644 configs/aarch64_be_defconfig
>>>>  create mode 100644 configs/aarch64_be_ilp32_defconfig
>>>>  create mode 100644 configs/aarch64_ilp32_defconfig
>>>>
>>>
>>

-- 
-----------------------------
   blog: http://aarch64.me
-----------------------------
