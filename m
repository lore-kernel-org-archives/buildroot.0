From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 16:47:19 -0300
Subject: [Buildroot] [PATCH 3/7] wpa_supplicant: remove gnutls support
In-Reply-To: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356724043-8879-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wpa_supplicant: remove gnutls support

wpa_supplicant isn't API compatible with gnutls3 so remove support.
It's probably hardly used since openssl is far more common, and
wpa_supplicant can use its internal routines if it's not available.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/wpa_supplicant.mk |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 71be11f..3830d65 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -59,7 +59,7 @@ define WPA_SUPPLICANT_LIBTOMMATH_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 endef
 
-# Try to use openssl or gnutls if it's already available
+# Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 define WPA_SUPPLICANT_TLS_CONFIG
@@ -67,17 +67,10 @@ define WPA_SUPPLICANT_TLS_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 endef
 else
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-	WPA_SUPPLICANT_DEPENDENCIES += gnutls
-define WPA_SUPPLICANT_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2gnutls/' $(WPA_SUPPLICANT_CONFIG)
-endef
-else
 define WPA_SUPPLICANT_TLS_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
-endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
-- 
1.7.8.6
