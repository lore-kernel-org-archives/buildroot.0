Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66A9CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3C4C4011C;
	Sun, 22 Sep 2024 06:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWlW8nEddoeA; Sun, 22 Sep 2024 06:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 697F8402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 697F8402E4;
	Sun, 22 Sep 2024 06:22:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 119CA1BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E7B5812C4
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGbJjyZtoyTN for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:22:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 153AD812C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 153AD812C3
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 153AD812C3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:22:25 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82aa4fd82a4so126245139f.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726986144; x=1727590944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ME9dklhFxxrRVsL6tQZXzMGPMfQ6MOkuEXU6hTSvzb8=;
 b=jkeYxFlEw8Oky+rx9uoHbnw3N41LyUJFu6/b0LVuNbROpy3+w6azSNGhpTLxFSxOyY
 F/MlLP2AEa0BVjTms01IVZTY9Ub7lv1uLcG3wt6PE79xjupGF1cWkFKaGL6HjaLSBvdJ
 RynnXAExMkOfVzuFpC0Py6CA8vpPJSSnCFlHyOl3NHwPYLPZKNvBr0SOzwIFRrBoJqXf
 JjKoNUGjc5Zw7Qx3+yLootseaOFCZfyuidfbEvyoo5TG1q4tdd78rivhsYdQ2KtPWNbI
 sGGvgsvS5MwNFIBqH1yz75mREWe2hff+DgkdkrBP3eVJR/Yg/SNyuXllZ5dz065K+sSW
 owSQ==
X-Gm-Message-State: AOJu0YyU4rARoF65mq4Jp5wYNSYpSx4HJiJqEcWO90E4SZYuLwK2JBMX
 NtyVGrgcRsomU+Vpge2LK1B+C+MTA9BgWh5H2gzCcP4g/D4T8ZMHe5CFWg==
X-Google-Smtp-Source: AGHT+IG/A8JHOSOa+JhppBMkrI1HwfVidpjKI7BRhEcA49gjogj1Rw6XB3S7tt1FP9BTVOlFgGTaFA==
X-Received: by 2002:a05:6e02:1c49:b0:3a0:c88c:e668 with SMTP id
 e9e14a558f8ab-3a0c8cba344mr73184265ab.14.1726986144636; 
 Sat, 21 Sep 2024 23:22:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed33fa6sm4441885173.121.2024.09.21.23.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:22:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:22:22 -0600
Message-Id: <20240922062222.963783-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726986144; x=1727590944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ME9dklhFxxrRVsL6tQZXzMGPMfQ6MOkuEXU6hTSvzb8=;
 b=Yriq1H42J9SuFPhqUng9Wdk9oErBFGOkJkOm+7fxi3k04vOZzwMIOob3iqYIYwGVHx
 9ttNv9SJ759kuMVnbSUOtS/1DHltH9PeJo4sRPzFI57PazLLnGhDhcVIatNMD8EVXKnF
 eT6P1KUG4xg/YVEQGKKZ8em90QUrJZnB3sHTY6dHsyo2PS9CRaQPFGAFhvYLA5HJ+2Ge
 b9VSjjy3c4rbcjOsuOyARIsp6ta15GzqbJ7KoeAA2Lp1tCSSv7oJ2xfRjF4qm//mVj9Y
 zq8o5Ep9Noc70HjsmNPWwI0ZKpREozcqmRO3AZL6Dm3WxQNl4VMKLi8ZjoM2Do8sXoSR
 ACdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yriq1H42
Subject: [Buildroot] [PATCH 1/1] package/python-wcwidth: bump to version
 0.2.13
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
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index 216182c2ed..7883ef44de 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  a07a75f99d316e14838ac760c831ea37  wcwidth-0.2.5.tar.gz
-sha256  c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83  wcwidth-0.2.5.tar.gz
+md5  5ce8dd9e6993dae268142feb1e605cd8  wcwidth-0.2.13.tar.gz
+sha256  72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5  wcwidth-0.2.13.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index a170a8e395..75199974fa 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.2.5
+PYTHON_WCWIDTH_VERSION = 0.2.13
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/89/38/459b727c381504f361832b9e5ace19966de1a235d73cdbdea91c771a1155
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
