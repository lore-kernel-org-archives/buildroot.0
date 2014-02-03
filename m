From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 3 Feb 2014 23:10:03 +0100
Subject: [Buildroot] [PATCH v6 4/5] systemd: bump to v207.
In-Reply-To: <1389627907-7821-5-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389627907-7821-5-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAAXf6LWtpJ5j04oRE8j+Msbrurf=oJ2OGsUOj20kFNQM-j0rLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Mon, Jan 13, 2014 at 4:45 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> This patch bumps systemd to v207 but also declares it as a provider for the
> udev virtual package.
>
> Starting with systemd 183, udev has been merged into
> systemd. The udev daemon is now installed as /lib/systemd/systemd-udevd.
> This means that /dev management using udev is only available if systemd
> is chosen as init system.
>
> When configuring systemd, the following options are available:
>
> - activation of systemd-journal-gatewayd, to access the journal via
>   HTTP.
> - activation of extra features like journal compression and sealing.
>
> Support for uClibc has also been removed because:
>
> - upstream has no interest in supporting uClibc.
> - using a shrinked libc brings no advantage, given the size of all the
>   programs included in Systemd. So using glibc does not matter.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  Config.in.legacy                             |    2 +-
>  linux/linux.mk                               |    1 +
>  package/systemd/Config.in                    |   56 +++++++++++++--
>  package/systemd/systemd-fix-getty-unit.patch |   36 +++++-----
>  package/systemd/systemd-fix-page-size.patch  |   43 -----------
>  package/systemd/systemd-uclibc-fix.patch     |   59 ----------------
>  package/systemd/systemd.mk                   |   98 ++++++++++++++++++--------
>  package/udev/udev.mk                         |    4 ++
>  system/Config.in                             |   26 +++++--
>  9 files changed, 165 insertions(+), 160 deletions(-)
>  delete mode 100644 package/systemd/systemd-fix-page-size.patch
>  delete mode 100644 package/systemd/systemd-uclibc-fix.patch
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5d80842..f56308f 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -240,7 +240,7 @@ config BR2_PACKAGE_UDEV
>         select BR2_PACKAGE_HAS_UDEV
>         help
>           The 'udev' package is now a virtual package. It is
> -         currently only provided by 'eudev'.
> +         currently provided by 'eudev' or 'systemd'.
>
>
>  ###############################################################################
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 17365a0..e12dd39 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -194,6 +194,7 @@ define LINUX_CONFIGURE_CMDS
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
>         $(if $(BR2_PACKAGE_SYSTEMD),
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
> +               $(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
>         $(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>         yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 500e623..2662492 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -1,11 +1,21 @@
>  config BR2_PACKAGE_SYSTEMD
>         bool "systemd"
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> +       depends on BR2_INIT_SYSTEMD
> +       depends on !BR2_avr32 # no epoll_create1
> +       depends on BR2_LARGEFILE # util-linux
> +       depends on BR2_USE_WCHAR # util-linux
>         depends on BR2_INET_IPV6
> +       depends on !BR2_PREFER_STATIC_LIB # kmod
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>         depends on BR2_USE_MMU # dbus
> +       select BR2_PACKAGE_HAS_UDEV
>         select BR2_PACKAGE_DBUS
>         select BR2_PACKAGE_LIBCAP
> +       select BR2_PACKAGE_UTIL_LINUX
> +       select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +       select BR2_PACKAGE_KMOD
> +       select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
> +       select BR2_PACKAGE_KMOD_TOOLS
>         help
>           systemd is a system and service manager for Linux, compatible with
>           SysV and LSB init scripts. systemd provides aggressive parallelization
> @@ -16,9 +26,47 @@ config BR2_PACKAGE_SYSTEMD
>           elaborate transactional dependency-based service control logic.
>           It can work as a drop-in replacement for sysvinit.
>
> +         Systemd requires a Linux kernel >= 3.0, with inotify, devtmpfs,
> +         tmpfs vfs and tmpfs POSIX ACL enabled.
> +
> +         Systemd also provides udev, the userspace device daemon.
> +
> +         The selection of other packages will enable some features:
> +
> +         - libglib2 package will add support for gudev.
> +         - acl package will add support for multi-seat.
> +
>           http://freedesktop.org/wiki/Software/systemd
>
> -comment "systemd needs eudev /dev management and a toolchain w/ IPv6, threads"
> +if BR2_PACKAGE_SYSTEMD
> +
> +config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
> +       bool "enable all extras"
> +       select BR2_PACKAGE_XZ
> +       select BR2_PACKAGE_LIBGCRYPT
> +       help
> +         Enable extra features for Systemd: journal compression and
> +         signing.
> +
> +config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
> +        bool "HTTP server for journal events"

This is indented with spaces instead of a tab.

> +       select BR2_PACKAGE_LIBMICROHTTPD
> +       help
> +         systemd-journal-gatewayd serves journal events over the
> +         network. Clients must connect using HTTP. The server
> +         listens on port 19531 by default.
> +
> +         http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
> +
> +endif
> +
> +if BR2_INIT_SYSTEMD
> +comment "systemd needs a toolchain w/ largefile, wchar, IPv6, threads"
> +       depends on BR2_avr32
>         depends on BR2_USE_MMU
> -       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV || !BR2_INET_IPV6 || \\
> -               !BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
> +                    BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
> +
> +comment "systemd needs a toolchain w/ dynamic library"
> +       depends on BR2_PREFER_STATIC_LIB
> +endif

This comment isn't really needed: if you have systemd enabled, it
means you already have all dependencies mentioned in system/Config.in.

Also, the dependencies of the comment are anyway not correct:
currently the comment is only showed for avr32, while in fact we want
the inverse (for avr32 systemd is never available, so neither should
the comment).

[..]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index a5dc8e5..bca3058 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,75 +4,117 @@
>  #
>  ################################################################################
>
> -SYSTEMD_VERSION = 44
> +SYSTEMD_VERSION = 207
>  SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
>  SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
>  SYSTEMD_LICENSE = GPLv2+
> -SYSTEMD_LICENSE_FILES = LICENSE
> +SYSTEMD_LICENSE_FILES = LICENSE.GPLV2 LICENSE.LGPL2.1 LICENSE.MIT
>  SYSTEMD_INSTALL_STAGING = YES
>  SYSTEMD_DEPENDENCIES = \
>         host-intltool \
>         libcap \
> -       udev \
> -       dbus
> +       dbus \
> +       util-linux \
> +       kmod
>
>  # Make sure that systemd will always be built after busybox so that we have
>  # a consistent init setup between two builds
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -       SYSTEMD_DEPENDENCIES += busybox
> +SYSTEMD_DEPENDENCIES += busybox
>  endif
>
>  SYSTEMD_CONF_OPT += \
> -       --with-distro=other \
> +       --with-rootprefix= \
> +       --with-rootlibdir=/lib \
> +       --localstatedir=/var \
> +       --enable-static=no \
> +       --disable-manpages \
>         --disable-selinux \
>         --disable-pam \
>         --disable-libcryptsetup \
> -       --disable-gtk \
> -       --disable-plymouth \
> -       --with-rootdir=/ \
>         --with-dbuspolicydir=/etc/dbus-1/system.d \
>         --with-dbussessionservicedir=/usr/share/dbus-1/services \
>         --with-dbussystemservicedir=/usr/share/dbus-1/system-services \
>         --with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
> -       --with-udevrulesdir=/etc/udev/rules.d \
> -       --with-sysvinit-path=/etc/init.d/ \
> -       --without-sysvrcd-path \
> -       --enable-split-usr
> +       --with-firmware-path=/lib/firmware \
> +       --enable-split-usr \
> +       --enable-introspection=no \
> +       --disable-efi \
> +       --disable-myhostname \
> +       --disable-tcpwrap \
> +       --disable-tests \
> +       --without-python
>
>  ifeq ($(BR2_PACKAGE_ACL),y)
> -       SYSTEMD_CONF_OPT += --enable-acl
> -       SYSTEMD_DEPENDENCIES += acl
> +SYSTEMD_CONF_OPT += --enable-acl
> +SYSTEMD_DEPENDENCIES += acl
>  else
> -       SYSTEMD_CONF_OPT += --disable-acl
> +SYSTEMD_CONF_OPT += --disable-acl
>  endif
>
> -ifneq ($(BR2_LARGEFILE),y)
> -       SYSTEMD_CONF_OPT += --disable-largefile
> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> +SYSTEMD_CONF_OPT += --enable-gudev
> +SYSTEMD_DEPENDENCIES += libglib2
> +else
> +SYSTEMD_CONF_OPT += --disable-gudev
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
> +SYSTEMD_DEPENDENCIES += \
> +       xz              \
> +       libgcrypt
> +SYSTEMD_CONF_OPT +=    \
> +       --enable-xz     \
> +       --enable-gcrypt \
> +       --with-libgcrypt-prefix=$(STAGING_DIR)/usr
> +else
> +SYSTEMD_CONF_OPT +=    \
> +       --disable-xz    \
> +       --disable-gcrypt
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
> +SYSTEMD_DEPENDENCIES += libmicrohttpd
> +else
> +SYSTEMD_CONF_OPT += --disable-microhttpd
>  endif
>
>  # mq_getattr needs -lrt
>  SYSTEMD_MAKE_OPT += LIBS=-lrt
>  SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
>
> -ifeq ($(BR2_INIT_SYSTEMD),y)
>  define SYSTEMD_INSTALL_INIT_HOOK
> -       ln -fs ../usr/lib/systemd/systemd $(TARGET_DIR)/sbin/init
> -       ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/halt
> -       ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/poweroff
> -       ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/reboot
> +       ln -fs ../lib/systemd/systemd $(TARGET_DIR)/sbin/init
> +       ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
> +       ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
> +       ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
>
> -       ln -fs ../../../usr/lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
> +       ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
>  endef
> -SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> -       SYSTEMD_INSTALL_INIT_HOOK
> -endif
>
>  define SYSTEMD_INSTALL_TTY_HOOK
>         rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
> -       ln -fs ../../../../usr/lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> +       ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> +endef
> +
> +define SYSTEMD_INSTALL_MACHINEID_HOOK
> +       touch $(TARGET_DIR)/etc/machine-id
> +endef
> +
> +define SYSTEMD_SANITIZE_PATH_IN_UNITS
> +       find $(TARGET_DIR)/lib/systemd/system -name '*.service' \
> +               -exec sed -i -e 's,$(HOST_DIR),,g' {} \;

On this line, 'sed -i' should be replaced with $(SED) (defined in
package/Makefile.in)

>  endef
>
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> +       SYSTEMD_INSTALL_INIT_HOOK \
>         SYSTEMD_INSTALL_TTY_HOOK \
> +       SYSTEMD_INSTALL_MACHINEID_HOOK \
> +       SYSTEMD_SANITIZE_PATH_IN_UNITS
> +
> +define SYSTEMD_USERS
> +       systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
> +       systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
> +endef
>
>  $(eval $(autotools-package))
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index d274246..a5d0f80 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_EUDEV),y)
>  UDEV_DEPENDENCIES += eudev
>  endif
>
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +UDEV_DEPENDENCIES += systemd
> +endif
> +
>  ifeq ($(UDEV_DEPENDENCIES),)
>  define UDEV_CONFIGURE_CMDS
>         echo "No Udev implementation selected. Configuration error."
> diff --git a/system/Config.in b/system/Config.in
> index 18f27bf..b1b54ff 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -86,20 +86,31 @@ config BR2_INIT_SYSV
>
>  config BR2_INIT_SYSTEMD
>         bool "systemd"
> +       depends on !BR2_avr32 # no epoll_create1
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
>         depends on BR2_LARGEFILE
>         depends on BR2_USE_WCHAR
>         depends on BR2_INET_IPV6
> -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_TOOLCHAIN_HAS_SSP
>         depends on BR2_USE_MMU
> -       select BR2_PACKAGE_DBUS
> +       depends on !BR2_PREFER_STATIC_LIB
>         select BR2_PACKAGE_SYSTEMD
>
> -comment 'systemd needs eudev /dev management and a toolchain w/ largefile, wchar, IPv6, threads'
> +comment 'systemd needs a (e)glibc toolchain'
> +       depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
> +comment 'systemd needs a toolchain w/ largefile, wchar, IPv6, threads'
> +       depends on BR2_avr32
>         depends on BR2_USE_MMU
>         depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
> -                    BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
> -                    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV)
> +                    BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
> +
> +comment 'systemd needs a toolchain w/ SSP'
> +       depends on !BR2_TOOLCHAIN_HAS_SSP
> +
> +comment "systemd needs a toolchain w/ dynamic library"
> +       depends on BR2_PREFER_STATIC_LIB

These comments should actually be one. However, we just realized that
glibc toolchains are always with largefile, wchar, ipv6, threads, SSP
and dynamic library support. So the comment can be reduced to:

systemd needs an (e)glibc toolchain
(note the 'an')

(this is a simplification we should actually make tree-wide and
document in the manual, but this is for another patch).

>
>  config BR2_INIT_NONE
>         bool "None"
> @@ -107,7 +118,7 @@ config BR2_INIT_NONE
>  endchoice
>
>  choice
> -       prompt "/dev management"
> +       prompt "/dev management" if !BR2_INIT_SYSTEMD
>         default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
>
>  config BR2_ROOTFS_DEVICE_CREATION_STATIC
> @@ -137,6 +148,9 @@ comment "eudev needs a toolchain w/ dynamic library"
>
>  endchoice
>
> +comment "/dev management using udev (from systemd)"
> +       depends on BR2_INIT_SYSTEMD
> +
>  config BR2_ROOTFS_DEVICE_TABLE
>         string "Path to the permission tables"
>         default "system/device_table.txt"
> --


Best regards,
Thomas
