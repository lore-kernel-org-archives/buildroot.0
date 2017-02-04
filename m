From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:28 +0100
Subject: [Buildroot] [PATCH v3 15/38] package/kodi: add optional support for
	bluez5
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-16-bernd.kuhls@t-online.de>
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
index cd24fa8b5..f880153f6 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -122,6 +122,14 @@ config BR2_PACKAGE_KODI_AVAHI
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
index a035cb74c..2b53d94a1 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -124,6 +124,13 @@ else
 KODI_CONF_OPTS += --disable-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_BLUEZ),y)
+KODI_CONF_OPTS += --enable-libbluetooth
+KODI_DEPENDENCIES += bluez5_utils
+else
+KODI_CONF_OPTS += --disable-libbluetooth
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_DBUS),y)
 KODI_DEPENDENCIES += dbus
 KODI_CONF_OPTS += --enable-dbus
-- 
2.11.0
