From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 10:57:21 +0200
Subject: [Buildroot] [PATCH 04/12] package/libblockdev: new package
In-Reply-To: <20200723010810.3237608-5-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
 <20200723010810.3237608-5-aduskett@gmail.com>
Message-ID: <20200723105721.4d4cee59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jul 2020 18:08:02 -0700
aduskett at gmail.com wrote:

> +LIBBLOCKDEV_VERSION = 2.24
> +LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
> +LIBBLOCKDEV_LICENSE = LGPL-2.1+
> +LIBBLOCKDEV_LICENSE_FILES = LICENSE
> +LIBBLOCKDEV_INSTALL_STAGING = YES
> +
> +LIBBLOCKDEV_DEPENDENCIES = \
> +	host-pkgconf \
> +	kmod \
> +	libbytesize \
> +	libglib2 \
> +	libyaml \
> +	lvm2 \
> +	parted \
> +	udev

Are you sure all those dependencies are needed ?

For example, libyaml seems to only be needed when:

AS_IF([test "x$with_vdo" != "xno"],
      [LIBBLOCKDEV_PKG_CHECK_MODULES([YAML], [yaml-0.1])]
      [])

and you're passing --without-vdo.

Instead of passing --with-lvm, perhaps you could use --without-lvm,
this would avoid the need for the lvm2 dependency I believe.

Also, why --with-part and --with-swap ?

The part plugin is what brings the parted dependency:

AS_IF([test "x$with_part" != "xno" -o "x$with_fs" != "xno"],
      [LIBBLOCKDEV_PKG_CHECK_MODULES([PARTED], [libparted >= 3.1])]
      [])

libbytesize is also not always needed:

AS_IF([test "x$with_btrfs" != "xno" -o "x$with_mdraid" != "xno" -o "x$with_kbd" != "xno" -o "x$with_vdo" != "xno" -o "x$with_tools" != "xno"],
      [LIBBLOCKDEV_PKG_CHECK_MODULES([BYTESIZE], [bytesize >= 0.1])],
      [])

Could you revisit the set of dependencies, and make them optional as
they should be ?

> +
> +LIBBLOCKDEV_CONF_OPTS = \
> +	--enable-introspection=no \

	--disable-introspection

is preferred.

> +	--without-bcache \
> +	--without-btrfs \
> +	--without-crypto \
> +	--without-escrow \
> +	--without-fs \
> +	--without-dm \
> +	--without-dmraid \
> +	--without-nvdimm \
> +	--without-tools \
> +	--without-python2 \
> +	--without-vdo \
> +	--with-lvm \
> +	--with-part \
> +	--with-swap

As said above, these last 3 should probably not be unconditionally
enabled.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
