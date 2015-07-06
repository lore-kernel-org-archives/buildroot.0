From: Nathaniel Roach <nroach44@gmail.com>
Date: Tue,  7 Jul 2015 00:56:04 +0800
Subject: [Buildroot] [PATCH 2/2] libgudev: New package
Message-ID: <1436201764-23614-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As libgudev recently was split from the main systemd/udev source,
	this library is now required to build NetworkManager.

Add the package; add it as a dependency to NetworkManager; and
	tweak systemd's Config.in message accordingly.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/Config.in                          |  1 +
 package/libgudev/Config.in                 | 11 +++++++++++
 package/libgudev/libgudev.mk               | 16 ++++++++++++++++
 package/network-manager/Config.in          |  1 +
 package/network-manager/network-manager.mk |  3 ++-
 package/systemd/Config.in                  |  1 -
 6 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 package/libgudev/Config.in
 create mode 100644 package/libgudev/libgudev.mk

diff --git a/package/Config.in b/package/Config.in
index 23858ca..4a23dfc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -368,6 +368,7 @@ endif
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/libgudev/Config.in"
 	source "package/libump/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
new file mode 100644
index 0000000..09a82a0
--- /dev/null
+++ b/package/libgudev/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBGUDEV
+	bool "libgudev"
+	depends on BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  This library provides GObject bindings for libudev.
+	  It was originally part of udev-extras, then udev, then systemd.
+	  It's now a project on its own.
+	  Required for building NetworkManager.
+	  
+	  https://wiki.gnome.org/Projects/libgudev
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
new file mode 100644
index 0000000..2769b48
--- /dev/null
+++ b/package/libgudev/libgudev.mk
@@ -0,0 +1,16 @@
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
+LIBGUDEV_LICENSE = GPLv2
+
+$(eval $(autotools-package))
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index bcf8f90..8b4607c 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index c118a92..36eb352 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -10,7 +10,8 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
-	libgcrypt wireless_tools util-linux host-intltool readline libndp
+	libgcrypt wireless_tools util-linux host-intltool readline libndp \
+	libgudev
 NETWORK_MANAGER_LICENSE = GPLv2+ (app), LGPLv2+ (libnm-util)
 NETWORK_MANAGER_LICENSE_FILES = COPYING libnm-util/COPYING
 
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
