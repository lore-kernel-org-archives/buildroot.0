From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 23:22:34 +0100
Subject: [Buildroot] [PATCH v5 1/1] glmark2: new package
In-Reply-To: <1416661540-9669-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416661540-9669-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141207222234.GK10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-22 14:05 +0100, Bernd Kuhls spake thusly:
> From: Spenser Gilliland <spenser@gillilanding.com>
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/glmark2/0001-libpng16.patch b/package/glmark2/0001-libpng16.patch
> new file mode 100644
> index 0000000..d47243c
> --- /dev/null
> +++ b/package/glmark2/0001-libpng16.patch
> @@ -0,0 +1,18 @@
> +glmark2: Add support for libpng16
> +
> +Patch sent upstream: https://github.com/glmark2/glmark2/issues/5

And it was accepted. :-)
So you may want to update the sha1 you use as _VERSIOPN to get rid of
that patch.

[--SNIP--]
> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> new file mode 100644
> index 0000000..9fbfb0d
> --- /dev/null
> +++ b/package/glmark2/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_GLMARK2_EGL_GLES
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_MESA3D
> +
> +config BR2_PACKAGE_GLMARK2_GL
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_MESA3D
> +
> +comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"
> +	depends on BR2_INSTALL_LIBSTDCPP # mesa3d

No need, you already depend on mesa3d.

> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_HAS_UDEV # mesa3d
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d

Ditto x2.

> +	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
> +
> +config BR2_PACKAGE_GLMARK2
> +	bool "glmark2"
> +	depends on BR2_INSTALL_LIBSTDCPP # mesa3d

Ditto.

> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_GLMARK2_GL || BR2_PACKAGE_GLMARK2_EGL_GLES
> +	depends on BR2_PACKAGE_HAS_UDEV # mesa3d
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d

Ditto x2.

> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBPNG
> +	help
> +	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
> +
> +	  https://github.com/glmark2/glmark2
> +
> +comment "glmark2 needs udev /dev management and a toolchain w/ C++, largefile, NPTL"
> +	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> new file mode 100644
> index 0000000..79db7fe
> --- /dev/null
> +++ b/package/glmark2/glmark2.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# glmark2
> +#
> +################################################################################
> +
> +GLMARK2_VERSION = 0005100d7221190720dc130605d07cbd56e83047
> +GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
> +GLMARK2_LICENSE = GPLv3+ SGIv1
> +GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
> +GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng mesa3d

Although this is currently correct because we really require mesa3d, I
think it would be better to handle it with the virtual packages:

    GLMARK2_DEPENDENCIES += \
        $(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
        $(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
        $(if $(BR2_PACKAGE_HAS_LIBGL),libgl)

And so on...

Currently, that would mean depending on mesa3d because of the Kconfig
options, but if/when we introduce another GL/EGL/... provider that is
appropriate, we'd just have to remove the depends on MESA3D in Kconfig.

> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> +GLMARK2_DEPENDENCIES += xlib_libX11
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> +GLMARK2_FLAVORS += x11-glesv2
> +endif
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +GLMARK2_FLAVORS += x11-gl
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> +GLMARK2_FLAVORS += drm-glesv2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL),yy)
> +GLMARK2_FLAVORS += drm-gl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
> +GLMARK2_DEPENDENCIES += wayland
> +GLMARK2_FLAVORS += wayland-glesv2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBGL),yy)
> +GLMARK2_DEPENDENCIES += wayland
> +GLMARK2_FLAVORS += wayland-gl
> +endif
> +
> +GLMARK2_CONF_OPTS += \
> +	--prefix=/usr \
> +	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
> +
> +define GLMARK2_CONFIGURE_CMDS
> +	cd $(@D) && \
> +		$(TARGET_MAKE_ENV) $(GLMARK2_CONF_ENV) $(TARGET_CONFIGURE_OPTS) \
> +		./waf configure $(GLMARK2_CONF_OPTS)

waf is, well, special. Did you have a look at package/samba4/samba4.mk
for how we call waf in cross-compilation? It seems to be tricky
enough... :-(

Regards,
Yann E. MORIN.

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
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
