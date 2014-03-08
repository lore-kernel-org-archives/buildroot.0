From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 15:21:01 +0100
Subject: [Buildroot] [PATCH v3 2/4] mesa3d: modularize and bump to
 version 10.0.3
In-Reply-To: <BLU0-SMTP97E4F8E4DBB4C0482F0C9D98A0@phx.gbl>
References: <1394285816-7111-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP97E4F8E4DBB4C0482F0C9D98A0@phx.gbl>
Message-ID: <20140308152101.38b8ac66@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 8 Mar 2014 14:36:54 +0100, Bernd Kuhls wrote:
> - add options to select mesa3d drivers

> +config BR2_PACKAGE_MESA3D_GBM
> +	depends on BR2_PACKAGE_UDEV

This is no longer possible: this option doesn't exist anymore. udev is
now a virtual package, so you should "depends on BR2_PACKAGE_HAS_UDEV",
and there should be a comment.

> +	bool "gbm support"

Maybe s/gbm/Graphics Buffer Manager/ ?

> +	help
> +	  Add support for Graphics Buffer Manager.
> +
> +config BR2_PACKAGE_MESA3D_XVMC
> +	bool "xvmc support"
> +	help
> +	  Add support for X Video Motion Compensation.
> +
> +config BR2_PACKAGE_MESA3D_VDPAU
> +	bool "vdpau support"
> +	help
> +	  Add support for Video Decode and Presentation API for Unix.
> +
> +endmenu
> +
> +# inform the .mk file of gallium or dri driver selection
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRIVER
> +	bool
> +
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRIVER
> +	depends on !BR2_PREFER_STATIC_LIB
> +	bool
> +
> +comment "DRI drivers need shared libdrm"
> +	depends on BR2_PREFER_STATIC_LIB
> +
> +config BR2_PACKAGE_MESA3D_DRIVER
> +	bool
> +
> +menu "Drivers"
> +
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
> +	bool "Gallium nouveau driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_LIBDRM_NOUVEAU
> +	help
> +	  Supports all Nvidia GPUs.
> +
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
> +	bool "Gallium vmware svga driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_LIBDRM_VMWGFX
> +	help
> +	  This is a virtual GPU driver for VMWare virtual machines.
> +
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> +	bool "Gallium swrast driver"
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	help
> +	  This is a software opengl implementation using the Gallium3D
> +	  infrastructure.
> +
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
> +	bool "DRI swrast driver"
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	help
> +	  This is a software opengl implementation using the DRI infrastructure.

Too long line. It should be wrapped at ~80 columns.

> +
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
> +	bool "DRI i965 driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	select BR2_PACKAGE_LIBDRM_INTEL
> +	select BR2_PACKAGE_MESA3D_OPENGL
> +	help
> +	  Supports all Intel GPUs.  This version is most supported by Intel.
> +
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
> +	bool "DRI radeon driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	select BR2_PACKAGE_LIBDRM_RADEON
> +	help
> +	  Legacy Radeon driver for R100 series GPUs.
> +
> +endmenu
> +
> +menu "API Support"
> +depends on BR2_PACKAGE_MESA3D_DRIVER
> +
> +config BR2_PACKAGE_MESA3D_OPENGL
> +	bool "OpenGL"
> +	help
> +	  Use the Khronos OpenGL API.  This is a desktop computer API and is not
> +	  normally implemented by embedded systems.
> +
> +config BR2_PACKAGE_MESA3D_EGL
> +	bool "EGL"
> +	depends on BR2_PACKAGE_UDEV

Ditto udev (see above).

> +	select BR2_PACKAGE_MESA3D_GBM
> +	select BR2_PACKAGE_HAS_OPENGL_EGL
> +	help
> +	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
> +	  similar to GLX, for X, and WGL, for Windows.
> +
> +config BR2_PACKAGE_MESA3D_OPENGL_ES
> +	bool "OpenGL ES"
> +	select BR2_PACKAGE_HAS_OPENGL_ES
> +	help
> +	  Use the Khronos OpenGL ES APIs.  This is commonly used on embedded
> +	  systems and represents a subset of the OpenGL API.
> +
> +config BR2_PACKAGE_MESA3D_OPENVG
> +	bool "OpenVG"
> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	depends on BR2_PACKAGE_UDEV

