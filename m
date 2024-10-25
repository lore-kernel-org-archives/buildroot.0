Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B29CD149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 16:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A754078D;
	Fri, 25 Oct 2024 16:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JACZAHge56B6; Fri, 25 Oct 2024 16:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1DB740790
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DB740790;
	Fri, 25 Oct 2024 16:59:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FD402318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E6DF81F2A
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4qkn0szK8mC for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 16:59:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 550ED81F28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 550ED81F28
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 550ED81F28
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:59:01 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83aad8586d3so92384639f.1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 09:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729875540; x=1730480340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ugTSvsV63xkWzkUsOpmJoMZeSXk2mM9S1TqRGpJ8fvs=;
 b=l5l3wpElsrqsVdOSe4fR0797B9HSComf9g9wbAmRBBUzwQYuJmGbWNPEzAzswx9y9T
 ol1oH4AKsF8mamMqTjlXmfIjwox9foCHpRsLyPz1KSDBqn561hEQpJMk7nkpBSd4u98p
 vGu62pgKnVpiQ7P95EIa58B8nrvaHyV+/1PDf5Z6V1zf/zDRt3Hzvkv4b0p0xub6yMlF
 Y75oR+HzSKh7BWJIV+//p3fn5nw5OmvXzaY8fwbZ5xvow7goNqs5tabriCbtnQuu/lQZ
 jZx+OvbxqqoDO4SjVYgv61e558Z0iApNoSijxu1LkclbYxxRF5KGmnNGDk1LND+O+Pev
 tlfg==
X-Gm-Message-State: AOJu0YzSG9veIJNkFXfLQmDLf810DDVI3xwYnbN8CYLX455Haconj+fb
 5185ZpLasiSPsbZlJQvwJT69uYiwbd4eOn8jnx2DD0hHX1Bwdx44CWL4Jg==
X-Google-Smtp-Source: AGHT+IHVgMj1jUfU9TsaBS8aDTsrwhS7PMsJdpGNmYojeYW2o+Z2W615y6QCiCNzbICBktyYFacKVw==
X-Received: by 2002:a05:6e02:522:b0:3a3:3e17:994e with SMTP id
 e9e14a558f8ab-3a4d5963f47mr90832175ab.9.1729875539812; 
 Fri, 25 Oct 2024 09:58:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e568b0sm3517895ab.69.2024.10.25.09.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 09:58:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 10:58:56 -0600
Message-Id: <20241025165856.3524958-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729875540; x=1730480340; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ugTSvsV63xkWzkUsOpmJoMZeSXk2mM9S1TqRGpJ8fvs=;
 b=bmjVeiXorDuJqfrpTPQFkcy+1zFbnJM7Ficj65P5NHbAOa+Qs1hkuuNX73FOfqeG5j
 DA/D1gkJjq78YgzmG8YpxDURRiY36OEv/hVgisj7J3tfDCNqRrJnEpR97HrG6l7eTyC5
 hTz/cfSX6SB/OpAQ8RO2XwCRMC4YoRsJaplGPczVQf4rRhPVA94xvFZ/0oSR/7cBRKqQ
 XsNU4VgvXZYsYaK40c2ecO79493cDqdFmPXSLMzE4Uk8yuLrnOPJal+hnaoK83HCAXIL
 577uE9VJ+Vpj4JdRZsVbpmsRbT3AAX98krwbxNhqLGr8oYlOPWUFSMw1UnCda1+zgjT7
 BtiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bmjVeiXo
Subject: [Buildroot] [PATCH 1/1] package/python-apispec: bump to version
 6.7.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index a11c7af9b6..2955b4eed8 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  6d4983057ff8ddb5d9ab328fec6abea0  apispec-6.6.1.tar.gz
-sha256  f5caa47cee75fe03b9c50b5594048b4c052eeca2c212e0dac12dbb6175d9a659  apispec-6.6.1.tar.gz
+md5  94849d46f8b789a813c2f5911bd6eef8  apispec-6.7.0.tar.gz
+sha256  fa2cf1063bb227ed6f7f66b019f320d7dc0a7cb02acdf166a160e2381f4b2c39  apispec-6.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index f9b6682943..b464891aa0 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.6.1
+PYTHON_APISPEC_VERSION = 6.7.0
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/ab/5b/5d94e1ec6a8e487c026b2a7518dfb7ea90c4c82db48de33c227b7c9141fb
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/7c/09/2d5b33f12feb18375c11c6ca518be49a8355e4be3a3581b27a7faf83983b
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
