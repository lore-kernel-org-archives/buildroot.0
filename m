From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 07:17:37 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20130917071737.4af20d60@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear eric.le.bihan.dev at free.fr,

On Fri,  6 Sep 2013 16:01:07 +0200, eric.le.bihan.dev at free.fr wrote:
> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> 
> Udev is now a virtual package, which can be provided by either Systemd or Eudev.
> 
> eudev is the Gentoo fork of git://anongit.freedesktop.org/systemd/systemd
> with the aim of isolating udev from any particular flavor of system
> initialization. In this case, the isolation is from systemd.
> 
> From now on, if you choose to manage the device table with udev, you will have
> to choose between two providers: systemd and eudev.
> 
> These providers are mutually exclusive:
> 
>  - if systemd is chosen, the other methods (static, mdev) are not available.
>  - eudev is not available if systemd is chosen as the init system.
> 
> Systemd has been updated to version 206. Eudev v1.2 is forked from this
> version.

Thanks a lot for doing this! I'm really happy to see this making progress!

Besides some implementation details (below), I have two remaining main
concerns:

 (1) All the existing BR2_PACKAGE_UDEV* options are being renamed,
 without them being added in Config.in.legacy to provide a smooth
 migration path for users upgrading Buildroot. I believe this should be
 fixed by migrating them to eudev automatically through
 Config.in.legacy logic.

 (2) I'm not sure I like the fact that the selection of eudev vs.
 systemd to be "hidden" within the udev virtual package Config.in
 option. It means that the user needs to go in Target packages -> ...
 -> udev to be able to select between eudev vs. systemd. I believe this
 choice should be part of some option within the more global 'System
 configuration' menu, or derived from the existing options.

 There are I believe a few possibilities. The first one is to decide
 automatically based on the /dev management solution + the init system
 being used. If the /dev management solution is udev and the init
 system is *not* systemd, then eudev can be used automatically, while
 if the /dev management solution is udev and the init system is
 systemd, then systemd should be used.

 Another option is to explicitly create another /dev management option:

   - Static /dev
   - /dev with devtmpfs
   - /dev with devtmpfs + mdev
   - /dev with devtmpfs + eudev
   - /dev with devtmpfs + systemd/udev

I don't have a particular preference at the moment, but I reallly
believe it should be handled as a global System configuration option
rather than as a udev virtual package option.

> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 86ab2cf..f346aa3 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -1,11 +1,17 @@
>  config BR2_PACKAGE_SYSTEMD
>  	bool "systemd"
> +	depends on BR2_INIT_SYSTEMD
> +	depends on BR2_LARGEFILE
>  	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>  	depends on BR2_INET_IPV6
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>  	depends on BR2_USE_MMU # dbus
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	select BR2_PACKAGE_KMOD
>  	help
>  	  systemd is a system and service manager for Linux, compatible with
>  	  SysV and LSB init scripts. systemd provides aggressive parallelization
> @@ -18,6 +24,42 @@ config BR2_PACKAGE_SYSTEMD
>  
>  	  http://freedesktop.org/wiki/Software/systemd
>  
> -comment "systemd not available (depends on /dev management with udev and ipv6 support, and thread support in toolchain)"
> -	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +if BR2_PACKAGE_SYSTEMD
> +
> +config BR2_PACKAGE_SYSTEMD_ACL
> +	bool "Enable ACL"
> +	default n

There's no need to put 'default n', since this is the default.

> +	select BR2_PACKAGE_ACL
> +	help
> +	  Enable ACL support
> +
> +config BR2_PACKAGE_SYSTEMD_GUDEV
> +	bool "Build Gudev"
> +	default n
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  Build GLib bindings for udev
> +
> +config BR2_PACKAGE_SYSTEMD_COMPRESS_JOURNAL
> +	bool "Compress journal"
> +	default n
> +	select BR2_PACKAGE_XZ
> +	help
> +	  Compress the journal
> +
> +config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
> +	bool "HTTP server for journal events"
> +	default n
> +	select BR2_PACKAGE_LIBMICROHTTPD
> +	help
> +	  systemd-journal-gatewayd serves journal events over the network.
> +	  Clients must connect using HTTP. The server listens on port 19531 by
> +	  default.
> +
> +	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
> +
> +endif
> +
> +comment "systemd not available (depends on ipv6 support and thread support in toolchain)"

