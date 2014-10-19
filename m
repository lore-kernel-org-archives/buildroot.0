From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 23:55:28 +0200
Subject: [Buildroot] [PATCH 03/31] arch/arm: add blind options to know
 the ARM architecture
In-Reply-To: <1413749285-1108-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141019215528.GD12247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-19 22:07 +0200, Thomas Petazzoni spake thusly:
> In preparation to the removal of BR2_GCC_TARGET_ARCH for ARM, this
> commit introduces a number of blind options for each ARM architecture,
> so that packages/toolchains that had dependencies using
> BR2_GCC_TARGET_ARCH can continue to express their dependencies. It can
> also be used to simplify package dependencies that were using the
> individual ARM core options.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arm | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 201ff1d..d2ba924 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -37,6 +37,27 @@ config BR2_ARM_CPU_HAS_THUMB
>  config BR2_ARM_CPU_HAS_THUMB2
>  	bool

Indirectly related to your patch: HAS_THUMB2 should select HAS_THUMB,
since Thumb-2 is a superset of Thumb.

Then, you could just have (for example) BR2_ARM_CPU_ARMV4 and ditch
BR2_ARM_CPU_ARMV4T since it can be reconstructed from BR2_ARM_CPU_ARMV4
&& HAS_THUMB.

The reasonning is that few package actually require knowing the exact
variant, but rather the instruction set generation. Thus knowing about
armv4t is equivalent to knowing about armv4 for most. Those few that
actuallt require the Thumb isns would need to use the HAS_THUMB option,
which very purpose is just that, telling whether thumb is supported or
not (or HAS_THUMB2 for Thumb-2).

As for the J version, I wonder if we need to introduce a HAS_JAZELLE
option. For armv6zk (Wikpedia refer to it as armv6kz), I also doubt we
need to introduce a HAS_TRUSTZONE option either. For armv7a, I think we
can just use armv7, since we will probably never support the R and M
profiles in Buildroot.

Regards,
Yann E. MORIN.

> +config BR2_ARM_CPU_ARMV4
> +	bool
> +
> +config BR2_ARM_CPU_ARMV4T
> +	bool
> +
> +config BR2_ARM_CPU_ARMV5TE
> +	bool
> +
> +config BR2_ARM_CPU_ARMV5TEJ
> +	bool
> +
> +config BR2_ARM_CPU_ARMV6J
> +	bool
> +
> +config BR2_ARM_CPU_ARMV6ZK
> +	bool
> +
> +config BR2_ARM_CPU_ARMV7A
> +	bool
> +
>  choice
>  	prompt "Target Architecture Variant"
>  	depends on BR2_arm || BR2_armeb
> @@ -47,70 +68,88 @@ choice
>  config BR2_arm920t
>  	bool "arm920t"
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV4T
>  config BR2_arm922t
>  	bool "arm922t"
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV4T
>  config BR2_arm926t
>  	bool "arm926t"
>  	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV5TEJ
>  config BR2_arm1136jf_s_r0
>  	bool "arm1136jf_s rev0"
>  	select BR2_ARM_CPU_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6J
>  config BR2_arm1136jf_s_r1
>  	bool "arm1136jf_s rev1"
>  	select BR2_ARM_CPU_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6J
>  config BR2_arm1176jz_s
>  	bool "arm1176jz-s"
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6ZK
>  config BR2_arm1176jzf_s
>  	bool "arm1176jzf-s"
>  	select BR2_ARM_CPU_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6ZK
>  config BR2_cortex_a5
>  	bool "cortex-A5"
>  	select BR2_ARM_CPU_MAYBE_HAS_NEON
>  	select BR2_ARM_CPU_MAYBE_HAS_VFPV4
>  	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7A
>  config BR2_cortex_a7
>  	bool "cortex-A7"
>  	select BR2_ARM_CPU_HAS_NEON
>  	select BR2_ARM_CPU_HAS_VFPV4
>  	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7A
>  config BR2_cortex_a8
>  	bool "cortex-A8"
>  	select BR2_ARM_CPU_HAS_NEON
>  	select BR2_ARM_CPU_HAS_VFPV3
>  	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7A
>  config BR2_cortex_a9
>  	bool "cortex-A9"
>  	select BR2_ARM_CPU_MAYBE_HAS_NEON
>  	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
>  	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7A
>  config BR2_cortex_a12
>  	bool "cortex-A12"
>  	select BR2_ARM_CPU_HAS_NEON
>  	select BR2_ARM_CPU_HAS_VFPV4
>  	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7A
>  config BR2_cortex_a15
>  	bool "cortex-A15"
>  	select BR2_ARM_CPU_HAS_NEON
>  	select BR2_ARM_CPU_HAS_VFPV4
>  	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7A
>  config BR2_fa526
>  	bool "fa526/626"
> +	select BR2_ARM_CPU_ARMV4
>  config BR2_pj4
>  	bool "pj4"
>  	select BR2_ARM_CPU_HAS_VFPV3
> +	select BR2_ARM_CPU_ARMV7A
>  config BR2_strongarm
>  	bool "strongarm sa110/sa1100"
> +	select BR2_ARM_CPU_ARMV4
>  config BR2_xscale
>  	bool "xscale"
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV5TE
>  config BR2_iwmmxt
>  	bool "iwmmxt"
> +	select BR2_ARM_CPU_ARMV5TE
>  endchoice
>  
>  config BR2_arm1136jf_s
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
