From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 10:40:01 +0200
Subject: [Buildroot] [PATCH v5 14/34] package/kodi: add optional support
 for pulseaudio
In-Reply-To: <20170417195433.26672-15-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-15-bernd.kuhls@t-online.de>
Message-ID: <20170423084000.GG2819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 7 +++++++
>  package/kodi/kodi.mk   | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index e89644b56..c3f73e713 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -185,6 +185,13 @@ config BR2_PACKAGE_KODI_NONFREE
>  	  Enable components with non-free licenses. This option
>  	  currently only controls support for RAR archives.

The dependencies for libglib2 are not carried over here. That's
technically fine, because Kodi already has all those deps. But a small
comment would be nice; at least, state so in the commit log.

> +config BR2_PACKAGE_KODI_PULSEAUDIO
> +	bool "pulseaudio"
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_PULSEAUDIO

Pulseaudio has a dependency on SYNC_4, while kodi has a dependency on
SYNC_8.

Can we assume that a CPU with sync_8 will have sync_4? It would seem
weird that this would not be the case (i.e. sync_8 is stronger thann
sync_4), but I would not bet on it...

Please propagate the dependency on sync_4 from pulseaudi.

Regards,
Yann E. MORIN.

> +	help
> +	  Enable Pulseaudio support.
> +
>  config BR2_PACKAGE_KODI_LIBSHAIRPLAY
>  	bool "shairport"
>  	select BR2_PACKAGE_LIBSHAIRPLAY
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 5e4853b8b..6cc56718d 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -329,6 +329,13 @@ else
>  KODI_CONF_OPTS += -DENABLE_OPTICAL=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_KODI_PULSEAUDIO),y)
> +KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=ON
> +KODI_DEPENDENCIES += pulseaudio
> +else
> +KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
> +endif
> +
>  # Remove versioncheck addon, updating Kodi is done by building a new
>  # buildroot image.
>  KODI_ADDON_MANIFEST = $(TARGET_DIR)/usr/share/kodi/system/addon-manifest.xml
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
