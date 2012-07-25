From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 11:31:10 +0200
Subject: [Buildroot] [PATCH] dbus: requires thread support
Message-ID: <1343208670-19908-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As can be seen on the build result at
http://autobuild.buildroot.org/results/20f1078ef7dc5f187b04c63ef70e8b43acf9bb3a/build-end.log,
D-Bus requires thread support in the toolchain.

This commit adjusts the Kconfig dependencies of D-Bus and all its
reverse dependencies to depend on thread support in the toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/Config.in     |    5 +++--
 package/connman/Config.in         |    6 ++++--
 package/dbus/Config.in            |    4 ++++
 package/efl/libedbus/Config.in    |    4 ++++
 package/network-manager/Config.in |    7 ++++---
 package/ofono/Config.in           |    6 ++++--
 package/qt/Config.in              |    4 ++++
 package/samba/Config.in           |    5 +++--
 package/systemd/Config.in         |    6 ++++--
 9 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 3517407..f5a02d6 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -30,5 +31,5 @@ config BR2_PACKAGE_BLUEZ_UTILS_USB
 
 endif
 
-comment "bluez-utils require a toolchain with WCHAR support"
-	depends on !(BR2_USE_WCHAR)
+comment "bluez-utils require a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 2fcb6c1..082b0ca 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
 	  managing internet connections within embedded devices running
@@ -46,5 +47,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain with IPv6, WCHAR and resolver support"
-	depends on BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32 || !BR2_USE_WCHAR || !BR2_INET_IPV6
+comment "connman needs a toolchain with IPv6, WCHAR, thread and resolver support"
+	depends on BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32 || \
+		!BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 54a8540..2b04e94 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DBUS
 	bool "dbus"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The D-Bus message bus system.
 
@@ -23,3 +24,6 @@ choice
 		select BR2_PACKAGE_LIBXML2
 
 endchoice
+
+comment "dbus requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 0914b37..985939e 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBEDBUS
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_DBUS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	help
 	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
 	  easily used by EFL applications, automatically providing
@@ -30,3 +31,6 @@ config BR2_PACKAGE_LIBEDBUS_NOTIFY
 	  Notify support.
 
 endif
+
+comment "libedbus requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index a120d01..3f01fef 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
@@ -24,6 +25,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 
 	  http://projects.gnome.org/NetworkManager/
 
-comment "NetworkManager requires a toolchain with IPV6, LARGEFILE and WCHAR support"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR
-
+comment "NetworkManager requires a toolchain with IPV6, LARGEFILE, WCHAR and thread support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index fc6c9c6..74c8b53 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OFONO
 	bool "ofono"
 	depends on BR2_USE_WCHAR # gettext/libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -12,5 +13,6 @@ config BR2_PACKAGE_OFONO
 
 	  http://ofono.org/
 
-comment "ofono requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "ofono requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 88855d2..b75f224 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -285,9 +285,13 @@ endif
 config BR2_PACKAGE_QT_DBUS
 	bool "DBus Module"
 	select BR2_PACKAGE_DBUS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	help
 	  Build the Qt DBus module.
 
+comment "DBus Module requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_QT_XML
 	bool "XML Module"
 	default y
diff --git a/package/samba/Config.in b/package/samba/Config.in
index cebf7d9..e88b360 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -225,12 +225,13 @@ config BR2_PACKAGE_SAMBA_AVAHI
 	bool "support avahi"
 	default y
 	depends on BR2_PACKAGE_AVAHI_DAEMON
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	select BR2_PACKAGE_DBUS
 	help
 	  Include support for avahi
 
-comment "support avahi - disabled (requires avahi-daemon)"
-	depends on !BR2_PACKAGE_AVAHI_DAEMON
+comment "support avahi - disabled (requires avahi-daemon and thread support in toolchain)"
+	depends on !BR2_PACKAGE_AVAHI_DAEMON || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_SAMBA_GAMIN
 	bool "support gamin"
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 8df3318..0e7fc39 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCAP
 	help
@@ -16,5 +17,6 @@ config BR2_PACKAGE_SYSTEMD
 
 	  http://freedesktop.org/wiki/Software/systemd
 
-comment "systemd not available (depends on /dev management with udev and ipv6 support)"
-	depends on !(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV && BR2_INET_IPV6)
+comment "systemd not available (depends on /dev management with udev and ipv6 support, and thread support in toolchain)"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.9.5
