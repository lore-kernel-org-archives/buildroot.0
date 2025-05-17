Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6693C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61C0C84532;
	Mon, 19 May 2025 11:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgzGy9QwkTNB; Mon, 19 May 2025 11:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D2C84542
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D2C84542;
	Mon, 19 May 2025 11:03:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45A54D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B7AF41C0C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OwxLJMDww0y for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 300D341E32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 300D341E32
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AD2A82A2E; Mon, 19 May 2025 10:40:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:54:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ccf3536fcbfb2f3744ef7ccf1ed1b75d6d1f22ac
X-Git-Newrev: 4333f4d921064adca6f6e5f454e43e764d1b44de
X-Patchwork-Hint: ignore
Message-Id: <20250519104007.2AD2A82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wilc-driver: fix build
 with Linux 6.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=4333f4d921064adca6f6e5f454e43e764d1b44de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add local patch pending upstream to fix build with Linux 6.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0011-cfg80211.c-fix-build-with-Linux-6.13.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch b/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch
new file mode 100644
index 0000000000..6d26b20a5c
--- /dev/null
+++ b/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch
@@ -0,0 +1,28 @@
+From 446911a48cd1a2c740b43a32d0ffa6e3f1887e84 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 26 Apr 2025 00:40:43 +0200
+Subject: [PATCH] cfg80211.c: fix build with Linux 6.13
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 25da3a1..d0cd826 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -291,6 +291,9 @@ struct wilc_vif *wilc_get_wl_to_vif(struct wilc *wl)
+ }
+ 
+ static int set_channel(struct wiphy *wiphy,
++#if KERNEL_VERSION(6, 13, 0) <= LINUX_VERSION_CODE
++		       struct net_device *netdev,
++#endif
+ 		       struct cfg80211_chan_def *chandef)
+ {
+ 	struct wilc *wl = wiphy_priv(wiphy);
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
