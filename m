Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF35C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 07:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95D9741DD8;
	Thu,  4 May 2023 07:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D9741DD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ah7ABen2SuJQ; Thu,  4 May 2023 07:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB06741DCC;
	Thu,  4 May 2023 07:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB06741DCC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 669DC1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A4C41DCC
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A4C41DCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JD9ladEf0iGe for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 07:15:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2328941DBB
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2328941DBB
 for <buildroot@buildroot.org>; Thu,  4 May 2023 07:15:50 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ab032d9266so839815ad.0
 for <buildroot@buildroot.org>; Thu, 04 May 2023 00:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184549; x=1685776549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ip2Sl3qx3oXf6O11SNAo4q6YcujOvY69j/cO43wQwOc=;
 b=hoovO+vDJfltpVV0TP7anJQ39FfemOfMlLg93TxphBlRTS5Polv18kM2M/CnYTrXIy
 48HQAowACm2ZnPPq7JATN9z/gUvf5tBPCXi+763DMsiHvPIS0liDDnLvSwESS2KLznYr
 jfgoE75sMWTO3DpwWAeW85Ep9srcRDRZ4/XlXr31+i2XlAzWSL3MxLu8uwD0gbIXpxPN
 ry3UJKcfx2iiQjiAiBNsRmf4smgtcyhIMM1nOPEOh0KYeQlpcTQhHJMBzzRzkEt7G/U7
 a5GXrMPOTerHEosGBvMrs+PY4gtZ2oXY9zXWlvuXpRNz3pd9HH08trWUvRAkM/X1mGA4
 rM0w==
X-Gm-Message-State: AC+VfDy3jIBym9TrXcQhQsNKHa+w9rW7OSAz3nnZf7RCG6giowX6ZcyL
 09erMIm0W8w56yYut3XXLeob1HhzouF91wjOTAJeGyESQv8=
X-Google-Smtp-Source: ACHHUZ6EZmq+uzu/KwwTYQsK6aAc7n0cxnLcRR2RDxQEX79CNo48CfXnlD/1996rvfSVVG8p+mNssQ==
X-Received: by 2002:a17:902:d4c7:b0:1a1:9020:f9c7 with SMTP id
 o7-20020a170902d4c700b001a19020f9c7mr3172472plg.44.1683184549388; 
 Thu, 04 May 2023 00:15:49 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 lr8-20020a17090b4b8800b0024752ff8061sm10721753pjb.12.2023.05.04.00.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 00:15:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 00:15:46 -0700
Message-Id: <20230504071546.3435096-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683184549; x=1685776549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ip2Sl3qx3oXf6O11SNAo4q6YcujOvY69j/cO43wQwOc=;
 b=ml1/KRi0vGacw6YQ08wSb/pEXWC3zvyhn/e62mLk+u0a2DR6AmAmXNEoQC3NxzwHM2
 5XXOaldpv/qd6eox6Z+H4pfO4xXoNptbWcjc113BFS6O4My1KPr75a5kt5er8C9V/XRg
 EwwTJso4ciQwnOkHKklgMsSB11pNdIoytbmUnHyryPVVp6HyMjAfRd53d25KB3hFGvuk
 tBxeofPtATK8QohULP01NfIPfBHKtSBcADgf8slU9GnRNuYMoOnRIvZ/P28HMNGztYjh
 FdPB7dCoY5D5+A/mXQOHSku79UQiBKkTAQf8iWnK0KaiBCkiNeQqiJDXNYVicf4cKZFg
 WBTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=ml1/KRi0
Subject: [Buildroot] [PATCH v2 1/1] package/fuse-overlayfs: bump version to
 1.11
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containers/fuse-overlayfs/releases/tag/v1.11

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - fix filename mistake in hash file

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index aa5438755e..0386687e6f 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4351eaed7cf26a5012c14c6e0fc883ef65a7b5dcc95ba129ce485904106c25a9  fuse-overlayfs-1.10.tar.gz
+sha256  d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed  fuse-overlayfs-1.11.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 1633d3bd41..4db2ccd7d5 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.10
+FUSE_OVERLAYFS_VERSION = 1.11
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
