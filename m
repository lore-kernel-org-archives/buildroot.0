From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  7 Nov 2016 12:17:24 +0100
Subject: [Buildroot] [PATCH v2] wpa_supplicant: add mesh support (IEEE
	80211s)
Message-ID: <1478517444-7093-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
	- use WPA_SUPPLICANT_CONFIG_ENABLE for CONFIG_IEEE80211W (Baruch Siach)
	- remove CONFIG_SAE as it will be automatically selected by CONFIG_MESH
	
 package/wpa_supplicant/Config.in         | 7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 454541f..9250a3b 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -45,6 +45,13 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY
 	help
 	  Enable support for Wi-Fi Display
 
+config BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING
+	bool "Enable mesh networking"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
+	help
+	  Enable support for open and secured mesh networking
+	  (IEEE 802.11s)
+
 config BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN
 	bool "Enable autoscan"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 3c3317b..9c8414b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -73,6 +73,11 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WIFI_DISPLAY
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
+WPA_SUPPLICANT_CONFIG_SET += CONFIG_MESH
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_IEEE80211W
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_AUTOSCAN_EXPONENTIAL \
-- 
2.1.4
