From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Oct 2014 22:03:39 +0200
Subject: [Buildroot] [PATCH 03/31] arch/arm: add blind options to know
 the ARM architecture
In-Reply-To: <20141019215528.GD12247@free.fr>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141019215528.GD12247@free.fr>
Message-ID: <54456A9B.4020704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/14 23:55, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-10-19 22:07 +0200, Thomas Petazzoni spake thusly:
>> In preparation to the removal of BR2_GCC_TARGET_ARCH for ARM, this
>> commit introduces a number of blind options for each ARM architecture,
>> so that packages/toolchains that had dependencies using
>> BR2_GCC_TARGET_ARCH can continue to express their dependencies. It can
>> also be used to simplify package dependencies that were using the
>> individual ARM core options.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  arch/Config.in.arm | 39 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
>> index 201ff1d..d2ba924 100644
>> --- a/arch/Config.in.arm
>> +++ b/arch/Config.in.arm
>> @@ -37,6 +37,27 @@ config BR2_ARM_CPU_HAS_THUMB
>>  config BR2_ARM_CPU_HAS_THUMB2
>>  	bool
> 
> Indirectly related to your patch: HAS_THUMB2 should select HAS_THUMB,
> since Thumb-2 is a superset of Thumb.
> 
> Then, you could just have (for example) BR2_ARM_CPU_ARMV4 and ditch
> BR2_ARM_CPU_ARMV4T since it can be reconstructed from BR2_ARM_CPU_ARMV4
> && HAS_THUMB.
> 
> The reasonning is that few package actually require knowing the exact
> variant, but rather the instruction set generation. Thus knowing about
> armv4t is equivalent to knowing about armv4 for most. Those few that
> actuallt require the Thumb isns would need to use the HAS_THUMB option,
> which very purpose is just that, telling whether thumb is supported or
> not (or HAS_THUMB2 for Thumb-2).

 +1 to this. I made the same reasoning.


 Regards,
 Arnout


> As for the J version, I wonder if we need to introduce a HAS_JAZELLE
> option. For armv6zk (Wikpedia refer to it as armv6kz), I also doubt we
> need to introduce a HAS_TRUSTZONE option either. For armv7a, I think we
> can just use armv7, since we will probably never support the R and M
> profiles in Buildroot.

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
