From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Jun 2021 11:33:52 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/mesa3d: gallium/kmsro
 drivers require dri3 for X11
In-Reply-To: <20210612223011.26118-2-ps.report@gmx.net>
References: <20210612223011.26118-1-ps.report@gmx.net>
 <20210612223011.26118-2-ps.report@gmx.net>
Message-ID: <d7dd816f-fe5a-3cc5-0edc-a894bb7bb66e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/06/2021 00:30, Peter Seiderer wrote:
> - add upstream patch 0005-meson-kmsro-require-dri3-for-X11.patch
>   ([1])
> 
> - simplfy libxshmfence dependency, always depend on it if selected

 Maybe that should be done in a separate commit, with a better explanation why.

> 
> - select BR2_PACKAGE_MESA3D_DRI3 for all gallium/kmsro drivers in case
>   X11 is selected, see meson.build:
> 
>   240 with_gallium_kmsro = with_gallium_v3d or with_gallium_vc4 or with_gallium_etnaviv or with_gallium_panfrost or with_gallium_lima or with_gallium_freedreno
>   [...]
>   524 if with_gallium_kmsro and (with_platform_x11 and not with_dri3)
>   525   error('kmsro requires dri3 for X11 support')
>   526 endif

 Now *that's* an excellent explanation!

> 
> - select BR2_PACKAGE_XLIB_LIBXSHMFENCE for all gallium/kmsro drivers in case
>   X11 is selected, see meson.build:
> 
>   1897     if with_dri3
>   [...]
>   1907       dep_xshmfence = dependency('xshmfence', version : '>= 1.1')

 nitpick: I don't see the "in case X11 is selected" part in the quoted code.

> 
> Fixes:
> 
>   - https://bugs.busybox.net/show_bug.cgi?id=13831
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/commit/479bda78480d472e1f311bf0ea5b5fafb47ac7ba
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...005-meson-kmsro-require-dri3-for-X11.patch | 42 +++++++++++++++++++
>  package/mesa3d/Config.in                      | 18 ++++++++
>  package/mesa3d/mesa3d.mk                      |  8 ++--
>  3 files changed, 64 insertions(+), 4 deletions(-)
>  create mode 100644 package/mesa3d/0005-meson-kmsro-require-dri3-for-X11.patch
> 
> diff --git a/package/mesa3d/0005-meson-kmsro-require-dri3-for-X11.patch b/package/mesa3d/0005-meson-kmsro-require-dri3-for-X11.patch
> new file mode 100644
> index 0000000000..e20078b712
> --- /dev/null
> +++ b/package/mesa3d/0005-meson-kmsro-require-dri3-for-X11.patch
> @@ -0,0 +1,42 @@
> +From 945f32f09a010407035582712109d616dae31f6d Mon Sep 17 00:00:00 2001
> +From: Erico Nunes <nunes.erico@gmail.com>
> +Date: Thu, 10 Jun 2021 21:20:28 +0200
> +Subject: [PATCH] meson: kmsro: require dri3 for X11
> +
> +The current implementation in kmsro relies on buffer sharing using
> +WINSYS_HANDLE_TYPE_FD, which in x11 is only used by default when dri3
> +is enabled.
> +Since the current implementation will not work without it, we can
> +prevent user error by checking that it is not disabled at configuration
> +time.
> +
> +Closes #4861
> +
> +Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +Reviewed-by: Eric Engestrom <eric@engestrom.ch>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11305>
> +[Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/479bda78480d472e1f311bf0ea5b5fafb47ac7ba.patch]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + meson.build | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/meson.build b/meson.build
> +index e1e94e7..37b8868 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -521,6 +521,10 @@ if with_dri
> +   endif
> + endif
> + 
> ++if with_gallium_kmsro and (with_platform_x11 and not with_dri3)
> ++  error('kmsro requires dri3 for X11 support')
> ++endif
> ++
> + _vdpau = get_option('gallium-vdpau')
> + if _vdpau == 'true'
> +   _vdpau = 'enabled'
> +-- 
> +2.31.1
> +
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 36acd9758c..c8af2a17cb 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -105,7 +105,10 @@ comment "Gallium drivers"
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
>  	bool "Gallium Etnaviv driver"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7

 Given the quoted code above, I think all of these should be moved to
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER. The "depends on" would have to be copied, not
moved. Having it in the BR2_PACKAGE_MESA3D_GALLIUM_DRIVER is kind of redundant,
but it serves as a reminder to people adding gallium drivers that they need to
copy that dependency.

>  	select BR2_PACKAGE_LIBDRM_ETNAVIV
>  	help
>  	  Mesa driver for Vivante GPUs.
> @@ -118,7 +121,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>  	# can't see is just spurious. However, that dependency is about
>  	# the toolchain having sync4 primitives, which is always a given
>  	# for arm/aarch64.
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBDRM_FREEDRENO
>  	help
>  	  Mesa driver for Freedreno GPUs.
> @@ -145,7 +151,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>  	bool "Gallium lima driver"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
>  	help
>  	  Mesa driver for ARM Mali Utgard GPUs.
>  
> @@ -160,7 +169,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
>  	bool "Gallium panfrost driver"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7

 This, for example, makes me suspect that the libxshmfence select should really
be part of DRI3.


 Regards,
 Arnout

>  	help
>  	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
>  
> @@ -247,7 +259,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
>  	bool "Gallium v3d driver"
>  	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBDRM_VC4
>  	select BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	help
> @@ -261,7 +276,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>  	bool "Gallium vc4 driver"
>  	depends on BR2_arm || BR2_aarch64
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBDRM_VC4
>  	select BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	help
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index da6e55bf93..290295255a 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -29,6 +29,10 @@ MESA3D_CONF_OPTS = \
>  	-Dgallium-omx=disabled \
>  	-Dpower8=disabled
>  
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
> +MESA3D_DEPENDENCIES += xlib_libxshmfence
> +endif
> +
>  # Codesourcery ARM 2014.05 fail to link libmesa_dri_drivers.so with --as-needed linker
>  # flag due to a linker bug between binutils 2.24 and 2.25 (2.24.51.20140217).
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
> @@ -130,9 +134,6 @@ ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	-Ddri-drivers=
>  else
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
> -MESA3D_DEPENDENCIES += xlib_libxshmfence
> -endif
>  MESA3D_CONF_OPTS += \
>  	-Dshared-glapi=enabled \
>  	-Dglx-direct=true \
> @@ -143,7 +144,6 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	-Dvulkan-drivers=
>  else
> -MESA3D_DEPENDENCIES += xlib_libxshmfence
>  MESA3D_CONF_OPTS += \
>  	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
>  endif
> 
