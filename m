From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  6 Nov 2013 16:34:37 +0100
Subject: [Buildroot] [PATCH v3 4/5] udev: convert to virtual package.
In-Reply-To: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1383752078-25315-5-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts udev to a virtual package. For the moment, there is only
one provider for the udev features: eudev.

Packages meant to provide udev-like features must select the symbol
BR2_PACKAGE_HAS_UDEV.

Packages depending on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV or
BR2_PACKAGE_UDEV have been converted to use the new symbol.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 Config.in.legacy                                 |    8 ++++
 package/eudev/Config.in                          |    1 -
 package/libatasmart/Config.in                    |    4 +-
 package/network-manager/Config.in                |    6 +--
 package/pcsc-lite/Config.in                      |    2 +-
 package/systemd/Config.in                        |    4 +-
 package/udev/Config.in                           |   43 +------------------
 package/udev/udev.mk                             |   49 ++++------------------
 package/udisks/Config.in                         |    8 ++--
 package/usbmount/Config.in                       |    4 +-
 package/weston/Config.in                         |    4 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in |    4 +-
 system/Config.in                                 |   19 ++-------
 13 files changed, 38 insertions(+), 118 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 588cd8b..96ccbed 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -167,6 +167,14 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION_WRAP
 # Note: BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION is still referenced from
 # linux/Config.in
 
+config BR2_PACKAGE_UDEV
+	bool "udev is now a virtual package"
+	select BR2_PACKAGE_HAS_UDEV
+	help
+	  The 'udev' package is now a virtual package. It is
+	  currently only provided by 'eudev'.
+
+
 ###############################################################################
 comment "Legacy options removed in 2013.08"
 
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 5a89325..ee485ba 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
-	depends on !BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
index a3e44f8..534e7c1 100644
--- a/package/libatasmart/Config.in
+++ b/package/libatasmart/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBATASMART
 	bool "libatasmart"
-	depends on BR2_PACKAGE_UDEV # libudev is configure dependency
+	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
 	help
 	  The libatasmart package is a disk reporting library.
 	  It only supports a subset of the ATA S.M.A.R.T. functionality.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBATASMART
 	  http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
 
 comment "libatasmart requires udev to be enabled"
-	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index f39293c..7420bd9 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,15 +1,13 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "NetworkManager"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_UDEV
-	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 87139d9..1ef9e02 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -11,7 +11,7 @@ if BR2_PACKAGE_PCSC_LITE
 
 config BR2_PACKAGE_PCSC_LITE_FORCE_LIBUSB
 	bool "use libusb"
-	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Select Y if you want to support usb smart card readers.
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 49536be..0ab10b6 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
@@ -19,5 +19,5 @@ config BR2_PACKAGE_SYSTEMD
 	  http://freedesktop.org/wiki/Software/systemd
 
 comment "systemd needs udev /dev management and a toolchain w/ IPv6, threads"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV || !BR2_INET_IPV6 || \\
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 2bcd685..1c9251b 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,41 +1,2 @@
-config BR2_PACKAGE_UDEV
-	bool "udev"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
-	depends on !BR2_PREFER_STATIC_LIB # kmod
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
-	help
-	  Userspace device daemon.
-
-	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
-
-	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
-
-if BR2_PACKAGE_UDEV
-
-config BR2_PACKAGE_UDEV_RULES_GEN
-	bool "enable rules generator"
-	help
-	  Enable persistant rules generator
-
-config BR2_PACKAGE_UDEV_ALL_EXTRAS
-	bool "enable all extras"
-	select BR2_PACKAGE_ACL
-	select BR2_PACKAGE_HWDATA
-	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	help
-	  Enable all extras with external dependencies like
-	  libacl, hwdata and libglib2
-
-comment "enabling all extras needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-endif
-
-comment "udev requires /dev mgmnt set to udev under System configuration"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+config BR2_PACKAGE_HAS_UDEV
+	bool
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index db86850..4857683 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,48 +4,17 @@
 #
 ################################################################################
 
