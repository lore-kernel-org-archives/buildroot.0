From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 16:35:17 +0200
Subject: [Buildroot] [PATCH v3 02/13] package/libblockdev: new package
In-Reply-To: <20200725230618.3640682-3-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
 <20200725230618.3640682-3-aduskett@gmail.com>
Message-ID: <20200829163517.3c43d0ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Sat, 25 Jul 2020 16:06:07 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> libblockdev is a C library supporting GObject introspection for manipulation
> of block devices. It has a plugin-based architecture where each technology
> (like LVM, Btrfs, MD RAID, Swap,...) is implemented in a separate plugin,
> possibly with multiple implementations.
> 
> Gobject-introspection is not a strict dependency and may be disabled via a
> configure flag.
> 
> This is the base package with everything disabled, the subsequent patches in
> this series will add more options necessary to bump udisk to the latest.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've applied to next, but I encountered several issues, and almost gave
up.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9105626083..ff475a3234 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -43,6 +43,7 @@ F:	package/gstreamer1/gst1-vaapi/
>  F:	package/imx-usb-loader/
>  F:	package/janus-gateway/
>  F:	package/json-for-modern-cpp/
> +F:	package/libblockdev/
>  F:	package/libabseil-cpp/

Alphabetic ordering was not correct here.

> diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
> new file mode 100644
> index 0000000000..4fd80f1f5c
> --- /dev/null
> +++ b/package/libblockdev/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_LIBBLOCKDEV
> +	bool "libblockdev"
> +	depends on !BR2_STATIC_LIBS # kmod
> +	depends on BR2_USE_WCHAR # libglib2 -> gettext
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # fork() # libglib2
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_KMOD

Alphabetic ordering here as well.

> +	help
> +	  libblockdev is a C library supporting GObject introspection
> +	  for manipulation of block devices. It has a plugin-based
> +	  architecture where each technology (like LVM, Btrfs, MD RAID,
> +	  Swap,...) is implemented in a separate plugin, possibly with
> +	  multiple implementations.
> +
> +	  https://github.com/storaged-project/libblockdev/
> +
> +comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || BR2_TOOLCHAIN_HAS_THREADS

BR2_TOOLCHAIN_HAS_THREADS should have been !BR2_TOOLCHAIN_HAS_THREADS.

Also, due to depends on !BR2_PACKAGE_HAS_UDEV, the message will not
appear at all when udev is enabled, so you won't see the
wchar/threads/dynamic library messages!

Changed to:

+       depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
+               !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

> +LIBBLOCKDEV_VERSION = 2.24
> +LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
> +LIBBLOCKDEV_LICENSE = LGPL-2.1
> +LIBBLOCKDEV_LICENSE_FILES = LICENSE
> +LIBBLOCKDEV_INSTALL_STAGING = YES
> +LIBBLOCKDEV_DEPENDENCIES = host-pkgconf libglib2 kmod udev
> +
> +LIBBLOCKDEV_CONF_OPTS = \
> +	--disable-introspection \
> +	--with-loop \
> +	--without-bcache \
> +	--without-btrfs \
> +	--without-crypto \
> +	--without-dm \
> +	--without-dmraid \
> +	--without-escrow \
> +	--without-fs \
> +	--without-kbd \
> +	--without-loop \
> +	--without-lvm \
> +	--without-lvm_dbus \
> +	--without-mdraid \
> +	--without-mpath \
> +	--without-nvdimm \
> +	--without-parted \

The first issue was this: this option doesn't exist, the actual option
is --without-part. Due to this, it was trying to find libparted, which
was not available. So it simply means that you didn't test this patch
on its own.

The second problem was that libblockdev simply didn't build with
uClibc, as it uses strerror_l(), which uClibc doesn't provide.

I'd like to remind that uClibc is our default C library today, so not
testing against uClibc is really, really wrong. I fixed that by adding
a patch that implements a fallback to strerror() when strerror_l() is
not available, which of course requires LIBBLOCKDEV_AUTORECONF = YES.

Could you have a look at that patch and submit it for upstream
inclusion ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
