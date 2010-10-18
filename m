From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Oct 2010 11:30:31 +0200
Subject: [Buildroot] [git commit master 1/1] wpa_supplicant: bump to 0.7.3
Message-ID: <20101018093103.D98F48C9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d73efad3fe8d47fc3d7785a614c6369897bb5192
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/Config.in         |   11 +--------
 package/wpa_supplicant/wpa_supplicant.mk |   34 ++++++++++++++++++++---------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 4b50239..e3df2b4 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -6,17 +6,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT
 	  http://hostap.epitest.fi/wpa_supplicant/
 
 config BR2_PACKAGE_WPA_SUPPLICANT_EAP
-	bool "Enable WPA with EAP"
+	bool "Enable EAP"
 	depends on BR2_PACKAGE_WPA_SUPPLICANT
 	help
-	  Enable WPA with EAP (IEEE 802.1X)
-
-config BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL
-	bool "Use openssl TLS (recommended)"
-	depends on BR2_PACKAGE_WPA_SUPPLICANT && BR2_PACKAGE_WPA_SUPPLICANT_EAP
-	select BR2_PACKAGE_OPENSSL
-	help
-	  Use OpenSSL's TLS implementation instead of internal libtommath.
+	  Enable support for EAP.
 
 config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	bool "Install wpa_cli binary"
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index cebc4fb..a47a42b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WPA_SUPPLICANT_VERSION = 0.6.10
+WPA_SUPPLICANT_VERSION = 0.7.3
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LIBTOOL_PATCH = NO
 WPA_SUPPLICANT_DEPENDENCIES =
@@ -16,28 +16,34 @@ WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
 define WPA_SUPPLICANT_LIBNL_CONFIG
-	echo "CONFIG_DRIVER_NL80211=y" >>$(WPA_SUPPLICANT_CONFIG)
+	$(SED) "s/^#CONFIG_DRIVER_NL80211/CONFIG_DRIVER_NL80211/" $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
 ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
-define WPA_SUPPLICANT_CRYPTO_CONFIG
+define WPA_SUPPLICANT_EAP_CONFIG
 	$(SED) "s/^CONFIG_EAP_*/#CONFIG_EAP_/g" $(WPA_SUPPLICANT_CONFIG)
-	echo "CONFIG_TLS=none" >>$(WPA_SUPPLICANT_CONFIG)
 endef
-else
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
-	WPA_SUPPLICANT_DEPENDENCIES += openssl
+endif
+
 define WPA_SUPPLICANT_CRYPTO_CONFIG
+	echo "CONFIG_CRYPTO=internal" >>$(WPA_SUPPLICANT_CONFIG)
+	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
+	echo "CONFIG_INTERNAL_LIBTOMMATH_FAST=y" >>$(WPA_SUPPLICANT_CONFIG)
+endef
+
+# Try to use openssl for TLS if it's already available
+# gnutls is also supported for TLS
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	WPA_SUPPLICANT_DEPENDENCIES += openssl
+define WPA_SUPPLICANT_TLS_CONFIG
 	echo "CONFIG_TLS=openssl" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 else
-define WPA_SUPPLICANT_CRYPTO_CONFIG
+define WPA_SUPPLICANT_TLS_CONFIG
 	echo "CONFIG_TLS=internal" >>$(WPA_SUPPLICANT_CONFIG)
-	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 endif
-endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WPA_SUPPLICANT_DEPENDENCIES += host-pkg-config dbus
@@ -45,7 +51,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 define WPA_SUPPLICANT_DBUS_CONFIG
-	echo "CONFIG_CTRL_IFACE_DBUS=y" >>$(WPA_SUPPLICANT_CONFIG)
+	$(SED) "s/^#CONFIG_CTRL_IFACE_DBUS/CONFIG_CTRL_IFACE_DBUS/" $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
@@ -54,8 +60,14 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
 	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(WPA_SUPPLICANT_CONFIG)
+	$(SED) "s/^#CONFIG_IEEE80211R/CONFIG_IEEE80211R/" $(WPA_SUPPLICANT_CONFIG)
+	$(SED) "s/^#CONFIG_DELAYED_MIC/CONFIG_DELAYED_MIC/" $(WPA_SUPPLICANT_CONFIG)
+	$(SED) "s/^CONFIG_DRIVER_ATMEL/#CONFIG_DRIVER_ATMEL/" $(WPA_SUPPLICANT_CONFIG)
+	$(SED) "s/^CONFIG_SMARTCARD/#CONFIG_SMARTCARD/" $(WPA_SUPPLICANT_CONFIG)
 	$(SED) "s/\/local//" $(@D)/wpa_supplicant/Makefile
 	$(WPA_SUPPLICANT_CRYPTO_CONFIG)
+	$(WPA_SUPPLICANT_TLS_CONFIG)
+	$(WPA_SUPPLICANT_EAP_CONFIG)
 	$(WPA_SUPPLICANT_LIBNL_CONFIG)
 	$(WPA_SUPPLICANT_DBUS_CONFIG)
 endef
-- 
1.7.1
