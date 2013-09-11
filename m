From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Sep 2013 07:47:28 +0200
Subject: [Buildroot] [PATCH v2 6/7] glmark2: new package
In-Reply-To: <1378441521-10050-7-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-7-git-send-email-spenser@gillilanding.com>
Message-ID: <523003F0.5050601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/13 06:25, Spenser Gilliland wrote:
>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>   package/Config.in                                  |   1 +
>   package/glmark2/Config.in                          |  16 ++++
>   package/glmark2/glmark2-add-mali-support.patch     | 102 +++++++++++++++++++++
>   package/glmark2/glmark2-fix-add-GLchar.patch       |  17 ++++
>   .../glmark2-gl-to-glesv2-on-drm-flavor.patch       |  25 +++++
>   package/glmark2/glmark2.mk                         |  69 ++++++++++++++
>   6 files changed, 230 insertions(+)
>   create mode 100644 package/glmark2/Config.in
>   create mode 100644 package/glmark2/glmark2-add-mali-support.patch
>   create mode 100644 package/glmark2/glmark2-fix-add-GLchar.patch
>   create mode 100644 package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch
>   create mode 100644 package/glmark2/glmark2.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 3a8bd6d..27bd70a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -25,6 +25,7 @@ source "package/dmalloc/Config.in"
>   source "package/dropwatch/Config.in"
>   source "package/duma/Config.in"
>   source "package/gdb/Config.in"
> +source "package/glmark2/Config.in"
>   source "package/iozone/Config.in"
>   source "package/kexec/Config.in"
>   source "package/latencytop/Config.in"
> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> new file mode 100644
> index 0000000..6dd7833
> --- /dev/null
> +++ b/package/glmark2/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_GLMARK2
> +	bool "glmark2"
> +	depends on BR2_PACKAGE_MESA3D

  I don't see why this should be a depends rather than a select.

> +	depends on BR2_PACKAGE_MESA3D_GBM # depends on udev cannot select

  I would make this

	depends on BR2_PACKAGE_UDEV
	select BR2_PACKAGE_MESA3D_GBM

and in the comment refer to udev instead of mesa3d.

> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_HAS_OPENGL || \
> +		(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBPNG12
> +	help
> +	  glmark2 is a benchmark for OpenGL (ES) 2.0. It uses only the subset of the

  Isn't this line too long?

> +	  OpenGL 2.0 API that is compatible with OpenGL ES 2.0.
> +
> +comment "glmark2 requires an OpenGL implementation and mesa3D to be enabled"
> +	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES \
> +		|| !BR2_PACKAGE_XORG7
[snip]
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> new file mode 100644
> index 0000000..b36eaf9
> --- /dev/null
> +++ b/package/glmark2/glmark2.mk
> @@ -0,0 +1,69 @@
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

  This is the default, and anyway irrelevant for VCS-extracted packages.

> +GLMARK2_LICENSE = GPLv3+ SGIv1
> +GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
> +
> +GLMARK2_DEPENDENCIES = jpeg libpng12 mesa3d host-python host-pkgconf
> +
> +GLMARK2_CONF_OPTS = --prefix=/usr/
> +
> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER)$(BR2_PACKAGE_HAS_OPENGL_ES),yy)
> +GLMARK2_DEPENDENCIES += libegl libgles
> +GLMARK2_FLAVORS += x11-glesv2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER)$(BR2_PACKAGE_HAS_OPENGL),yy)
> +GLMARK2_DEPENDENCIES += libgl
> +GLMARK2_FLAVORS += x11-gl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL)$(BR2_PACKAGE_HAS_OPENGL_ES),yy)
> +GLMARK2_DEPENDENCIES += libdrm libegl libgles

  If you have this dependency here, you also should have the 
corresponding select in Config.in:

	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_OPENGL_EGL

(condition is simplified because in the opengl case libdrm is also needed).

  Oh, but libdrm is already a dependency of mesa3d. Then this dependency 
is in fact not needed.


  Regards,
  Arnout

> +GLMARK2_FLAVORS += drm-glesv2 fbdev-glesv2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL)$(BR2_PACKAGE_HAS_OPENGL),yy)
> +GLMARK2_DEPENDENCIES += libdrm libgl
> +GLMARK2_FLAVORS += drm-gl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_OPENGL_ES),yy)
> +GLMARK2_DEPENDENCIES += wayland libegl libgles
> +GLMARK2_FLAVORS += wayland-glesv2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_OPENGL),yy)
> +GLMARK2_DEPENDENCIES += wayland libgl
> +GLMARK2_FLAVORS += wayland-gl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
> +GLMARK2_CONF_OPTS += --for-mali
> +endif
> +
> +GLMARK2_CONF_OPTS += \
> +	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
> +
> +define GLMARK2_CONFIGURE_CMDS
> +	cd $(@D) && \
> +		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) ./waf configure \
> +		$(GLMARK2_CONF_OPTS)
> +endef
> +
> +define GLMARK2_BUILD_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./waf
> +endef
> +
> +define GLMARK2_INSTALL_TARGET_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./waf install --destdir=$(TARGET_DIR)
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
