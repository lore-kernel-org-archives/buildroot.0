From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 10:23:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: add bluez5_utils
 support
Message-ID: <20200111092321.419393-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/Config.in      | 2 +-
 package/sconeserver/sconeserver.mk | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index e984801de5..461cc47971 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -48,7 +48,7 @@ config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	depends on BR2_USE_MMU # bluez->dbus
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus, bluez->libglib2
 	depends on !BR2_STATIC_LIBS # bluez_utils
-	select BR2_PACKAGE_BLUEZ_UTILS
+	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  Bluetooth module for Sconeserver
 
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 6914599a21..90bf5802a8 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -62,7 +62,8 @@ SCONESERVER_CONF_OPTS += --without-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
-SCONESERVER_DEPENDENCIES += bluez_utils
+SCONESERVER_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils,bluez5_utils)
 SCONESERVER_CONF_OPTS += --with-bluetooth
 else
 SCONESERVER_CONF_OPTS += --without-bluetooth
-- 
2.24.1
