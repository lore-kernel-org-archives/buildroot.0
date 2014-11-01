From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 20:28:40 +0100
Subject: [Buildroot] [PATCH 2/3] uclibc: add explicit setup of
 ARC-specific options
In-Reply-To: <1414677449-15937-3-git-send-email-abrodkin@synopsys.com>
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
 <1414677449-15937-3-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141101192840.GH10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2014-10-30 16:57 +0300, Alexey Brodkin spake thusly:
> As with other architectures for ARC we need to have an ability to set
> specific options in uClibc.
> 
> In particular this is required for selection of ARC ISA version.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> ---
>  package/uclibc/Config.in |  6 ++++++
>  package/uclibc/uclibc.mk | 12 ++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index d319ae7..c68558f 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -194,6 +194,12 @@ config BR2_UCLIBC_TARGET_ARCH
>  	default i386	   if BR2_i386
>  	default x86_64	   if BR2_x86_64
>  
> +config BR2_UCLIBC_ARC_TYPE
> +	string
> +	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
> +	default ARC_CPU_700	if BR2_arc750d
> +	default ARC_CPU_700	if BR2_arc770d

I know you just followed the existing style of the options around, but
since this option is a "string", the default values must be enclosed
between double quotes, like:

    default "ARC_CPU_700" if BR2_arc750d

The fact that it works is that we are lucky there are no symbol named
ARC_CPU_700, otherwise its value would be used, not the string
"ARC_CPU_700".

I would prefer we get proper kconfig code, even though the rest of the
code around is not correct. Maybe a preliminary patch to fix that? ;-)

Otherwise, looks good to me.

Regards,
Yann E. MORIN.

>  config BR2_UCLIBC_ARM_BX
>  	bool
>  	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index b2ecce3..8f990c7 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -57,6 +57,17 @@ UCLIBC_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
>  endif
>  
>  #
> +# ARC definitions
> +#
> +
> +ifeq ($(UCLIBC_TARGET_ARCH),arc)
> +UCLIBC_ARC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_ARC_TYPE))
> +define UCLIBC_ARC_TYPE_CONFIG
> +	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARC_TYPE),$(@D)/.config)
> +endef
> +endif # arc
> +
> +#
>  # ARM definitions
>  #
>  
> @@ -410,6 +421,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>  	$(call KCONFIG_SET_OPT,DEVEL_PREFIX,"/usr",$(@D)/.config)
>  	$(call KCONFIG_SET_OPT,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D)/.config)
>  	$(UCLIBC_MMU_CONFIG)
> +	$(UCLIBC_ARC_TYPE_CONFIG)
>  	$(UCLIBC_ARM_ABI_CONFIG)
>  	$(UCLIBC_ARM_BX_CONFIG)
>  	$(UCLIBC_MIPS_ABI_CONFIG)
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
