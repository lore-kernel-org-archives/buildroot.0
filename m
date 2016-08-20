From: Matt Flax <flatmax@flatmax.org>
Date: Sat, 20 Aug 2016 14:01:16 +1000
Subject: [Buildroot] [PATCH 1/1] arch/arm: Add Cortex-a53 CPU
In-Reply-To: <5F8C494A-03CF-46AC-B85D-107643848CD1@gmail.com>
References: <1471565224-15625-1-git-send-email-flatmax@flatmax.org>
 <20160819100320.1d2609bd@free-electrons.com>
 <192101AE-C8DB-444C-8A52-68EA27264045@gmail.com>
 <20160819194931.072912e5@free-electrons.com>
 <5F8C494A-03CF-46AC-B85D-107643848CD1@gmail.com>
Message-ID: <a24a1482-ffde-4472-3488-bf34915be03d@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 20/08/16 03:54, Khem Raj wrote:
>> On Aug 19, 2016, at 10:49 AM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Hello,
>>
>> On Fri, 19 Aug 2016 10:47:05 -0700, Khem Raj wrote:
>>
>>>> On Fri, 19 Aug 2016 10:07:04 +1000, Matt Flax wrote:
>>>>> Adds the Cortex-a53 CPU to the target architecture variant choice. This sets
>>>>> the toolchain to use cortex-a53 as the target. The effect is that various
>>>>> cortex-a53 tunings are enabled for the compilation of packages.
>>>>>
>>>>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
>>>> The A53 is an ARM64 CPU, so it should rather be added to
>>>> Config.in.aarch64 (in which we don't yet have a CPU selection, but that
>>>> can be added).
>>>>
>>>> Or are you building a 32 bits ARM system for a Cortex-A53 ? In that
>>>> case, adding it to Config.in.arm would be OK, but it's a bit annoying
>>>> that we would have to duplicate many ARM CPUs between Config.in.arm and
>>>> Config.in.aarch64.
>>> 64bit kernel with 32bit userspace is most common usecase as of now for
>>> a53 that I see. so you need some sort of multilib.
>> I think on RPi3 they use a 32 bit kernel and 32 bit userspace, which
>> probably is what Matt was targeting. But I'd like to hear from Matt's
>> use case first.
> rpi3 is 32bit all the way, so this patch is fine for that case.

My use case is 32 bit kernel with a 32 bit buildroot.

I have been working with the s5p6818 Nexcell silicon and they have A53 
cores. These cores are more powerful then ARMv7 cortex cores ... because 
they have a more advanced neon hardware floating point processor. Even 
with a 32 bit kernel and os, gcc can optimise the code using the 
"cortex-a53" tuning.
I think (at this point in time) the neon unit can handle 64bit (double) 
computations, even when the kernel is 32 bit. This can only be enabled 
in gcc using the "cortex-a53" tuning. From a hardware standpoint, if it 
is in silicon, then it will work - no matter what the software is doing 
... I guess it just depends on the 32 bit gcc implementation of being 
able to load and unload the various 64 bit types efficiently. Not sure 
where to look for more information, however Aarch32 is mentioned in the 
a53 gcc config : 
https://github.com/gcc-mirror/gcc/blob/master/gcc/config/arm/cortex-a53.md
They also mention special register load instructions for aarch32.


 From my experience, the Nexcell s5p6818 ARMv8 A53 cores roughly double 
their speed in heavy floating point execution over Exynos 4412 ARMv7 
Cortex-A9 cores. It is possible that this is because their NEON hardware 
processors have double the vector size ?

Matt

>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160820/cc17038c/attachment.html>
