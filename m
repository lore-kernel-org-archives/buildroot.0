Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51324E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 15:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0769F81951;
	Mon, 23 Dec 2024 15:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6Ai2_sBy1Hv; Mon, 23 Dec 2024 15:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F3F8145E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0F3F8145E;
	Mon, 23 Dec 2024 15:56:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58573D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AF4D41235
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ragq97KSF2O for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 15:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08D1A41346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08D1A41346
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08D1A41346
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:56:34 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a9caa3726fso14669835ab.1
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734969393; x=1735574193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1SsleoReFCIUKe2WTc7ZYBo5g+kPDWJEuApb66/CJBE=;
 b=sNZb9BaOsz5Ycc6KnN0CUyZ28R4XrSvcy+McDyJOIbd8cBX1Ams/VgAVJqyyCLq2s1
 9Kdw1uKIwGcIg/h4Xpv3oPb6jKBPXJkYxFXjzgqul+D0ZkL8z4lcEHhSCBRMJd65h3BY
 oZOuAJGI1Wo8QtbYCByXAdkQ0sDbwVkNTq5nn/19yVBt8UMi1qNxY0X2yNKQ7NRtsqk4
 UM6HNWUz0iLIFzlMvRusAyF0Nv9It8p4uHXelPwQf/P3IIF6shn7s+dc5TxdRok/Jg+B
 jnqXZbKVUtaNPU09mUwjINcThIa8/jbq3d4xGLVjKyTVIPHS+s8WgorXHh8qTonnAvip
 VyIw==
X-Gm-Message-State: AOJu0YzSZXVt6wVojtgvHz1ru7p5KdBR0GdMUdaSQPJYrZE9DwWZbEKp
 /SOcTSIaIra7TyyfqCSej1+VZmmboWQ7skZP7gnXweA9FUbEc4/Hp68FeV6OmSo=
X-Gm-Gg: ASbGncv5n4VwQ+AEEi7/KyjC1BU7XdVr0OslniS5kFGrqt0epQRRJ4tOfisJVxjK47d
 T642ZTkqAFy9VQZrnQUTlHlwMqKO61m3FyB7Z9GY89ZqceM+5ELAG2fEqMLPcu8eqF53fb37zs3
 wcravUtYAXQrcZU6XnipxDa0mBYEdSSuOtuNVI5OvrGPJH+Qn5Q0hSUBa9g8N48nkULtS5yiikb
 /wD08o4w0cNKeeCFsmGyi+Nyt+RFo/DmIIlGGwJRWhaXvEntEyScNqVneoYnYPBxq9hi3LWjgQl
 2mS8cUYXvbJ29cP8Ay/lgxj9iFbkvKh49w==
X-Google-Smtp-Source: AGHT+IHmDXJzqbC8mCGMSPv4o9ztbMZ9xlBToOxdgQypT6KVebx28MzkAJZ1xnZXWLPQ8QvJi8hqrQ==
X-Received: by 2002:a05:6e02:1d1a:b0:3a7:e069:95e0 with SMTP id
 e9e14a558f8ab-3c2fe53a7d5mr94880925ab.1.1734969391869; 
 Mon, 23 Dec 2024 07:56:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0deccfc53sm24182435ab.32.2024.12.23.07.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 07:56:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 08:56:29 -0700
Message-Id: <20241223155629.1849349-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734969393; x=1735574193; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1SsleoReFCIUKe2WTc7ZYBo5g+kPDWJEuApb66/CJBE=;
 b=KIgvwKd2XVQQCnJnfnSJGnrZDs6i7UmrqtWSHS6BzlxjQeLnpVVDlLgpohpJ4BrP4J
 lKQjR+oqzn5hxhHbSr4H2q0lYL1eXFG5CIdAjlYLAmVfLinLI5w0TmPGnafaf1PIuo9+
 GnaVg5LPJPRN93FDtFxJajev3/jj45pQxCcH9aOE6aTj4Pi+LvNTqVmELuEFdO6iEjaP
 tSo4lAWQ4Y+q1ojSoCchz1cOgRolZvC/mPcCpRHYAAhbIoB/IUDT9vpv2O2vCgjz5Ui5
 txHdtfGxgrQgwGZ1QPRXvyixFj5bKN/lbFjq15LqlN6g0SqlhJP3ZpjOFYRRtZZdjDfS
 ituQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KIgvwKd2
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.35.86
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
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
index 1076a748b2..3c57ec639a 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  d317006e6032155bfd46a949cddbac72  botocore-1.35.57.tar.gz
-sha256  d96306558085baf0bcb3b022d7a8c39c93494f031edb376694d2b2dcd0e81327  botocore-1.35.57.tar.gz
+md5  32354bfad0d8ad0fde84143f2f2edaf8  botocore-1.35.86.tar.gz
+sha256  951e944eb30284b4593d4da98f70f7b5292ea237e4de0c5a2852946a549b8347  botocore-1.35.86.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index d8d410aea5..c5168b1792 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.35.57
+PYTHON_BOTOCORE_VERSION = 1.35.86
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/61/17/65b0a3bb507b19a7a1c6cc7c63e374906891798986f0ba2b6ad174ece86a
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/14/ed/f639350bfa1c1f898dbbf69250c961ded22ebf7bedc02fa23127c7762d78
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
