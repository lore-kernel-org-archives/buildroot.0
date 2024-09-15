Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85F4C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DBD80F0B;
	Sun, 15 Sep 2024 21:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUIWDqz7KCTT; Sun, 15 Sep 2024 21:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D3B9812DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D3B9812DF;
	Sun, 15 Sep 2024 21:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C46E1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 877E8404E9
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-lLNIi9AT1r for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EE6640422
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE6640422
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EE6640422
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:28:40 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a09af86744so3544105ab.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726435719; x=1727040519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mCoBpLsS52N8zGpriNn0EcBfyagKyV/pbmliGaL2G04=;
 b=anpDEdgvCVoPMVppXQcKNy6Vm3Expa8imfiZ4ZOqDKYLNFMpVJD+mmCG4CoGlZuoqP
 vLYWlMD1xkWT/3uo7aw+2WdNDEAoJICfQHFKaSCh4Q5CR3/IuHglGMhvQdbvweI8eVMl
 Gj0R/JYns6DVCR6L2HAj2B2F/aursjtf4PGp2GVp97pYOpGMXMCg6wxrzEIA57J++bEW
 HbPCr2/7Qvf3lUC7I28zpG6xiIo7bImLPNWJo6MMDzwpaUM5GjkysgiGM07dUNNuoR2P
 S43NTNTuCIa6d6/wuZdad2YHP9VB1UoWPPlrM74O7arpMqd0sOMvlxc7E7SzlwKS4CCT
 H0Yw==
X-Gm-Message-State: AOJu0Yx8YEWclqq5PxixaSf404RzylVH6ssyzgljZbARd7qB4prjzzS4
 myaglkxzqwoEBItG9N1k6/FIgpiEGkKygU33zVsAPvU0GcCjV8GLH1TBhw==
X-Google-Smtp-Source: AGHT+IF9z74ldM+rMUtEXaJbgf8r6Zx7i2jhFbI1oJswJHXIXUkT96+xJ6FEp8MtnEhyTBSOiJL8eA==
X-Received: by 2002:a05:6e02:1cac:b0:3a0:8eb3:5154 with SMTP id
 e9e14a558f8ab-3a08eb3520fmr68818825ab.4.1726435719103; 
 Sun, 15 Sep 2024 14:28:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e105fasm12329335ab.23.2024.09.15.14.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 14:28:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 15:28:16 -0600
Message-Id: <20240915212816.1645997-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726435719; x=1727040519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mCoBpLsS52N8zGpriNn0EcBfyagKyV/pbmliGaL2G04=;
 b=KQ2StVaVv6pJrjnqGEuRE+EUFuBpdqCbHYpeLGlud9I6iheko1FTDcgX0oEZaU1JgK
 ofur4saIP3sqzKdMZKBu3xo9RnyIJ9aiANgHWpcAc1FVuq700ssmJBQpxQuirQ7CRePr
 GzL5sqmehG1OmsvF7Oy36+KiU6S6kMBxwdg8wzAa7z6JZy50lbxfflkCj6JwzZuYXJM8
 zzDgeDhBaERtvAn7BcTeItDZdTd7JvxI+lcqD5ELKD5JSS+sVSyBM0vc7dk5x3IwgLeW
 YUuWda9mZXVOFbhE99HgY9bhx5nUGBizqeVHhEqrb+zK4/Gj6UeUvMQwuN2hq2in+lEB
 fF2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KQ2StVaV
Subject: [Buildroot] [PATCH 1/1] package/python-m2crypto: bump to version
 0.42.0
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
 Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set openssl path via env instead of build options.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-m2crypto/python-m2crypto.hash |  4 ++--
 package/python-m2crypto/python-m2crypto.mk   | 10 ++++------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index 782837081e..aa8fe09c14 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  280c20072afbe7010cf9e9620ea25c7b  M2Crypto-0.40.1.tar.gz
-sha256  bbfd113ec55708c05816252a4f09e4237df4f3bbfc8171cbbc33057d257bbb30  M2Crypto-0.40.1.tar.gz
+md5  b88bcb1d4aeb817f91eb627d08b673a2  m2crypto-0.42.0.tar.gz
+sha256  42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4  m2crypto-0.42.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 6c07f42d06..79dfc1beb2 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,17 +4,15 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.40.1
-PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/9e/a3/9433817493ea250db67a05de3361cb0a1d58531847d50406f2f28455e68c
+PYTHON_M2CRYPTO_VERSION = 0.42.0
+PYTHON_M2CRYPTO_SOURCE = m2crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/85/9f/b8977ce2971cf5f823db3fdb31e7e061b9662da318a17b6bf0c653f84aee
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
 PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
 PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
-PYTHON_M2CRYPTO_BUILD_OPTS = \
-	-C--build-option=build_ext \
-	-C--build-option=--openssl=$(STAGING_DIR)/usr
+PYTHON_M2CRYPTO_ENV = OPENSSL_PATH="$(STAGING_DIR)/usr"
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
