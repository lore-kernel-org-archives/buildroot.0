From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 14:35:45 +0200
Subject: [Buildroot] [PATCH 02/23] package/kodi-platform: add explicit
 dependency to tinyxml
In-Reply-To: <20200621103806.616133-2-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
 <20200621103806.616133-2-bernd.kuhls@t-online.de>
Message-ID: <20200621123545.GF2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-21 12:37 +0200, Bernd Kuhls spake thusly:
> Tinyxml is built as a hard-dependency of Kodi already. For the case that
> Kodi drops this dependency we need to make sure that this package still
> finds its dependencies:
> https://github.com/xbmc/kodi-platform/blob/master/CMakeLists.txt#L9
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-platform/Config.in        | 1 +
>  package/kodi-platform/kodi-platform.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi-platform/Config.in b/package/kodi-platform/Config.in
> index cde1925c07..7b4226a10d 100644
> --- a/package/kodi-platform/Config.in
> +++ b/package/kodi-platform/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_KODI_PLATFORM
>  	bool
>  	select BR2_PACKAGE_LIBPLATFORM
> +	select BR2_PACKAGE_TINYXML

You need to propagate the dependencies of tinyxml too.

Yes, the only dependency is on C++, which is already a dependency of
Kodi, and thus is de-facto a dependency of kodi-platform.

However, as you are doing in the following patches, I think it is better
is we have correct dependency tracking all over the tree, because it
makes updating easier (we can notice that a dependency got dropped or
added, etc...)

So, in turn, we should also propagate de dependencies of kodi-patform to
all the packages that select it.

since this impacts quite a fair number of the follwing patches, I've
marked the series (except for the first patch) as changes requested. Can
you please fix and respin, please?

Yes, this is additional burden on your side, but I think we should take
this opportunity to fix the current mess of implicitly inherited
dependencies.

Thanks for your continued work on the Kodi package (and elsewhere!) :-)

Regards,
Yann E. MORIN.

>  	help
>  	  Kodi add-on platform support library
>  
> diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
> index f1b97e3259..aab1d0dbf0 100644
> --- a/package/kodi-platform/kodi-platform.mk
> +++ b/package/kodi-platform/kodi-platform.mk
> @@ -9,6 +9,6 @@ KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
>  KODI_PLATFORM_LICENSE = GPL-2.0+
>  KODI_PLATFORM_LICENSE_FILES = debian/copyright
>  KODI_PLATFORM_INSTALL_STAGING = YES
> -KODI_PLATFORM_DEPENDENCIES = libplatform kodi
> +KODI_PLATFORM_DEPENDENCIES = kodi libplatform tinyxml
>  
>  $(eval $(cmake-package))
> -- 
> 2.26.2
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
