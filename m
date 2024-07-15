Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30943C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 18:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3CED408A5;
	Mon, 15 Jul 2024 18:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqV1QlfjcvWZ; Mon, 15 Jul 2024 18:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8B5D40580
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8B5D40580;
	Mon, 15 Jul 2024 18:02:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1558E1BF408
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 18:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0164F40632
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 18:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44SgRtFboY-A for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 18:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F162C40622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F162C40622
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F162C40622
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 18:02:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TQ21srPVJQso7TQ21smrsq; Mon, 15 Jul 2024 20:02:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 20:02:36 +0200
Message-Id: <20240715180236.664036-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA/cXbDALkuvAh+VSKBVy4ABTn0auqLg0GCgMYDhrQo7OiQDKUITDT/+ME59s3DvA+Ux0wTArTCrf0Mrb/aFwC288CUQ12QPJYTePnoKS4qg8iY0P5cg
 j6YEHaIALfNOzgVKKX5XbMhTMygyN4oZoFrVPFEgnXhsjRHdWPVTgkFkLL5ZrYtaBNYt4IU7oMrH3z/ygz4qwFopxu/u4JyDi1e1B/iQPUdVyFXNOLUlRLrG
 96P3Xii6ea06ZiRbpgfFjelXn4jZ+lshiHcHQGsuCvX2oB2Nkhe74vVbFFrC7BsqzdbclPz9rYFf1ORbkaA2qQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1721066557; bh=V3LGmpu6wVF/sLuiw+/Bb3FdM7FPV5vimH/w22WQtnA=;
 h=From:To:Subject:Date:MIME-Version;
 b=F1eaQ3fqTvAJ4KiilxzGgDhUr+25C6Ar3S4MwIdoczv4ee528G4XvxCv+wCCDqcHj
 SXH2tkiv5BlSvSyNOEOV67G4Xg0A45m3p+yUlBfCfzlkVr8tXxwuS3BG6sAp2UM7Zu
 vWVRDnfX0/kYraSur0WY2CeojHzvaGru8y9q2E8mxzJ9FSM3LBLNEnf/IahrjxVu/u
 6GspcP25nogwwnGdgzTWdCigFgFfWGcC4Zen0zseqylwHdFQQVNKkk0AnNAS0soqBH
 yhJNSN3GD2kH0WAhUByhito0vVnj1XrJV4e9XJMiE4B9MXQcSMlOIzelbIJJNTihvc
 sS4hCpSdwQYTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=F1eaQ3fq
Subject: [Buildroot] [PATCH] package/wilc-driver: bump version to 2024.04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This driver supports up to Linux version 6.6. Let's also drop local
patches.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...missing-prandom_u32-with-Linux-6.1.0.patch |  34 ---
 ...fix-build-failure-on-remove-callback.patch |  44 ----
 ...uild-failure-with-Linux-5.19-and-6.1.patch |  98 --------
 ...on_parameters-Linux-6.1-build-failur.patch | 216 ------------------
 .../wilc-driver/0005-Fix-cast-warnings.patch  |  43 ----
 .../wilc-driver/0006-Support-Linux-6.3.patch  |  43 ----
 .../wilc-driver/0007-Support-Linux-6.4.patch  |  36 ---
 package/wilc-driver/wilc-driver.hash          |   2 +-
 package/wilc-driver/wilc-driver.mk            |   2 +-
 9 files changed, 2 insertions(+), 516 deletions(-)
 delete mode 100644 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
 delete mode 100644 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
 delete mode 100644 package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
 delete mode 100644 package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
 delete mode 100644 package/wilc-driver/0005-Fix-cast-warnings.patch
 delete mode 100644 package/wilc-driver/0006-Support-Linux-6.3.patch
 delete mode 100644 package/wilc-driver/0007-Support-Linux-6.4.patch

