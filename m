From: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
Date: Fri, 8 Aug 2014 09:17:52 -0700
Subject: [Buildroot] [PATCH v2] wpa_supplicant: Add NL80211 support option
Message-ID: <1407514672-6231-1-git-send-email-jtheou@adeneo-embedded.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When you select wpa_supplicant, having an visual indication about the
support or not of NL80211 is important.

And even if libnl is available, you may want to disable the support of
NL80211 inside wpa_supplicant.
---
 package/wpa_supplicant/Config.in         | 7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 81c61ac..1d43acd 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -22,6 +22,13 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
 	  Enable support for EAP.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
+	bool "Enable NL80211"
+	default y if BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBNL
+	help
+	  Enable support for NL80211.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
 	bool "Enable HS20"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 0ca2ce5..4ea2a3a 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -42,6 +42,12 @@ else
 	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_NL80211),y)
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DRIVER_NL80211
+else
+	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
+endif
+
 # Trailing underscore on purpose to not enable CONFIG_EAPOL_TEST
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_
-- 
2.0.3
