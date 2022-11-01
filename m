Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7EFC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 13:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B3C813DA;
	Tue,  1 Nov 2022 13:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2B3C813DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVs3h_k6U-kr; Tue,  1 Nov 2022 13:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08C7E8134A;
	Tue,  1 Nov 2022 13:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C7E8134A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16BA11BF2EB
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 13:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5745812DB
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 13:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5745812DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCFHwIZ6MoKd for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 13:40:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795CE812CB
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 795CE812CB
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 13:40:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j15so20157968wrq.3
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 06:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C7WF0Tsp5awYD7YXv0fgWeLq7WfmmEgrfGHbcVr6lbA=;
 b=sPkzl5j1FIKMTxr9h00AIUmg8rCGU+YOC/eEkflTC5mbUiESzb/9N2cpr68dqbQ6NE
 VINaXd5LHNGALdi7GdN7n3AWlxjxQRiiMxthENXGWzrbrBGEdbEVu/SH2+O9nTXJme1K
 Z3Djp4ZFZeIAtXPAZ4Vh7J6E/WdFYaLSoJdvgz3CVpawW+Ni4QxFdSwnn9p/dcIySvCU
 WbP9MlQ06dmjI0CueLlb8hIogWSjtrOsq8TYP/i6gJOBIjfK5SiKXbPLFK1bTmNXJ946
 LU3xyJzzR4oGbjmvmCUVsibF6bDophWgPYPbp3XhHwfutC22qlTErWOe/v/ZUE6YIFEK
 Pttg==
X-Gm-Message-State: ACrzQf3uX333EqZz5fhJ1BNWzXV9mpHL0YA7n0+iVHdje1w63iDbF2T2
 uh+pZs3BXQvhVbEgUWXidFtJQdSTK8w=
X-Google-Smtp-Source: AMsMyM5BwEVAHycvfUn765B2vofw0pZLv819RyeeNEn7QM+TFI71g2ZaFWnH1u8QoPd4MSjUWxuPEg==
X-Received: by 2002:a5d:59a5:0:b0:236:8d38:4f1d with SMTP id
 p5-20020a5d59a5000000b002368d384f1dmr11641922wrr.131.1667310035237; 
 Tue, 01 Nov 2022 06:40:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bv19-20020a0560001f1300b00236627c078esm10270186wrb.110.2022.11.01.06.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:40:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 14:40:32 +0100
Message-Id: <20221101134032.100587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C7WF0Tsp5awYD7YXv0fgWeLq7WfmmEgrfGHbcVr6lbA=;
 b=W2it7wvRd2ZkOJ7rRn+G8w/tqemoqFkhOEdVcqwjIlpwP/nX/C7sY66yRYVFTPgTn3
 qjnfbqeznNSlkyHN10hOBVmMkzBEWwzim2QLcfahLIO3QpNttuZc4TQakKqo1iCZCGq0
 Q5/5eSpX+cEG+6aYjMILMy/0cpnk+W1f/YF8a0pvlpvVZaeIyUv9N8iqu5sA1V9uT1H6
 gmlkCZ6PQ4DNwk5JyT4yRaJtiO2Zucv10Dfs3cOlkKNk+axNYR9l4GlYUTddwielTkCP
 xJatg8tG65sKY3WOdORU/VY0sSDmCm26B7JekxMm2Lg/f1wrQ9LXjEBurfU+4TqfbiUa
 Vvtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W2it7wvR
Subject: [Buildroot] [PATCH 1/1] package/catatonit: fix build with kernel <
 5.9
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

Fix the following build failure with kernel < 5.0 raised since the
addition of the package in commit
e3975ec7d4b478ec6c1ba56b63cbb5bccfb9dd09:

catatonit.c:39:11: fatal error: linux/close_range.h: No such file or directory
   39 | # include <linux/close_range.h>
      |           ^~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-fix-build-with-kernel-5.9.patch      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/catatonit/0002-fix-build-with-kernel-5.9.patch

diff --git a/package/catatonit/0002-fix-build-with-kernel-5.9.patch b/package/catatonit/0002-fix-build-with-kernel-5.9.patch
new file mode 100644
index 0000000000..a4c66389db
--- /dev/null
+++ b/package/catatonit/0002-fix-build-with-kernel-5.9.patch
@@ -0,0 +1,52 @@
+From 1fefcbffe4ade02d625bf058a7c07aeaf9fa7a2f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 1 Nov 2022 14:16:01 +0100
+Subject: [PATCH] fix build with kernel < 5.9
+
+linux/close_range.h is only available since kernel 5.9 and
+https://github.com/torvalds/linux/commit/60997c3d45d9a67daf01c56d805ae4fec37e0bd8
+resulting in the following build failure:
+
+catatonit.c:39:11: fatal error: linux/close_range.h: No such file or directory
+   39 | # include <linux/close_range.h>
+      |           ^~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/openSUSE/catatonit/pull/24]
+---
+ catatonit.c  | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/catatonit.c b/catatonit.c
+index a38263a..474c525 100644
+--- a/catatonit.c
++++ b/catatonit.c
+@@ -35,7 +35,7 @@
+ #include <limits.h>
+ #include <dirent.h>
+ 
+-#ifdef HAVE_CLOSE_RANGE
++#ifdef HAVE_LINUX_CLOSE_RANGE_H
+ # include <linux/close_range.h>
+ #else
+ # include <sys/syscall.h>
+diff --git a/configure.ac b/configure.ac
+index 94c5c84..a746ea1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,7 +22,7 @@ LT_PREREQ([2.4.2])
+ LT_INIT([disable-shared])
+ 
+ AC_CHECK_HEADERS([errno.h fcntl.h signal.h stdarg.h stdio.h stdlib.h unistd.h])
+-AC_CHECK_HEADERS([sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
++AC_CHECK_HEADERS([linux/close_range.h sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
+ 
+ AC_CHECK_FUNCS([close_range])
+ 
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
