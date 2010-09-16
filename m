From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] hostapd: use correct step
	override method
Message-ID: <20100916113829.71E9C8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f129a680fafc48d329d551590d7e0fa6208e49a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/hostapd.mk |   78 ++++++++++++++++++++++++-------------------
 1 files changed, 43 insertions(+), 35 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index bde3766..d826030 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -12,47 +12,52 @@ HOSTAPD_DEPENDENCIES = libnl
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
+	# OpenSSL is required for EXTRA_EAP and/or WPS
+	# We take care of that in Config.in
+define HOSTAPD_OPENSSL_CONF
+	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_TLS=internal" >>$(HOSTAPD_CONFIG)
+endef
 endif
 
-$(eval $(call AUTOTARGETS,package,hostapd))
-
-$(HOSTAPD_TARGET_CONFIGURE):
-	cp $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/defconfig $(HOSTAPD_CONFIG)
-	$(SED) "s/\/local//" $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/Makefile
-	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(HOSTAPD_CONFIG)
-	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(HOSTAPD_CONFIG)
-	echo "CC = $(TARGET_CC)" >>$(HOSTAPD_CONFIG)
-# IPv6
 ifneq ($(BR2_INET_IPV6),y)
+define HOSTAPD_IPV6_CONF
 	$(SED) "s/CONFIG_IPV6=y//" $(HOSTAPD_CONFIG)
+endef
 endif
-# EAP
-	echo "CONFIG_EAP_AKA=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_AKA_PRIME=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_GPSK=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_GPSK_SHA256=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_PAX=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_PSK=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_SAKE=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_EAP_SIM=y" >>$(HOSTAPD_CONFIG)
+
 ifneq ($(BR2_PACKAGE_HOSTAPD_EXTRA_EAP),y)
+define HOSTAPD_EXTRA_EAP_CONF
 	$(SED) "s/CONFIG_EAP_MSCHAPV2=y//" $(HOSTAPD_CONFIG)
 	$(SED) "s/CONFIG_EAP_PEAP=y//" $(HOSTAPD_CONFIG)
 	$(SED) "s/CONFIG_EAP_TLS=y//" $(HOSTAPD_CONFIG)
 	$(SED) "s/CONFIG_EAP_TTLS=y//" $(HOSTAPD_CONFIG)
+endef
 endif
-# OpenSSL is required for EXTRA_EAP and/or WPS
-# We take care of that in Config.in
-ifneq ($(BR2_PACKAGE_OPENSSL),y)
-	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(HOSTAPD_CONFIG)
-	echo "CONFIG_TLS=internal" >>$(HOSTAPD_CONFIG)
-endif
-# WPS
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
+define HOSTAPD_WPS_CONF
 	echo "CONFIG_WPS=y" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_WPS_UPNP=y" >>$(HOSTAPD_CONFIG)
+endef
 endif
+
+define HOSTAPD_CONFIGURE_CMDS
+	cp $(@D)/$(HOSTAPD_SUBDIR)/defconfig $(HOSTAPD_CONFIG)
+	$(SED) "s/\/local//" $(@D)/$(HOSTAPD_SUBDIR)/Makefile
+	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(HOSTAPD_CONFIG)
+	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(HOSTAPD_CONFIG)
+	echo "CC = $(TARGET_CC)" >>$(HOSTAPD_CONFIG)
+# EAP
+	echo "CONFIG_EAP_AKA=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_AKA_PRIME=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_GPSK=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_GPSK_SHA256=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_PAX=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_PSK=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_SAKE=y" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_EAP_SIM=y" >>$(HOSTAPD_CONFIG)
 # Drivers
 	echo "CONFIG_DRIVER_WIRED=y" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_DRIVER_PRISM54=y" >>$(HOSTAPD_CONFIG)
@@ -62,19 +67,22 @@ endif
 	echo "CONFIG_IEEE80211R=y" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_IEEE80211W=y" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_RADIUS_SERVER=y" >>$(HOSTAPD_CONFIG)
-	touch $@
+	$(HOSTAPD_OPENSSL_CONF)
+	$(HOSTAPD_IPV6_CONF)
+	$(HOSTAPD_EXTRA_EAP_CONF)
+	$(HOSTAPD_WPS_CONF)
+endef
 
-$(HOSTAPD_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing to target")
-	$(INSTALL) -m 0755 $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/hostapd \
+define HOSTAPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/$(HOSTAPD_SUBDIR)/hostapd \
 		$(TARGET_DIR)/usr/sbin
-	$(INSTALL) -m 0755 $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/hostapd_cli \
+	$(INSTALL) -m 0755 $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
 		$(TARGET_DIR)/usr/bin
-	touch $@
+endef
 
-$(HOSTAPD_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define HOSTAPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/hostapd
 	rm -f $(TARGET_DIR)/usr/bin/hostapd
-	rm -f $(HOSTAPD_TARGET_INSTALL_TARGET) $(HOSTAPD_HOOK_POST_INSTALL)
+endef
 
+$(eval $(call AUTOTARGETS,package,hostapd))
-- 
1.7.1