-UDEV_VERSION = 182
-UDEV_SOURCE = udev-$(UDEV_VERSION).tar.xz
-UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-UDEV_LICENSE = GPLv2+
-UDEV_LICENSE_FILES = COPYING
-UDEV_INSTALL_STAGING = YES
+UDEV_SOURCE =
 
-# mq_getattr is in librt
-UDEV_CONF_ENV += LIBS=-lrt
-
-UDEV_CONF_OPT =			\
-	--sbindir=/sbin		\
-	--with-rootlibdir=/lib	\
-	--libexecdir=/lib	\
-	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
-	--with-pci-ids-path=/usr/share/hwdata/pci.ids	\
-	--with-firmware-path=/lib/firmware		\
-	--disable-introspection
-
-UDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
-
-ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
-UDEV_CONF_OPT += --enable-rule_generator
-endif
-
-ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
-UDEV_DEPENDENCIES += acl hwdata libglib2
-UDEV_CONF_OPT +=		\
-	--enable-udev_acl
-else
-UDEV_CONF_OPT +=		\
-	--disable-gudev
+ifeq ($(BR2_PACKAGE_EUDEV),y)
+	UDEV_DEPENDENCIES += eudev
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-	UDEV_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system/
-endif
-
-define UDEV_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+ifeq ($(UDEV_DEPENDENCIES),)
+define UDEV_CONFIGURE_CMDS
+	echo "No Udev implementation selected. Configuration error."
+	exit 1
 endef
+endif
 
-UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
-
-$(eval $(autotools-package))
+$(eval $(generic-package))
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index eae76b2..7899155 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
-	select BR2_PACKAGE_UDEV
-	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
@@ -35,6 +33,6 @@ config BR2_PACKAGE_UDISKS_LVM2
 
 endif
 
-comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
+comment "udisks requires /dev mgmnt set to udev, toolchain w/ wchar, threads"
+	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 2583e7c..0bb8883 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_USBMOUNT
 	bool "usbmount"
-	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
 	help
 	  The usbmount package automatically mounts USB mass storage devices
@@ -9,4 +9,4 @@ config BR2_PACKAGE_USBMOUNT
 	  http://usbmount.alioth.debian.org/
 
 comment "usbmount requires udev to be enabled"
-	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/weston/Config.in b/package/weston/Config.in
index b7f8468..7ce5a3c 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,5 +1,5 @@
 comment "weston needs udev and a toolchain w/ threads"
-	depends on !BR2_PACKAGE_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_HAS_PACKAGE_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -10,7 +10,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
-	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index cc159c9..05ee314 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
-	depends on BR2_PACKAGE_UDEV # libudev is configure dependency
+	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -8,4 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	  Generic Linux input driver
 
 comment "xf86-input-evdev requires udev to be enabled"
-        depends on !BR2_PACKAGE_UDEV
+        depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/system/Config.in b/system/Config.in
index 1867b25..3ee0c20 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -83,16 +83,16 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd requires largefile, wchar, IPv6, threads and udev support'
+comment 'systemd requires largefile, wchar, IPv6, threads and eudev support'
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
 		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
-		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
+		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV)
 
 config BR2_INIT_NONE
 	bool "None"
@@ -113,19 +113,6 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 	bool "Dynamic using mdev"
 	select BR2_PACKAGE_BUSYBOX
 
-config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	bool "Dynamic using udev"
-	depends on BR2_LARGEFILE # udev
-	depends on BR2_USE_WCHAR # udev
-	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
-	select BR2_PACKAGE_UDEV
-
-comment "udev requires a toolchain with LARGEFILE + WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
-
-comment "udev doesn't work with 'prefer static libraries'"
-	depends on BR2_PREFER_STATIC_LIB
-
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
 	depends on BR2_LARGEFILE
-- 
1.7.9.5
