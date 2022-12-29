Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B46DC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 08:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6AAA40470;
	Thu, 29 Dec 2022 08:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6AAA40470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JnINrd9Nb2eH; Thu, 29 Dec 2022 08:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B52840480;
	Thu, 29 Dec 2022 08:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B52840480
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 223091BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08F8440201
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08F8440201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qo3uUYDkLnOB for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 08:55:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B92401F9
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52B92401F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C22986FAB; Thu, 29 Dec 2022 08:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 09:55:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b95334b71fbdde0f7621b58ed35fa98df9e0966d
X-Git-Newrev: 482d18a40d98dcc156437c9a01b869b510e93fc4
X-Patchwork-Hint: ignore
Message-Id: <20221229085553.3C22986FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: fix build failure up
 to Linux 6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=482d18a40d98dcc156437c9a01b869b510e93fc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patches pending upstream[0] to handle various data types and api
changes up to Linux 6.1.

[0]: https://github.com/embeddedTS/wilc3000-external-module/pull/2

Fixes:
http://autobuild.buildroot.net/results/6aa7475a21a6060e9fce3552f73e6e7100a8b2aa

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fix-missing-prandom_u32-with-Linux-6.1.0.patch |  34 ++++
 ...pi.c-fix-build-failure-on-remove-callback.patch |  44 +++++
 ...fix-build-failure-with-Linux-5.19-and-6.1.patch |  98 ++++++++++
 ...station_parameters-Linux-6.1-build-failur.patch | 216 +++++++++++++++++++++
 4 files changed, 392 insertions(+)

