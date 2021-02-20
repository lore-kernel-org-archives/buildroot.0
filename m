From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 17:20:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/taglib: drop config options
 to enable MP4/ASF support
In-Reply-To: <20210217074402.20849-1-joerg.krause@embedded.rocks>
References: <20210217074402.20849-1-joerg.krause@embedded.rocks>
Message-ID: <20210220162059.GL2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2021-02-17 08:44 +0100, J?rg Krause spake thusly:
> Both options where removed in git commit dd846904cbc1ef3ee628d77f0c9df88ef8967816
> back in year 2011.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2: fix missing bool in Config.in.legacy (Oops!)

In fact, in this case, we do not need legacy handling.

Indeed, for people who had those options enabled, nothing changes: they
will still get the features they were asking for.

But for people who had those options off, legacy will not be triggered
(it only depends on the options being enabled), so they will not notice,
as they already had the features enabled since they were not conditional
anyway.

So I dropped the legacy handling, and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy         | 12 ++++++++++++
>  package/taglib/Config.in | 10 ----------
>  package/taglib/taglib.mk |  8 --------
>  3 files changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 9deb67b31f..eeb9738e0a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,18 @@ endif
>  
>  comment "Legacy options removed in 2021.02"
>  
> +config BR2_PACKAGE_TAGLIB_MP4
> +	bool "taglib mp4 support"
> +	select BR2_LEGACY
> +	help
> +	  mp4 support is enabled in TagLib by default since 2011.
> +
> +config BR2_PACKAGE_TAGLIB_ASF
> +	bool "taglib wma support"
> +	select BR2_LEGACY
> +	help
> +	  asf/wma support is enabled in TagLib by default since 2011.
> +
>  config BR2_PACKAGE_MPD_AUDIOFILE
>  	bool "mpd audiofile support removed"
>  	select BR2_LEGACY
> diff --git a/package/taglib/Config.in b/package/taglib/Config.in
> index 9e6bb707fc..6a87a13215 100644
> --- a/package/taglib/Config.in
> +++ b/package/taglib/Config.in
> @@ -11,15 +11,5 @@ config BR2_PACKAGE_TAGLIB
>  
>  	  http://taglib.org/
>  
> -if BR2_PACKAGE_TAGLIB
> -
> -config BR2_PACKAGE_TAGLIB_MP4
> -	bool "taglib mp4 support"
> -
> -config BR2_PACKAGE_TAGLIB_ASF
> -	bool "taglib wma support"
> -
> -endif
> -
>  comment "taglib needs a toolchain w/ C++, wchar"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
> index 9381e16672..738be35756 100644
> --- a/package/taglib/taglib.mk
> +++ b/package/taglib/taglib.mk
> @@ -20,14 +20,6 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
>  TAGLIB_DEPENDENCIES += zlib
>  endif
>  
> -ifeq ($(BR2_PACKAGE_TAGLIB_ASF),y)
> -TAGLIB_CONF_OPTS += -DWITH_ASF=ON
> -endif
> -
> -ifeq ($(BR2_PACKAGE_TAGLIB_MP4),y)
> -TAGLIB_CONF_OPTS += -DWITH_MP4=ON
> -endif
> -
>  define TAGLIB_REMOVE_DEVFILE
>  	rm -f $(TARGET_DIR)/usr/bin/taglib-config
>  endef
> -- 
> 2.30.1
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
