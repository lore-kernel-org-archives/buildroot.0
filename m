Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65894C432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 12:48:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D4C60041
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 12:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8D4C60041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B076F401C5;
	Wed,  1 Sep 2021 12:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BWKGamJhhmmc; Wed,  1 Sep 2021 12:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 144AF4018A;
	Wed,  1 Sep 2021 12:48:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABB221BF329
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 12:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B558400F6
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 12:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPiJ2uYHXz8u for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 12:48:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67AB04018A
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 12:48:42 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id p17so1331518qvo.8
 for <buildroot@buildroot.org>; Wed, 01 Sep 2021 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YJMgTPReRbwg+6KSS9UCwyK4hOXK7l3Yz0+eJPF/NQQ=;
 b=IGPrHd3SjAvgieFXGgEZMxotnbqPB9rNxj3paWadgDWfjNCEe386mlT6EpyIl1pl/j
 SlP5qo1/2MSn4WDDApEs48P+ir5RfCW9QWq+R5jPeuNZiYoKOSkAiGAfnU7GmRDvpRBc
 bxfz1ORYhZ4LtSFSUzYW/zIBhgjzyTJD3S+K3qk22wjAbN6ED5k1+ePRGSAWuWOSQT7I
 CvFPmDE04/Y1BELzaj6nZKZLk0CW0SltG04TQWLqY55F2rdRLqSNu8l4rhbcUUyLTPjo
 ex/DINj8oEgFs+r/lSLELAgYMyvGyNTz58oZGct31emMUjxU9+z9vXJpGSP3WNpc/H0I
 1xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YJMgTPReRbwg+6KSS9UCwyK4hOXK7l3Yz0+eJPF/NQQ=;
 b=ubBJJhpc30iNxUuxpxPJJu8qSqvLAW9p1oscfsSLGqXlzYeNkR2vfFX1ZzI1bCoRxc
 w0IYZ8zXwJE17t4SiQKwa4bNZUEEJkdzFaR13bf4EkswdQoSNUXej12hsON9+d6MT/0N
 6Hj2w8863n4olRf10Ss/FM81SdPO2GExVrYL7Amc83XIMpif/y1p7aM2lUKtbtnnF2MF
 YMJJkb5Vg6vXmUNGpmckeU+tKMvl9VOqxVzjQ+Ew+hdRscFnLYNuO2LRyLA3CE6F+8JE
 iJ2GI9fw4qX3viUsq/EYq8PQSOSqMahKlIkTRnV22ogtrrOGMTFM2JPp0QFIhxB3xW5p
 GFWw==
X-Gm-Message-State: AOAM530paDcrF97kMfT5Zrad7X66Q9mcrmhYKdq9Ku3+7nGYlG3TIbsv
 uTYBMv/N6K2YgOmc7gNSBHbRj4w98K0=
X-Google-Smtp-Source: ABdhPJxFASrcMcXUPKQUoDWEEeiQjReoarcglwujUiixjhUOtVp38u39NNajY4UcSEk4LmT01AIUYg==
X-Received: by 2002:a05:6214:20eb:: with SMTP id
 11mr34504103qvk.52.1630500519650; 
 Wed, 01 Sep 2021 05:48:39 -0700 (PDT)
Received: from blazer.lan
 (bras-base-mtrlpq4718w-grc-09-142-113-8-172.dsl.bell.ca. [142.113.8.172])
 by smtp.gmail.com with ESMTPSA id s28sm15950721qkm.43.2021.09.01.05.48.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:48:38 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Sep 2021 08:48:37 -0400
Message-Id: <20210901124837.201278-1-ashcharles@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] pru-software-support: bump to latest version
 5.8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update to the latest version of the PRU software support [1]. The
license file remains the same.

[1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index cd81488e1b..8345c2724e 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,3 +1,3 @@
 # Locally-calculated hash
-sha256  57e47128dc5437c5a64d4ef94f419d9ea38e894c0c31ab10cad99c0da614b296  pru-software-support-package-v5.7.0.tar.gz
+sha256  e9256533a6901d31cd12b4ca1c1638b795d316a966967783a8d573e75a6f9d77 pru-software-support-package-v5.8.0.tar.gz
 sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 91f41bcb91..7c1b520290 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 5.7.0
+PRU_SOFTWARE_SUPPORT_VERSION = 5.8.0
 PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
 PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
 PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, Public Domain
-- 
2.26.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
