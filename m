Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF22C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC4BD60FDA
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC4BD60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ABFA401B7;
	Sun, 17 Oct 2021 09:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4uqIKMkUGyzk; Sun, 17 Oct 2021 09:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9426C4027A;
	Sun, 17 Oct 2021 09:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 299511BF3CD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1962D80F5E
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfKZ6Kwdgkpx for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 09:34:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195AB80EC3
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:34:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 z77-20020a1c7e50000000b0030db7b70b6bso7252777wmc.1
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t6GXvtdr2x2dS/pRisW7kWjqhccXAm1SGtsprMLYCWI=;
 b=XaqCtDKiC7M6LXGxb4EbGOjP7zVMe8iiIjAyy1puRGjn5KnkMLRi0pKLZ0KHurFrRe
 IyvqyQA+mswwkSIT9puKFVXyaF8Oj1yYvroUNor2jng4exY9FubPbakIK6e6tuD2u2N6
 WmF0z0TpuZhflQIp42OkzGiLKvB5phHdUXFNlMEC+N09iUd4xVvfjtIzzfwJEaAQES89
 Z1tFi7dcx51TBfcZQ1Iy6CEQzJ/fUrOtqRw1Y3drJoc5PUzYAJ8ZKCTy2sdDA8wUF32j
 oIv7zKs6DvYneW5nysSNpiO17bDJDrHjuRsPIPT4F+SGKEpTRAMBEyu+Ek7vbNrOGtoI
 i3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t6GXvtdr2x2dS/pRisW7kWjqhccXAm1SGtsprMLYCWI=;
 b=2KMAGiOvnJjjqGjCk1M6bKA8MoXEcsgwqhQ0vNTXXUjF0opsRhy5KK3O7YvoCklU4c
 ASKEI8vPP0pr0eq+82AFz6RXT2VHFykTsUsQyULvq5LJfOVkk7Y1KRJijCBX+li9P4H0
 qhlerH4Tb2X7v2Ty5TRoClOiMAipnr5raj/I8bxjpa3XQz/ZJRweB0NF+catZKa8Odc4
 ouLsVfxpUqttc71CUC1TXFez2XIBQ2RaBy7RvFdEBAZ7QYZVZ8gI7YkGnyHPAd1xjbrP
 sI4BNhVeFDw4a38GKKNomGbXEPwnfVq7fIP9cAm0uIwkiYzKEURIh9j6adzKJaJo9bXx
 u5CQ==
X-Gm-Message-State: AOAM532ZO4rMOOdfT7Z7ZPUphM0pJFjIgS6g8vS+BV3n98BmxVCytN3D
 6GwUdX5rDceGIa1X+sDAPalT61pRR8M=
X-Google-Smtp-Source: ABdhPJxKbaiFlvqYnN5fJvCUgicpTpUDH0GscSSiQShdGVzjGAwyOQgxpWRBJKq++XdlFAH0yr3hSQ==
X-Received: by 2002:a1c:158:: with SMTP id 85mr36152449wmb.187.1634463248150; 
 Sun, 17 Oct 2021 02:34:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id w2sm9454438wrt.31.2021.10.17.02.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 02:34:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 11:32:28 +0200
Message-Id: <20211017093228.984724-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hidapi: bump to version 0.11.0
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

This bump will fix the following build failure raised since
bump of autoconf to version 2.71 in commit
ecd54b65c1f998a7ccd91f7c523e4ff38c4781da thanks to
https://github.com/libusb/hidapi/commit/d15d594a415e5f51d2cd8ff8bb77b3765a539b98:

configure.ac:16: error: AC_CONFIG_MACRO_DIR can only be used once

https://github.com/libusb/hidapi/releases/tag/hidapi-0.11.0

Fixes:
 - http://autobuild.buildroot.org/results/4e55332625b7e55b338368e231f7bc6086403a04

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hidapi/hidapi.hash | 2 +-
 package/hidapi/hidapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hidapi/hidapi.hash b/package/hidapi/hidapi.hash
index b49b6d1f91..95046386a7 100644
--- a/package/hidapi/hidapi.hash
+++ b/package/hidapi/hidapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f71dd8a1f46979c17ee521bc2117573872bbf040f8a4750e492271fc141f2644  hidapi-0.10.1.tar.gz
+sha256  391d8e52f2d6a5cf76e2b0c079cfefe25497ba1d4659131297081fc0cd744632  hidapi-0.11.0.tar.gz
 sha256  7d3b087c34f35d4d538e3bcddd1ff8f66e92f9ef336881999482800ddf840913  LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-gpl3.txt
 sha256  30eb1bef29b46f8ba7ab8b416035dbd93cb034a45481dd97815b944284582cd2  LICENSE-bsd.txt
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 7598ef7fb9..9341f0186c 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIDAPI_VERSION = 0.10.1
+HIDAPI_VERSION = 0.11.0
 HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