diff --git a/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch b/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
deleted file mode 100644
index 2f10627301..0000000000
--- a/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f80e4343fa0a4d8b22933d1704c85a771fe234a4 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Dec 2022 19:56:46 +0100
-Subject: [PATCH] cfg80211.c: fix missing prandom_u32() with Linux >= 6.1.0
-
-prandom_u32() previously was only calling get_random_u32() so it's been
-dropped with Linux 6.1.0. So let's directly call get_random_u32() if Linux
-version >= 6.1.0.
-
-[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 016aa06..41edd02 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -1422,7 +1422,11 @@ static int mgmt_tx(struct wiphy *wiphy,
- 	const u8 *vendor_ie;
- 	int ret = 0;
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	*cookie = get_random_u32();
-+#else
- 	*cookie = prandom_u32();
-+#endif
- 	priv->tx_cookie = *cookie;
- 	mgmt = (const struct ieee80211_mgmt *)buf;
- 
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch b/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
deleted file mode 100644
index 87306dfa12..0000000000
--- a/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a88819bd63f977b5a33d72a2b9e264ce104726bd Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Dec 2022 21:02:12 +0100
-Subject: [PATCH] spi.c: fix build failure on remove callback
-
-Starting from Linux 5.18 remove callback returns void, so let's deal with
-it depending on Linux version >= 5.18.
-
-[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- spi.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/spi.c b/spi.c
-index 96c51fe..f7b43e2 100644
---- a/spi.c
-+++ b/spi.c
-@@ -211,7 +211,11 @@ free:
- 	return ret;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,18,0))
-+static void wilc_bus_remove(struct spi_device *spi)
-+#else
- static int wilc_bus_remove(struct spi_device *spi)
-+#endif
- {
- 	struct wilc *wilc = spi_get_drvdata(spi);
- 
-@@ -220,7 +224,10 @@ static int wilc_bus_remove(struct spi_device *spi)
- 
- 	wilc_netdev_cleanup(wilc);
- 	wilc_bt_deinit();
-+
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,18,0))
- 	return 0;
-+#endif
- }
- 
- static int wilc_spi_suspend(struct device *dev)
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch b/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
deleted file mode 100644
index 785b8904b2..0000000000
--- a/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From a608cdd7903505217529317c04b5b58cb7e25081 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Dec 2022 21:06:43 +0100
-Subject: [PATCH] cfg80211.c: fix build failure with Linux 5.19 and 6.1
-
-Starting from Linux 5.19 stop_ap() requires unsigned int link_id as
-parameter. Then from Linux 6.1 on lot of other cfg80211 APIs require
-int link_id to deal with MLO, so let's add that parameter too.
-
-[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 35 +++++++++++++++++++++++++++++------
- 1 file changed, 29 insertions(+), 6 deletions(-)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 41edd02..57c777d 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -674,8 +674,12 @@ static int wilc_wfi_cfg_copy_wpa_info(struct wilc_wfi_key *key_info,
- 	return 0;
- }
- 
--static int add_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
--		   bool pairwise, const u8 *mac_addr, struct key_params *params)
-+static int add_key(struct wiphy *wiphy, struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+		   int link_id,
-+#endif
-+		   u8 key_index,  bool pairwise, const u8 *mac_addr,
-+		   struct key_params *params)
- 
- {
- 	int ret = 0, keylen = params->key_len, seqlen = params->seq_len;
-@@ -792,6 +796,9 @@ static int add_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
- }
- 
- static int del_key(struct wiphy *wiphy, struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+		   int link_id,
-+#endif
- 		   u8 key_index,
- 		   bool pairwise,
- 		   const u8 *mac_addr)
-@@ -833,9 +840,13 @@ static int del_key(struct wiphy *wiphy, struct net_device *netdev,
- 	return ret;
- }
- 
--static int get_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
--		   bool pairwise, const u8 *mac_addr, void *cookie,
--		   void (*callback)(void *cookie, struct key_params *))
-+static int get_key(struct wiphy *wiphy, struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+		   int link_id,
-+#endif
-+		   u8 key_index, bool pairwise, const u8 *mac_addr,
-+		   void *cookie, void (*callback)(void *cookie,
-+		   struct key_params *))
- {
- 	struct wilc_vif *vif = netdev_priv(netdev);
- 	struct wilc_priv *priv = &vif->priv;
-@@ -877,12 +888,18 @@ static int get_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
- 
- /* wiphy_new() will WARN if not present*/
- static int set_default_key(struct wiphy *wiphy, struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+			   int link_id,
-+#endif
- 			   u8 key_index, bool unicast, bool multicast)
- {
- 	return 0;
- }
- 
- static int set_default_mgmt_key (struct wiphy *wiphy,struct net_device *netdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+				 int link_id,
-+#endif
- 				 u8 key_index)
- {
-     return 0;
-@@ -1814,7 +1831,13 @@ static int change_beacon(struct wiphy *wiphy, struct net_device *dev,
- 	return wilc_add_beacon(vif, 0, 0, beacon);
- }
- 
--static int stop_ap(struct wiphy *wiphy, struct net_device *dev)
-+static int stop_ap(struct wiphy *wiphy, struct net_device *dev
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,19,0))
-+		   , unsigned int link_id
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
-+		   , int link_id
-+#endif
-+		  )
- {
- 	int ret;
- 	struct wilc_vif *vif = netdev_priv(dev);
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch b/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
deleted file mode 100644
index faee805b5a..0000000000
--- a/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
+++ /dev/null
@@ -1,216 +0,0 @@
-From 5f022c4d3be32493d500be82f51032ef4fb3cdc0 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Dec 2022 21:08:45 +0100
-Subject: [PATCH] Fix struct station_parameters Linux 6.1 build failure
-
-Starting from Linux 6.1 struct station_parameters has changed by moving
-some member to its child struct link_station_parameters. Let's extract the
-values of the needed members into local values at the beginning of
-functions and substitute the member access with the local variables.
-
-[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 48 ++++++++++++++++++++++++++++++++----------------
- hif.c      | 44 ++++++++++++++++++++++++++++++++------------
- 2 files changed, 64 insertions(+), 28 deletions(-)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 57c777d..bdd480c 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -1866,6 +1866,14 @@ static int add_station(struct wiphy *wiphy, struct net_device *dev,
- 	struct wilc_vif *vif = netdev_priv(dev);
- 	struct wilc_priv *priv = &vif->priv;
- 	u8 *assoc_bss = priv->assoc_stainfo.sta_associated_bss[params->aid];
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	struct link_station_parameters *link_sta_params = &params->link_sta_params;
-+	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
-+	u8 supported_rates_len = link_sta_params->supported_rates_len;
-+#else
-+	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
-+	u8 supported_rates_len = params->supported_rates_len;
-+#endif
- 
- 	if (vif->iftype == WILC_AP_MODE || vif->iftype == WILC_GO_MODE) {
- 		memcpy(assoc_bss, mac, ETH_ALEN);
-@@ -1879,27 +1887,27 @@ static int add_station(struct wiphy *wiphy, struct net_device *dev,
- 			   params->aid);
- 		PRINT_INFO(vif->ndev, HOSTAPD_DBG,
- 			   "Number of supported rates = %d\n",
--			   params->supported_rates_len);
-+			   supported_rates_len);
- 
- 		PRINT_INFO(vif->ndev, CFG80211_DBG, "IS HT supported = %d\n",
--			   (!params->ht_capa) ? false : true);
-+			   (!ht_capa) ? false : true);
- 
--		if (params->ht_capa) {
-+		if (ht_capa) {
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Capability Info = %d\n",
--				   params->ht_capa->cap_info);
-+				   ht_capa->cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "AMPDU Params = %d\n",
--				   params->ht_capa->ampdu_params_info);
-+				   ht_capa->ampdu_params_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "HT Extended params= %d\n",
--				   params->ht_capa->extended_ht_cap_info);
-+				   ht_capa->extended_ht_cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Tx Beamforming Cap= %d\n",
--				   params->ht_capa->tx_BF_cap_info);
-+				   ht_capa->tx_BF_cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Antenna selection info = %d\n",
--				   params->ht_capa->antenna_selection_info);
-+				   ht_capa->antenna_selection_info);
- 		}
- 
- 		PRINT_INFO(vif->ndev, CFG80211_DBG, "Flag Mask = %d\n",
-@@ -1966,6 +1974,14 @@ static int change_station(struct wiphy *wiphy, struct net_device *dev,
- {
- 	int ret = 0;
- 	struct wilc_vif *vif = netdev_priv(dev);
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	struct link_station_parameters *link_sta_params = &params->link_sta_params;
-+	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
-+	u8 supported_rates_len = link_sta_params->supported_rates_len;
-+#else
-+	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
-+	u8 supported_rates_len = params->supported_rates_len;
-+#endif
- 
- 	PRINT_D(vif->ndev, CFG80211_DBG, "Change station parameters\n");
- 
-@@ -1976,25 +1992,25 @@ static int change_station(struct wiphy *wiphy, struct net_device *dev,
- 			   params->aid);
- 		PRINT_INFO(vif->ndev, CFG80211_DBG,
- 			   "Number of supported rates = %d\n",
--			   params->supported_rates_len);
-+			   supported_rates_len);
- 		PRINT_INFO(vif->ndev, CFG80211_DBG, "IS HT supported = %d\n",
--			   (!params->ht_capa) ? false : true);
--		if (params->ht_capa) {
-+			   (!ht_capa) ? false : true);
-+		if (ht_capa) {
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Capability Info = %d\n",
--				   params->ht_capa->cap_info);
-+				   ht_capa->cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "AMPDU Params = %d\n",
--				   params->ht_capa->ampdu_params_info);
-+				   ht_capa->ampdu_params_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "HT Extended params= %d\n",
--				   params->ht_capa->extended_ht_cap_info);
-+				   ht_capa->extended_ht_cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Tx Beamforming Cap= %d\n",
--				   params->ht_capa->tx_BF_cap_info);
-+				   ht_capa->tx_BF_cap_info);
- 			PRINT_INFO(vif->ndev, CFG80211_DBG,
- 				   "Antenna selection info = %d\n",
--				   params->ht_capa->antenna_selection_info);
-+				   ht_capa->antenna_selection_info);
- 		}
- 		PRINT_INFO(vif->ndev, CFG80211_DBG, "Flag Mask = %d\n",
- 			   params->sta_flags_mask);
-diff --git a/hif.c b/hif.c
-index 3f672a0..1a7365b 100644
---- a/hif.c
-+++ b/hif.c
-@@ -2249,6 +2249,16 @@ int wilc_add_station(struct wilc_vif *vif, const u8 *mac,
- 	int result;
- 	struct host_if_msg *msg;
- 	struct add_sta_param *sta_params;
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	struct link_station_parameters *link_sta_params = &params->link_sta_params;
-+	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
-+	u8 supported_rates_len = link_sta_params->supported_rates_len;
-+	const u8 *supported_rates = link_sta_params->supported_rates;
-+#else
-+	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
-+	u8 supported_rates_len = params->supported_rates_len;
-+	const u8 *supported_rates = params->supported_rates;
-+#endif
- 
- 	PRINT_INFO(vif->ndev, HOSTINF_DBG,
- 		   "Setting adding station message queue params\n");
-@@ -2260,20 +2270,20 @@ int wilc_add_station(struct wilc_vif *vif, const u8 *mac,
- 	sta_params = &msg->body.add_sta_info;
- 	memcpy(sta_params->bssid, mac, ETH_ALEN);
- 	sta_params->aid = params->aid;
--	if (!params->ht_capa) {
-+	if (!ht_capa) {
- 		sta_params->ht_supported = false;
- 	} else {
- 		sta_params->ht_supported = true;
--		memcpy(&sta_params->ht_capa, params->ht_capa,
-+		memcpy(&sta_params->ht_capa, ht_capa,
- 		       sizeof(struct ieee80211_ht_cap));
- 	}
- 	sta_params->flags_mask = params->sta_flags_mask;
- 	sta_params->flags_set = params->sta_flags_set;
- 
--	sta_params->supported_rates_len = params->supported_rates_len;
--	if (params->supported_rates_len > 0) {
--		sta_params->supported_rates = kmemdup(params->supported_rates,
--					    params->supported_rates_len,
-+	sta_params->supported_rates_len = supported_rates_len;
-+	if (supported_rates_len > 0) {
-+		sta_params->supported_rates = kmemdup(supported_rates,
-+					    supported_rates_len,
- 					    GFP_KERNEL);
- 		if (!sta_params->supported_rates) {
- 			kfree(msg);
-@@ -2397,6 +2407,16 @@ int wilc_edit_station(struct wilc_vif *vif, const u8 *mac,
- 	int result;
- 	struct host_if_msg *msg;
- 	struct add_sta_param *sta_params;
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
-+	struct link_station_parameters *link_sta_params = &params->link_sta_params;
-+	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
-+	u8 supported_rates_len = link_sta_params->supported_rates_len;
-+	const u8 *supported_rates = link_sta_params->supported_rates;
-+#else
-+	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
-+	u8 supported_rates_len = params->supported_rates_len;
-+	const u8 *supported_rates = params->supported_rates;
-+#endif
- 
- 	PRINT_INFO(vif->ndev, HOSTINF_DBG,
- 		   "Setting editing station message queue params\n");
-@@ -2408,20 +2428,20 @@ int wilc_edit_station(struct wilc_vif *vif, const u8 *mac,
- 	sta_params = &msg->body.edit_sta_info;
- 	memcpy(sta_params->bssid, mac, ETH_ALEN);
- 	sta_params->aid = params->aid;
--	if (!params->ht_capa) {
-+	if (!ht_capa) {
- 		sta_params->ht_supported = false;
- 	} else {
- 		sta_params->ht_supported = true;
--		memcpy(&sta_params->ht_capa, params->ht_capa,
-+		memcpy(&sta_params->ht_capa, ht_capa,
- 		       sizeof(struct ieee80211_ht_cap));
- 	}
- 	sta_params->flags_mask = params->sta_flags_mask;
- 	sta_params->flags_set = params->sta_flags_set;
- 
--	sta_params->supported_rates_len = params->supported_rates_len;
--	if (params->supported_rates_len > 0) {
--		sta_params->supported_rates = kmemdup(params->supported_rates,
--					    params->supported_rates_len,
-+	sta_params->supported_rates_len = supported_rates_len;
-+	if (supported_rates_len > 0) {
-+		sta_params->supported_rates = kmemdup(supported_rates,
-+					    supported_rates_len,
- 					    GFP_KERNEL);
- 		if (!sta_params->supported_rates) {
- 			kfree(msg);
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0005-Fix-cast-warnings.patch b/package/wilc-driver/0005-Fix-cast-warnings.patch
deleted file mode 100644
index 713a15e667..0000000000
--- a/package/wilc-driver/0005-Fix-cast-warnings.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ebd083223883d479b2dd6f8a0da272797f90d236 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sat, 31 Dec 2022 18:38:33 +0100
-Subject: [PATCH] Fix cast warnings
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 2 +-
- netdev.c   | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 016aa06..2f40c9d 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -1794,7 +1794,7 @@ static int start_ap(struct wiphy *wiphy, struct net_device *dev,
- 	if (ret != 0)
- 		netdev_err(dev, "Error in setting channel\n");
- 
--	wilc_wlan_set_bssid(dev, dev->dev_addr, WILC_AP_MODE);
-+	wilc_wlan_set_bssid(dev, (u8 *)dev->dev_addr, WILC_AP_MODE);
- 
- 	return wilc_add_beacon(vif, settings->beacon_interval,
- 				   settings->dtim_period, &settings->beacon);
-diff --git a/netdev.c b/netdev.c
-index 824afea..5a1a51d 100644
---- a/netdev.c
-+++ b/netdev.c
-@@ -899,9 +899,9 @@ static int wilc_mac_open(struct net_device *ndev)
- 				vif->idx);
- 
- 	if (is_valid_ether_addr(ndev->dev_addr))
--		wilc_set_mac_address(vif, ndev->dev_addr);
-+		wilc_set_mac_address(vif, (u8 *)ndev->dev_addr);
- 	else
--		wilc_get_mac_address(vif, ndev->dev_addr);
-+		wilc_get_mac_address(vif, (u8 *)ndev->dev_addr);
- 	netdev_dbg(ndev, "Mac address: %pM\n", ndev->dev_addr);
- 
- 	if (!is_valid_ether_addr(ndev->dev_addr)) {
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0006-Support-Linux-6.3.patch b/package/wilc-driver/0006-Support-Linux-6.3.patch
deleted file mode 100644
index f5a92027da..0000000000
--- a/package/wilc-driver/0006-Support-Linux-6.3.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 14b5eccf4145e7a5afc8bc65a15f26ac691f98d8 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 27 Sep 2023 10:54:18 +0200
-Subject: [PATCH] Support Linux 6.3
-
-With Linux 6.3 commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40fc56ee608cdb20022c225ac6f1e4b7ba63f8f1
-function of_get_named_gpio_flags() has been dropped but it was only a
-wrapper to call of_get_named_gpio() if the flags passed was NULL and this
-is the case. So let's use of_get_named_gpio() in place of
-of_get_named_gpio_flags() since of_get_named_gpio() never changed
-after its adding in Linux version 3.1.
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/4
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- power.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/power.c b/power.c
-index 6c59e0b..6ab8d63 100644
---- a/power.c
-+++ b/power.c
-@@ -25,13 +25,11 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
- 	const struct wilc_power_gpios *gpios = &default_gpios[0];
- 	int ret;
- 
--	power->gpios.reset = of_get_named_gpio_flags(of, "reset-gpios", 0,
--						     NULL);
-+	power->gpios.reset = of_get_named_gpio(of, "reset-gpios", 0);
- 	if (!gpio_is_valid(power->gpios.reset))
- 		power->gpios.reset = gpios->reset;
- 
--	power->gpios.chip_en = of_get_named_gpio_flags(of, "chip_en-gpios", 0,
--						       NULL);
-+	power->gpios.chip_en = of_get_named_gpio(of, "chip_en-gpios", 0);
- 	if (!gpio_is_valid(power->gpios.chip_en))
- 		power->gpios.chip_en = gpios->chip_en;
- 
--- 
-2.34.1
-
diff --git a/package/wilc-driver/0007-Support-Linux-6.4.patch b/package/wilc-driver/0007-Support-Linux-6.4.patch
deleted file mode 100644
index 8339cc3cb6..0000000000
--- a/package/wilc-driver/0007-Support-Linux-6.4.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 94fc4594659494b8c5cbdf1a719aea4d66d3398d Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 27 Sep 2023 11:20:50 +0200
-Subject: [PATCH] Support Linux 6.4
-
-With Linux 6.4 commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1aaba11da9aa7d7d6b52a74d45b31cac118295a1
-class_create() doesn't require first argument THIS_MODULE anymore so let's
-drop first argument if Linux version >= 6.4
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/5
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bt.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/bt.c b/bt.c
-index 48a5302..a752457 100644
---- a/bt.c
-+++ b/bt.c
-@@ -135,7 +135,11 @@ static void wilc_bt_create_device(void)
- 	ret = alloc_chrdev_region(&chc_dev_no, 0, 1, "atmel");
- 	if (ret < 0)
- 		return;
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 4, 0)
-+	chc_dev_class = class_create("atmel");
-+#else
- 	chc_dev_class = class_create(THIS_MODULE, "atmel");
-+#endif
- 	if (IS_ERR(chc_dev_class)) {
- 		unregister_chrdev_region(chc_dev_no, 1);
- 		return;
--- 
-2.34.1
-
diff --git a/package/wilc-driver/wilc-driver.hash b/package/wilc-driver/wilc-driver.hash
index 4ada813ed8..43e004068c 100644
--- a/package/wilc-driver/wilc-driver.hash
+++ b/package/wilc-driver/wilc-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4796b1a53781f8702a335b0146d488a9422b71dab39f6f154f955b0ad1711199  wilc-driver-linux4microchip-2021.10-1.tar.gz
+sha256  66e9d889a5dbfad91c74f52df497d9ef9e353559231e4bc251136422bfc0cc00  wilc-driver-linux4microchip-2024.04.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSE
diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
index a7a902b6db..7879b88c58 100644
--- a/package/wilc-driver/wilc-driver.mk
+++ b/package/wilc-driver/wilc-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WILC_DRIVER_VERSION = linux4microchip-2021.10-1
+WILC_DRIVER_VERSION = linux4microchip-2024.04
 WILC_DRIVER_SITE = $(call github,embeddedTS,wilc3000-external-module,$(WILC_DRIVER_VERSION))
 
 WILC_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
