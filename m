Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CAFC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 18:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 273D981CAF;
	Tue,  6 Feb 2024 18:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8K-BCuK7Z01; Tue,  6 Feb 2024 18:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FCFA81BF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FCFA81BF5;
	Tue,  6 Feb 2024 18:04:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 516961BF31F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 18:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2941B40B67
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 18:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2941B40B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mu1uWX1_fxCX for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 18:04:31 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C070040A39
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 18:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C070040A39
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b401fd72bso1644134f8f.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 10:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707242668; x=1707847468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L0rSTpFmChtX7lX3UAUf8PMqqJHahvrBim7dB7EHats=;
 b=VxrXl3/uQJVvo9m1FXxorHV+fuAoETH0XwO+GOykPn6ROEOudq+wKp9KdC0imnYuZd
 JivDnfKDdqQIZe/rMxCXIsrRhXQGxD+GStsJTqzinJkvl+HZpR94dIflMvcSVWE4bn9b
 YrGrZvMVXR//1Bx4TSrAK8I7L58R9kpzhWSvlKUWLLHeYsAfcJdW0RxVLxYSzK0WgEPG
 P/fL4/J7n4n7DTUqUO6EEpWlxgPgwors5dQNi9Bf1Ftc5+Ju3s18Bz2PWJq27SXYSr0E
 yB2jl2d0Ibqw3ncO5ZgDGj6/1/UPlldZlqWjkRTwdCakeHcsbpCjmLOq/gFrJC7cT24l
 oZww==
X-Gm-Message-State: AOJu0Yx1Br14vEaHXFiBlAFYAoxqbQlH1eci3bxjkoOtC/jPERjrNvD0
 7zm0RilZ8SNSuwi/Jml+4mLpSGD/ty1p00Q/BSVc/bX7nivQZAUgjcLSjLURIlo=
X-Google-Smtp-Source: AGHT+IFERILqZKTpWjvKGO9nRwYbUumJo3Ftasb/4/7Ou0Uffofyvkg9zZolX/wGrHzkJKiIL9ZBLQ==
X-Received: by 2002:a05:6000:4008:b0:33a:edaf:13ec with SMTP id
 cp8-20020a056000400800b0033aedaf13ecmr2452149wrb.14.1707242667795; 
 Tue, 06 Feb 2024 10:04:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w4-20020a5d4044000000b0033b3cd4ad89sm2612596wrp.59.2024.02.06.10.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 10:04:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 19:03:41 +0100
Message-ID: <20240206180341.3910-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707242668; x=1707847468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L0rSTpFmChtX7lX3UAUf8PMqqJHahvrBim7dB7EHats=;
 b=cODDgejD7Ye52yP2aSLPA7QQJxEvWpJjTYhMwiOblSumix2t/4Q+tmpCIPTzKBA29e
 cm7pBckawRwKph3FDuFUPc17fT26mHtgcU8DjSEebgm0/+4y3hkztZc3VFdCfIjXxM7+
 SZrj5TrNKOpDtcWUHWnj6+SZGHQXEzHdueJY1VucF0cU+pmhhpUKUg66fF/YyF9FsZoA
 0dXf5RzhsNLXDZu/+Q8SJ2Xy6CMOU1HRTPZaXjOtn2gQK+lHXD9hShN6T/9koOVtloNM
 Ia3Qk+tQpMCMZSTLHxk8J3TYBGUCZxpm+9wc8ITWb3T4hGX1aQ+w71Wfd8M7sZI3RNWN
 MdvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cODDgejD
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: fix musl build
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

Fix the following musl build failure raised since bump to version 1.6.0
in commit 7794fa4c4e1d19a245bb0367cde94560432a2bc5:

pam_namespace.c: In function 'process_line':
pam_namespace.c:649:41: error: 'SIZE_MAX' undeclared (first use in this function)
  649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
      |                                         ^~~~~~~~
pam_namespace.c:41:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
   40 | #include "argv_parse.h"
  +++ |+#include <stdint.h>
   41 |

Fixes:
 - http://autobuild.buildroot.org/results/f07360f33010a2cf19aace266faae14a834bd9a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-pam_namespace-include-stdint-h.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/linux-pam/0001-pam_namespace-include-stdint-h.patch

diff --git a/package/linux-pam/0001-pam_namespace-include-stdint-h.patch b/package/linux-pam/0001-pam_namespace-include-stdint-h.patch
new file mode 100644
index 0000000000..59d2e8700f
--- /dev/null
+++ b/package/linux-pam/0001-pam_namespace-include-stdint-h.patch
@@ -0,0 +1,42 @@
+From cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13 Mon Sep 17 00:00:00 2001
+From: Jacob Heider <jacob@pkgx.dev>
+Date: Wed, 17 Jan 2024 11:49:26 -0500
+Subject: [PATCH] pam_namespace: include stdint.h
+
+pam_namespace.c makes use of SIZE_MAX but doesn't include stdint.h,
+resulting in the following build failures on 1.6.0:
+
+  pam_namespace.c: In function 'process_line':
+  pam_namespace.c:649:41: error: 'SIZE_MAX' undeclared (first use in this function)
+    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
+        |                                         ^~~~~~~~
+  pam_namespace.c:41:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
+     40 | #include "argv_parse.h"
+    +++ |+#include <stdint.h>
+     41 |
+  pam_namespace.c:649:41: note: each undeclared identifier is reported only once for each function it appears in
+    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
+        |                                         ^~~~~~~~
+
+Fixes: v1.6.0~100 ("pam_namespace: validate amount of uids in config")
+Resolves: https://github.com/linux-pam/linux-pam/issues/733
+
+Upstream: https://github.com/linux-pam/linux-pam/commit/cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13
+SIgned-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modules/pam_namespace/pam_namespace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
+index f72d67189..b16731c22 100644
+--- a/modules/pam_namespace/pam_namespace.c
++++ b/modules/pam_namespace/pam_namespace.c
+@@ -34,6 +34,8 @@
+ 
+ #define _ATFILE_SOURCE
+ 
++#include "config.h"
++#include <stdint.h>
+ #include "pam_cc_compat.h"
+ #include "pam_inline.h"
+ #include "pam_namespace.h"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
