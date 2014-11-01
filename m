From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 20:55:31 +0100
Subject: [Buildroot] [PATCH 1/3] arc: add explicit selection of CPU
 templates ARC 750D and ARC770D
In-Reply-To: <1414677449-15937-2-git-send-email-abrodkin@synopsys.com>
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
 <1414677449-15937-2-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141101195531.GI10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2014-10-30 16:57 +0300, Alexey Brodkin spake thusly:
> This separation allows to specify unique options and features for each
> CPU.
> 
> For example ARC 770D has LLOCK/SCOND instructions built-in by default.

"built-in by default": does that mean some cores might not have atomics?
Does it make sense to disable atomics for 770D at all, or should they
always be enabled?

If it makes sense to disable atomics for 770D, then this code has my:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, if it does not make sense to disable atomics for 770D, then we
should do it a little bit differently, like (untested):

    choice
        bool "Target CPU"

    config BR2_arc750d
        bool "ARC 750D"
        select BR2_ARC_MAYBE_ATOMIC_EXT

    config BR2_arc770d
        bool "ARC 770D"
        select BR2_ARC_ATOMIC_EXT

    endchoice

    config BR2_ARC_MAYBE_ATOMIC_EXT
        bool

    config BR2_ARC_ATOMIC_EXT
        bool
        prompt "Atomic extension (LLOCK/SCOND instructions)" if BR2_ARC_MAYBE_ATOMICS

    config BR2_ARCH_HAS_ATOMICS
        default y if BR2_ARC_ATOMIC_EXT

Regards,
Yann E. MORIN.

> Also this new scheme simplifies selection of proper configuration for
> users - preconfigured options now match templates for ARC CPUs.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> ---
>  arch/Config.in.arc | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index fcb5d7d..b31b141 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -1,6 +1,22 @@
> -# Choise of atomic instructions presence
> +choice
> +	prompt "Target CPU"
> +	depends on BR2_arc
> +	default BR2_arc770d
> +	help
> +	    Specific CPU to use
> +
> +config BR2_arc750d
> +	bool "ARC 750D"
> +
> +config BR2_arc770d
> +	bool "ARC 770D"
> +
> +endchoice
> +
> +# Choice of atomic instructions presence
>  config BR2_ARC_ATOMIC_EXT
>  	bool "Atomic extension (LLOCK/SCOND instructions)"
> +	default y if BR2_arc770d
>  
>  config BR2_ARCH_HAS_ATOMICS
>  	default y if BR2_ARC_ATOMIC_EXT
> @@ -18,4 +34,5 @@ config BR2_ENDIAN
>  	default "BIG"	 if BR2_arceb
>  
>  config BR2_GCC_TARGET_CPU
> -	default "arc700"
> +	default "arc700" if BR2_arc750d
> +	default "arc700" if BR2_arc770d
> -- 
> 1.9.3
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
