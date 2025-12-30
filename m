Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE91EE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E93F4068D;
	Tue, 30 Dec 2025 17:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpWyDdGgW7dK; Tue, 30 Dec 2025 17:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF7F4064F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767117515;
	bh=AxdA1QS53BaAjO/VVzKy2Fb8PYFC+AhNPhGAzF8tGMg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QctsKi4vcNQMCBfnWVulFPstX23DsLoffeROcK/WN/zTW7UQrNJF2WIJloTQSJi1b
	 1KbrcbVjIhD6SRgOCbTtSicfMqstOg8RbFY7ltqMpnZK0Kr7uUi+0RE43Wk0qHDPK9
	 q1fsvGLIc1szpNQaFckE96CZgZuRiOtKVRXzDXuvrK5Qgr2YGNDbFBy1idHGiwLgq8
	 +6F+PRDxLzZ04VDh/zzJPmtg6MdIif8Z+LeG7ojaDNK9vvMRGndL68M/ggL2ysGN7U
	 yUz0+ixiD3ZA7HZR/n3MmpPnzO8GyFYTBPQw0vSM9hFr0lB6hmazKUCYLh9flZ5mtP
	 MM35yIp6JGb1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABF7F4064F;
	Tue, 30 Dec 2025 17:58:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B87A277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1342A4005C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKkimzvAaP4G for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C0814008D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C0814008D
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C0814008D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:29 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id adzGvUWYSP2aDadzGvOnAF; Tue, 30 Dec 2025 18:58:26 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Date: Tue, 30 Dec 2025 18:58:25 +0100
Message-ID: <20251230175825.2532768-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLIJeGO3UiXeLrics/71BQYtUFxiD2RjkRjwF0bhcWz/beXYaSu4LzFmVPIS5LTJgiiUAzKfD1KEcEueBQKeUj+moUiIlX6k2pbQTjzeJjeXW55GL5fP
 09g6tZR3YZVekF0DKP8DTmqxqVGfe/KGbfgTaiGtmNoejb9eBkIqXu7f8BH7LCxYLUP4ejDGp0uYUpCQ+bgnrn7b4DB1h/eQS97FF113YH88nvjU99CKhFoJ
 y5CHhPo7yyg494d+NPMKzmFpOylGlZX01T8XYOJ8SLdI09FsRmjPx7863bfA6/eZJ1qaqTGWwEvgRlijEBQIKQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767117506; bh=mPKu92Y5ntTeHy6s68Ilv4Y41lSDxjFuQDwC0QZUcfM=;
 h=From:To:Subject:Date:MIME-Version;
 b=iT2VmocjL1jMAvRMbLjnWOowDBv7c4bM2B838lziCfj6DNUhxkTxDY45mpVoTPkxv
 hwDa8VWj11263ADu5XXnjTEOKcbFw2r+Ipw8DY2qpNA8JAvJpgwXfdZzpRWTRNWKaH
 0MkEN37aLIhIu6Z3xp53CSLJkysVCuwZMa6WNlFk20eW0XDqfSU3GnrHW1ePZoSp3z
 1X3CbfOAv0SIR0WXCHI29oPqjb1L5SkEWaX2QJ9+g49zefqUfvPdFLigLkevDq8679
 J3sHP4O8x4J566IBDPrNO5XNx9UMkZl544ujKcyFDY+/ebOQCQN6lo4nhYQw1UBABU
 Hmu4eseyCCQ/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iT2Vmocj
