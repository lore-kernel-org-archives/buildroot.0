From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 23:01:08 +0200
Subject: [Buildroot] [PATCH v8 22/28] xbmc: Add VA-API support
In-Reply-To: <1400342276-10303-23-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-23-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517210108.GN3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 7fdaafc..6718d46 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -40,7 +40,6 @@ XBMC_CONF_OPT +=  \
>  	--disable-projectm \
>  	--disable-pulse \
>  	--disable-ssh \
> -	--disable-vaapi \
>  	--disable-vdpau \
>  	--disable-vtbdecoder \
>  	--enable-optimizations
> @@ -56,6 +55,14 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
>  XBMC_DEPENDENCIES += dbus
>  endif
>  
> +# xbmc needs libva & libva-glx
> +ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
> +XBMC_DEPENDENCIES += libva

Shouldn't it also depend on mesa3d, too?

Regards,
Yann E. MORIN.

> +XBMC_CONF_OPT += --enable-vaapi
> +else
> +XBMC_CONF_OPT += --disable-vaapi
> +endif
> +
>  ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
>  XBMC_DEPENDENCIES += \
>  	libglew \
> -- 
> 1.7.10.4
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
