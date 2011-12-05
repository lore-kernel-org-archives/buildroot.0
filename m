From: Daniel Mack <zonque@gmail.com>
Date: Mon,  5 Dec 2011 13:33:18 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: add CONFIG_AP support
Message-ID: <1323088398-32014-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/wpa_supplicant/Config.in         |    9 +++++++++
 package/wpa_supplicant/wpa_supplicant.mk |   11 +++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index e3df2b4..aa2d196 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -23,3 +23,12 @@ config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 	help
 	  Install wpa_passphrase command line utility
 
+config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
+	bool "Enable support for soft AP"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT
+	help
+	  With this option enabled, wpa_supplicant can act as
+	  access point. This can be used for open and WPA2-Personal networks
+          (optionally, with WPS); this links in parts of hostapd functionality
+          into wpa_supplicant.
+
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 96f64ca..f722b81 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -25,6 +25,16 @@ define WPA_SUPPLICANT_EAP_CONFIG
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
+define WPA_SUPPLICANT_AP_CONFIG
+	echo "CONFIG_AP=y" >>$(WPA_SUPPLICANT_CONFIG)
+endef
+else
+define WPA_SUPPLICANT_AP_CONFIG
+	$(SED) "s/^CONFIG_AP=y//" $(WPA_SUPPLICANT_CONFIG)
+endef
+endif
+
 define WPA_SUPPLICANT_CRYPTO_CONFIG
 	echo "CONFIG_CRYPTO=internal" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
@@ -69,6 +79,7 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
 	$(WPA_SUPPLICANT_EAP_CONFIG)
 	$(WPA_SUPPLICANT_LIBNL_CONFIG)
 	$(WPA_SUPPLICANT_DBUS_CONFIG)
+	$(WPA_SUPPLICANT_AP_CONFIG)
 endef
 
 define WPA_SUPPLICANT_REMOVE_CLI
-- 
1.7.7.3
