From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:38 -0300
Subject: [Buildroot] [PATCH 24/25] wpa_suppicant: add ht40,
	nl80211 and dbus patches
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-24-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../wpa_supplicant-0.7.3-dbus-emit-property.patch  |   61 +++++++++++++
 .../wpa_supplicant-0.7.3-ht40-secondary.patch      |   52 ++++++++++++
 ...pa_supplicant-0.7.3-nl80211-cipher-suites.patch |   89 ++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk           |    1 -
 4 files changed, 202 insertions(+), 1 deletions(-)
 create mode 100644 package/wpa_supplicant/wpa_supplicant-0.7.3-dbus-emit-property.patch
 create mode 100644 package/wpa_supplicant/wpa_supplicant-0.7.3-ht40-secondary.patch
 create mode 100644 package/wpa_supplicant/wpa_supplicant-0.7.3-nl80211-cipher-suites.patch

diff --git a/package/wpa_supplicant/wpa_supplicant-0.7.3-dbus-emit-property.patch b/package/wpa_supplicant/wpa_supplicant-0.7.3-dbus-emit-property.patch
new file mode 100644
index 0000000..4c50020
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0.7.3-dbus-emit-property.patch
@@ -0,0 +1,61 @@
+From b80b5639935d37b95d00f86b57f2844a9c775f57 Mon Sep 17 00:00:00 2001
+From: Dan Williams <dcbw@redhat.com>
+Date: Fri, 17 Dec 2010 15:56:01 +0200
+Subject: [PATCH] dbus: Emit property changed events when adding/removing BSSes
+
+The supplicant was not emitting property changed events when the BSSs
+property changed.
+
+Signed-off-by: Dan Williams <dcbw@redhat.com>
+(cherry picked from commit 1e6288df6b07a353a9246b77e0de2a840b5f2c72)
+---
+ wpa_supplicant/dbus/dbus_new.c |    6 ++++++
+ wpa_supplicant/dbus/dbus_new.h |    1 +
+ 2 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/wpa_supplicant/dbus/dbus_new.c b/wpa_supplicant/dbus/dbus_new.c
+index bdfbbac..c66640a 100644
+--- a/wpa_supplicant/dbus/dbus_new.c
++++ b/wpa_supplicant/dbus/dbus_new.c
+@@ -691,6 +691,10 @@ void wpas_dbus_signal_prop_changed(struct wpa_supplicant *wpa_s,
+ 			wpas_dbus_getter_current_network;
+ 		prop = "CurrentNetwork";
+ 		break;
++	case WPAS_DBUS_PROP_BSSS:
++		getter = (WPADBusPropertyAccessor) wpas_dbus_getter_bsss;
++		prop = "BSSs";
++		break;
+ 	default:
+ 		wpa_printf(MSG_ERROR, "dbus: %s: Unknown Property value %d",
+ 			   __func__, property);
+@@ -1199,6 +1203,7 @@ int wpas_dbus_unregister_bss(struct wpa_supplicant *wpa_s,
+ 	}
+ 
+ 	wpas_dbus_signal_bss_removed(wpa_s, bss_obj_path);
++	wpas_dbus_signal_prop_changed(wpa_s, WPAS_DBUS_PROP_BSSS);
+ 
+ 	return 0;
+ }
+@@ -1263,6 +1268,7 @@ int wpas_dbus_register_bss(struct wpa_supplicant *wpa_s,
+ 	}
+ 
+ 	wpas_dbus_signal_bss_added(wpa_s, bss_obj_path);
++	wpas_dbus_signal_prop_changed(wpa_s, WPAS_DBUS_PROP_BSSS);
+ 
+ 	return 0;
+ 
+diff --git a/wpa_supplicant/dbus/dbus_new.h b/wpa_supplicant/dbus/dbus_new.h
+index 80ea98c..9cdefcb 100644
+--- a/wpa_supplicant/dbus/dbus_new.h
++++ b/wpa_supplicant/dbus/dbus_new.h
+@@ -30,6 +30,7 @@ enum wpas_dbus_prop {
+ 	WPAS_DBUS_PROP_STATE,
+ 	WPAS_DBUS_PROP_CURRENT_BSS,
+ 	WPAS_DBUS_PROP_CURRENT_NETWORK,
++	WPAS_DBUS_PROP_BSSS,
+ };
+ 
+ enum wpas_dbus_bss_prop {
+-- 
+1.7.4-rc1
+
diff --git a/package/wpa_supplicant/wpa_supplicant-0.7.3-ht40-secondary.patch b/package/wpa_supplicant/wpa_supplicant-0.7.3-ht40-secondary.patch
new file mode 100644
index 0000000..7664f03
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0.7.3-ht40-secondary.patch
@@ -0,0 +1,52 @@
+From dea50507861b79f522c70500fe978072f143af8f Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni.malinen@atheros.com>
+Date: Fri, 12 Nov 2010 18:31:56 +0200
+Subject: [PATCH] AP: Verify that HT40 secondary channel is supported
+
+Refuse to enable HT40 mode AP unless both the primary and secondary
+channels are enabled for AP use.
+(cherry picked from commit 8ea3dd21d2e8b760612af0c7b6a3bb5b89ba7304)
+---
+ src/ap/hw_features.c |   26 ++++++++++++++++++++++++++
+ 1 files changed, 26 insertions(+), 0 deletions(-)
+
+diff --git a/src/ap/hw_features.c b/src/ap/hw_features.c
+index 0159c72..7fc5b83 100644
+--- a/src/ap/hw_features.c
++++ b/src/ap/hw_features.c
+@@ -642,6 +642,32 @@ int hostapd_select_hw_mode(struct hostapd_iface *iface)
+ 			break;
+ 		}
+ 	}
++	if (ok && iface->conf->secondary_channel) {
++		int sec_ok = 0;
++		int sec_chan = iface->conf->channel +
++			iface->conf->secondary_channel * 4;
++		for (j = 0; j < iface->current_mode->num_channels; j++) {
++			struct hostapd_channel_data *chan =
++				&iface->current_mode->channels[j];
++			if (!(chan->flag & HOSTAPD_CHAN_DISABLED) &&
++			    (chan->chan == sec_chan)) {
++				sec_ok = 1;
++				break;
++			}
++		}
++		if (!sec_ok) {
++			hostapd_logger(iface->bss[0], NULL,
++				       HOSTAPD_MODULE_IEEE80211,
++				       HOSTAPD_LEVEL_WARNING,
++				       "Configured HT40 secondary channel "
++				       "(%d) not found from the channel list "
++				       "of current mode (%d) %s",
++				       sec_chan, iface->current_mode->mode,
++				       hostapd_hw_mode_txt(
++					       iface->current_mode->mode));
++			ok = 0;
++		}
++	}
+ 	if (iface->conf->channel == 0) {
+ 		/* TODO: could request a scan of neighboring BSSes and select
+ 		 * the channel automatically */
+-- 
+1.7.4-rc1
+
diff --git a/package/wpa_supplicant/wpa_supplicant-0.7.3-nl80211-cipher-suites.patch b/package/wpa_supplicant/wpa_supplicant-0.7.3-nl80211-cipher-suites.patch
new file mode 100644
index 0000000..231498e
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0.7.3-nl80211-cipher-suites.patch
@@ -0,0 +1,89 @@
+From d0f3f451f0002339ad75b43e79f1322f2e2e4ed1 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni.malinen@atheros.com>
+Date: Mon, 13 Dec 2010 21:08:53 +0200
+Subject: [PATCH] nl80211: Set cipher suites when using user space SME
+
+Previously, pairwise and group cipher suites were configured only
+when kernel SME (nl80211 connect API) was used. However, mac80211
+needs this information even in the user space SME case for one
+thing: to disable HT when TKIP/WEP is used. Add
+NL80211_ATTR_CIPHER_SUITES_PAIRWISE to fix this special case with
+user space SME. This allows mac80211 to disable HT properly when
+the AP is configured with configuration that is not allowed.
+(cherry picked from commit aca016054885c17d58c41888698761f2e1ce2b39)
+---
+ src/drivers/driver_nl80211.c |   44 ++++++++++++++++++++++++++++++++++++++++++
+ wpa_supplicant/sme.c         |    2 +
+ 2 files changed, 46 insertions(+), 0 deletions(-)
+
+diff --git a/src/drivers/driver_nl80211.c b/src/drivers/driver_nl80211.c
+index 364158c..fb75c2e 100644
+--- a/src/drivers/driver_nl80211.c
++++ b/src/drivers/driver_nl80211.c
+@@ -3940,6 +3940,50 @@ static int wpa_driver_nl80211_associate(
+ 		NLA_PUT(msg, NL80211_ATTR_IE, params->wpa_ie_len,
+ 			params->wpa_ie);
+ 
++	if (params->pairwise_suite != CIPHER_NONE) {
++		int cipher;
++
++		switch (params->pairwise_suite) {
++		case CIPHER_WEP40:
++			cipher = WLAN_CIPHER_SUITE_WEP40;
++			break;
++		case CIPHER_WEP104:
++			cipher = WLAN_CIPHER_SUITE_WEP104;
++			break;
++		case CIPHER_CCMP:
++			cipher = WLAN_CIPHER_SUITE_CCMP;
++			break;
++		case CIPHER_TKIP:
++		default:
++			cipher = WLAN_CIPHER_SUITE_TKIP;
++			break;
++		}
++		wpa_printf(MSG_DEBUG, "  * pairwise=0x%x\n", cipher);
++		NLA_PUT_U32(msg, NL80211_ATTR_CIPHER_SUITES_PAIRWISE, cipher);
++	}
++
++	if (params->group_suite != CIPHER_NONE) {
++		int cipher;
++
++		switch (params->group_suite) {
++		case CIPHER_WEP40:
++			cipher = WLAN_CIPHER_SUITE_WEP40;
++			break;
++		case CIPHER_WEP104:
++			cipher = WLAN_CIPHER_SUITE_WEP104;
++			break;
++		case CIPHER_CCMP:
++			cipher = WLAN_CIPHER_SUITE_CCMP;
++			break;
++		case CIPHER_TKIP:
++		default:
++			cipher = WLAN_CIPHER_SUITE_TKIP;
++			break;
++		}
++		wpa_printf(MSG_DEBUG, "  * group=0x%x\n", cipher);
++		NLA_PUT_U32(msg, NL80211_ATTR_CIPHER_SUITE_GROUP, cipher);
++	}
++
+ #ifdef CONFIG_IEEE80211W
+ 	if (params->mgmt_frame_protection == MGMT_FRAME_PROTECTION_REQUIRED)
+ 		NLA_PUT_U32(msg, NL80211_ATTR_USE_MFP, NL80211_MFP_REQUIRED);
+diff --git a/wpa_supplicant/sme.c b/wpa_supplicant/sme.c
+index 5604e97..878bbf0 100644
+--- a/wpa_supplicant/sme.c
++++ b/wpa_supplicant/sme.c
+@@ -333,6 +333,8 @@ void sme_associate(struct wpa_supplicant *wpa_s, enum wpas_mode mode,
+ 	params.wpa_ie = wpa_s->sme.assoc_req_ie_len ?
+ 		wpa_s->sme.assoc_req_ie : NULL;
+ 	params.wpa_ie_len = wpa_s->sme.assoc_req_ie_len;
++	params.pairwise_suite = cipher_suite2driver(wpa_s->pairwise_cipher);
++	params.group_suite = cipher_suite2driver(wpa_s->group_cipher);
+ #ifdef CONFIG_IEEE80211R
+ 	if (auth_type == WLAN_AUTH_FT && wpa_s->sme.ft_ies) {
+ 		params.wpa_ie = wpa_s->sme.ft_ies;
+-- 
+1.7.4-rc1
+
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 4636042..b2e7be3 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,7 +6,6 @@
 
 WPA_SUPPLICANT_VERSION = 0.7.3
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
-WPA_SUPPLICANT_DEPENDENCIES =
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 WPA_SUPPLICANT_TARGET_BINS = wpa_cli wpa_supplicant wpa_passphrase
-- 
1.7.3.4
