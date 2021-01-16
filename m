From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 16:35:29 +0100
Subject: [Buildroot] [PATCH 1/4] ARC: Add support for generic HS48
 processor
In-Reply-To: <20210115200319.4139041-2-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
 <20210115200319.4139041-2-vgupta@synopsys.com>
Message-ID: <20210116153529.GK2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vineet, All,

On 2021-01-15 12:03 -0800, Vineet Gupta spake thusly:
> For the HS48 processor, BR currently builds with -mcpu=hs4x_rel31 which
> generates suboptimal code as it inhibits delay slot and back-back ST and so on.
> 
> Enable a new variant to build with -mcpu=hs4x for normal codegen.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/Config.in.arc | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index fdfafda31c72..259d6f3ab8b9 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -39,9 +39,14 @@ config BR2_archs38_full
>  
>  config BR2_archs4x_rel31
>  	bool "ARC HS48 rel 31"
> +	help
> +	   Build for HS48 release 3.1
> +
> +config BR2_archs4x
> +	bool "ARC HS48"
>  	help
>  	   Latest release of HS48 processor
> -	   - Dual- and quad multiply and MC oprations
> +	   - Dual and Quad multiply and MAC operations
>  	   - Double-precision FPU
>  
>  endchoice
> @@ -49,7 +54,7 @@ endchoice
>  # Choice of atomic instructions presence
>  config BR2_ARC_ATOMIC_EXT
>  	bool "Atomic extension (LLOCK/SCOND instructions)"
> -	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
> +	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x

Those started to be rather long lines, so I split them.

>  config BR2_ARCH
>  	default "arc"	if BR2_arcle
> @@ -70,10 +75,11 @@ config BR2_GCC_TARGET_CPU
>  	default "hs38"	 if BR2_archs38_64mpy
>  	default "hs38_linux"	 if BR2_archs38_full
>  	default "hs4x_rel31"	 if BR2_archs4x_rel31
> +	default "hs4x"	 if BR2_archs4x
>  
>  config BR2_READELF_ARCH_NAME
>  	default "ARCompact"	if BR2_arc750d || BR2_arc770d
> -	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
> +	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x

Ditto.

>  choice
>  	prompt "MMU Page Size"
> @@ -93,7 +99,7 @@ choice
>  
>  config BR2_ARC_PAGE_SIZE_4K
>  	bool "4KB"
> -	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
> +	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x

In fact, the only variant that does not have 4K pages is 750d, so I
inverted the logic to:

    depends on !BR2_arc750d

So the lines are not too long anymore.

If the situation becones more complex than that, then we could introduce
intermediate symbols, like;

    config BR2_ARC_HAS_4K_PAGES
        bool

which could then be selected by the variants that do have it, e.g.:

    config BR2_archs4x
        bool "ARC HS48"
        select BR2_ARC_HAS_4K_PAGES

and then the 4K choice would depend on it;

    config BR2_ARC_PAGE_SIZE_4K
        bool "4KB"
        depends on BR2_ARC_HAS_4K_PAGES

I was about to do that, but if 750d is definitely the only variant to
not support those 4K or 16K pages, this would be overkill...

>  config BR2_ARC_PAGE_SIZE_8K
>  	bool "8KB"
> @@ -103,7 +109,7 @@ config BR2_ARC_PAGE_SIZE_8K
>  
>  config BR2_ARC_PAGE_SIZE_16K
>  	bool "16KB"
> -	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
> +	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x

Ditto.

Regards,
Yann E. MORIN.

>  endchoice
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
