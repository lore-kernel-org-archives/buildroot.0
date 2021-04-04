From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 14:30:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: add various
 options to disable optional components
In-Reply-To: <20210403152234.2006719-1-bernd.kuhls@t-online.de>
References: <20210403152234.2006719-1-bernd.kuhls@t-online.de>
Message-ID: <20210404123047.GH2252@scaer>
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

I've split that into one commit per new option.

Also, I've dropped selecting ffmpeg's ffmpeg command line tool for the
IPTV support, because as you said youreself, not all IPTV streams will
require ffmpeg. Instead, I've added a note in the help text, to direct
users to enable it if they need it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: removed build-dependency to ffmpeg for iptv support (Yann)
>     re-wrapped descrambler configure options (Yann)
> 
>  package/tvheadend/Config.in    | 27 ++++++++++++++++++++++++++-
>  package/tvheadend/tvheadend.mk | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index 909d955c02..4b9c7267d2 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -3,7 +3,7 @@ comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  
> -config BR2_PACKAGE_TVHEADEND
> +menuconfig BR2_PACKAGE_TVHEADEND
>  	bool "tvheadend"
>  	depends on !BR2_STATIC_LIBS # dladdr()
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> @@ -28,6 +28,31 @@ config BR2_PACKAGE_TVHEADEND
>  
>  if BR2_PACKAGE_TVHEADEND
>  
> +config BR2_PACKAGE_TVHEADEND_DESCRAMBLER
> +	bool "descrambler support"
> +	default y
> +	help
> +	  Enable support for various descrambler modules.
> +
> +config BR2_PACKAGE_TVHEADEND_IPTV
> +	bool "IPTV support"
> +	default y
> +	select BR2_PACKAGE_FFMPEG_FFMPEG if BR2_PACKAGE_FFMPEG # runtime
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
