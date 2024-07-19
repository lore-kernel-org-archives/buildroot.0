Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924D9C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 21:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5806883ED8;
	Fri, 19 Jul 2024 21:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMNxGQXaAeLX; Fri, 19 Jul 2024 21:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F13383EE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F13383EE4;
	Fri, 19 Jul 2024 21:24:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E96541BF4E7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D783C402A8
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PiC5Fzy7Pg5 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 21:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D64240175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D64240175
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D64240175
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 21:23:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-427d8f1f363so6416435e9.2
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721424237; x=1722029037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nDt7Dw2Hur5nZx+1mzV2sIU4wHbOCneAvgCt59D2Kro=;
 b=OxPt2t9zGJqfQ/PG2IoOrLAJWAbPy2jmnDpUNBmRtSAhpp2m1UAgTAxWRbZ4jm+8D4
 Wlg1Roab5jGrgRppL6VDan1MOvuV3p2HaZ7LyLTImVCQ5IVdbu4WwDRva84kkkuSLh1+
 aYuAaTYazpNH6Du6mlGL5gVkgQaxpPH3ovkKuc71GX/wdCv1Dd6ENCY6hlLggSLOy1sG
 BDKlu9RYBf+56GHY1cVwtQ9mSxNdKcXBLpv8T/X7J5Jl8hrdKM/kcG7RtIx8M4eqQaB6
 hzWFRhaL8eYh78QQ6hgE9WLn62ioKjQETaDGBd4JjuCNuoMEkkj8k7xAOLTDKKS3UvXv
 khFw==
X-Gm-Message-State: AOJu0Ywkmm3Acmhjf1B1rYlL0dDuC84PhRaDusfVseDy+9QlUSxyZNaC
 +myxpeLaU3aupLgirpFIyfGSzzxa9W+jTl1QTEzQtFuIYJeLGQWbCEGcLQ==
X-Google-Smtp-Source: AGHT+IH6rU0tuuvL7HLT2T2FMn0QqXj67PO0pCUObUW6+ZduY8B/UXi/UY1F1hldRItTcL2CUZrqlQ==
X-Received: by 2002:a05:600c:4f55:b0:426:6765:d6b0 with SMTP id
 5b1f17b1804b1-427c2cc375emr57111685e9.15.1721424236617; 
 Fri, 19 Jul 2024 14:23:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a5c564sm64061755e9.14.2024.07.19.14.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 14:23:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 23:23:54 +0200
Message-ID: <20240719212354.19307-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721424237; x=1722029037; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nDt7Dw2Hur5nZx+1mzV2sIU4wHbOCneAvgCt59D2Kro=;
 b=MO55gM1YLAVQNQX/YqtCkFBsGPypXKd6BJBXywMe3TngUpjQs49ne/cyxscSlXRk2j
 pwdmzeVke1mtpyvNBeiky5Hro/3exxZwLcm4IuTfXWc+eft3qSNqYz8uyplSFKICOAdB
 YPmfloKkfg+eDjxSU/d5YDiT/xzIqqal06/EvnevLT2rTC+1JJZd/jUiPKa3VwMq81k+
 /hfD53BxrS/OUKq1Z4EfQdONBR0X+h8cL00aPHzRRkE817EV9bmWUgauTv0rzO3zkmLb
 AZIhBq4SxLjTe/Gv4euPobOGB5XVCnWQIFsvadCuWKu1TyYpo7Y+1BRyGqZ2Z5OwoOX6
 SHmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MO55gM1Y
Subject: [Buildroot] [PATCH 1/1] package/liburing: bump to version 2.6
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

- Drop patch (already in version)
- Update hash of README (typo fixed with
  https://github.com/axboe/liburing/commit/2c89b57f3d55b2e3098a629e8aabe659fd5ec138)

https://github.com/axboe/liburing/blob/liburing-2.6/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-src-arch-aarch64-fix-uclibc-build.patch | 39 -------------------
 package/liburing/liburing.hash                |  4 +-
 package/liburing/liburing.mk                  |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch

diff --git a/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch b/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
deleted file mode 100644
index 4468105e4f..0000000000
--- a/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f03f8da34fe96ac35a916ca3058b0f41971eae3b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 16 Feb 2024 18:59:42 +0100
-Subject: [PATCH] src/arch/aarch64: fix uclibc build
-
-Fix the following build failure with uclibc-ng raised since version 2.3
-and
-https://github.com/axboe/liburing/commit/c6bc86e2125bcd6fa10ff2b128cd86486acadff6:
-
-In file included from lib.h:12,
-                 from setup.c:4:
-arch/aarch64/lib.h:7:10: fatal error: sys/auxv.h: No such file or directory
-    7 | #include <sys/auxv.h>
-      |          ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/cc44d714c9267dd7a98debeb8c81c4ee1efe4ebb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/axboe/liburing/commit/32f9c27a76c43627f79bb77469d2da8583e4d3df
----
- src/arch/aarch64/lib.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/arch/aarch64/lib.h b/src/arch/aarch64/lib.h
-index 3b701b1..41bcfc9 100644
---- a/src/arch/aarch64/lib.h
-+++ b/src/arch/aarch64/lib.h
-@@ -4,7 +4,6 @@
- #define LIBURING_ARCH_AARCH64_LIB_H
- 
- #include <elf.h>
--#include <sys/auxv.h>
- #include "../../syscall.h"
- 
- static inline long __get_page_size(void)
--- 
-2.43.0
-
diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index 30458c6b9f..f06dd187a7 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  319ff9096a5655362a9741c5145b45494db810e38679a1de82e2f440c17181a6  liburing-2.5.tar.bz2
+sha256  78bcc0dc0d004a238d8b5f597adbb4ec74926352a3983b872db7f0efdb72565d  liburing-2.6.tar.bz2
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  2ec12f7934cdfce25ff72b0557738989d79fc7a496d1cf9b2d3f9464fd61edbe  LICENSE
-sha256  51e124279343177cb3c214ffddc011f1355b6eba0bbefca4f4c41fbc56574c92  README
+sha256  b0731ca09e6f4718d456a989d32b6c61bf27e5d4bab6ca31e409d75c5120d19e  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 2c448d6a87..fc3993b38c 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.5
+LIBURING_VERSION = 2.6
 LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
 LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
