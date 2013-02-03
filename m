From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Feb 2013 15:24:38 +0100
Subject: [Buildroot] [PATCH v3 5/5] udisks: new package
In-Reply-To: <1358546927-25707-6-git-send-email-marek.belisko@open-nandra.com>
 (Marek Belisko's message of "Fri, 18 Jan 2013 23:08:47 +0100")
References: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
 <1358546927-25707-6-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <87zjzl4grd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:

 Marek> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Marek> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
 Marek> ---
 Marek>  package/Config.in        |    1 +
 Marek>  package/udisks/Config.in |   32 ++++++++++++++++++++++++++++++++
 Marek>  package/udisks/udisks.mk |   28 ++++++++++++++++++++++++++++
 Marek>  3 files changed, 61 insertions(+)
 Marek>  create mode 100644 package/udisks/Config.in
 Marek>  create mode 100644 package/udisks/udisks.mk

 Marek> diff --git a/package/Config.in b/package/Config.in
 Marek> index 7201d1d..d3e3c44 100644
 Marek> --- a/package/Config.in
 Marek> +++ b/package/Config.in
 Marek> @@ -271,6 +271,7 @@ source "package/sysstat/Config.in"
 Marek>  source "package/ti-utils/Config.in"
 Marek>  source "package/uboot-tools/Config.in"
 Marek>  source "package/udev/Config.in"
 Marek> +source "package/udisks/Config.in"
 Marek>  source "package/usb_modeswitch/Config.in"
 Marek>  source "package/usb_modeswitch_data/Config.in"
 Marek>  source "package/usbmount/Config.in"
 Marek> diff --git a/package/udisks/Config.in b/package/udisks/Config.in
 Marek> new file mode 100644
 Marek> index 0000000..1637199
 Marek> --- /dev/null
 Marek> +++ b/package/udisks/Config.in
 Marek> @@ -0,0 +1,32 @@
 Marek> +config BR2_PACKAGE_UDISKS
 Marek> +	bool "udisks"
 Marek> +	depends on BR2_PACKAGE_UDEV
 Marek> +	depends on BR2_PACKAGE_DBUS

It makes more sense to use the BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
symbol like udev does.

dbus can be selected like a normal library these days, so I've changed
it to use that and reordered the lines.

 Marek> +	select BR2_PACKAGE_SG3_UTILS
 Marek> +	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 Marek> +	select BR2_PACKAGE_DBUS_GLIB
 Marek> +	select BR2_PACKAGE_POLKIT
 Marek> +	select BR2_PACKAGE_PARTED
 Marek> +	select BR2_PACKAGE_LVM2
 Marek> +	select BR2_PACKAGE_LIBATASMART
 Marek> +	help
 Marek> +	  The udisks project provides
 Marek> +
 Marek> +	   o A storage daemon that implements well-defined D-Bus
 Marek> +	     interfaces that can be used to query and manipulate
 Marek> +	     storage devices.
 Marek> +
 Marek> +	   o a command-line tool, udisks(1), that can be used to query
 Marek> +	     and use the daemon
 Marek> +
 Marek> +	  http://www.freedesktop.org/wiki/Software/udisks
 Marek> +
 Marek> +config BR2_PACKAGE_UDISKS_LVM2
 Marek> +	bool "lvm2 support"
 Marek> +	depends on BR2_PACKAGE_UDISKS
 Marek> +	default n

'n' is default anyway, so this is not needed.

You forgot to select BR2_PACKAGE_LVM2_APP_LIBRARY, so I've added that.


 Marek> +	help
 Marek> +	  With LVM2 support.
 Marek> +
 Marek> +comment "udisks requires udev and dbus to be enabled"
 Marek> +	depends on !BR2_PACKAGE_UDEV || !BR2_PACKAGE_DBUS

And adjusted the comment.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
