From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 21:03:16 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: add CONFIG_AP support
Message-ID: <20111207203227.B3B658F8BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a15d47f09014441482eb97b1316f0509fd07db99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Fix indentation]
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/Config.in         |    8 ++++++++
 package/wpa_supplicant/wpa_supplicant.mk |   11 +++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index e3df2b4..a4e0fba 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -23,3 +23,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 	help
 	  Install wpa_passphrase command line utility
 
+config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
+	bool "Enable support for soft AP"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT
+	help
+	  With this option enabled, wpa_supplicant can act as
+	  access point. This can be used for open and WPA2-Personal networks
+	  (optionally, with WPS); this links in parts of hostapd functionality
+	  into wpa_supplicant.
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index b2e7be3..baa739b 100644
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
