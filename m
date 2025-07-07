Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A733FC8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 06:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57DFD40794;
	Mon,  7 Jul 2025 06:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LjvZJSLuEiT; Mon,  7 Jul 2025 06:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C2C440770
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C2C440770;
	Mon,  7 Jul 2025 06:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD22912E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B01A5402D1
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mh4VjCEcejfs for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 06:05:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A78F740077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A78F740077
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A78F740077
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:05:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae0dd7ac1f5so500241566b.2
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 23:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751868314; x=1752473114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5CvjIc8wwNS7NftZ+LuBNecOArltM9EriCF/hmOvanA=;
 b=TCYqe7Dp7vpgHpsfT2aCerKR+Ri7x+/8QwcCzSUGxXOZsWagxmegldkLMoEi2ELfrY
 Ucnlu/4wftZDCxpurHgZAFXiABr8WCDHN584Fh2M9iA9MHuLYVRVo3PASba1tsDSHZ3J
 +wGPjaDVIlgDaHznZFclylRO5TaJ8QhJFwKdrMyrkKft3x0NDEVSJWgdqoOdNk2DlCfM
 Jv0pclYVCdQuGoVyj25Prmq0BPDs8iL67ENpeVViKTesW3YYOmJZbVlX0NiBcuibwllD
 B3mYYJLQwnlHM4T2DK/nt5hJ+fs/LjEIyNgdMF8S1kZ6xrsJqTD+7Vm4SEwZk4nMZrSJ
 /INA==
X-Gm-Message-State: AOJu0YzIzYAsgbGlP/Gr3GsxFXsbSBg2Rj1IuZ+58UWf8FWEfyQuau6z
 2VVJL4DzL05VUpLFHROKCzd+12icIMYeSaIKryt5ElOP4y2bUL0w7dt1EX6QAnaIsHj5AivF4Yb
 HCuHau7M=
X-Gm-Gg: ASbGncvMj1BoIidhu2lDPZ5hmglUhVPPJZAehtgCiysjq4BEH4GeaowsVCs+eTj9e0u
 atlPLQQvJXqMYoCOxVh7HscQnBhc1MpNGN/0FjJYUQAgYgmQFLAJkEjlwXgV4HJI3DDglq2Hqqw
 WAXt6gMDCC2+UNrc+vEBFLK2mwtjVBkbHW3cnaKwla1muxI9mgfQUZk1IK8/EyXd7UTQKmYMW05
 c+7R0DlmS9i0Lqzdy6DV1r7bF1s/lwUsJiii5wypeG1B6FzE8FGTfYhCvlQhxy4v0KW3CVpALuR
 V/rWJzXElFPj/Mos52iWmQOLPZZ5IUi6xpz2nS2z66qUCxyKt1QCttNDRtkmDSBT7LCzNsWdB8+
 ShSPmCr1Blez5ESDkx+Er
X-Google-Smtp-Source: AGHT+IFIptren9ixkFWgdunCPyv3Kf5UzFrjW9t8ahJwoRJ73b5lYsR8Y7gQzzMeYga8lmF9Q5DTpQ==
X-Received: by 2002:a17:907:dab:b0:ae0:c523:780c with SMTP id
 a640c23a62f3a-ae4108c85a2mr656116966b.5.1751868314030; 
 Sun, 06 Jul 2025 23:05:14 -0700 (PDT)
Received: from panicking.amarulasolutions.com ([2.197.36.176])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e6f46sm632882266b.5.2025.07.06.23.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:05:13 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  7 Jul 2025 08:05:06 +0200
Message-ID: <20250707060509.617632-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1751868314; x=1752473114;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5CvjIc8wwNS7NftZ+LuBNecOArltM9EriCF/hmOvanA=;
 b=oOLsoaQeqOt/Zbaktm62HQZ2eamU4mz0Prl2fyPlxtCnDrrI1SN2iqbkD2w8hFiIop
 ATV4aY29wQO7ebE8Yh+uNKGeIerigQONm6ygaHuxkdMkUomKQoZ7RqA7tOpj77BV0tyn
 izAd3cL99rtDwjYltDgbGgaAx8EGOpuXocLdI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oOLsoaQe
Subject: [Buildroot] [PATCH] package/python-spidev: bump to version 3.7
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is just a minor upgrade for fixed deprecation warning

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 package/python-spidev/python-spidev.hash | 4 ++--
 package/python-spidev/python-spidev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index cd8a24eb72..9dabbacc40 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/spidev/json
-md5  83a73279d6e823a9030c4315577bfae3  spidev-3.6.tar.gz
-sha256  14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b  spidev-3.6.tar.gz
+md5  3074b983c687b1ec3a80833a7508642d  spidev-3.7.tar.gz
+sha256  ce628a5ff489f45132679879bff5f455a66abf9751af01843850155b06ae92f0 spidev-3.7.tar.gz
 # Locally computed sha256 checksums
 sha256  510129bc8174c0fa81fa6d653691d1bd5d3555f7f38979ec45b5fc5bbff5377b  LICENSE
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index f48b5b0832..e93871c745 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.6
+PYTHON_SPIDEV_VERSION = 3.7
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/c7/d9/401c0a7be089e02826cf2c201f489876b601f15be100fe391ef9c2faed83
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/b5/99/dd50af8200e224ce9412ad01cdbeeb5b39b2d61acd72138f2b92c4a6d619
 PYTHON_SPIDEV_SETUP_TYPE = setuptools
 PYTHON_SPIDEV_LICENSE = MIT
 PYTHON_SPIDEV_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
