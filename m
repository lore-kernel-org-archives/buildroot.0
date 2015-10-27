From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Oct 2015 15:42:29 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: fix static build with EAP
	enabled
Message-ID: <2c1cf80ae8dc5f8c463ea817b6252851da1263f2.1445953349.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable EAP-TNC for static build because its implementation uses dlopen().

Fixes:
http://autobuild.buildroot.net/results/e21/e21705ae690ab899b6f00e4a15833abef5e54e0e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wpa_supplicant/wpa_supplicant.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 0574f02f4138..cc8a3dfa96e2 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -45,6 +45,9 @@ endif
 # Trailing underscore on purpose to not enable CONFIG_EAPOL_TEST
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_
+ifeq ($(BR2_STATIC_LIBS),y)
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_TNC
+endif
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
 endif
-- 
2.6.1
