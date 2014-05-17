From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 23:04:47 +0200
Subject: [Buildroot] [PATCH v8 26/28] xbmc: Add option for Goom
 screensaver
In-Reply-To: <1400342276-10303-27-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-27-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517210447.GO3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/Config.in |   11 +++++++++++
>  package/xbmc/xbmc.mk   |    6 ++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
> index 40a1f63..4b5276c 100644
> --- a/package/xbmc/Config.in
> +++ b/package/xbmc/Config.in
> @@ -131,6 +131,17 @@ config BR2_PACKAGE_XBMC_LIBMICROHTTPD
>  	help
>  	  Enable webserver feature
>  
> +config BR2_PACKAGE_XBMC_GOOM
> +	bool "goom screensaver"
> +	depends on BR2_i386 || BR2_x86_64 # it does not make sense to use goom on embedded archs

Why does it not make sense?

Surely, if an ARM platform has a full openGL implementation, what would
prevent the user to run the Goom screen saver at all?

Remove the depedns on x86.

> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	help
> +	  Enable goom screensaver
> +
> +comment "goom needs an OpenGL backend"
> +	depends on BR2_i386 || BR2_x86_64

Ditto, dependency on HAS_LIBGL should be enough.

Regards,
Yann E. MORIN.

> +	depends on !BR2_PACKAGE_HAS_LIBGL
> +
>  config BR2_PACKAGE_XBMC_LIBNFS
>  	bool "nfs"
>  	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 361380d..a18b82a 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -110,6 +110,12 @@ else
>  XBMC_CONF_OPT += --disable-libmp3lame
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XBMC_GOOM),y)
> +XBMC_CONF_OPT += --enable-goom
> +else
> +XBMC_CONF_OPT += --disable-goom
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
>  XBMC_DEPENDENCIES += libusb-compat
>  XBMC_CONF_OPT += --enable-libusb
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
