From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 08:24:35 +0100
Subject: [Buildroot] [PATCH v2 5/7] mesa3d: modularize and bump to
 version 10.0.3
In-Reply-To: <BLU0-SMTP47875A4E6642624302CE843D9AA0@phx.gbl>
References: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP47875A4E6642624302CE843D9AA0@phx.gbl>
Message-ID: <52F1E733.3030005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 19:15, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>

 The commit message should explain why the uclibc-locale patch and
AUTORECONF can be removed. It should also explain a bit better what
"modularize" means. And also explicitly warn that mesa3d no longer
depends on X and therefore must explicitly include the largefile
dependency. And maybe I'm forgetting something.

 And of course: keep Spenser's SoB.

> ---
> v2: bump to version 10.0.3
> v1: - rebased Spenser Gilliland?s patch, which originally bumped
>       version to 9.1.6 and removed mesa3d-uclibc-locale.patch:
>       http://patchwork.ozlabs.org/patch/278303/
>     - removed MESA3D_AUTORECONF=yes, not needed anymore
>     - fixed bug in variable naming
>       BR2_PACKAGE_MESA3D_DRI_DRIVERS_* -> BR2_PACKAGE_MESA3D_DRI_DRIVER_*
>       preventing DRI drivers from being built
>     - bump version to 10.0.2
> 
>  package/mesa3d/Config.in                           |  180 +++++++++++++++++++-
>  package/mesa3d/mesa3d-uclibc-locale.patch          |   56 ------
>  package/mesa3d/mesa3d.mk                           |  120 ++++++++++---
>  package/opengl/Config.in                           |    1 +
>  package/opengl/libegl/libegl.mk                    |    4 +
>  package/opengl/libgl/Config.in                     |    6 +
>  package/opengl/libgl/libgl.mk                      |   21 +++
>  package/opengl/libgles/libgles.mk                  |    4 +
>  package/opengl/libopenvg/libopenvg.mk              |    4 +
>  .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +-
>  10 files changed, 317 insertions(+), 83 deletions(-)
>  delete mode 100644 package/mesa3d/mesa3d-uclibc-locale.patch
>  create mode 100644 package/opengl/libgl/Config.in
>  create mode 100644 package/opengl/libgl/libgl.mk
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 0ce168e..b797dfb 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -1,14 +1,182 @@
>  config BR2_PACKAGE_MESA3D
>  	bool "Mesa 3D Graphics Library"
> -	select BR2_PACKAGE_XPROTO_GLPROTO
> -	select BR2_PACKAGE_XLIB_LIBXXF86VM
> -	select BR2_PACKAGE_XLIB_LIBXDAMAGE
> -	select BR2_PACKAGE_XLIB_LIBXFIXES
> -	select BR2_PACKAGE_XPROTO_DRI2PROTO
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
> -	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR

 This removes the following implicit dependencies (from XORG7):

        depends on BR2_USE_WCHAR
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on !BR2_PREFER_STATIC_LIB # dlopen in xlib_libX11

 Are you sure they are no longer needed? Actually, the same is true for
the libdrm patch that removes the XORG7 dependency.

> +	select BR2_PACKAGE_XPROTO_DRI2_PROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XSERVER_XORG_SERVER
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LARGEFILE
>  	help
>  	  Mesa 3D, an open-source implementation of the OpenGL specification.
> +
> +	  http://mesa3d.org
> +
> +if BR2_PACKAGE_MESA3D
> +
> +menu "libraries"
> +
> +config BR2_PACKAGE_MESA3D_GBM
> +	depends on BR2_PACKAGE_UDEV
> +	bool "gbm support"
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
> +menu "Drivers"
> +
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915

 I think it would be better named BR2_PACKAGE_MESA3D_DRIVER_GALLIUM_I915
so that all drivers start with the same substring. On second thought:
since the configure option has it like this, it is better to keep it
similar to the configure option.

> +	bool "Gallium i915 driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_LIBDRM_INTEL
> +	help
> +	  Supports intel chips with Gallium. In most cases, the DRI i965 driver
> +	  should be used as it is better maintained by Intel.
> +
[snip a bunch of drivers]
> +
> +endmenu
> +
> +# The following hidden options inform gallium or dri driver selection.

 I think it would be a bit clearer if these hidden options were defined
before the Drivers menu. Also, the ocmment should be "inform the .mk file
of gallium or dri driver selection".

> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRIVER
> +	bool
> +
> +config BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	select BR2_PACKAGE_MESA3D_DRIVER
> +	bool
> +
> +config BR2_PACKAGE_MESA3D_DRIVER
> +	bool
> +
> +menu "API Support"
> +depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || BR2_PACKAGE_MESA3D_DRI_DRIVER

 Isn't it simpler to write "depends on BR2_PACKAGE_MESA3D_DRIVER" ?

