Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E728E6FE33
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 17:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460E881233;
	Fri,  6 Sep 2024 17:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sy29iZQ82zpD; Fri,  6 Sep 2024 17:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E973813A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E973813A6;
	Fri,  6 Sep 2024 17:11:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4B41BF38A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3818B813A6
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksZIewdrImuQ for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 17:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32B3981233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32B3981233
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32B3981233
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 17:11:55 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-82a24deca03so90479439f.0
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 10:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725642714; x=1726247514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aKwJqBDm8NqYhYIxhkDUolt5eDseScqSe9TtwPsSsdU=;
 b=khC91rGp0kR9Y8aX60Zei3BAqkCzu5Dyyf37+t38s193IMzPpK9AHG9QG4+TBHoInh
 OPbLSOvquF7j8WqNNCAdg1Pgv6Ahw5PDIriaiMf2kkTNeKf6mVOuBO0FNUExeUEifKLx
 753bj3WCOTuokPUGTTAVFD9OQnL61eU6QJAvVWUSfs27WwJ71qhoD031TbS4B8IdbVEl
 r9kiIIfL0scXAvgFWyqNcFKtIIkfUbMnM9V6Oui/q+8PIaNlyIlrimElOXCzRhYwiTsF
 fEfoQfLYsWtShAT8xkZZhoTkW2Ao+47nFYgBmvP5Ye3HtmCLtoryZqTHdwkLJ5M9uSMd
 jgOA==
X-Gm-Message-State: AOJu0YzuV9BBCWug3Kz1iv5dYHMJsnfAba8GkGHW59Sg/C48mXX6gmGB
 DfmIS+MK4cXVCAZeIGFd8EZGooofhCXEu0Tr3Ty8cJbAbHFO6/kffQBgjg==
X-Google-Smtp-Source: AGHT+IHRC6Hx6owGHxv0sU1ZYhCGThXk9qPtjz502EdYzbkeozQmNMPoutXXYX4LuOpx9PRFb29xAw==
X-Received: by 2002:a05:6602:6218:b0:82a:242d:e0c7 with SMTP id
 ca18e2360f4ac-82a961b8c5bmr388922039f.9.1725642714352; 
 Fri, 06 Sep 2024 10:11:54 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82a1a2f0759sm477636639f.2.2024.09.06.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 10:11:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 11:11:52 -0600
Message-Id: <20240906171152.1922026-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725642714; x=1726247514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aKwJqBDm8NqYhYIxhkDUolt5eDseScqSe9TtwPsSsdU=;
 b=Dn/NSA7nEDzJ6x+haXglMEib7x9eOhyWY5fnnaNw5UKxbl6wNjKE8LFCasENoyR/te
 T+Bc3FoFa43hTxymp7vKcaYM1Sqq5IIfwu3q0VpokrL1iB3DuCp1QJC9XwePj4BuElU0
 tG46pbbHatVQQNtGdO6p5G17vJSeKuAp8CXFbqyjwaocZtCvQpaISu5UfReVCCZsCbwg
 gvrkYRSueJixx0oaFAusBDlx0djTJRCMaf4JpGGaJgorgkNKvLJt9zBz26B5Ohi4qrV5
 afnf5YGi/Se797LaEMte9hr2yjGWvh24qU65t6de1uBYkyV6xpvrNG1iUkd+taD/XIpX
 wRew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Dn/NSA7n
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 43.0.1
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

Migrate from setuptools-rust to maturin pep517 backend.

License hash changed due to dropping PSF license:
https://github.com/pyca/cryptography/commit/5e6476a4c6e094926a983dcf5cbe9488c30aeb53

We now need to enable chacha support when building with libopenssl.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/Config.in                | 1 +
 package/python-cryptography/python-cryptography.hash | 4 ++--
 package/python-cryptography/python-cryptography.mk   | 9 ++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index 213aa24fa8..d12f040656 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 5fbf69a208..5336f23257 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,6 +1,6 @@
 # Locally calculated after vendoring
-sha256  b55c6c011ba4bb803de0b557f40f1765bab9f63240e93516daaf75c3c68e6618  python-cryptography-39.0.2-cargo2.tar.gz
+sha256  c57ae743b2adfb29a3fc005b6f39bf1378e20d10529a859b6e2e425845bff8f3  cryptography-43.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
+sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
 sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1cbccd0d5c..2602289149 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
-PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
-PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
+PYTHON_CRYPTOGRAPHY_VERSION = 43.0.1
+PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/de/ba/0664727028b37e249e73879348cc46d45c5c1a2a2e81e8166462953c5755
+PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
