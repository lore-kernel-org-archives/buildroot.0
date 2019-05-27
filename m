From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 22:09:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/sfml: new package
In-Reply-To: <20190527153906.24339-1-victor.huesca@bootlin.com>
References: <20190527153906.24339-1-victor.huesca@bootlin.com>
Message-ID: <20190527220951.59246366@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

Thanks for this contribution. There are (obviously) a number of issues
with the patch, which is perfectly normal for a first submission of a
not-so-trivial package. See below for all the comments.

On Mon, 27 May 2019 17:39:06 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
> ---
>  package/Config.in      |   1 +
>  package/sfml/Config.in | 116 +++++++++++++++++++++++++++++++++++++++++
>  package/sfml/sfml.hash |   3 ++
>  package/sfml/sfml.mk   |  79 ++++++++++++++++++++++++++++
>  4 files changed, 199 insertions(+)

You need to add an entry to the DEVELOPERS file for this package, so
that you can receive e-mail notifications of build failures happening
on the autobuilders, and be Cc'ed on patches that are posted on this
package.

> diff --git a/package/sfml/Config.in b/package/sfml/Config.in
> new file mode 100644
> index 0000000000..76cf95df36
> --- /dev/null
> +++ b/package/sfml/Config.in
> @@ -0,0 +1,116 @@
> +config BR2_PACKAGE_SFML
> +	bool "sfml"
> +	# depends on BR2_PACKAGE_HAS_UDEV

Why is this commented ? I just tried a build, and it builds
successfully without udev, so is it really a dependency ?

> +

Please drop this empty new line.

> +	help
> +	  Simple and Fast Multimedia Library 2 - SFML provides a simple 
> +	  interface to the various components of your PC, to ease the 
> +	  development of games and multimedia applications. It is composed 
> +	  of five modules: system, window, graphics, audio and network. 
> +
> +	  https://www.sfml-dev.org/
> +
> +

Two empty lines: keep only one.

> +if BR2_PACKAGE_SFML
> +
> +# X11 and OpenGL related stuff
> +
> +config BR2_PACKAGE_SFML_X11
> +	bool "X11 video driver"
> +	depends on BR2_PACKAGE_XORG7
> +	# select BR2_PACKAGE_XLIB_LIBX11

Please don't keep comments.

> +
> +comment "X11 video driver needs X.org"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_SFML_OPENGL
> +	bool "OpenGL (GLX)"
> +	depends on BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_SFML_X11
> +
> +comment "OpenGL support needs X11 and an OpenGL provider"
> +	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_SFML_X11
> +
> +
> +
> +

Please keep only one empty line.

> +# Exemples

This comment is not needed (and uses the French spelling, it should
have been Examples).

> +config BR2_PACKAGE_SFML_EXAMPLES
> +	bool "examples"
> +	help
> +	  This boolean option controls whether the SFML examples are 
> +	  built alongside the library or not.
> +
> +
> +

Only one empty new line.

> +# Allow to select only Audio, Window, Graphics or Network

Comments are not needed.

> +config BR2_PACKAGE_SFML_CUSTOM_MODULES
> +	bool "custom modules"
> +	help
> +	  Allow to select only a subset of modules.

Do we really need this option ?

> +if BR2_PACKAGE_SFML_CUSTOM_MODULES
> +
> +config BR2_PACKAGE_SFML_AUDIO
> +	bool "audio"
> +	default y

Defaulting to y is not really the classic Buildroot choice: we
generally try to have a very minimal build by default.

> +	select BR2_PACKAGE_FLAC

BR2_PACKAGE_FLAC has a depends on BR2_USE_WCHAR, so you need to
replicate this dependency.

> +	select BR2_PACKAGE_LIBOGG
> +	select BR2_PACKAGE_LIBVORBIS
> +	select BR2_PACKAGE_OPENAL

This option has the following dependencies:

        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
        depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS

so you need to replicate these dependencies.

> +	help
> +	  This boolean option controls whether the SFML audio module 
> +	  is built or not.
> +
> +config BR2_PACKAGE_SFML_GRAPHICS
> +	bool "graphics"
> +	default y
> +	select BR2_PACKAGE_SFML_WINDOW

This option has a depends on BR2_PACKAGE_SFML_X11, so you need to
replicate this dependency.

> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_JPEG
> +	help
> +	  This boolean option controls whether the SFML graphics module 
> +	  is built or not.
> +
> +config BR2_PACKAGE_SFML_WINDOW
> +	bool "window"
> +	default y
> +	depends on BR2_PACKAGE_SFML_X11

I am not really sure at this point of the articulation between
BR2_PACKAGE_SFML_X11 and BR2_PACKAGE_SFML_WINDOW. What happens if
BR2_PACKAGE_SFML_X11=y, but BR2_PACKAGE_SFML_WINDOW is disabled ?
Your .mk file will only add xlib_{libX11,libXext} to the dependencies,
but that's it.

I'm not sure it makes sense to have separate options: SFML_WINDOW
should just depend on BR2_PACKAGE_XORG7 and select
BR2_PACKAGE_XLIB_{LIBX11,LIBXEXT}.

> +	help
> +	  This boolean option controls whether the SFML window module 
> +	  is built or not.
> +
> +config BR2_PACKAGE_SFML_NETWORK
> +	bool "network"
> +	default y
> +	help
> +	  This boolean option controls whether the SFML network module 
> +	  is built or not. 
> +
> +endif # BR2_PACKAGE_SFML_CUSTOM_MODULES
> +
> +

