From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 14:50:16 +0200
Subject: [Buildroot] [PATCH RFC 1/1] package/mesa3d: switch build system
 to meson
In-Reply-To: <20190411183158.19935-1-bernd.kuhls@t-online.de>
References: <20190411183158.19935-1-bernd.kuhls@t-online.de>
Message-ID: <d9737376-4fb0-5bd8-0ccb-0757e6c19d29@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/04/2019 20:31, Bernd Kuhls wrote:
> Remove all patches related to autotools.

 Good that you do that, however...

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> This patch is only slightly tested, expect breakages ;)
> 
>  ...vert-order-for-wayland-scanner-check.patch |  51 ---------
>  .../mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch   |  37 ------
>  package/mesa3d/Config.in                      |   3 -
>  package/mesa3d/mesa3d.mk                      | 108 ++++++++----------
>  4 files changed, 48 insertions(+), 151 deletions(-)
>  delete mode 100644 package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
>  delete mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
> 
> diff --git a/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
> deleted file mode 100644
> index 5135528795..0000000000
> --- a/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From ef96bac7cbbb11b98606864ead0f731dd5b71d5a Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Thu, 17 Nov 2016 15:36:54 -0300
> -Subject: [PATCH] configure.ac: invert order for wayland-scanner check
> -
> -When cross-compiling the .pc file might point to the wrong
> -wayland-scanner binary (target rather than host) resulting in a
> -non-executable and wrong scanner.
> -Try searching the PATH first, and if that fails fall back into
> -pkg-config.

 AFAICS meson *only* looks at pkg-config for wayland-scanner. It does use

dep_wl_scanner = dependency('wayland-scanner', native: true)

so in theory it should look for the host wayland-scanner rather than the target
one, but I'm not sure if we set up meson in a way that it would be able to make
that distinction.

[snip]
> --- a/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 94bceeb621e36f3188c6246a763def8695526578 Mon Sep 17 00:00:00 2001
> -From: Valentin Korenblit <valentinkorenblit@gmail.com>
> -Date: Sat, 20 Oct 2018 10:56:23 +0200
> -Subject: [PATCH] Set proper value for LIBCLC_INCLUDEDIR
> -
> -LIBCLC_INCLUDEDIR is the location where mesa3d OpenCL implementation
> -will look for OpenCL "headers" on the target, when building the OpenCL
> -kernels.
> -
> -The value returned by pkg-config for includedir is relevant when
> -cross-compiling, on the build machine. But in this specific case, we
> -really need a value that is valid on the target.
> -
> -Those headers are installed by the libclc package in /usr/share so
> -that they are not removed by Buildroot target-finalize logic.

 The meson infrastructure uses

'-DLIBCLC_INCLUDEDIR="@0@/"'.format(dep_clc.get_pkgconfig_variable('includedir'))

which I expect will give no joy either.

[snip]
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 3f44e94229..6070e5e039 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -129,7 +129,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
>  	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
>  	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
>  	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
> -	select BR2_PACKAGE_MESA3D_NEEDS_XA

 Why does this get removed?

>  	help
>  	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
>  
> @@ -151,7 +150,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
>  	select BR2_PACKAGE_LLVM_AMDGPU
>  	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
> -	select BR2_PACKAGE_MESA3D_NEEDS_XA
>  	help
>  	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
>  
> @@ -184,7 +182,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
>  	select BR2_PACKAGE_LIBDRM_VC4
> -	select BR2_PACKAGE_MESA3D_NEEDS_XA
>  	select BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	help
>  	  Driver for Broadcom VC4 (rpi2/3) GPUs.
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 02c8a8a57a..67edab89af 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -21,31 +21,22 @@ MESA3D_PROVIDES =
>  MESA3D_DEPENDENCIES = \
>  	host-bison \
>  	host-flex \
> +	host-python3-mako \

 Why does this get added?

