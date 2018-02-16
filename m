From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri, 16 Feb 2018 10:38:11 -0600
Subject: [Buildroot] [PATCH v2 2/2] modem-manager: Update to version 1.7.990
In-Reply-To: <1518799091-845-1-git-send-email-jared.bents@rockwellcollins.com>
References: <1518799091-845-1-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <1518799091-845-2-git-send-email-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to modem manager 1.7.990 which does not require
udev.  Added logic to select building with libgudev or
not based on if udev exists in the build.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
[v1->v2]:
- Removed defaulted user option to select with udev and now
  automatically selects building with libgudev based on the
  presence of udev.

  CC: Baruch Siach <baruch@tkos.co.il>
---
 package/modem-manager/Config.in          |  5 ++---
 package/modem-manager/modem-manager.hash |  2 +-
 package/modem-manager/modem-manager.mk   | 11 +++++++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 8e995b4..5f1f6d5 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_MODEM_MANAGER
 	bool "modemmanager"
-	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS # runtime dependency
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGUDEV
+	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
@@ -28,7 +27,7 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	  This option enables support for QMI protocol
 endif
 
-comment "modemmanager needs udev /dev management and a toolchain w/ wchar, threads"
+comment "modemmanager needs /dev management and a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_MMU
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index bc08044..52cc7a6 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  bc74326fa69ae8012f806e235f3d296144922669b952d4d4987dd0af645d5f68  ModemManager-1.6.10.tar.xz
+sha256  d465094fc6fc173354f5a00d212049056829cc245d60a9083f3c53f86a8f90ec  ModemManager-1.7.990.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index b741acf..61672dd 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.6.10
+MODEM_MANAGER_VERSION = 1.7.990
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2 libgudev
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2
 MODEM_MANAGER_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
@@ -26,6 +26,13 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-mbim
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+MODEM_MANAGER_DEPENDENCIES += libgudev
+MODEM_MANAGER_CONF_OPTS += --with-udev
+else
+MODEM_MANAGER_CONF_OPTS += --without-udev
+endif
+
 define MODEM_MANAGER_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager \
 		$(TARGET_DIR)/etc/init.d/S44modem-manager
-- 
1.9.1
