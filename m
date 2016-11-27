From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:48:45 +0100
Subject: [Buildroot] [PATCH/next 13/13]
 package/x11r7/xserver_xorg-server: add new version 1.19.0
In-Reply-To: <20161127110616.3451-13-bernd.kuhls@t-online.de>
References: <20161127110616.3451-1-bernd.kuhls@t-online.de>
 <20161127110616.3451-13-bernd.kuhls@t-online.de>
Message-ID: <20161127224845.3d21e38c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks again for taking care of the X.org stack. Much appreciated!

On Sun, 27 Nov 2016 12:06:16 +0100, Bernd Kuhls wrote:

> +config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
> +	bool "1.19.0"
> +	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
> +	select BR2_PACKAGE_XLIB_LIBXFONT2
> +	select BR2_PACKAGE_XPROTO_PRESENTPROTO
> +
>  config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
>  	bool "1.18.4"
>  	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
> +	select BR2_PACKAGE_XLIB_LIBXFONT
>  	select BR2_PACKAGE_XPROTO_PRESENTPROTO

Why are you keeping version 1.18 ? I think we should remove it.

We keep 1.17 because it's the only one that can work with the AMD
Catalyst driver, and we keep 1.14 because it's the only one that can
work with the NVidia Tegra driver. But 1.18 is not used by any
binary-only driver packaged in Buildroot, so I think we should no
longer support it as soon as we add support for 1.19.


> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 51c3efc..0ed215f 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -194,6 +194,14 @@ else
>  XSERVER_XORG_SERVER_CONF_OPTS += --disable-record
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXFONT2),y)
> +XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXfont2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXFONT),y)
> +XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXfont
> +endif

You forgot to remove the xlib_libXfont dependency from the main
XSERVER_XORG_SERVER_DEPENDENCIES definition. So in fact, even on 1.19
where you don't select xlib_libXfont at the Config.in level, it will be
built.

Also, regarding this xlib_libXfont thing, do you know if the other
packages that use it will be updated? We currently have:

  xapp_bdftopcf
  xapp_xfs
  xdriver_xf86-video-qxl

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
