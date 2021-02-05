From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 10:01:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/xenomai: smp support needs at
 least armv6
In-Reply-To: <20210202205614.59303-1-romain.naour@gmail.com>
References: <20210202205614.59303-1-romain.naour@gmail.com>
Message-ID: <20210205090156.GR2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-02-02 21:56 +0100, Romain Naour spake thusly:
> There are no autobuilder failures for this issue, but the following
> defconfig:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_XENOMAI=y
> BR2_PACKAGE_XENOMAI_COBALT=y
> 
> See:
> https://gitlab.denx.de/Xenomai/xenomai/-/blob/v3.1/lib/cobalt/arch/arm/include/asm/xenomai/features.h#L56
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/xenomai/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index b655733528..b1b02373c3 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -110,6 +110,8 @@ endchoice
>  config BR2_PACKAGE_XENOMAI_ENABLE_SMP
>  	bool "Enable SMP support"
>  	default y
> +	# SMP not supported below armv6
> +	depends on !BR2_ARM_CPU_ARMV4 || !BR2_ARM_CPU_ARMV5

This does not make sense:

  - if you are using armv4, then you are not using armv5, and thus the
    condition is true;

  - if you are using armv5, then you are not using armv4, and thus the
    condition is true;

  - if you are using neither armv4 nor armv5, then the condition is true.

So, the condition is always true...

I've changed that to:

    depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  This option enables SMP support in Xenomai userspace.
>  
> -- 
> 2.29.2
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
