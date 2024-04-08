Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DEEC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 16:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9689E81EDD;
	Mon,  8 Apr 2024 16:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCJrUr2YsxgT; Mon,  8 Apr 2024 16:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A16F81EDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A16F81EDE;
	Mon,  8 Apr 2024 16:38:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A32F71BF34D
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 16:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C6DF40203
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 16:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WM2xQIBS1dPS for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 16:38:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B297D401E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B297D401E8
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B297D401E8
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 16:38:27 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ts0lrVIzsoq80ts0mrrF3D; Mon, 08 Apr 2024 18:38:24 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 18:38:23 +0200
Message-Id: <20240408163823.49770-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGmeGcTMTO+sSdDfA0dvb1R2R5li2qI/4lq13wD2HLzbNCLLjQW/kvt5MzE+yXIgxxM4rLi5XvlZoNIan6ka2Umwq1g02uYEhWjvoeXBGbY+JI50l3Q1
 S5AEATRRON9xVUrvMU/LoIkenzfzdSg2XvlTFimJBxKiPALHWRVkpfuCvhXLkwrkAWiY34upz3K9OiTNztBorugI+WivywP32/4XAt1J7MAq1nRQYdaBEL1Z
 2sVKAGl9RyOkVBHH/LCCUklP8qvlD3C4fA/7JmLaNPjIgcGcc9/N9lK7UsRFvioCAThI+qzC6CvBl7ukLCFOiw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1712594304; bh=G4Z5qTy3IIUKwJKmJn5X7UB+OE8YyeCaZtnZ9hzYaLY=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZxGc+T9FgEd4r/CvI8qDKctRl9JN5HCCv+jToN4x+HdmH+Z7hHwn+HOPrq0n7s4FT
 EI1TzFY6ZsLgEwpteut8xjpc8b/+vw6gCI3MFstt3OoKdEzAgg/Zumi/FQ9mx+cJGo
 lWq9HTaLmuMvPm3mEi1M0nREh0kNqDXDcVyKbSafThD60JIRygotX9Hkwe8DoNz6jz
 wS3WHhwf/UqVtov2vDwb1b/Bm2MKemQVcjUk/0viNktaEEc1t+Rh7h6y1NgGwz8F8R
 8V0YKT1FRGi7r1quXrIuOz0WwqiOjlbfTGxsg4G7sTHgItMJNa8ZOm6fTfJkrdiuKI
 fbexvh9WdrTAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ZxGc+T9F
Subject: [Buildroot] [PATCH] package/rtl8821au: fix build failure with Linux
 version 6.7.0
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
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build failure with Linux version
6.7.0 and allow to build up to Linux version 6.9.x.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...2au-Fix-builds-for-kernels-up-to-6.9.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/rtl8821au/0001-rtl8812au-Fix-builds-for-kernels-up-to-6.9.patch

diff --git a/package/rtl8821au/0001-rtl8812au-Fix-builds-for-kernels-up-to-6.9.patch b/package/rtl8821au/0001-rtl8812au-Fix-builds-for-kernels-up-to-6.9.patch
new file mode 100644
index 0000000000..29164fb3b7
--- /dev/null
+++ b/package/rtl8821au/0001-rtl8812au-Fix-builds-for-kernels-up-to-6.9.patch
@@ -0,0 +1,52 @@
+From 3ea4762b6ea8fc01b967e8d3b627ef3a16fe9d22 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 8 Apr 2024 18:29:34 +0200
+Subject: [PATCH] rtl8812au: Fix builds for kernels up to 6.9
+
+During commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bb55441c57ccc5cc2eab44e1a97698b9d708871d
+function pointer change_beacon() parameter 'info' changed its type, so
+let's change our local function according to that prototype if Linux
+version >= 6.7.0
+
+Upstream: https://github.com/lwfinger/rtl8812au/pull/28
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ os_dep/ioctl_cfg80211.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/os_dep/ioctl_cfg80211.c b/os_dep/ioctl_cfg80211.c
+index 7cdc235..6c2f520 100644
+--- a/os_dep/ioctl_cfg80211.c
++++ b/os_dep/ioctl_cfg80211.c
+@@ -3658,14 +3658,23 @@ static int cfg80211_rtw_start_ap(struct wiphy *wiphy, struct net_device *ndev,
+ }
+ 
+ static int cfg80211_rtw_change_beacon(struct wiphy *wiphy, struct net_device *ndev,
+-                                struct cfg80211_beacon_data *info)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 7, 0))
++				      struct cfg80211_ap_update *info)
++#else
++				      struct cfg80211_beacon_data *info)
++#endif
+ {
+ 	int ret = 0;
+ 	_adapter *adapter = wiphy_to_adapter(wiphy);
+ 
+ 	DBG_871X(FUNC_NDEV_FMT"\n", FUNC_NDEV_ARG(ndev));
+-
+-	ret = rtw_add_beacon(adapter, info->head, info->head_len, info->tail, info->tail_len);
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 7, 0))
++	ret = rtw_add_beacon(adapter, info->beacon.head, info->beacon.head_len,
++			     info->beacon.tail, info->beacon.tail_len);
++#else
++	ret = rtw_add_beacon(adapter, info->head, info->head_len, info->tail,
++			     info->tail_len);
++#endif
+ 
+ 	return ret;
+ }
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
