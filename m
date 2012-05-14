From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 May 2012 09:29:59 -0300
Subject: [Buildroot] [PATCH 2/3] hostapd: bump to version 1.0
In-Reply-To: <1336998600-3373-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336998600-3373-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336998600-3373-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.0
Also convert to gentargets.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hostapd/Config.in                          |    6 ++-
 package/hostapd/hostapd-0.7.3-ht40-secondary.patch |   52 --------------------
 package/hostapd/hostapd-0.7.3-libnl3.patch         |   15 ------
 package/hostapd/hostapd.mk                         |   38 +++++++-------
 4 files changed, 23 insertions(+), 88 deletions(-)
 delete mode 100644 package/hostapd/hostapd-0.7.3-ht40-secondary.patch
 delete mode 100644 package/hostapd/hostapd-0.7.3-libnl3.patch

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 376a087..4a474c3 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -10,14 +10,16 @@ config BR2_PACKAGE_HOSTAPD
 
 	  http://hostap.epitest.fi/
 
+if BR2_PACKAGE_HOSTAPD
+
 config BR2_PACKAGE_HOSTAPD_EAP
 	bool "Enable EAP"
-	depends on BR2_PACKAGE_HOSTAPD
 	help
 	  Enable support for EAP and RADIUS.
 
 config BR2_PACKAGE_HOSTAPD_WPS
 	bool "Enable WPS"
-	depends on BR2_PACKAGE_HOSTAPD
 	help
 	  Enable support for Wi-Fi Protected Setup.
+
+endif
diff --git a/package/hostapd/hostapd-0.7.3-ht40-secondary.patch b/package/hostapd/hostapd-0.7.3-ht40-secondary.patch
deleted file mode 100644
index 7664f03..0000000
--- a/package/hostapd/hostapd-0.7.3-ht40-secondary.patch
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
diff --git a/package/hostapd/hostapd-0.7.3-libnl3.patch b/package/hostapd/hostapd-0.7.3-libnl3.patch
deleted file mode 100644
index e47da73..0000000
--- a/package/hostapd/hostapd-0.7.3-libnl3.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- a/src/drivers/drivers.mak	2011-11-29 19:09:23.889942913 +0100
-+++ b/src/drivers/drivers.mak	2011-11-29 19:09:40.637381428 +0100
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
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 26ebf1d..d9ee4f0 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,11 +4,12 @@
 #
 #############################################################
 
-HOSTAPD_VERSION = 0.7.3
+HOSTAPD_VERSION = 1.0
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = libnl
+HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 HOSTAPD_LDFLAGS = $(TARGET_LDFLAGS)
 
 # libnl needs -lm (for rint) if linking statically
@@ -17,8 +18,7 @@ HOSTAPD_LDFLAGS += -lm
 endif
 
 define HOSTAPD_LIBNL_CONFIG
-	echo "CONFIG_LIBNL20=y" >>$(HOSTAPD_CONFIG)
-	echo "CFLAGS += -I$(STAGING_DIR)/usr/include/libnl3/" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_LIBNL32=y" >>$(HOSTAPD_CONFIG)
 endef
 
 define HOSTAPD_CRYPTO_CONFIG
@@ -27,18 +27,24 @@ define HOSTAPD_CRYPTO_CONFIG
 	echo "CONFIG_INTERNAL_LIBTOMMATH_FAST=y" >>$(HOSTAPD_CONFIG)
 endef
 
-# Try to use openssl for TLS if it's already available
-# gnutls is also supported for TLS
+# Try to use openssl or gnutls if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
 define HOSTAPD_TLS_CONFIG
 	echo "CONFIG_TLS=openssl" >>$(HOSTAPD_CONFIG)
 endef
 else
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+	HOSTAPD_DEPENDENCIES += gnutls
+define HOSTAPD_TLS_CONFIG
+	echo "CONFIG_TLS=gnutls" >>$(HOSTAPD_CONFIG)
+endef
+else
 define HOSTAPD_TLS_CONFIG
 	echo "CONFIG_TLS=internal" >>$(HOSTAPD_CONFIG)
 endef
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
 define HOSTAPD_EAP_CONFIG
@@ -76,14 +82,7 @@ endef
 endif
 
 define HOSTAPD_CONFIGURE_CMDS
-	cp $(@D)/$(HOSTAPD_SUBDIR)/defconfig $(HOSTAPD_CONFIG)
-	$(SED) "s/\/local//" $(@D)/$(HOSTAPD_SUBDIR)/Makefile
-	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(HOSTAPD_CONFIG)
-	echo "LDFLAGS += $(HOSTAPD_LDFLAGS)" >>$(HOSTAPD_CONFIG)
-	echo "CC = $(TARGET_CC)" >>$(HOSTAPD_CONFIG)
-# Drivers
-	$(SED) "s/^#CONFIG_DRIVER_WIRED/CONFIG_DRIVER_WIRED/" $(HOSTAPD_CONFIG)
-	$(SED) "s/^#CONFIG_DRIVER_NL80211/CONFIG_DRIVER_NL80211/" $(HOSTAPD_CONFIG)
+	cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
 # Misc
 	$(SED) "s/^CONFIG_IPV6/#CONFIG_IPV6/" $(HOSTAPD_CONFIG)
 	$(SED) "s/^#CONFIG_IEEE80211N/CONFIG_IEEE80211N/" $(HOSTAPD_CONFIG)
@@ -96,6 +95,12 @@ define HOSTAPD_CONFIGURE_CMDS
 	$(HOSTAPD_LIBNL_CONFIG)
 endef
 
+define HOSTAPD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CFLAGS="$(HOSTAPD_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(HOSTAPD_SUBDIR)
+endef
+
 define HOSTAPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd \
 		$(TARGET_DIR)/usr/sbin/hostapd
@@ -103,9 +108,4 @@ define HOSTAPD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/hostapd_cli
 endef
 
-define HOSTAPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/hostapd
-	rm -f $(TARGET_DIR)/usr/bin/hostapd
-endef
-
-$(eval $(call AUTOTARGETS))
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
