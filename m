From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 May 2012 16:46:21 -0300
Subject: [Buildroot] [PATCHv2] wpa_supplicant: bump to version 1.0
Message-ID: <1337024781-9793-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.0
Also convert to gentargets.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/Config.in                   |    9 +-
 .../wpa_supplicant-0.7.3-dbus-emit-property.patch  |   61 -------------
 .../wpa_supplicant-0.7.3-ht40-secondary.patch      |   52 ------------
 .../wpa_supplicant-0.7.3-libnl-3.patch             |   15 ----
 ...pa_supplicant-0.7.3-nl80211-cipher-suites.patch |   89 --------------------
 package/wpa_supplicant/wpa_supplicant.mk           |   68 ++++++++-------
 6 files changed, 39 insertions(+), 255 deletions(-)
 delete mode 100644 package/wpa_supplicant/wpa_supplicant-0.7.3-dbus-emit-property.patch
 delete mode 100644 package/wpa_supplicant/wpa_supplicant-0.7.3-ht40-secondary.patch
 delete mode 100644 package/wpa_supplicant/wpa_supplicant-0.7.3-libnl-3.patch
 delete mode 100644 package/wpa_supplicant/wpa_supplicant-0.7.3-nl80211-cipher-suites.patch
 mode change 100755 => 100644 package/wpa_supplicant/wpa_supplicant.conf

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 8ac2576..d7cefe3 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -5,27 +5,25 @@ config BR2_PACKAGE_WPA_SUPPLICANT
 
 	  http://hostap.epitest.fi/wpa_supplicant/
 
+if BR2_PACKAGE_WPA_SUPPLICANT
+
 config BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	bool "Enable EAP"
-	depends on BR2_PACKAGE_WPA_SUPPLICANT
 	help
 	  Enable support for EAP.
 
 config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	bool "Install wpa_cli binary"
-	depends on BR2_PACKAGE_WPA_SUPPLICANT
 	help
 	  Install wpa_cli command line utility
 
 config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 	bool "Install wpa_passphrase binary"
-	depends on BR2_PACKAGE_WPA_SUPPLICANT
 	help
 	  Install wpa_passphrase command line utility
 
 config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	bool "Enable support for soft AP"
-	depends on BR2_PACKAGE_WPA_SUPPLICANT
 	help
 	  With this option enabled, wpa_supplicant can act as
 	  access point. This can be used for open and WPA2-Personal networks
@@ -34,6 +32,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WPS
 	bool "Enable support for WPS"
-	depends on BR2_PACKAGE_WPA_SUPPLICANT
 	help
 	  Enable support for Wi-Fi Protected Setup (WPS)
