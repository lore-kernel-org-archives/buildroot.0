From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 10:59:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/libepoxy: fix OpenGL /
 EGL dependencies
In-Reply-To: <1438973409-7174-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438973409-7174-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150808105957.3abc07b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  7 Aug 2015 20:50:09 +0200, Bernd Kuhls wrote:
> libepoxy depends on egl, opengl is an optional dependency
> 
> Fixes
> http://autobuild.buildroot.net/results/f7e/f7e6a42f53cb4ca523d2eeefde85c44770f6011e
> http://autobuild.buildroot.net/results/025/025a3d3b4d3dd4f496dcbf09f2dd279116250207
> 
> ---
> v3: split opengl/egl fix from version bump (Thomas)
> v3: bumped to v1.3.1, switched to pkgconf for rpi support
> v2: Add missing select lines to Config.in (Thomas)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Your SoB should go before the first "---", otherwise it gets removed by
Git when applying your patch.

> diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
> index d908893..7570226 100644
> --- a/package/x11r7/libepoxy/libepoxy.mk
> +++ b/package/x11r7/libepoxy/libepoxy.mk
> @@ -8,8 +8,12 @@ LIBEPOXY_VERSION = v1.2
>  LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
>  LIBEPOXY_INSTALL_STAGING = YES
>  LIBEPOXY_AUTORECONF = YES
> -LIBEPOXY_DEPENDENCIES = mesa3d
> +LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros libegl \
> +	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
>  LIBEPOXY_LICENSE = MIT
>  LIBEPOXY_LICENSE_FILES = COPYING
>  
> +# needed for rpi-userland
> +LIBEPOXY_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`

This is no-op: the package infrastructure doesn't understand
<pkg>_CFLAGS. So is it really needed? If yes, then you need:

LIBEPOXY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(LIBEPOXY_CFLAGS)"

Could you rework the patch accordingly? I could fix it myself, but I'd
like to know whether those CFLAGS are actually needed (I believe they
are since rpi-userland has headers in non-standard locations).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
