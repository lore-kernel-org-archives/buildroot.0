Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B4DCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B189741DFC;
	Sat, 30 May 2026 22:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3df5YVcUyKVJ; Sat, 30 May 2026 22:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 712FF412A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178773;
	bh=VAuTGYSeudWMTWbnCuKdlProewqxEvQZuSVGM6ZvUEE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HpBoRzTEZ90+FnCovpkERDXXhqAOQmqVDHyUM1N+/5fx9XzVXG0oD4BqHOuCO9R1+
	 tjPfbCkowGXmk16w5B3xZrKv7YAVEqTY2LOkvtYmtxeCtZaDOJHSJlowbLmJ+yajJs
	 o+EY68kh5SDUp6sK7DytIUErCqBONv92oBHGRMBI4GAJ+0+nMHZc0JqT96ZLkTuFyU
	 W74ngwlyCChAU5zjkQf7Oe6+6zwYyA0OouDjXoapLTj7mrgZn7lvscZbTTFatzb4Xe
	 EmGwAoMtgHOgRPSDlxu12HTUdhgdcL8xfGOSUBYDCKGXR1rdWG63SkGxwi8/SOxNcs
	 9jyyx+xzEv4qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712FF412A6;
	Sat, 30 May 2026 22:06:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F145D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BF6D84A12
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxD2HcyDBsWo for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6248585465
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6248585465
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:06:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A67987658; Sat, 30 May 2026 22:05:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 00:02:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9737b2135c67f14f3243b4a34b85eb4eb5fe39d3
X-Git-Newrev: dd1430b39f7f796e663881599439ea192c8fc432
X-Patchwork-Hint: ignore
Message-Id: <20260530220558.3A67987658@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: fix build failure with
 Linux >= 7.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd1430b39f7f796e663881599439ea192c8fc432
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add local patch pending upstream to fix build failure with Linux >= 7.1.0.

Fixes:
still not occured

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch
new file mode 100644
index 0000000000..90076b4956
--- /dev/null
+++ b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch
@@ -0,0 +1,147 @@
+From fa27d70495e3b4f92c9de43b33aa09813a318495 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 18 May 2026 16:44:57 +0200
+Subject: [PATCH] fix(esp_hosted_ng): Fix build for kernel 7.1
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=033fe322f5852d5144a85978e880e01b1787fd0d
+many functions esp_cfg80211_*() have argument struct netdevice * subsituted
+with struct wireless_dev *. So let's add separate function headers and
+retrieve struct netdev * from struct wireless_dev * if Linux version >= 7.1.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/736
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/esp_cfg80211.c | 50 +++++++++++++++++++++++++++++++
+ 1 file changed, 50 insertions(+)
+
+diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
+index c68f7983e6..1009df1fd5 100644
+--- a/esp_hosted_ng/host/esp_cfg80211.c
++++ b/esp_hosted_ng/host/esp_cfg80211.c
+@@ -533,22 +533,38 @@ static int esp_cfg80211_set_default_key(struct wiphy *wiphy,
+ }
+ 
+ static int esp_cfg80211_set_default_mgmt_key(struct wiphy *wiphy,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
++					     struct wireless_dev *wdev, INT_LINK_ID u8 key_index)
++#else
+ 					     struct net_device *ndev, INT_LINK_ID u8 key_index)
++#endif
+ {
+ 	return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
++static int esp_cfg80211_del_key(struct wiphy *wiphy, struct wireless_dev *wdev,
++#else
+ static int esp_cfg80211_del_key(struct wiphy *wiphy, struct net_device *dev,
++#endif
+ 				INT_LINK_ID u8 key_index, bool pairwise,
+ 				const u8 *mac_addr)
+ {
+ 	return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
++static int esp_cfg80211_add_key(struct wiphy *wiphy, struct wireless_dev *wdev,
++				INT_LINK_ID u8 key_index, bool pairwise,
++				const u8 *mac_addr, struct key_params *params)
++{
++	struct net_device *dev = wdev->netdev;
++#else
+ static int esp_cfg80211_add_key(struct wiphy *wiphy, struct net_device *dev,
+ 				INT_LINK_ID u8 key_index, bool pairwise,
+ 				const u8 *mac_addr, struct key_params *params)
+ {
++#endif
+ 	struct esp_wifi_device *priv = NULL;
+ 
+ 	if (!wiphy || !dev || !params) {
+@@ -564,7 +580,11 @@ static int esp_cfg80211_add_key(struct wiphy *wiphy, struct net_device *dev,
+ 	esp_dbg("\n");
+ 
+ 	if (params->key_len == 0) {
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
++		return esp_cfg80211_del_key(wiphy, wdev, ZERO_LINK_ID key_index, pairwise, mac_addr);
++#else
+ 		return esp_cfg80211_del_key(wiphy, dev, ZERO_LINK_ID key_index, pairwise, mac_addr);
++#endif
+ 	}
+ 	return cmd_add_key(priv, key_index, pairwise, mac_addr, params);
+ }
+@@ -783,9 +803,16 @@ static int esp_cfg80211_set_tx_power(struct wiphy *wiphy,
+ 	return cmd_set_tx_power(priv, priv->tx_pwr);
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
++static int esp_cfg80211_get_station(struct wiphy *wiphy, struct wireless_dev *wdev,
++				    const u8 *mac, struct station_info *sinfo)
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int esp_cfg80211_get_station(struct wiphy *wiphy, struct net_device *ndev,
+ 				    const u8 *mac, struct station_info *sinfo)
+ {
++#endif
+ 	struct esp_wifi_device *priv = NULL;
+ 
+ 	priv = netdev_priv(ndev);
+@@ -1034,9 +1061,16 @@ static int esp_cfg80211_probe_client(struct wiphy *wiphy, struct net_device *dev
+ 	return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
++static int esp_cfg80211_del_station(struct wiphy *wiphy, struct wireless_dev *wdev,
++					struct station_del_parameters *params)
++{
++	struct net_device *dev = wdev->netdev;
++#else
+ static int esp_cfg80211_del_station(struct wiphy *wiphy, struct net_device *dev,
+ 					struct station_del_parameters *params)
+ {
++#endif
+ 	struct esp_wifi_device *priv = NULL;
+ 
+ 	if (!wiphy || !dev) {
+@@ -1055,10 +1089,18 @@ static int esp_cfg80211_del_station(struct wiphy *wiphy, struct net_device *dev,
+ 	return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
++static int esp_cfg80211_add_station(struct wiphy *wiphy, struct wireless_dev *wdev,
++				    const u8 *mac,
++				    struct station_parameters *params)
++{
++	struct net_device *dev = wdev->netdev;
++#else
+ static int esp_cfg80211_add_station(struct wiphy *wiphy, struct net_device *dev,
+ 				    const u8 *mac,
+ 				    struct station_parameters *params)
+ {
++#endif
+ 	struct esp_wifi_device *priv = NULL;
+ 
+ 	if (!wiphy || !dev) {
+@@ -1078,10 +1120,18 @@ static int esp_cfg80211_add_station(struct wiphy *wiphy, struct net_device *dev,
+ 	return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
++static int esp_cfg80211_change_station(struct wiphy *wiphy,
++				       struct wireless_dev *wdev, const u8 *mac,
++				       struct station_parameters *params)
++{
++	struct net_device *dev = wdev->netdev;
++#else
+ static int esp_cfg80211_change_station(struct wiphy *wiphy,
+ 				       struct net_device *dev, const u8 *mac,
+ 				       struct station_parameters *params)
+ {
++#endif
+ 	struct esp_wifi_device *priv = NULL;
+ 
+ 	if (!wiphy || !dev) {
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
