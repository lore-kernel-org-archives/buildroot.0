From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  8 Sep 2019 18:17:08 +0300
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: add Config.in
 option for WPA3
In-Reply-To: <20190908151709.23971-1-geomatsi@gmail.com>
References: <20190908151709.23971-1-geomatsi@gmail.com>
Message-ID: <20190908151709.23971-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New wpa_supplicant v2.9 enables by default WPA3 features such as
SAE and DPP. Building those features requires openssl.

This patch adds Config.in option for WPA3 support in wpa_supplicant.
When this option is selected, libopenssl is also selected and WPA3
features OWE, SAE, DPP are enabled in wpa_supplicant configuration.
When this option is deselected, then all the above WPA3 options
are disabled.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/wpa_supplicant/Config.in         |  7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 1594b877c6..cba7fa07e1 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -81,6 +81,13 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WPS
 	help
 	  Enable support for Wi-Fi Protected Setup (WPS).
 
+config BR2_PACKAGE_WPA_SUPPLICANT_WPA3
+	bool "Enable WPA3 support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  Enable WPA3 support including OWE, SAE, DPP
+
 config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	bool "Install wpa_cli binary"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 0a7a5072dc..283c006052 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -88,6 +88,18 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += \
+	CONFIG_DPP \
+	CONFIG_SAE \
+	CONFIG_OWE
+else
+WPA_SUPPLICANT_CONFIG_DISABLE += \
+	CONFIG_DPP \
+	CONFIG_SAE \
+	CONFIG_OWE
+endif
+
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libopenssl
-- 
2.23.0
