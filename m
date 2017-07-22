From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 23:02:38 +0200
Subject: [Buildroot] Is MIPS_NABI32 a 64-bit architecture? [was: [PATCH
 04/20] package/skeleton: make SKELETON_LIB_SYMLINK a macro]
In-Reply-To: <20170722214710.305f8b28@windsurf>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
 <536fe404-3900-c733-b3d7-874b59980b66@mind.be>
 <20170722214710.305f8b28@windsurf>
Message-ID: <abe1911c-93bc-ad3c-1930-291080785b98@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-07-17 21:47, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 22 Jul 2017 14:56:19 +0200, Arnout Vandecappelle wrote:
> 
>>> +# Make a symlink lib32->lib or lib64->lib as appropriate.
>>> +# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
>>> +# $(1): base dir (either staging or target)
>>> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)  
>>
>>  This makes me wonder: are we doing the right thing with NABI32? What is the
>> semantics of BR2_ARCH_IS_64? I would say, it doesn't specify that you have a
>> 32-bit or 64-bit capable CPU; instead, it says that you have a 32-bit or 64-bit
>> userspace. I.e., that void* and long are 32 resp. 64 bits. Indeed, I don't think
>> it's really relevant for Buildroot to know about the CPU capabilities, the
>> important thing is the userpace ABI, i.e. how we compile packages.
>>
>>  So, with that in mind, I think we should NOT select BR2_ARCH_IS_64 for the n32
>> ABI. Similarly, when we add x32, it should also not be BR2_ARCH_IS_64.
> 
> I see your reasoning, but I believe it might be confusing to have
> BR2_ARCH_IS_64 be false on a 64 bit architecture. However, we could
> introduce something like BR2_UABI_IS_64, to define whether the
> userspace ABI is 32 or 64 bits.
> 
> But doing that involves reviewing all the places where BR2_ARCH_IS_64
> is used, and check if we're using it to say "the architecture is 64
> bits" or "the userspace ABI is 32 bits".

 Well, first of all, there is currently only one arch in this situation, and
that's MIPS64/n32. We don't support x32 or ilp32 yet, and I don't think there's
something similar for PPC.

 Outside of arch/, BR2_ARCH_IS_64 is used in 15 places. 2 of them are
x86_64-specific (grub2, syslinux). 3 already treat MIPS_N32 specially. 6 look
like they should also treat MIPS_N32 specially, but since that ABI doesn't get
tested in the autobuilders (right?) we haven't noticed.

 There is one case that is interesting: BR2_TOOLCHAIN_HAS_SYNC_8 defaults y if
BR2_ARCH_IS_64. I guess that that is indeed true for n32, x32 and ilp32. If so,
it indeed makes sense to split off BR2_ARCH_IS_64 and BR2_UABI_IS_64. But I
think that that will be the only place where BR2_ARCH_IS_64 will be used.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
