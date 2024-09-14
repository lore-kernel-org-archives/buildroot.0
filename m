Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C11EFC6176
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BBA40B3C;
	Sat, 14 Sep 2024 22:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wpk6z0cnFVvN; Sat, 14 Sep 2024 22:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F7540B83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F7540B83;
	Sat, 14 Sep 2024 22:38:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90A161BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8041C84107
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlgHHS7OjAv3 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7577684115
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7577684115
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7577684115
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:38:53 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82aa4fd82a4so110814039f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726353532; x=1726958332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RqKnXITTw6hcRnAWqs/y+2N6ccNirmz6NYwQiVTKIJ8=;
 b=dzselFRBeCBRcP5plKcseeeq7zahimntODiGT9sEZq1WRXXzNISLFAmsr4F8BsaNUj
 DjpWCfvr88Ujk/5iU0F2G7ZKIfwkGSaVBuzUgW80iorNd0aheDQpJdbsOjxChf/0nO2c
 NeY5eS3fGJmKJa7X6uzxVoY6jeYRwVPXyPG6IGJbXKDLBm62vAm9m41q6cqIiVUIOzsT
 Cir30szWDGTKup0xdhAy954F8no9BFqcgecFE2iEZNRSuso70iFEPnlcAjGNDnZvD6D6
 lil5dzxUAz9D+Qm/V5juWZC9qbBoJZAMbkRI+en39LukLwwMIj+2yUgPxRdZ1wRFTkbP
 rkSQ==
X-Gm-Message-State: AOJu0Yx77kRt95fjQ77Sc01kgudo765GKfzm4GEXvb7jUsYBeQKJF3GK
 qoMvFAskLrV/SvOB1KzluOW/pd8bc/hlY0VzM1m6fZlNl4qsbPUyn4UZcw==
X-Google-Smtp-Source: AGHT+IHZ4IJLJmeXJTvHBTXPE5FZIGfrlPgwP3URr9GESyFuVeHSPfGJ1kWaYIxKq/AS0SKFy8nroQ==
X-Received: by 2002:a05:6602:2c81:b0:82a:4480:badc with SMTP id
 ca18e2360f4ac-82d1f95a0a8mr1093269039f.10.1726353532043; 
 Sat, 14 Sep 2024 15:38:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d4asm593817173.90.2024.09.14.15.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:38:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:38:48 -0600
Message-Id: <20240914223848.1361482-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726353532; x=1726958332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RqKnXITTw6hcRnAWqs/y+2N6ccNirmz6NYwQiVTKIJ8=;
 b=InuFQX5Nx4+Ck1EukbD3i4im2N831//zMtdUE01w4eFpPZEPdE1eVN0o41ud/JFBoh
 nmVIuQrWMf8iaxZ78h0YbarIi+Y+weSZQZuT8K+CerP7kFhNk5GEwM/Gtfa0QwZ//qM9
 7Uc+ruE41GMuVNvspDlYAIDn+klpKmLMk0l7wne4zJa5WGCYDSjq7+y1RG7XpheNBSPa
 BlZcGjHXSiXD7bMfdXGf0VZt23vY0hzzFVVDuxMQUgkQdNB5WQcUD7VUrEIU3N1N1Lon
 q5ypmz82uD1AiAOgw9OLsecSIqpEvXc8bLr+iObgPIjAPmKr1ECSC10Hu/d+iKy9KMt7
 qOxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=InuFQX5N
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.35.19
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 47fb30f960..3bb00446d6 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  6c8ba4112df2c114c71522330deb0f9a  botocore-1.34.14.tar.gz
-sha256  041bed0852649cab7e4dcd4d87f9d1cc084467fb846e5b60015e014761d96414  botocore-1.34.14.tar.gz
+md5  cd8e35723318fb0d66604ee290804bd9  botocore-1.35.19.tar.gz
+sha256  42d6d8db7250cbd7899f786f9861e02cab17dc238f64d6acb976098ed9809625  botocore-1.35.19.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 485e973135..24caf71b91 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.34.14
+PYTHON_BOTOCORE_VERSION = 1.35.19
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/6d/a5aaf38f980060d17905398301033e9eb45c2552bf281fa7fd4c8e23ebdd
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/68/e4/d0114af2ec0495c7b415b5a739a3f5b7c35a4e0b7ecfd1a7ea533606f834
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
