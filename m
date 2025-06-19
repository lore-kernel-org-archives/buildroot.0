Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BB3C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 08:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DA0F4044F;
	Thu, 19 Jun 2025 08:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sF0wQ2rWzlK; Thu, 19 Jun 2025 08:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83AE94046C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83AE94046C;
	Thu, 19 Jun 2025 08:26:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB973E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 08:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E700980CA6
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 08:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuKtuCUkDXfM for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 08:26:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E44A80D57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E44A80D57
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E44A80D57
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 08:26:11 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-adfb562266cso87305966b.0
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 01:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750321569; x=1750926369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jeQS0ombrJf6T4jwUK7LRQ/G/BreCKBQT3O8j3PPJnU=;
 b=UDFf7R/g4c2k7ASHhWYDvEuxqCHbTI7jI+ZIchJ7JW8w3MngH2J8GFS4FYf/TLjeyM
 EnAdt++wYJ5Hgf0H0Qo4RQKT7sXZ4sM5+nh0Od3aF44ZIrc1YIt1EyJQcICbrMPXNWkv
 /0MJB45nUIAYGYqxZudO1m699lOJAte5upEGSeJbfygiXyFIF2YOdlBaqE1s3CkabN52
 EMod81C+0eO6X0Tuw/x/szZ6EVuluKlZ1QC+CtI4p1Px7wXWusWdNj5gunV288+LhX3m
 A5AfVaZVIc8HH2bIMNgy6Q62FFXefzJvpt59QZQh4FN5KRLWkhHNg49id8NgWwN8e2YV
 N2Dw==
X-Gm-Message-State: AOJu0YxI4HV74OKHNjavevrvmdKZAXgzJcCoKNdHzHytMDMlmzp1S3pC
 gpkhBz3p3FrforzpY0meSlnvZXMOe1ncKVSjjd03LDGoOcN4NPpJwod1e6vUkA==
X-Gm-Gg: ASbGncv+tuEmIwk7T07Ak+WP93J37ncpSLwgO2kv8sDCQw9iv9LvnN35TmfCXKguNZ8
 oUutAh3PK50gjoGtlY6RlbXruiuYfGxzMF4AHTdGR2Bnww3WDaIoPZeKDXtQyIzI/LjJmCLzVOS
 Fw8zJh4jQy96X+Msp1w6t27c/rAqVA/O/OaZ4wSECZQ0oPLv/h29Hn6DSSEi/ipy32gpllZ277D
 kA5MLN/1FfDsfRrLQTZVcI/ZYRbhgEoYWg5clvoiE9fJeqWmdm76jW3fn3MtNyWCIPWaMbzLUVb
 CN2blPUCwyUHScSnHSam1OuYLVQ5czpE9R+Y5GwOJXtKa1jJG0CPvXIEfRB1nHRHoM9nFHp1HoQ
 TjEcFbjmF3TYbLmWSQ3aSY+w6h+nmgrsCpEQ+W4p/Y0w=
X-Google-Smtp-Source: AGHT+IGVrgxuk5Ij6rn/R3v7PiICTbnT8WqnANW0qaoA17jUzkb8Mrk8E42WNLotuEp226KZ9nm8mQ==
X-Received: by 2002:a17:907:6eac:b0:ad2:4785:c4ac with SMTP id
 a640c23a62f3a-adfad44a0a6mr1941557466b.40.1750321568680; 
 Thu, 19 Jun 2025 01:26:08 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf2a174072sm1103589366b.32.2025.06.19.01.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 01:26:07 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Thu, 19 Jun 2025 10:25:59 +0200
Message-Id: <20250619082600.2176432-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1750321569; x=1750926369; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jeQS0ombrJf6T4jwUK7LRQ/G/BreCKBQT3O8j3PPJnU=;
 b=MeujQOOBBqQQLeOH8SaVGw52Te82gkNZsZIgMALB1n/9hV8fgSYWKHfjITW2H5kH1r
 aqAha+zr+KzcWqJN3p/9zQ76NSM7iRxprs0q55hj9kbAMiQy2UDFiWOn4Luenydci0MF
 blNbM/tN/j3KUVN+6fbq2dpbzX67Mm1uCcIfgyYm5FCJnXlSqSfh/YPPeBZjzDQVEIFo
 18Ziqg+IGlbqsDjnqzlWNZ+RCirdN4yzgSNEhN9UKf0TWFh+aMLQxnLVwU04oLhYL+yG
 fTYRYsA6jJFWhdM3PNeVQyC0qN8mo+7Ah4Y3EHyKxkwrDLeHFmOgmox4KOwC34z5J86R
 1jlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MeujQOOB
Subject: [Buildroot] [PATCH] package/watchdog: do not guard shutdown
 __GLIBC__
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
Cc: =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= <alejandro.gonzalez.correo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

These headers are provided by uclibc/musl/glibc and bionic so we can
assume they are not needed to be glibc specific includes. This also
ensures that we get proper declaration of reboot() API.

Upstream:
https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/

Fixes:
https://autobuild.buildroot.org/results/3e67d5b3b89d794e3f6c510803368f8b100b07a7/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...0001-Do-not-guard-shutdown-__GLIBC__.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch

diff --git a/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch b/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
new file mode 100644
index 0000000000..eceaf11501
--- /dev/null
+++ b/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
@@ -0,0 +1,40 @@
+From aa371bf201b1d59c595a1ad7b3464ae544ed142f Mon Sep 17 00:00:00 2001
+From: Paul Crawford <psc@sat.dundee.ac.uk>
+Date: Thu, 16 Mar 2023 11:42:34 +0000
+Subject: [PATCH] Do not guard shutdown __GLIBC__
+
+- Patch by Khem Raj <raj.khem@gmail.com>
+
+- These headers are provided by uclibc/musl/glibc and bionic so we can
+  assume they are not needed to be glibc specific includes. This also
+  ensures that we get proper declaration of reboot() API
+
+Upstream:
+https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/shutdown.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/shutdown.c b/src/shutdown.c
+index 1d9a857..6aea0d0 100644
+--- a/src/shutdown.c
++++ b/src/shutdown.c
+@@ -29,13 +29,9 @@
+ #include "extern.h"
+ #include "ext2_mnt.h"
+ 
+-#if defined __GLIBC__
+ #include <sys/quota.h>
+ #include <sys/swap.h>
+ #include <sys/reboot.h>
+-#else				/* __GLIBC__ */
+-#include <linux/quota.h>
+-#endif				/* __GLIBC__ */
+ 
+ #include <unistd.h>
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
