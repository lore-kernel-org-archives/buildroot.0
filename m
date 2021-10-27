Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3217BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 21:53:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE9FB61039
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 21:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE9FB61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E16040104;
	Wed, 27 Oct 2021 21:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mgcR-gH793P3; Wed, 27 Oct 2021 21:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CE714017C;
	Wed, 27 Oct 2021 21:53:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0DE61BF34A
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 21:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FEB360821
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 21:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCCq3fYAiMA2 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 21:53:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 838116071D
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 21:53:13 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id z200so3054969wmc.1
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 14:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ninmIHlvi4wult0IwgAIkYqUvEacb6StkmADetSCyAs=;
 b=RKVGWsYBW1+n0z4z3RI4BoxcxRNvfLM2uY25mLUCkcY2tFUN+9kfJR8+VTYpKEpFex
 OQNlYQfUYw9lmkhKH1vRVgYFuulT242IjGDvFTikJi8MY8/JVJ+EJ/+E1M12DBt8qhsj
 aKVRVCKgABK4P9vJKIDwJmRPklyzdN9dxYOvuh/o2u+NTJ9cV5PNFDiiXgkO2aIII6fa
 nMFojYIbNJGR3tpOX9XxDxFWaB/5YKnmFhMPonzfVKPVZ2lPxSvcjfNWSSsnGCsil4FK
 GqrOqMqt7WJ1+8najvfZp8jdOpHTEPkPjyP6kLmIwefXcVmKcf4UjsTghuP0hOG41nrb
 64gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ninmIHlvi4wult0IwgAIkYqUvEacb6StkmADetSCyAs=;
 b=2I5BgpCl68bz3UYKhTd6BgQuE+3GwKaX37hTPOJh3qYVnLxbgJnAdCBQgoj9iX5XBc
 +HskayhhVBr/JOsa8cVQaTlh1PLJqNCD+5ERz5gDpzU5owtZqcB593qdhD4d6MxWCsWG
 OLEkdep0p2SvLqr0vTZH6Ufc/k13mUQurMJAVKcDt2ZCMpkGDu4eSJE8Iebpw46Tbuy9
 SpdAwZdwI5vFULWZZl8radw12r/euTnzxBxqJ3DHSuMcf6YdyVxynSSQ5BLCrKfSOXoO
 ItAc4MvvZr0vC0/YPLRBcyKwpaNBYJyJsIcKfVLwq5gRsx9+MRdq4gx95iyIlLJWHhx/
 X9Lw==
X-Gm-Message-State: AOAM532MsBfGoaV6E4O8bMroMFp5dqm5pxUq4lxTU75RJ1nC45UbGzr0
 L/snI4GbQBYLLzHPPYXXD4tXipSPx68=
X-Google-Smtp-Source: ABdhPJxrntO6MPMl0HKk7vsnJYSKRg0Zh7u5ToXY29wTFXIDRg3NJXrkPaps+piIoqU7V9OpJWzUKg==
X-Received: by 2002:a1c:1d0:: with SMTP id 199mr342468wmb.55.1635371591279;
 Wed, 27 Oct 2021 14:53:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id m3sm2164588wms.25.2021.10.27.14.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:53:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 23:51:33 +0200
Message-Id: <20211027215133.859418-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fltk: bump to version 1.3.7
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

Update indentation in hash file (two spaces)

https://github.com/fltk/fltk/blob/release-1.3.7/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fltk/fltk.hash | 8 ++++----
 package/fltk/fltk.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/fltk/fltk.hash b/package/fltk/fltk.hash
index f3430e41f9..f8afe0c43b 100644
--- a/package/fltk/fltk.hash
+++ b/package/fltk/fltk.hash
@@ -1,5 +1,5 @@
-# From http://www.fltk.org/software.php?VERSION=1.3.5
-md5 e85017defd5a03ae82e634311db87bbf fltk-1.3.5-source.tar.gz
+# From http://www.fltk.org/software.php?VERSION=1.3.7
+md5  b28470d0509d00633d21bee9b65167f8  fltk-1.3.7-source.tar.bz2
 # Locally generated
-sha256 8729b2a055f38c1636ba20f749de0853384c1d3e9d1a6b8d4d1305143e115702  fltk-1.3.5-source.tar.gz
-sha256 57dd381e713fb309fb7dd85c3c38b274557ecb333475d0f1d65a5f06ad85c9a6  COPYING
+sha256  5ff1e90766ff4216e78e9a19a9bf527e6258f04accccd4429e9bb829b01d690d  fltk-1.3.7-source.tar.bz2
+sha256  57dd381e713fb309fb7dd85c3c38b274557ecb333475d0f1d65a5f06ad85c9a6  COPYING
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 763ff612d3..7c26839343 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLTK_VERSION = 1.3.5
-FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
+FLTK_VERSION = 1.3.7
+FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.bz2
 FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
 # We force --libdir=/usr/lib, because by default, it is set to
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
