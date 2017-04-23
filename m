From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 10:00:15 +0200
Subject: [Buildroot] [PATCH v5 11/34] package/kodi: move rtmp support to
 new addon kodi-inputstream-rtmp
In-Reply-To: <20170417195433.26672-12-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-12-bernd.kuhls@t-online.de>
Message-ID: <20170423080015.GC2819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> rtmp support was moved from Kodi to an addon:
> https://github.com/xbmc/xbmc/commit/d04f43a4eb6f920cc42a28627b580f17e2be1bb5

So it means that, just after the bump to kodi-17 but before that patch,
rtmp is still selectable in menuconfig and --[en,dis]able-trmp is still
passed in CONF_OPTS, even though it now is a cmake package and so does
not take --[en,dis]able-foo options anymore...

The rtmp option should have been removed in the bump, with a legacy
entry added.

Then this patch would add the rtmp inputstream addon, and as a courtesy
to the user, add the select from the legacy option to the new package.

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy       | 7 +++++++
>  package/kodi/Config.in | 7 -------
>  package/kodi/kodi.mk   | 7 -------
>  3 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a13e4453b..5dddff6e3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.05"
>  
> +config BR2_PACKAGE_KODI_RTMPDUMP
> +	bool "kodi rtmp"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
> +	help
> +	  Internal rtmp support was moved to addon kodi-inputstream-rtmp
> +
>  config BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN
>  	bool "kodi-visualisation-fountain has been removed"
>  	select BR2_LEGACY
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 85dba3489..95f9f65ea 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -179,13 +179,6 @@ config BR2_PACKAGE_KODI_NONFREE
>  	  Enable components with non-free licenses. This option
>  	  currently only controls support for RAR archives.
>  
> -config BR2_PACKAGE_KODI_RTMPDUMP
> -	bool "rtmp"
> -	select BR2_PACKAGE_RTMPDUMP
> -	help
> -	  Enable RTMP input support.
> -	  Select this if you want to play back rtmp stream.
> -
>  config BR2_PACKAGE_KODI_LIBSHAIRPLAY
>  	bool "shairport"
>  	select BR2_PACKAGE_LIBSHAIRPLAY
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 357776779..dbe2fcd62 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -245,13 +245,6 @@ else
>  KODI_CONF_OPTS += -DENABLE_NFS=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_KODI_RTMPDUMP),y)
> -KODI_DEPENDENCIES += rtmpdump
> -KODI_CONF_OPTS += --enable-rtmp
> -else
> -KODI_CONF_OPTS += --disable-rtmp
> -endif
> -
>  ifeq ($(BR2_PACKAGE_KODI_LIBBLURAY),y)
>  KODI_DEPENDENCIES += libbluray
>  KODI_CONF_OPTS += -DENABLE_BLURAY=ON
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
