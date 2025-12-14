Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CEAD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19ED0606CE;
	Sun, 14 Dec 2025 21:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSK-9eyoyFGA; Sun, 14 Dec 2025 21:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34064606FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765746940;
	bh=bQRRzBNdyN2bwdoRNOgXiGhuV8ZmCf7e3RyX548lxg8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gdWWnEYBYbuof/YYhga1XgPp6QxzKtVmJv+/IyCJ0m7NZGCANdzxodRYNVad1pM+W
	 73MHogYsgHEYMOVxRax+atXAFCc1Y+8UzVjNccTeKfw0IXc1BHOagcHeIg4Zb/WF0l
	 gPH98YqGqe5/ieRrMgSHYnmzkzwJNGfoSDLX2lssFRzjtOqXyqcD3Emvt6cYolyeTO
	 9QduPOxruFdIBUh9KomBz0ZLJStwlP6Bv5Y+cf6QLh1sTWp9lS8ep/dTR4wjmPG+fV
	 KBBq8ajbq5lFtMnbLJ5zHBCcWa8V0tEbXNN3sI6Fw/abx/TEJAk3vp6x2KShD2DB9H
	 YkQnWwj393ebg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34064606FD;
	Sun, 14 Dec 2025 21:15:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD5C5117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF2054007F
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18E0neCJPfYF for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DCBE4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCBE4003A
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DCBE4003A
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:15:36 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UtRGvsRWz3pJ0UtRHv70uT; Sun, 14 Dec 2025 22:15:35 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 14 Dec 2025 22:15:34 +0100
Message-ID: <20251214211534.2541224-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGnJWwTsOO07/8pPXZTlLD2l0rk9I7h7HPnzDX1ITPfGc2rKuELL0P40P6kwoy/au6J2gjQjs/Ct2uGQpW+wA1Rkxz7PMYaqU5/TLf139eao+n8Wr1nt
 M5vdeWUiFwYs9MCKJm9ywleZM5TUEArtvuZ9G03jRklMja0wFUmeZcDee2IRs2MUNCqC4H3q9k/GdFiP+QgxDKsKjirqPSWAC/PANC8H2YEv/pfz6Y3zoHTU
 d5htx9XzvhZSpqHlvuPaaol4cD3PDvmzuHlmL6aYvHQmATXss6k0Srw+Br79RZokIr0JimicVrtawU5gJIUeCQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765746935; bh=5w3qSoX2XTqwC2dsGE3hWEtLR4wFnBrk7lEl4yaIhXo=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ui4ainzppWEXcjkKaBhkSs+0OHX03p0aiKQgt1/HAi5Ofr/A76hLf0ANHcbwnQ7Zo
 6iOkRuetzw0nvaholRRMqzG0OEd83jw7hUaxVW10xmP1wtWrvSGinbAdW+nj3dSPZ2
 LZGnrFMT9lyrFwEB3e0AtbnjNzROIU7wajmv6mdEyoPXYQp3wvtMkpKM5JN40E4xvZ
 arAtVkaVkohRiUEpNC+wlIifIwKB1qhfuKrFf3OCMEaV6fnY5u2O0h2xSlPmCGTdbo
 2PYc3JGND9lsXsgG83jSoXkiC0M9xWLShI5n3dqkD6FhdBx2Pbg2J9Wb6R/tBEuJAZ
 zmi/d5HcMkAEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ui4ainzp
Subject: [Buildroot] [PATCH] package/xr819-xradio: fix build failure due to
 local patch
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

Local patch hasn't been removed while bumping package version resulting
into build failure. So let's drop local path to fix build failure.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-for-kernel-6.17.patch      | 80 -------------------
 1 file changed, 80 deletions(-)
 delete mode 100644 package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch

diff --git a/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch b/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
deleted file mode 100644
index 3329016472..0000000000
--- a/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From dbf3f744650e05a40fc3df6325fc657e5c23cece Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Fri, 10 Oct 2025 22:18:12 +0200
-Subject: [PATCH] Fix build for kernel 6.17
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
-set_rts_threshold() and config() gain argument radio_idx to get radio
-index. So let's add that argument according to Linux version >= 6.17.
-
-Upstream: https://github.com/fifteenhex/xradio/commit/43992a7e7ed95ff815cf6d8ba81cef1085e50ab9
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- sta.c | 12 ++++++++++--
- sta.h | 12 ++++++++++--
- 2 files changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/sta.c b/sta.c
-index 1203ce9..d769b81 100644
---- a/sta.c
-+++ b/sta.c
-@@ -381,7 +381,11 @@ int xradio_change_interface(struct ieee80211_hw *dev,
- 	return ret;
- }
- 
--int xradio_config(struct ieee80211_hw *dev, u32 changed)
-+int xradio_config(struct ieee80211_hw *dev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+		  int radio_idx,
-+#endif
-+		  u32 changed)
- {
- 	int ret = 0;
- 	struct xradio_common *hw_priv = dev->priv;
-@@ -796,7 +800,11 @@ void xradio_wep_key_work(struct work_struct *work)
- 	wsm_unlock_tx(hw_priv);
- }
- 
--int xradio_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
-+int xradio_set_rts_threshold(struct ieee80211_hw *hw,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+			     int radio_idx,
-+#endif
-+			     u32 value)
- {
- 	struct xradio_common *hw_priv = hw->priv;
- 	int ret = 0;
-diff --git a/sta.h b/sta.h
-index 39a023a..de8f837 100644
---- a/sta.h
-+++ b/sta.h
-@@ -42,7 +42,11 @@ int xradio_change_interface(struct ieee80211_hw *dev,
-                             struct ieee80211_vif *vif,
-                             enum nl80211_iftype new_type,
-                             bool p2p);
--int xradio_config(struct ieee80211_hw *dev, u32 changed);
-+int xradio_config(struct ieee80211_hw *dev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+		  int radio_idx,
-+#endif
-+		  u32 changed);
- int xradio_change_interface(struct ieee80211_hw *dev,
-                             struct ieee80211_vif *vif,
-                             enum nl80211_iftype new_type,
-@@ -65,7 +69,11 @@ int xradio_get_stats(struct ieee80211_hw *dev,
- int xradio_get_tx_stats(struct ieee80211_hw *dev,
- 			struct ieee80211_tx_queue_stats *stats);
- */
--int xradio_set_rts_threshold(struct ieee80211_hw *hw, u32 value);
-+int xradio_set_rts_threshold(struct ieee80211_hw *hw,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+			     int radio_idx,
-+#endif
-+			     u32 value);
- 
- void xradio_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u32 queues, bool drop);
- 
--- 
-2.47.3
-
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
