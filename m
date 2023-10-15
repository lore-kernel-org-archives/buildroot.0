Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13934C04AAF
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 898BF414C6;
	Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898BF414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oGix-7H0M8y; Sun, 15 Oct 2023 19:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B64E0414A4;
	Sun, 15 Oct 2023 19:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B64E0414A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1BC1BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6265D414A4
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6265D414A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozG-3MXz6X_U for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 19:45:18 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CAA4402D0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 19:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CAA4402D0
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so582324f8f.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 12:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697399116; x=1698003916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dcbc72SUZ5C42DKiAnZe3GzYHxkWCtNpLbGDpRmh9Og=;
 b=P8DK38J0ClBxtKKdS2U2zZWWYPXp4v6TOYILEs2YVcbGU0sodT/U9ufr9Wny1Oad5l
 e196uqQ/MXZcuxQMND3jkK/t1jW2SWu8qG+nu6N4d1pL+IN1MWSHRlikhlyzZhV5QCIr
 Y15hK/qw3AbIY47L1ZgAXK9v8/OQrFgzHhllZyAn8feljgsjqJpPmKQQMhCo4UP6scuS
 WvtZmPaoRFQSv9QgT2GD+8H8PZDQeG4jSIgMXKobLM+cEhZ8cqk/x/EpE7yUzx5kDeUX
 Zx75Za5HPiyOdv+I/MzZRRh5STVxQNVced9pDUxY8qozilIM4lgBzczIRIXbhwPDMk+8
 nCQw==
X-Gm-Message-State: AOJu0YzjMc/tSmkmvU1/WKSEBET/b1uLWwyBpg4/q3sunRHxFUgIo/ED
 gPpQAuH6xgHecHPKsroNsuGPxu+jNZ8=
X-Google-Smtp-Source: AGHT+IG/kZyn2HVeM5WeCIYEJ7rblqH2aVvB3jiUnnL0WVDGgXExRtxN2K7x4DVt0ZJ7mELejPaABQ==
X-Received: by 2002:a5d:4f01:0:b0:32d:b184:3822 with SMTP id
 c1-20020a5d4f01000000b0032db1843822mr1224449wru.54.1697399115481; 
 Sun, 15 Oct 2023 12:45:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bx7-20020a5d5b07000000b003232f167df5sm198858wrb.108.2023.10.15.12.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 12:45:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 21:45:11 +0200
Message-ID: <20231015194511.1158058-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697399116; x=1698003916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dcbc72SUZ5C42DKiAnZe3GzYHxkWCtNpLbGDpRmh9Og=;
 b=B8cDJLOVNaJkRhBwB/B1elC2/f75BOGz0pfe3VLrjkHJqf2PBnNmKBy/hxLmSveIFN
 d5MwW72DcmEJbMefG9uBJBOASB4+wyWS0a7J5OyXF/UZ7q+mFppeyraYWsHgEEQBlZNY
 yV7J/byvsLfBfL/+2kurbCA3FeGzzVSUlhzn3ijcjE+5V1uQyFktFLHY5bNTIBFQPQn9
 am0ToM/sYtOEQUQL0lJbywZZ55Cot2J/xdY8osJHkMRLOi+wem7AVwflVQN79o/a/9wx
 xEmlXVCKar6fbZ8J3bT8l7tslVFC5+p8hFFY8WaPb44rS/ewxFgemOXLQ+C7LKZPbCyW
 DGZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B8cDJLOV
Subject: [Buildroot] [PATCH 1/1] package/casync: fix build with gcc >= 13
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
Cc: Yair Ben Avraham <yairba@protonmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 13:

In file included from ../src/compressor.c:3:
../src/compressor.h:59:59: error: unknown type name 'size_t'
   59 | int compressor_input(CompressorContext *c, const void *p, size_t sz);
      |                                                           ^~~~~~
../src/compressor.h:19:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
   18 | #include "cacompression.h"
  +++ |+#include <stddef.h>
   19 |

Fixes:
 - http://autobuild.buildroot.org/results/ab08f3b90d253db45643dd058b80ae1dd5f49d0f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-compressor.h-fix-build-with-gcc-13.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch

diff --git a/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch b/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch
new file mode 100644
index 0000000000..32af9142a7
--- /dev/null
+++ b/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch
@@ -0,0 +1,40 @@
+From 8db993c32f97188bdd6de4b2aa177fc513ee7e9f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 Oct 2023 21:22:58 +0200
+Subject: [PATCH] src/compressor.h: fix build with gcc >= 13
+
+Fix the following build failure with gcc >= 13:
+
+In file included from ../src/compressor.c:3:
+../src/compressor.h:59:59: error: unknown type name 'size_t'
+   59 | int compressor_input(CompressorContext *c, const void *p, size_t sz);
+      |                                                           ^~~~~~
+../src/compressor.h:19:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+   18 | #include "cacompression.h"
+  +++ |+#include <stddef.h>
+   19 |
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ab08f3b90d253db45643dd058b80ae1dd5f49d0f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/systemd/casync/pull/270
+---
+ src/compressor.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/compressor.h b/src/compressor.h
+index 2c9f93b..ae2eb30 100644
+--- a/src/compressor.h
++++ b/src/compressor.h
+@@ -4,6 +4,7 @@
+ #define foocompresshorhfoo
+ 
+ #include <stdbool.h>
++#include <stddef.h>
+ 
+ #if HAVE_LIBLZMA
+ #  include <lzma.h>
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
