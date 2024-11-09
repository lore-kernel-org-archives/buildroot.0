Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B8DD5E373
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 16:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F805840E3;
	Sat,  9 Nov 2024 16:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heYE7Bjj7eEw; Sat,  9 Nov 2024 16:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3135C840F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3135C840F0;
	Sat,  9 Nov 2024 16:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31790D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FE24840F0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwNMV7462qY3 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 16:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9912840E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9912840E3
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9912840E3
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:53:47 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83aad99d6bfso119288839f.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 08:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731171227; x=1731776027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eny7Q2jLi0JXPznT8mYXdPRaFtc9rEp4KVH5pmj7pmc=;
 b=eiB4i+RHTSzOrMrvnvjVMzxrrsrMdEyMpwBOpvJRg/ezsSH8qO7DvCDstzshvTML69
 i79YIL8XDxyk7ReuUK9A4GX6537GQ/o7o9yMyW9W9q7kKgmhOHedDGkhrFOS1qxZMcOa
 kWMfxpMWZt1Tip33pvoCN93iFJRvbUvzKK30yM+tP+qTHLERLv3KuINbX/5hjlphZXnE
 6J7iLSubcyv0+T+nvOTtHYHD9fEMkx85SYYcG7j3pVQOPG2qvs+hll91+svU6vwVOAuk
 zZ1U7463KEaIa7414PWfVZYKCweEpTdGilUMlYtBnAqTpantjWJcV+0QwRwnCQJbkXXS
 BT3w==
X-Gm-Message-State: AOJu0YzbqvqUSrXb18AMjtl+e2151srlYwZo0NRSA4t6RbZye2H5KMLi
 duXJTLyfhYXizPLnv7GyzJaM5p56OTis0anhaoO1UErCs6MxRRv+JkAB0mLJ
X-Google-Smtp-Source: AGHT+IFw86tFb822/KLOT4zOvmchqe/s69FH71AkzuKZNY+gz0q0/7AGc3xaXLMZlAGTalSlu4bvLg==
X-Received: by 2002:a05:6602:14d1:b0:83b:2b89:a14e with SMTP id
 ca18e2360f4ac-83e033998ddmr650095139f.13.1731171225212; 
 Sat, 09 Nov 2024 08:53:45 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787f3a80sm401358173.138.2024.11.09.08.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 08:53:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 09:53:39 -0700
Message-Id: <20241109165339.561735-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731171227; x=1731776027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eny7Q2jLi0JXPznT8mYXdPRaFtc9rEp4KVH5pmj7pmc=;
 b=XsFVoE3etittLic9hwR0EmhK08crzkUnYwlFubooX/zkYZ4MhrKxmsiLlKaxe6fu6d
 sZcsPLDEecI2hqENzHMDsO7vXh14b3Kyz9t06VMyebyH+n+Lfb2mfHR10fNnkqcdpJUE
 buGyv/d/rfl2kKFMTkcBIqkrnbu4Z9in+NAI/JxEYq0QqdZ4Hx8Nxdbq/wwsGMBCRqAI
 93RF0xVZcxQ45OMt76L8UfgICz2DIGVLosxjuZ6wduZD1a0OZIlexxhMoictzfKuegmn
 /oz2zlc/au8EAZ0yhNc5T4ZZcDQSRD/HAJ6bFLaSx0kIB3AhLUQKjTMt0vcYhJibKZEN
 //TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XsFVoE3e
Subject: [Buildroot] [PATCH 1/1] package/python-async-timeout: bump to
 version 5.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-async-timeout/python-async-timeout.hash | 4 ++--
 package/python-async-timeout/python-async-timeout.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index 68cdbc3ca8..451c07de5d 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-timeout/json
-md5  1507a6758b30c673d01ac9db6beec95e  async_timeout-5.0.0.tar.gz
-sha256  49675ec889daacfe65ff66d2dde7dd1447a6f4b2f23721022e4ba121f8772a85  async_timeout-5.0.0.tar.gz
+md5  566a39011e87cb8044ee75369e69b327  async_timeout-5.0.1.tar.gz
+sha256  d9321a7a3d5a6a5e187e824d2fa0793ce379a202935782d555d6e9d2735677d3  async_timeout-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index eda75c4277..2835368003 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 5.0.0
+PYTHON_ASYNC_TIMEOUT_VERSION = 5.0.1
 PYTHON_ASYNC_TIMEOUT_SOURCE = async_timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/61/1f/44d9efc904bbe4d9967433522b691a9c4f1e81c2c64fbe44bad63d5de646
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/a5/ae/136395dfbfe00dfc94da3f3e136d0b13f394cba8f4841120e34226265780
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
