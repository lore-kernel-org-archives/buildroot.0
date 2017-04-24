From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Apr 2017 23:31:57 +0200
Subject: [Buildroot] [PATCH v6 22/31] package/kodi: add optional support for
	bluez5
In-Reply-To: <20170424213206.26247-1-bernd.kuhls@t-online.de>
References: <20170424213206.26247-1-bernd.kuhls@t-online.de>
Message-ID: <20170424213206.26247-23-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 8 ++++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a2eeae9aac..64f307c00a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -114,6 +114,14 @@ config BR2_PACKAGE_KODI_AVAHI
 	  Enable Avahi support.
 	  Select this if you want Kodi to support Bonjour protocol.
 
+config BR2_PACKAGE_KODI_BLUEZ
+	bool "bluetooth"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5_utils
+	select BR2_PACKAGE_BLUEZ5_UTILS
+	help
+	    Enable bluetooth support
+
 config BR2_PACKAGE_KODI_DBUS
 	bool "dbus"
 	select BR2_PACKAGE_DBUS
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 158319b876..809e0cfae0 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -186,6 +186,13 @@ else
 KODI_CONF_OPTS += -DENABLE_CAP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_BLUEZ),y)
+KODI_CONF_OPTS += -DENABLE_BLUETOOTH=ON
+KODI_DEPENDENCIES += bluez5_utils
+else
+KODI_CONF_OPTS += -DENABLE_BLUETOOTH=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_DBUS),y)
 KODI_DEPENDENCIES += dbus
 KODI_CONF_OPTS += -DENABLE_DBUS=ON
-- 
2.11.0