> +
> +config BR2_PACKAGE_MESA3D_OPENGL
> +	bool "OpenGL"
> +	select BR2_PACKAGE_HAS_OPENGL
> +	help
> +	  Use the Khronos OpenGL API.  This is a desktop computer API and is not
> +	  normally implemented by embedded systems.
> +
> +config BR2_PACKAGE_MESA3D_EGL
> +	bool "EGL"
> +	select BR2_PACKAGE_MESA3D_GBM
> +	select BR2_PACKAGE_HAS_OPENGL_EGL
> +	help
> +	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
> +	  similar to GLX, for X, and WGL, for Windows.
> +
> + config BR2_PACKAGE_MESA3D_OPENGL_ES
> +	bool "OpenGL ES"
> +	select BR2_PACKAGE_HAS_OPENGL_ES
> +	help
> +	  Use the Khronos OpenGL ES APIs.  This is commonly used on embedded
> +	  systems and represents a subset of the OpenGL API.
> +
> +config BR2_PACKAGE_MESA3D_OPENVG
> +	bool "OpenVG"
> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_HAS_OPENVG
> +	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	help
> +	  Use the Khronos OpenVG APIs. This is a 2D API commonly used on
> +	  embedded systems.
> +
> +config BR2_PACKAGE_MESA3D_OPENCL
> +	bool "OpenCL"
> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_HAS_OPENCL
> +	help
> +	  Use the Khronos OpenCL APIs. This is a GPU computation language
> +	  commonly used in GPGPU computing applications.
> +
> +endmenu
> +
> +endif
> +
> +comment "mesa3d depends on a toolchain with C++ and largefile support"

 "mesa3d needs a toolchain w/ C++, largefile"

> +	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/mesa3d/mesa3d-uclibc-locale.patch b/package/mesa3d/mesa3d-uclibc-locale.patch
> deleted file mode 100644
[snip]
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index d4080d4..f12a1f5 100644
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
> @@ -37,4 +21,102 @@ MESA3D_DEPENDENCIES = \
>  	host-bison \
>  	host-flex
>  
> +MESA3D_CONF_OPT = \
> +	--disable-static

 If this is really needed, then it should depend on !PREFER_STATIC and
the comment should be extended.

> +
> +# Libraries
[snip]
> diff --git a/package/opengl/Config.in b/package/opengl/Config.in
> index ed81835..02010a9 100644
> --- a/package/opengl/Config.in
> +++ b/package/opengl/Config.in
> @@ -1,4 +1,5 @@
>  source "package/opengl/libegl/Config.in"
> +source "package/opengl/libgl/Config.in"

 The addition of libgl should be a separate patch.

>  source "package/opengl/libgles/Config.in"
>  source "package/opengl/libopenvg/Config.in"
>  source "package/opengl/libopenmax/Config.in"
> diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
> index b2b74f1..8d8e6a4 100644
> --- a/package/opengl/libegl/libegl.mk
> +++ b/package/opengl/libegl/libegl.mk
> @@ -7,6 +7,10 @@
>  LIBEGL_SOURCE =
>  LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_EGL))
>  
> +ifeq ($(BR2_PACKAGE_MESA3D_EGL),y)
> +LIBEGL_DEPENDENCIES += mesa3d
> +endif

 We changed the way that this works. Instead, the mesa3d Config.in should
define BR2_PACKAGE_PROVIDES_OPENGL_EGL. Cfr. rpi-userland.

(I didn't look at the rest any more for lack of time).


 Regards,
 Arnout

> +
>  ifeq ($(LIBEGL_DEPENDENCIES),)
>  define LIBEGL_CONFIGURE_CMDS
>  	echo "No libEGL implementation selected. Configuration error."
> diff --git a/package/opengl/libgl/Config.in b/package/opengl/libgl/Config.in
> new file mode 100644
> index 0000000..5421c86
> --- /dev/null
> +++ b/package/opengl/libgl/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HAS_OPENGL_GL
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_OPENGL_GL
> +	depends on BR2_PACKAGE_HAS_OPENGL_GL
> +	string
> diff --git a/package/opengl/libgl/libgl.mk b/package/opengl/libgl/libgl.mk
> new file mode 100644
> index 0000000..f95a959
> --- /dev/null
> +++ b/package/opengl/libgl/libgl.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libgl
> +#
> +################################################################################
> +
> +LIBGL_SOURCE =
> +LIBGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_GL))
> +
> +ifeq ($(BR2_PACKAGE_MESA_OPENGL),y)
> +LIBGL_DEPENDENCIES += mesa3d
> +endif
> +
> +ifeq ($(LIBGL_DEPENDENCIES),)
> +define LIBGL_CONFIGURE_CMDS
> +	echo "No libGL implementation selected. Configuration error."
> +	exit 1
> +endef
> +endif
> +
> +$(eval $(generic-package))
> diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
> index 0dcbaa7..5c1e6d4 100644
> --- a/package/opengl/libgles/libgles.mk
> +++ b/package/opengl/libgles/libgles.mk
> @@ -7,6 +7,10 @@
>  LIBGLES_SOURCE =
>  LIBGLES_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_ES))
>  
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
> +LIBGLES_DEPENDENCIES += mesa3d
> +endif
> +
>  ifeq ($(LIBGLES_DEPENDENCIES),)
>  define LIBGLES_CONFIGURE_CMDS
>  	echo "No libGLES implementation selected. Configuration error."
> diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
> index ffd9d68..83c600b 100644
> --- a/package/opengl/libopenvg/libopenvg.mk
> +++ b/package/opengl/libopenvg/libopenvg.mk
> @@ -7,6 +7,10 @@
>  LIBOPENVG_SOURCE =
>  LIBOPENVG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENVG))
>  
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENVG),y)
> +LIBOPENVG_DEPENDENCIES += mesa3d
> +endif
> +
>  ifeq ($(LIBOPENVG_DEPENDENCIES),)
>  define LIBOPENVG_CONFIGURE_CMDS
>  	echo "No libOpenVG implementation selected. Configuration error."
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 4089aab..f5a4db6 100644
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
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
