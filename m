From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 26 Mar 2014 14:19:47 +0000
Subject: [Buildroot] [PATCH v2] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <53321BC8.7020802@gentoo.org>
References: <1395769952-64221-1-git-send-email-Vincent.Riera@imgtec.com>
 <5331E0D4.6070007@mind.be> <53321BC8.7020802@gentoo.org>
Message-ID: <5332E203.9040904@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/26/2014 12:14 AM, Joshua Kinard wrote:
> On 03/25/2014 16:02, Arnout Vandecappelle wrote:
>> On 25/03/14 18:52, Vicente Olivert Riera wrote:
>>> Building o32 ELF files for MIPS64 is an exotic configuration that nobody
>>> should be using. If o32 is required, then is better if it's built for
>>> MIPS 32-bit cores so only 32-bit instructions will be used leading to a
>>> more efficient o32 usage.
>>>
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>   arch/Config.in.mips |   12 +++++++-----
>>>   1 files changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>>> index d9c0c02..f558705 100644
>>> --- a/arch/Config.in.mips
>>> +++ b/arch/Config.in.mips
>>> @@ -38,15 +38,12 @@ endchoice
>>>
>>>   choice
>>>   	prompt "Target ABI"
>>> -	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>>> -	default BR2_MIPS_OABI32 if !BR2_ARCH_IS_64
>>> -	default BR2_MIPS_NABI32 if BR2_ARCH_IS_64
>>> +	depends on BR2_mips64 || BR2_mips64el
>>> +	default BR2_MIPS_NABI32
>>>
>>>   	help
>>>   	  Application Binary Interface to use
>>>
>>> -config BR2_MIPS_OABI32
>>> -	bool "o32"
>>>   config BR2_MIPS_NABI32
>>>   	bool "n32"
>>>   	depends on BR2_ARCH_IS_64
>>> @@ -86,6 +83,11 @@ config BR2_GCC_TARGET_ARCH
>>>   	default "mips64"	if BR2_mips_64
>>>   	default "mips64r2"	if BR2_mips_64r2
>>>
>>> +config BR2_MIPS_OABI32
>>> +	bool
>>> +	default y		if BR2_mips || BR2_mipsel
>>> +	default n		if BR2_mips64 || BR2_mips64el
>>
>>   The default n isn't needed - that is the default already in all other cases.
>>
>>> +
>>>   config BR2_GCC_TARGET_ABI
>>>   	default "32"		if BR2_MIPS_OABI32
>>>   	default "n32"		if BR2_MIPS_NABI32
>>>
>>
>>   Normally we should have a Config.in.legacy entry to catch old .configs
>> that have o32 for a mips64 target. However, that is not possible now.
>> Therefore, it should be captured in the release notes. To make sure that
>> Peter doesn't forget, can you add this to the top of CHANGES?
>>
>>
>> 2014.05, Not yet released:
>>
>> Support for MIPS o32 ABI on MIPS-64 targets has been removed. Building
>> o32 ELF files for MIPS64 is an exotic configuration that nobody should be
>> using. If o32 is required, then is better if it's built for MIPS 32-bit
>> cores so only 32-bit instructions will be used leading to a more
>> efficient o32 usage.
>
> Just to point out, I wouldn't call this "exotic" -- o32 on mips64 kernels
> (MIPS-IV ISA) is what I run on my SGI O2 under Gentoo.  That said, I do have
> a somewhat-working n32 chroot on the same box.  Additionally, isn't o32 the
> ABI that Debian still builds for most of their mips/mipsel targets?

We are talking about using 64-bit instructions in *userland* while 
maintaining the o32 ABI semantics. Well, this is definitely an exotic 
configuration. We are not talking about 64-bit kernels + o32 userland.
An o32 userland usually comes from mips32 and you usually have only 
32-bit instructions there.

-- 
markos
