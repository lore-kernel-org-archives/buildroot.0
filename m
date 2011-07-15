From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Jul 2011 20:49:21 +0200
Subject: [Buildroot] [PATCHv3] udev: bump to 172
In-Reply-To: <4E1D4062.9010909@visionsystems.de> (Yegor Yefremov's message of
 "Wed, 13 Jul 2011 08:51:14 +0200")
References: <4E1D4062.9010909@visionsystems.de>
Message-ID: <87y5zz8jm6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks, a few comments:
 
 Yegor>  	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 
 Yegor> -config BR2_PACKAGE_UDEV_UTILS
 Yegor> -	bool "udev-utils"
 Yegor> +config BR2_PACKAGE_UDEV_ALL_EXTRAS
 Yegor> +	bool "enable all extras"
 Yegor>  	depends on BR2_PACKAGE_UDEV
 Yegor> +	select BR2_PACKAGE_ACL
 Yegor> +	select BR2_PACKAGE_LIBUSB
 Yegor> +	select BR2_PACKAGE_LIBUSB_COMPAT
 Yegor> +	select BR2_PACKAGE_USBUTILS
 Yegor> +	select BR2_PACKAGE_HWDATA
 Yegor> +	select BR2_PACKAGE_LIBGLIB2

ACL and LIBGLIB2 have extra dependencies, so you need to depend on
LARGEFILE and USE_WCHAR and show a comment line if those are not
available - Something like:

comment "extras requires a toolchain with LARGEFILE + WCHAR support"
	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)

 Yegor> -config BR2_PACKAGE_UDEV_VOLUME_ID
 Yegor> -	bool "udev-libvolume_id"
 Yegor> -	depends on BR2_PACKAGE_UDEV
 Yegor> -	help
 Yegor> -	  Build and install volume identification library.

We have packages depending on this:

git grep UDEV_VOLUME
hal/Config.in:  select BR2_PACKAGE_UDEV_VOLUME_ID
usbmount/Config.in:     select BR2_PACKAGE_UDEV_VOLUME_ID

What are we going to do about those?

 Yegor> -UDEV_BUILD_EXTRAS=$(addprefix extras/,$(UDEV_EXTRAS))
 Yegor> +UDEV_CONF_OPT = 		\
 Yegor> +	--exec-prefix=  	\

This gives a bit odd locations, like the pkgconfig files ending up in
/lib/pkgconfig where we're not searching for it. The Debian package uses

--sbindir=/sbin --with-rootlibdir=/lib

Which might be a better option.

 Yegor> +ifneq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)

I don't like negative logic, please invert the test (and the 2 cases).

 Yegor> +    UDEV_CONF_OPT += 		\
 Yegor> +    	--disable-hwdb		\

You have a few spaces here in front instead of tabs.

 Yegor> +	--disable-udev_acl	\
 Yegor> +	--disable-gudev
 Yegor> +else
 Yegor> +    UDEV_DEPENDENCIES += libusb libusb-compat acl usbutils hwdata libglib2
 Yegor> +    UDEV_CONF_OPT += 							\
 Yegor> +    	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/share/pkgconfig 		\

Why do you need to set this?

Otherwise it looks good.

-- 
Bye, Peter Korsgaard
