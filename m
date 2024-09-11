Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471C9EE57D4
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 20:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF49D40240;
	Wed, 11 Sep 2024 20:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXUFEshsb78m; Wed, 11 Sep 2024 20:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 892B84014E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 892B84014E;
	Wed, 11 Sep 2024 20:31:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 572A51BF423
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 455F041964
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jztLxZT05djo for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 20:31:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AAF741883
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AAF741883
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AAF741883
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 20:31:04 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-39fd6a9acb6so1134485ab.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726086663; x=1726691463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f8QShl3cITma6lx29gSIAtMwDt8Ppv7nnZLMG4cYy6c=;
 b=imxPFwprK4i6p89GLTJDczAEg26e4Py3K8MjS0E4IEqk1pCXIsYoRdEX6NUPwM2hh7
 K89zrJCxTG/S/p2xXsIM5TH9vs1ersxeLcge339oPzKTeFG4RpcdNwDJoDxGfUbY6rnt
 R2pgrhvsGSwhfAWQO/aEfR89R213GsHyWK0VRtM5oqsIXnbDX02tYtweTtZqJW1w1enZ
 bBSLab9f75Ee+M81JHxyygR3XzVlOeGyZqnXY5d5z4xl+z40QCOQHaiSEWbPpjhJAqqO
 WNzgG+H2LefR8GmIWQ6Qub2r647RcAxZHZBkU1Pt+5zxVe9KNsdtXXunxJRELfP2Ssgh
 TmdQ==
X-Gm-Message-State: AOJu0Yz0d4Ygt1M1ZFckcTxBzV9Lla+pN2m5NAsQ7lcnxH+lNLcBK+pX
 ih/W1wAlxNRL4ygMZHYCM2a/8FyO8S+FF3zGtsnWB6o2OcFPa9MVqONYDA==
X-Google-Smtp-Source: AGHT+IGcBSrqcRmU/tGnu5SBzT+tq7LoDbPMI9bagkaU38SfLQWhBiO8xuoY0hCs/9XLZgqv3sGTrw==
X-Received: by 2002:a05:6e02:1a09:b0:3a0:4e2b:9ac0 with SMTP id
 e9e14a558f8ab-3a0848c91ddmr5911995ab.6.1726086663211; 
 Wed, 11 Sep 2024 13:31:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d35f8ff1dcsm181336173.150.2024.09.11.13.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 13:31:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 14:31:01 -0600
Message-Id: <20240911203101.802150-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726086663; x=1726691463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f8QShl3cITma6lx29gSIAtMwDt8Ppv7nnZLMG4cYy6c=;
 b=NMM+ukKzBZ4MICRxS9YVrT64TgWT2ZKG9Zd4ivDQJJjUCUNAxNNSQ16n0Vin+IMfxA
 XS3XFODL64tBTH08R/Ych3a58TNoCclcwG4P35TwWIIc2cstIOm0f6ev9uUYZ0yZ5yAV
 UUioscXPSZD0iPTBSqSUyZ/TZYNExkOuZRWRJfT3x5yZJ5UfMi9wPuHW2v+rq4xWqDr2
 4edFbpmfgqbV/h5XN/cVElqkIupmq2ydTA8D6VW/ZXOsLmXL/Gu3qs/GW5WqusI5/nfW
 DT+SA+D6wSutRJSKotADJ65pbGSfg4obHV/0sqGkmjSDx8fxCLnxT/kDwALC/ath2Pcu
 SS4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NMM+ukKz
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-jinja2: bump to
 version 1.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash | 4 ++--
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
index 0a7b7cc058..d24e7916b1 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
-md5  8f72451a7da006b4b91ef18ec6f75885  aiohttp-jinja2-1.5.1.tar.gz
-sha256  8d149b2a57d91f794b33a394ea5bc66b567f38c74a5a6a9477afc2450f105c01  aiohttp-jinja2-1.5.1.tar.gz
+md5  a71dfafdb279d067956f95719b12cb9a  aiohttp-jinja2-1.6.tar.gz
+sha256  a3a7ff5264e5bca52e8ae547bbfd0761b72495230d438d05b6c0915be619b0e2  aiohttp-jinja2-1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  d9d867affaeac220a60381cc544681dcd37c668ed6ea5ddbf9948617f828889a  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index 17f9a4018a..efd8c67cff 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_JINJA2_VERSION = 1.5.1
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.6
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/4e/4c/fadbfcc1269fa79e69fcdb29027840ab022a91471a5aeaa8fd8b27cc5406
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/e6/39/da5a94dd89b1af7241fb7fc99ae4e73505b5f898b540b6aba6dc7afe600e
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
