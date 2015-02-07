From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Feb 2015 14:53:22 +0100
Subject: [Buildroot] [PATCH 06/11 v7] package/eudev: split udev/libudev
In-Reply-To: <cover.1423317174.git.yann.morin.1998@free.fr>
References: <cover.1423317174.git.yann.morin.1998@free.fr>
Message-ID: <1173e1bc3a763340a6e65f43d2ba8b8e71da23b4.1423317174.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quite a few packages are happy with just libudev, and not a full udev
daemon running.

Split the eudev package so that we can install just libudev if
/dev management is not handled by eudev.

When only the library is installed, behave as a provider for the libudev
virtual package. If /dev management is handled by eudev, then also be a
provider for the udev virtual package.

Adjust comments of dependencies accordingly.

Note:
    Most of the .mk splitting of the dependencies and the build/install
    rules are from Bernd. Thanks! :-)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[ Compiled for x86 target with glibc 2.18 and Kernel headers 3.15.x ]
Tested-by: Cedric Chedaleux <cedric.chedaleux@orange.com>

---
Changes v4 -> v5:
  - building libudev requires two steps  (Bernd)

Changes RFCv2-> v3:
  - typo s/system/systemd/

Changes RFCv1 -> RFCv2:
  - be a provider for libudev always, since udev is not such a provider
    any more  (Thomas)
---
 package/eudev/Config.in | 34 ++++++++++++++++++++++++-------
 package/eudev/eudev.mk  | 53 ++++++++++++++++++++++++++++++++++++++++++++-----
 system/Config.in        | 22 +++++++++++++++-----
 3 files changed, 92 insertions(+), 17 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 7915f4b..77abffc 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,13 +1,33 @@
 config BR2_PACKAGE_EUDEV
 	bool "eudev"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	depends on !BR2_avr32 # no __NR_name_to_handle_at
+	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_HAS_LIBUDEV
+	help
+	  eudev is a fork of systemd-udev with the goal of obtaining better
+	  compatibility with existing software.
+
+	  This installs only the libudev library.
+
+	  http://www.gentoo.org/proj/en/eudev/
+
+if BR2_PACKAGE_EUDEV
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "eudev"
+
+config BR2_PACKAGE_EUDEV_DAEMON
+	bool "udev daemon"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on !BR2_avr32 # no epoll_create1
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on !BR2_STATIC_LIBS # kmod
-	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -21,10 +41,7 @@ config BR2_PACKAGE_EUDEV
 
 	  http://www.gentoo.org/proj/en/eudev/
 
-if BR2_PACKAGE_EUDEV
-
-config BR2_PACKAGE_PROVIDES_LIBUDEV
-	default "eudev"
+if BR2_PACKAGE_EUDEV_DAEMON
 
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
@@ -34,15 +51,18 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 	help
 	  Enable persistent rules generator
 
-endif
+endif # BR2_PACKAGE_EUDEV_DAEMON
 
-comment "eudev needs eudev /dev management"
+comment "udev daemon needs eudev /dev management"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 
+endif # BR2_PACKAGE_EUDEV
+
 comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 11eee68..121434c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -16,19 +16,28 @@ EUDEV_CONF_ENV += LIBS=-lrt
 
 EUDEV_CONF_OPTS =		\
 	--disable-manpages	\
-	--sbindir=/sbin		\
 	--with-rootlibdir=/lib	\
 	--libexecdir=/lib	\
 	--with-firmware-path=/lib/firmware	\
 	--disable-introspection			\
-	--enable-split-usr			\
-	--enable-libkmod
+	--enable-split-usr
+
+EUDEV_DEPENDENCIES = host-pkgconf
+EUDEV_PROVIDES = libudev
+
+ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
+
+EUDEV_DEPENDENCIES += host-gperf util-linux kmod
+EUDEV_PROVIDES += udev
 
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
-EUDEV_PROVIDES = libudev udev
+EUDEV_CONF_OPTS += \
+	--sbindir=/sbin \
+	--enable-libkmod
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPTS += --enable-rule_generator
+else
+EUDEV_CONF_OPTS += --disable-rule_generator
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
@@ -47,4 +56,38 @@ define EUDEV_USERS
 	- - input -1 * - - - Input device group
 endef
 
+else # ! daemon
+
+EUDEV_CONF_OPTS += \
+	--disable-keymap \
+	--disable-libkmod \
+	--disable-modules \
+	--disable-selinux \
+	--disable-rule-generator \
+	--disable-gtk-doc \
+	--disable-gudev
+
+# When not installing the daemon, we have to override the build and install
+# commands, to just install the library.
+
+define EUDEV_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/shared
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev
+endef
+
+# Symlink udev.pc to libudev.pc for those packages that conflate the two
+# and 'Requires: udev' when they should just 'Requires: libudev'. Do the
+# symlink, to avoid patching each and all of those packages.
+# Note: nothing to install from src/shared, only from src/libudev
+define EUDEV_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(STAGING_DIR) install
+	ln -sf libudev.pc $(STAGING_DIR)/usr/lib/pkgconfig/udev.pc
+endef
+
+define EUDEV_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(TARGET_DIR) install
+endef
+
+endif # ! daemon
+
 $(eval $(autotools-package))
diff --git a/system/Config.in b/system/Config.in
index 95e10ab..68a124f 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -125,12 +125,24 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
 	depends on !BR2_avr32 # eudev
-	depends on BR2_LARGEFILE
-	depends on BR2_USE_WCHAR
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_MMU # eudev
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	depends on BR2_USE_MMU # eudev (fork)
+	depends on BR2_LARGEFILE # eudev-daemon (util-linux)
+	depends on BR2_USE_WCHAR # eudev (util-linux)
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9 # eudev
+	depends on !BR2_STATIC_LIBS # eudev
 	select BR2_PACKAGE_EUDEV
+	select BR2_PACKAGE_EUDEV_DAEMON
+	help
+	  Userspace device daemon. This is a standalone version,
+	  independent of systemd. It is a fork maintained by Gentoo.
+
+	  eudev requires a Linux kernel >= 3.9: it relies on devtmpfs
+	  and inotify.
+
+	  You can further configure eudev in:
+	    Target packages --> Hardware handling --> eudev
+
+	  http://dev.gentoo.org/~blueness/eudev
 
 comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
 	depends on !BR2_avr32 # eudev
-- 
1.9.1
