From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2013 19:43:55 +0200
Subject: [Buildroot] [PATCH 6/6] glmark2: new package
In-Reply-To: <1377373321-29732-7-git-send-email-spenser@gillilanding.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-7-git-send-email-spenser@gillilanding.com>
Message-ID: <521B93DB.8010401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/13 21:42, Spenser Gilliland wrote:
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>   package/Config.in                                  |   1 +
>   package/glmark2/Config.in                          |  49 ++++++++++
>   package/glmark2/glmark2-add-mali-support.patch     | 102 +++++++++++++++++++++
>   package/glmark2/glmark2-fix-add-GLchar.patch       |  17 ++++
>   .../glmark2-gl-to-glesv2-on-drm-flavor.patch       |  25 +++++
>   package/glmark2/glmark2.mk                         |  70 ++++++++++++++
>   6 files changed, 264 insertions(+)
>   create mode 100644 package/glmark2/Config.in
>   create mode 100644 package/glmark2/glmark2-add-mali-support.patch
>   create mode 100644 package/glmark2/glmark2-fix-add-GLchar.patch
>   create mode 100644 package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch

  Have these patches been sent upstream?

>   create mode 100644 package/glmark2/glmark2.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2b8bef0..ebe8cb4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -24,6 +24,7 @@ source "package/dstat/Config.in"
>   source "package/dmalloc/Config.in"
>   source "package/dropwatch/Config.in"
>   source "package/gdb/Config.in"
> +source "package/glmark2/Config.in"
>   source "package/iozone/Config.in"
>   source "package/kexec/Config.in"
>   source "package/latencytop/Config.in"
> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> new file mode 100644
> index 0000000..47ed221
> --- /dev/null
> +++ b/package/glmark2/Config.in
> @@ -0,0 +1,49 @@
> +config BR2_PACKAGE_GLMARK2
> +	bool "glmark2"
> +	depends on BR2_PACKAGE_MESA3D
> +	depends on BR2_PACKAGE_MESA3D_GBM

  I would think that a select is more appropriate here.

> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_HAS_OPENGL || \
> +		(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBPNG12
> +	select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_i386 || BR2_x86_64 # libdrm
> +	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS # libdrm

  These selects are redundant, they're done by libdrm...

> +	help
> +	  glmark2 is a benchmark for OpenGL (ES) 2.0. It uses only the subset of the
> +	  OpenGL 2.0 API that is compatible with OpenGL ES 2.0.
> +
> +if BR2_PACKAGE_GLMARK2
> +
> +config BR2_PACKAGE_GLMARK2_X11
> +	bool "X11"
> +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
> +	help
> +	 Use X11 window for display.

  Since this is a benchmark tool, I don't really think it is necessary to 
make the backends configurable. Just include any backend that is available.

  You would probably want a "depends on" in the top symbol to make sure 
at least one backend is available.

> +
> +config BR2_PACKAGE_GLMARK2_EGL
> +	bool "EGL"
> +	default y
> +	depends on BR2_PACKAGE_HAS_OPENGL_EGL
> +	help
> +	  Use EGL window for display.
> +
> +config BR2_PACKAGE_GLMARK2_OPENGL
> +	bool "Install Desktop OpenGL 2.0 Version"
> +	default y
> +	depends on BR2_PACKAGE_HAS_OPENGL
> +	help
> +	  Enable desktop OpenGL version.
> +
> +config BR2_PACKAGE_GLMARK2_OPENGL_ES
> +	bool "Install OpenGL ES 2.0 Version"
> +	default y
> +	depends on BR2_PACKAGE_HAS_OPENGL_ES
> +	help
> +	  Enable OpenGL ES 2.0 Version.
> +
> +endif
> +
> +comment "glmark2 requires an OpenGL implementation and many X libraries"

  Actually just mesa3d AFAICS, so "many X libraries" is an exaggeration.

> +	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES \
> +		|| !BR2_PACKAGE_XORG7
[snip]
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> new file mode 100644
> index 0000000..47b464b
> --- /dev/null
> +++ b/package/glmark2/glmark2.mk
> @@ -0,0 +1,70 @@
> +################################################################################
> +#
> +# glmark2
> +#
> +################################################################################
> +
> +GLMARK2_VERSION = 279
> +GLMARK2_SITE = http://bazaar.launchpad.net/~laanwj/glmark2/fbdev
> +GLMARK2_SITE_METHOD = bzr
> +GLMARK2_SOURCE = glmark2-$(GLMARK2_VERSION).tar.gz
> +GLMARK2_LICENSE = GPLv3+ SGIv1
> +GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
> +
> +GLMARK2_DEPENDENCIES = jpeg libpng12 mesa3d host-python host-pkgconf
> +
> +GLMARK2_CONF_OPTS = --prefix=/usr/
> +
> +ifeq ($(BR2_PACKAGE_GLMARK2_X11)$(BR2_PACKAGE_GLMARK2_OPENGL_ES),yy)
> +GLMARK2_DEPENDENCIES += libegl libgles
> +GLMARK2_FLAVORS += x11-glesv2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLMARK2_X11)$(BR2_PACKAGE_GLMARK2_OPENGL),yy)
> +GLMARK2_DEPENDENCIES += libgl
> +GLMARK2_FLAVORS += x11-gl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLMARK2_EGL)$(BR2_PACKAGE_GLMARK2_OPENGL_ES),yy)
> +GLMARK2_DEPENDENCIES += libdrm libegl libgles
> +GLMARK2_FLAVORS += drm-glesv2 fbdev-glesv2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLMARK2_EGL)$(BR2_PACKAGE_GLMARK2_OPENGL),yy)
> +GLMARK2_DEPENDENCIES += libdrm libgl
> +GLMARK2_FLAVORS += drm-gl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_GLMARK2_OPENGL_ES),yy)
> +GLMARK2_DEPENDENCIES += wayland libegl libgles
> +GLMARK2_FLAVORS += wayland-glesv2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_GLMARK2_OPENGL),yy)
> +GLMARK2_DEPENDENCIES += wayland libgl
> +GLMARK2_FLAVORS += wayland-gl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
> +GLMARK2_CONF_OPTS += --for-mali
> +endif
> +
> +null :=
> +space := $(null) #
> +comma := ,

  space and comma are already defined in the top-level Makefile, and used 
in a few other packages as well.

> +
> +GLMARK2_CONF_OPTS += --with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
> +
> +define GLMARK2_CONFIGURE_CMDS
> +cd $(@D) && $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) ./waf configure $(GLMARK2_CONF_OPTS)

  Indent with a tab (same for other _CMDS).


  Regards,
  Arnout

> +endef
> +
> +define GLMARK2_BUILD_CMDS
> +cd $(@D) && $(TARGET_MAKE_ENV) ./waf
> +endef
> +
> +define GLMARK2_INSTALL_TARGET_CMDS
> +cd $(@D) && $(TARGET_MAKE_ENV) ./waf install --destdir=$(TARGET_DIR)
> +endef
> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
