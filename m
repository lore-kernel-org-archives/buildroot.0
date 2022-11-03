Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A80AC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 17:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2E7381F42;
	Thu,  3 Nov 2022 17:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E7381F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 46kHCmm3Pxtc; Thu,  3 Nov 2022 17:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E1B81F11;
	Thu,  3 Nov 2022 17:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E1B81F11
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 807A51BF4DB
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 17:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62E9181F11
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 17:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62E9181F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sB_DHfOs9_ji for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 17:48:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFE4E81F03
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFE4E81F03
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 17:48:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id t1so1619212wmi.4
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 10:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RuoyAmF0d8kmQLRD8hhk2TP4WRpoBd74Q7LFMqlhWtQ=;
 b=8InLkpHgp8Zh9BbfVJB/MKtw/bievlYAhVImKKiFsby8GGS01QlU7fim8xWA3FvuR3
 YfAQaJxwS2uFamXsOoIGWmKSI6t+hSveI6p/acy14zVD1trRpXMDjwZIUfised7dRXvS
 DvmugCtVhTsjl04ihaRsiabtH3HTjLEn7RMkdPY8CDTfZZTCuOkOj3F7ZBJcRMHA7/9a
 WNRjvtymcb8yM0Yqei+FUikJGlSfPaLST3GXvTsmUpGjDjy8FFPVlnzQzm1POSChkUHU
 pGRlI6tq+RGkrkvDLfRQ75TWjTobPCTmvXN9KMoW7vdMpOEeKYzDpkX/WS7atWEzsR2c
 qapA==
X-Gm-Message-State: ACrzQf2v7ynS+m7sdzmiXDgNIXj2fCSnBJfD56iSHJhVXvBuhika+eE2
 Y14ygiS3CfEQP2l8NdY5NKHaw4Y/G8Y=
X-Google-Smtp-Source: AMsMyM7uObMKBX6u4PhiJMJ3A3yfrJo97R9/KoifP8To3nUnz3UBOb1NCA4+itdfEn/m0wVPo2ifbg==
X-Received: by 2002:a05:600c:4e52:b0:3ce:3f91:70b9 with SMTP id
 e18-20020a05600c4e5200b003ce3f9170b9mr19984524wmq.131.1667497702511; 
 Thu, 03 Nov 2022 10:48:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5007000000b00236644228besm1489460wrt.40.2022.11.03.10.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 10:48:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 18:48:18 +0100
Message-Id: <20221103174818.1469409-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RuoyAmF0d8kmQLRD8hhk2TP4WRpoBd74Q7LFMqlhWtQ=;
 b=NsDtRozkgQyKsX3vGZn5Ke45JlHh4SZZTn91v0S1NWC0ZqisCZs6NN5UXgFINuCbwX
 8J4jjJogsvOagVfibUvn70W7qrMokEzKKGuLGuSZ0pg34GsCwdogB8a/2BzhfF83dnUE
 uKKqrOWvcGzN5F6MKCSUnJI+506LD32Y2VYEaQ1NK2VSND4kGK6oLG2fu9N+TaNprIog
 /OeSxuh/cwsGip0MrQuzafJATascVAOoIcdq/aU99yvDr3gLf8/czDpL69yvgqfd2cDh
 NYhiJZfRTW696pCkqMgDkrE3CZ1m20Qg9XSAUedR1+GWkwA4F612awIHwics0NxDFkM2
 OPEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NsDtRozk
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: fix build without
 __NR_pidfd_open
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

Fix the following build failure without __NR_pidfd_open raised since
bump to version 3.3.17 in commit
cc28c7aa6df7798ce5ca79d6d1c7c2eb115ba220 and
https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da:

pgrep.c: In function 'pidfd_open':
pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function); did you mean 'pidfd_open'?
  748 |  return syscall(__NR_pidfd_open, pid, flags);
      |                 ^~~~~~~~~~~~~~~
      |                 pidfd_open

Fixes:
 - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../procps-ng/0003-fix-pifd_open-check.patch  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/procps-ng/0003-fix-pifd_open-check.patch

diff --git a/package/procps-ng/0003-fix-pifd_open-check.patch b/package/procps-ng/0003-fix-pifd_open-check.patch
new file mode 100644
index 0000000000..7152901e70
--- /dev/null
+++ b/package/procps-ng/0003-fix-pifd_open-check.patch
@@ -0,0 +1,59 @@
+From 0cce3e981540c28d2f703b9ab16c04d0df8fa03d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 3 Nov 2022 18:24:53 +0100
+Subject: [PATCH] fix pifd_open check
+
+Replace AC_CHECK_FUNC by AC_CHECK_FUNCS otherwise HAVE_PIDFD_OPEN will
+never be defined resulting in the following build failure if pidfd_open
+is available but __NR_pidfd_open is not available:
+
+pgrep.c: In function 'pidfd_open':
+pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function); did you mean 'pidfd_open'?
+  748 |  return syscall(__NR_pidfd_open, pid, flags);
+      |                 ^~~~~~~~~~~~~~~
+      |                 pidfd_open
+
+This build failure is raised since the addition of pwait in version
+3.3.17 and
+https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/procps-ng/procps/-/merge_requests/166]
+---
+ configure.ac | 2 +-
+ src/pgrep.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 629881a6..1a3ccdb8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -160,7 +160,7 @@ AC_TRY_COMPILE([#include <errno.h>],
+ 		AC_MSG_RESULT(yes),
+ 		AC_MSG_RESULT(no))
+ 
+-AC_CHECK_FUNC([pidfd_open], [enable_pwait=yes], [
++AC_CHECK_FUNCS([pidfd_open], [enable_pwait=yes], [
+   AC_MSG_CHECKING([for __NR_pidfd_open])
+   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
+ #include <sys/syscall.h>
+diff --git a/pgrep.c b/pgrep.c
+index c4ad5da3..29cfedf7 100644
+--- a/pgrep.c
++++ b/pgrep.c
+@@ -38,7 +38,7 @@
+ #include <stdbool.h>
+ #include <time.h>
+ 
+-#if defined(ENABLE_PWAIT) && !defined(HAVE_PIDFD_OPEN)
++#if defined(ENABLE_PWAIT)
+ #include <sys/epoll.h>
+ #include <sys/syscall.h>
+ #endif
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
