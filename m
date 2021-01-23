From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 22:17:21 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/uclibc: add backtrace
 support option
In-Reply-To: <20210111130705.25005-1-andrea.ricchi@amarulasolutions.com>
References: <20210111130705.25005-1-andrea.ricchi@amarulasolutions.com>
Message-ID: <20210123211721.GE926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrea, All,

On 2021-01-11 14:07 +0100, Andrea Ricchi spake thusly:
> Add toolchain configuration to support execinfo.h and backtrace
> features.
> 
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

We've discussed this amongst maintainers, and as I explained in my
lengthy reply earlier, we believe this does not warrant a new option in
the menuconfig.

Thank you for your contribution nonetheless!

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - Remove BR2_USE_BACKTRACE selection (suggested by Angelo Compagnucci)
> 
> Changes v1 -> v2:
>   - add shared library dependency (suggested by Yann Morin)
> 
>  package/uclibc/Config.in |  7 +++++++
>  package/uclibc/uclibc.mk | 11 +++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index e59fef3c69..dedd58f940 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -39,6 +39,13 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
>  	  Enable this option if you want your toolchain to support
>  	  localization and internationalization.
>  
> +config BR2_TOOLCHAIN_BUILDROOT_BACKTRACE
> +	bool "Enable backtrace support"
> +	depends on !BR2_STATIC_LIBS
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
