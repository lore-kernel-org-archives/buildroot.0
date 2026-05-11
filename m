Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92367CD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 07:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4970C6085D;
	Mon, 11 May 2026 07:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAN-23sCXU7D; Mon, 11 May 2026 07:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 488B560858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778484689;
	bh=OOPamnWpP44ajt94/CgcV0C3KSy/qMmCDhf62Y/+dmY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=G5rvlseSCEOxnGCnejR7eEnXktHLcKHluiaaUWgVTgTFiFkirhxn1fMv3vEw/sxpK
	 kBKbk5AIh6h3KWpH9UsOinMJJrYlgDndfkkLTj1Bf/PpCKTiifKRJENOgJgVRxCdhQ
	 DM4/fTOXfYiU0Kg9qt0Xkywq9kmTPub6aJpV9pUDL+Q6tTX/P5VUPlEk0iSK2AmW5Q
	 PhzKF/8HN7VhD/3o6Bp06/aiHjIambHwPVQaE8KH4oeTSc3kztEM1V/i4A5acVge60
	 93jZlNabKWzvtb4clRbUwrh6bu9pfaspUpneBN+qRFOK1128vSP4BxlDYXiYGMLXnI
	 hLC8fx/kC7TYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 488B560858;
	Mon, 11 May 2026 07:31:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88637223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 07:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7288C84475
 for <buildroot@buildroot.org>; Mon, 11 May 2026 07:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwKqF6Md-boW for <buildroot@buildroot.org>;
 Mon, 11 May 2026 07:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E39884145
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E39884145
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E39884145
 for <buildroot@busybox.net>; Mon, 11 May 2026 07:31:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso46686635e9.1
 for <buildroot@busybox.net>; Mon, 11 May 2026 00:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778484684; x=1779089484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SMIHv7AVT75Ucp//s1uT62kHgLoDU7ML7eJ1q1IAzCk=;
 b=D8Qrvpaaw+ONswu5YXgJfvnd7uMD+f1rxfP5rEu9iSXp501vG6uMzRtLSPd+F5Ovh+
 W1mFlIu4TvYhC0YyxJvy9tX7kLClBuMlNISR7dCfQvEaf2tCXJvNsEaqoO6s/B1zrTgd
 yXSJy8HNlD5pAG7LwLyjNwXdS0jPAm9QOwfjj88O3dxNNeFMGIkiBCaqyiTUBIlzZQQ9
 R5bIIRJL1sZh7u0xy1WeFNMN8BE36ITAYhznX0+VLzlGQ2silq9SyHf6EbqNPbQqiyVj
 TDw7PptN/FTf7iZ5KutY4GbNUY36CgR3rATzPdX1DjQu1quyrUfqZzDF3+OxxljeLABO
 4UZA==
X-Gm-Message-State: AOJu0YzG16bGuh2TYdZPOQNlC5crNoiH2bTFxD+jqM5xg9F9KQA1DT9f
 II373dHoF2xTUa0JfnK1uofonynCjlmB4PaHldKxExZwiC/n200CiBkNWbsejuxJpg28xYGJiGm
 4o05zGOlP
X-Gm-Gg: Acq92OGmhkWGYrehl0E/lRsMbiyxkIaiEcVSWiyg8IdQhSDLf8dXYfk/LX8ZtO6pXIO
 SaGsxUEp/eBzf8psXWChGO3UKlpBt/NB6r7pSe+t0zqFu7v7RH0nLdwt2TNAG40BvfaFNIFMIcN
 5gZexLsPaEqBaZVjBy2IsA2JzrubAWn2mb3BEQQZpnBbksLxxiS46OOAFJOwH9SZjdqJG3uccPU
 hMXi1GyzG+pnOsZXp67Vjc55C+Q+blbvMIfSNmZMj6zDyle3zMHXT3poqrHipBB+tdrVODdD6jZ
 cM2R15emtl6iU9v+4zCBo2AJNgxWLxp1m1hzbFjUHUAADBWd0RuPPuhFUMyej8nj1ZzvQM2QB7y
 8e3W1VMcE/tviqNGuJHQ8DvM8EdmmBBCs+xXxlTae2INW2rpQxu9Kg0N2sjagULcfv7VRyVjAIp
 KNel5KpFVUpA2/0RaS0K5ujqwASPEYhfBd79oXA1bUknSeqaBbtg==
X-Received: by 2002:a05:600c:358b:b0:48a:525b:e157 with SMTP id
 5b1f17b1804b1-48e600c4865mr300334305e9.13.1778484681927; 
 Mon, 11 May 2026 00:31:21 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491cab9c2sm24773147f8f.31.2026.05.11.00.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 00:31:21 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 11 May 2026 09:31:18 +0200
Message-ID: <20260511073118.25876-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1778484684; x=1779089484; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SMIHv7AVT75Ucp//s1uT62kHgLoDU7ML7eJ1q1IAzCk=;
 b=ZCSXpdVFqPNso91kMASG42CIdnJB9emv/ccxt7hks8r+dI3E/paRkcNVRYi/QeKHL0
 C0bC17oeE5hwGyJqAbwTrub5ju2HO48bxDUAnphzOkL2VYWbFlSn4oMCn/oP1SnRIu2N
 9nrs9/TgCrfy9Q2noJk07RuCNXLfN16FYkWFKBVIK2noTQVyzaa5QUzr2WyHWVpQ7uT1
 zjFGd7KZKS8m2RdnrKkTJDFzjD36CtSnLHcwee8vB8UXhT0r3AQju4D4VBEMRBDfQu9F
 YnMC2IpSJRQmXqNzjAqZf12dW2+13UV224VCeUY/TS4HGUN/tig4jhy9nE+2pNZB6TQL
 iKtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=ZCSXpdVF
Subject: [Buildroot] [PATCH] package/expat: security bump to version 2.8.1
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fixes CVE-2026-45186

see https://github.com/libexpat/libexpat/blob/R_2_8_1/expat/Changes

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index a0f8b514a..5d34adfc8 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_0
-sha256  a37bfae0aa9775bd8521ebd85dc456d486f0ff31138f6c91fd902ea732624542  expat-2.8.0.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_1
+sha256  10b195ee78160a908388180a8fe3603d4e9a12f4755fbf5f3816b23a9d750da0  expat-2.8.1.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 07c209543..3b529c339 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.0
+EXPAT_VERSION = 2.8.1
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