diff --git a/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch b/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
new file mode 100644
index 0000000000..2f10627301
--- /dev/null
+++ b/package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
@@ -0,0 +1,34 @@
+From f80e4343fa0a4d8b22933d1704c85a771fe234a4 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Dec 2022 19:56:46 +0100
+Subject: [PATCH] cfg80211.c: fix missing prandom_u32() with Linux >= 6.1.0
+
+prandom_u32() previously was only calling get_random_u32() so it's been
+dropped with Linux 6.1.0. So let's directly call get_random_u32() if Linux
+version >= 6.1.0.
+
+[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 016aa06..41edd02 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -1422,7 +1422,11 @@ static int mgmt_tx(struct wiphy *wiphy,
+ 	const u8 *vendor_ie;
+ 	int ret = 0;
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
++	*cookie = get_random_u32();
++#else
+ 	*cookie = prandom_u32();
++#endif
+ 	priv->tx_cookie = *cookie;
+ 	mgmt = (const struct ieee80211_mgmt *)buf;
+ 
+-- 
+2.34.1
+
diff --git a/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch b/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
new file mode 100644
index 0000000000..87306dfa12
--- /dev/null
+++ b/package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
@@ -0,0 +1,44 @@
+From a88819bd63f977b5a33d72a2b9e264ce104726bd Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Dec 2022 21:02:12 +0100
+Subject: [PATCH] spi.c: fix build failure on remove callback
+
+Starting from Linux 5.18 remove callback returns void, so let's deal with
+it depending on Linux version >= 5.18.
+
+[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ spi.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/spi.c b/spi.c
+index 96c51fe..f7b43e2 100644
+--- a/spi.c
++++ b/spi.c
+@@ -211,7 +211,11 @@ free:
+ 	return ret;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,18,0))
++static void wilc_bus_remove(struct spi_device *spi)
++#else
+ static int wilc_bus_remove(struct spi_device *spi)
++#endif
+ {
+ 	struct wilc *wilc = spi_get_drvdata(spi);
+ 
+@@ -220,7 +224,10 @@ static int wilc_bus_remove(struct spi_device *spi)
+ 
+ 	wilc_netdev_cleanup(wilc);
+ 	wilc_bt_deinit();
++
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,18,0))
+ 	return 0;
++#endif
+ }
+ 
+ static int wilc_spi_suspend(struct device *dev)
+-- 
+2.34.1
+
diff --git a/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch b/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
new file mode 100644
index 0000000000..785b8904b2
--- /dev/null
+++ b/package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
@@ -0,0 +1,98 @@
+From a608cdd7903505217529317c04b5b58cb7e25081 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Dec 2022 21:06:43 +0100
+Subject: [PATCH] cfg80211.c: fix build failure with Linux 5.19 and 6.1
+
+Starting from Linux 5.19 stop_ap() requires unsigned int link_id as
+parameter. Then from Linux 6.1 on lot of other cfg80211 APIs require
+int link_id to deal with MLO, so let's add that parameter too.
+
+[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 35 +++++++++++++++++++++++++++++------
+ 1 file changed, 29 insertions(+), 6 deletions(-)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 41edd02..57c777d 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -674,8 +674,12 @@ static int wilc_wfi_cfg_copy_wpa_info(struct wilc_wfi_key *key_info,
+ 	return 0;
+ }
+ 
+-static int add_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
+-		   bool pairwise, const u8 *mac_addr, struct key_params *params)
++static int add_key(struct wiphy *wiphy, struct net_device *netdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
++		   int link_id,
++#endif
++		   u8 key_index,  bool pairwise, const u8 *mac_addr,
++		   struct key_params *params)
+ 
+ {
+ 	int ret = 0, keylen = params->key_len, seqlen = params->seq_len;
+@@ -792,6 +796,9 @@ static int add_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
+ }
+ 
+ static int del_key(struct wiphy *wiphy, struct net_device *netdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
++		   int link_id,
++#endif
+ 		   u8 key_index,
+ 		   bool pairwise,
+ 		   const u8 *mac_addr)
+@@ -833,9 +840,13 @@ static int del_key(struct wiphy *wiphy, struct net_device *netdev,
+ 	return ret;
+ }
+ 
+-static int get_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
+-		   bool pairwise, const u8 *mac_addr, void *cookie,
+-		   void (*callback)(void *cookie, struct key_params *))
++static int get_key(struct wiphy *wiphy, struct net_device *netdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
++		   int link_id,
++#endif
++		   u8 key_index, bool pairwise, const u8 *mac_addr,
++		   void *cookie, void (*callback)(void *cookie,
++		   struct key_params *))
+ {
+ 	struct wilc_vif *vif = netdev_priv(netdev);
+ 	struct wilc_priv *priv = &vif->priv;
+@@ -877,12 +888,18 @@ static int get_key(struct wiphy *wiphy, struct net_device *netdev, u8 key_index,
+ 
+ /* wiphy_new() will WARN if not present*/
+ static int set_default_key(struct wiphy *wiphy, struct net_device *netdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
++			   int link_id,
++#endif
+ 			   u8 key_index, bool unicast, bool multicast)
+ {
+ 	return 0;
+ }
+ 
+ static int set_default_mgmt_key (struct wiphy *wiphy,struct net_device *netdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
++				 int link_id,
++#endif
+ 				 u8 key_index)
+ {
+     return 0;
+@@ -1814,7 +1831,13 @@ static int change_beacon(struct wiphy *wiphy, struct net_device *dev,
+ 	return wilc_add_beacon(vif, 0, 0, beacon);
+ }
+ 
+-static int stop_ap(struct wiphy *wiphy, struct net_device *dev)
++static int stop_ap(struct wiphy *wiphy, struct net_device *dev
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,19,0))
++		   , unsigned int link_id
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
++		   , int link_id
++#endif
++		  )
+ {
+ 	int ret;
+ 	struct wilc_vif *vif = netdev_priv(dev);
+-- 
+2.34.1
+
diff --git a/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch b/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
new file mode 100644
index 0000000000..faee805b5a
--- /dev/null
+++ b/package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
@@ -0,0 +1,216 @@
+From 5f022c4d3be32493d500be82f51032ef4fb3cdc0 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Dec 2022 21:08:45 +0100
+Subject: [PATCH] Fix struct station_parameters Linux 6.1 build failure
+
+Starting from Linux 6.1 struct station_parameters has changed by moving
+some member to its child struct link_station_parameters. Let's extract the
+values of the needed members into local values at the beginning of
+functions and substitute the member access with the local variables.
+
+[Upstream status: https://github.com/embeddedTS/wilc3000-external-module/pull/2]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 48 ++++++++++++++++++++++++++++++++----------------
+ hif.c      | 44 ++++++++++++++++++++++++++++++++------------
+ 2 files changed, 64 insertions(+), 28 deletions(-)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 57c777d..bdd480c 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -1866,6 +1866,14 @@ static int add_station(struct wiphy *wiphy, struct net_device *dev,
+ 	struct wilc_vif *vif = netdev_priv(dev);
+ 	struct wilc_priv *priv = &vif->priv;
+ 	u8 *assoc_bss = priv->assoc_stainfo.sta_associated_bss[params->aid];
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
++	struct link_station_parameters *link_sta_params = &params->link_sta_params;
++	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
++	u8 supported_rates_len = link_sta_params->supported_rates_len;
++#else
++	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
++	u8 supported_rates_len = params->supported_rates_len;
++#endif
+ 
+ 	if (vif->iftype == WILC_AP_MODE || vif->iftype == WILC_GO_MODE) {
+ 		memcpy(assoc_bss, mac, ETH_ALEN);
+@@ -1879,27 +1887,27 @@ static int add_station(struct wiphy *wiphy, struct net_device *dev,
+ 			   params->aid);
+ 		PRINT_INFO(vif->ndev, HOSTAPD_DBG,
+ 			   "Number of supported rates = %d\n",
+-			   params->supported_rates_len);
++			   supported_rates_len);
+ 
+ 		PRINT_INFO(vif->ndev, CFG80211_DBG, "IS HT supported = %d\n",
+-			   (!params->ht_capa) ? false : true);
++			   (!ht_capa) ? false : true);
+ 
+-		if (params->ht_capa) {
++		if (ht_capa) {
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "Capability Info = %d\n",
+-				   params->ht_capa->cap_info);
++				   ht_capa->cap_info);
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "AMPDU Params = %d\n",
+-				   params->ht_capa->ampdu_params_info);
++				   ht_capa->ampdu_params_info);
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "HT Extended params= %d\n",
+-				   params->ht_capa->extended_ht_cap_info);
++				   ht_capa->extended_ht_cap_info);
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "Tx Beamforming Cap= %d\n",
+-				   params->ht_capa->tx_BF_cap_info);
++				   ht_capa->tx_BF_cap_info);
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "Antenna selection info = %d\n",
+-				   params->ht_capa->antenna_selection_info);
++				   ht_capa->antenna_selection_info);
+ 		}
+ 
+ 		PRINT_INFO(vif->ndev, CFG80211_DBG, "Flag Mask = %d\n",
+@@ -1966,6 +1974,14 @@ static int change_station(struct wiphy *wiphy, struct net_device *dev,
+ {
+ 	int ret = 0;
+ 	struct wilc_vif *vif = netdev_priv(dev);
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
++	struct link_station_parameters *link_sta_params = &params->link_sta_params;
++	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
++	u8 supported_rates_len = link_sta_params->supported_rates_len;
++#else
++	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
++	u8 supported_rates_len = params->supported_rates_len;
++#endif
+ 
+ 	PRINT_D(vif->ndev, CFG80211_DBG, "Change station parameters\n");
+ 
+@@ -1976,25 +1992,25 @@ static int change_station(struct wiphy *wiphy, struct net_device *dev,
+ 			   params->aid);
+ 		PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 			   "Number of supported rates = %d\n",
+-			   params->supported_rates_len);
++			   supported_rates_len);
+ 		PRINT_INFO(vif->ndev, CFG80211_DBG, "IS HT supported = %d\n",
+-			   (!params->ht_capa) ? false : true);
+-		if (params->ht_capa) {
++			   (!ht_capa) ? false : true);
++		if (ht_capa) {
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "Capability Info = %d\n",
+-				   params->ht_capa->cap_info);
++				   ht_capa->cap_info);
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "AMPDU Params = %d\n",
+-				   params->ht_capa->ampdu_params_info);
++				   ht_capa->ampdu_params_info);
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "HT Extended params= %d\n",
+-				   params->ht_capa->extended_ht_cap_info);
++				   ht_capa->extended_ht_cap_info);
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "Tx Beamforming Cap= %d\n",
+-				   params->ht_capa->tx_BF_cap_info);
++				   ht_capa->tx_BF_cap_info);
+ 			PRINT_INFO(vif->ndev, CFG80211_DBG,
+ 				   "Antenna selection info = %d\n",
+-				   params->ht_capa->antenna_selection_info);
++				   ht_capa->antenna_selection_info);
+ 		}
+ 		PRINT_INFO(vif->ndev, CFG80211_DBG, "Flag Mask = %d\n",
+ 			   params->sta_flags_mask);
+diff --git a/hif.c b/hif.c
+index 3f672a0..1a7365b 100644
+--- a/hif.c
++++ b/hif.c
+@@ -2249,6 +2249,16 @@ int wilc_add_station(struct wilc_vif *vif, const u8 *mac,
+ 	int result;
+ 	struct host_if_msg *msg;
+ 	struct add_sta_param *sta_params;
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
++	struct link_station_parameters *link_sta_params = &params->link_sta_params;
++	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
++	u8 supported_rates_len = link_sta_params->supported_rates_len;
++	const u8 *supported_rates = link_sta_params->supported_rates;
++#else
++	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
++	u8 supported_rates_len = params->supported_rates_len;
++	const u8 *supported_rates = params->supported_rates;
++#endif
+ 
+ 	PRINT_INFO(vif->ndev, HOSTINF_DBG,
+ 		   "Setting adding station message queue params\n");
+@@ -2260,20 +2270,20 @@ int wilc_add_station(struct wilc_vif *vif, const u8 *mac,
+ 	sta_params = &msg->body.add_sta_info;
+ 	memcpy(sta_params->bssid, mac, ETH_ALEN);
+ 	sta_params->aid = params->aid;
+-	if (!params->ht_capa) {
++	if (!ht_capa) {
+ 		sta_params->ht_supported = false;
+ 	} else {
+ 		sta_params->ht_supported = true;
+-		memcpy(&sta_params->ht_capa, params->ht_capa,
++		memcpy(&sta_params->ht_capa, ht_capa,
+ 		       sizeof(struct ieee80211_ht_cap));
+ 	}
+ 	sta_params->flags_mask = params->sta_flags_mask;
+ 	sta_params->flags_set = params->sta_flags_set;
+ 
+-	sta_params->supported_rates_len = params->supported_rates_len;
+-	if (params->supported_rates_len > 0) {
+-		sta_params->supported_rates = kmemdup(params->supported_rates,
+-					    params->supported_rates_len,
++	sta_params->supported_rates_len = supported_rates_len;
++	if (supported_rates_len > 0) {
++		sta_params->supported_rates = kmemdup(supported_rates,
++					    supported_rates_len,
+ 					    GFP_KERNEL);
+ 		if (!sta_params->supported_rates) {
+ 			kfree(msg);
+@@ -2397,6 +2407,16 @@ int wilc_edit_station(struct wilc_vif *vif, const u8 *mac,
+ 	int result;
+ 	struct host_if_msg *msg;
+ 	struct add_sta_param *sta_params;
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
++	struct link_station_parameters *link_sta_params = &params->link_sta_params;
++	const struct ieee80211_ht_cap *ht_capa = link_sta_params->ht_capa;
++	u8 supported_rates_len = link_sta_params->supported_rates_len;
++	const u8 *supported_rates = link_sta_params->supported_rates;
++#else
++	const struct ieee80211_ht_cap *ht_capa = params->ht_capa;
++	u8 supported_rates_len = params->supported_rates_len;
++	const u8 *supported_rates = params->supported_rates;
++#endif
+ 
+ 	PRINT_INFO(vif->ndev, HOSTINF_DBG,
+ 		   "Setting editing station message queue params\n");
+@@ -2408,20 +2428,20 @@ int wilc_edit_station(struct wilc_vif *vif, const u8 *mac,
+ 	sta_params = &msg->body.edit_sta_info;
+ 	memcpy(sta_params->bssid, mac, ETH_ALEN);
+ 	sta_params->aid = params->aid;
+-	if (!params->ht_capa) {
++	if (!ht_capa) {
+ 		sta_params->ht_supported = false;
+ 	} else {
+ 		sta_params->ht_supported = true;
+-		memcpy(&sta_params->ht_capa, params->ht_capa,
++		memcpy(&sta_params->ht_capa, ht_capa,
+ 		       sizeof(struct ieee80211_ht_cap));
+ 	}
+ 	sta_params->flags_mask = params->sta_flags_mask;
+ 	sta_params->flags_set = params->sta_flags_set;
+ 
+-	sta_params->supported_rates_len = params->supported_rates_len;
+-	if (params->supported_rates_len > 0) {
+-		sta_params->supported_rates = kmemdup(params->supported_rates,
+-					    params->supported_rates_len,
++	sta_params->supported_rates_len = supported_rates_len;
++	if (supported_rates_len > 0) {
++		sta_params->supported_rates = kmemdup(supported_rates,
++					    supported_rates_len,
+ 					    GFP_KERNEL);
+ 		if (!sta_params->supported_rates) {
+ 			kfree(msg);
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
