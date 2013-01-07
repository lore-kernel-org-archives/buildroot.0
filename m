From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 22:47:30 +0100
Subject: [Buildroot] [PATCH v2 6/6] udisks: new package
In-Reply-To: <1357591399-3566-7-git-send-email-marek.belisko@open-nandra.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-7-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20130107224730.0b135a42@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Mon,  7 Jan 2013 21:43:19 +0100, Marek Belisko wrote:

> --- /dev/null
> +++ b/package/udisks/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_UDISKS
> +	bool "udisks"
> +	depends on BR2_PACKAGE_UDEV
> +	depends on BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_SG3_UTILS
> +	select BR2_PACKAGE_UDEV_ALL_EXTRAS
> +	select BR2_PACKAGE_DBUS_GLIB
> +	select BR2_PACKAGE_POLKIT
> +	select BR2_PACKAGE_PARTED #select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_LVM2_DMSETUP_ONLY #devmapper library

If you select BR2_PACKAGE_LVM2_DMSETUP_ONLY, then you also have to
select BR2_PACKAGE_LVM2.

> +	select BR2_PACKAGE_LIBATASMART

Also, you're doing a lot of select here. Please verify that all the
configuration options you're selecting don't have depends on
dependencies that aren't already brought through the dependency on dbus
and udev here.

> +	help
> +	  The udisks project provides
> +
> +	   o A storage daemon that implements well-defined D-Bus
> +	     interfaces that can be used to query and manipulate
> +	     storage devices.
> +
> +	   o a command-line tool, udisks(1), that can be used to query
> +	     and use the daemon
> +
> +	  http://www.freedesktop.org/wiki/Software/udisks
> +
> +config BR2_PACKAGE_UDISKS_LVM2
> +	bool "lvm2 support"
> +	depends on BR2_PACKAGE_UDISKS
> +	depends on BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_LVM2_APP_LIBRARY
> +	default n

BR2_PACKAGE_LVM2 is necessarily defined if
BR2_PACKAGE_LVM2_DMSETUP_ONLY is selected by the main
BR2_PACKAGE_UDISKS option.

If I understand correctly, you can build:

 * udisks without the lvm2 library, but it needs the dmsetup binary
   unconditionally (which sounds strange, isn't capable of supporting
   setups without LVM stuff)

 * udisks with the lvm2 library

Not sure how to handle that properly with the current BR2_PACKAGE_LVM2
options. Needs more thought.

> +#############################################################
> +#
> +# udisks
> +#
> +#############################################################
> +UDISKS_VERSION = 1.0.4
> +UDISKS_SITE    = http://hal.freedesktop.org/releases/
> +UDISKS_LICENCE = GPLv2+
> +UDISKS_LICENCE_FILES = COPYING

LICENSE.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
