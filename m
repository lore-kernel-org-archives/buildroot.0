From: Matt Flax <flatmax@flatmax.org>
Date: Wed, 24 Aug 2016 09:44:22 +1000
Subject: [Buildroot] [PATCH 1/3] arch/arm: Add Cortex-a53 CPU
In-Reply-To: <20160824000345.264d6d2a@free-electrons.com>
References: <1471913603-21487-1-git-send-email-flatmax@flatmax.org>
 <1471913603-21487-2-git-send-email-flatmax@flatmax.org>
 <20160824000345.264d6d2a@free-electrons.com>
Message-ID: <dc3618df-52c5-c209-30a4-ea351fb2c49c@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 24/08/16 08:03, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 23 Aug 2016 10:53:21 +1000, Matt Flax wrote:
>> Adds the Cortex-a53 CPU to the target architecture variant choice. This sets
>> the toolchain to use cortex-a53 as the target. The effect is that various
>> cortex-a53 tunings are enabled for the compilation of packages.
>>
>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
> Thanks, but as I said, I don't want to duplicate definitions of 64 bits
> ARM cores between Config.in.arm and Config.in.aarch64. So I've pushed
> at
> http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=aarch64
> a branch that does the necessary rework: it merges Config.in.aarch64
> into Config.in.arm, does a few preparation steps, and finally adds your
> commit on top of that. Could you have a look and let me know what you
> think?
Looks good. One thing though, my original Cortex-A53 patch selected 
VFPV4 which is now incorrect,
that should be removed ... however that wouldn't enable any HF settings ...
Also I don't understand why we need "select BR2_ARCH_HAS_MMU_OPTIONAL" 
but as I mentioned,
uclibc doesn't compile cleanly without it ... seems like a deep rooted 
problem.


> I haven't yet looked in detail at your PATCH 3/3 about the FPU support
> for ARMv8. It's still a bit unclear to me what level of FPU support is
> mandatory/optional in ARMv8, and whether we can just use
> crypto-neon-fp-armv8 all the time, or whether we should allow using
> fp-armv8, neon-fp-armv8 and crypto-neon-fp-armv8. Do you have some more
> detailed information about which feature is mandatory/optional in the
> various ARM64 cores?

I am not sure about the fine detail, but it seems that ARMV8 extends 
VFPV4, perhaps there should be an extension of VFPV4 which is similar to 
the extension of VFPV3 to VFPV4 ?
The "- mcpu" flag is the same between aarch32 and aarch64, so that 
simplifies the BR2_GCC_TARGET_CPU to being the same for both.
However aarch64 and aarch32 seem to require different BR2_GCC_TARGET_FPU 
lines. I am pretty certain that we need the aarch32 BR2_GCC_TARGET_FPU 
line to include at least "neon" in some way.
I have inspected the gcc definitions of the FPU setups (below) ... 
fp-armv8 doesn't include neon and neon-fp-armv8 doesn't include the 
crypto extensions. I guess the base state should be neon-fp-armv8 ... 
would be good to have options to include the crypto features to speed up 
crc32, AES, sha1 and sha2
 From gcc :
#define ARM_FPU(NAME, MODEL, REV, VFP_REGS, NEON, FP16, CRYPTO)
ARM_FPU("fp-armv8",    ARM_FP_MODEL_VFP, 8, VFP_REG_D32, false, true, false)
ARM_FPU("neon-fp-armv8",ARM_FP_MODEL_VFP, 8, VFP_REG_D32, true, true, false)
ARM_FPU("crypto-neon-fp-armv8", ARM_FP_MODEL_VFP, 8, VFP_REG_D32, true, 
true, true)


> Also, it is worth reminding that there are some ARMv8-A cores that are
> 32-bits only: the Cortex-A32 is one example. So ARMv8-A is not equal to
> 64 bits support.
Actually I think all ARMv8-A cores are 64bit, but can be run in aarch32 
mode for backwards compatability. " In ARMv8-A there are some additions 
to A32 and T32 to maintain alignment with the A64 instruction set." from 
here :
http://www.arm.com/products/processors/armv8-architecture.php

 From our perspective the differences we need to handle between aarch32 
and aarch64 is more significant ... but turn out to be simple ...

The aarch32 requires a "-fpu" setting to specify "neon-fp-armv8" as my 
suggested default.
The aarch64 requires a "-mcpu"  setting to specify the cpu with feature 
suffixes ... I note however that fp and simd are on by default when we 
select the cpu option. Is it necessary to enable these to be turned off 
? If not necessary and we don't desire crypto, then we don't need to 
specify more for the cpu other then the cpu name, i.e. cortex-a53

In other words, with defaults enabled for aarch64 specifying 
BR2_GCC_TARGET_CPU is sufficient to enable some default hardware 
speedups. For aarch32 we need both BR2_GCC_TARGET_CPU and 
BR2_GCC_TARGET_FPU specified.

Perhaps we can start like this as it is very simple and allow crypto to 
be added later for both aarch32 and aarch64 ?

thanks
Matt

> Thanks,
>
> Thomas
