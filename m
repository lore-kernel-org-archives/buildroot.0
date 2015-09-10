From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 10 Sep 2015 14:50:37 +0200
Subject: [Buildroot] [PATCH] modem-manager: now needs libgudev under systemd
Message-ID: <1441889437-13931-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Fixes: http://autobuild.buildroot.net/results/d59/d597a81271a082c8252e2333906815c437b6576d/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/modem-manager/Config.in        | 3 ++-
 package/modem-manager/modem-manager.mk | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 59b8d88..1cd502b 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_MODEM_MANAGER
 	bool "modemmanager"
 	depends on BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_DBUS
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 0e6b36a..36c8c0d 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -12,6 +12,10 @@ MODEM_MANAGER_LICENSE_FILES = COPYING
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
 MODEM_MANAGER_INSTALL_STAGING = YES
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+MODEM_MANAGER_DEPENDENCIES += libgudev
+endif
+
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
 MODEM_MANAGER_CONF_OPTS += --with-qmi
-- 
2.1.4
