From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Jun 2021 11:25:36 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: add config option
 for DRI3 support
In-Reply-To: <20210612223011.26118-1-ps.report@gmx.net>
References: <20210612223011.26118-1-ps.report@gmx.net>
Message-ID: <689f1497-624c-01b3-d69a-97a5efd01740@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Peter,

On 13/06/2021 00:30, Peter Seiderer wrote:
> Add config option for DRI3 support and use it instead
> of DRI3 enable/disable logic in *.mk file.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/mesa3d/Config.in |  8 ++++++++
>  package/mesa3d/mesa3d.mk | 12 +++++++-----
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index d1b3af2054..36acd9758c 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -16,6 +16,11 @@ menuconfig BR2_PACKAGE_MESA3D
>  
>  if BR2_PACKAGE_MESA3D
>  
> +config BR2_PACKAGE_MESA3D_DRI3
> +	bool "Enable DRI3 support"

 Does it make sense to have this as a user-selectable option? Wouldn't it be
better to make this a blind option? (The latter has the advantage that we can
easily refactor it later, without legacy handling and stuff.)

 I just did a build with just DRI3 selected and it didn't install anything to
target or staging. This suggests that the option isn't useful on its own.

 More importantly: have you checked that DRI3 doesn't have any dependencies of
itself? Check the meson files to see if there are dependencies that are implied
directly by dri3 (i.e., maybe the xshmfence dependency comes from dri3 rather
than the individual dri driver). Those things should be moved around as well,
similar how they are put in BR2_PACKAGE_MESA3D_DRI_DRIVER instead of the
individual drivers.


 Series marked as Changes Requested.

 Regards,
 Arnout

> +	help
> +	  Enable DRI3 support.
> +
>  # Some Gallium driver needs libelf when built with LLVM support
>  config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
>  	bool
> @@ -65,6 +70,8 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
>  		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
>  		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
>  		!BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
> +	select BR2_PACKAGE_MESA3D_DRI3 if \
> +		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
>  		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
>  
> @@ -359,6 +366,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
>  	depends on BR2_PACKAGE_XORG7 # xorgproto
> +	select BR2_PACKAGE_MESA3D_DRI3
>  	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>  	select BR2_PACKAGE_XORGPROTO
>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 5c5f8a33f3..da6e55bf93 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -35,6 +35,12 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
>  MESA3D_CONF_OPTS += -Db_asneeded=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
> +MESA3D_CONF_OPTS += -Ddri3=enabled
> +else
> +MESA3D_CONF_OPTS += -Ddri3=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
>  MESA3D_DEPENDENCIES += host-llvm llvm
>  MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
> @@ -122,13 +128,10 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>  MESA3D_CONF_OPTS += \
> -	-Ddri-drivers= -Ddri3=disabled
> +	-Ddri-drivers=
>  else
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
>  MESA3D_DEPENDENCIES += xlib_libxshmfence
> -MESA3D_CONF_OPTS += -Ddri3=enabled
> -else
> -MESA3D_CONF_OPTS += -Ddri3=disabled
>  endif
>  MESA3D_CONF_OPTS += \
>  	-Dshared-glapi=enabled \
> @@ -142,7 +145,6 @@ MESA3D_CONF_OPTS += \
>  else
>  MESA3D_DEPENDENCIES += xlib_libxshmfence
>  MESA3D_CONF_OPTS += \
> -	-Ddri3=enabled \
>  	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
>  endif
>  
> 
