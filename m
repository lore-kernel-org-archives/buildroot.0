From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 12:20:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Fix dri checks
In-Reply-To: <1438574170-922-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438574170-922-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56028B1B.5040004@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

I have tested your patch and indeed fixes the problem. But I have some
comments regarding your commit log.

On 08/03/2015 04:56 AM, Bernd Kuhls wrote:
> "MESA3D_EGL_PLATFORMS = drm" is only needed when dri drivers are enabled:

That line is longer than 72 characters.

> http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=10.6#n1641

What I see at the line 1641 of that URL is this:

--------------
if test "x$WAYLAND_SCANNER" = x; then
			AC_MSG_ERROR([wayland-scanner is needed to compile the wayland egl
platform])
		fi
		;;
--------------

I think you probably mean line #1650, which has:

--------------
drm)
		test "x$enable_gbm" = "xno" &&
			AC_MSG_ERROR([EGL platform drm needs gbm])
		test "x$have_libdrm" != xyes &&
			AC_MSG_ERROR([EGL platform drm requires libdrm >= $LIBDRM_REQUIRED])
		;;
--------------

> Unconditionally enable dri support, also for gallium drivers, quoting
> http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=10.6#n1382
> 
>         # Strictly speaking libgbm does not require --enable-dri, although
>         # both of its backends do. Thus one can build libgbm without any
>         # backends if --disable-dri is set.
>         # To avoid unnecessary complexity of checking if at least one backend
>         # is available when building, just mandate --enable-dri.
>         AC_MSG_ERROR([gbm requires --enable-dri])

Due to the spaces at the beginning of those lines, some of them are
longer than 72 characters. Perhaps you could remove those unnecessary
spaces.

Regards,

Vincent.

> 
> Fixes
> http://autobuild.buildroot.net/results/799/799f505594f668154af38cb2c2a1ed8a90337e9f/
> http://autobuild.buildroot.net/results/d00/d00fe349e8710a1ad557507cf04b006216806868/
> http://autobuild.buildroot.net/results/c7b/c7ba08c8cf54b2e7cf28c5e3454e92a408e724db/
> http://autobuild.buildroot.net/results/cd7/cd717c9a3a1b0080192e7e765d990cce55513005/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 67408a3..e2deb08 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -93,7 +93,7 @@ endef
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>  MESA3D_CONF_OPTS += \
> -	--without-dri-drivers --disable-dri --disable-dri3
> +	--without-dri-drivers --disable-dri3
>  MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
>  else
>  ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
> @@ -107,7 +107,6 @@ MESA3D_DEPENDENCIES += xlib_libXxf86vm
>  endif
>  MESA3D_PROVIDES += libgl
>  MESA3D_CONF_OPTS += \
> -	--enable-dri \
>  	--enable-shared-glapi \
>  	--enable-driglx-direct \
>  	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
> @@ -119,7 +118,7 @@ endif
>  #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
>  #   - but if no DRI driver is enabled, then libgl is not built,
>  #     remove dri.pc and gl.pc in this case (MESA3D_REMOVE_OPENGL_PC)
> -MESA3D_CONF_OPTS += --enable-opengl
> +MESA3D_CONF_OPTS += --enable-opengl --enable-dri
>  
>  # libva and mesa3d have a circular dependency
>  # we do not need libva support in mesa3d, therefore disable this option
> @@ -127,7 +126,9 @@ MESA3D_CONF_OPTS += --disable-va
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>  MESA3D_PROVIDES += libegl
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
>  MESA3D_EGL_PLATFORMS = drm
> +endif
>  ifeq ($(BR2_PACKAGE_WAYLAND),y)
>  MESA3D_DEPENDENCIES += wayland
>  MESA3D_EGL_PLATFORMS += wayland
> 
