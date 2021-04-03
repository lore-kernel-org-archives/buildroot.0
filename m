From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 17:37:33 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: add various
 options to disable optional components
In-Reply-To: <20210403152234.2006719-1-bernd.kuhls@t-online.de>
References: <20210403152234.2006719-1-bernd.kuhls@t-online.de>
Message-ID: <20210403153733.GC2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-04-03 17:22 +0200, Bernd Kuhls spake thusly:
> When enabled some IPTV streams are piped using /usr/bin/ffmpeg so make
> sure that the ffmpeg binary is present.
> 
> Transcoding support can already be disabled reducing /usr/bin/tvheadend
> by 1,03MB.
> 
> By disabling all new options provided by this patch the binary size can
> additionally be reduced by 2,08MB.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> +config BR2_PACKAGE_TVHEADEND_IPTV
> +	bool "IPTV support"
> +	default y
> +	select BR2_PACKAGE_FFMPEG_FFMPEG if BR2_PACKAGE_FFMPEG # runtime

As we discussed in the previous thread, IPTV really only works fully
when ffmpeg (the program) is available, which wil not be the case if
ffmpeg (the package) is not enabled.

As I suggested previously, we should ensure that ffmpeg is enabled:

    config BR2_PACKAGE_TVHEADEND_IPTV
        bool "IPTV support"
        depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
        select BR2_PACKAGE_FFMPEG  # runtime
        select BR2_PACKAGE_FFMPEG_FFMPEG  # runtime

If you agree, I can change that when applying...

Regards,
Yann E. MORIN.

> +	help
> +	  Enable IPTV support.
> +
> +config BR2_PACKAGE_TVHEADEND_SATIP
> +	bool "SAT>IP support"
> +	default y
> +	help
> +	  Enable SAT>IP support.
> +
> +config BR2_PACKAGE_TVHEADEND_TIMESHIFT
> +	bool "timeshift support"
> +	default y
> +	help
> +	  Enable timeshift support.
> +
>  config BR2_PACKAGE_TVHEADEND_TRANSCODING
>  	bool "transcoding support"
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 114142bfa9..b694c44e3b 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -63,6 +63,40 @@ TVHEADEND_CONF_OPTS += \
>  	--disable-libx265
>  endif
>  
> +ifeq ($(BR2_PACKAGE_TVHEADEND_DESCRAMBLER),y)
> +TVHEADEND_CONF_OPTS += \
> +	--enable-cardclient \
> +	--enable-cwc \
> +	--enable-cccam \
> +	--enable-capmt \
> +	--enable-constcw
> +else
> +TVHEADEND_CONF_OPTS += \
> +	--disable-cardclient \
> +	--disable-cwc \
> +	--disable-cccam \
> +	--disable-capmt \
> +	--disable-constcw
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TVHEADEND_IPTV),y)
> +TVHEADEND_CONF_OPTS += --enable-iptv
> +else
> +TVHEADEND_CONF_OPTS += --disable-iptv
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TVHEADEND_SATIP),y)
> +TVHEADEND_CONF_OPTS += --enable-satip_client --enable-satip_server
> +else
> +TVHEADEND_CONF_OPTS += --disable-satip_client --disable-satip_server
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TVHEADEND_TIMESHIFT),y)
> +TVHEADEND_CONF_OPTS += --enable-timeshift
> +else
> +TVHEADEND_CONF_OPTS += --disable-timeshift
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
>  TVHEADEND_DEPENDENCIES += libdvbcsa
>  TVHEADEND_CONF_OPTS += --enable-tvhcsa
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