>  	expat \
>  	libdrm \
>  	zlib
>  
> -# Disable assembly usage.
> -MESA3D_CONF_OPTS = --disable-asm
> -
> -# autotools are deprecated in favour of meson, for now force autotools
> -MESA3D_CONF_OPTS += --enable-autotools
> -
> -# Disable static, otherwise configure will fail with: "Cannot enable both static
> -# and shared."
> -ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> -MESA3D_CONF_OPTS += --disable-static
> -endif
> +MESA3D_CONF_OPTS = \
> +	-Dasm=false \
> +	-Dgallium-omx=disabled

 Why does this get added?

>  
>  ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
>  MESA3D_DEPENDENCIES += host-llvm llvm
> -MESA3D_CONF_OPTS += \
> -	--with-llvm-prefix=$(STAGING_DIR)/usr \
> -	--enable-llvm-shared-libs \
> -	--enable-llvm
> +MESA3D_CONF_ENV += LLVM_CONFIG=$(STAGING_DIR)/usr/bin/llvm-config
> +MESA3D_CONF_OPTS += -Dllvm=true
>  else
>  # Avoid automatic search of llvm-config
> -MESA3D_CONF_OPTS += --disable-llvm
> +MESA3D_CONF_OPTS += -Dllvm=false
>  endif
>  
>  # Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
> @@ -53,11 +44,9 @@ endif
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
>  MESA3D_PROVIDES += libopencl
>  MESA3D_DEPENDENCIES += clang libclc
> -MESA3D_CONF_OPTS += --enable-opencl \
> -	--disable-opencl-icd \

 No equivalent of this is needed?

> -	--with-clang-libdir=$(STAGING_DIR)/usr/lib
> +MESA3D_CONF_OPTS += -Dgallium-opencl=standalone

 Can you explain what are the options, and why standalone is chosen?

>  else
> -MESA3D_CONF_OPTS += --disable-opencl
> +MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
> @@ -82,17 +71,17 @@ MESA3D_DEPENDENCIES += \
>  	xlib_libXxf86vm \
>  	xorgproto \
>  	libxcb
> -MESA3D_CONF_OPTS += --enable-glx --disable-mangling
> +MESA3D_CONF_OPTS += -Dglx=auto
>  # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
>  ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
> -MESA3D_CONF_OPTS += --enable-xa
> +MESA3D_CONF_OPTS += -Dgallium-xa=true
>  else
> -MESA3D_CONF_OPTS += --disable-xa
> +MESA3D_CONF_OPTS += -Dgallium-xa=false
>  endif
>  else
>  MESA3D_CONF_OPTS += \
> -	--disable-glx \
> -	--disable-xa
> +	-Dglx=disabled \
> +	-Dgallium-xa=false
>  endif
>  
>  # Drivers
> @@ -112,63 +101,62 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
>  MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
> -MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
> +MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100

 Please explain this in the commit message.

>  # Vulkan Drivers
>  MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
>  MESA3D_CONF_OPTS += \
> -	--without-gallium-drivers \
> -	--disable-gallium-extra-hud
> +	-Dgallium-drivers= \
> +	-Dgallium-extra-hud=false
>  else
>  MESA3D_CONF_OPTS += \
> -	--enable-shared-glapi \
> -	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
> -	--enable-gallium-extra-hud
> +	-Dshared-glapi=true \
> +	-Dgallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
> +	-Dgallium-extra-hud=true
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>  MESA3D_CONF_OPTS += \
> -	--without-dri-drivers --disable-dri3
> +	-Ddri-drivers= -Ddri3=false
>  else
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
>  MESA3D_DEPENDENCIES += xlib_libxshmfence
> -MESA3D_CONF_OPTS += --enable-dri3
> +MESA3D_CONF_OPTS += -Ddri3=true
>  else
> -MESA3D_CONF_OPTS += --disable-dri3
> +MESA3D_CONF_OPTS += -Ddri3=false
>  endif
>  MESA3D_CONF_OPTS += \
> -	--enable-shared-glapi \
> -	--enable-driglx-direct \
> -	--with-dri-driverdir=/usr/lib/dri \

 No need to specify this anymore?


 Regards,
 Arnout

