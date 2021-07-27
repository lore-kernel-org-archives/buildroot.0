Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130F8C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:53:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6D360F6E
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE6D360F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82F1C4035C;
	Tue, 27 Jul 2021 21:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6tk1IZza83D; Tue, 27 Jul 2021 21:53:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD46F402F0;
	Tue, 27 Jul 2021 21:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1001BF2B1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 778ED606BA
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7GBYhAyggD6 for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 21:53:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 826A6606AE
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 21:53:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id u15so109969wmj.1
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8XSjOkTaaLsdUYWUHxcBFPWq+1yAv1ccjz96MouIltM=;
 b=DkWbPuLvN5N2Rg2MiJPO75ZB5YopL/vhl5qsEwytc/AHY5j0tW/qgElKsTx5zzRivr
 gnDd/+G0+PAciWSkFJksomyfpG5yWGUHVdFhNOwEOw6qjC4aTLa02+p2rPDYGRp/oGLg
 +ymdLs4knPzxh/FnYWJ5FkYHmWo9vROme8tS5xheSQiBfPKrMLCuqeAI/Fg4CeEN0rTQ
 ohBnyueLcAxAUt/49cKR17DazQWVK2KxFRXOwkBe+nIga2+57oXu0lBqWFOvd9foV0WW
 SkN3cx+FrV+kOKQj+Uc2UwQJqLxWDVXx7J2dalEuEK/8tDFxVTu648Do1FXE8jk2TUtX
 2fJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8XSjOkTaaLsdUYWUHxcBFPWq+1yAv1ccjz96MouIltM=;
 b=dIWjbG6hm7fZ49TkeIgAv6Rq1MCdbwJ4YZGOH6X9mty846j3Bn9XDPIWATwQOK1leE
 3DguqTfNYH2+iLt71SV68ZQaof8XR3btQiaCFOJWm+rPS4US87Kl2WOcFSqQKKR4vu9B
 29k7E/jP79gb49AVQzRr07n2URGwM9WBcKGNhNnchNxJi5kfzLXc9tt34bR2SBXrcN65
 RK/BPAD0SJHW5aAxTtP6jo3QCLTE+zgnDrdg0vESz1OiEFI8t6FvCPRwl41cV00JqDhx
 Naebb0NhDMxSYwYHqub8wNE+XBZRseIFoPZj11YLtsKNYgWFQ0HaSAzdQY1cNbl0fOIn
 5V7A==
X-Gm-Message-State: AOAM531rnqhjVHAJ1qXh0WjqJEyCSTfZvq9Rn8mDsI3vwxzmagPS0VgK
 xwCO2NTRfUKNAKg4ZN4YlIpHeC0sx3mZTQ==
X-Google-Smtp-Source: ABdhPJwnEkS5RluLdEw7CJI8Qd5vArNA/eb/9g47VSfYQoPLU4VxIznlAQGd1Oi/GBlO7SMn9iPLcQ==
X-Received: by 2002:a1c:3505:: with SMTP id c5mr5973136wma.53.1627422785446;
 Tue, 27 Jul 2021 14:53:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id o18sm4667845wrx.21.2021.07.27.14.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:53:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 23:52:34 +0200
Message-Id: <20210727215234.3397234-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv3: bump to version 3.4.15
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update hash of LICENSE (update in year:
https://github.com/opencv/opencv/commit/4f9cb3871a5d6552ef25229c2f81d2e1531c7df9)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.hash | 4 ++--
 package/opencv3/opencv3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 04eed67cfe..59af557198 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  70230049194ae03ed8bfaab6cd1388569aa1b5c482d8b50d3af1cd2ae5a0b95d  opencv3-3.4.13.tar.gz
-sha256  a5a7cf90fe5ac9763baad852cf69cf9d9b89bff934a679fdc5c8fcecaeba9a25  LICENSE
+sha256  b1e8470b18e9e793bf70b4ae051bbc9bf81fa45f8cbfee1e6c88858c90be8ff7  opencv3-3.4.15.tar.gz
+sha256  9076d3d934839a2f8e7bfe549abda6faea4751f1edd6e9460ff703559890ad5f  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 5c82da9975..f3511bbcb9 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.13
+OPENCV3_VERSION = 3.4.15
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
