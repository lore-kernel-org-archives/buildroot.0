From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 12 Jul 2015 15:24:43 +0800
Subject: [Buildroot] [PATCH v2] libgudev: New package
Message-ID: <1436685883-30497-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As libgudev recently was split from the main systemd/udev source,
	this library is now required to build NetworkManager.

This library is only relevant to systemd, as the code it contains
	is still contained in eudev.

Add the package; add it as a dependency to NetworkManager; and
	tweak systemd's Config.in message accordingly.

---
Changes v1 -> v2
(Changes as suggested by Peter Korsgaard)
 - Added the toolchain dependencies
 - Dropped NM references in package
 - Added _LICENSE_FILEs
 - Conditionally depend on libgudev in NM if using systemd

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/Config.in                          |  1 +
 package/libgudev/Config.in                 | 19 +++++++++++++++++++
 package/libgudev/libgudev.mk               | 17 +++++++++++++++++
 package/network-manager/Config.in          |  1 +
 package/network-manager/network-manager.mk |  4 ++++
 package/systemd/Config.in                  |  1 -
 6 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 package/libgudev/Config.in
 create mode 100644 package/libgudev/libgudev.mk

diff --git a/package/Config.in b/package/Config.in
index 714e2bd..a7264fc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -831,6 +831,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
+	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
new file mode 100644
index 0000000..bb74e9d
--- /dev/null
+++ b/package/libgudev/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBGUDEV
+	bool "libgudev"
+	depends on BR2_INIT_SYSTEMD
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  This library provides GObject bindings for libudev.
+	  It was originally part of udev-extras, then udev, then systemd.
+	  It's now a project on its own.
+	  Required for building some programs that use udev, when using
+	  systemd.
+
+	  https://wiki.gnome.org/Projects/libgudev
+
+comment "libgudev needs a toolchain w/ wchar, threads, and systemd"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INIT_SYSTEMD
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
new file mode 100644
index 0000000..fa15b56
--- /dev/null
+++ b/package/libgudev/libgudev.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libgudev
+#
+################################################################################
+
+LIBGUDEV_VERSION = 230
+LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
+LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
+LIBGUDEV_INSTALL_STAGING = YES
+
+LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
+
+LIBGUDEV_LICENSE = GPLv2+
+LIBGUDEV_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index bcf8f90..5a0e636 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index c118a92..04135c2 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -63,6 +63,10 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+NETWORK_MANAGER_DEPENDENCIES += libgudev
+endif
+
 # uClibc by default doesn't have backtrace support, so don't use it
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 38353d0..1c32052 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -52,7 +52,6 @@ config BR2_PACKAGE_SYSTEMD
 
 	  The selection of other packages will enable some features:
 
-	  - libglib2 package will add support for gudev.
 	  - acl package will add support for multi-seat.
 
 	  http://freedesktop.org/wiki/Software/systemd
-- 
2.1.4
