Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790DAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:25:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD2961139
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CD2961139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E208C6066E;
	Thu,  7 Oct 2021 21:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vp0x7og7Cyh; Thu,  7 Oct 2021 21:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 465896066B;
	Thu,  7 Oct 2021 21:25:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23ABA1BF866
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 135F96066B
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzsBTt1ZP__t for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 21:25:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5E0460663
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 21:25:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u18so23207497wrg.5
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0+NZYkXKiKsdM5ajzQh5ACB3xAC1Q8UHU83yx6q3PGA=;
 b=QmN8jUxkLivAH3GFcLf2Rgb9nOKxW0ILbwS1hJtz/R6Wjw4HI1PhSbZA1zfYlsyxhl
 caHpbhC+ATCbhTEivKdQCGN9ehUODViow2YbOeShD2XpLnPKCy2AxFcU0+nU0weV0sS3
 Q6f9q2+mqejqZPXY3+u/XxlIyfebA8VxMQIx+MWrrpAG6E7mk+9BNe3ITIqPdxY1Rxdo
 sBu3dTiD746dyohD5MZJ6mjMZ4aaGAeRkkk2zAtd1LYwDz+QCh7zB2M8/xAyK1A/xOVn
 pKCli4+k4v3TrqOXT7INIpNA6zuKrYwBssNYAskynD+1wmVNXQeGfLXab5jGIm5rUyuf
 yIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0+NZYkXKiKsdM5ajzQh5ACB3xAC1Q8UHU83yx6q3PGA=;
 b=ujTHoqb/2uu8ZcniSvt+kme4TPrULELK8+5bOUUzoViKHZmCm+kdvwAPt8kcpvlZon
 da5U3OYIolClQigV9D+ptC/KjhBr1UPq725Qsi9Sxit7mVE8e/SNP5aunc+1uoaRuHPU
 ICIZS6K5s/rIeKD5bPACRy7uxs42DlN52Qg3R3gTFk0M64zN6crzrCL3Aw5hM7Pc452p
 ddPhPJpuNp+irkivMPVpCOchuHM90uGiuRKFqwXHUcdCi8e0b6SHA8jfDV01bB+cS4WJ
 t63H7eH56QHl+OK5Shup8ET0hD2IZSRpFCt4ixpSe55mLUZ7HBMn+WMexf2u2Z5g6ZDi
 51pQ==
X-Gm-Message-State: AOAM530RPWbcbKYVkyyOyLFxeAavOOSMfuPrANV7Rn6PkyKMMNT23GQ4
 a6v81PFNhnPCpZpj9yJl2JRRW40BuOE=
X-Google-Smtp-Source: ABdhPJz3+gouNuDYlarOtA64pEwMyVwtqpZ8kZTTccP1zcE8NwdKbAbXGpGCVrVwjJ8wQZbydnvBAA==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr8202500wri.391.1633641907604; 
 Thu, 07 Oct 2021 14:25:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id d2sm499188wrc.32.2021.10.07.14.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 14:25:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 23:24:16 +0200
Message-Id: <20211007212416.3927738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgphoto2: bump to version 2.5.27
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/gphoto/libgphoto2/releases/tag/v2.5.27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgphoto2/libgphoto2.hash | 5 +----
 package/libgphoto2/libgphoto2.mk   | 8 +++-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index e405735c8b..af52b47dc8 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,6 +1,3 @@
-# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.26/
-sha1  38373ef7f76e90492ffca309094487fb1474f3fe  libgphoto2-2.5.26.tar.bz2
-
 # Locally calculated hash
-sha256  7740fea3cbb78489071cdfec06c07fab528e69e27ac82734eae6a73eaeeabcd4  libgphoto2-2.5.26.tar.bz2
+sha256  a7253bd18c6ef65352150ac36a668f883a5ad2634eb6455b3ca9aa6ac98d0073  libgphoto2-2.5.27.tar.xz
 sha256  ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee  COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 1d42ba862f..c1d5352c00 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.26
-LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
-# Project is maintained on github but github tarball doesn't have
-# configure, so use tarballs from SourceForge
-LIBGPHOTO2_SITE = https://downloads.sourceforge.net/project/gphoto/libgphoto/$(LIBGPHOTO2_VERSION)
+LIBGPHOTO2_VERSION = 2.5.27
+LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
+LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
 	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
 # There is a single license file for the LGPL-2.1, no license files
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
