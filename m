Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443D8C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 15:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D426460F5A
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 15:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D426460F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D8AD4000B;
	Sat,  7 Aug 2021 15:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z60yQ3WGHPx7; Sat,  7 Aug 2021 15:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EBB240197;
	Sat,  7 Aug 2021 15:29:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF3F61BF2A2
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 15:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C97DC605DB
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 15:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ll3ASEv6lxTl for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 15:29:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D15EF605CD
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 15:29:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso11106894wms.1
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 08:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ji86GOoXD1UHQbTbjmvCGwBqeXrQtPW++g9bbcogbv0=;
 b=RJK2TGt87HHCAjMIrLJhH5eZq5/0z24i3FQjvyCXtSxXFTIo1LVky7CqP+wEjBllla
 MgUfnSBn0z5fXZPvbbhpl/hLbD5i6ASbc5mb6EyeYbgXYA3BhmiyYiK3leRCiTG+4YRj
 nml3XknBhC8yx07rdI8vKH9+lANeZoNgaPDtdqb+2nFryTZMyvEJ6w+C7gFyA+crds7F
 15QSpDLIh7sJ9viynkhWF+3iGc/tw7QuQ/qV7piUSIP/XrC4g5G2R2xM5u13bUtR/GX3
 fVqDPdVDmZ4AxWYYifi4LRQZ3ImINxE38KHf4lN0bAhcbnM+HzEWLZzKv/ruKIT3cS2q
 sv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ji86GOoXD1UHQbTbjmvCGwBqeXrQtPW++g9bbcogbv0=;
 b=lYXgk629CET24swT4JrI6CXKCSuZ544Q33Tnp9BWEzCO9VZbvO/x62zHDyThim25yT
 /bIV7iNSFxcMadX0astpTojwVstfl1BKpBnD1r9NLxe1hBQt5YjS1b5fUNvsalWYzrmk
 Uv47/rWZ8h9q/SEfTIgcj1ycNfjMlCg4IE1PhZXUYfVF6K6C9g9Utu4TB+5LWuf9dfDM
 3TFd1bWSAvoDcE3eBVV+YJ0DxH2yimzR3Gp9OwvGM+ekovREDm2bDMqkrFbecM8XGzhI
 UaKnQYUGXHoKzRKhCiVXWA5ka3DBjalmWIH7Ourp2hNKEh+mIN1vFZB9QsNRXF25I7Xt
 nYqw==
X-Gm-Message-State: AOAM533J7gsXBIzHMagEN/vPqEc5ZoR8HmXxUbUKJZ64Wt7QsKQwYZyb
 i7C44JFT6Fq37RAxYnDa8t5CzHHtR16jFw==
X-Google-Smtp-Source: ABdhPJyiRUNuHRCtyy7lU5CXwiQnG+Nmhx7b4Pm//Mo4q3JMBByevdQFbTz/Rt6cuhlgzuHBVCqBqw==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr1318901wmq.106.1628350153632; 
 Sat, 07 Aug 2021 08:29:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id m64sm14170359wmm.41.2021.08.07.08.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 08:29:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 17:28:47 +0200
Message-Id: <20210807152847.225678-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bullet: fix musl build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure on musl raised since bump to version
3.0.9 in commit 28b4947ed8f53c4edfbf8fef9304dc76480c01ca:

In file included from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btScalar.h:289,
                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btVector3.h:19,
                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btConvexHullComputer.h:18,
                 from /tmp/instance-5/output-1/build/bullet-3.09/Extras/VHACD/src/VHACD.cpp:28:
/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h: In constructor 'VHACD::Mutex::Mutex()':
/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h:97:54: error: 'PTHREAD_MUTEX_RECURSIVE_NP' was not declared in this scope; did you mean 'PTHREAD_MUTEX_RECURSIVE'?
   97 |   VHACD_VERIFY(pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_RECURSIVE_NP) == 0);
      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...HACD-inc-vhacdMutex.h-fix-musl-build.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch

diff --git a/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch b/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch
new file mode 100644
index 0000000000..d01bb97d99
--- /dev/null
+++ b/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch
@@ -0,0 +1,42 @@
+From dd37b97e79aea231ae026ac93c6ca4c7a2667582 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 7 Aug 2021 17:11:24 +0200
+Subject: [PATCH] Extras/VHACD/inc/vhacdMutex.h: fix musl build
+
+Fix the following build failure on musl (which does not provide
+PTHREAD_MUTEX_RECURSIVE_NP):
+
+In file included from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btScalar.h:289,
+                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btVector3.h:19,
+                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btConvexHullComputer.h:18,
+                 from /tmp/instance-5/output-1/build/bullet-3.09/Extras/VHACD/src/VHACD.cpp:28:
+/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h: In constructor 'VHACD::Mutex::Mutex()':
+/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h:97:54: error: 'PTHREAD_MUTEX_RECURSIVE_NP' was not declared in this scope; did you mean 'PTHREAD_MUTEX_RECURSIVE'?
+   97 |   VHACD_VERIFY(pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_RECURSIVE_NP) == 0);
+      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/bulletphysics/bullet3/pull/3930]
+---
+ Extras/VHACD/inc/vhacdMutex.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Extras/VHACD/inc/vhacdMutex.h b/Extras/VHACD/inc/vhacdMutex.h
+index 4d1ad2a7d..78c111383 100644
+--- a/Extras/VHACD/inc/vhacdMutex.h
++++ b/Extras/VHACD/inc/vhacdMutex.h
+@@ -69,7 +69,7 @@
+ #include <pthread.h>
+ #endif
+ 
+-#if defined(__APPLE__)
++#if defined(__APPLE__) || !defined(__GLIBC__)
+ #define PTHREAD_MUTEX_RECURSIVE_NP PTHREAD_MUTEX_RECURSIVE
+ #endif
+ 
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
