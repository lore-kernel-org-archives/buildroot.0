Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566B8C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16C7F40217;
	Sun, 12 May 2024 10:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZnIpm7G5Gkr; Sun, 12 May 2024 10:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F274D40354
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F274D40354;
	Sun, 12 May 2024 10:15:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9F01BF232
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 349C340354
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rECeqFWNMvC for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:15:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA02440217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA02440217
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA02440217
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:15:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4200ee78e56so8035485e9.3
 for <buildroot@buildroot.org>; Sun, 12 May 2024 03:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715508926; x=1716113726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YmA7qkTPUKAgFw/kvFXk5e0Qw/UmPwJeZRKIESLfU8o=;
 b=MYB4wCtBRa0k5pik70PvKa/kJejKb/58b+aNx4HJcEnB5caOkC19a1RUz7Drb4CTU5
 rElyLsLO8TctGfrd5/7OA6wx3ZcQtpY7m8PmSrYQRR4EvZBa5cwMQ5ErjLsa8xjr+3OX
 EyoN4eNLRJKCECLNvhSRP6LdhlDUwvUxEXrrbXw0bdZ8WdP9qRhazT/8a5abmVraXGBv
 UbXafCHkPeNxxWRey+Eb4pIBKp365SjqXr74dYeh1EqOCbj2vfWfHM8AIiFh24cTWopI
 61rfs7Ap5zDCmp06MkPHx8F5LiQ1AmcDxvESpZgGXrpZDso31zeWIrRefwuvF+LJNbeb
 AEyA==
X-Gm-Message-State: AOJu0YzQe09J8HvmjJNr/e1juC+eETx/LbcEWVt0rq4cGtjGlO96j5Sp
 yVkYGiZDYW0ey2xfmi+sBHBCKFiyiL2599iGZKbP+JZWT5QpwlpcDHa8jg==
X-Google-Smtp-Source: AGHT+IG2WQUGw/zm+ppSG/WzDxqNTlJFrA8RksCt2ZeF4t3GMFldDFlE/+14omde0an/H3ym/Yog4A==
X-Received: by 2002:a1c:7706:0:b0:41b:7d6f:1f24 with SMTP id
 5b1f17b1804b1-41feab40993mr51293915e9.21.1715508925730; 
 Sun, 12 May 2024 03:15:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87c235b4sm156833855e9.11.2024.05.12.03.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 03:15:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:15:23 +0200
Message-ID: <20240512101523.35332-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715508926; x=1716113726; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YmA7qkTPUKAgFw/kvFXk5e0Qw/UmPwJeZRKIESLfU8o=;
 b=dteO+Zogm+J4XzboCNcvBGT03OO/VHHeB2HeiCbD4xB14r+y0BL2CaAETa3Ck2ytjZ
 oXGn9H7IHFzeXqMoZ5Z3AT65Qe1ufeajP0cIb0HENmcZZqIzkZiT4d6JG7Ir5R+Eh6d1
 td5injkuHiJAKEitR70HFRvojXss7dSHGbZnrlNKOAQFORgLbM9/dZIqKXvm6yBa1B+M
 mKLbe3acw6t8pcevghYyv2id9QixvlFhzH8dlH8hMpK8HhMOlMruoPn+pQVuhqFhA0B6
 USCOaHq/v8kCV1ZyYIwHKYtEjEtXeKT56wpqirM7VVIiyZrBAA/V4MfgdIwo4ymrWuyK
 aJsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dteO+Zog
Subject: [Buildroot] [PATCH v2,
 1/1] package/zlib-ng: fix riscv build with uclibc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following riscv build failure with uclibc-ng < 1.0.43 raised
since bump to version 2.1.6 in commit
47b6737e841baf8b666ea9f37edc5f169652e88d and
https://github.com/zlib-ng/zlib-ng/commit/6ff8b52cefe56a824fae1d53fdd687bcde2e53c9:

/home/autobuild/autobuild/instance-2/output-1/build/zlib-ng-2.1.6/arch/riscv/riscv_features.c:4:10: fatal error: sys/auxv.h: No such file or directory
    4 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Fixes: 47b6737e841baf8b666ea9f37edc5f169652e88d
 - http://autobuild.buildroot.org/results/06a7d8e59ec4de7c711d3f4a4624f67b97d78afe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix build failure instead of disabling package

 ...cv-riscv-features-c-fix-uclibc-build.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch

diff --git a/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch b/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch
new file mode 100644
index 0000000000..39cc93f929
--- /dev/null
+++ b/package/zlib-ng/0001-arch-riscv-riscv-features-c-fix-uclibc-build.patch
@@ -0,0 +1,51 @@
+From 3f35bfccff2d1dacdfe9844712be1e042d028700 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Mar 2024 21:56:53 +0100
+Subject: [PATCH] arch/riscv/riscv_features.c: fix uclibc build
+
+Fix the following uclibc build failure raised since version 2.1.4 and
+https://github.com/zlib-ng/zlib-ng/commit/6ff8b52cefe56a824fae1d53fdd687bcde2e53c9:
+
+/home/autobuild/autobuild/instance-2/output-1/build/zlib-ng-2.1.6/arch/riscv/riscv_features.c:4:10: fatal error: sys/auxv.h: No such file or directory
+    4 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/06a7d8e59ec4de7c711d3f4a4624f67b97d78afe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/zlib-ng/zlib-ng/commit/3f35bfccff2d1dacdfe9844712be1e042d028700
+---
+ arch/riscv/riscv_features.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/arch/riscv/riscv_features.c b/arch/riscv/riscv_features.c
+index 506b480c11..1e3f45e0a7 100644
+--- a/arch/riscv/riscv_features.c
++++ b/arch/riscv/riscv_features.c
+@@ -1,9 +1,12 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/auxv.h>
+ #include <sys/utsname.h>
+ 
++#if defined(__linux__) && defined(HAVE_SYS_AUXV_H)
++#  include <sys/auxv.h>
++#endif
++
+ #include "../../zbuild.h"
+ #include "riscv_features.h"
+ 
+@@ -33,7 +36,11 @@ void Z_INTERNAL riscv_check_features_compile_time(struct riscv_cpu_features *fea
+ }
+ 
+ void Z_INTERNAL riscv_check_features_runtime(struct riscv_cpu_features *features) {
++#if defined(__linux__) && defined(HAVE_SYS_AUXV_H)
+     unsigned long hw_cap = getauxval(AT_HWCAP);
++#else
++    unsigned long hw_cap = 0;
++#endif
+     features->has_rvv = hw_cap & ISA_V_HWCAP;
+ }
+ 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
