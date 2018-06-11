From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 21:42:56 +0200
Subject: [Buildroot] [git commit] modem-manager: update to version 1.8.0
Message-ID: <20180611194200.2603088285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d06d70d28db37e77a74493e2181fc5b0f6dedd17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to modem manager 1.8.0 which does not require udev.
Added option to build without udev but if udev exists in
the build, it build with libgudev.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/Config.in          | 10 ++++------
 package/modem-manager/modem-manager.hash |  2 +-
 package/modem-manager/modem-manager.mk   | 11 +++++++++--
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 215449a50e..226f82f4f6 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_MODEM_MANAGER
 	bool "modemmanager"
-	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS # runtime dependency
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGUDEV
+	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
@@ -28,7 +27,6 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	  This option enables support for QMI protocol
 endif
 
-comment "modemmanager needs udev /dev management and a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV
+comment "modemmanager needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 8531330d22..77a8c2dc43 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  eefb7615c2c7ebc994abfc2782bfa9e798643a633362b40db96f7f61706a6283  ModemManager-1.6.12.tar.xz
+sha256  18abe34421aa3b52ff47d4ba93aa282f8f8944717dd644a5c0c81eeeac9c7eb1  ModemManager-1.8.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index fe4a7a95da..e2f89d9de1 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.6.12
+MODEM_MANAGER_VERSION = 1.8.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2 libgudev
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
@@ -20,6 +20,13 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-qmi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+MODEM_MANAGER_DEPENDENCIES += libgudev
+MODEM_MANAGER_CONF_OPTS += --with-udev
+else
+MODEM_MANAGER_CONF_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
 MODEM_MANAGER_DEPENDENCIES += libmbim
 MODEM_MANAGER_CONF_OPTS += --with-mbim
