Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDA3CF9C6B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 580E980C21;
	Sun, 22 Sep 2024 00:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bopdtqis36S8; Sun, 22 Sep 2024 00:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B5D981496
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B5D981496;
	Sun, 22 Sep 2024 00:26:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2751BF86D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE59D81496
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlRITi3LsGxt for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D2E080C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D2E080C21
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D2E080C21
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:26:00 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82aa3f65864so123459839f.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726964760; x=1727569560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QP/N3H0dgYtUBo6sAvVQaJEeEurvwXS+d2+Us0bmvM8=;
 b=Bk3W2LgKYvrqVtN2r9fMLZRrxbjxBy5xnsLPhPLrd2E+egEWQjPNkR6AqQiSrLLTQv
 0nYrxAalOi+Gfy9+Rr6ED9ooy+QmyThI+biZ8AupUFRC90EKUqBvpy86Vk1PIqeAn0Mq
 /1EvRezmvfL3rwLqQu/wIZnA0mBgLGb5KXzaa/dzZTWw8bImYmDDkDSIlwz7bmB1h4RE
 8mQsgNJDopkrCE1cdUU/D22VJH3u6jRR8hAWkJHCEDQNrXlVm266cpUCvuk/FLUiuEH+
 WvrsDEg0zHk3XrThtiB7pAOtp+dtFsZE5pd76Q/2BlmpVCn/pYJIDBpN1nY/gkK7Ymqb
 yWRg==
X-Gm-Message-State: AOJu0Yz7vGr3BYDDBA55CdebZbuGahR3zMCWHBuoR0tw+abUi1xIVMA0
 H30EoaIvjV5Q5/MtfaDPgptcrKDUD1h9jPqbtrVl/BR0JP6aMm+8FPYNIw==
X-Google-Smtp-Source: AGHT+IEa/VpmlDthy3ltz2xQE02UonX6X8ZIyUY2pG9rSeuzJJjhN9rKE5CGXQmorQYp65npn6JIuA==
X-Received: by 2002:a05:6602:641e:b0:82c:ef21:91de with SMTP id
 ca18e2360f4ac-83209eabbf5mr773046239f.14.1726964759793; 
 Sat, 21 Sep 2024 17:25:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf483esm4347454173.10.2024.09.21.17.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:25:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:25:40 -0600
Message-Id: <20240922002540.718026-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726964760; x=1727569560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QP/N3H0dgYtUBo6sAvVQaJEeEurvwXS+d2+Us0bmvM8=;
 b=ArOjbtLeXoLHfCahJsNwphxthanCaKWLMsXJiGJSEW6E4uOjDYmTF/Bx3GzeVndeNN
 qqLs9+k49ZYWjPLvXYMKcxUfJR7FyiXhAml6aDLZbVM32yG6coBC5+Ajphftlkj3gltP
 YWstZcK/Hi7W5n8Qm4sAFWQQD99iFRr+06hMvSAq+9XEnOZ7I0t/c3c1pS7ruC4N7jad
 lZIK6kUaINSX3ysXjRpzCECbAkeSK35kWHVBTl5/k9DCSHuSIooWgGWjbaXpgvT9hpKk
 HmfpOe4olBmoAIpds3eaSzZT3fijG5lWMb9VZpijxCCySR6JBB1smOXY2tWF5iak8NyQ
 McDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ArOjbtLe
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 8.1.0
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
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 1a884dbbbf..f2bdf8a208 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  a05e98ab9ae447e173f0c747e0d49e81  setuptools-scm-8.0.4.tar.gz
-sha256  b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7  setuptools-scm-8.0.4.tar.gz
+md5  d8046dce093a94dc382b68b45f6a6257  setuptools_scm-8.1.0.tar.gz
+sha256  42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7  setuptools_scm-8.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 4cbf914690..e646147785 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 8.0.4
-PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools-scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/eb/b1/0248705f10f6de5eefe7ff93e399f7192257b23df4d431d2f5680bb2778f
+PYTHON_SETUPTOOLS_SCM_VERSION = 8.1.0
+PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4f/a4/00a9ac1b555294710d4a68d2ce8dfdf39d72aa4d769a7395d05218d88a42
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
