Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68015C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F02EA4042A;
	Sun, 15 Sep 2024 04:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6YEzzBF7bTk; Sun, 15 Sep 2024 04:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A460A40169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A460A40169;
	Sun, 15 Sep 2024 04:41:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1641BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C0AE80B5E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIXaIgpqaaGK for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F4AD80B4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F4AD80B4D
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F4AD80B4D
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:41:35 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a098564893so1980435ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726375294; x=1726980094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5xvOL0dZXr7rxKrM8c4T1pGfxevVr93tRsScJCeCKE=;
 b=TbpZR6sFfsCqLShVYhyW3jLygiMop02FXK2kkqDLXrVa+WqqDnJni9k9pHFiLmases
 DzpPDrlIm7vlZXVHJhhrNLJ4u8mS3XeD2W2L8iaE8p+KN5643/KEDyxCuyQ1IMoUX+4N
 aSt700SoQETVW24jMBo62HQM7HJtQtkexpC6vpgr4Vp7fCMrIfsLuLlzrq4BNDs74ThO
 LoTn8+7wy6sRaaexICcicl8Uc/6fUMOKCrE4DB67E2EsLO+WlHgO7/AnJJKu8rg5zy7V
 po9gfHxw8EBA5SLWKJZWzUe3BcCz1VmsBM3IN0HAnzLj4d+dWj1hkkFskIxC2ViJFOZa
 LpDA==
X-Gm-Message-State: AOJu0YzgOfHZaighq2EalDfsjxTMum9143vuDOHtVniVDOGsrAq/h9sQ
 fQwc4v3ERXuL5EpBL+XJ4l3OiKjvHSNiAf3M8pInf377MNVrwugBPJMOzg==
X-Google-Smtp-Source: AGHT+IEa4S/CTW+jc5FKoP8PHLMqP1N0KLGMyQ3CupRpjSWBE6LDfqLAGPZF+Yd+N+CsUX2LFooMRQ==
X-Received: by 2002:a05:6e02:12c5:b0:39f:325f:78e6 with SMTP id
 e9e14a558f8ab-3a0845a0d55mr103909855ab.0.1726375293951; 
 Sat, 14 Sep 2024 21:41:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfe253sm8161055ab.9.2024.09.14.21.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:41:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:41:31 -0600
Message-Id: <20240915044131.1398816-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726375294; x=1726980094; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w5xvOL0dZXr7rxKrM8c4T1pGfxevVr93tRsScJCeCKE=;
 b=YLaAg+i8ZozEIawDLk8oruIzv3ghRGmmB8kueCfgBkxEgcwXPFMZQIOANkqo7IEamH
 n9IkBbi0R2tJ8nSNiJNNBjSUpZHQ5WuGrZgxwNIzamfulaQ2dcg5kect4qAcfZJDh729
 +EXCexwDcGYO+akEUKQaRmpklXbXYZVbhEzN1ZDJynh98eb1RqW73LDZ7xiOrDjc1l5p
 UFwTRtBjlPQmC9EQUGELV6XURBp81T8zuHc4dWg/TaGWd0xtD9Pws0s7Dxy8nbbJfsKD
 B4R59ZGo4SlomUKQepG854CeAtUDGZwW/mzKLBL5BY0NJyICDg1Cac1YAOdz2yE3D32N
 hp3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YLaAg+i8
Subject: [Buildroot] [PATCH 1/1] package/python-daphne: bump to version 4.1.2
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

Drop remove pytest runner patch and instead pass
--skip-dependency-check build option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...001-remove-pytest-runner-requirement.patch | 27 -------------------
 package/python-daphne/python-daphne.hash      |  4 +--
 package/python-daphne/python-daphne.mk        |  5 ++--
 3 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 package/python-daphne/0001-remove-pytest-runner-requirement.patch

diff --git a/package/python-daphne/0001-remove-pytest-runner-requirement.patch b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
deleted file mode 100644
index 70cdb4f19d..0000000000
--- a/package/python-daphne/0001-remove-pytest-runner-requirement.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f9d881cc55c89f51240f93308713216cfec793eb Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Sat, 3 Aug 2019 14:23:19 -0400
-Subject: [PATCH] remove pytest-runner requirement
-
-Setup does not actually require pytest-runner. As such, remove it.
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 64e94f1..4e3abb0 100755
---- a/setup.py
-+++ b/setup.py
-@@ -23,7 +23,6 @@ setup(
-     include_package_data=True,
-     install_requires=["twisted[tls]>=22.4", "autobahn>=22.4.2", "asgiref>=3.5.2,<4"],
-     python_requires=">=3.7",
--    setup_requires=["pytest-runner"],
-     extras_require={"tests": ["hypothesis", "pytest", "pytest-asyncio", "django"]},
-     entry_points={
-         "console_scripts": ["daphne = daphne.cli:CommandLineInterface.entrypoint"]
--- 
-2.21.0
-
diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index 90d053bff6..194b73a0e4 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5  f0dcc0618459ad7d25508704f9505b56  daphne-4.0.0.tar.gz
-sha256  cce9afc8f49a4f15d4270b8cfb0e0fe811b770a5cc795474e97e4da287497666  daphne-4.0.0.tar.gz
+md5  6a00ce30210105fcd0f756d4dc5505f9  daphne-4.1.2.tar.gz
+sha256  fcbcace38eb86624ae247c7ffdc8ac12f155d7d19eafac4247381896d6f33761  daphne-4.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index c08088278e..097a195821 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 4.0.0
+PYTHON_DAPHNE_VERSION = 4.1.2
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/d7/77/57b19d5caabf8537879aa4cf3a017b99d0b727f2521ffca7fd9140573509
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/1a/c1/aedf180beb12395835cba791ce7239b8880009d9d37564d72b7590cde605
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
 PYTHON_DAPHNE_LICENSE_FILES = LICENSE
+PYTHON_DAPHNE_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
