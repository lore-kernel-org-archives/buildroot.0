From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Nov 2015 21:38:39 +0200
Subject: [Buildroot] [PATCH next 1/2] package/*: test for
	BR2_PACKAGE_LIBGUDEV for dependency
Message-ID: <fe0244022307f4d80793175f3d433c3e4ae9b738.1447875520.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the case of adding libgudev as a dependency more consistent with all
other dependency packages. The <pkg>_DEPENDENCIES variable sets the build
order which is conceptually independent of the underlying reason for that
dependency.

Also, remove the comments in hidapi.mk and udisks.mk. These comments explain
why BR2_PACKAGE_LIBGUDEV is selected, so the comments in corresponding
Config.in files are enough.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/hidapi/hidapi.mk                   | 7 +------
 package/libmbim/libmbim.mk                 | 2 +-
 package/modem-manager/modem-manager.mk     | 2 +-
 package/network-manager/network-manager.mk | 2 +-
 package/udisks/udisks.mk                   | 7 +------
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 2457554748ba..eb5d5c35564f 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -16,12 +16,7 @@ HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig
 
 HIDAPI_DEPENDENCIES = libusb
 
-# When eudev is used as the udev provider, libgudev is automatically
-# provided as it is part of eudev. However, when systemd is used as
-# the udev provider, libgudev is not provided, and needs to be built
-# separately. This is why we depend on the libgudev package only if
-# systemd is used.
-ifeq ($(BR2_INIT_SYSTEMD),y)
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 HIDAPI_DEPENDENCIES += libgudev
 endif
 
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index cfba08e7e36d..cb6c9055ccee 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -13,7 +13,7 @@ LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2 udev
 
-ifeq ($(BR2_INIT_SYSTEMD),y)
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 LIBMBIM_DEPENDENCIES += libgudev
 endif
 
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index f38dee36bcb3..6d8dc10d905a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -12,7 +12,7 @@ MODEM_MANAGER_LICENSE_FILES = COPYING
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
 MODEM_MANAGER_INSTALL_STAGING = YES
 
-ifeq ($(BR2_INIT_SYSTEMD),y)
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 MODEM_MANAGER_DEPENDENCIES += libgudev
 endif
 
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 2c19a7de0fbe..f2fe1477b0c7 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -63,7 +63,7 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
-ifeq ($(BR2_INIT_SYSTEMD),y)
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 NETWORK_MANAGER_DEPENDENCIES += libgudev
 endif
 
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index bea94522a6dd..eccfbd25b0a5 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -22,12 +22,7 @@ UDISKS_DEPENDENCIES = 	\
 
 UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
 
-# When eudev is used as the udev provider, libgudev is automatically
-# provided as it is part of eudev. However, when systemd is used as the
-# udev provider, libgudev is not provided, and needs to be built
-# separately. This is why we select the libgudev package only if systemd
-# is used.
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 UDISKS_DEPENDENCIES += libgudev
 endif
 
-- 
2.6.2
