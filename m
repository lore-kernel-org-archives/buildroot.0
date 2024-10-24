Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1C7D0BB5F
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34CD9805AC;
	Thu, 24 Oct 2024 05:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzHtiff32yyB; Thu, 24 Oct 2024 05:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51FB58056C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51FB58056C;
	Thu, 24 Oct 2024 05:06:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50D2D27ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F7898054E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoArqn9q4WCo for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62A398056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A398056C
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62A398056C
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:06:24 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-83a9be2c028so19552939f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729746383; x=1730351183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0CZhWgWwk7eKwinFsg6o+fiUx+FAejeCv9DpH4pSwI=;
 b=TB+sSCa0auQfJzBrY80Fr6t/uiJTSCTyZ+fdco5YdbligxM9PPC1P7CIJZYrmS/M7Y
 FVBYCr3rMbjlFaGy7XkDCYoq4eivYOeQRrdQEQtssYstC7KWtBp63WrdtaMn80nkj5Bk
 1es1gXydxZvzN/yVwZoWaoEwTdagbzdhNAudRbXsKS29d1GCuXatgxyDepMBnc/Sw/Hb
 9bWaBqVsNE1HfB1/5a0M1MD2QDwQko2JHwf854Q+M0bNpenxmyGaloycLnfFBhS8A35N
 kPcHWT2LAilGD+hhDy70KW/YhrrDKjd5CHUTXQwM/bwKP4SEizQS7ym7HV9O4W8J4sPz
 JpIg==
X-Gm-Message-State: AOJu0YzOXeVtI0K68Lg8/7JdFdXG0dqtsOI2ASeAn2UZUT83HCUuKjMN
 YXGbIv6w4PumKDwhtlgPFHqsyb5nhSCUMgM5ueS5TBVhyQDXZ5W1N7+NiA==
X-Google-Smtp-Source: AGHT+IHZGTHNZqFt+zDU45eex82rTAiJck/c2Fe+m+Q+ZSgzflBjVIZIS/mEZLsMsKzvMWp3Ie8qPA==
X-Received: by 2002:a05:6602:3c8:b0:835:3ec0:9 with SMTP id
 ca18e2360f4ac-83af63f6959mr602832839f.15.1729746382920; 
 Wed, 23 Oct 2024 22:06:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a631e72sm2524057173.152.2024.10.23.22.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:06:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:06:15 -0600
Message-Id: <20241024050615.3387203-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729746383; x=1730351183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C0CZhWgWwk7eKwinFsg6o+fiUx+FAejeCv9DpH4pSwI=;
 b=kxg5nPNzfaRWs0O3w0egsBePY2z6wUSDKLTVcfRgfsYDVqu65710LWBr5q97egKZsF
 TOxehG29uTwkiI+Nfb2o8nOuw88LVTtBvagYZCAHxvFU2to4UZTG9DbACvxyLerNN8o3
 0J1G9aacaMLZOFIiCKSQaJns6Q2yQ1lUmIzrtNbfv4meszcsI/ME3op3gyj5gZ+ARc2b
 a8Q+03aa1z0nFDWGWPGGSN8VzfGPrXWrdKt2zMc5380N4Q2VhdTaORS40Wzjw3gh4UDV
 ey5V62tbvW91GKSykB3mmomdcoPy9mt8/4LNZqJdb0ent8T/YCr1ofmLMoyv8cQkWF6D
 KFug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kxg5nPNz
Subject: [Buildroot] [PATCH 1/1] package/python-traitlets: use hatch setup
 type
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-traitlets/python-traitlets.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index f8a5e2d95d..f0f99e3dfb 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -9,7 +9,6 @@ PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
 PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/eb/79/72064e6a701c2183016abbbfedaba506d81e30e232a68c9f0d6f6fcd1574
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = LICENSE
-PYTHON_TRAITLETS_SETUP_TYPE = pep517
-PYTHON_TRAITLETS_DEPENDENCIES = host-python-hatchling
+PYTHON_TRAITLETS_SETUP_TYPE = hatch
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
