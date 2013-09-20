From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 20 Sep 2013 14:24:06 +0200
Subject: [Buildroot] [PATCH v2 5/6] package: update dependency on udev.
In-Reply-To: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1379679847-16141-6-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages were depending on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
and selected BR2_PACKAGE_UDEV.
As udev is now a virtual package (which is provided by systemd and
sooner by eudev) and as these packages were in fact depending on udev
itself and not the type of /dev management, the symbol
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is now deprecated and replaced
by BR2_PACKAGE_HAS_UDEV.

For the moment, only systemd selects this symbol.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 Config.in.legacy                                 |    7 +++++++
 package/libatasmart/Config.in                    |    4 ++--
 package/network-manager/Config.in                |    6 ++----
 package/pcsc-lite/Config.in                      |    2 +-
 package/systemd/Config.in                        |    1 +
 package/udev/Config.in                           |    2 +-
 package/udev/udev.mk                             |   11 +++++++++++
 package/udisks/Config.in                         |    8 +++-----
 package/usbmount/Config.in                       |    4 ++--
 package/weston/Config.in                         |    4 ++--
 package/x11r7/xdriver_xf86-input-evdev/Config.in |    4 ++--
 11 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4f30b2b..f797304 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -55,6 +55,13 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
 	  The 'module-init-tools' package has been removed, since it
 	  has been depracated upstream and replaced by 'kmod'.

+config BR2_PACKAGE_UDEV
+	bool "udev is now provided by systemd or eudev"
+	select BR2_PACKAGE_HAS_UDEV
+	help
+	  The 'udev' package is now a virtual package. It can be
+	  provided by 'systemd' or 'eudev'.
+
 ###############################################################################
 comment "Legacy options removed in 2013.08"

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
index 50a3e74..b58de58 100644
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
index d6629d0..7c4bca9 100644
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
index ad92b73..63639b2 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSTEMD
 	depends on BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 23c443e..1c9251b 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,2 +1,2 @@
-config BR2_PACKAGE_UDEV
+config BR2_PACKAGE_HAS_UDEV
 	bool
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index c6fcdfc..bbb4049 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -6,4 +6,15 @@

 UDEV_SOURCE =

+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+	UDEV_DEPENDENCIES += systemd
+endif
+
+ifeq ($(UDEV_DEPENDENCIES),)
+define UDEV_CONFIGURE_CMDS
+	echo "No Udev implementation selected. Configuration error."
+	exit 1
+endef
+endif
+
 $(eval $(generic-package))
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index dca23ea..7899155 100644
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

-comment "udisks requires /dev mgmnt set to udev under System configuration and a toolchain with WCHAR and threading support"
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
index 56eb135..8818ab9 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,5 +1,5 @@
 comment "weston requires udev"
-	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV

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
--
1.7.9.5