and largefile. Also, this comment should be more in the style of the
similar comments in other packages, like:

comment "systemd requires IPv6, thread support and largefile support in toolchain"

> +	depends on (!BR2_LARGEFILE || !BR2_INET_IPV6 || \
> +	!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INIT_SYSTEMD)
> diff --git a/package/systemd/systemd-0001-core-use-getenv-instead-of-secure_getenv-when-using-.patch b/package/systemd/systemd-0001-core-use-getenv-instead-of-secure_getenv-when-using-.patch
> new file mode 100644
> index 0000000..f0e955f
> --- /dev/null
> +++ b/package/systemd/systemd-0001-core-use-getenv-instead-of-secure_getenv-when-using-.patch
> @@ -0,0 +1,26 @@
> +From c6e94fd5b8f39fd09f703e25a226e2bd52df1f4f Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Thu, 29 Aug 2013 15:34:49 +0200
> +Subject: [PATCH 1/6] core: use getenv() instead of secure_getenv() when using
> + uClibc
> +

Missing Signed-off-by line on all the patches.

> diff --git a/package/systemd/systemd-0004-units-prefer-getty-to-agetty-in-console-setup-unit.patch b/package/systemd/systemd-0004-units-prefer-getty-to-agetty-in-console-setup-unit.patch
> new file mode 100644
> index 0000000..77ed365
> --- /dev/null
> +++ b/package/systemd/systemd-0004-units-prefer-getty-to-agetty-in-console-setup-unit.patch
> @@ -0,0 +1,39 @@
> +From a39d2ab91dbad209e6f35658327e10733fe910f0 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Thu, 29 Aug 2013 15:40:10 +0200
> +Subject: [PATCH 4/6] units: prefer getty to agetty in console setup unit

This patch was originally done by Maxime Ripard, you should keep his
authorship here (even though the patch is admittedly quite small).

> +++ b/package/systemd/systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch
> @@ -0,0 +1,417 @@
> +From acddfb947d61a21fb4146ae91b17d0e0f6c0fdd3 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Thu, 29 Aug 2013 15:44:20 +0200
> +Subject: [PATCH 5/6] core: fixed %ms sscanf() modifier not being available in
> + uClibc
> +
> +---
> + configure.ac                          |   17 +++++++++++++
> + src/core/mount-setup.c                |   10 ++++++--
> + src/core/mount.c                      |   30 +++++++++++++++++++++--
> + src/core/swap.c                       |   13 ++++++++++
> + src/core/umount.c                     |   34 +++++++++++++++++++++++---
> + src/cryptsetup/cryptsetup-generator.c |   11 +++++++++
> + src/fsck/fsck.c                       |   13 ++++++++--
> + src/shared/socket-util.c              |   10 ++++++++
> + src/tmpfiles/tmpfiles.c               |   42 +++++++++++++++++++++++++++++++++
> + 9 files changed, 171 insertions(+), 9 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 759073a..09a9cb6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -78,6 +78,23 @@ AC_PATH_PROG([KMOD], [kmod], [/usr/bin/kmod])
> + 
> + AC_PATH_PROG([KEXEC], [kexec], [/usr/sbin/kexec])
> + 
> ++# check for few functions not implemented in uClibc
> ++
> ++AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)

I believe this new test has nothing to do with the %ms scanf logic that
this patch is adding.

