Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E83BC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22FE781E24;
	Tue, 13 Feb 2024 21:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nslo8Dgw7nkn; Tue, 13 Feb 2024 21:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AA0A81ECC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA0A81ECC;
	Tue, 13 Feb 2024 21:05:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96A911BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84AAB4085C
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRZKjn3jjSuV for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81D4C40813
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81D4C40813
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81D4C40813
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:05:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-411d2836b20so4529735e9.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858326; x=1708463126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9lv+KvuDpoIdZRblukfK1SvEyT3XZhxkMeXIeCKo2Q=;
 b=vSzsXrS+bJBK3GZ7rQj+2eBwnFy3mPPf4/LgfsZiRuYAQfoeCrVCdmH6q791zK/vVM
 kXDTHDljFHEbGzWCQHxAbuYCGMenwKzBPUqdwM3PDaVlcoOZTz3p5tEueXPJCmY0zWrQ
 irVYggzVECuxcYLDLyj6fd4Gbk0Rye/WEtUmp9H9m49ZXat9o5bdHCy48C/CApyyXueR
 LlvM1DkmjeF/Pkhm6rFHox+cjQC+b5NXO4GAfH0FxYDQmAZPuqHpDg6xyTfmJVmIob7h
 6wztes8UBJrCZS+yHwtlIkQWtmpctd75tH6OG0d/P9TZFrrKHSilMvGFzyyOmamwUb+v
 DHbQ==
X-Gm-Message-State: AOJu0Yxk/Yelj/EnwOoqRGuGuRt+cZa6+M8RkzWGZqIJn+3jri4gCvUV
 jVqSjt+Tcfxh46N282o1G9y3eQtd8g3f2e9WKa42hKcG+oRtdPHQ0G7or3ZejyI=
X-Google-Smtp-Source: AGHT+IEQMkUy9dn8OC16YfjbJ2RbkFmLHDgRX71vrpj1cWf51g5T/4x+WADbM2aC20lMrGxyrbXPtQ==
X-Received: by 2002:adf:f243:0:b0:33b:87a0:3af with SMTP id
 b3-20020adff243000000b0033b87a003afmr283961wrp.67.1707858325958; 
 Tue, 13 Feb 2024 13:05:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXfNgxKWVT6s1vzpXIdJKuin9Uml+2SiYoPuEoj1BMt5VLp+k6iRrqnH8zi+oCmwH5ZUn85S4pcMLI9FUiIJo6HEX+MB2jYdbu2Gg==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 cl3-20020a5d5f03000000b0033b7ce8b496sm7960998wrb.108.2024.02.13.13.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:05:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 22:05:23 +0100
Message-ID: <20240213210523.166319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858326; x=1708463126; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e9lv+KvuDpoIdZRblukfK1SvEyT3XZhxkMeXIeCKo2Q=;
 b=mSzSVqFLse2+rmUbLc8pzZwe1YHuB/tH+4Uf//7wxOIW4/Q6sH67tig5I3gQONcOy7
 zJIwgLfiY0s1K24OU1VFrTJmmvBFNKpxmENylCteY5mbSX46Xc17WlI5BGQmUpk+gWIM
 4TtzGhMRnJbkiOtRLIHSIuegd80/bzm9PHzr73KInJagUPXsLRxPaHusbnUla9efqlth
 9R6zUC5S0B9p3B5O0oDDxG3/3b8sxdCpggBJrNZ2/7WKjSUp54l9Ss/o51kpWmnDgVs5
 deXbsauLGXJ46R/Y96CgH3rNdcQ+QK2IZQuMmfmDDa1UIGTm2nhPVtaCy9pEof6xeg0B
 1I0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mSzSVqFL
Subject: [Buildroot] [PATCH 1/1] Revert "package/crun: allow building with
 uClibc"
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 223596c75d73a7eb29152235d3c5d9bf53bd58f5 indeed
fexecve is only available since
https://github.com/wbx-github/uclibc-ng/commit/858ffad217076227089cc17eb832db0bd1497792
resulting in the following build failure with uclibc < 1.0.33:

/home/thomas/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: libcrun_testing.a(libcrun_testing_a-cloned_binary.o): in function `ensure_cloned_binary':
/home/thomas/autobuild/instance-3/output-1/build/crun-1.8.4/src/libcrun/cloned_binary.c:540: undefined reference to `fexecve'

Fixes: 223596c75d73a7eb29152235d3c5d9bf53bd58f5
 - http://autobuild.buildroot.org/results/9c4488d5d26e575f39bcbaed8e0793ed1cdb8cd5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crun/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index f6a1ec7c66..bbed21817e 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
-	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_YAJL # libocispec
 	help
 	  crun is a fast and low-memory OCI Container Runtime in C.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
