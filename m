Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68362C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 173B5810ED;
	Tue,  2 Jul 2024 07:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9YEw56mc-S0; Tue,  2 Jul 2024 07:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1542C81130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1542C81130;
	Tue,  2 Jul 2024 07:35:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E92C71BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5603404F4
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FYc8sJapbAW for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49E3540460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49E3540460
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49E3540460
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:35:18 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58b447c511eso607273a12.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719905716; x=1720510516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Thp9f7niDRb2ASxVQqqJQImzv6xKGWrSGIxNkCbhlFE=;
 b=PioIKfGIW35eEQheuhiyBlYBVgSSU2Qog/qpSE4mHmTHxEzdnZcFltWYn6kloMobOk
 1sljA61FKheqOHkKektECHvY9gzqTgOLaKiYQaWreBIqaVXlrVGIE1DryKLuFbAxFvhX
 OvhGlAU8uTBaNozf4rbNtO9fPhwgQlnhVYo/vjkPJI/M+c2kl/ljXaRV0SzWkp7Gim4W
 QJ6vQghdCDHdzj1RK2wLbSCHJ54aKm7MiQ80WlUznwqgim8DqEzkgG/CDWpgUr7zhxjI
 ZchW7rjCq7pNJjCQ9Sv16oWBHLpXRu0gptMpjZbpaeGmkxhQD5R7+dO3aB970GQLAdQA
 ZKqw==
X-Gm-Message-State: AOJu0Yw4w7TfcBUUyGWXx+EESROYkw1YqewcKNMParmPaOeoGuQkktZT
 FHhWH8OHF2C+t/y4zh11NRfE8wyGKSFSBJek1zjt3kHuXoyVgcnGVtmc+FZlORAqZK71Mk6J6Yo
 o/tc=
X-Google-Smtp-Source: AGHT+IGPII9tbqQhxZ/+4274ZOigOGh/w3WHKMLy4I41RHT4UBXa+gNKgbi8bay9b3ybtxAbNBxPMg==
X-Received: by 2002:a05:6402:518b:b0:57a:27c8:3269 with SMTP id
 4fb4d7f45d1cf-5879ede2a86mr6645945a12.4.1719905715977; 
 Tue, 02 Jul 2024 00:35:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861503b4c5sm5262376a12.93.2024.07.02.00.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 00:35:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 09:35:12 +0200
Message-ID: <20240702073512.2378109-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719905716; x=1720510516;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Thp9f7niDRb2ASxVQqqJQImzv6xKGWrSGIxNkCbhlFE=;
 b=XV+txfZYu0W0Zs0BxrGNL4gmuxt6upw0DpRMmrMKcVN/K+Q+WWyhbEkGw6L21O3Mo5
 gwkUmWN07IbiDGjqw4uG4/omNqmU2nafBa91rzFkLnNQKBBGoYGG3rB82folt3/QBuQ3
 vPW9/LniPS00X8PCvLQAmXEQ4Zkzz9thseRKo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XV+txfZY
Subject: [Buildroot] [PATCH 1/1] package/ficl: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, ficl fails to build with output:

    Applying 0002-Makefile.linux-pass-LDFLAGS.patch using patch:
    patching file Makefile.linux
    Hunk #1 FAILED at 14.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.linux.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                 | 1 -
 package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 949b7467cfe6..0b613187a7f2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -615,7 +615,6 @@ package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch li
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
 package/ficl/0001-fix-Makefile.patch lib_patch.Upstream
-package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch lib_patch.Upstream
 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
index 2138089b0e9f..dd9e16412c6e 100644
--- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
+++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
@@ -12,7 +12,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: upstream is dead]
+Upstream: upstream is dead
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile.linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,8 +23,7 @@ diff --git a/Makefile.linux b/Makefile.linux
 index 5f1a41f..df887e6 100644
 --- a/Makefile.linux
 +++ b/Makefile.linux
-@@ -14,7 +14,7 @@ MAJOR = 4
- MINOR = 0.31
+@@ -14,6 +14,6 @@ MINOR = 1.0
  
  ficl: main.o $(HEADERS) libficl.a
 -	$(CC) main.o -o ficl -L. -lficl -lm
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
