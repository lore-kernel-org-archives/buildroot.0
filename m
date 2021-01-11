From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Jan 2021 18:11:13 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/uclibc: add backtrace
 support option
In-Reply-To: <20210111110311.18568-1-andrea.ricchi@amarulasolutions.com>
References: <20210109161900.51824>
 <20210111110311.18568-1-andrea.ricchi@amarulasolutions.com>
Message-ID: <20210111171113.GX3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrea, All,

On 2021-01-11 12:03 +0100, Andrea Ricchi spake thusly:
> Add toolchain configuration to support execinfo.h and backtrace
> features.
> 
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>   - add dependncy on shared lib (suggested by Yann Morin)
> 
>  package/uclibc/Config.in |  8 ++++++++
>  package/uclibc/uclibc.mk | 11 +++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index e59fef3c69..4dab46ae93 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -39,6 +39,14 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
>  	  Enable this option if you want your toolchain to support
>  	  localization and internationalization.
>  
> +config BR2_TOOLCHAIN_BUILDROOT_BACKTRACE
> +	bool "Enable backtrace support"
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_USE_BACKTRACE

As I already pointed out in my initial review [0]: BR2_USE_BACKTRACE
does not exist in Buildroot.

[0] http://lists.busybox.net/pipermail/buildroot/2021-January/300396.html

Regards,
Yann E. MORIN.

> +	help
> +	  Enable this option if you want your toolchain to support
> +	  execinfo.h and backtrace features.
> +
>  choice
>  	prompt "Thread library implementation"
>  	help
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 53983e852d..b6f6c0f824 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -359,6 +359,16 @@ else
>  UCLIBC_SHARED_LIBS_CONFIG = $(call KCONFIG_ENABLE_OPT,HAVE_SHARED)
>  endif
>  
> +#
> +# backtrace support
> +#
> +
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_BACKTRACE),y)
> +UCLIBC_BACKTRACE_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_BACKTRACE)
> +else
> +UCLIBC_BACKTRACE_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_BACKTRACE)
> +endif
> +
>  #
>  # Commands
>  #
> @@ -401,6 +411,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>  	$(UCLIBC_LOCALE_CONFIG)
>  	$(UCLIBC_WCHAR_CONFIG)
>  	$(UCLIBC_SHARED_LIBS_CONFIG)
> +	$(UCLIBC_BACKTRACE_CONFIG)
>  endef
>  
>  define UCLIBC_BUILD_CMDS
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
