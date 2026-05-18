Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2DDCD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 14:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79EA385CD4;
	Mon, 18 May 2026 14:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AR6w6rD-ESMK; Mon, 18 May 2026 14:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7469E85CB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779115718;
	bh=862hsg61rKbtrQSLR+DCCorJrGdmfuk0VW7ZHE/IB60=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NyYDi1CDriwql9q5hMOSPkTt1LmVPcMRTfJJnQ0nvFOdAMi+T1CNtfh7fhrZeznmw
	 HRHfTfzCdKJ3xKoi9UzPEY8jXHP6quSoGVMKcCtVofmyQL69SSdL78Up4iHctR/Iz0
	 /l+CmvRGulQ8dL4MrCIMMGOXz+0D995Di+gxOAO9+Zg6hIiuzDNm9bZZkv55/WFobX
	 3Vvcy6GIHosKVFrEZJddg/bkqMdhkrxH/DETDoYtBdVkdij8JbCYtBQPCGioMu3LbL
	 a1zuJq7vmGXhAXQG8N94d+DRWmEAQ5bojybfG44uwQGahytzoL1XgPGkUWXiRVBuT1
	 SaruBsL6IB0GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7469E85CB9;
	Mon, 18 May 2026 14:48:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D3A0265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42C0740AB0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pevdk521vqdx for <buildroot@buildroot.org>;
 Mon, 18 May 2026 14:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6D24408EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6D24408EC
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6D24408EC
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:48:33 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id OzGfwj0uJRHshOzGfwMoRY; Mon, 18 May 2026 16:48:29 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 18 May 2026 16:48:28 +0200
Message-ID: <20260518144828.1855670-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGJh0/B1bIzmnNePSLuKN0d6S5PKwB0t6A8nCsG/J7JdtGedFeDmDv6KkkOTlqK9TY19Qn6fIHH742iuOAaeZuuaXSBIV0SXu8A6WOzZ7Hmh6EZLD0i6
 Ni9vI/Qgc8MYEsJtrZnmdbiLq5HMooBtXBNdNH9gchT+1xpuqyZdHHs7bpwDAb4EQneV5cI8ZwOq7NVYd0V6Yfm62g1s/cdYHzwY5LKXBwzMnQ+GcaDwkPiN
 9dKnB30P0Wt+/Mf+HhWFtQ9h25DjdGXK9LDp5fMUt8M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1779115709; bh=6tyj0kSWCXEubcdSsuSH/UQelalNP+ONRXuXRgUFQ5I=;
 h=From:To:Subject:Date:MIME-Version;
 b=MdOMQ8hpL5/rosVa3ubj7Thdc+8CkCbbOMhkucWic1lJXZrOt0YF7thEYlyzBnfrV
 q4RF9X+tjxsC6xcUOIop10tx15s9KWB8xPgNk2gsd4hp3yiD1Y52kP1MwNMW5Rv3yJ
 hoj7Ygx0yOlRheqTfyRxuwTNmNOEQFYer0RC8Ij5WfSYn5f5CICx/bEjHtIKerfCu7
 A5ZZ2KeHTdTlSWFV+yDr5iQNieufn8TijpTmKIg1tItOa8WlyXOyG2xu2KKhqXlZMr
 77V9x2l40SsJbAhwFb1PpgnA8OlY10rHkF0yUR8psQUjFJJE9xTpoBPw0WnRYILoie
 An3Rvi8zNXMkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MdOMQ8hp
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build failure with Linux >= 7.1.0.

Fixes:
still not occured

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...p_hosted_ng-Fix-build-for-kernel-7.1.patch | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.1.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
