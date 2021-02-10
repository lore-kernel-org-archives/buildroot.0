From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 10 Feb 2021 19:50:15 +0100
Subject: [Buildroot] [PATCH 1/3] package/wpa_supplicant: Fix options to
 actually disable features.
Message-ID: <20210210185017.6133-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since wpa_supplicant 2.8, most features are now enabled by default,
instead of being disabled by default.  Update wpa_supplicant.mk
accordingly.

This also make the existing options disable more features, otherwise,
it would still include dead code or even fail to compile.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/wpa_supplicant/Config.in         |  4 ++--
 package/wpa_supplicant/wpa_supplicant.mk | 28 ++++++++++--------------
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index cba7fa07e1..8057c0b7be 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	  set.  This links in parts of hostapd functionality into
 	  wpa_supplicant, making it bigger but dispensing the need for
 	  a separate hostapd binary in some applications hence being
-	  smaller overall.
+	  smaller overall.  It also enables support for Wi-Fi Direct.
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY
 	bool "Enable Wi-Fi Display"
@@ -63,7 +63,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN
 config BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	bool "Enable EAP"
 	help
-	  Enable support for EAP.
+	  Enable support for EAP, 802.1x/WPA-Enterprise and FILS.
 
 config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
 	bool "Enable HS20"
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 940a821746..cc259eb9c6 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -27,15 +27,8 @@ WPA_SUPPLICANT_INSTALL_STAGING = YES
 
 WPA_SUPPLICANT_CONFIG_EDITS =
 
-# Add support for simple background scan
-WPA_SUPPLICANT_CONFIG_SET = CONFIG_BGSCAN_SIMPLE
-
 WPA_SUPPLICANT_CONFIG_ENABLE = \
-	CONFIG_IEEE80211AC \
-	CONFIG_IEEE80211N \
-	CONFIG_IEEE80211R \
 	CONFIG_INTERNAL_LIBTOMMATH \
-	CONFIG_DEBUG_FILE \
 	CONFIG_MATCH_IFACE
 
 WPA_SUPPLICANT_CONFIG_DISABLE = \
@@ -62,11 +55,13 @@ ifeq ($(BR2_STATIC_LIBS),y)
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_TNC
 endif
 else
-WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP \
+	CONFIG_IEEE8021X_EAPOL \
+	CONFIG_FILS
 endif
 
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),y)
-WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_HS20 \
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),y)
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_HS20 \
 	CONFIG_INTERWORKING
 endif
 
@@ -86,9 +81,8 @@ else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WIFI_DISPLAY
 endif
 
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
-WPA_SUPPLICANT_CONFIG_SET += CONFIG_MESH
-WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_IEEE80211W
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_MESH
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN),y)
@@ -97,8 +91,8 @@ WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_AUTOSCAN_PERIODIC
 endif
 
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
-WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WPS
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
@@ -143,8 +137,8 @@ else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE_DBUS_NEW
 endif
 
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
-WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_SYSLOG
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DEBUG_SYSLOG
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-- 
2.30.0
