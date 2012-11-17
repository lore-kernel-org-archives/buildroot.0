From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 23:24:08 +0100
Subject: [Buildroot] [PATCH 10/10] dbus: uses fork(), requires MMU
In-Reply-To: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e269850f46106974a04c05f22889e61202608453.1353191025.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to solve
http://autobuild.buildroot.org/results/34f6843137efda20626af72714c110280ec577d7/build-end.log,
this patch makes the D-Bus package as well as all the packages that
select the D-Bus package 'depends on BR2_USE_MMU'.

In addition, for the specific case of gvfs, the missing
BR2_TOOLCHAIN_HAS_THREADS dependency is added (threads are required by
D-Bus, so they are also required by gvfs which selects D-Bus).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/Config.in     |    1 +
 package/connman/Config.in         |    1 +
 package/dbus/Config.in            |    2 ++
 package/efl/libedbus/Config.in    |    1 +
 package/gvfs/Config.in            |    2 ++
 package/network-manager/Config.in |    1 +
 package/ofono/Config.in           |    1 +
 package/qt/Config.in              |    1 +
 package/samba/Config.in           |    1 +
 package/systemd/Config.in         |    1 +
 system/Config.in                  |    1 +
 11 files changed, 13 insertions(+)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index c06f8cd..7ca23fc 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_BLUEZ_UTILS
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
diff --git a/package/connman/Config.in b/package/connman/Config.in
index b67b540..93f9ab5 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
 	  managing internet connections within embedded devices running
diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 2b04e94..62f3eee 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_DBUS
 	bool "dbus"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  The D-Bus message bus system.
 
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 985939e..9b57592 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBEDBUS
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_DBUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
 	help
 	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
 	  easily used by EFL applications, automatically providing
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 87f9a03..e0a945e 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_GVFS
 	bool "gvfs"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SHARED_MIME_INFO
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 3f01fef..e2324d6 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 74c8b53..6248544 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OFONO
 	bool "ofono"
 	depends on BR2_USE_WCHAR # gettext/libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/qt/Config.in b/package/qt/Config.in
index b99bf4c..fdbb598 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -286,6 +286,7 @@ config BR2_PACKAGE_QT_DBUS
 	bool "DBus Module"
 	select BR2_PACKAGE_DBUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
 	help
 	  Build the Qt DBus module.
 
diff --git a/package/samba/Config.in b/package/samba/Config.in
index b4028b1..fedbccd 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -233,6 +233,7 @@ config BR2_PACKAGE_SAMBA_AVAHI
 	default y
 	depends on BR2_PACKAGE_AVAHI_DAEMON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	help
 	  Include support for avahi
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0e7fc39..86ab2cf 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSTEMD
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCAP
 	help
diff --git a/system/Config.in b/system/Config.in
index 10c9d9d..4d5ab00 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -56,6 +56,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_INET_IPV6
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SYSTEMD
 
-- 
1.7.9.5