+
+endif
diff --git a/package/wpa_supplicant/wpa_supplicant-0.7.3-dbus-emit-property.patch b/package/wpa_supplicant/wpa_supplicant-0.7.3-dbus-emit-property.patch
deleted file mode 100644
index 4c50020..0000000
--- a/package/wpa_supplicant/wpa_supplicant-0.7.3-dbus-emit-property.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From b80b5639935d37b95d00f86b57f2844a9c775f57 Mon Sep 17 00:00:00 2001
-From: Dan Williams <dcbw@redhat.com>
-Date: Fri, 17 Dec 2010 15:56:01 +0200
-Subject: [PATCH] dbus: Emit property changed events when adding/removing BSSes
-
-The supplicant was not emitting property changed events when the BSSs
-property changed.
-
-Signed-off-by: Dan Williams <dcbw@redhat.com>
-(cherry picked from commit 1e6288df6b07a353a9246b77e0de2a840b5f2c72)
----
- wpa_supplicant/dbus/dbus_new.c |    6 ++++++
- wpa_supplicant/dbus/dbus_new.h |    1 +
- 2 files changed, 7 insertions(+), 0 deletions(-)
-
-diff --git a/wpa_supplicant/dbus/dbus_new.c b/wpa_supplicant/dbus/dbus_new.c
-index bdfbbac..c66640a 100644
---- a/wpa_supplicant/dbus/dbus_new.c
-+++ b/wpa_supplicant/dbus/dbus_new.c
-@@ -691,6 +691,10 @@ void wpas_dbus_signal_prop_changed(struct wpa_supplicant *wpa_s,
- 			wpas_dbus_getter_current_network;
- 		prop = "CurrentNetwork";
- 		break;
-+	case WPAS_DBUS_PROP_BSSS:
-+		getter = (WPADBusPropertyAccessor) wpas_dbus_getter_bsss;
-+		prop = "BSSs";
-+		break;
- 	default:
- 		wpa_printf(MSG_ERROR, "dbus: %s: Unknown Property value %d",
- 			   __func__, property);
-@@ -1199,6 +1203,7 @@ int wpas_dbus_unregister_bss(struct wpa_supplicant *wpa_s,
- 	}
- 
- 	wpas_dbus_signal_bss_removed(wpa_s, bss_obj_path);
-+	wpas_dbus_signal_prop_changed(wpa_s, WPAS_DBUS_PROP_BSSS);
- 
- 	return 0;
- }
-@@ -1263,6 +1268,7 @@ int wpas_dbus_register_bss(struct wpa_supplicant *wpa_s,
- 	}
- 
- 	wpas_dbus_signal_bss_added(wpa_s, bss_obj_path);
-+	wpas_dbus_signal_prop_changed(wpa_s, WPAS_DBUS_PROP_BSSS);
- 
- 	return 0;
- 
-diff --git a/wpa_supplicant/dbus/dbus_new.h b/wpa_supplicant/dbus/dbus_new.h
-index 80ea98c..9cdefcb 100644
---- a/wpa_supplicant/dbus/dbus_new.h
-+++ b/wpa_supplicant/dbus/dbus_new.h
-@@ -30,6 +30,7 @@ enum wpas_dbus_prop {
- 	WPAS_DBUS_PROP_STATE,
- 	WPAS_DBUS_PROP_CURRENT_BSS,
- 	WPAS_DBUS_PROP_CURRENT_NETWORK,
-+	WPAS_DBUS_PROP_BSSS,
- };
- 
- enum wpas_dbus_bss_prop {
--- 
-1.7.4-rc1
-
diff --git a/package/wpa_supplicant/wpa_supplicant-0.7.3-ht40-secondary.patch b/package/wpa_supplicant/wpa_supplicant-0.7.3-ht40-secondary.patch
deleted file mode 100644
index 7664f03..0000000
--- a/package/wpa_supplicant/wpa_supplicant-0.7.3-ht40-secondary.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From dea50507861b79f522c70500fe978072f143af8f Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni.malinen@atheros.com>
-Date: Fri, 12 Nov 2010 18:31:56 +0200
-Subject: [PATCH] AP: Verify that HT40 secondary channel is supported
-
-Refuse to enable HT40 mode AP unless both the primary and secondary
-channels are enabled for AP use.
-(cherry picked from commit 8ea3dd21d2e8b760612af0c7b6a3bb5b89ba7304)
----
- src/ap/hw_features.c |   26 ++++++++++++++++++++++++++
- 1 files changed, 26 insertions(+), 0 deletions(-)
-
-diff --git a/src/ap/hw_features.c b/src/ap/hw_features.c
-index 0159c72..7fc5b83 100644
---- a/src/ap/hw_features.c
-+++ b/src/ap/hw_features.c
-@@ -642,6 +642,32 @@ int hostapd_select_hw_mode(struct hostapd_iface *iface)
- 			break;
- 		}
- 	}
-+	if (ok && iface->conf->secondary_channel) {
-+		int sec_ok = 0;
-+		int sec_chan = iface->conf->channel +
-+			iface->conf->secondary_channel * 4;
-+		for (j = 0; j < iface->current_mode->num_channels; j++) {
-+			struct hostapd_channel_data *chan =
-+				&iface->current_mode->channels[j];
-+			if (!(chan->flag & HOSTAPD_CHAN_DISABLED) &&
-+			    (chan->chan == sec_chan)) {
-+				sec_ok = 1;
-+				break;
-+			}
-+		}
-+		if (!sec_ok) {
-+			hostapd_logger(iface->bss[0], NULL,
-+				       HOSTAPD_MODULE_IEEE80211,
-+				       HOSTAPD_LEVEL_WARNING,
-+				       "Configured HT40 secondary channel "
-+				       "(%d) not found from the channel list "
-+				       "of current mode (%d) %s",
-+				       sec_chan, iface->current_mode->mode,
-+				       hostapd_hw_mode_txt(
-+					       iface->current_mode->mode));
-+			ok = 0;
-+		}
-+	}
- 	if (iface->conf->channel == 0) {
- 		/* TODO: could request a scan of neighboring BSSes and select
- 		 * the channel automatically */
--- 
-1.7.4-rc1
-
diff --git a/package/wpa_supplicant/wpa_supplicant-0.7.3-libnl-3.patch b/package/wpa_supplicant/wpa_supplicant-0.7.3-libnl-3.patch
deleted file mode 100644
index a460c2a..0000000
--- a/package/wpa_supplicant/wpa_supplicant-0.7.3-libnl-3.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- a/src/drivers/drivers.mak	2011-11-29 19:19:56.684221050 +0100
-+++ b/src/drivers/drivers.mak	2011-11-29 19:20:12.199609246 +0100
-@@ -31,10 +31,10 @@
- NEED_AP_MLME=y
- NEED_NETLINK=y
- NEED_LINUX_IOCTL=y
--DRV_LIBS += -lnl
-+DRV_LIBS += -lnl-3
- 
- ifdef CONFIG_LIBNL20
--DRV_LIBS += -lnl-genl
-+DRV_LIBS += -lnl-genl-3
- DRV_CFLAGS += -DCONFIG_LIBNL20
- endif
- endif
diff --git a/package/wpa_supplicant/wpa_supplicant-0.7.3-nl80211-cipher-suites.patch b/package/wpa_supplicant/wpa_supplicant-0.7.3-nl80211-cipher-suites.patch
deleted file mode 100644
index 231498e..0000000
--- a/package/wpa_supplicant/wpa_supplicant-0.7.3-nl80211-cipher-suites.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From d0f3f451f0002339ad75b43e79f1322f2e2e4ed1 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni.malinen@atheros.com>
-Date: Mon, 13 Dec 2010 21:08:53 +0200
-Subject: [PATCH] nl80211: Set cipher suites when using user space SME
-
-Previously, pairwise and group cipher suites were configured only
-when kernel SME (nl80211 connect API) was used. However, mac80211
-needs this information even in the user space SME case for one
-thing: to disable HT when TKIP/WEP is used. Add
-NL80211_ATTR_CIPHER_SUITES_PAIRWISE to fix this special case with
-user space SME. This allows mac80211 to disable HT properly when
-the AP is configured with configuration that is not allowed.
-(cherry picked from commit aca016054885c17d58c41888698761f2e1ce2b39)
----
- src/drivers/driver_nl80211.c |   44 ++++++++++++++++++++++++++++++++++++++++++
- wpa_supplicant/sme.c         |    2 +
- 2 files changed, 46 insertions(+), 0 deletions(-)
-
-diff --git a/src/drivers/driver_nl80211.c b/src/drivers/driver_nl80211.c
-index 364158c..fb75c2e 100644
---- a/src/drivers/driver_nl80211.c
-+++ b/src/drivers/driver_nl80211.c
-@@ -3940,6 +3940,50 @@ static int wpa_driver_nl80211_associate(
- 		NLA_PUT(msg, NL80211_ATTR_IE, params->wpa_ie_len,
- 			params->wpa_ie);
- 
-+	if (params->pairwise_suite != CIPHER_NONE) {
-+		int cipher;
-+
-+		switch (params->pairwise_suite) {
-+		case CIPHER_WEP40:
-+			cipher = WLAN_CIPHER_SUITE_WEP40;
-+			break;
-+		case CIPHER_WEP104:
-+			cipher = WLAN_CIPHER_SUITE_WEP104;
-+			break;
-+		case CIPHER_CCMP:
-+			cipher = WLAN_CIPHER_SUITE_CCMP;
-+			break;
-+		case CIPHER_TKIP:
-+		default:
-+			cipher = WLAN_CIPHER_SUITE_TKIP;
-+			break;
-+		}
-+		wpa_printf(MSG_DEBUG, "  * pairwise=0x%x\n", cipher);
-+		NLA_PUT_U32(msg, NL80211_ATTR_CIPHER_SUITES_PAIRWISE, cipher);
-+	}
-+
-+	if (params->group_suite != CIPHER_NONE) {
-+		int cipher;
-+
-+		switch (params->group_suite) {
-+		case CIPHER_WEP40:
-+			cipher = WLAN_CIPHER_SUITE_WEP40;
-+			break;
-+		case CIPHER_WEP104:
-+			cipher = WLAN_CIPHER_SUITE_WEP104;
-+			break;
-+		case CIPHER_CCMP:
-+			cipher = WLAN_CIPHER_SUITE_CCMP;
-+			break;
-+		case CIPHER_TKIP:
-+		default:
-+			cipher = WLAN_CIPHER_SUITE_TKIP;
-+			break;
-+		}
-+		wpa_printf(MSG_DEBUG, "  * group=0x%x\n", cipher);
-+		NLA_PUT_U32(msg, NL80211_ATTR_CIPHER_SUITE_GROUP, cipher);
-+	}
-+
- #ifdef CONFIG_IEEE80211W
- 	if (params->mgmt_frame_protection == MGMT_FRAME_PROTECTION_REQUIRED)
- 		NLA_PUT_U32(msg, NL80211_ATTR_USE_MFP, NL80211_MFP_REQUIRED);
-diff --git a/wpa_supplicant/sme.c b/wpa_supplicant/sme.c
-index 5604e97..878bbf0 100644
---- a/wpa_supplicant/sme.c
-+++ b/wpa_supplicant/sme.c
-@@ -333,6 +333,8 @@ void sme_associate(struct wpa_supplicant *wpa_s, enum wpas_mode mode,
- 	params.wpa_ie = wpa_s->sme.assoc_req_ie_len ?
- 		wpa_s->sme.assoc_req_ie : NULL;
- 	params.wpa_ie_len = wpa_s->sme.assoc_req_ie_len;
-+	params.pairwise_suite = cipher_suite2driver(wpa_s->pairwise_cipher);
-+	params.group_suite = cipher_suite2driver(wpa_s->group_cipher);
- #ifdef CONFIG_IEEE80211R
- 	if (auth_type == WLAN_AUTH_FT && wpa_s->sme.ft_ies) {
- 		params.wpa_ie = wpa_s->sme.ft_ies;
--- 
-1.7.4-rc1
-
diff --git a/package/wpa_supplicant/wpa_supplicant.conf b/package/wpa_supplicant/wpa_supplicant.conf
old mode 100755
new mode 100644
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 4a1baea..a4978e0 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,18 +4,19 @@
 #
 #############################################################
 
-WPA_SUPPLICANT_VERSION = 0.7.3
+WPA_SUPPLICANT_VERSION = 1.0
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
-WPA_SUPPLICANT_TARGET_BINS = wpa_cli wpa_supplicant wpa_passphrase
 WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
+WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
+WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
 define WPA_SUPPLICANT_LIBNL_CONFIG
 	$(SED) "s/^#CONFIG_DRIVER_NL80211/CONFIG_DRIVER_NL80211/" $(WPA_SUPPLICANT_CONFIG)
-	echo "CONFIG_LIBNL20=y" >>$(WPA_SUPPLICANT_CONFIG)
+	echo "CONFIG_LIBNL32=y" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 endif
 
@@ -47,18 +48,24 @@ define WPA_SUPPLICANT_CRYPTO_CONFIG
 	echo "CONFIG_INTERNAL_LIBTOMMATH_FAST=y" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 
-# Try to use openssl for TLS if it's already available
-# gnutls is also supported for TLS
+# Try to use openssl or gnutls if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 define WPA_SUPPLICANT_TLS_CONFIG
 	echo "CONFIG_TLS=openssl" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 else
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+	WPA_SUPPLICANT_DEPENDENCIES += gnutls
+define WPA_SUPPLICANT_TLS_CONFIG
+	echo "CONFIG_TLS=gnutls" >>$(WPA_SUPPLICANT_CONFIG)
+endef
+else
 define WPA_SUPPLICANT_TLS_CONFIG
 	echo "CONFIG_TLS=internal" >>$(WPA_SUPPLICANT_CONFIG)
 endef
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WPA_SUPPLICANT_DEPENDENCIES += host-pkg-config dbus
@@ -72,9 +79,6 @@ endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
-	echo "CFLAGS += $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/" >>$(WPA_SUPPLICANT_CONFIG)
-	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
-	echo "CC = $(TARGET_CC)" >>$(WPA_SUPPLICANT_CONFIG)
 	$(SED) "s/^#CONFIG_IEEE80211R/CONFIG_IEEE80211R/" $(WPA_SUPPLICANT_CONFIG)
 	$(SED) "s/^#CONFIG_DELAYED_MIC/CONFIG_DELAYED_MIC/" $(WPA_SUPPLICANT_CONFIG)
 	$(SED) "s/^CONFIG_DRIVER_ATMEL/#CONFIG_DRIVER_ATMEL/" $(WPA_SUPPLICANT_CONFIG)
@@ -89,22 +93,27 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
 	$(WPA_SUPPLICANT_AP_CONFIG)
 endef
 
-define WPA_SUPPLICANT_REMOVE_CLI
-	rm -f $(TARGET_DIR)/usr/sbin/wpa_cli
+define WPA_SUPPLICANT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CFLAGS="$(WPA_SUPPLICANT_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(WPA_SUPPLICANT_SUBDIR)
 endef
 
-ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_CLI),y)
-WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_REMOVE_CLI
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CLI),y)
+define WPA_SUPPLICANT_INSTALL_CLI
+	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_cli \
+		$(TARGET_DIR)/usr/sbin/wpa_cli
+endef
 endif
 
