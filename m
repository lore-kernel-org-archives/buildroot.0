From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Oct 2010 11:30:31 +0200
Subject: [Buildroot] [git commit master 1/1] hostapd: bump to 0.7.3
Message-ID: <20101018093103.B03B18C9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=daff8f47ab4885f317672697ca47a6576ce4cd1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/Config.in  |    8 ++---
 package/hostapd/hostapd.mk |   86 ++++++++++++++++++++++++-------------------
 2 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 133796e..376a087 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -10,16 +10,14 @@ config BR2_PACKAGE_HOSTAPD
 
 	  http://hostap.epitest.fi/
 
-config BR2_PACKAGE_HOSTAPD_EXTRA_EAP
-	bool "Enable EAP TLS/TTLS/MSCHAPv2/PEAP"
+config BR2_PACKAGE_HOSTAPD_EAP
+	bool "Enable EAP"
 	depends on BR2_PACKAGE_HOSTAPD
-	select BR2_PACKAGE_OPENSSL
 	help
-	  Enable support for extra EAP methods TLS, TTLS, MSCHAPv2 and PEAP.
+	  Enable support for EAP and RADIUS.
 
 config BR2_PACKAGE_HOSTAPD_WPS
 	bool "Enable WPS"
 	depends on BR2_PACKAGE_HOSTAPD
-	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable support for Wi-Fi Protected Setup.
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 4065d7b..27689b8 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -1,46 +1,66 @@
-#############################################################
+##############################################################
 #
 # hostapd
 #
 #############################################################
 
-HOSTAPD_VERSION = 0.7.2
+HOSTAPD_VERSION = 0.7.3
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = libnl
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	HOSTAPD_DEPENDENCIES += openssl
-	# OpenSSL is required for EXTRA_EAP and/or WPS
-	# We take care of that in Config.in
-else
-define HOSTAPD_OPENSSL_CONF
+define HOSTAPD_CRYPTO_CONFIG
 	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_TLS=internal" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_INTERNAL_LIBTOMMATH_FAST=y" >>$(HOSTAPD_CONFIG)
 endef
-endif
 
-ifneq ($(BR2_INET_IPV6),y)
-define HOSTAPD_IPV6_CONF
-	$(SED) "s/CONFIG_IPV6=y//" $(HOSTAPD_CONFIG)
+# Try to use openssl for TLS if it's already available
+# gnutls is also supported for TLS
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	HOSTAPD_DEPENDENCIES += openssl
+define HOSTAPD_TLS_CONFIG
+	echo "CONFIG_TLS=openssl" >>$(HOSTAPD_CONFIG)
+endef
+else
+define HOSTAPD_TLS_CONFIG
+	echo "CONFIG_TLS=internal" >>$(HOSTAPD_CONFIG)
 endef
 endif
 
-ifneq ($(BR2_PACKAGE_HOSTAPD_EXTRA_EAP),y)
-define HOSTAPD_EXTRA_EAP_CONF
+ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
+define HOSTAPD_EAP_CONFIG
 	$(SED) "s/CONFIG_EAP_MSCHAPV2=y//" $(HOSTAPD_CONFIG)
 	$(SED) "s/CONFIG_EAP_PEAP=y//" $(HOSTAPD_CONFIG)
 	$(SED) "s/CONFIG_EAP_TLS=y//" $(HOSTAPD_CONFIG)
 	$(SED) "s/CONFIG_EAP_TTLS=y//" $(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_AKA=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_AKA_PRIME=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_GPSK=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_GPSK_SHA256=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_PAX=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_PSK=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_SAKE=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_SIM=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_RADIUS_SERVER=y" >>$(HOSTAPD_CONFIG)
+endef
+ifeq ($(BR2_INET_IPV6),y)
+define HOSTAPD_RADIUS_IPV6_CONFIG
+	$(SED) "s/^#CONFIG_IPV6/CONFIG_IPV6/" $(HOSTAPD_CONFIG)
+endef
+endif
+else
+define HOSTAPD_EAP_CONFIG
+	$(SED) "s/^CONFIG_EAP/#CONFIG_EAP/g" $(HOSTAPD_CONFIG)
+	$(SED) "s/^#CONFIG_NO_ACCOUNTING/CONFIG_NO_ACCOUNTING/" $(HOSTAPD_CONFIG)
+	$(SED) "s/^#CONFIG_NO_RADIUS/CONFIG_NO_RADIUS/" $(HOSTAPD_CONFIG)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
-define HOSTAPD_WPS_CONF
-	echo "CONFIG_WPS=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_WPS_UPNP=y" >>$(HOSTAPD_CONFIG)
+define HOSTAPD_WPS_CONFIG
+	$(SED) "s/^#CONFIG_WPS/CONFIG_WPS/g" $(HOSTAPD_CONFIG)
 endef
 endif
 
@@ -50,28 +70,18 @@ define HOSTAPD_CONFIGURE_CMDS
 	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(HOSTAPD_CONFIG)
 	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(HOSTAPD_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(HOSTAPD_CONFIG)
-# EAP
-	echo "CONFIG_EAP_AKA=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_AKA_PRIME=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_GPSK=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_GPSK_SHA256=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_PAX=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_PSK=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_SAKE=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_SIM=y" >>$(HOSTAPD_CONFIG)
 # Drivers
-	echo "CONFIG_DRIVER_WIRED=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_DRIVER_PRISM54=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_DRIVER_NL80211=y" >>$(HOSTAPD_CONFIG)
+	$(SED) "s/^#CONFIG_DRIVER_WIRED/CONFIG_DRIVER_WIRED/" $(HOSTAPD_CONFIG)
+	$(SED) "s/^#CONFIG_DRIVER_NL80211/CONFIG_DRIVER_NL80211/" $(HOSTAPD_CONFIG)
 # Misc
-	echo "CONFIG_IEEE80211N=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_IEEE80211R=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_IEEE80211W=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_RADIUS_SERVER=y" >>$(HOSTAPD_CONFIG)
-	$(HOSTAPD_OPENSSL_CONF)
-	$(HOSTAPD_IPV6_CONF)
-	$(HOSTAPD_EXTRA_EAP_CONF)
-	$(HOSTAPD_WPS_CONF)
+ 	$(SED) "s/^CONFIG_IPV6/#CONFIG_IPV6/" $(HOSTAPD_CONFIG)
+	$(SED) "s/^#CONFIG_IEEE80211N/CONFIG_IEEE80211N/" $(HOSTAPD_CONFIG)
+	$(SED) "s/^#CONFIG_IEEE80211R/CONFIG_IEEE80211R/" $(HOSTAPD_CONFIG)
+	$(HOSTAPD_CRYPTO_CONFIG)
+	$(HOSTAPD_TLS_CONFIG)
+	$(HOSTAPD_RADIUS_IPV6_CONFIG)
+	$(HOSTAPD_EAP_CONFIG)
+	$(HOSTAPD_WPS_CONFIG)
 endef
 
 define HOSTAPD_INSTALL_TARGET_CMDS
-- 
1.7.1
