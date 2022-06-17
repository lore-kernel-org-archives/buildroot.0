Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B9C43334
	for <buildroot@archiver.kernel.org>; Fri, 17 Jun 2022 20:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4348B81763;
	Fri, 17 Jun 2022 20:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4348B81763
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nvFJaa5+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtUTiIwhiSCg; Fri, 17 Jun 2022 20:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EF4E81656;
	Fri, 17 Jun 2022 20:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EF4E81656
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAFD81BF489
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 20:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1EEE81656
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 20:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1EEE81656
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvjOXI4c4Ob0 for <buildroot@lists.busybox.net>;
 Fri, 17 Jun 2022 20:40:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBE3814BA
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EBE3814BA
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 20:40:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so4884657wma.4
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0amp63JVK/4OaiSZCPxAWbi1JaaW8aH4AM4CFRVecY=;
 b=nvFJaa5+1C+VhwPidtk5QtWIJ7sHB62do4+mWs/fs/VK0x8s7T2wvJBqfPoNQcLe1l
 cFj5Z/v9fAsfuj/uggfhEAEeLA7r8lu2pSj0LYgUE+nIrdGfKwTjDcNG/wJ2HD3fgkhK
 0j1zpjg7S2VumgY4rvaosQZlc8t3mZ/tWXduXo/umX6wBHugZEyb1UQpfP3VL3FcN7cD
 hDmSHC0mVIth+wMJm4XF7pYVhxycezqfPf9IfDYeEfkN7g7sZstL3XbHC4Wt57emWNd6
 NZDd2jrR48sT6Ij+ULEDXWBeuxHNM6of4TsyX2uGiNq+NXaoXYKajMwMo3L+VnSWwjhf
 Kzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0amp63JVK/4OaiSZCPxAWbi1JaaW8aH4AM4CFRVecY=;
 b=ph9sUscB4FuPyGkV+6OsWoBIamZqPzr4GTBsm0+wbAFfBe5BI7T/UczK5UsUri2vWe
 3VI2+YhmTMNfZCH85/EDa6wkkdPgi9Z7cm32PeFAFvYYmO+CmD/E/ndTgSeNOIK7NpF4
 e4mbKDcqoEzW5CZCJuQA1M6DnyeMhDysNklWFwWqRmf5v5WHMurd7YEe0SPOI7xp7U7j
 ZuttdUsvQi43iDKufSg2sjmXH8wVKPPmBJFxqpH14wPPfBcWg4Ql0/ebSkVr07a9eOyQ
 5ZUy/xoLflRulwFk0vF105cdxJxDW1nIiNkLatq0Po4MA02EWMisNvgUutSTUfjiuYSg
 fv3g==
X-Gm-Message-State: AJIora+kxVyNkCvLNpW9QRFoD3JS1C6Seca1GI54zHBbZNwZe9vzH5Nb
 I3kvwmj5Rso7qhT2MAwWNJUgsrFr65U=
X-Google-Smtp-Source: AGRyM1tqw+qtVejA4C6UwoKURautuhmfRuDvi3t6b9eg9tA1P6+2+yKqOTlqkWIDTefWNryqjaTZlw==
X-Received: by 2002:a1c:7416:0:b0:39d:bd9d:b200 with SMTP id
 p22-20020a1c7416000000b0039dbd9db200mr13967602wmc.98.1655498438312; 
 Fri, 17 Jun 2022 13:40:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b0020fe35aec4bsm5832282wrr.70.2022.06.17.13.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 13:40:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Jun 2022 22:37:58 +0200
Message-Id: <20220617203758.11452-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libabseil-cpp: fix musl build on
 mips
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

Fix the following musl build failure on mips:

In file included from /nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/low_level_alloc.cc:26:
/nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/direct_mmap.h:49:10: fatal error: sgidefs.h: No such file or directory
   49 | #include <sgidefs.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3fa027e602bacb22316fb5d9b233baa0b0f0e845

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...direct_mmap-h-fix-musl-build-on-mips.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch

diff --git a/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch b/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch
new file mode 100644
index 0000000000..0f77236843
--- /dev/null
+++ b/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch
@@ -0,0 +1,55 @@
+From 53a90f079af7ab491530d432bb318a95371ba877 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 16 Jun 2022 14:28:53 -0700
+Subject: [PATCH] PR #1197: absl/base/internal/direct_mmap.h: fix musl build on
+ mips
+
+Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1197
+
+Fix the following musl build failure on mips:
+
+```
+In file included from /nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/low_level_alloc.cc:26:
+/nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/direct_mmap.h:49:10: fatal error: sgidefs.h: No such file or directory
+   49 | #include <sgidefs.h>
+      |          ^~~~~~~~~~~
+```
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3fa027e602bacb22316fb5d9b233baa0b0f0e845
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Merge c9b5b5c5471213a871f7d6d1d2fc8f6899effbac into a184bab83ffcffc2aaac49a3900361158ab3890f
+
+Merging this change closes #1197
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1197 from ffontaine:master c9b5b5c5471213a871f7d6d1d2fc8f6899effbac
+PiperOrigin-RevId: 455467767
+Change-Id: I1905f7d70e914288bc1524a52adce3476a779fd8
+
+[Retrieved from:
+https://github.com/abseil/abseil-cpp/commit/53a90f079af7ab491530d432bb318a95371ba877]
+---
+ absl/base/internal/direct_mmap.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
+index a01d61220..e492bb004 100644
+--- a/absl/base/internal/direct_mmap.h
++++ b/absl/base/internal/direct_mmap.h
+@@ -41,13 +41,13 @@
+ 
+ #ifdef __mips__
+ // Include definitions of the ABI currently in use.
+-#ifdef __BIONIC__
++#if defined(__BIONIC__) || !defined(__GLIBC__)
+ // Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
+ // definitions we need.
+ #include <asm/sgidefs.h>
+ #else
+ #include <sgidefs.h>
+-#endif  // __BIONIC__
++#endif  // __BIONIC__ || !__GLIBC__
+ #endif  // __mips__
+ 
+ // SYS_mmap and SYS_munmap are not defined in Android.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
