From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Sep 2017 18:18:33 +0200
Subject: [Buildroot] [PATCH 1/4] package/tvheadend: add option to
 en-/disable transcoding support
In-Reply-To: <20170906204908.30036-1-bernd.kuhls@t-online.de>
References: <20170906204908.30036-1-bernd.kuhls@t-online.de>
Message-ID: <20170907161833.GB2973@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-09-06 22:49 +0200, Bernd Kuhls spake thusly:
> https://github.com/tvheadend/tvheadend/commit/014bb9505e1d7eb6e37e10931dd89ab3b1a0dc01
> extended the already present transcoding support and included vaapi-
> accelerated transcoding.
> 
> In order to support these new options and their numerous dependencies
> we add a new Kconfig option for transcoding support to allow users to
> disable transcoding support, because they use tvheadend for recording
> or by its internal hts protocol, for example with the kodi-pvr-hts
> addon.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/Config.in    | 18 ++++++++++++++----
>  package/tvheadend/tvheadend.mk |  2 +-
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index fc39d6f48..191593eab 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -10,10 +10,6 @@ config BR2_PACKAGE_TVHEADEND
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_DTV_SCAN_TABLES
> -	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
> -	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
> -	select BR2_PACKAGE_LIBVPX if BR2_PACKAGE_FFMPEG && !BR2_bfin # libvpx
> -	select BR2_PACKAGE_X264 if BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_OPENSSL
>  	help
> @@ -28,3 +24,17 @@ config BR2_PACKAGE_TVHEADEND
>  	      is available on port 9981.
>  	    - if you want Avahi support, you'll need to enable:
>  	          Avahi, D-Bus, libdaemon
> +
> +if BR2_PACKAGE_TVHEADEND
> +
> +config BR2_PACKAGE_TVHEADEND_TRANSCODING
> +	bool "transcoding support"
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
> +	select BR2_PACKAGE_FFMPEG_SWSCALE
> +	select BR2_PACKAGE_LIBVPX if !BR2_bfin # libvpx
> +	select BR2_PACKAGE_X264
> +	help
> +	  Enable transcoding support.
> +
> +endif
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 6c0eb6375..b1c1fcaf7 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -26,7 +26,7 @@ else
>  TVHEADEND_CONF_OPTS += --disable-dbus-1
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFMPEG),y)
> +ifeq ($(BR2_PACKAGE_TVHEADEND_TRANSCODING),y)
>  TVHEADEND_DEPENDENCIES += ffmpeg
>  TVHEADEND_CONF_OPTS += --enable-libav
>  else
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
