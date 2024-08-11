Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0081DC3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 00:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C517813FF;
	Sun, 11 Aug 2024 00:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZDTnl-krQKm; Sun, 11 Aug 2024 00:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D1F081400
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D1F081400;
	Sun, 11 Aug 2024 00:00:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDA851BF280
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 00:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6B0181400
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 00:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24U7XWKalclP for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 00:00:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04A6E813FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04A6E813FF
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04A6E813FF
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 00:00:47 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-70d2b921cd1so3009239b3a.1
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 17:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723334447; x=1723939247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMZqySNnUZI7wCbnGTWBAHdTnMnCDDWDNspPbVpHRf4=;
 b=jJKVuVKA37pu7bjjInBgJszQYh0hUIhiKEqduS08l7yaPW+06EOLElCmG6o4GOtboA
 /5HxqdGaBT0b6tEnqkekukPSixfKRROyWF6IRqDKN4XK/5W8BdcE6xOpN+2RiThGR19T
 H5piJvCv10vZqZdwIAnpONZ8uc9ckTZ/r46ooxFZUFFo6VmQ3tdr1EYYSyJNoqaZQ8T0
 hWbxY8tsXZV+JGwCFEAvBZyIUakhOz3tEblscApejBmysSihPMd4VLMlOApFw7MQaFVP
 hFQD2OBWPuZQPf7kVKjxt3OvJLyGEO331Tu/Cx6Cn/06nmMaAUdxcdAgeNeCciugzzoK
 fOMg==
X-Gm-Message-State: AOJu0YzSo7AM6EjVZ3na5Gch4qhYytddQ7/mdcmAQv5ItLl+JL1vTbAn
 W7CsURXhJudxpp/hAPXhC43ujSbnS+IqSFdLD98GPaH4FSpQ3KyCvjm14Q==
X-Google-Smtp-Source: AGHT+IGUnNrrWyaqx0K307e4ywIs3XOgU/j/W9Pwb9mXED7dBXQJNS6xzkzZ1F21mtjpwgW1FWFUTQ==
X-Received: by 2002:a05:6a00:2d29:b0:710:7ced:fccd with SMTP id
 d2e1a72fcca58-710dcae8829mr7126246b3a.19.1723334446972; 
 Sat, 10 Aug 2024 17:00:46 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:646:a200:bbd0:19b6:28ae:c9fb:dc2f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5ab3524sm1682139b3a.190.2024.08.10.17.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Aug 2024 17:00:46 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 17:00:28 -0700
Message-Id: <20240811000029.1956409-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
References: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723334447; x=1723939247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMZqySNnUZI7wCbnGTWBAHdTnMnCDDWDNspPbVpHRf4=;
 b=ZQe5yrGiwkPYL4HExMpxJc0cGRUeScWXrGAw7dqDIIMuvEPYGBQD4Ux2jZ4o08zmIA
 n9UKTr7nJzxASV0F2Igp9kZXQmwJYqjeGgP7BG48XcebJfju/6XpVAgU2xgHdttJgXtC
 VPzsPeuhTAUldgcxuj3cxCexIRjmc0/ptYolGTUQqI/hELGr8Voe61BQVVhGvAA55vUT
 6rFRPMntDv4GisKFZTZn+8/HJzI2GooQPR+0Ef9CTEPZUjynhmags1+Y7aP4aGjwTyD7
 FhJnlNpZXe5JFMyhcGPZuIR8bfIq2eNqSuPti4wM9Sap/qSa9PfWW7UaF9p4JoJEqWHg
 ECew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZQe5yrGi
Subject: [Buildroot] [PATCH 1/2] Revert "package/chicken: move literals into
 text section for xtensa architecture"
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 86e51fd5fe2810bbf833b48c4914dcd2de01bdbe.
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 .../0001-xtensa-text-section-literals.patch   | 30 -------------------
 package/chicken/chicken.mk                    | 14 ++-------
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/chicken/0001-xtensa-text-section-literals.patch

diff --git a/package/chicken/0001-xtensa-text-section-literals.patch b/package/chicken/0001-xtensa-text-section-literals.patch
deleted file mode 100644
index b93aaf9e218d..000000000000
--- a/package/chicken/0001-xtensa-text-section-literals.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e8d177f4d4e1c6bc41787ea1621e323ff4ad493e Mon Sep 17 00:00:00 2001
-From: Woodrow Douglass <wdouglass@carnegierobotics.com>
-Date: Mon, 22 Jul 2024 08:50:37 -0400
-Subject: [PATCH] Move literals into text section for xtensa architecture
-
-Upstream: https://bugs.call-cc.org/ticket/1840
-Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
----
- Makefile.linux | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makefile.linux b/Makefile.linux
-index b628cda4..e97c2b94 100644
---- a/Makefile.linux
-+++ b/Makefile.linux
-@@ -52,6 +52,11 @@ USES_SONAME = yes
- 
- # architectures
- 
-+ifeq ($(ARCH),xtensa)
-+C_COMPILER_OPTIONS += -mtext-section-literals
-+LINKER_OPTIONS += -mtext-section-literals
-+endif
-+
- ifeq ($(ARCH),x32)
- C_COMPILER_OPTIONS += -mx32
- LINKER_OPTIONS += -mx32
--- 
-2.39.2
-
diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 0520280134ab..2667f7823d8a 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -11,19 +11,9 @@ CHICKEN_LICENSE_FILES = LICENSE
 CHICKEN_CPE_ID_VENDOR = call-cc
 CHICKEN_INSTALL_STAGING = YES
 
-# Chicken only uses the "arch" variable for some special-case compile
-# arguments If it's empty, it tries to detect the arch host Filter out
-# values that have an effect, or pass "unused" here
-ifeq ($(NORMALIZED_ARCH),x86_64)
-CHICKEN_ARCH = x86-64
-else ifeq ($(NORMALIZED_ARCH),xtensa)
-CHICKEN_ARCH = xtensa
-else
-CHICKEN_ARCH = unused
-endif
-
+# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
 CHICKEN_MAKE_OPTS = \
-	ARCH="$(CHICKEN_ARCH)" \
+	ARCH=unused \
 	C_COMPILER="$(TARGET_CC)" \
 	CXX_COMPILER="$(TARGET_CXX)" \
 	PREFIX=/usr \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