Ditto.

> +	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	select BR2_PACKAGE_HAS_OPENVG
> +	help
> +	  Use the Khronos OpenVG APIs. This is a 2D API commonly used on
> +	  embedded systems.
> +
> +endmenu
> +
> +config BR2_PACKAGE_PROVIDES_OPENGL_EGL
> +	default "mesa3d"
> +
> +config BR2_PACKAGE_PROVIDES_OPENGL_ES
> +	default "mesa3d"
> +
> +config BR2_PACKAGE_PROVIDES_OPENVG
> +	default "mesa3d"
> +
> +endif
> +
> +comment "mesa3d needs a toolchain w/ C++, largefile"
> +	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/mesa3d/mesa3d-uclibc-locale.patch b/package/mesa3d/mesa3d-uclibc-locale.patch
> deleted file mode 100644
> index 99afe8d..0000000
> --- a/package/mesa3d/mesa3d-uclibc-locale.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -[PATCH] Fix compilation on uClibc without locale support
> -
> -Based on similar patch from OE:
> -
> -http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch?id=e4039eb74b20e96d4b8837cd58cf2d13d091e1ad
> -
> -Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ----
> - configure.ac            |    3 +++
> - src/glsl/strtod.c       |    2 +-
> - src/mesa/main/imports.c |    2 +-
> - 3 files changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index fbaa376..454dad2 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -450,6 +450,9 @@ AC_SUBST([DLOPEN_LIBS])
> - dnl See if posix_memalign is available
> - AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
> - 
> -+dnl See if newlocale is available
> -+AC_CHECK_FUNCS_ONCE(newlocale)
> -+
> - dnl SELinux awareness.
> - AC_ARG_ENABLE([selinux],
> -     [AS_HELP_STRING([--enable-selinux],
> -diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
> -index a876e13..9fce7e9 100644
> ---- a/src/glsl/strtod.c
> -+++ b/src/glsl/strtod.c
> -@@ -44,7 +44,7 @@ double
> - double
> - glsl_strtod(const char *s, char **end)
> - {
> --#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
> -+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
> -    static locale_t loc = NULL;
> -    if (!loc) {
> -       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
> -diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
> -index d3727ef..363bf32 100644
> ---- a/src/mesa/main/imports.c
> -+++ b/src/mesa/main/imports.c
> -@@ -757,7 +757,7 @@ float
> - float
> - _mesa_strtof( const char *s, char **end )
> - {
> --#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
> -+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined(HAVE_NEWLOCALE)
> -    static locale_t loc = NULL;
> -    if (!loc) {
> -       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
> --- 
> -1.7.10.4
> -
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index d4080d4..a8c7726 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -4,31 +4,15 @@
>  #
>  ################################################################################
>  
> -MESA3D_VERSION = 7.10.3
> -MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
> -MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/older-versions/7.x/$(MESA3D_VERSION)
> +MESA3D_VERSION = 10.0.3
> +MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
> +MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
>  MESA3D_LICENSE = MIT, SGI, Khronos
>  MESA3D_LICENSE_FILES = docs/license.html
>  
> -MESA3D_AUTORECONF = YES
>  MESA3D_INSTALL_STAGING = YES
>  
> -MESA3D_CONF_OPT = \
> -	--disable-egl \
> -	--disable-glu \
> -	--disable-glw \
> -	--disable-glut \
> -	--disable-gallium \
> -	--with-driver=dri \
> -	--with-dri-drivers=swrast \
> -	--disable-static
> -
>  MESA3D_DEPENDENCIES = \
> -	xproto_glproto \
> -	xlib_libXxf86vm \
> -	xlib_libXdamage \
> -	xlib_libXfixes \
> -	xproto_dri2proto \
>  	libdrm \
>  	expat \
>  	host-xutil_makedepend \
> @@ -37,4 +21,100 @@ MESA3D_DEPENDENCIES = \
>  	host-bison \
>  	host-flex
>  
> +# Libraries
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
> +MESA3D_DEPENDENCIES += udev
> +MESA3D_CONF_OPT += --enable-gbm
> +else
> +MESA3D_CONF_OPT += --disable-gbm
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
> +MESA3D_DEPENDENCIES += \
> +	xproto_xf86driproto \
> +	xproto_dri2proto \
> +	xproto_glproto \
> +	xlib_libX11 \
> +	xlib_libXext \
> +	xlib_libXdamage \
> +	xlib_libXfixes \
> +	libxcb
> +MESA3D_CONF_OPT += \
> +	--enable-dri \
> +	--enable-xa \
> +	--enable-glx
> +else
> +MESA3D_CONF_OPT += \
> +	--disable-dri \
> +	--disable-xa \
> +	--disable-glx
> +endif
> +
> +ifneq ($(BR2_PREFER_STATIC_LIB),y)

ifeq ($(BR2_PREFER_STATIC_LIB),)

> +# fix for "configure: error: Cannot use static libraries for DRI drivers"
> +MESA3D_CONF_OPT += --disable-static
> +endif
> +
> +# Drivers
> +
> +#Gallium Drivers
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
> +# DRI Drivers
> +MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
> +MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
> +MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),y)

Why not testing if MESA3D_GALLIUM_DRIVERS-y is empty here instead of
having this additional hidden Kconfig boolean?

> +MESA3D_CONF_OPT += \
> +	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
> +else
> +MESA3D_CONF_OPT += --without-gallium-drivers
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)

Ditto here.

> +MESA3D_CONF_OPT += \
> +	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
> +else
> +MESA3D_CONF_OPT += --without-dri-drivers
> +endif
> +
> +# APIs
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_EGL),y)
> +MESA3D_EGL_PLATFORMS = drm
> +ifeq ($(BR2_PACKAGE_WAYLAND),y)
> +MESA3D_DEPENDENCIES += wayland
> +MESA3D_EGL_PLATFORMS += wayland
> +endif
> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
> +MESA3D_EGL_PLATFORMS += x11
> +endif
> +MESA3D_CONF_OPT += \
> +	--enable-egl \
> +	--with-egl-platforms=$(foreach subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
> +else
> +MESA3D_CONF_OPT += --disable-egl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL),y)
> +MESA3D_CONF_OPT += --enable-opengl
> +else
> +MESA3D_CONF_OPT += --disable-opengl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
> +MESA3D_CONF_OPT += --enable-gles1 --enable-gles2
> +else
> +MESA3D_CONF_OPT += --disable-gles1 --disable-gles2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENVG),y)
> +MESA3D_CONF_OPT += --enable-openvg --enable-gallium-egl
> +else
> +MESA3D_CONF_OPT += --disable-openvg --disable-gallium-egl
> +endif

In your Config.in, you have a dependency from EGL/OpenVG on udev, but
it isn't reflected here. Which one is correct?

> +
>  $(eval $(autotools-package))
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 576579b..034b591 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -99,7 +99,7 @@ else # modular
>  XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
>  endif
>  
> -ifeq ($(BR2_PACKAGE_MESA3D),y)
> +ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
>  XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
>  else
>  XSERVER_XORG_SERVER_CONF_OPT += --disable-dri
> @@ -172,7 +172,7 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
>  XSERVER_XORG_SERVER_CONF_OPT += --disable-dmx
>  endif
>  
> -ifeq ($(BR2_PACKAGE_MESA3D),y)
> +ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
>  XSERVER_XORG_SERVER_CONF_OPT += --enable-glx
>  else
>  XSERVER_XORG_SERVER_CONF_OPT += --disable-glx


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
