From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Dec 2015 21:49:10 +0100
Subject: [Buildroot] [git commit] Use libgudev as regular dependency
Message-ID: <20151208210009.6C5D681DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e739dd5a11f5b2bd9648a45623bc174adae42b6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since eudev 3.1.3 libgudev is not shipped with this package,
so libgudev can be used as regular dependency regardless of
udev implementation selected.

Fixes following build error:
  http://autobuild.buildroot.net/results/320/320c052bda0f1b5afb1e5c83a7fb4dca6227c5a1//
  http://autobuild.buildroot.net/results/3b0/3b096f882030325b9290ad8860bd9cd373a11dc2//

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hidapi/Config.in                   | 7 +------
 package/hidapi/hidapi.mk                   | 6 +-----
 package/libmbim/Config.in                  | 2 +-
 package/libmbim/libmbim.mk                 | 6 +-----
 package/modem-manager/Config.in            | 2 +-
 package/modem-manager/modem-manager.mk     | 6 +-----
 package/network-manager/Config.in          | 2 +-
 package/network-manager/network-manager.mk | 6 +-----
 package/udisks/Config.in                   | 7 +------
 package/udisks/udisks.mk                   | 7 ++-----
 10 files changed, 11 insertions(+), 40 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 5d025bf..c48a096 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -3,12 +3,7 @@ config BR2_PACKAGE_HIDAPI
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
-	# When eudev is used as the udev provider, libgudev is
-	# automatically provided as it is part of eudev. However, when
-	# systemd is used as the udev provider, libgudev is not
-	# provided, and needs to be built separately. This is why we
-	# select the libgudev package only if systemd is used.
-	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_LIBGUDEV
 	help
 	  HIDAPI is a multi-platform library which allows an application
 	  to interface with USB and Bluetooth HID-Class devices on
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index eb5d5c3..b16e4ae 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -14,10 +14,6 @@ HIDAPI_AUTORECONF = YES
 HIDAPI_LICENSE = GPLv3 or BSD-3c or HIDAPI license
 HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
 
-HIDAPI_DEPENDENCIES = libusb
-
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-HIDAPI_DEPENDENCIES += libgudev
-endif
+HIDAPI_DEPENDENCIES = libusb libgudev
 
 $(eval $(autotools-package))
diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index e79d51f..0ef28db 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBMBIM
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libmbim is a glib-based library for talking to WWAN modems and
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index cb6c905..3cb9235 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -11,11 +11,7 @@ LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING
 LIBMBIM_INSTALL_STAGING = YES
 
-LIBMBIM_DEPENDENCIES = libglib2 udev
-
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-LIBMBIM_DEPENDENCIES += libgudev
-endif
+LIBMBIM_DEPENDENCIES = libglib2 udev libgudev
 
 # we don't want -Werror
 LIBMBIM_CONF_OPTS = --enable-more-warnings=no
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 1cd502b..aa7ed1e 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_LIBGUDEV
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 6d8dc10..451752c 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -9,13 +9,9 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool libgudev
 MODEM_MANAGER_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-MODEM_MANAGER_DEPENDENCIES += libgudev
-endif
-
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
 MODEM_MANAGER_CONF_OPTS += --with-qmi
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 5a0e636..8b4607c 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
-	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index f2fe147..98879d6 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
-	libgcrypt wireless_tools util-linux host-intltool readline libndp
+	libgcrypt wireless_tools util-linux host-intltool readline libndp libgudev
 NETWORK_MANAGER_LICENSE = GPLv2+ (app), LGPLv2+ (libnm-util)
 NETWORK_MANAGER_LICENSE_FILES = COPYING libnm-util/COPYING
 
@@ -63,10 +63,6 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-NETWORK_MANAGER_DEPENDENCIES += libgudev
-endif
-
 # uClibc by default doesn't have backtrace support, so don't use it
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index c9664af..8b8fd28 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -12,12 +12,7 @@ config BR2_PACKAGE_UDISKS
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LIBATASMART
-	# When eudev is used as the udev provider, libgudev is automatically
-	# provided as it is part of eudev. However, when systemd is used as
-	# the udev provider, libgudev is not provided, and needs to be built
-	# separately. This is why we select the libgudev package only if
-	# systemd is used.
-	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_LIBGUDEV
 	help
 	  The udisks project provides
 
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index eccfbd2..eea79e5 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -18,14 +18,11 @@ UDISKS_DEPENDENCIES = 	\
 	polkit		\
 	parted		\
 	lvm2		\
-	libatasmart
+	libatasmart	\
+	libgudev
 
 UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
 
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-UDISKS_DEPENDENCIES += libgudev
-endif
-
 ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
 UDISKS_CONF_OPTS += --enable-lvm2
 endif
