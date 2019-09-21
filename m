From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 17:55:40 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: add Config.in
 option for WPA3 support
Message-ID: <20190921155721.D8A658EEC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25b6930665c4f1c369614963b23f32cbd35df2ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New wpa_supplicant v2.9 enables by default WPA3 features in defconfig.
Meanwhile building those features requires openssl.

This patch adds Config.in option for WPA3 support in wpa_supplicant.
When this option is selected, libopenssl is also selected and WPA3
features OWE, SAE, DPP are enabled in wpa_supplicant .config file.
When this feature is deselected, then all the above WPA3 options
are disabled.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
