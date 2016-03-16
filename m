From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Mar 2016 23:43:03 +0100
Subject: [Buildroot] [PATCH 02/16] arch/arm: Cortex-M3 provides only
 Thumb-2
In-Reply-To: <1458164602-16983-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9E177.5000606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> The Cortex-M cores only support Thumb-2, not Thumb. In fact, Thumb-2
> is a superset of Thumb,

  If thumb2 is a superset of thumb, then CPU_HAS_THUMB2 should select 
CPU_HAS_THUMB. And according to [1], it really is a superset.

> and we could have a single option for both in
> Buildroot, since -mthumb on ARMv4/v5 means original Thumb, while
> -mthumb on ARMv7 means Thumb 2.

  Well, I think the main reason to have the CPU_HAS_THUMB2 option is to allow 
packages to depend on it, e.g. because there is some thumb2 assembly in it.


> However, for clarity, it makes sense
> to have two separate options. But in this case, Cortex-M3 should not
> advertise that it supports Thumb, as in fact selecting Thumb would
> generate Thumb-2 code.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   arch/Config.in.arm | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 33f763a..cd1ec33 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -172,7 +172,6 @@ config BR2_cortex_a17
>   	select BR2_ARCH_HAS_MMU_OPTIONAL
>   config BR2_cortex_m3
>   	bool "cortex-M3"
> -	select BR2_ARM_CPU_HAS_THUMB

  I do agree about the change itself, but I also think that HAS_THUMB2 should 
select HAS_THUMB instead. Also, I think the BR2_ARM_INSTRUCTIONS_THUMB2 option 
should be removed, because in the end it's just compiling in thumb mode. In arm 
mode, we also don't have separate options for armv5, armv6, armv7.


  Regards,
  Arnout


>   	select BR2_ARM_CPU_HAS_THUMB2
>   	select BR2_ARM_CPU_ARMV7M
>   config BR2_fa526
>

[1] 
http://stackoverflow.com/questions/28669905/arm-thumb-and-thumb-2-instructions-confusion



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
