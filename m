Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45613C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 16:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC2DC82CDE;
	Thu, 25 Apr 2024 16:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtX-cS0Yq-eQ; Thu, 25 Apr 2024 16:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB6E782CF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6E782CF1;
	Thu, 25 Apr 2024 16:07:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 866F21BF3CD
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 16:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7298641B93
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 16:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rE-a146q6Ev for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 16:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D55841B4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D55841B4B
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D55841B4B
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 16:07:38 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e6affdd21so451821a12.3
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 09:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714061256; x=1714666056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wZ7cJg60EpDxGFAikcj5xZfdyD2LQ5b4AYt30p2rlSs=;
 b=wt0YwfX13gcv/JUEise7ZiguaFMHnQkRWEGEWTOaysSxS6MC74wCfTZJatKjJx8QFL
 On5yF4aMrDUAXbDEsy28ZmBrz0JfnZRV9SFTZh1IAcsWI88rkRG2Z5oHFepuCpWPtV08
 0p5e+dLk6xFkgd1Zu2nmccnexGq36tkwEePz5E1pU8xqBAcs2DlIiG6bwzf3OQVTZ1S9
 Hut4EOnCfCfPA60a/11zWd8q4dpwj6unJhVm64z5v9MVVqr4JnquBO8jEUB09k6dOASf
 zSfspkZcJJf5D1AleU93/o7woIEXsBSZipZCYoJdfzc51uU6cHSog4m/6j5i10ST250c
 gYRA==
X-Gm-Message-State: AOJu0YzcMIP2aL3iwjI9JR6MWJlhr7cBJ0H+aCqpDXgsrmIDRHnefZXZ
 0z14nD8t2ktHZXyKJQ+twBzD+Cd7Sac0m7WKzL8hm/qw7Kq1MC2S/0Obyw==
X-Google-Smtp-Source: AGHT+IH8w5+Sz+sxDJK8jhiRR3s7EaxOAZ7ru8NtLolBMNYCYuW4MInbPR1jmHTv4VujmPfySoDy7Q==
X-Received: by 2002:a50:d49a:0:b0:56e:2b80:d87e with SMTP id
 s26-20020a50d49a000000b0056e2b80d87emr83429edi.2.1714061255992; 
 Thu, 25 Apr 2024 09:07:35 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 x97-20020a50baea000000b00572469a7948sm474261ede.45.2024.04.25.09.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 09:07:35 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 18:07:32 +0200
Message-Id: <20240425160732.561621-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714061256; x=1714666056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wZ7cJg60EpDxGFAikcj5xZfdyD2LQ5b4AYt30p2rlSs=;
 b=lT38adQoZ9XqKgH6V7NXAjvv9NSQQShojFE+Od3qycBSLU0VUN2hJ/NpwVpr7T4a6T
 ZFb4+CbbgYIZHZan99k1gqjkjt5SonrdPybCzddMgpWEtD0n/IeT+9VRr1NDztgYvoy7
 PK871ot90mcrS+iCmPv/YjUvjGPKzU8JhtNDDDM76F4Of66USaADamfLm/QYu4TZw43Z
 N2zT9PpvdMVeuJCdlqTgpyXTyCGCZSHvlyd13FDRadhN4k8xGGsVmEaVlZKojmKPLPEy
 5h8SP0x2WwbdWl2L0ctwfeyDlNHLIXrSUakqojtvLvMRohxm1kpaNp2lfAXFT/ySKHgq
 R4kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lT38adQo
Subject: [Buildroot] [PATCH] package/python-pillow: security bumo to version
 10.3.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In _imagingcms.c in Pillow before 10.3.0, a buffer overflow exists because
strcpy is used instead of strncpy.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 001fb62676..073b758dfe 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
-# md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  13de96f9f98bc1c26439d64576a48ac6  pillow-10.2.0.tar.gz
-sha256  e87f0b2c78157e12d7686b27d63c070fd65d994e8ddae6f328e0dcf4a0cd007e  pillow-10.2.0.tar.gz
+# md5, sha256 https://pypi.org/project/pillow/10.3.0/#copy-hash-modal-125abe0d-59be-40cd-89a3-3e2f78136be0
+md5  6c21a12849ae42f93881f614d8f6f651  pillow-10.3.0.tar.gz
+sha256  9d2455fbf44c914840c793e89aa82d0e1763a14253a000743719ae5946814b2d  pillow-10.3.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 7f5b4dd0f9..38214376ce 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.2.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f8/3e/32cbd0129a28686621434cbf17bb64bf1458bfb838f1f668262fefce145c
+PYTHON_PILLOW_VERSION = 10.3.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/ef/43/c50c17c5f7d438e836c169e343695534c38c77f60e7c90389bd77981bc21
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
