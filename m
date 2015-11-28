From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Nov 2015 15:30:30 +0100
Subject: [Buildroot] [PATCH 1/1] Add ARM11 MPCore CPU target support
In-Reply-To: <BLU437-SMTP302AFC715EFB42C4E0320FC1020@phx.gbl>
References: <BLU437-SMTP302AFC715EFB42C4E0320FC1020@phx.gbl>
Message-ID: <20151128143030.GA3816@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergi, All,

On 2015-11-28 10:59 +0100, Sergi Granell spake thusly:
> Signed-off-by: Sergi Granell <xerpi.g.12@gmail.com>
> ---
>  arch/Config.in.arm | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 67ff384..f9cfc22 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -104,6 +104,13 @@ config BR2_arm1176jzf_s
>  	select BR2_ARM_CPU_HAS_THUMB
>  	select BR2_ARM_CPU_ARMV6
>  	select BR2_ARCH_HAS_MMU_OPTIONAL
> +config BR2_arm11mpcore
> +	bool "arm11mpcore"
> +	select BR2_ARM_CPU_HAS_ARM
> +	select BR2_ARM_CPU_HAS_VFPV2

I wonder if we should not make VFP optional, and change the CPU nme on
whether the user has enabled VFP, like:

    config BR2_arm11mpcore
        bool "mpcore"
        [...]
        select BR2_ARM_CPU_MAYBE_HAS_VFPV2
        [...]

    config BR2_GCC_TARGET_CPU
        [...]
        default "mpcore"        if BR2_arm11mpcore && BR2_ARM_CPU_HAS_VFPV2
        default "mpcorenovfp"   if BR2_arm11mpcore
        [...]

(note that the second default does not need !VFPV2, since Kconfig will
stop on the first matching default, so the second will only match if the
first does not, which means it would only match without a VFP).

(also note that I just named the prompt 'mpcore' instead of
'arm11mpcore', since that's how gcc knows it as).

Also, since the selection gets a bit more tricky, you need to explain
that in the commit log, with something along the lines of (feel free to
adapt to your own taste! ;-) ):

    gcc differentiates the mpcore-with-vfp from the mcpore-without-vfp
    CPUs. The former is named just 'mpcore', while the latter is named
    'mpcorenovfp'.

    We only add one entry, 'mpcore' and let the user select whether or
    not to use the VFP. We then name the CPU according to the user's
    selection.

Care to fix and resend, please?

Regards,
Yann E. MORIN.

> +	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_ARMV6
> +	select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a5
>  	bool "cortex-A5"
>  	select BR2_ARM_CPU_HAS_ARM
> @@ -419,6 +426,7 @@ config BR2_GCC_TARGET_CPU
>  	default "arm1136jf-s"	if BR2_arm1136jf_s
>  	default "arm1176jz-s"	if BR2_arm1176jz_s
>  	default "arm1176jzf-s"	if BR2_arm1176jzf_s
> +	default "mpcore"	if BR2_arm11mpcore
>  	default "cortex-a5"	if BR2_cortex_a5
>  	default "cortex-a7"	if BR2_cortex_a7
>  	default "cortex-a8"	if BR2_cortex_a8
> -- 
> 2.6.2
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
