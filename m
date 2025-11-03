Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9604CCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 18:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B65240514;
	Mon,  3 Nov 2025 18:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylC-0fIcRi5F; Mon,  3 Nov 2025 18:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 934644059C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 934644059C;
	Mon,  3 Nov 2025 18:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2EB9278
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 18:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D951F80E2A
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 18:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PKipxXFW2ue for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 18:38:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD96680E28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD96680E28
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD96680E28
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 18:38:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so2651773f8f.2
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 10:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762195101; x=1762799901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=boqDgBjjwPNJ3SLu1mmcwdYhH3ppprDkvdjlyLuk564=;
 b=EikVc6DzFHst06SEcNJpzFXx8DBA/1odgnIRBYkVmMPcvsHEynWP2+8jPw+wf74aZX
 J4mow6s+rUbpomEA3xcPuAqa7xBIbglmLLdX3UBo2R21qIXuQequP+XsoUz6XZX2Vp+0
 TeBIriUrIIE0hZmyzVvpXk8SGN+HcEv7KNrriATtMIUs0TUOM24EzrRSfn4bHRqwn/Rm
 jjrgRUShv+uz+UnjGc9dcs3n8hcVmqicFOJa1nf8EoEJn3A4gFP0fHa8qfa19UQVFC2H
 AO0lEnW78j0oXezyozrlYlU4WIcwxAB7Q+IDl3JCM3LhIVzgfvqqrDVLW9NZGxcnGXcr
 Ka9A==
X-Gm-Message-State: AOJu0Yyza8ZzOumIxOoI3yPfj3jgslKM+a8CeBD4VZkrkDEDu9M4cJA/
 LBElsttOWU+OEQQhCf9Rsue6mgRSbX+kVmTxoWWtxxWFc1/eGKOTx5FGvvQGFGAF8VKPypNyI7e
 FreWz
X-Gm-Gg: ASbGncsY6UkjXVa/L5lIhBvtw0weXCRAnEGjzcwSwUXZsdKrP8ZtebzA9BJ0KTMQO1K
 /IQEWWbDo00K1Ie4JBXEyME50HzMD6Hb5wqj/tlAhDioIXAouVqlBUgRR5aHHJzMyIAB7EY+RGE
 O/tpx4HR+JfwHqfhlkFUJqPMjp7lN7dYfiCDFwIlYP0lRb3NSY/+7TdbfG0enaXJvXuhPAuA5S2
 3wVVKIfTHulmiANNMGjE8xy0u6NI5TQdvlbfj5vjtr/TE0pntpDmSjPnkpfcSabEmuPd7c8C/8v
 Be2T9u7XwH4ViGKojIhHhWfj0Mv7iBWABRFipT1r1n8oA73foQtcliFo7LV9goOOz7FlRxpFJ8a
 ZVubb/RIlc+AYfFMT9H+yvIbitNA9b3ZvUqfdeGTbh3EUNHHp8Zv41hXoa0dcH8lMBiGtJ/wrpF
 aC8DBQXX4BgQWZ0w1WcZrEogwTMV6QNguUKJ2YOFO7xhmrniH6kgE=
X-Google-Smtp-Source: AGHT+IGS651ustwDelZ5QiEaTobEm6yzw+/IjH4Rm9Lc3lg8pRNjkvz4f7Lolj+8PvwcDldmUpHehA==
X-Received: by 2002:a05:6000:2010:b0:429:cc1c:c2e with SMTP id
 ffacd0b85a97d-429cc1c0e3emr5160079f8f.1.1762195101354; 
 Mon, 03 Nov 2025 10:38:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.142])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c394f17sm170617255e9.14.2025.11.03.10.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 10:38:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  3 Nov 2025 19:38:15 +0100
Message-ID: <20251103183815.12051-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762195101; x=1762799901;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=boqDgBjjwPNJ3SLu1mmcwdYhH3ppprDkvdjlyLuk564=;
 b=WJARfU5Uly0n27XKvvseREtFj4WCgMWOnTBf8fLNgKPmNp4oHiV5UlFqr4riCFMvPa
 RlNquym3cyW/IscKZLLUED+AbsmcOziOcodaYNArmY93EpDqqDuyrw5fsvhq4V2vOLsL
 m45rVX/d/Fcq5+NdUyVhQR+l0DOQLh9BRHrPg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WJARfU5U
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 5bf5157e7fcb..0a71218a3008 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  2f71c0661fc4a46e2dd56b7651cf3bb5928b499a4b10df31efc1a4241edf0043  armadillo-15.2.0.tar.xz
+sha256  a5b8109da3c169802f51a14d3bd1246395c24bbca55601760b0c96a3c0b2f8fa  armadillo-15.2.1.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 359c83ef5fc3..ee218dda3447 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.0
+ARMADILLO_VERSION = 15.2.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
