Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C113C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D2260F3A
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6D2260F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 747984049C;
	Sat, 31 Jul 2021 11:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FgLoJAiNKcW; Sat, 31 Jul 2021 11:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E42F040497;
	Sat, 31 Jul 2021 11:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8141BF846
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C76583938
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yw9PodXNWb8K for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 11:43:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 832A183B6A
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 11:43:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c16so14839002wrp.13
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 04:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Tg7Ftj+s0caFmiCfU8m0LbHHlRHGeMi47Af0fNsYCk=;
 b=py91KhhaexF8gEgVka99zi1GD0iIWVI/1DeRxO7lV1FmaoSUj4IH7GOCmrDRRrnavq
 QHLwBCXQjyZQt5tfZry2vMWn2XwSWbYaB4xEis6LDPUyoMoQATlk2IB4d144h/2vS7ar
 e51evWQIhppdZWybEX1rdt+uvwMG2LPg3LYzy9w7lWsma5rD5b8AI2XvwU4+qonM0Uaz
 kWej56mbqoXD9cBOd+XwLtBDsPxv91kjNjBdsN5Sp7xSftQTS4DUNLUv/MXniJUzntTm
 6cKgQtBz2Ob5Tx6YSBmuZ6n38y/v7xItbvVT4D3xXHX3wPE6aweuQNFXnLR6PsSfRKUk
 /5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Tg7Ftj+s0caFmiCfU8m0LbHHlRHGeMi47Af0fNsYCk=;
 b=S9XVoUD6TzDNlw2QVQ9v1mkPBj/X7J/FCj1enyWqXsVlKHdE9LnaT3p1/Ndpm+qr2v
 NLae4nSQYB87fay7A9Guz08G0ls9uyyvto8c5KHcH8VCqZbIF64SwN34CljQJ9rRfRsL
 SBnGV/T4O07tu1Z8uJmGp/TnIweeGjkGqGIyKW4Up1IWsC/+Wz85hZ/T4PkITL+vrtin
 Zu58ClR+yJMdSL6XSnpcgibMl1VX5pCQiRD6XLUmU0OfcC+8FlLkkfotNuYAJWbMBVP5
 +cPp/U2vsB+9tL9Cr2aLn3bW6FTVm42DOtwDB8K6lKSMQqFdYVqLAU0oThO99YiTdmBz
 Q05g==
X-Gm-Message-State: AOAM531Lg/OQRAzNgOdLe9bn8bdNe92dSIxQgMJip4xx56hYIpTIvJmw
 ma3fBJ93evHRozWisgZA62vtcM0mTk69bQ==
X-Google-Smtp-Source: ABdhPJwYe3JmkaBmSLX0LTuTYSVAlFqN6anY3qG+sYCVIpgFG44RB04ZrA88k6XU3XL/v97ahJTPNw==
X-Received: by 2002:a5d:6c63:: with SMTP id r3mr7887362wrz.405.1627731784516; 
 Sat, 31 Jul 2021 04:43:04 -0700 (PDT)
Received: from kali.home (pop.92-184-116-140.mobile.abo.orange.fr.
 [92.184.116.140])
 by smtp.gmail.com with ESMTPSA id t1sm4585343wrm.42.2021.07.31.04.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 04:43:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 13:42:56 +0200
Message-Id: <20210731114256.734411-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nut: fix SELinux
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add apache module as for now it is unconditionally used in nut.fc to
fix build failure raised since 991c33e61cbc161d2e4735919591157a61fe07fe

Fixes:
 - http://autobuild.buildroot.org/results/bac65366065d332e250a12f15523f071ce7ee51c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nut/nut.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 3f214c5606..db0247dc2c 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -8,7 +8,7 @@ NUT_VERSION = 03c3bbe8df9a2caf3c09c120ae7045d35af99b76
 NUT_SITE = $(call github,networkupstools,nut,$(NUT_VERSION))
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
-NUT_SELINUX_MODULES = nut
+NUT_SELINUX_MODULES = apache nut
 NUT_INSTALL_STAGING = YES
 NUT_DEPENDENCIES = host-pkgconf host-perl
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
