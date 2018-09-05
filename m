From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 5 Sep 2018 11:09:30 +0100
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <84101d8e-388f-0fd4-20b6-8e1e1765de62@mind.be>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <804d638c-2b7c-1a12-894f-fa79094d2456@mind.be>
 <cba3cfaf-bd46-f41d-0392-40f6ffc5f6d8@embecosm.com>
 <84101d8e-388f-0fd4-20b6-8e1e1765de62@mind.be>
Message-ID: <25bfcad8-e853-a85c-fd2c-2cf7e3145df1@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout

On 04/09/18 22:03, Arnout Vandecappelle wrote:
>
> On 04/09/2018 15:10, Mark Corbin wrote:
>> Hello Arnout
>>
>> On 04/09/18 00:00, Arnout Vandecappelle wrote:
>>> On 31/08/2018 11:11, Mark Corbin wrote:
>>>> This enables a riscv64 system to be built with a Buildroot generated
>>>> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
>>>>
>>>> This configuration has been used to successfully build a qemu-bootable
>>>> riscv-linux-4.15 kernel (https://github.com/riscv/riscv-linux.git).
>>>>
>>>> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
>>>> ---
>>>>  Makefile                                |   1 +
>>>>  arch/Config.in                          |  15 ++++
>>>>  arch/Config.in.riscv                    | 104 ++++++++++++++++++++++++
>>>>  arch/arch.mk.riscv                      |  24 ++++++
>>>>  package/binutils/Config.in.host         |   3 +
>>>>  toolchain/toolchain-buildroot/Config.in |  12 ++-
>>>  One more thing that is missing: in package/linux-headers/Config.in.host, you
>>> have to exclude all the linux versions that don't support riscv yet (i.e.
>>> everything before 4.15).
>> Is it worth doing this when you actually have to select a custom version of
>> headers anyway?
>  In that case, you have to disable *all* choices except for _AS_KERNEL and _VERSION.
>
>  I didn't realise that upstream riscv support was broken. I saw that Linus added
> riscv in v4.15 so I assumed that it could be used.
>
>  So I pulled a diff, the differences between upstream and riscv in uapi are
> really minor. And there are no longer any differences between v4.18.5 and the
> riscv-linux-4.18 branch. So I would tend to say that the upstream v4.15 should
> work as well. Of course, I haven't tried...

I couldn't get the upstream 4.15 and 4.17 kernels to boot under qemu, so
I asked about the status of kernel support on the riscv sw-dev mailing
list. Apparently the existing upstream kernels do not support qemu
(which is the first target that I am adding). The developers are
expecting the necessary changes to make it into the 4.19 kernel release.

In this case I think it makes sense for me to disable all choices except
_AS_KERNEL, _CUSTOM_TARBALL and CUSTOM_GIT.

>
>> This makes more sense to me when the necessary riscv support
>> makes it upstream. I think that it would be a bit messy at the moment as I
>> should add a restriction to stop you choosing *any* mainline kernel version...
>>
>> config BR2_KERNEL_HEADERS_4_1
>> ??????? bool "Linux 4.1.x kernel headers"
>> ??????? select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
>> ??????? depends !BR2_riscv
>> .
>> .
>> etc.
>>
>> ...and also restrict your choice of versions for custom headers pre-4.15...
>>
>> config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14
>> ??????? bool "4.14.x"
>> ??????? select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>> ??????? depends on !BR2_riscv
>  If you look at the existing code, you'll see that we do add the exclusions for
> the upstream headers choice, but not for the custom headers. That's because the
> custom headers is supposed to be used for a vendor fork which *does* support
> that arch already. Case in point: you'd exclude the upstream 4.15 choice, but
> you'd still want to be able to build with the riscv-linux-4.15 tree.

So should I allow any version of custom headers to be selected even
though only 4.15 is relevant for riscv?

Regards

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
