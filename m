Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0A6C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0E860BFD;
	Sun, 20 Nov 2022 20:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B0E860BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_A6U4nXGbFX; Sun, 20 Nov 2022 20:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D7F60AF0;
	Sun, 20 Nov 2022 20:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D7F60AF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD71D1BF3ED
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 20:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 923F781D4D
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 20:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 923F781D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ceS6lhq455gK for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 20:42:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B5781C6F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2B5781C6F
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 20:42:29 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so7754328wmi.3
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 12:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhfefs45xPUOnP0GpRxIi4CS/EpiIpWDNRRMDqmMWaM=;
 b=zIJjGeX9MfsES1VtpPnOqT2EAE+skMYdJFi8SBkekllVQ+5CYrmSuF5NeT9nYcS49i
 mIxdR/Zs1603Vaa2VsLwosxlBNtgAvjjR4Lz6YTlsauTwGxa+7rgXubgHoCY76z76Hfd
 mAqVS5+7KGWOnlvsnJ7X2Efwr6D4eDV2zoa1gnrHShPH4gZisTgwtqSlQisgQaknM8Kc
 MUb9+wGnt0XiMGnQoNrtcyon3/LlSaw1WoRYPaou1hdSMG0FpcDbTqs0j8hxvEidhEsm
 jBMT8iKiGNNjlSl8boQ7M5WxFcp5xlq4gG6gAyCA/FZK8iHm7Fkj7VDrNyDYcreS/pQl
 a12w==
X-Gm-Message-State: ANoB5pkalUFAZWw5nX7ypV0C6onNUO3Cxxpc0hlDinVlHLHdomxvY1ao
 3ArxQqBV4gD8AwRF6gpSYLoVCnOngAo=
X-Google-Smtp-Source: AA0mqf7OQSE9XMMLH9445d8xIbyW/MfTjEG4Tyd0GwdYyO/1D68boTBDb6ZFyL1tOXCSSBiIGE+Kug==
X-Received: by 2002:a1c:770a:0:b0:3cf:ab80:b558 with SMTP id
 t10-20020a1c770a000000b003cfab80b558mr13968521wmi.155.1668976947695; 
 Sun, 20 Nov 2022 12:42:27 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:78ad:17ab:4254:8d91])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003c7087f6c9asm16980354wmo.32.2022.11.20.12.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 12:42:27 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 21:42:26 +0100
Message-Id: <20221120204226.3565528-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=vhfefs45xPUOnP0GpRxIi4CS/EpiIpWDNRRMDqmMWaM=;
 b=nSCvlXyXuP2f4kw+0d4S6fQKi44teYsyo5/jKfaQm06spRK6c0Ia76pAblf+KPpriS
 thXJdC4VODQV/6j/oklCQHBt7LOKF4a104QbxavZsJXaAodiXGd1/zIcuIG6RYSaGaOW
 navpn/4jtisfMuGT0ab6M79bePeqNeiii2Mw35K+RodR7pqlUcUs7FfcR65abpQOPbFP
 vYxJ2LPRKCpQrMP+zinRA53hGg+R5LQAbQSrx2FGqZtL2zMSv5pdpKfqESsVRWr+anEz
 eJv+xnbrOsGZPlYHz4qBdrBlIMsOju2pR6ehkxvwOxhdvVMEscPGv185vVms8d6PrVVe
 ThyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nSCvlXyX
Subject: [Buildroot] [PATCH] fs/ext2: generate Y2K38-resilient filesystems
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When creating a filesystem, mkfs.ext will chose the inode size depending
on the size of the filesystem. Small filesystem get 128-bytes inodes,
while bigger filesystems use 256-byte inodes (inode must be a power of 2
larger or equal to 128, and smaller or equal to the blocksize).

However, 128-byte inodes can't store timestamps past the dreaded
2038-01-19 03:14:07Z deadline, while inodes larger than or equal to 256
do not have the issue.

It turns out that the tipping point to decide whether a filesystem is
small or big, is about around the size of the filesystems we generate
for our runtime tests. This causes the kernel to emit warning like:

    ext2 filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)

We add a new option to our ext2 filesystem, so that user can specify the
size of the inode. That new option defaults to 256 to be resilient to
the Y2K38 problem.

Note: it was already possible for users to explicitly pass the -I
option, through BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS. We could have
chosen to extend the existing value with a -I 256, but that is not
satisfactory. Indeed, we do want to ensure that the default is now
Y2K38-OK, even for existing configurations that did not have explicit
setting.

We also pass that new option before the user-specified arbitrary ones,
so that BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS still wins (in case -I was
set there).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/ext2/Config.in | 13 +++++++++++++
 fs/ext2/ext2.mk   |  1 +
 2 files changed, 14 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 705446df57..3c68638fd8 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -60,6 +60,19 @@ config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
 	default 0
 
+config BR2_TARGET_ROOTFS_EXT2_INODE_SIZE
+	int "inode size"
+	default 256
+	help
+	  Set the size of inodes, in bytes, as a power of 2 larger or
+	  equal to 128.
+
+	  Set to 0 to let the filesystem generator decide. If unsure,
+	  keep the default, 256.
+
+	  Note: 128-byte inodes suffer of the Y2K38 problem, and can't
+	  store timestamps beyond 2038-01-19 03:14:07Z.
+
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
 	default 5
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 5b5393f092..e69e79cd2e 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -22,6 +22,7 @@ ROOTFS_EXT2_OPTS = \
 	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
 	-L "$(ROOTFS_EXT2_LABEL)" \
+	-I $(BR2_TARGET_ROOTFS_EXT2_INODE_SIZE) \
 	$(ROOTFS_EXT2_MKFS_OPTS)
 
 ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