> ++
> ++# check for %ms modifier support - assume always no if cross compiling
> ++
> ++AC_MSG_CHECKING([whether %ms modifier is supported by *scanf])
> ++
> ++AC_RUN_IFELSE(

An AC_RUN_IFELSE test? How does that work in cross-compilation mode?

> diff --git a/package/systemd/systemd-0006-units-Added-mknod-capability-to-kmod-static-nodes.se.patch b/package/systemd/systemd-0006-units-Added-mknod-capability-to-kmod-static-nodes.se.patch
> new file mode 100644
> index 0000000..642f51e
> --- /dev/null
> +++ b/package/systemd/systemd-0006-units-Added-mknod-capability-to-kmod-static-nodes.se.patch
> @@ -0,0 +1,26 @@
> +From 3739505ce24e690a6d18ecc88abe9570eba27f67 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Thu, 29 Aug 2013 15:46:25 +0200
> +Subject: [PATCH 6/6] units: Added mknod capability to
> + kmod-static-nodes.service.
> +
> +Fixes errors seen when booting VMs on QEMU.

Just for curiosity, it'd be nice to expand a bit on what this is doing
and why it is needed (which errors, etc.).

> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index 69f011f..39dc014 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -4,48 +4,32 @@
>  #
>  ################################################################################
>  
> -UDEV_VERSION = 182
> -UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
> -UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
> -UDEV_LICENSE = GPLv2+
> -UDEV_LICENSE_FILES = COPYING
> -UDEV_INSTALL_STAGING = YES
> -
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
> +UDEV_VERSION      = 206
> +UDEV_SITE         = http://www.freedesktop.org/software/systemd/
> +UDEV_SOURCE       = systemd-$(UDEV_VERSION).tar.xz
>  
> -ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
> -UDEV_DEPENDENCIES += acl hwdata libglib2
> -UDEV_CONF_OPT +=		\
> -	--enable-udev_acl
> -else
> -UDEV_CONF_OPT +=		\
> -	--disable-gudev
> +ifeq ($(BR2_PACKAGE_UDEV_PROVIDER_EUDEV),y)
> +UDEV_DEPENDENCIES = eudev
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -	UDEV_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system/
> +ifeq ($(BR2_PACKAGE_UDEV_PROVIDER_SYSTEMD),y)
> +UDEV_DEPENDENCIES = systemd
>  endif
>  
> -define UDEV_INSTALL_INITSCRIPT
> -	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
> +define UDEV_EXTRACT_CMDS
> +	@echo "Dummy package: nothing to extract"
> +endef
> +
> +define UDEV_CONFIGURE_CMDS
> +	@echo "Dummy package: nothing to configure"
>  endef
>  
> -UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
> +define UDEV_BUILD_CMDS
> +	@echo "Dummy package: nothing to build"
> +endef
> +
> +define UDEV_CLEAN_CMDS
> +	@echo "Dummy package: nothing to clean"
> +endef

Just don't implement those comments. A virtual package should just fill
in <foo>_DEPENDENCIES and that's pretty much it.



>  
> -$(eval $(autotools-package))
> +$(eval $(generic-package))
> diff --git a/system/Config.in b/system/Config.in
> index 401285b..17ec532 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -72,14 +72,26 @@ choice
>  
>  config BR2_ROOTFS_DEVICE_CREATION_STATIC
>  	bool "Static using device table"
> +	depends on !BR2_INIT_SYSTEMD
> +
> +comment "Static using device table not available with Systemd as init system"
> +	depends on BR2_INIT_SYSTEMD
>  
>  config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
>  	bool "Dynamic using devtmpfs only"
> +	depends on !BR2_INIT_SYSTEMD
> +
> +comment "Dynamic using devtmpfs not available with Systemd as init system"
> +	depends on BR2_INIT_SYSTEMD
>  
>  config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
>  	bool "Dynamic using mdev"
> +	depends on !BR2_INIT_SYSTEMD
>  	select BR2_PACKAGE_BUSYBOX
>  
> +comment "Dynamic using mdev not available with Systemd as init system"
> +	depends on BR2_INIT_SYSTEMD

I am not sure those new comments are needed. The "/dev management"
method is selected before the init system in the logic of the
menuconfig, so the not possible init systems will not be visible if for
example a static /dev is chosen. And if anyway the user tries to go
back in the "/dev management" choice and changes his mind, then the
init system selection will automatically be modified if needed.

But well, it's true that a few more comments might help clarify what's
happening, so it's not a strong opinion from me here.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