> -	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
> +	-Dshared-glapi=true \
> +	-Dglx-direct=true \
> +	-Ddri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
>  MESA3D_CONF_OPTS += \
> -	--without-vulkan-drivers
> +	-Dvulkan-drivers=
>  else
>  MESA3D_DEPENDENCIES += xlib_libxshmfence
>  MESA3D_CONF_OPTS += \
> -	--enable-dri3 \
> -	--with-vulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
> +	-Ddri3=true \
> +	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
>  endif
>  
>  # APIs
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
> -MESA3D_CONF_OPTS += --enable-osmesa
> +MESA3D_CONF_OPTS += -Dosmesa=classic
>  else
> -MESA3D_CONF_OPTS += --disable-osmesa
> +MESA3D_CONF_OPTS += -Dosmesa=none
>  endif
>  
>  # Always enable OpenGL:
>  #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
> -MESA3D_CONF_OPTS += --enable-opengl --enable-dri
> +MESA3D_CONF_OPTS += -Dopengl=true -Dglx=dri
>  
>  # libva and mesa3d have a circular dependency
>  # we do not need libva support in mesa3d, therefore disable this option
> -MESA3D_CONF_OPTS += --disable-va
> +MESA3D_CONF_OPTS += -Dgallium-va=false
>  
>  # libGL is only provided for a full xorg stack
>  ifeq ($(BR2_PACKAGE_XORG7),y)
> @@ -201,51 +189,51 @@ MESA3D_PLATFORMS += x11
>  endif
>  
>  MESA3D_CONF_OPTS += \
> -	--with-platforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
> +	-Dplatforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>  MESA3D_PROVIDES += libegl
>  MESA3D_CONF_OPTS += \
> -	--enable-gbm \
> -	--enable-egl
> +	-Dgbm=true \
> +	-Degl=true
>  else
>  MESA3D_CONF_OPTS += \
> -	--disable-egl
> +	-Degl=true=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
>  MESA3D_PROVIDES += libgles
> -MESA3D_CONF_OPTS += --enable-gles1 --enable-gles2
> +MESA3D_CONF_OPTS += -Dgles1=true -Dgles2=true
>  else
> -MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
> +MESA3D_CONF_OPTS += -Dgles1=false -Dgles2=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
>  MESA3D_DEPENDENCIES += xlib_libXvMC
> -MESA3D_CONF_OPTS += --enable-xvmc
> +MESA3D_CONF_OPTS += -Dgallium-xvmc=true
>  else
> -MESA3D_CONF_OPTS += --disable-xvmc
> +MESA3D_CONF_OPTS += -Dgallium-xvmc=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
> -MESA3D_CONF_OPTS += --enable-libunwind
> +MESA3D_CONF_OPTS += -Dlibunwind=true
>  MESA3D_DEPENDENCIES += libunwind
>  else
> -MESA3D_CONF_OPTS += --disable-libunwind
> +MESA3D_CONF_OPTS += -Dlibunwind=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
>  MESA3D_DEPENDENCIES += libvdpau
> -MESA3D_CONF_OPTS += --enable-vdpau
> +MESA3D_CONF_OPTS += -Dgallium-vdpau=true
>  else
> -MESA3D_CONF_OPTS += --disable-vdpau
> +MESA3D_CONF_OPTS += -Dgallium-vdpau=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
> -MESA3D_CONF_OPTS += --enable-lmsensors
> +MESA3D_CONF_OPTS += -Dlmsensors=true
>  MESA3D_DEPENDENCIES += lm-sensors
>  else
> -MESA3D_CONF_OPTS += --disable-lmsensors
> +MESA3D_CONF_OPTS += -Dlmsensors=false
>  endif
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> 
