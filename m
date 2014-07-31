From: cedric.chedaleux at orange.com <cedric.chedaleux@orange.com>
Date: Thu, 31 Jul 2014 10:59:53 +0000
Subject: [Buildroot] [PATCH 05/14 v4] package/eudev: split udev/libudev
In-Reply-To: <e0bec013e8bb144c5208518c39011b1b47f63d17.1406765723.git.yann.morin.1998@free.fr>
References: <cover.1406765723.git.yann.morin.1998@free.fr>
 <e0bec013e8bb144c5208518c39011b1b47f63d17.1406765723.git.yann.morin.1998@free.fr>
Message-ID: <639_1406804395_53DA21AB_639_6363_1_D1B3145249B37145BFF7A03F8FC244500F67A805@PEXCVZYM11.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[ Compiled for x86 target with glibc 2.18 and Kernel headers 3.15.x ]
Tested-by: Cedric Chedaleux <cedric.chedaleux@orange.com>

Regards,
C?dric CHEDALEUX

>-----Message d'origine-----
>De?: buildroot-bounces at busybox.net [mailto:buildroot-
>bounces at busybox.net] De la part de Yann E. MORIN
>Envoy??: jeudi 31 juillet 2014 02:17
>??: buildroot at buildroot.org
>Cc?: Bernd Kuhls; Thomas Petazzoni; Yann E. MORIN
>Objet?: [Buildroot] [PATCH 05/14 v4] package/eudev: split udev/libudev
>
>Quite a few packages are happy with just libudev, and not a full udev daemon
>running.
>
>Split the eudev package so that we can install just libudev if /dev management
>is not handled by eudev.
>
>When only the library is installed, behave as a provider for the libudev virtual
>package. If /dev management is handled by eudev, then also be a provider for
>the udev virtual package.
>
>Adjust comments of dependencies accordingly.
>
>Note:
>    Most of the .mk splitting of the dependencies and the build/install
>    rules are from Bernd. Thanks! :-)
>
>Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>---
>Note: although the prompt is changed to 'libusb', we still call the package
>'eudev', to avoid a mess of renaming the variables. If needed, that can be
>done in a separate patch.
>
>Changes RFCv2-> v3:
>  - typo s/system/systemd/
>
>Changes RFCv1 -> RFCv2:
>  - be a provider for libudev always, since udev is not such a provider
>    any more  (Thomas)
>---
> package/eudev/Config.in | 34 ++++++++++++++++++++++++++-------
>package/eudev/eudev.mk  | 51
>++++++++++++++++++++++++++++++++++++++++++++-----
> system/Config.in        | 20 +++++++++++++++----
> 3 files changed, 89 insertions(+), 16 deletions(-)
>
>diff --git a/package/eudev/Config.in b/package/eudev/Config.in index
>fa28a9f..bf05a0e 100644
>--- a/package/eudev/Config.in
>+++ b/package/eudev/Config.in
>@@ -1,12 +1,32 @@
> config BR2_PACKAGE_EUDEV
> 	bool "eudev"
>+	depends on !BR2_avr32 # no __NR_name_to_handle_at
>+	depends on BR2_USE_WCHAR
>+	depends on !BR2_PREFER_STATIC_LIB
>+	depends on !BR2_PACKAGE_SYSTEMD
>+	select BR2_PACKAGE_HAS_LIBUDEV
>+	help
>+	  eudev is a fork of systemd-udev with the goal of obtaining better
>+	  compatibility with existing software.
>+
>+	  This installs only the libudev library.
>+
>+	  http://www.gentoo.org/proj/en/eudev/
>+
>+if BR2_PACKAGE_EUDEV
>+
>+config BR2_PACKAGE_PROVIDES_LIBUDEV
>+	default "eudev"
>+
>+config BR2_PACKAGE_EUDEV_DAEMON
>+	bool "udev daemon"
>+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> 	depends on !BR2_avr32 # no epoll_create1
> 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> 	depends on BR2_USE_MMU # uses fork()
> 	depends on BR2_LARGEFILE # util-linux
> 	depends on BR2_USE_WCHAR # util-linux
> 	depends on !BR2_PREFER_STATIC_LIB # kmod
>-	select BR2_PACKAGE_HAS_LIBUDEV
> 	select BR2_PACKAGE_HAS_UDEV
> 	select BR2_PACKAGE_UTIL_LINUX
> 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID @@ -20,10 +40,7 @@
>config BR2_PACKAGE_EUDEV
>
> 	  http://dev.gentoo.org/~blueness/eudev
>
>-if BR2_PACKAGE_EUDEV
>-
>-config BR2_PACKAGE_PROVIDES_LIBUDEV
>-	default "eudev"
>+if BR2_PACKAGE_EUDEV_DAEMON
>
> config BR2_PACKAGE_PROVIDES_UDEV
> 	default "eudev"
>@@ -33,14 +50,17 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
> 	help
> 	  Enable persistent rules generator
>
>-endif
>+endif # BR2_PACKAGE_EUDEV_DAEMON
>
>-comment "eudev needs eudev /dev management"
>+comment "udev daemon needs eudev /dev management"
> 	depends on !BR2_avr32
> 	depends on BR2_USE_MMU
> 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>
>+endif # BR2_PACKAGE_EUDEV
>+
> comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
> 	depends on !BR2_avr32
> 	depends on BR2_USE_MMU
> 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR ||
>BR2_PREFER_STATIC_LIB
>+	depends on !BR2_PACKAGE_SYSTEMD
>diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk index
>1cb6b26..7ab1a59 100644
>--- a/package/eudev/eudev.mk
>+++ b/package/eudev/eudev.mk
>@@ -16,19 +16,28 @@ EUDEV_CONF_ENV += LIBS=-lrt
>
> EUDEV_CONF_OPT =		\
> 	--disable-manpages	\
>-	--sbindir=/sbin		\
> 	--with-rootlibdir=/lib	\
> 	--libexecdir=/lib	\
> 	--with-firmware-path=/lib/firmware	\
> 	--disable-introspection			\
>-	--enable-split-usr			\
>-	--enable-libkmod
>+	--enable-split-usr
>+
>+EUDEV_DEPENDENCIES = host-pkgconf
>+EUDEV_PROVIDES = libudev
>+
>+ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
>+
>+EUDEV_DEPENDENCIES += host-gperf util-linux kmod EUDEV_PROVIDES +=
>udev
>
>-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod -
>EUDEV_PROVIDES = libudev udev
>+EUDEV_CONF_OPT += \
>+	--sbindir=/sbin \
>+	--enable-libkmod
>
> ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
> EUDEV_CONF_OPT += --enable-rule_generator
>+else
>+EUDEV_CONF_OPT += --disable-rule_generator
> endif
>
> ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
>@@ -42,4 +51,36 @@ define EUDEV_INSTALL_INIT_SYSV
> 	$(INSTALL) -m 0755 package/eudev/S10udev
>$(TARGET_DIR)/etc/init.d/S10udev  endef
>
>+else # ! daemon
>+
>+EUDEV_CONF_OPT += \
>+	--disable-keymap \
>+	--disable-libkmod \
>+	--disable-modules \
>+	--disable-selinux \
>+	--disable-rule-generator \
>+	--disable-gtk-doc \
>+	--disable-gudev
>+
>+# When not installing the daemon, we have to override the build and
>+install # commands, to just install the library.
>+
>+define EUDEV_BUILD_CMDS
>+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev endef
>+
>+# Symlink udev.pc to libudev.pc for those packages that conflate the
>+two # and 'Requires: udev' when they should just 'Requires: libudev'.
>+Do the # symlink, to avoid patching each and all of those packages.
>+define EUDEV_INSTALL_STAGING_CMDS
>+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev
>DESTDIR=$(STAGING_DIR) install
>+	ln -sf libudev.pc $(STAGING_DIR)/usr/lib/pkgconfig/udev.pc
>+endef
>+
>+define EUDEV_INSTALL_TARGET_CMDS
>+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev
>DESTDIR=$(TARGET_DIR)
>+install endef
>+
>+endif # ! daemon
>+
> $(eval $(autotools-package))
>diff --git a/system/Config.in b/system/Config.in index e7e146a..a2f7bac
>100644
>--- a/system/Config.in
>+++ b/system/Config.in
>@@ -125,11 +125,23 @@ config
>BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
> config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> 	bool "Dynamic using eudev"
> 	depends on !BR2_avr32 # eudev
>-	depends on BR2_LARGEFILE
>-	depends on BR2_USE_WCHAR
>-	depends on !BR2_PREFER_STATIC_LIB
>-	depends on BR2_USE_MMU # eudev
>+	depends on BR2_USE_MMU # eudev (fork)
>+	depends on BR2_LARGEFILE # eudev-daemon (util-linux)
>+	depends on BR2_USE_WCHAR # eudev (util-linux)
>+	depends on !BR2_PREFER_STATIC_LIB # eudev
> 	select BR2_PACKAGE_EUDEV
>+	select BR2_PACKAGE_EUDEV_DAEMON
>+	help
>+	  Userspace device daemon. This is a standalone version,
>+	  independent of systemd. It is a fork maintained by Gentoo.
>+
>+	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
>+	  and inotify.
>+
>+	  You can further configure eudev in:
>+	    Target packages --> Libraries --> Hardware handling --> eudev
>+
>+	  http://dev.gentoo.org/~blueness/eudev
>
> comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
> 	depends on !BR2_avr32 # eudev
>--
>1.9.1
>
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot

_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
