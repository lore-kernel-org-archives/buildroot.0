From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 11:08:37 +0200
Subject: [Buildroot] [PATCH v2] package/glslsandbox-player: new package
In-Reply-To: <20190704212523.11818-1-juju@cotds.org>
References: <20190423192917.4081-1-juju@cotds.org>
 <20190704212523.11818-1-juju@cotds.org>
Message-ID: <20190803110837.5867241c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

Thanks for this contribution! It looks like a useful package for
Buildroot, and pretty good overall, but there are a few issues to
address, see below.

On Thu,  4 Jul 2019 23:25:23 +0200
Julien Olivain <juju@cotds.org> wrote:


> +if BR2_PACKAGE_GLSLSANDBOX_PLAYER
> +
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_DL_SHADERS
> +	bool "Download shaders from http://glslsandbox.com/"
> +	help
> +	  Download some shaders from http://glslsandbox.com/ to be
> +	  embedded in the binary

You can't let a package download stuff on its own, because it defeats
the Buildroot download infrastructure: "make source" will not know that
these additional files should be downloaded, those files will not be
cached on our sources.buildroot.net mirror, etc.

I'm not sure what gets downloaded exactly, but you can either get it
downloaded by Buildroot using <pkg>_EXTRA_DOWNLOADS in this package, or
create a separate package.

> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
> +	bool "Install scripts"
> +	depends on BR2_USE_MMU # bash, python
> +	depends on BR2_USE_WCHAR # python
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python
> +	depends on !BR2_STATIC_LIBS # python
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> +	select BR2_PACKAGE_PYTHON

BR2_PACKAGE_PYTHON depends on !BR2_PACKAGE_PYTHON3, so you would have
to propagate this dependency. But does it work only with Python 2? It
does not support Python 3 ?

> +	select BR2_PACKAGE_BASH
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_CURL
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_BIN if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBRESSL_BIN if BR2_PACKAGE_LIBRESSL
> +	select BR2_PACKAGE_MAKE
> +	select BR2_PACKAGE_COREUTILS
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_IMAGEMAGICK

So all these dependencies are needed for the helper scripts ?

> +choice
> +	prompt "Native windowing system"
> +	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
> +	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
> +	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_MAINLINE
> +	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL    if BR2_PACKAGE_WAYLAND
> +	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11   if BR2_PACKAGE_XORG7
> +	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES

Alphabetic ordering would be nice, and also for the below option
definitions.

> +	help
> +	  Select the native windowing system you wish to use.
> +
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
> +	bool "KMS/DRM/GBM"
> +	select BR2_PACKAGE_LIBDRM

You forgot to replicate the libdrm dependencies here.

> +
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB
> +	bool "Vivante Frame Buffer"
> +	depends on BR2_PACKAGE_IMX_GPU_VIV
> +
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI
> +	bool "RaspberryPI Frame Buffer"
> +	depends on BR2_PACKAGE_RPI_USERLAND
> +
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX
> +	bool "TI/SGX Frame Buffer"
> +	depends on BR2_PACKAGE_TI_SGX_UM
> +
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
> +	bool "Allwinner ARM/Mali Frame Buffer"
> +	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
> +
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL
> +	bool "Wayland"
> +	depends on BR2_PACKAGE_WAYLAND
> +
> +config BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11
> +	bool "X11"
> +	depends on BR2_PACKAGE_XORG7

This is probably not sufficient: just having BR2_PACKAGE_XORG7 does not
mean any X11 package will be enabled. So you might need a few selects
here. Build a minimal configuration with just XORG7=y, and you'll see.

> diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
> new file mode 100644
> index 0000000000..b3048345ce
> --- /dev/null
> +++ b/package/glslsandbox-player/glslsandbox-player.mk
> @@ -0,0 +1,89 @@
> +################################################################################
> +#
> +# glslsandbox-player
> +#
> +################################################################################
> +
> +GLSLSANDBOX_PLAYER_VERSION = v2019.06.16
> +GLSLSANDBOX_PLAYER_SITE = https://github.com/jolivain/glslsandbox-player
> +GLSLSANDBOX_PLAYER_SITE_METHOD = git

Use the $(call github, ...) macro, see other packages.


> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS),y)
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-install-scripts

You have tons of dependencies in the Config.in for those scripts. They
are only runtime dependencies ? If so, you should add a "# runtime"
comment in Config.in.

> +else
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-install-scripts
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
> +# gbm dependency is not needed, as it is normally packaged with
> +# libegl/libgles drivers.
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB),y)
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += imx-gpu-viv
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=vivfb
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI),y)
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += rpi-userland
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=rpi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX),y)
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += ti-sgx-um
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=tisgx
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL),y)
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += wayland
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=wl
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_IVI),y)
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-ivi
> +else
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-ivi
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11),y)
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += xlib_libX11

Ah, so you need xlib_libX11, but it's not selected by the Config.in.

> +GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=x11
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2),y)
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += sdl2
> +GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=sdl2
> +endif

Since only one of these gfx backends can be selected at once, I'd
prefer if the makefile looked like this:

ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_foo),y)
...
else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_bar),y)
..
else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_baz),y)
..
endif

Could you fix the above issues and send an updated version of the patch ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