Only one empty line.

> +# TODO: Check if it can build w/ the internals libraries 
> +# Use buildroot libs by default
> +config BR2_PACKAGE_SFML_EXTLIB
> +	bool "extlibs"
> +	default y
> +	help
> +	  This boolean option controls whether the dependencies from 
> +	  the extlibs directory are used or whether the system 
> +	  dependencies are used. The stb_image_* header in the extlibs 
> +	  directory are used regardless of this option. 

We don't need this option: we never want to use bundled libraries, and
always want to use external libraries built by separate Buildroot
packages.

> +config BR2_PACKAGE_SFML_PKGCONF
> +	bool "install pkg-config file"
> +	depends on BR2_PACKAGE_PKGCONF
> +	default y
> +	help
> +	  This boolean option controls whether CMake will install the 
> +	  pkg-config files on your system or not. 

We don't need this option: it should be installed unconditionally.

> +endif
> +
> +comment "SFML needs a toolchain w/ thread support"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

You have a comment about a thread dependency, but you don't have any
BR2_TOOLCHAIN_HAS_THREADS dependency anywhere, this does not make sense.

Of course, if you read my review above, you will see that you will have
many more dependencies than BR2_TOOLCHAIN_HAS_THREADS.

> diff --git a/package/sfml/sfml.hash b/package/sfml/sfml.hash
> new file mode 100644
> index 0000000000..c3d96836e2
> --- /dev/null
> +++ b/package/sfml/sfml.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256	438c91a917cc8aa19e82c6f59f8714da353c488584a007d401efac8368e1c785	sfml-2.5.1.tar.gz
> +sha256	8143f9ad51ddf0a5b0629beabf8e1432ac3e5a2f3b62b510f3b16712e4bb9143	license.md
> \ No newline at end of file

Please make sure the last line has a final newline.

> diff --git a/package/sfml/sfml.mk b/package/sfml/sfml.mk
> new file mode 100644
> index 0000000000..5db4c1b29e
> --- /dev/null
> +++ b/package/sfml/sfml.mk
> @@ -0,0 +1,79 @@
> +################################################################################
> +#
> +# sfml
> +#
> +################################################################################
> +
> +SFML_VERSION = 2.5.1
> +SFML_SITE = $(call github,SFML,SFML,$(SFML_VERSION))
> +SFML_LICENSE = Zlib
> +SFML_LICENSE_FILES = license.md
> +SFML_INSTALL_STAGING = YES 
> +SFML_DEPENDENCIES = udev #pthread

You cannot have udev in the dependencies without having a "depends on
BR2_PACKAGE_UDEV" in the Config.in file.

> +# x-includes and x-libraries must be set for cross-compiling
> +# By default x_includes and x_libraries contains unsafe paths.
> +# (/usr/X11R6/include and /usr/X11R6/lib)

And ? What are you doing about this ?

> +ifeq ($(BR2_PACKAGE_SFML_X11),y)
> +SFML_DEPENDENCIES += xlib_libX11 xlib_libXext
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SFML_OPENGL),y)
> +SFML_DEPENDENCIES += libgl
> +endif
> +
> +
> +# Make sure to disable documentation

Comment is not needed.

> +SFML_CONF_OPTS += -DSFML_BUILD_DOC=OFF
> +
> +
> +# Build type
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +SFML_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
> +else
> +SFML_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
> +endif

This is not needed: CMAKE_BUILD_TYPE is already passed correctly by the
cmake-package infrastructure.

> +# Exemples

This comment is not needed, and is in french :)

> +ifeq ($(BR2_PACKAGE_SFML_EXAMPLES),y)
> +SFML_CONF_OPTS += -DSFML_BUILD_EXAMPLES=ON
> +else
> +SFML_CONF_OPTS += -DSFML_BUILD_EXAMPLES=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SFML_AUDIO),y)
> +SFML_DEPENDENCIES += openal libogg libvorbis flac
> +SFML_CONF_OPTS += -DSFML_BUILD_AUDIO=ON
> +else
> +SFML_CONF_OPTS += -DSFML_BUILD_AUDIO=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SFML_GRAPHICS),y)
> +SFML_DEPENDENCIES += jpeg freetype
> +SFML_CONF_OPTS += -DSFML_BUILD_GRAPHICS=ON
> +else
> +SFML_CONF_OPTS += -DSFML_BUILD_GRAPHICS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SFML_WINDOW),y)
> +SFML_CONF_OPTS += -DSFML_BUILD_WINDOW=ON
> +else
> +SFML_CONF_OPTS += -DSFML_BUILD_WINDOW=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SFML_NETWORK),y)
> +SFML_CONF_OPTS += -DSFML_BUILD_NETWORK=ON
> +endif
> +
> +# Do not used provided external libs
> +ifneq ($(BR2_PACKAGE_SFML_EXTLIB),y)
> +SFML_CONF_OPTS += -DSFML_USE_SYSTEM_DEP=ON
> +endif

This should be unconditionally set to "ON".

> +ifeq ($(BR2_PACKAGE_SFML_PKGCONF),y)
> +SFML_CONF_OPTS += -DSFML_INSTALL_PKGCONFIG_FILES=ON
> +endif

Ditto.

> +
> +$(eval $(cmake-package))
> \ No newline at end of file

Please have a final new line at the end of the file.

Overall, most comments can be addressed fairly easily. The only
significant comment is whether we want separate options for X11 and
WINDOW.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
