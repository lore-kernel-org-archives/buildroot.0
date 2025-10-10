Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96744CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68D3C606BF;
	Fri, 10 Oct 2025 17:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hiM75VrvXGx; Fri, 10 Oct 2025 17:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC69F6069D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC69F6069D;
	Fri, 10 Oct 2025 17:42:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B73714B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8220440064
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMXNhBXxOFsZ for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C60DF40050
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C60DF40050
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C009087038; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 19:22:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8ee5126797035f52d1bfde34a19cdfe932a4140
X-Git-Newrev: 5f9c69c97f064f2a06d7318d61a77c82b02422b4
X-Patchwork-Hint: ignore
Message-Id: <20251010174246.C009087038@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: fix build
 with Linux 6.17
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f9c69c97f064f2a06d7318d61a77c82b02422b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream to fix build failure with Linux 6.17.

Fixes:
Still not occured

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-Fix-build-for-kernel-6.17.patch           | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch b/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch
new file mode 100644
index 0000000000..361615b945
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch
@@ -0,0 +1,57 @@
+From dfbeaa319808624c367200739a9a6f7fbc4b8281 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 8 Oct 2025 17:56:52 +0200
+Subject: [PATCH] Fix build for kernel 6.17
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
+set_wiphy_params() and set/get_tx_power() gain argument radio_idx to get
+radio index. So let's add that argument according to linux version >=
+6.17.
+
+Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1238
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ os_dep/linux/ioctl_cfg80211.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index ec47e95..3d834a4 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -3365,7 +3365,12 @@ exit:
+ 	return ret;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, int radio_idx,
++					 u32 changed)
++#else
+ static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, u32 changed)
++#endif
+ {
+ #if 0
+ 	struct iwm_priv *iwm = wiphy_to_iwm(wiphy);
+@@ -4267,6 +4272,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	struct wireless_dev *wdev,
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 36)) || defined(COMPAT_KERNEL_RELEASE)
+ 	enum nl80211_tx_power_setting type, int mbm)
+ #else
+@@ -4328,6 +4336,9 @@ static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	struct wireless_dev *wdev,
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
+ 	unsigned int link_id,
+ #endif
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
