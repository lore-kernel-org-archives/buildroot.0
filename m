From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 May 2012 14:56:23 +0200
Subject: [Buildroot] [git commit branch/next] hostapd: enable interworking
	and enhance
Message-ID: <20120523125826.5DA7296D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37a63cd32e5cd6603f2b4d09324cb9793828b146
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable IEEE 802.11u (interworking).
Also enable new supported EAP methods.
Switch from echo to sed where possible for a cleaner .config output

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/hostapd.mk |   59 +++++++++++++++++++++-----------------------
 1 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index d9ee4f0..c7c59ec 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -18,76 +18,73 @@ HOSTAPD_LDFLAGS += -lm
 endif
 
 define HOSTAPD_LIBNL_CONFIG
-	echo "CONFIG_LIBNL32=y" >>$(HOSTAPD_CONFIG)
+	echo 'CONFIG_LIBNL32=y' >>$(HOSTAPD_CONFIG)
 endef
 
-define HOSTAPD_CRYPTO_CONFIG
-	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_INTERNAL_LIBTOMMATH_FAST=y" >>$(HOSTAPD_CONFIG)
+define HOSTAPD_LIBTOMMATH_CONFIG
+	$(SED) 's/\(#\)\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
 
 # Try to use openssl or gnutls if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
 define HOSTAPD_TLS_CONFIG
-	echo "CONFIG_TLS=openssl" >>$(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_TLS=openssl\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
 else
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 	HOSTAPD_DEPENDENCIES += gnutls
 define HOSTAPD_TLS_CONFIG
-	echo "CONFIG_TLS=gnutls" >>$(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2gnutls/' $(HOSTAPD_CONFIG)
 endef
 else
 define HOSTAPD_TLS_CONFIG
-	echo "CONFIG_TLS=internal" >>$(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(HOSTAPD_CONFIG)
 endef
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
 define HOSTAPD_EAP_CONFIG
-	$(SED) "s/CONFIG_EAP_MSCHAPV2=y//" $(HOSTAPD_CONFIG)
-	$(SED) "s/CONFIG_EAP_PEAP=y//" $(HOSTAPD_CONFIG)
-	$(SED) "s/CONFIG_EAP_TLS=y//" $(HOSTAPD_CONFIG)
-	$(SED) "s/CONFIG_EAP_TTLS=y//" $(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_AKA=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_AKA_PRIME=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_GPSK=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_GPSK_SHA256=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_PAX=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_PSK=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_SAKE=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_SIM=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_RADIUS_SERVER=y" >>$(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_AKA.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_FAST.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_GPSK.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_IKEV2.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_PAX.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_PSK.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_SAKE.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_SIM.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_EAP_TNC.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_RADIUS_SERVER.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
-ifeq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_INET_IPV6),y)
 define HOSTAPD_RADIUS_IPV6_CONFIG
-	$(SED) "s/^#CONFIG_IPV6/CONFIG_IPV6/" $(HOSTAPD_CONFIG)
+	$(SED) 's/\(CONFIG_IPV6.*\)/#\1/' $(HOSTAPD_CONFIG)
 endef
 endif
 else
 define HOSTAPD_EAP_CONFIG
-	$(SED) "s/^CONFIG_EAP/#CONFIG_EAP/g" $(HOSTAPD_CONFIG)
-	$(SED) "s/^#CONFIG_NO_ACCOUNTING/CONFIG_NO_ACCOUNTING/" $(HOSTAPD_CONFIG)
-	$(SED) "s/^#CONFIG_NO_RADIUS/CONFIG_NO_RADIUS/" $(HOSTAPD_CONFIG)
+	$(SED) 's/^\(CONFIG_EAP.*\)/#\1/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_NO_ACCOUNTING.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_NO_RADIUS.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
 define HOSTAPD_WPS_CONFIG
-	$(SED) "s/^#CONFIG_WPS/CONFIG_WPS/g" $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_WPS.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
 endif
 
 define HOSTAPD_CONFIGURE_CMDS
 	cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
 # Misc
-	$(SED) "s/^CONFIG_IPV6/#CONFIG_IPV6/" $(HOSTAPD_CONFIG)
-	$(SED) "s/^#CONFIG_IEEE80211N/CONFIG_IEEE80211N/" $(HOSTAPD_CONFIG)
-	$(SED) "s/^#CONFIG_IEEE80211R/CONFIG_IEEE80211R/" $(HOSTAPD_CONFIG)
-	$(HOSTAPD_CRYPTO_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_IEEE80211N.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_IEEE80211R.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_INTERWORKING.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_FULL_DYNAMIC_VLAN.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(HOSTAPD_LIBTOMMATH_CONFIG)
 	$(HOSTAPD_TLS_CONFIG)
 	$(HOSTAPD_RADIUS_IPV6_CONFIG)
 	$(HOSTAPD_EAP_CONFIG)
