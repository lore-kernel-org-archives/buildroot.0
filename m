From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 May 2012 07:07:58 -0300
Subject: [Buildroot] [PATCH] wpa_supplicant: explicitly disable libnl by
	default
Message-ID: <1337162878-28425-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnl support is enabled by default since version 1.0, so disable it
to avoid build breakage when there's no libnl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/wpa_supplicant.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index a4978e0..97210ce 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -15,9 +15,12 @@ WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
 define WPA_SUPPLICANT_LIBNL_CONFIG
-	$(SED) "s/^#CONFIG_DRIVER_NL80211/CONFIG_DRIVER_NL80211/" $(WPA_SUPPLICANT_CONFIG)
 	echo "CONFIG_LIBNL32=y" >>$(WPA_SUPPLICANT_CONFIG)
 endef
+else
+define WPA_SUPPLICANT_LIBNL_CONFIG
+	$(SED) "s/^CONFIG_DRIVER_NL80211/#CONFIG_DRIVER_NL80211/" $(WPA_SUPPLICANT_CONFIG)
+endef
 endif
 
 ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
-- 
1.7.3.4
