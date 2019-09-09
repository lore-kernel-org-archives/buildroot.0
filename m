From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  9 Sep 2019 23:20:34 +0300
Subject: [Buildroot] [PATCH v2 3/3] package/wpa_supplicant: fix AP mode
 settings
In-Reply-To: <20190909202034.27508-1-geomatsi@gmail.com>
References: <20190909202034.27508-1-geomatsi@gmail.com>
Message-ID: <20190909202034.27508-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New wpa_supplicant v2.9 enables by default AP, P2P, WIFI_DISPLAY
features in defconfig. However these features make sense only for
wpa_supplicant drivers supporting AP mode.

That is why, for consistent configuration, these features should
be explicitely disabled in wpa_supplicant .config file unless
they are requested by Config.in options.

Note that at the moment AP support in Buildroot can be enabled
only for NL80211 driver.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 283c006052..9dcebca9bf 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -67,10 +67,16 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_AP \
 	CONFIG_P2P
+else
+WPA_SUPPLICANT_CONFIG_DISABLE += \
+	CONFIG_AP \
+	CONFIG_P2P
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WIFI_DISPLAY
+else
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WIFI_DISPLAY
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
-- 
2.23.0
