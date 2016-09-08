From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 23:17:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 glamor depends on libgl
In-Reply-To: <20160905121831.12790-1-bernd.kuhls@t-online.de>
References: <20160905121831.12790-1-bernd.kuhls@t-online.de>
Message-ID: <20160908231717.549fdddc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Sep 2016 14:18:31 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/1f6/1f6131c25738577afd8e097d126e8166cbcfcdd8/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 85d7e98..51c3efc 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -214,7 +214,7 @@ endif
>  ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
>  XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
> -ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yy)
>  XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
>  endif

I have applied, but I am not sure it is entirely correct. Indeed,
Glamor is apparently capable of using OpenGL ES (see
https://www.x.org/wiki/Events/XDC2014/XDC2014PackardGlamor/glamor-1.pdf).

However, libepoxy indeed only enables GLX support when full OpenGL
support is enabled. But it is also possible to have OpenGL ES support
under X11: it is for example the case for the imx-gpu-viv OpenGL ES
implementation.

So I'm wondering if:

ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_XLIB_LIBX11),yy)
LIBEPOXY_CONF_OPTS += --enable-glx
LIBEPOXY_DEPENDENCIES += libgl xlib_libX11
else
LIBEPOXY_CONF_OPTS += --disable-glx
endif

is entirely correct. I've Cc'ed Gustavo so that a discussion can take
place on this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
