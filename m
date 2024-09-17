Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A45ACAC5AA
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B499081E2E;
	Tue, 17 Sep 2024 21:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_IHxPa5udAm; Tue, 17 Sep 2024 21:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41F1A81E06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41F1A81E06;
	Tue, 17 Sep 2024 21:53:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6B331BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B56B74026F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkneSTOqRyrS for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:53:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97FB640118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97FB640118
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97FB640118
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:53:22 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a09dd37ceaso10136895ab.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726610002; x=1727214802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GnASIfELPxwo1GevWDrOw4xG3no5/ZzMEtOKcC86ixo=;
 b=Pnh0RrWIiSFN8ZC1H/75dEGC6byt4NWcTC3Dfwvzk5mk2uLC3KdpgbzaZBEGs26erb
 KvQS6toiE1hGhjs1F8ehpxEbJC/5eYuMcAEBaHPYn+IuJ8d4T9R6PesaYEjd2IQUKnYe
 qLrtEwsqF0i8M6FmL3yxGCzTVDzA2NQgo7hiFhM3ZXKqW5Ided9fiOHIvlay7bFr2ger
 qEaOAn0tz/6Nq2EU8M+8LF4AtHaFCr9CChJfEM5CQjmHjwE39Wf8iVbYDA7XEdX0Kx64
 5xlIKaTYXEZN1lbWDgde8WargCJCMgL6I67RaFc3HrTPp/WnI2Iyk+hyJJz1t7xPIM5L
 ASuQ==
X-Gm-Message-State: AOJu0YxhPekt+FA7GwSUoJxYgl0tclKnpbbOtxHIVgal94WLYzfjdqVF
 nV2puGziPJtpId7mmDpnpGFpF6N/K9KqawRPSiadEa9g+7g3B6pwdHxiAg==
X-Google-Smtp-Source: AGHT+IHmJ3spM5ROZupfKssOCuM5sVliI1taVxHg9swST8W9Ui5jACb40xhafVy2WgeYvrHlb+lCQQ==
X-Received: by 2002:a05:6e02:216a:b0:3a0:a08a:a0d3 with SMTP id
 e9e14a558f8ab-3a0a08aa209mr76420035ab.18.1726610001879; 
 Tue, 17 Sep 2024 14:53:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4677sm2159346173.31.2024.09.17.14.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:53:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:53:17 -0600
Message-Id: <20240917215317.83059-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726610002; x=1727214802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GnASIfELPxwo1GevWDrOw4xG3no5/ZzMEtOKcC86ixo=;
 b=NDd/wYSTLGeP0weGBZwxtjNlFhmBS03ClNXq3PIs1uLw+fg3zkLso1qMgkTeiKCdsK
 8/Zrc317Hgs/0rDax78gM4g/G0UgCs2HjkQHFypuwUcAA/JGaZekXSzJpprw+CqRVoDJ
 n1j2vThCSwk+ZSI7pJfpx/AYvzs+Bp3E/hNTR5Lk9Nsy7SHw/ibIZGm2d7Q3N6axY0Vf
 y0Hp+xgT249C1kXy6rN1Xdv14QY2Hha8Y2ws4oJmEpp1c9A4ilMHGqzmhSppm8httPi9
 xFA/UoGroV0cW6s+PzU97SPclNeHhBFrRKLVp+FXsezAn/y0mKXk3HDqP1azThvg7Wro
 o8GQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NDd/wYST
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: bump to version
 2.18.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index a742a05e52..0b5d2cfe72 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  7c059773b0f4808f9402eb0650de6bd4  pygments-2.17.2.tar.gz
-sha256  da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367  pygments-2.17.2.tar.gz
+md5  fbb7976df756f832f3391008778e8999  pygments-2.18.0.tar.gz
+sha256  786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199  pygments-2.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index e42f613cf1..084e164c1b 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.17.2
+PYTHON_PYGMENTS_VERSION = 2.18.0
 PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/55/59/8bccf4157baf25e4aa5a0bb7fa3ba8600907de105ebc22b0c78cfbf6f565
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/8e/62/8336eff65bcbc8e4cb5d05b55faf041285951b6e80f33e2bff2024788f31
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