-define WPA_SUPPLICANT_REMOVE_PASSPHRASE
-	rm -f $(TARGET_DIR)/usr/sbin/wpa_passphrase
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE),y)
+define WPA_SUPPLICANT_INSTALL_PASSPHRASE
+	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_passphrase \
+		$(TARGET_DIR)/usr/sbin/wpa_passphrase
 endef
-
-ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE),y)
-WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_REMOVE_PASSPHRASE
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
 define WPA_SUPPLICANT_INSTALL_DBUS
 	$(INSTALL) -D \
 	  $(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
@@ -113,23 +122,16 @@ define WPA_SUPPLICANT_INSTALL_DBUS
 	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_SERVICE).service \
 	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
 endef
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_INSTALL_DBUS
 endif
 
-define WPA_SUPPLICANT_INSTALL_CONFIG
-	$(INSTALL) -m 644 \
-	  package/wpa_supplicant/wpa_supplicant.conf  $(TARGET_DIR)/etc/wpa_supplicant.conf
-endef
-
-WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_INSTALL_CONFIG
-
-define WPA_SUPPLICANT_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(WPA_SUPPLICANT_TARGET_BINS))
-	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
-	rm -f $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
-	rm -f $(TARGET_DIR)/usr/etc/wpa_supplicant.conf
+define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
+		$(TARGET_DIR)/usr/sbin/wpa_supplicant
+	$(INSTALL) -m 644 -D package/wpa_supplicant/wpa_supplicant.conf \
+		$(TARGET_DIR)/etc/wpa_supplicant.conf
+	$(WPA_SUPPLICANT_INSTALL_CLI)
+	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
+	$(WPA_SUPPLICANT_INSTALL_DBUS)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
