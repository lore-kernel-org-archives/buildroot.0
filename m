Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B805CAC58F
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC1D610FD;
	Tue, 17 Sep 2024 17:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 687YWhpIhDot; Tue, 17 Sep 2024 17:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BCE61101
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BCE61101;
	Tue, 17 Sep 2024 17:10:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 471A61BF855
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 428AC41031
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwCNhVIBuPWD for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 17:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12AED40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12AED40133
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12AED40133
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:10:52 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a098e1cf45so19223675ab.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 10:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726593052; x=1727197852;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LsZBvzdNhqmkoAqAlD/A3W1faL33sdWV9Th/HmprWZk=;
 b=Wcov6TCx03F9GDGvKSDwmlyV9v6sjiXSDg9qFpTKq95ePxFDLquOU8AeOQ/mAEOH3B
 jr5KAAy3i30FbROvre8xG94M6R55nfcdJNSWxFo9y7LJufGbeMt9B/7Nt91im/PCqm8G
 8c778FmyeyV8ANZOvK1sO7GePpUCL20QtRsTBsD8PVdUks52pe+siRuqOXWILVpEcQ9H
 jTOlZQ/qaNS4vLSjz1L8YZt1+8UOnGjxL+HC5mBCiHASWV3U9GtXKLZ/SoQ7BaQ4HAnX
 fDuwSEXuxKJk8psa1CcUGoSJYUxzCt2q9P4ZGZHqLMglTnSzFfT0Dp+S7Mx5YFBI0g1H
 9XFw==
X-Gm-Message-State: AOJu0Yy+WeKiEjVA99Iwe/FLjshN2mzKx6tXbaAUvK+5HiiFU9cmRhdJ
 teRB4wtLBxG8dEVZKL+8nXMf9sT8q+cnZpTkznKYODFUoRv5vNJPhrejmA==
X-Google-Smtp-Source: AGHT+IFI6SqT/1fRiArApf3sW3YMsSKc5AFQPZ2rUSDwu4yp5HMCgR2EFTDOlBUpCZZ2aXZtQrL4uw==
X-Received: by 2002:a05:6e02:19ce:b0:3a0:909c:812d with SMTP id
 e9e14a558f8ab-3a0909c8510mr108309205ab.11.1726593051683; 
 Tue, 17 Sep 2024 10:10:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e14a93sm23321225ab.29.2024.09.17.10.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 10:10:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 11:10:48 -0600
Message-Id: <20240917171048.3842778-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726593052; x=1727197852; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LsZBvzdNhqmkoAqAlD/A3W1faL33sdWV9Th/HmprWZk=;
 b=NIntMMhoKtlNqhyb5KI8WcgjgCk3ASqxwUsX18TecX5JpgjBjdbNfAFI0AEplCgLkb
 /Y6LVN2/zPvaiSdTnd1qTLv5omFl4ZH56CvJFfhTqDLd1t5IayKG8uoNYq5jGQYtPiwx
 wd4fh/z3VRaHmbjCeTpKdiwaK97o5K7jzIK9RzvNjZLhJgOfyc7MyanTmWoAWmAPP2kz
 zs0tfkDgpvAV5ds5mR39tk8SbneEuv0vwmbRnxRrwhuDM6hhs94/7zw7HNcsVuAWzVrI
 xrUw0LsJswpA0cE0NEVDogfPF+mZuN5gnynFw9xizWOvMErXVTsu76bzwDIZXkcyRAuy
 QzzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NIntMMho
Subject: [Buildroot] [PATCH v2 1/1] package/python-m2crypto: bump to version
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

Set openssl path via env instead of build options which is no longer
supported.

The openssl build option was removed when the env variable was added:
https://git.sr.ht/~mcepl/m2crypto/commit/e181abc72b1b9d5a18fe2a2e26bfffffe90e5b35

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add more details on build option being replaced with env variable
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
