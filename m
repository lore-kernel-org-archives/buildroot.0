From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:37:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/pipewire: add missing
 dependencies/plugins
In-Reply-To: <20191218130459.85796-1-james.hilliard1@gmail.com>
References: <20191218130459.85796-1-james.hilliard1@gmail.com>
Message-ID: <20191218233748.1d911294@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

For the patch, I've applied, but after doing a few changes. See below.

On Wed, 18 Dec 2019 06:04:59 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
> index ca23e6cff0..72d534d412 100644
> --- a/package/pipewire/Config.in
> +++ b/package/pipewire/Config.in
> @@ -1,7 +1,9 @@
>  menuconfig BR2_PACKAGE_PIPEWIRE

I pushed a separate patch that changes that menuconfig to a normal
config option, since we only use menuconfig for packages that really
have a lot of sub-options.

>  	bool "pipewire"
> +	depends on BR2_PACKAGE_HAS_UDEV # libudev
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus

This is now also needed because the alsa-lib select, so I've updated
the comment.

>  	depends on BR2_USE_MMU # dbus
> +	select BR2_PACKAGE_ALSA_LIB
>  	select BR2_PACKAGE_DBUS
>  	help
>  	  PipeWire is a server and user space API to deal with
> @@ -12,3 +14,15 @@ menuconfig BR2_PACKAGE_PIPEWIRE
>  comment "pipewire needs a toolchain w/ threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS

This comment needs to be further down, otherwise kconfig is not smart
enough to "indent"  the sub-option about gstreamer to be "under" the
main pipewire option.

> +menuconfig BR2_PACKAGE_PIPEWIRE_GSTREAMER

Should have been a "config".

> +	bool "pipewire gstreamer plugins"
> +	depends on BR2_PACKAGE_PIPEWIRE

We prefer to enclose in an if ... endif block the sub-options of a
package.

> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_GSTREAMER1
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	help
> +	  Build GStreamer plugins

The corresponding Config.in comment was missing.

> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index 7717095535..32e28d24e4 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -9,8 +9,26 @@ PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
>  PIPEWIRE_LICENSE = LGPL-2.1+
>  PIPEWIRE_LICENSE_FILES = LICENSE LGPL
>  PIPEWIRE_INSTALL_STAGING = YES
> -PIPEWIRE_DEPENDENCIES = host-pkgconf dbus
> -PIPEWIRE_CONF_OPTS = -Dgstreamer=disabled
> +PIPEWIRE_DEPENDENCIES = host-pkgconf alsa-lib dbus udev
> +
> +ifeq ($(BR2_PACKAGE_FFMPEG),y)
> +PIPEWIRE_DEPENDENCIES += ffmpeg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SBC),y)
> +PIPEWIRE_DEPENDENCIES += sbc
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL2),y)
> +PIPEWIRE_DEPENDENCIES += sdl2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
> +PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
> +PIPEWIRE_DEPENDENCIES += libglib2 gst1-plugins-base

I've added gstreamer1 in this list of dependencies, to match the
selects done in the Config.in file, even though I agree that
technically speaking, gst1-plugins-base anyway depends on gstreamer1.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
