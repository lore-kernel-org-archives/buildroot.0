From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 19:31:39 +0100
Subject: [Buildroot] [PATCH v2 3/6] systemd: bump to v206.
In-Reply-To: <1379679847-16141-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1379679847-16141-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20131102193139.2af593b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 20 Sep 2013 14:24:04 +0200, Eric Le Bihan wrote:
> This patch bumps systemd to v206 but also converts udev to a virtual
> package.

I am a little bit concerned about bisectability throughout your patch
set. Have you thought about this? Is there a way of making sure things
will remain bisectable or it's really too complicated?

> The selection of the following packages will also add features:
> 
>  - libglib2 package will add support for gudev.
>  - acl package will add support for multi-seat.

Maybe this text should be mentioned in the help text of the systemd
option.

> diff --git a/package/systemd/systemd-uclibc-fix.patch b/package/systemd/systemd-uclibc-fix.patch
> deleted file mode 100644
> index 9a20845..0000000
> --- a/package/systemd/systemd-uclibc-fix.patch
> +++ /dev/null

Without this patch (or similar patches), systemd does not build with
uClibc, so it should be marked to depend on (e)glibc.

> diff --git a/package/udev/Config.in b/package/udev/Config.in
> index d4d97c1..23c443e 100644
> --- a/package/udev/Config.in
> +++ b/package/udev/Config.in
> @@ -1,41 +1,2 @@
>  config BR2_PACKAGE_UDEV
> -	bool "udev"
> -	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> -	depends on BR2_LARGEFILE # util-linux
> -	depends on BR2_USE_WCHAR # util-linux
> -	depends on !BR2_PREFER_STATIC_LIB # kmod
> -	select BR2_PACKAGE_UTIL_LINUX
> -	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -	select BR2_PACKAGE_KMOD
> -	help
> -	  Userspace device daemon.
> -
> -	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
> -
> -	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
> -
> -if BR2_PACKAGE_UDEV
> -
> -config BR2_PACKAGE_UDEV_RULES_GEN
> -	bool "enable rules generator"
> -	help
> -	  Enable persistant rules generator
> -
> -config BR2_PACKAGE_UDEV_ALL_EXTRAS
> -	bool "enable all extras"
> -	select BR2_PACKAGE_ACL
> -	select BR2_PACKAGE_HWDATA
> -	select BR2_PACKAGE_LIBGLIB2
> -	depends on BR2_USE_WCHAR # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> -	help
> -	  Enable all extras with external dependencies like
> -	  libacl, hwdata and libglib2
> -
> -comment "enabling all extras requires a toolchain with WCHAR and threading support"
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -endif
> -
> -comment "udev requires /dev mgmnt set to udev under System configuration"
> -	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +	bool
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index db86850..c6fcdfc 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -4,48 +4,6 @@
>  #
>  ################################################################################
> 
> -UDEV_VERSION = 182
> -UDEV_SOURCE = udev-$(UDEV_VERSION).tar.xz
> -UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
> -UDEV_LICENSE = GPLv2+
> -UDEV_LICENSE_FILES = COPYING
> -UDEV_INSTALL_STAGING = YES
> +UDEV_SOURCE =
> 
> -# mq_getattr is in librt
> -UDEV_CONF_ENV += LIBS=-lrt
> -
> -UDEV_CONF_OPT =			\
> -	--sbindir=/sbin		\
> -	--with-rootlibdir=/lib	\
> -	--libexecdir=/lib	\
> -	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
> -	--with-pci-ids-path=/usr/share/hwdata/pci.ids	\
> -	--with-firmware-path=/lib/firmware		\
> -	--disable-introspection
> -
> -UDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> -
> -ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
> -UDEV_CONF_OPT += --enable-rule_generator
> -endif
> -
> -ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
> -UDEV_DEPENDENCIES += acl hwdata libglib2
> -UDEV_CONF_OPT +=		\
> -	--enable-udev_acl
> -else
> -UDEV_CONF_OPT +=		\
> -	--disable-gudev
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -	UDEV_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system/
> -endif
> -
> -define UDEV_INSTALL_INITSCRIPT
> -	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
> -endef
> -
> -UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
> -
> -$(eval $(autotools-package))
> +$(eval $(generic-package))

So for the moment the udev virtual package is completely empty. It only
gets updated to depend on systemd in PATCH 5/6. Is this intentional?

> diff --git a/system/Config.in b/system/Config.in
> index 1fe4127..c16e8e7 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -83,16 +83,22 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_LARGEFILE
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_INET_IPV6
> -	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_SSP
>  	depends on BR2_USE_MMU
> -	select BR2_PACKAGE_DBUS
> +	depends on !BR2_PREFER_STATIC_LIB
> +	select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV

Why do we have this select? I must say I don't really follow what's
going on in system/Config.in in terms of init option vs. /dev
management options.

>  	select BR2_PACKAGE_SYSTEMD
> 
> -comment 'systemd requires largefile, wchar, IPv6, threads and udev support'
> +comment 'systemd needs toolchain w/ largefile, wchar, IPv6, threads'
>  	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
> -		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
> -		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
> +		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
> +
> +comment 'systemd needs toolchain w/ stack smashing protection'
> +	depends on !BR2_TOOLCHAIN_HAS_SSP

Wow, that's probably the first package that has this requirement. What
happens when the toolchain doesn't have SSP support?

> +comment "systemd doesn't work with 'prefer static libraries'"
> +	depends on BR2_PREFER_STATIC_LIB
> 
>  config BR2_INIT_NONE
>  	bool "None"
> @@ -100,7 +106,7 @@ config BR2_INIT_NONE
>  endchoice
> 
>  choice
> -	prompt "/dev management"
> +	prompt "/dev management" if !BR2_INIT_SYSTEMD

Ok, so we show the /dev management only if another init system that
systemd is selected. Makes sense.

>  	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
> 
>  config BR2_ROOTFS_DEVICE_CREATION_STATIC
> @@ -113,20 +119,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
>  	bool "Dynamic using mdev"
>  	select BR2_PACKAGE_BUSYBOX
> 
> +endchoice
> +
>  config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> -	bool "Dynamic using udev"
> -	depends on BR2_LARGEFILE # udev
> -	depends on BR2_USE_WCHAR # udev
> -	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
> +	bool
>  	select BR2_PACKAGE_UDEV
> 
> -comment "udev requires a toolchain with LARGEFILE + WCHAR support"
> -	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
> -
> -comment "udev doesn't work with 'prefer static libraries'"
> -	depends on BR2_PREFER_STATIC_LIB
> -
> -endchoice
> +comment "/dev management using udev (from systemd)"
> +	depends on BR2_INIT_SYSTEMD

I don't think this comment is really needed.

> 
>  config BR2_ROOTFS_DEVICE_TABLE
>  	string "Path to the permission tables"

In order to make the patch series bisectable, I think I would suggest
to have the following sequence:

 * Introduce the eudev package

 * Turn the udev package into a virtual package that uses the only
   available udev implementation: eudev

 * Bump the systemd package, and register it as a possible udev
   implementation.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
