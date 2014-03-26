From: Joshua Kinard <kumba@gentoo.org>
Date: Tue, 25 Mar 2014 20:14:00 -0400
Subject: [Buildroot] [PATCH v2] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <5331E0D4.6070007@mind.be>
References: <1395769952-64221-1-git-send-email-Vincent.Riera@imgtec.com>
 <5331E0D4.6070007@mind.be>
Message-ID: <53321BC8.7020802@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/25/2014 16:02, Arnout Vandecappelle wrote:
> On 25/03/14 18:52, Vicente Olivert Riera wrote:
>> Building o32 ELF files for MIPS64 is an exotic configuration that nobody
>> should be using. If o32 is required, then is better if it's built for
>> MIPS 32-bit cores so only 32-bit instructions will be used leading to a
>> more efficient o32 usage.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  arch/Config.in.mips |   12 +++++++-----
>>  1 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>> index d9c0c02..f558705 100644
>> --- a/arch/Config.in.mips
>> +++ b/arch/Config.in.mips
>> @@ -38,15 +38,12 @@ endchoice
>>  
>>  choice
>>  	prompt "Target ABI"
>> -	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>> -	default BR2_MIPS_OABI32 if !BR2_ARCH_IS_64
>> -	default BR2_MIPS_NABI32 if BR2_ARCH_IS_64
>> +	depends on BR2_mips64 || BR2_mips64el
>> +	default BR2_MIPS_NABI32
>>  
>>  	help
>>  	  Application Binary Interface to use
>>  
>> -config BR2_MIPS_OABI32
>> -	bool "o32"
>>  config BR2_MIPS_NABI32
>>  	bool "n32"
>>  	depends on BR2_ARCH_IS_64
>> @@ -86,6 +83,11 @@ config BR2_GCC_TARGET_ARCH
>>  	default "mips64"	if BR2_mips_64
>>  	default "mips64r2"	if BR2_mips_64r2
>>  
>> +config BR2_MIPS_OABI32
>> +	bool
>> +	default y		if BR2_mips || BR2_mipsel
>> +	default n		if BR2_mips64 || BR2_mips64el
> 
>  The default n isn't needed - that is the default already in all other cases.
> 
>> +
>>  config BR2_GCC_TARGET_ABI
>>  	default "32"		if BR2_MIPS_OABI32
>>  	default "n32"		if BR2_MIPS_NABI32
>>
> 
>  Normally we should have a Config.in.legacy entry to catch old .configs
> that have o32 for a mips64 target. However, that is not possible now.
> Therefore, it should be captured in the release notes. To make sure that
> Peter doesn't forget, can you add this to the top of CHANGES?
> 
> 
> 2014.05, Not yet released:
> 
> Support for MIPS o32 ABI on MIPS-64 targets has been removed. Building
> o32 ELF files for MIPS64 is an exotic configuration that nobody should be
> using. If o32 is required, then is better if it's built for MIPS 32-bit
> cores so only 32-bit instructions will be used leading to a more
> efficient o32 usage.

Just to point out, I wouldn't call this "exotic" -- o32 on mips64 kernels
(MIPS-IV ISA) is what I run on my SGI O2 under Gentoo.  That said, I do have
a somewhat-working n32 chroot on the same box.  Additionally, isn't o32 the
ABI that Debian still builds for most of their mips/mipsel targets?

I guess for newer MIPS hardware, this is definitely sensible, but given the
wide availability of old SGI hardware on eBay, it's far from exotic.  I also
believe Debian still supports DEC systems, which are even older.

I still plan on looking at fixing the MIPS-II to MIPS-IV issue I raised a
few weeks ago, but I've been tied up in other projects.  So if there is some
legacy way to retain this capability, maybe by defining an SGI-specific
target at some point, that'd be great.  It'll at least give me a starting
port to isolate the legacy stuff so that it only applies to this old
hardware and doesn't impede anyone working with newer hardware.

Food for thought :)

-- 
Joshua Kinard
Gentoo/MIPS
kumba at gentoo.org
4096R/D25D95E3 2011-03-28

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
