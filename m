Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56832C87FCE
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 08:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6CF783F70;
	Sun, 27 Jul 2025 08:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJe1N9w-DbN5; Sun, 27 Jul 2025 08:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CCDA83D8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CCDA83D8B;
	Sun, 27 Jul 2025 08:23:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C32E3198
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 08:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A942383BA6
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 08:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QY1UdIgpwxl for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 08:22:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 415CD83D8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 415CD83D8B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 415CD83D8B
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 08:22:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1752320f8f.3
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 01:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753604575; x=1754209375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iBlQC3FXbkzZvyQO+Lay9TOWBKtBPyHXZa8sJn1GI1s=;
 b=KE6Jtsq4Uj0u5XpWtOhoK02UIFPwANOkjPag7eYechdvO3LJN86S8rhIO9jCKzotpe
 iFAUuqolBhZuDgEavyWYQXwZ6WZd/X7Wu4i/2oK5gshRdyJhk6wVvCBh1IZu0pG1seZG
 1KTQyLU2gLIazFsHMpquyTb1hZYsEkftuNwXRisj0vN4xONpXwo5pC45c/6z+AkBgKrq
 EEeTPURoPG3injB+CxAotqSlsKBf3O3AXrhwNcoAvqA5XQqWltYpRuet1p3UnJoWnnGJ
 g8WrQ6+jCNBesdfcNm726oEXEggPPVzxrybX2VTDU7vU5WNAcVac8t+tT0pyLUrAorJz
 mPig==
X-Gm-Message-State: AOJu0YyCWENkyjVFrmGcaML3FYTYiGNKnMjzW4fKaev5YQndSaJuS/cU
 NYrGQtEMEsaSkWaZJ1Pf3JWs7Vpv/MLFrTkF/h4fTzOIoSoCjURJMFXcTryysy1gsaY8vOd21tX
 bB5yB
X-Gm-Gg: ASbGncvRlT5Hri2MgtXOgFoqW1RvFxPT4y1nobTOIUwyCH+cAxPTBeo/tgkzJTxNB6U
 JaEIFFSuNgXH96CrRX/0LlUEAROuCEkMWO3VYdD0BAI6FsfxdrNwnLURSrWyRFoUpspqVind+kz
 cXbTGvuBNxlqSKMr5+1eisFsJxAeFLSHUOlkpak/IG7wycRPRNm07wFFSj4RMBjPmnW1H8IVr5l
 fPXzIfuxGrdeFo821KYfnfVxUQm1Hyg//HON/G/Cl3EmjB9fxgc384cMVbo/GH2+jHoWGT4PFpK
 zpDg9UJniMSPOKeXGyjUqVxkm54K+l0oXNKOUI8mMWtJQDtqpnAbY54Xr4/G3HR4O78E9ebp/Fp
 L6s8Kr9zPsO+aRA==
X-Google-Smtp-Source: AGHT+IGMTjZVotxVzYZWVmpOY7QioSR3ySoIBtPTp96B6aRf7es29efJiexBIKRRVGqP76oqLvVvEg==
X-Received: by 2002:a5d:64cf:0:b0:3b7:830f:6ad6 with SMTP id
 ffacd0b85a97d-3b7830f6f9amr1605922f8f.31.1753604574646; 
 Sun, 27 Jul 2025 01:22:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b7861d59efsm854251f8f.2.2025.07.27.01.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:22:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun, 27 Jul 2025 10:22:53 +0200
Message-ID: <20250727082253.883440-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753604575; x=1754209375; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iBlQC3FXbkzZvyQO+Lay9TOWBKtBPyHXZa8sJn1GI1s=;
 b=JNf15hw96bG6LSfNitSOrGFLfSWdIU3nSn+pgl1QG5eOVHOf1g2iKMvTu2V51CqfdC
 kWXDXbB5e21ZckdwoXVgi46+ISroyrqN6A9EQ1+IuGxZVYNiKscZVCgj8k9GAzwhdBBD
 IL784DZWpeqS1puMnmgTRKzjuzduxZ5KQgVVdS3O4XdacpqxmEejpZMGPe8z+agHvj/u
 D7CZiiBRGruJnawAvKZ4uPMkzoQy5gFvR0F1L67UthCYA7O6rN+YF2mOmI6OK1rzfodL
 qkfsVARrtqNjyocXO7LpLypTl0gM91ojrh+7y6sfDvKe1fJebxSx/DrC1h/R3dzGs45h
 WgeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JNf15hw9
Subject: [Buildroot] [PATCH] package/qpid-proton: update mirror url
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current mirror now only has the version 0.40.0 available.

Older version of apache packages moved to the "archive.apache.org"
location.

Fixes: https://autobuild.buildroot.org/results/853/853c354b9bde4408e122046496fd3f0e7ffb0b55
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qpid-proton/qpid-proton.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index fae6ecc413..1f92068f18 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -6,7 +6,7 @@
 
 QPID_PROTON_VERSION = 0.35.0
 QPID_PROTON_SITE = \
-	https://downloads.apache.org/qpid/proton/$(QPID_PROTON_VERSION)
+	https://archive.apache.org/dist/qpid/proton/$(QPID_PROTON_VERSION)
 QPID_PROTON_LICENSE = Apache-2.0
 QPID_PROTON_LICENSE_FILES = LICENSE.txt
 QPID_PROTON_CPE_ID_VENDOR = apache
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
