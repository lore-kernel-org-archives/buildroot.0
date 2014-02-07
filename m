From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Feb 2014 22:30:15 +0100
Subject: [Buildroot] [PATCH v7 2/4] udev: convert to virtual package.
In-Reply-To: <1391779295-19140-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAHXCMMJ6aOmS+BN9vXNNeC1UBym6SbzZoHdX4eFa37CmsWWo1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Fri, Feb 7, 2014 at 2:21 PM, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

[...]

> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index e157ca8..fe60850 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_MODEM_MANAGER
>         bool "modemmanager"
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +       depends on BR2_PACKAGE_HAS_UDEV
>         select BR2_PACKAGE_DBUS
>         depends on BR2_INET_IPV6
>         depends on BR2_LARGEFILE # acl
> @@ -8,8 +8,6 @@ config BR2_PACKAGE_MODEM_MANAGER
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>         depends on BR2_USE_MMU # dbus
>         select BR2_PACKAGE_DBUS_GLIB
> -       select BR2_PACKAGE_UDEV
> -       select BR2_PACKAGE_UDEV_ALL_EXTRAS

When removing BR2_PACKAGE_UDEV_ALL_EXTRAS, you should certainly
replace it by the
"select ..." statements done in the BR2_PACKAGE_UDEV_ALL_EXTRAS
symbol, ie: acl and libglib2 (if I understood correctly hwdata is no
longer needed).


>         help
>           ModemManager is a DBus-activated daemon which controls mobile
>           broadband (2G/3G/4G) devices and connections.
> @@ -33,4 +31,4 @@ endif
>
>  comment "modemmanager needs udev /dev management and a toolchain w/ largefile, wchar, threads, IPv6"
>         depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
> -               !BR2_TOOLCHAIN_HAS_THREADS || !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +               !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index a194433..a4eeeaf 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -1,16 +1,14 @@
>  config BR2_PACKAGE_NETWORK_MANAGER
>         bool "NetworkManager"
>         depends on !BR2_avr32 # udev
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> -       select BR2_PACKAGE_DBUS
>         depends on BR2_INET_IPV6
>         depends on BR2_LARGEFILE # acl
>         depends on BR2_USE_WCHAR # libglib2 and gnutls
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>         depends on BR2_USE_MMU # dbus
> +       depends on BR2_PACKAGE_HAS_UDEV
> +       select BR2_PACKAGE_DBUS
>         select BR2_PACKAGE_DBUS_GLIB
> -       select BR2_PACKAGE_UDEV
> -       select BR2_PACKAGE_UDEV_ALL_EXTRAS

ditto (select acl and libglib2)

>         select BR2_PACKAGE_GNUTLS
>         select BR2_PACKAGE_LIBGCRYPT
>         select BR2_PACKAGE_LIBNL
> @@ -33,4 +31,4 @@ comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, larg
>         depends on BR2_USE_MMU
>         depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
>                 !BR2_TOOLCHAIN_HAS_THREADS || \
> -               !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +               !BR2_PACKAGE_HAS_UDEV

[...]

