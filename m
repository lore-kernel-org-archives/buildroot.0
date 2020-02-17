From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 19:56:39 +0100
Subject: [Buildroot] [PATCH 3/4] package/libblockdev: add new package
In-Reply-To: <20200217143030.5031-4-giulio.benetti@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
 <20200217143030.5031-4-giulio.benetti@benettiengineering.com>
Message-ID: <20200217195639.0380459c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Feb 2020 15:30:29 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
> new file mode 100644
> index 0000000000..0b0a943d5f
> --- /dev/null
> +++ b/package/libblockdev/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_LIBBLOCKDEV
> +	bool "libblockdev"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # volume_key -> cryptsetup
> +	depends on BR2_USE_MMU # lvm2, volume_key -> cryptsetup
> +	depends on !BR2_STATIC_LIBS # volume_key -> cryptsetup

You're missing a few dependencies from volume-key:

+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme, libassuan
+	depends on BR2_USE_WCHAR # libglib2

Could you double check ?

> +	depends on BR2_SYSTEM_ENABLE_NLS # volume_key

There is no such dependency in volume-key.

> +	select BR2_PACKAGE_LIBBYTESIZE
> +	select BR2_PACKAGE_LIBYAML
> +	select BR2_PACKAGE_PARTED

This one depends on BR2_ENABLE_LOCALE

> +	select BR2_PACKAGE_VOLUME_KEY
> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> +	select BR2_PACKAGE_UTIL_LINUX

Reverse the order of those last two lines.

> +	help
> +	  libblockdev is a C library supporting GObject introspection for
> +	  manipulation of block devices
> +
> +	  https://github.com/storaged-project/libblockdev/
> +
> +comment "libblockdev needs udev /dev management and a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV

This is not accurate considering the dependencies of
BR2_PACKAGE_LIBBLOCKDEV.

> +LIBBLOCKDEV_VERSION = 2.23-1
> +LIBBLOCKDEV_SITE = $(call github,storaged-project,libblockdev,$(LIBBLOCKDEV_VERSION))
> +LIBBLOCKDEV_LICENSE = LGPL-2.1+
> +LIBBLOCKDEV_LICENSE_FILES = LICENSE
> +LIBBLOCKDEV_DEPENDENCIES = host-autoconf-archive host-pkgconf kmod \
> +			   libbytesize libyaml parted udev util-linux \
> +			   volume_key

kmod is used here, but not selected by the Config.in file. Indentation
is also odd: you should have only one tab to indent the continuation
lines.

> +LIBBLOCKDEV_INSTALL_STAGING = YES
> +LIBBLOCKDEV_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive

I haven't followed the recent autoreconf rework, is this now the right
way of using autoconf-archive macros ?

> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBBLOCKDEV_CONF_OPTS += --enable-introspection=yes
> +LIBBLOCKDEV_DEPENDENCIES += gobject-introspection
> +else
> +LIBBLOCKDEV_CONF_OPTS += --enable-introspection=no
> +endif

We don't have GOI support (yet).

> +# Autoreconf requires an existing m4 directory
> +define LIBBLOCKDEV_MKDIR_M4
> +	mkdir -p $(@D)/m4
> +endef
> +LIBBLOCKDEV_POST_PATCH_HOOKS += LIBBLOCKDEV_MKDIR_M4

So the change from Michael Walle that allows to drop this was not
merged yet?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
