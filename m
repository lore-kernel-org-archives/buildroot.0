Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09156C021A6
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 10:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7C626077D;
	Sat, 15 Feb 2025 10:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peoWkN7v-nqu; Sat, 15 Feb 2025 10:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E7F0607E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7F0607E8;
	Sat, 15 Feb 2025 10:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F34FDF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ECF9811A1
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jTnFp5DxxMO for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 10:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D2258102A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D2258102A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D2258102A
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43967004304so10928265e9.2
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 02:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739615632; x=1740220432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hZDxM9VDUTnFRXs9uYXLhGx1O5IAnpgvp+0Qz3XDbcU=;
 b=GNItGF6iGFduuanTNKjUrXv+U5C2NzD0/QrPByijn+MpW8EHkfmvcNTdRV2Mn6r8p0
 JFtf9N01XAM4dWHgww1bblQllog+W0o3Gt2s899PA4FHVMkrO+BHiItml1EtK2K+5o6b
 XlfPk6YYNOG1LgmB8ETuPJ0C9DTCUeXMViEt4Cn6caIYqCOrzxZFdll38bh3Vp2Caens
 EROFSmjARTWeXstmWakMfa+7iceUM5j6TFc23bGCnLf+JDCbhvIK/Ts1rwyyZs0FuMDT
 BMwLPFPE0OmCjplzINN2O123MMjLcG/Q0CdJgYLZTpQS9oTj0OTVmn5OW7pzzXZhJNmH
 5iJA==
X-Gm-Message-State: AOJu0YytUNU6YxTr0dBC3r6XJ6LVOgJg2Da+Qc0P/L/D/R02uIg2bBQP
 f9VLucuCqV/inQmDlZNqw7JdWlstH7qZp3tblRXbUL5Uay7e5NqP0W60dw==
X-Gm-Gg: ASbGncsOjx0e0XtQi293W1i2Fl7JthlMyDcT3jRBMy8+q0++kIUQhw8gm9eD9B/29VI
 7TY1dzDMXVwVV3EmCVwXNFLrARf2KNT1tJSltrQYgNDpgAN6ht7q15vruXx48JLRtoC1+Xz9dsM
 rYAwfx7NkS7rEeRpgRwYeg9zL5nIoDFT9n0pPU5GoVwKwg6vE6lO0KRlMmdujfrchhS1N18YKWN
 VmuGep1SSIv0cmgSl7hXsPqHTON5dR3i58kAmcUhZ4ItRnZ68NBoTal82XgT+0FByN+tWbNcOGb
 avUOG6yfrKHJ0Ay/FVPK3M8Kgg==
X-Google-Smtp-Source: AGHT+IGtgHLHkU2Pmi/byjDJiymEW0Q9yh/FVkHwnHNXYcUyrilvx1nntq8OeKe679yLc85qyPkkfQ==
X-Received: by 2002:a05:6000:1843:b0:38f:334c:e127 with SMTP id
 ffacd0b85a97d-38f33f1c435mr2384292f8f.12.1739615631596; 
 Sat, 15 Feb 2025 02:33:51 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b432asm6774941f8f.6.2025.02.15.02.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 02:33:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Sat, 15 Feb 2025 11:33:48 +0100
Message-ID: <d2e8acab3a2df2ff91de48072407ce7977c4fc8d.1739615626.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739615626.git.yann.morin.1998@free.fr>
References: <cover.1739615626.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739615632; x=1740220432; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZDxM9VDUTnFRXs9uYXLhGx1O5IAnpgvp+0Qz3XDbcU=;
 b=gPs1mPSdmF/VGJWPPpRGsUo/KPgMm+YdjiYLAu4roNCgi+0f1+gJu2WxhL53QdMK8V
 OiXE61xPBk/5rzbtaY0VihTklp71GOHL6A6C8bDJBFH/0yXemwuTEDUuQFNj+if6j4BB
 W7nNtNyRYRgQjC4ZaTbW14+gs7tZvvjbBwZkJRVpuUOprLLXh4PPAlP6yDnoqe6MWZHZ
 ERCQkqVkF7yxJcZJv1mhw05y9pPpsMuYackF+bb/4lK8Ym0o5OF40TjhqTwZCavyMvvJ
 1mksO8EgeIrxzOazc3VDDPUFwaMPPb3F2fES0NgF2mMVoNBS0/9Ujp+iQROx/itytIk8
 3HfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gPs1mPSd
Subject: [Buildroot] [PATCH 3/4] package/catatonit: update to version 0.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 .../0001-fix-build-with-kernel-5.9.patch      | 49 -------------------
 package/catatonit/catatonit.hash              |  2 +-
 package/catatonit/catatonit.mk                |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/catatonit/0001-fix-build-with-kernel-5.9.patch

diff --git a/package/catatonit/0001-fix-build-with-kernel-5.9.patch b/package/catatonit/0001-fix-build-with-kernel-5.9.patch
deleted file mode 100644
index 37def8e546..0000000000
--- a/package/catatonit/0001-fix-build-with-kernel-5.9.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 65e1b96bd40cb14b3729ac56bb9f1fcb77254403 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 1 Nov 2022 14:16:01 +0100
-Subject: [PATCH] fix build with kernel < 5.9
-
-linux/close_range.h is only available since kernel 5.9 and
-https://github.com/torvalds/linux/commit/60997c3d45d9a67daf01c56d805ae4fec37e0bd8
-resulting in the following build failure:
-
-catatonit.c:39:11: fatal error: linux/close_range.h: No such file or directory
-   39 | # include <linux/close_range.h>
-      |           ^~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/openSUSE/catatonit/commit/663ad1670689143f65af3a288f90cecb7feed54f
----
- catatonit.c  | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/catatonit.c b/catatonit.c
-index a33f4cd..b10d9b0 100644
---- a/catatonit.c
-+++ b/catatonit.c
-@@ -36,7 +36,7 @@
- #include <limits.h>
- #include <dirent.h>
- 
--#ifdef HAVE_CLOSE_RANGE
-+#ifdef HAVE_LINUX_CLOSE_RANGE_H
- # include <linux/close_range.h>
- #else
- # include <sys/syscall.h>
-diff --git a/configure.ac b/configure.ac
-index 69e89f0..b37f146 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,7 +24,7 @@ LT_PREREQ([2.4.2])
- LT_INIT([disable-shared])
- 
- AC_CHECK_HEADERS([errno.h fcntl.h signal.h stdarg.h stdio.h stdlib.h unistd.h])
--AC_CHECK_HEADERS([sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
-+AC_CHECK_HEADERS([linux/close_range.h sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
- 
- AC_CHECK_FUNCS([close_range])
- 
diff --git a/package/catatonit/catatonit.hash b/package/catatonit/catatonit.hash
index 9940309c76..7b13100a33 100644
--- a/package/catatonit/catatonit.hash
+++ b/package/catatonit/catatonit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d0cf1feffdc89c9fb52af20fc10127887a408bbd99e0424558d182b310a3dc92  catatonit-0.2.0.tar.gz
+sha256  771385049516fdd561fbb9164eddf376075c4c7de3900a8b18654660172748f1  catatonit-0.2.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/catatonit/catatonit.mk b/package/catatonit/catatonit.mk
index a308ea6471..aa7e60f697 100644
--- a/package/catatonit/catatonit.mk
+++ b/package/catatonit/catatonit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATATONIT_VERSION = 0.2.0
+CATATONIT_VERSION = 0.2.1
 CATATONIT_SITE = $(call github,openSUSE,catatonit,v$(CATATONIT_VERSION))
 CATATONIT_LICENSE = GPL-2.0+
 CATATONIT_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
