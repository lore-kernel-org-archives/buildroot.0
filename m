From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Feb 2012 22:07:54 +0100
Subject: [Buildroot] [PATCH v2 2/2] udev: bump to 181 and other fixes
In-Reply-To: <1328694625-17204-2-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 8 Feb 2012 10:50:25
 +0100")
References: <1328694625-17204-1-git-send-email-yegorslists@googlemail.com>
 <1328694625-17204-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <87k43x3ufp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>

 yegorslists> Changes:
 yegorslists> - Linux kernel requirement: 2.6.34 and above (devtmpfs is mandatory)
 yegorslists> (this also applies to the chosen toolchain, because of Kernel headers)
 yegorslists> - optional dependency on libusb and usbutils removed
 yegorslists> - added dependency on kmod
 yegorslists> - added dependency on util-linux for libblkid
 yegorslists> - install in /lib/udev instead of /usr/libexec/udev
 yegorslists> - udevd moved to /lib/udev
 yegorslists> - fixed path to pci.ids and usb.ids
 yegorslists> - persistent rules generator is disabled by default, so option
 yegorslists> is introduced to enable this option if desired

Thanks, committed with minor tweaks (see below).


 yegorslists> +++ b/package/udev/Config.in
 yegorslists> @@ -1,31 +1,39 @@
 yegorslists>  config BR2_PACKAGE_UDEV
 yegorslists>  	bool "udev"
 yegorslists>  	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 yegorslists> +	depends on BR2_LARGEFILE # util-linux
 yegorslists> +	depends on BR2_USE_WCHAR # util-linux
 yegorslists> +	select BR2_PACKAGE_UTIL_LINUX
 yegorslists> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 yegorslists> +	select BR2_PACKAGE_KMOD
 yegorslists>  	help
 yegorslists>  	  Userspace device daemon.
 
 yegorslists> +	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
 yegorslists> +

The devtmpfs dependency is not really an issue as we already depend on
it for dynamic /dev handling.

  yegorslists>  comment "udev requires /dev mgmnt set to udev under System configuration"
 yegorslists>  	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 yegorslists> +
 yegorslists> +comment "udev requires a toolchain with LARGEFILE + WCHAR support"
 yegorslists> +    depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 

This doesn't really make sense to show here, so I moved it
target/generic where the user selects the /dev handling method. This
line would only be shown in situations where he couldn't select udev
anyway (as he hadn't selected BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV).

 yegorslists> +++ b/package/udev/udev.mk
 yegorslists> @@ -3,7 +3,7 @@
 yegorslists>  # udev
 yegorslists>  #
 yegorslists>  #############################################################
 yegorslists> -UDEV_VERSION = 173
 yegorslists> +UDEV_VERSION = 181
 yegorslists>  UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 yegorslists>  UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 yegorslists>  UDEV_INSTALL_STAGING = YES
 yegorslists> @@ -11,20 +11,24 @@ UDEV_INSTALL_STAGING = YES
 yegorslists>  UDEV_CONF_OPT =			\
 yegorslists>  	--sbindir=/sbin		\
 yegorslists>  	--with-rootlibdir=/lib	\
 yegorslists> -	--libexecdir=/lib/udev	\
 yegorslists> +	--libexecdir=/lib	\
 yegorslists> +	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
 yegorslists> +	--with-pci-ids-path=/usr/share/hwdata/pci.ids	\
 yegorslists> +	--with-firmware-path=/lib/firmware		\
 yegorslists>  	--disable-introspection

udevd now needs to link with librt as it calls mq_getattr() (which isn't
automatically done on uClibc), so I added UDEV_CONF_ENV += LIBS='-lt'

-- 
Bye, Peter Korsgaard
