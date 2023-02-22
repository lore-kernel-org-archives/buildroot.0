Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331F0C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7AE612CA;
	Wed, 22 Feb 2023 20:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7AE612CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpwS-VgNusXs; Wed, 22 Feb 2023 20:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296E66117D;
	Wed, 22 Feb 2023 20:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 296E66117D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 751AA1BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 512CA402FE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 512CA402FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0JLjBKh94KW for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69F9740135
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69F9740135
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53BF4868BC; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 15:59:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51793e0d56eef07d9f68c676f9c84be3f425082b
X-Git-Newrev: 293a878ae268cd0561fc3ab81c04b9a438acf921
X-Patchwork-Hint: ignore
Message-Id: <20230222205839.53BF4868BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: fix build failure due
 to wrong pointer casts
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

commit: https://git.buildroot.net/buildroot/commit/?id=293a878ae268cd0561fc3ab81c04b9a438acf921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream[0] to fix the bug.

[0]: https://github.com/embeddedTS/wilc3000-external-module/pull/3

Fixes:
http://autobuild.buildroot.net/results/0a0/0a022d5c053bf8f7a53349b8bae4b2168a9cd134/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wilc-driver/0005-Fix-cast-warnings.patch | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/wilc-driver/0005-Fix-cast-warnings.patch b/package/wilc-driver/0005-Fix-cast-warnings.patch
new file mode 100644
index 0000000000..713a15e667
--- /dev/null
+++ b/package/wilc-driver/0005-Fix-cast-warnings.patch
@@ -0,0 +1,43 @@
+From ebd083223883d479b2dd6f8a0da272797f90d236 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 31 Dec 2022 18:38:33 +0100
+Subject: [PATCH] Fix cast warnings
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 2 +-
+ netdev.c   | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 016aa06..2f40c9d 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -1794,7 +1794,7 @@ static int start_ap(struct wiphy *wiphy, struct net_device *dev,
+ 	if (ret != 0)
+ 		netdev_err(dev, "Error in setting channel\n");
+ 
+-	wilc_wlan_set_bssid(dev, dev->dev_addr, WILC_AP_MODE);
++	wilc_wlan_set_bssid(dev, (u8 *)dev->dev_addr, WILC_AP_MODE);
+ 
+ 	return wilc_add_beacon(vif, settings->beacon_interval,
+ 				   settings->dtim_period, &settings->beacon);
+diff --git a/netdev.c b/netdev.c
+index 824afea..5a1a51d 100644
+--- a/netdev.c
++++ b/netdev.c
+@@ -899,9 +899,9 @@ static int wilc_mac_open(struct net_device *ndev)
+ 				vif->idx);
+ 
+ 	if (is_valid_ether_addr(ndev->dev_addr))
+-		wilc_set_mac_address(vif, ndev->dev_addr);
++		wilc_set_mac_address(vif, (u8 *)ndev->dev_addr);
+ 	else
+-		wilc_get_mac_address(vif, ndev->dev_addr);
++		wilc_get_mac_address(vif, (u8 *)ndev->dev_addr);
+ 	netdev_dbg(ndev, "Mac address: %pM\n", ndev->dev_addr);
+ 
+ 	if (!is_valid_ether_addr(ndev->dev_addr)) {
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
