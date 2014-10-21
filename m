From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 23:06:13 +0200
Subject: [Buildroot] [PATCH v2 01/30] arch/arm: add blind options to
 know the ARM architecture
In-Reply-To: <1413923237-2861-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413923237-2861-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141021210613.GC23999@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-21 22:26 +0200, Thomas Petazzoni spake thusly:
> In preparation to the removal of BR2_GCC_TARGET_ARCH for ARM, this
> commit introduces a number of blind options for each ARM architecture,
> so that packages/toolchains that had dependencies using
> BR2_GCC_TARGET_ARCH can continue to express their dependencies. It can
> also be used to simplify package dependencies that were using the
> individual ARM core options.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arm | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 201ff1d..5441c8d 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -37,6 +37,18 @@ config BR2_ARM_CPU_HAS_THUMB
>  config BR2_ARM_CPU_HAS_THUMB2
>  	bool
>  
> +config BR2_ARM_CPU_ARMV4
> +	bool
> +
> +config BR2_ARM_CPU_ARMV5
> +	bool
> +
> +config BR2_ARM_CPU_ARMV6
> +	bool
> +
> +config BR2_ARM_CPU_ARMV7A
> +	bool

I still believe we could go with ARMV7 only, since we only have CPUs of
the A series for now.

When we add a new CPU of the M series, then we could go this route:

  - add a new config option stating the CPU only has Thumb-2:

        config BR2_ARM_CPU_HAS_THUMB2_ONLY
            bool

    or add another option:

        config BR2_ARM_CPU_HAS_ARM
            bool # 'y' is CPU has the ARM mode

  - use it in packages that have an interest in them.

  - select it from appropriate CPUs

But we can rename that option later, since it is a blind option, it will
have no incidence on defconfig or .config files. So:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  choice
>  	prompt "Target Architecture Variant"
>  	depends on BR2_arm || BR2_armeb
> @@ -47,70 +59,88 @@ choice
>  config BR2_arm920t
>  	bool "arm920t"
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV4
>  config BR2_arm922t
>  	bool "arm922t"
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV4
>  config BR2_arm926t
>  	bool "arm926t"
>  	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV5
>  config BR2_arm1136jf_s_r0
>  	bool "arm1136jf_s rev0"
>  	select BR2_ARM_CPU_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6
>  config BR2_arm1136jf_s_r1
>  	bool "arm1136jf_s rev1"
>  	select BR2_ARM_CPU_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6
>  config BR2_arm1176jz_s
>  	bool "arm1176jz-s"
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6
>  config BR2_arm1176jzf_s
>  	bool "arm1176jzf-s"
>  	select BR2_ARM_CPU_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6
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
> +	select BR2_ARM_CPU_ARMV5
>  config BR2_iwmmxt
>  	bool "iwmmxt"
> +	select BR2_ARM_CPU_ARMV5
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
