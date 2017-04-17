From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 17 Apr 2017 21:54:11 +0200
Subject: [Buildroot] [PATCH v5 12/34] package/kodi: add optional support for
	bluez5
In-Reply-To: <20170417195433.26672-1-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
Message-ID: <20170417195433.26672-13-bernd.kuhls@t-online.de>
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
index 95f9f65ea..6d4148899 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -120,6 +120,14 @@ config BR2_PACKAGE_KODI_AVAHI
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
index dbe2fcd62..931f002f8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -194,6 +194,13 @@ else
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