Subject: [Buildroot] [PATCH] package/wilc-driver: redirect URL to github
 benetti-engineering
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop all local patches that are committed to github benetti-engineering
repositories.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...missing-prandom_u32-with-Linux-6.1.0.patch |  34 ---
 ...fix-build-failure-on-remove-callback.patch |  44 ----
 ...uild-failure-with-Linux-5.19-and-6.1.patch |  98 --------
 ...on_parameters-Linux-6.1-build-failur.patch | 216 ------------------
 .../wilc-driver/0005-Fix-cast-warnings.patch  |  43 ----
 .../wilc-driver/0006-Support-Linux-6.3.patch  |  43 ----
 .../wilc-driver/0007-Support-Linux-6.4.patch  |  36 ---
 .../0008-Fix-build-with-Linux-6.7.patch       |  46 ----
 .../0009-Fix-build-with-Linux-6.8.patch       |  34 ---
 .../0010-Fix-build-with-Linux-6.10.patch      |  55 -----
 ...cfg80211.c-fix-build-with-Linux-6.13.patch |  28 ---
 .../0012-Fix-build-with-Linux-6.14.patch      |  33 ---
 .../0013-Fix-build-with-Linux-6.15.patch      | 177 --------------
 .../0014-Fix-build-for-kernel-6.16.patch      |  34 ---
 .../0015-Fix-build-for-kernel-6.17.patch      | 109 ---------
 package/wilc-driver/wilc-driver.mk            |   4 +-
 16 files changed, 2 insertions(+), 1032 deletions(-)
 delete mode 100644 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
 delete mode 100644 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
 delete mode 100644 package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
 delete mode 100644 package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
 delete mode 100644 package/wilc-driver/0005-Fix-cast-warnings.patch
 delete mode 100644 package/wilc-driver/0006-Support-Linux-6.3.patch
 delete mode 100644 package/wilc-driver/0007-Support-Linux-6.4.patch
 delete mode 100644 package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
 delete mode 100644 package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
 delete mode 100644 package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch
 delete mode 100644 package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch
 delete mode 100644 package/wilc-driver/0012-Fix-build-with-Linux-6.14.patch
 delete mode 100644 package/wilc-driver/0013-Fix-build-with-Linux-6.15.patch
 delete mode 100644 package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
 delete mode 100644 package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch

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
diff --git a/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch b/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
deleted file mode 100644
index 9714a828eb..0000000000
--- a/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c2024eb93f6d7ec605226d5d8a29ea17fbc71b5d Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 17 Apr 2025 19:06:48 +0200
-Subject: [PATCH] Fix build with Linux 6.7
-
-During commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bb55441c57ccc5cc2eab44e1a97698b9d708871d
-struct cfg80211_ap_settings has been split into multiple structs including
-beacon. So is Linux version is 6.7+ let's use &info->beacon in place of
-beacon.
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 5c92062..25da3a1 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -1822,13 +1822,21 @@ static int start_ap(struct wiphy *wiphy, struct net_device *dev,
- }
- 
- static int change_beacon(struct wiphy *wiphy, struct net_device *dev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,7,0))
-+			 struct cfg80211_ap_update *info)
-+#else
- 			 struct cfg80211_beacon_data *beacon)
-+#endif
- {
- 	struct wilc_vif *vif = netdev_priv(dev);
- 
- 	PRINT_INFO(vif->ndev, HOSTAPD_DBG, "Setting beacon\n");
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,7,0))
-+	return wilc_add_beacon(vif, 0, 0, &info->beacon);
-+#else
- 	return wilc_add_beacon(vif, 0, 0, beacon);
-+#endif
- }
- 
- static int stop_ap(struct wiphy *wiphy, struct net_device *dev
--- 
-2.39.5
-
diff --git a/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch b/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
deleted file mode 100644
index 2bafd53a9a..0000000000
--- a/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 90e679f1b7caad02e68fa8672be6569eb1b2b76f Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 17 Apr 2025 18:56:55 +0200
-Subject: [PATCH] Fix build with Linux 6.8
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d26270061ae66b915138af7cd73ca6f8b85e6b44
-strlcpy() has been superseded in favor of strscpy() so let's #define
-strlcpy as strscpy if Linux version 6.8+
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- mon.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/mon.c b/mon.c
-index 2c9c2d9..20b7e20 100644
---- a/mon.c
-+++ b/mon.c
-@@ -6,6 +6,10 @@
- 
- #include "cfg80211.h"
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
-+#define strlcpy strscpy
-+#endif
-+
- struct wilc_wfi_radiotap_hdr {
- 	struct ieee80211_radiotap_header hdr;
- 	u8 rate;
--- 
-2.39.5
-
diff --git a/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch b/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch
deleted file mode 100644
index 08444b06e2..0000000000
--- a/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 684eb3e40c88ee7a2cd4417a12b9b27a35e86655 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 17 Apr 2025 18:41:07 +0200
-Subject: [PATCH] Fix build with Linux 6.10
-
-During commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9b163e0d330debbf7dcc14b2c3e2dc19a3b50a1d
-is_dma_mapped member has been dropped since it was not used anymore. The
-DMA mapping is done directly in single spi drivers in case it's supported
-so having is_dma_mapped set to 1 lead to code breakage. So we can consider
-it always as 0 and basically guard it if Linux version is 6.10+
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- spi.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/spi.c b/spi.c
-index f7b43e2..be616f4 100644
---- a/spi.c
-+++ b/spi.c
-@@ -338,7 +338,9 @@ static int wilc_spi_tx(struct wilc *wilc, u8 *b, u32 len)
- 		memset(&msg, 0, sizeof(msg));
- 		spi_message_init(&msg);
- 		msg.spi = spi;
-+#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
- 		msg.is_dma_mapped = USE_SPI_DMA;
-+#endif
- 		spi_message_add_tail(&tr, &msg);
- 
- 		ret = spi_sync(spi, &msg);
-@@ -385,7 +387,9 @@ static int wilc_spi_rx(struct wilc *wilc, u8 *rb, u32 rlen)
- 		memset(&msg, 0, sizeof(msg));
- 		spi_message_init(&msg);
- 		msg.spi = spi;
-+#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
- 		msg.is_dma_mapped = USE_SPI_DMA;
-+#endif
- 		spi_message_add_tail(&tr, &msg);
- 
- 		ret = spi_sync(spi, &msg);
-@@ -427,7 +431,9 @@ static int wilc_spi_tx_rx(struct wilc *wilc, u8 *wb, u8 *rb, u32 rlen)
- 		memset(&msg, 0, sizeof(msg));
- 		spi_message_init(&msg);
- 		msg.spi = spi;
-+#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
- 		msg.is_dma_mapped = USE_SPI_DMA;
-+#endif
- 
- 		spi_message_add_tail(&tr, &msg);
- 		ret = spi_sync(spi, &msg);
--- 
-2.39.5
-
diff --git a/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch b/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch
deleted file mode 100644
index 6d26b20a5c..0000000000
--- a/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 446911a48cd1a2c740b43a32d0ffa6e3f1887e84 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sat, 26 Apr 2025 00:40:43 +0200
-Subject: [PATCH] cfg80211.c: fix build with Linux 6.13
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 25da3a1..d0cd826 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -291,6 +291,9 @@ struct wilc_vif *wilc_get_wl_to_vif(struct wilc *wl)
- }
- 
- static int set_channel(struct wiphy *wiphy,
-+#if KERNEL_VERSION(6, 13, 0) <= LINUX_VERSION_CODE
-+		       struct net_device *netdev,
-+#endif
- 		       struct cfg80211_chan_def *chandef)
- {
- 	struct wilc *wl = wiphy_priv(wiphy);
--- 
-2.39.5
-
diff --git a/package/wilc-driver/0012-Fix-build-with-Linux-6.14.patch b/package/wilc-driver/0012-Fix-build-with-Linux-6.14.patch
deleted file mode 100644
index adcbab4a59..0000000000
--- a/package/wilc-driver/0012-Fix-build-with-Linux-6.14.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ea7bdf9c6f37dbed0d7e7a94bd5d6ec20593eb02 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 1 Jul 2025 19:25:19 +0200
-Subject: [PATCH] Fix build with Linux 6.14
-
-Commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
-adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
-cfg80211_rtw_get_txpower() according to Linux version.
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/9
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 5c92062..0e1375c 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -2230,6 +2230,9 @@ static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
- }
- 
- static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
-+			unsigned int link_id,
-+#endif
- 			int *dbm)
- {
- 	int ret;
--- 
-2.39.5
-
diff --git a/package/wilc-driver/0013-Fix-build-with-Linux-6.15.patch b/package/wilc-driver/0013-Fix-build-with-Linux-6.15.patch
deleted file mode 100644
index 2baac53dfc..0000000000
--- a/package/wilc-driver/0013-Fix-build-with-Linux-6.15.patch
+++ /dev/null
@@ -1,177 +0,0 @@
-From acdbd9268841a5c0bac477418bb39707d9602957 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 1 Jul 2025 19:27:01 +0200
-Subject: [PATCH] Fix build with Linux 6.15
-
-Commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8fa7292fee5c5240402371ea89ab285ec856c916
-drops del_timer_sync() in favor of timer_delete{_sync}() so let's backport
-locally functions del_timer{_sync}() when Linux version is 6.15.0 or later.
-Let's also backport crc7_be() and crc_itu_t() sinsce are not selectable
-anymore in kernel since commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f5a40fcf82c1d3f26910ebe1c62fec8ae3b85f02
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/9
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- netdev.h |  13 +++++++
- spi.c    | 115 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 128 insertions(+)
-
-diff --git a/netdev.h b/netdev.h
-index f06d45a..607a3b5 100644
---- a/netdev.h
-+++ b/netdev.h
-@@ -13,6 +13,19 @@
- #include <net/ieee80211_radiotap.h>
- #include <linux/if_arp.h>
- #include <linux/gpio/consumer.h>
-+#include <linux/version.h>
-+
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
-+static inline int del_timer_sync(struct timer_list *timer)
-+{
-+	return timer_delete_sync(timer);
-+}
-+
-+static inline int del_timer(struct timer_list *timer)
-+{
-+	return timer_delete(timer);
-+}
-+#endif
- 
- #include "hif.h"
- #include "wlan.h"
-diff --git a/spi.c b/spi.c
-index f7b43e2..5443633 100644
---- a/spi.c
-+++ b/spi.c
-@@ -9,10 +9,125 @@
- #include <linux/module.h>
- #include <linux/crc7.h>
- #include <linux/crc-itu-t.h>
-+#include <linux/version.h>
- 
- #include "netdev.h"
- #include "cfg80211.h"
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
-+/*
-+ * Table for CRC-7 (polynomial x^7 + x^3 + 1).
-+ * This is a big-endian CRC (msbit is highest power of x),
-+ * aligned so the msbit of the byte is the x^6 coefficient
-+ * and the lsbit is not used.
-+ */
-+static const u8 crc7_be_syndrome_table[256] = {
-+    0x00, 0x12, 0x24, 0x36, 0x48, 0x5a, 0x6c, 0x7e,
-+    0x90, 0x82, 0xb4, 0xa6, 0xd8, 0xca, 0xfc, 0xee,
-+    0x32, 0x20, 0x16, 0x04, 0x7a, 0x68, 0x5e, 0x4c,
-+    0xa2, 0xb0, 0x86, 0x94, 0xea, 0xf8, 0xce, 0xdc,
-+    0x64, 0x76, 0x40, 0x52, 0x2c, 0x3e, 0x08, 0x1a,
-+    0xf4, 0xe6, 0xd0, 0xc2, 0xbc, 0xae, 0x98, 0x8a,
-+    0x56, 0x44, 0x72, 0x60, 0x1e, 0x0c, 0x3a, 0x28,
-+    0xc6, 0xd4, 0xe2, 0xf0, 0x8e, 0x9c, 0xaa, 0xb8,
-+    0xc8, 0xda, 0xec, 0xfe, 0x80, 0x92, 0xa4, 0xb6,
-+    0x58, 0x4a, 0x7c, 0x6e, 0x10, 0x02, 0x34, 0x26,
-+    0xfa, 0xe8, 0xde, 0xcc, 0xb2, 0xa0, 0x96, 0x84,
-+    0x6a, 0x78, 0x4e, 0x5c, 0x22, 0x30, 0x06, 0x14,
-+    0xac, 0xbe, 0x88, 0x9a, 0xe4, 0xf6, 0xc0, 0xd2,
-+    0x3c, 0x2e, 0x18, 0x0a, 0x74, 0x66, 0x50, 0x42,
-+    0x9e, 0x8c, 0xba, 0xa8, 0xd6, 0xc4, 0xf2, 0xe0,
-+    0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62, 0x70,
-+    0x82, 0x90, 0xa6, 0xb4, 0xca, 0xd8, 0xee, 0xfc,
-+    0x12, 0x00, 0x36, 0x24, 0x5a, 0x48, 0x7e, 0x6c,
-+    0xb0, 0xa2, 0x94, 0x86, 0xf8, 0xea, 0xdc, 0xce,
-+    0x20, 0x32, 0x04, 0x16, 0x68, 0x7a, 0x4c, 0x5e,
-+    0xe6, 0xf4, 0xc2, 0xd0, 0xae, 0xbc, 0x8a, 0x98,
-+    0x76, 0x64, 0x52, 0x40, 0x3e, 0x2c, 0x1a, 0x08,
-+    0xd4, 0xc6, 0xf0, 0xe2, 0x9c, 0x8e, 0xb8, 0xaa,
-+    0x44, 0x56, 0x60, 0x72, 0x0c, 0x1e, 0x28, 0x3a,
-+    0x4a, 0x58, 0x6e, 0x7c, 0x02, 0x10, 0x26, 0x34,
-+    0xda, 0xc8, 0xfe, 0xec, 0x92, 0x80, 0xb6, 0xa4,
-+    0x78, 0x6a, 0x5c, 0x4e, 0x30, 0x22, 0x14, 0x06,
-+    0xe8, 0xfa, 0xcc, 0xde, 0xa0, 0xb2, 0x84, 0x96,
-+    0x2e, 0x3c, 0x0a, 0x18, 0x66, 0x74, 0x42, 0x50,
-+    0xbe, 0xac, 0x9a, 0x88, 0xf6, 0xe4, 0xd2, 0xc0,
-+    0x1c, 0x0e, 0x38, 0x2a, 0x54, 0x46, 0x70, 0x62,
-+    0x8c, 0x9e, 0xa8, 0xba, 0xc4, 0xd6, 0xe0, 0xf2
-+};
-+
-+/**
-+ * crc7_be - update the CRC7 for the data buffer
-+ * @crc:     previous CRC7 value
-+ * @buffer:  data pointer
-+ * @len:     number of bytes in the buffer
-+ * Context: any
-+ *
-+ * Returns the updated CRC7 value.
-+ * The CRC7 is left-aligned in the byte (the lsbit is always 0), as that
-+ * makes the computation easier, and all callers want it in that form.
-+ *
-+ */
-+u8 crc7_be(u8 crc, const u8 *buffer, size_t len)
-+{
-+    while (len--)
-+	crc = crc7_be_syndrome_table[crc ^ *buffer++];
-+    return crc;
-+}
-+
-+/* CRC table for the CRC ITU-T V.41 0x1021 (x^16 + x^12 + x^5 + 1) */
-+const u16 crc_itu_t_table[256] = {
-+    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
-+    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
-+    0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
-+    0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
-+    0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
-+    0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
-+    0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
-+    0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
-+    0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
-+    0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
-+    0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
-+    0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
-+    0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
-+    0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
-+    0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
-+    0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
-+    0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
-+    0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
-+    0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
-+    0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
-+    0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
-+    0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
-+    0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
-+    0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
-+    0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
-+    0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
-+    0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
-+    0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
-+    0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
-+    0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
-+    0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
-+    0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0
-+};
-+
-+/**
-+ * crc_itu_t - Compute the CRC-ITU-T for the data buffer
-+ *
-+ * @crc:     previous CRC value
-+ * @buffer:  data pointer
-+ * @len:     number of bytes in the buffer
-+ *
-+ * Returns the updated CRC value
-+ */
-+u16 crc_itu_t(u16 crc, const u8 *buffer, size_t len)
-+{
-+    while (len--)
-+	crc = crc_itu_t_byte(crc, *buffer++);
-+    return crc;
-+}
-+#endif
-+
- static bool enable_crc7;	/* protect SPI commands with CRC7 */
- module_param(enable_crc7, bool, 0644);
- MODULE_PARM_DESC(enable_crc7,
--- 
-2.39.5
-
diff --git a/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch b/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
deleted file mode 100644
index bf4a8106af..0000000000
--- a/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8ee37436cfa1bdac354ff63e17b647e7b5fb20f9 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 8 Sep 2025 21:14:22 +0200
-Subject: [PATCH] Fix build for kernel 6.16
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
-from_timer() has been renamed to timer_container_of() so let's rename
-according to linux version >= 6.16.
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/10
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- netdev.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/netdev.h b/netdev.h
-index 607a3b5..33708ad 100644
---- a/netdev.h
-+++ b/netdev.h
-@@ -15,6 +15,10 @@
- #include <linux/gpio/consumer.h>
- #include <linux/version.h>
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0))
-+#define from_timer	timer_container_of
-+#endif
-+
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
- static inline int del_timer_sync(struct timer_list *timer)
- {
--- 
-2.43.0
-
diff --git a/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch b/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch
deleted file mode 100644
index 4d5934bdd4..0000000000
--- a/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 00895566e07808a0c61d45464797d7cba2eb256c Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Fri, 10 Oct 2025 21:58:14 +0200
-Subject: [PATCH] Fix build for kernel 6.17
-
-* With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
-set_wiphy_params(), set/get_tx_power() and set_antenna() gain argument
-radio_idx to get radio index. So let's add that argument according to
-linux version >= 6.17.
-* With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a5589313383074c48a1b3751d592a6e084ae0573
-devm_gpio_request() is dropped in favor of devm_gpio_request_one().
-devm_gpio_request_one() requires flags to setup gpio status, but it's
-not specified in wilc_of_parse_power_pins() so keep them as GPIOF_IN
-since they get defined in wilc_wlan_power() called very soon after
-wilc_of_parse_power_pins().
-
-Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/11
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- cfg80211.c | 15 +++++++++++++++
- power.c    | 12 +++++++++++-
- 2 files changed, 26 insertions(+), 1 deletion(-)
-
-diff --git a/cfg80211.c b/cfg80211.c
-index 0e1375c..a7db9e6 100644
---- a/cfg80211.c
-+++ b/cfg80211.c
-@@ -997,7 +997,11 @@ static int change_bss(struct wiphy *wiphy, struct net_device *dev,
- 	return 0;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+static int set_wiphy_params(struct wiphy *wiphy, int radio_idx, u32 changed)
-+#else
- static int set_wiphy_params(struct wiphy *wiphy, u32 changed)
-+#endif
- {
- 	int ret = -EINVAL;
- 	struct cfg_param_attr cfg_param_val;
-@@ -2198,6 +2202,9 @@ static void wilc_set_wakeup(struct wiphy *wiphy, bool enabled)
- }
- 
- static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+			int radio_idx,
-+#endif
- 			enum nl80211_tx_power_setting type, int mbm)
- {
- 	int ret;
-@@ -2230,6 +2237,9 @@ static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
- }
- 
- static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+	int radio_idx,
-+#endif
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
- 			unsigned int link_id,
- #endif
-@@ -2252,7 +2262,12 @@ static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
- 	return ret;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+static int set_antenna(struct wiphy *wiphy, int radio_idx, u32 tx_ant,
-+		       u32 rx_ant)
-+#else
- static int set_antenna(struct wiphy *wiphy, u32 tx_ant, u32 rx_ant)
-+#endif
- {
- 	int ret;
- 	struct wilc *wl = wiphy_priv(wiphy);
-diff --git a/power.c b/power.c
-index 6ab8d63..1cc391d 100644
---- a/power.c
-+++ b/power.c
-@@ -1,4 +1,4 @@
--#include <linux/delay.h>
-+#include <linux/delay.h>OA
- #include <linux/of.h>
- #include <linux/version.h>
- #include <linux/of_gpio.h>
-@@ -37,11 +37,21 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
- 			!gpio_is_valid(power->gpios.reset))
- 		return -EINVAL;
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+	ret = devm_gpio_request_one(wilc->dev, power->gpios.chip_en, GPIOF_IN,
-+				    "CHIP_EN");
-+#else
- 	ret = devm_gpio_request(wilc->dev, power->gpios.chip_en, "CHIP_EN");
-+#endif
- 	if (ret)
- 		return ret;
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+	ret = devm_gpio_request_one(wilc->dev, power->gpios.reset, GPIOF_IN,
-+				    "RESET");
-+#else 
- 	ret = devm_gpio_request(wilc->dev, power->gpios.reset, "RESET");
-+#endif
- 	return ret;
- }
- 
--- 
-2.47.3
-
diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
index a7a902b6db..e646388cb6 100644
--- a/package/wilc-driver/wilc-driver.mk
+++ b/package/wilc-driver/wilc-driver.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WILC_DRIVER_VERSION = linux4microchip-2021.10-1
-WILC_DRIVER_SITE = $(call github,embeddedTS,wilc3000-external-module,$(WILC_DRIVER_VERSION))
+WILC_DRIVER_VERSION = 2021.10-with-community-patches
+WILC_DRIVER_SITE = $(call github,benetti-engineering,wilc3000-external-module,$(WILC_DRIVER_VERSION))
 
 WILC_DRIVER_LICENSE = GPL-2.0
 WILC_DRIVER_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
