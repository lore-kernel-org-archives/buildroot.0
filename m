Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE6CCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 09:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AE0140656;
	Sat, 11 Oct 2025 09:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIYIrp2__mVw; Sat, 11 Oct 2025 09:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73986405F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73986405F5;
	Sat, 11 Oct 2025 09:01:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B61812B
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4168C405E2
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcGUCl4BMdUh for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 09:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3626C405CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3626C405CC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:01:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3025B86A77; Sat, 11 Oct 2025 09:01:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 10:55:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a3360fdb3dfd9211eb4aadc2607ff18b8672ee7
X-Git-Newrev: 02684f4625ed597e40633274b376326b1127a86e
X-Patchwork-Hint: ignore
Message-Id: <20251011090131.3025B86A77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: fix build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=02684f4625ed597e40633274b376326b1127a86e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a local patch pending upstream to fix build failure with Linux 6.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: update patch Upstream link with commit ID]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-for-kernel-6.17.patch           | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch b/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
new file mode 100644
index 0000000000..3329016472
--- /dev/null
+++ b/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
@@ -0,0 +1,80 @@
+From dbf3f744650e05a40fc3df6325fc657e5c23cece Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 10 Oct 2025 22:18:12 +0200
+Subject: [PATCH] Fix build for kernel 6.17
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
+set_rts_threshold() and config() gain argument radio_idx to get radio
+index. So let's add that argument according to Linux version >= 6.17.
+
+Upstream: https://github.com/fifteenhex/xradio/commit/43992a7e7ed95ff815cf6d8ba81cef1085e50ab9
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ sta.c | 12 ++++++++++--
+ sta.h | 12 ++++++++++--
+ 2 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/sta.c b/sta.c
+index 1203ce9..d769b81 100644
+--- a/sta.c
++++ b/sta.c
+@@ -381,7 +381,11 @@ int xradio_change_interface(struct ieee80211_hw *dev,
+ 	return ret;
+ }
+ 
+-int xradio_config(struct ieee80211_hw *dev, u32 changed)
++int xradio_config(struct ieee80211_hw *dev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++		  int radio_idx,
++#endif
++		  u32 changed)
+ {
+ 	int ret = 0;
+ 	struct xradio_common *hw_priv = dev->priv;
+@@ -796,7 +800,11 @@ void xradio_wep_key_work(struct work_struct *work)
+ 	wsm_unlock_tx(hw_priv);
+ }
+ 
+-int xradio_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
++int xradio_set_rts_threshold(struct ieee80211_hw *hw,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++			     int radio_idx,
++#endif
++			     u32 value)
+ {
+ 	struct xradio_common *hw_priv = hw->priv;
+ 	int ret = 0;
+diff --git a/sta.h b/sta.h
+index 39a023a..de8f837 100644
+--- a/sta.h
++++ b/sta.h
+@@ -42,7 +42,11 @@ int xradio_change_interface(struct ieee80211_hw *dev,
+                             struct ieee80211_vif *vif,
+                             enum nl80211_iftype new_type,
+                             bool p2p);
+-int xradio_config(struct ieee80211_hw *dev, u32 changed);
++int xradio_config(struct ieee80211_hw *dev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++		  int radio_idx,
++#endif
++		  u32 changed);
+ int xradio_change_interface(struct ieee80211_hw *dev,
+                             struct ieee80211_vif *vif,
+                             enum nl80211_iftype new_type,
+@@ -65,7 +69,11 @@ int xradio_get_stats(struct ieee80211_hw *dev,
+ int xradio_get_tx_stats(struct ieee80211_hw *dev,
+ 			struct ieee80211_tx_queue_stats *stats);
+ */
+-int xradio_set_rts_threshold(struct ieee80211_hw *hw, u32 value);
++int xradio_set_rts_threshold(struct ieee80211_hw *hw,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++			     int radio_idx,
++#endif
++			     u32 value);
+ 
+ void xradio_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u32 queues, bool drop);
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
