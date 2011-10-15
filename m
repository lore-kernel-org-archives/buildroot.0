From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:37 -0300
Subject: [Buildroot] [PATCH 23/25] hostapd: add HT40 patch
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-23-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hostapd/hostapd-0.7.3-ht40-secondary.patch |   52 ++++++++++++++++++++
 package/hostapd/hostapd.mk                         |    1 -
 2 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 package/hostapd/hostapd-0.7.3-ht40-secondary.patch

diff --git a/package/hostapd/hostapd-0.7.3-ht40-secondary.patch b/package/hostapd/hostapd-0.7.3-ht40-secondary.patch
new file mode 100644
index 0000000..7664f03
--- /dev/null
+++ b/package/hostapd/hostapd-0.7.3-ht40-secondary.patch
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
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 6ffca0a..0d6c2c5 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -9,7 +9,6 @@ HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = libnl
-
 HOSTAPD_LDFLAGS = $(TARGET_LDFLAGS)
 
 # libnl needs -lm (for rint) if linking statically
-- 
1.7.3.4
