From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:56:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/spdlog: support dynamic library
In-Reply-To: <20210126175456.2181332-1-fontaine.fabrice@gmail.com>
References: <20210126175456.2181332-1-fontaine.fabrice@gmail.com>
Message-ID: <20210126185629.GE2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-26 18:54 +0100, Fabrice Fontaine spake thusly:
> spdlog can install a shared library since version 1.4.0 and
> https://github.com/gabime/spdlog/commit/45a18a61c633564311e51f5cbed2748e9cb70e2f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/spdlog/Config.in | 2 +-
>  package/spdlog/spdlog.mk | 9 ++++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
> index 4aee1f7dd1..877c1b6ab7 100644
> --- a/package/spdlog/Config.in
> +++ b/package/spdlog/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_SPDLOG
>  	depends on BR2_USE_WCHAR # fmt
>  	select BR2_PACKAGE_FMT
>  	help
> -	  Very fast, header only, C++ logging library.
> +	  Very fast, header-only/compiled, C++ logging library.
>  
>  	  https://github.com/gabime/spdlog
>  
> diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
> index 3c745f60ad..f5b331526a 100644
> --- a/package/spdlog/spdlog.mk
> +++ b/package/spdlog/spdlog.mk
> @@ -8,6 +8,7 @@ SPDLOG_VERSION = 1.8.1
>  SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
>  SPDLOG_LICENSE = MIT
>  SPDLOG_LICENSE_FILES = LICENSE
> +SPDLOG_INSTALL_STAGING = YES
>  SPDLOG_DEPENDENCIES = fmt
>  SPDLOG_CONF_OPTS += \
>  	-DSPDLOG_BUILD_TESTS=OFF \
> @@ -15,8 +16,10 @@ SPDLOG_CONF_OPTS += \
>  	-DSPDLOG_BUILD_BENCH=OFF \
>  	-DSPDLOG_FMT_EXTERNAL=ON
>  
> -# Header-only library
> -SPDLOG_INSTALL_STAGING = YES
> -SPDLOG_INSTALL_TARGET = NO
> +ifeq ($(BR2_STATIC_LIBS),y)
> +SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=OFF
> +else
> +SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=ON
> +endif
>  
>  $(eval $(cmake-package))
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
