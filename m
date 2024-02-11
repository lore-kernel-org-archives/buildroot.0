Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28F9C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC40384D9E;
	Sun, 11 Feb 2024 21:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHinbZDNsxsK; Sun, 11 Feb 2024 21:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F3284E10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F3284E10;
	Sun, 11 Feb 2024 21:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3541BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 564DA41955
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fo7LZd5ocPv for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A54C41953
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A54C41953
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A54C41953
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:49:11 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7bf2c826a5aso136190539f.0
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 13:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707688150; x=1708292950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYescd7Y3U775GWTCn1+iOSW588Fle0k4h010PJ1UTQ=;
 b=ja4uXH2cPvhVi2tc9VL/jHubMNXNXTlNPoX5KCl3cV0xsCrCLgYZCneqHxqzKuqJyV
 IQXgu/qcnHlb6ueYFFBG2Kwt8B/kws54DaYar9TTcVhyz/iSoDyEtRUdkNk9DxCfQYyb
 w9WifeLPgG2QCqljKLDhrggy/U6MuUb18q6EfPKZdvI2GiNkL0Z+JbwXO5//LQkHWSaW
 DaiVSyp2zKpiKDdB+d8oj9KaR4lJgJYS/KKx3Mgn5YzpCbRPzASg/os3R9CwjH8WKqls
 WE0h7T3+7YVgKZcHyhuoJ+WWnV3+wWAqqQWbr/rWWAwv6c0DIPuNRRMSewbD37M84uWT
 SDRA==
X-Gm-Message-State: AOJu0YwItAOM9gtw8AmoNjMkh/KFZR84A6ZiTKpW3tAAENPGWGMgb2TH
 PERqCS5HxQrupb3xAuerpdAuS2XTa/WyNPvjgXyLeGmGQVh+fyrnZ8Km6wJGXuc=
X-Google-Smtp-Source: AGHT+IEBv4AwsENveN+NSHSDvpFcuCdK7CcrSFPW4j0BNfM3iu/DkLFfirUlqg40SaVYSDXYmgFctA==
X-Received: by 2002:a05:6602:71a:b0:7c4:4dd8:34b7 with SMTP id
 f26-20020a056602071a00b007c44dd834b7mr6098351iox.10.1707688149850; 
 Sun, 11 Feb 2024 13:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeWG47tLqec1MyKKPR2MOIH6bgMY4OJwkBZLeJJMmhcv2arbpnonYU79Q600pDIpyOdcJZhc2HUx7kLWGeyGTSrlTV5Pv5G5CavtIqlxUI8EBLtJiQqarfqlnApUqpkw/aZ92WYovOS7eaiBxtmqghpjDD0rKbuXGk8nT7Blyuej/8K808Slui0PO/HiUGdGB+9mrUnEG6l08LBbDKlBc=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 17-20020a5d9c11000000b007c41e541b8fsm1148747ioe.32.2024.02.11.13.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 13:49:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 14:49:04 -0700
Message-Id: <20240211214904.89575-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240211214904.89575-1-james.hilliard1@gmail.com>
References: <20240211214904.89575-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707688150; x=1708292950; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYescd7Y3U775GWTCn1+iOSW588Fle0k4h010PJ1UTQ=;
 b=DPLoGCzCrBkHiTuBCi5I4SfBHk2wDxJsRa8Xz/tF13NJRhYtyaf8HF+HUIa4QdAOZq
 2sSBAX5BP85RID1HpUZZO56L+/7uKfE0D1QoFmTqJAJuWtw7D8z2qMZzOfnWMHuUl4ga
 CwNtrjg5M1+h6UiOyDpzs/iRbXX4mE36bN946OA0M81pWPiaVqSX74h3vDG3X7ODYcRR
 A6xpyZXuOwnSu8PmIVsDBAaqSQSlbzkRe99jpxto9V+ZLUnuajxzEUW33gPEzNcaCGDa
 WLSuFCZMcSRk+I/aLmHL1ylQZvEGGS7CJ1fe0VHWYqxfv/K3X1UOW7tAMnX61tYonOL9
 ylKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DPLoGCzC
Subject: [Buildroot] [PATCH v2 2/2] package/python-cython: bump to version
 3.0.8
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to changing links from http to https:
https://github.com/cython/cython/commit/331d9d824ee5f0c539310332215ebd6ed3257325

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 6 +++---
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 08ad8f6d84..55e4a6f203 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  a4d0f9fbc9c137f1a88937cd40e8c5ee  Cython-0.29.36.tar.gz
-sha256  41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f  Cython-0.29.36.tar.gz
+md5  9f7baaa983e1bd06eaeb4fa0adfc77e5  Cython-3.0.8.tar.gz
+sha256  8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6  Cython-3.0.8.tar.gz
 # Locally computed sha256 checksums
-sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
+sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 47e105c065..d76bfb766d 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.36
+PYTHON_CYTHON_VERSION = 3.0.8
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/38/db/df0e99d6c5fe19ee5c981d22aad557be4bdeed3ecfae25d47b84b07f0f98
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/68/09/ffb61f29b8e3d207c444032b21328327d753e274ea081bc74e009827cc81
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
