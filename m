From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] wpa_supplicant: convert
	old-style hooks to new-style hooks
Message-ID: <20100916113827.0DFD68AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1c99b35528d469bb55574977b07607756746fbfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |   84 ++++++++++++++++++------------
 1 files changed, 51 insertions(+), 33 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index c6bb058..a01ac4b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -16,66 +16,84 @@ WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
+define WPA_SUPPLICANT_LIBNL_CONFIG
+	echo "CONFIG_DRIVER_NL80211=y" >>$(WPA_SUPPLICANT_CONFIG)
+endef
 endif
 
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
+define WPA_SUPPLICANT_CRYPTO_CONFIG
+	$(SED) "s/^CONFIG_EAP_*/#CONFIG_EAP_/g" $(WPA_SUPPLICANT_CONFIG) \
+	echo "CONFIG_TLS=none" >>$(WPA_SUPPLICANT_CONFIG)
+endef
+else
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
+define WPA_SUPPLICANT_CRYPTO_CONFIG
+	echo "CONFIG_TLS=openssl" >>$(WPA_SUPPLICANT_CONFIG)
+endef
+else
+define WPA_SUPPLICANT_CRYPTO_CONFIG
+	echo "CONFIG_TLS=internal" >>$(WPA_SUPPLICANT_CONFIG) \
+	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
+endef
+endif
 endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WPA_SUPPLICANT_DEPENDENCIES += host-pkg-config dbus
 	WPA_SUPPLICANT_MAKE_ENV = \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
+define WPA_SUPPLICANT_DBUS_CONFIG
+	echo "CONFIG_CTRL_IFACE_DBUS=y" >>$(WPA_SUPPLICANT_CONFIG)
+endef
 endif
 
-$(eval $(call AUTOTARGETS,package,wpa_supplicant))
-
-$(WPA_SUPPLICANT_TARGET_CONFIGURE):
-	cp $(WPA_SUPPLICANT_DIR)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
+define WPA_SUPPLICANT_CONFIGURE_CMDS
+	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(WPA_SUPPLICANT_CONFIG)
-	$(SED) "s/\/local//" $(WPA_SUPPLICANT_DIR)/wpa_supplicant/Makefile
-ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
-	$(SED) "s/^CONFIG_EAP_*/#CONFIG_EAP_/g" $(WPA_SUPPLICANT_CONFIG)
-	echo "CONFIG_TLS=none" >>$(WPA_SUPPLICANT_CONFIG)
-else
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
-	echo "CONFIG_TLS=openssl" >>$(WPA_SUPPLICANT_CONFIG)
-else
-	echo "CONFIG_TLS=internal" >>$(WPA_SUPPLICANT_CONFIG)
-	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
-endif
-endif
-ifeq ($(BR2_PACKAGE_DBUS),y)
-	echo "CONFIG_CTRL_IFACE_DBUS=y" >>$(WPA_SUPPLICANT_CONFIG)
-endif
-ifeq ($(BR2_PACKAGE_LIBNL),y)
-	echo "CONFIG_DRIVER_NL80211=y" >>$(WPA_SUPPLICANT_CONFIG)
-endif
-	touch $@
+	$(SED) "s/\/local//" $(@D)/wpa_supplicant/Makefile
+	$(WPA_SUPPLICANT_CRYPTO_CONFIG)
+	$(WPA_SUPPLICANT_LIBNL_CONFIG)
+	$(WPA_SUPPLICANT_DBUS_CONFIG)
+endef
 
-$(WPA_SUPPLICANT_HOOK_POST_INSTALL):
-ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_CLI),y)
+define WPA_SUPPLICANT_REMOVE_CLI
 	rm -f $(TARGET_DIR)/usr/sbin/wpa_cli
+endef
+
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_CLI),y)
+WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_REMOVE_CLI
 endif
-ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE),y)
+
+define WPA_SUPPLICANT_REMOVE_PASSPHRASE
 	rm -f $(TARGET_DIR)/usr/sbin/wpa_passphrase
+endef
+
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE),y)
+WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_REMOVE_PASSPHRASE
 endif
-ifeq ($(BR2_PACKAGE_DBUS),y)
+
+define WPA_SUPPLICANT_INSTALL_DBUS
 	$(INSTALL) -D \
-	  $(WPA_SUPPLICANT_DIR)/wpa_supplicant/dbus-wpa_supplicant.conf \
+	  $(@D)/wpa_supplicant/dbus-wpa_supplicant.conf \
 	  $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
 	$(INSTALL) -D \
-	  $(WPA_SUPPLICANT_DIR)/wpa_supplicant/dbus-wpa_supplicant.service \
+	  $(@D)/wpa_supplicant/dbus-wpa_supplicant.service \
 	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
+endef
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_INSTALL_DBUS
 endif
-	touch $@
 
-$(WPA_SUPPLICANT_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define WPA_SUPPLICANT_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(WPA_SUPPLICANT_TARGET_BINS))
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
 	rm -f $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
-	rm -f $(WPA_SUPPLICANT_TARGET_INSTALL_TARGET) $(WPA_SUPPLICANT_HOOK_POST_INSTALL)
+endef
 
+$(eval $(call AUTOTARGETS,package,wpa_supplicant))
-- 
1.7.1
