From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 3 Feb 2014 22:41:03 +0100
Subject: [Buildroot] [PATCH v6 3/5] udev: convert to virtual package.
In-Reply-To: <1389627907-7821-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389627907-7821-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAAXf6LXUD2hAt+_0JUyXHgwOGqHVwe4J7-AkekopnR-LixKOAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Mon, Jan 13, 2014 at 4:45 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> This patch converts udev to a virtual package. For the moment, there is only
> one provider for the udev features: eudev.
>
> Packages meant to provide udev-like features must select the symbol
> BR2_PACKAGE_HAS_UDEV.
>
> Packages depending on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV or
> BR2_PACKAGE_UDEV have been converted to use the new symbol.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  Config.in.legacy                                   |    8 ++++
>  docs/manual/adding-packages-directory.txt          |    3 +-
>  package/ccid/ccid.mk                               |    2 +-
>  package/eudev/Config.in                            |    1 +
>  package/gpsd/gpsd.mk                               |    2 +-
>  package/libatasmart/Config.in                      |    4 +-
>  package/libcec/libcec.mk                           |    2 +-
>  package/libdrm/libdrm.mk                           |    2 +-
>  package/libmbim/Config.in                          |    5 +-
>  package/modem-manager/Config.in                    |    6 +--
>  package/network-manager/Config.in                  |    8 ++--
>  package/ofono/ofono.mk                             |    2 +-
>  package/pcsc-lite/Config.in                        |    2 +-
>  package/pcsc-lite/pcsc-lite.mk                     |    2 +-
>  package/pulseaudio/pulseaudio.mk                   |    2 +-
>  package/systemd/Config.in                          |    6 +--
>  package/udev/Config.in                             |   49 +-------------------
>  package/udev/udev.mk                               |   49 ++++----------------
>  package/udisks/Config.in                           |    8 ++--
>  package/usbmount/Config.in                         |    4 +-
>  package/weston/Config.in                           |    4 +-
>  package/x11r7/xdriver_xf86-input-evdev/Config.in   |    4 +-
>  .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
>  package/xenomai/xenomai.mk                         |    2 +-
>  system/Config.in                                   |   22 ++-------
>  25 files changed, 55 insertions(+), 146 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 01bf16b..5d80842 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -235,6 +235,14 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION_WRAP
>  # Note: BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION is still referenced from
>  # linux/Config.in
>
> +config BR2_PACKAGE_UDEV
> +       bool "udev is now a virtual package"
> +       select BR2_PACKAGE_HAS_UDEV
> +       help
> +         The 'udev' package is now a virtual package. It is
> +         currently only provided by 'eudev'.
> +
> +

This is more of a nitpick, but the convention is to add new legacy
options at the front (just below the release indicator) instead of at
the bottom of that section.

>  ###############################################################################
>  comment "Legacy options removed in 2013.08"
>
[..]
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_SYSTEMD
>         bool "systemd"
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>         depends on BR2_INET_IPV6
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>         depends on BR2_USE_MMU # dbus
> @@ -18,7 +18,7 @@ config BR2_PACKAGE_SYSTEMD
>
>           http://freedesktop.org/wiki/Software/systemd
>
> -comment "systemd needs udev /dev management and a toolchain w/ IPv6, threads"
> +comment "systemd needs eudev /dev management and a toolchain w/ IPv6, threads"
>         depends on BR2_USE_MMU
> -       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \
> +       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV || !BR2_INET_IPV6 || \\
>                 !BR2_TOOLCHAIN_HAS_THREADS

These changes are odd: you indicate here that systemd is depending on
eudev, while eudev is precisely an alternative provider of udev than
systemd. So:

       udev
       /   \
systemd     eudev

and there is no direct relation between systemd and eudev. In the next
patch, you replace this again with BR2_INIT_SYSTEMD, which makes sense
again, but the transition is odd.

Directly related to this, we question the need to rename
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV to
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV. First of all, the symbol
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is already existing in users'
defconfig. Removing it requires the addition of a new legacy symbol
(not only for BR2_PACKAGE_UDEV, which you already added, but also for
the DEVICE_CREATION_DYNAMIC one).
Users that previously selected udev, should be moved to eudev, rather
than systemd. Our suggestion is to keep the existing
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV symbol to indicate the eudev
choice, rendering the massive rename in the previous patch unneeded,
removing the above odd systemd transition, and avoiding the need for
legacy handling. What do you think of that?

> diff --git a/package/udev/Config.in b/package/udev/Config.in
> index 7aa79c4..1c9251b 100644
> --- a/package/udev/Config.in
> +++ b/package/udev/Config.in
> @@ -1,47 +1,2 @@
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
> -       help
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
> +config BR2_PACKAGE_HAS_UDEV
> +       bool

Maybe you could add a comment in udev/Config.in and udev/udev.mk
clarifying that this is now a virtual package.

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
> +endif
>
> -UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
> -
> -$(eval $(autotools-package))
> +$(eval $(generic-package))
> diff --git a/package/udisks/Config.in b/package/udisks/Config.in
> index e9539a3..62d5598 100644
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
>         select BR2_PACKAGE_DBUS
>         select BR2_PACKAGE_DBUS_GLIB
>         depends on BR2_USE_WCHAR # dbus-glib -> glib2
> @@ -36,8 +34,8 @@ config BR2_PACKAGE_UDISKS_LVM2
>
>  endif
>
> -comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
> +comment "udisks needs udev /dev mgmnt, toolchain w/ wchar, threads"

This string is not as it is described in the manual. Why did you change it?

[..]

Best regards,
Thomas
