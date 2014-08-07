From: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
Date: Thu, 7 Aug 2014 13:28:28 -0700
Subject: [Buildroot] [PATCH 1/1] wpa-supplicant: Add NL80211 support option
Message-ID: <1407443308-20000-1-git-send-email-jtheou@adeneo-embedded.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
---
 package/wpa_supplicant/Config.in         | 6 ++++++
 package/wpa_supplicant/wpa_supplicant.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 81c61ac..2fb20ab 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -22,6 +22,12 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
 	  Enable support for EAP.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
+	bool "Enable NL80211"
+	depends on BR2_PACKAGE_LIBNL
+	help
+	  Enable support for NL80211.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
 	bool "Enable HS20"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 0ca2ce5..2807151 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -49,6 +49,12 @@ else
 	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_NL80211),y)
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DRIVER_NL80211
+else
+	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),y)
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_HS20 \
 		CONFIG_INTERWORKING
-- 
2.0.3
