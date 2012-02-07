From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 14:01:56 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: add config option to
	enable support for WPS
Message-ID: <20120207223219.9053A90A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57c7706bacd7f43696724df97cf78364a6712751
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/Config.in         |    6 ++++++
 package/wpa_supplicant/wpa_supplicant.mk |    7 +++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index a4e0fba..8ac2576 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -31,3 +31,9 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	  access point. This can be used for open and WPA2-Personal networks
 	  (optionally, with WPS); this links in parts of hostapd functionality
 	  into wpa_supplicant.
+
+config BR2_PACKAGE_WPA_SUPPLICANT_WPS
+	bool "Enable support for WPS"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT
+	help
+	  Enable support for Wi-Fi Protected Setup (WPS)
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index f722b81..0a672ee 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -35,6 +35,12 @@ define WPA_SUPPLICANT_AP_CONFIG
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
+define WPA_SUPPLICANT_WPS_CONFIG
+	echo "CONFIG_WPS=y" >>$(WPA_SUPPLICANT_CONFIG)
+endef
+endif
+
 define WPA_SUPPLICANT_CRYPTO_CONFIG
 	echo "CONFIG_CRYPTO=internal" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
@@ -77,6 +83,7 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
 	$(WPA_SUPPLICANT_CRYPTO_CONFIG)
 	$(WPA_SUPPLICANT_TLS_CONFIG)
 	$(WPA_SUPPLICANT_EAP_CONFIG)
+	$(WPA_SUPPLICANT_WPS_CONFIG)
 	$(WPA_SUPPLICANT_LIBNL_CONFIG)
 	$(WPA_SUPPLICANT_DBUS_CONFIG)
 	$(WPA_SUPPLICANT_AP_CONFIG)
