Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ED8C43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 15:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A755D405F8;
	Sun,  3 Jul 2022 15:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A755D405F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qUVO25MwFMoI; Sun,  3 Jul 2022 15:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0C87405E7;
	Sun,  3 Jul 2022 15:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0C87405E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A28E31BF3A1
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 15:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BDB4405E7
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 15:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BDB4405E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRPG6rA8i3HP for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 15:56:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DBDA400FD
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DBDA400FD
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 15:56:55 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so4127903wme.0
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 08:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nh9dH8uAgePkeIkZGdA2VxgGcgeCXgLVcmYvymPLGdU=;
 b=qstZ7zjmUsdQLZMZVfyNsqVnHN10PVubl3iachw1lDZV2HFopVaDy+6+ynLfgPMiav
 Z1plFXOtmeLHksX+3kYgiaWcaVVMqsqtPWCkVCerWV5e52FaakvtP6O9J76RQrSpO8sp
 WV1KOqG1JL+nZ7ZwKiE4Q83jIPgFdeE4AZasCSPTljlZe5ZxMAq8XgkOtGKpq3kIrsiO
 NJ1RmaNcxYVhEYNA+leHkUxBUcdUkWzFBplUhw7OOmXf/FcCCOBePNE0EC9Rv9d598+q
 g7TvlEMcaVe9ciOmkIX592xGZLwU+AGAblxy0CM2N/3Me1Fy13TOx5u9UMLJ3qEPy5pz
 vJyA==
X-Gm-Message-State: AJIora+ZkaEe/R5h95kcLCRQBaQcqi0SSo1kl9qK3xOBon7Y7O3J2Aii
 lx+LQsaSFjIAMENrq8//A99vi38SElY=
X-Google-Smtp-Source: AGRyM1s6XOt76lG3N2hQg6JF8fQe5enpR4gxfbR/ykJbPC5ZuIbTMYIXJbiKhEd2jy5vDHcMz2cFgg==
X-Received: by 2002:a05:600c:3481:b0:3a1:918d:6719 with SMTP id
 a1-20020a05600c348100b003a1918d6719mr11464674wmq.35.1656863813060; 
 Sun, 03 Jul 2022 08:56:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a5d680d000000b0021b93a483dbsm27876394wru.32.2022.07.03.08.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 08:56:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Jul 2022 17:53:56 +0200
Message-Id: <20220703155356.1356910-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nh9dH8uAgePkeIkZGdA2VxgGcgeCXgLVcmYvymPLGdU=;
 b=RmoK/QXZ0K+iMU2HMhtQhWn0K45ecxyqv0cmX3SGrhttmHqbSFLF0q37egUBYwTltO
 RCfswLiFCylHKiNw+TLY1QEWqFnKW8Q0imXaSUKwJpOJMlmL7PaZ0F+blpHl6TxoTbyH
 g2ZCvh3Yzi97WQFfc2cUcu436YN2sgmZP5vGrSEVLyPyJKuEB0UY8k4v1O2gRchj9aK8
 HG4+KYa/JXD7o57Dz2TR0fpK5VCEnmlHgV22kGVAlcorezNVhOm7D/nI5UoB/A6vpmr0
 r4tkBWU0zjD1UDjnb2CL6fGPgkwA6X+L3hNtCFS1oOLgBnpWYDFRohlOnvqp4c9z5R6t
 Qb4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RmoK/QXZ
Subject: [Buildroot] [PATCH 1/1] package/libcurl: fix build without
 sched_yield
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without sched_yield raised since bump to
version 7.84.0 in commit b034109dd60a429690acf9c5501c6658c53eae13:

In file included from easy.c:89:
easy_lock.h: In function 'curl_simple_lock_lock':
easy_lock.h:56:7: error: implicit declaration of function 'sched_yield' [-Werror=implicit-function-declaration]
   56 |       sched_yield();
      |       ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/fbc80a0002d640210c81a4c518856c02669059b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...de-sched-h-if-available-to-fix-build.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch

diff --git a/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
new file mode 100644
index 0000000000..b5f0a87218
--- /dev/null
+++ b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
@@ -0,0 +1,30 @@
+From e2e7f54b7bea521fa8373095d0f43261a720cda0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 27 Jun 2022 08:46:21 +0200
+Subject: [PATCH] easy_lock.h: include sched.h if available to fix build
+
+Patched-by: Harry Sintonen
+
+Closes #9054
+
+[Retrieved from:
+https://github.com/curl/curl/commit/e2e7f54b7bea521fa8373095d0f43261a720cda0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/easy_lock.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/easy_lock.h b/lib/easy_lock.h
+index 819f50ce815b8..1f54289ceb2d3 100644
+--- a/lib/easy_lock.h
++++ b/lib/easy_lock.h
+@@ -36,6 +36,9 @@
+ 
+ #elif defined (HAVE_ATOMIC)
+ #include <stdatomic.h>
++#if defined(HAVE_SCHED_YIELD)
++#include <sched.h>
++#endif
+ 
+ #define curl_simple_lock atomic_bool
+ #define CURL_SIMPLE_LOCK_INIT false
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
