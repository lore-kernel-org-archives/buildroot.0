From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 10:33:23 +0200
Subject: [Buildroot] [PATCH v5 13/34] package/kodi: libxslt is an
 optional package
In-Reply-To: <20170417195433.26672-14-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-14-bernd.kuhls@t-online.de>
Message-ID: <20170423083323.GF2819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> After this commit
> https://github.com/xbmc/xbmc/commit/bad3902b4a2538a433f858c97b2cf91c44c7feff
> libxslt is an optional package

This patch also removes the hard dependency on libxml2. However, the
patch you pointed to still requires that libxml2 be available when using
libxslt, but...

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 2 --
>  package/kodi/kodi.mk   | 9 +++++++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 6d4148899..e89644b56 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -71,8 +71,6 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_PACKAGE_LIBGCRYPT
>  	select BR2_PACKAGE_LIBPLIST
>  	select BR2_PACKAGE_LIBSAMPLERATE
> -	select BR2_PACKAGE_LIBXML2
> -	select BR2_PACKAGE_LIBXSLT
>  	select BR2_PACKAGE_LZO
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_OPENSSL
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 931f002f8..5e4853b8b 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -36,8 +36,6 @@ KODI_DEPENDENCIES = \
>  	libgcrypt \
>  	libplist \
>  	libsamplerate \
> -	libxml2 \
> -	libxslt \
>  	lzo \
>  	ncurses \
>  	openssl \
> @@ -194,6 +192,13 @@ else
>  KODI_CONF_OPTS += -DENABLE_CAP=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXSLT),y)
> +KODI_CONF_OPTS += -DENABLE_XSLT=ON
> +KODI_DEPENDENCIES += libxslt

... you no longer depend on libxml2 here.

Yes, libxslt already pulls in libxml2. But Kodi wants it for itself and
it explicitly checks for it, so you have to keep the dependency in Kodi.

Regards,
Yann E. MORIN.

> +else
> +KODI_CONF_OPTS += -DENABLE_XSLT=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_KODI_BLUEZ),y)
>  KODI_CONF_OPTS += -DENABLE_BLUETOOTH=ON
>  KODI_DEPENDENCIES += bluez5_utils
> -- 
> 2.11.0
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
