From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 May 2012 14:56:49 +0200
Subject: [Buildroot] [git commit branch/next] wpa_supplicant: enable
	interworking and enhance
Message-ID: <20120523125826.77F2096D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c64e065762af80ceaaed313b82eed9220ea4707
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable IEEE 802.11u (interworking).
Also enable new supported EAP methods.
Switch from echo to sed where possible for a cleaner .config output

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.mk |   56 +++++++++++++++++-------------
 1 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 97210ce..5ca6de5 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -15,57 +15,64 @@ WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
 define WPA_SUPPLICANT_LIBNL_CONFIG
-	echo "CONFIG_LIBNL32=y" >>$(WPA_SUPPLICANT_CONFIG)
+	echo 'CONFIG_LIBNL32=y' >>$(WPA_SUPPLICANT_CONFIG)
 endef
 else
 define WPA_SUPPLICANT_LIBNL_CONFIG
-	$(SED) "s/^CONFIG_DRIVER_NL80211/#CONFIG_DRIVER_NL80211/" $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/^\(CONFIG_DRIVER_NL80211.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
-ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
 define WPA_SUPPLICANT_EAP_CONFIG
-	$(SED) "s/^CONFIG_EAP_*/#CONFIG_EAP_/g" $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_AKA.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_FAST.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_GPSK.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_IKEV2.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_PAX.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_PSK.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_SAKE.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_SIM.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_TNC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+endef
+else
+define WPA_SUPPLICANT_EAP_CONFIG
+	$(SED) 's/^\(CONFIG_EAP.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
 define WPA_SUPPLICANT_AP_CONFIG
-	echo "CONFIG_AP=y" >>$(WPA_SUPPLICANT_CONFIG)
-endef
-else
-define WPA_SUPPLICANT_AP_CONFIG
-	$(SED) "s/^CONFIG_AP=y//" $(WPA_SUPPLICANT_CONFIG)
+	echo 'CONFIG_AP=y' >>$(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
 define WPA_SUPPLICANT_WPS_CONFIG
-	echo "CONFIG_WPS=y" >>$(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_WPS.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
-define WPA_SUPPLICANT_CRYPTO_CONFIG
-	echo "CONFIG_CRYPTO=internal" >>$(WPA_SUPPLICANT_CONFIG)
-	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
-	echo "CONFIG_INTERNAL_LIBTOMMATH_FAST=y" >>$(WPA_SUPPLICANT_CONFIG)
+define WPA_SUPPLICANT_LIBTOMMATH_CONFIG
+	$(SED) 's/\(#\)\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 endef
 
 # Try to use openssl or gnutls if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 define WPA_SUPPLICANT_TLS_CONFIG
-	echo "CONFIG_TLS=openssl" >>$(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_TLS=openssl\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 endef
 else
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 	WPA_SUPPLICANT_DEPENDENCIES += gnutls
 define WPA_SUPPLICANT_TLS_CONFIG
-	echo "CONFIG_TLS=gnutls" >>$(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2gnutls/' $(WPA_SUPPLICANT_CONFIG)
 endef
 else
 define WPA_SUPPLICANT_TLS_CONFIG
-	echo "CONFIG_TLS=internal" >>$(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 endif
@@ -76,18 +83,19 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 define WPA_SUPPLICANT_DBUS_CONFIG
-	$(SED) "s/^#CONFIG_CTRL_IFACE_DBUS/CONFIG_CTRL_IFACE_DBUS/" $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
-	$(SED) "s/^#CONFIG_IEEE80211R/CONFIG_IEEE80211R/" $(WPA_SUPPLICANT_CONFIG)
-	$(SED) "s/^#CONFIG_DELAYED_MIC/CONFIG_DELAYED_MIC/" $(WPA_SUPPLICANT_CONFIG)
-	$(SED) "s/^CONFIG_DRIVER_ATMEL/#CONFIG_DRIVER_ATMEL/" $(WPA_SUPPLICANT_CONFIG)
-	$(SED) "s/^CONFIG_SMARTCARD/#CONFIG_SMARTCARD/" $(WPA_SUPPLICANT_CONFIG)
-	$(SED) "s/\/local//" $(@D)/wpa_supplicant/Makefile
-	$(WPA_SUPPLICANT_CRYPTO_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_IEEE80211N.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_IEEE80211R.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_INTERWORKING.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_DELAYED_MIC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(CONFIG_DRIVER_ATMEL\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(SED) 's/\(CONFIG_SMARTCARD\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(WPA_SUPPLICANT_LIBTOMMATH_CONFIG)
 	$(WPA_SUPPLICANT_TLS_CONFIG)
 	$(WPA_SUPPLICANT_EAP_CONFIG)
 	$(WPA_SUPPLICANT_WPS_CONFIG)