> diff --git a/package/udev/Config.in b/package/udev/Config.in
> index 7aa79c4..5cd4051 100644
> --- a/package/udev/Config.in
> +++ b/package/udev/Config.in
> @@ -1,47 +1,6 @@
> -config BR2_PACKAGE_UDEV
> -       bool "udev"
> -       depends on !BR2_avr32 # no epoll_create1
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> -       depends on BR2_LARGEFILE # util-linux
> -       depends on BR2_USE_WCHAR # util-linux
> -       depends on !BR2_PREFER_STATIC_LIB # kmod
> -       select BR2_PACKAGE_UTIL_LINUX
> -       select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -       select BR2_PACKAGE_KMOD
> +config BR2_PACKAGE_HAS_UDEV
> +       bool
>         help
> -         Userspace device daemon.
> -
> -         udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
> -         and inotify.
> -
> -         ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
> -
> -if BR2_PACKAGE_UDEV
> -
> -config BR2_PACKAGE_UDEV_RULES_GEN
> -       bool "enable rules generator"
> -       help
> -         Enable persistant rules generator
> -
> -config BR2_PACKAGE_UDEV_ALL_EXTRAS
> -       bool "enable all extras"
> -       select BR2_PACKAGE_ACL
> -       select BR2_PACKAGE_HWDATA
> -       select BR2_PACKAGE_LIBGLIB2
> -       depends on BR2_USE_WCHAR # libglib2
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> -       depends on BR2_USE_MMU # libglib2
> -       help
> -         Enable all extras with external dependencies like
> -         libacl, hwdata and libglib2
> -
> -comment "enabling all extras needs a toolchain w/ wchar, threads"
> -       depends on BR2_USE_MMU
> -       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -endif
> -
> -comment "udev needs udev /dev management and a toolchain w/ largefile, wchar, dynamic library"
> -       depends on !BR2_avr32
> -       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
> -               !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
> +         udev is now a virtual package.
> +         Packages requiring udevd at run time or libudev/gudev at build time
> +         should select it.

I'm not sure a help message is very useful for a hidden symbol, but
anyway it does not hurt ;-)

> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index db86850..d274246 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -4,48 +4,17 @@
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
> -UDEV_CONF_OPT =                        \
> -       --sbindir=/sbin         \
> -       --with-rootlibdir=/lib  \
> -       --libexecdir=/lib       \
> -       --with-usb-ids-path=/usr/share/hwdata/usb.ids   \
> -       --with-pci-ids-path=/usr/share/hwdata/pci.ids   \
> -       --with-firmware-path=/lib/firmware              \
> -       --disable-introspection
> -
> -UDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> -
> -ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
> -UDEV_CONF_OPT += --enable-rule_generator
> -endif
> -
> -ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
> -UDEV_DEPENDENCIES += acl hwdata libglib2
> -UDEV_CONF_OPT +=               \
> -       --enable-udev_acl
> -else
> -UDEV_CONF_OPT +=               \
> -       --disable-gudev
> +ifeq ($(BR2_PACKAGE_EUDEV),y)
> +UDEV_DEPENDENCIES += eudev
>  endif
>
> -ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -       UDEV_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system/
> -endif
> -
> -define UDEV_INSTALL_INITSCRIPT
> -       $(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
> +ifeq ($(UDEV_DEPENDENCIES),)
> +define UDEV_CONFIGURE_CMDS
> +       echo "No Udev implementation selected. Configuration error."
> +       exit 1
>  endef

The error can be raised here using the make primitive:

$(error No Udev implementation selected. Configuration error.)

> +endif
>
> -UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
> -
> -$(eval $(autotools-package))
> +$(eval $(generic-package))
> diff --git a/package/udisks/Config.in b/package/udisks/Config.in
> index e9539a3..d560b6c 100644
> --- a/package/udisks/Config.in
> +++ b/package/udisks/Config.in
> @@ -1,11 +1,9 @@
>  config BR2_PACKAGE_UDISKS
>         bool "udisks"
>         depends on !BR2_avr32 # udev
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +       depends on BR2_PACKAGE_HAS_UDEV
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
>         depends on BR2_USE_MMU # lvm2
> -       select BR2_PACKAGE_UDEV
> -       select BR2_PACKAGE_UDEV_ALL_EXTRAS

ditto (select acl and libglib2)

>         select BR2_PACKAGE_DBUS
>         select BR2_PACKAGE_DBUS_GLIB
>         depends on BR2_USE_WCHAR # dbus-glib -> glib2
> @@ -36,8 +34,12 @@ config BR2_PACKAGE_UDISKS_LVM2
>
>  endif
>
> -comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
> +comment "udisks needs udev /dev management"
>         depends on !BR2_avr32
>         depends on BR2_USE_MMU
> -       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
> -               !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_PACKAGE_HAS_UDEV
> +
> +comment "udisks needs a toolchain w/ wchar, threads"
> +       depends on !BR2_avr32
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

[...]

Regards,

-- 
Samuel
