Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D341C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 18:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C5F860F09;
	Tue, 21 Jun 2022 18:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C5F860F09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-g6cSZqiI0N; Tue, 21 Jun 2022 18:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E61D60E28;
	Tue, 21 Jun 2022 18:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E61D60E28
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C235E1BF3E9
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 18:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA2F9404DA
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 18:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2F9404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rYuSTHAAyjx for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 18:40:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94C7B400B9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94C7B400B9
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 18:40:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso66737wml.0
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 11:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k74dwzzYuj8ns8EEF6opbpHJMIqHw9pMslyVWfXgWp0=;
 b=tu6Bl9tYsS7ZXB3jKQu+UFp9T0K6xQroQ59Wzzp9DOLis+mI4AwSc73IDahGK1HLAR
 LM1RXkFkuhewqzwLU6rx6jRWQmTxGURYnSy1aCOLVPVv6ncRrcc+3HTNDgZUYdvsXc9z
 R0sfEaict44mL13U2bwaA8l0VH2hlntsIZrhZHcf2885E+8toIhcYXsdHSW4vIzfD/WC
 2YGDXvA9RkShQD89C6FO7ZYnAjIcZnTDbfL8i83+X7JAZ1ZoN9K9VbuYYUAJi6x/Elyk
 WrkaQZ3oU5bo8BvbCJeqYQF+FzLNEk/gzOFiLduM//t6m5W66tyyoIuVGRDH4MhI5eKQ
 TuVA==
X-Gm-Message-State: AJIora90HQAj2Myadls53gxIkRIevuFjOq27KLwBB4Sg6HSpf6bWR/l7
 hPEAGREnIjAkK3rRUCxKMGTAXXZdFhc=
X-Google-Smtp-Source: AGRyM1um3NtWFpJdKKXijyIToJwsUUMEGk3cN9LkkkZHnht9NRLYY/mBiVndejc6P5zV/T9LYq7EjA==
X-Received: by 2002:a05:600c:2e47:b0:39c:37f5:cd74 with SMTP id
 q7-20020a05600c2e4700b0039c37f5cd74mr31418218wmf.32.1655836855566; 
 Tue, 21 Jun 2022 11:40:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6781000000b0021b93b29cacsm5735118wru.99.2022.06.21.11.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 11:40:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 20:38:13 +0200
Message-Id: <20220621183813.1395626-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k74dwzzYuj8ns8EEF6opbpHJMIqHw9pMslyVWfXgWp0=;
 b=exyqfoGjGZmrGfDJKpvFMqqFIWBObs1LLz0r3+E1RTJHhMhKTqW0ICpfCwEV2jXE0B
 w8i7am8XHkTCisc5Wn6op2Jutjm1vtLTp44PPB1+shboBSi4PgATVp0nzZHUlHQVjj0h
 4cQjwwpQGO39hOK0kg1o4Tzy3n3l7cpcza1Vniudxmu+8Lpx5r+eiitT/s5uiFseHSJk
 DsW60Cs9ZQ/8WvsSUI+f9rL6whT/hM8Bd/dzr49XKyizIa6QcY0bnnjKTQKuQkNvcdMV
 oE4z829DzgocT2cZHYn/NHCUY5+E7IBLkOJrKbsk2ru2AtlFg2USimq80OrYBJndoSv5
 rW/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=exyqfoGj
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: fix build without
 libexecinfo
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without libexecinfo raised since commit
66d7d3bec341188bcfd83fa70b44dd62e0073431:

CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
Please set them or make sure they are set and tested correctly in the CMake files:
EXECINFO_LIBRARY
    linked by target "vcos" in directory /home/buildroot/autobuild/run/instance-1/output-1/build/rpi-userland-14b90ff9d9f031391a299e6e006965d02bfd1bb1/interface/vcos/pthreads

Fixes:
 - http://autobuild.buildroot.org/results/0b4b20e4eed1ed5120f22d29fc24038f268e6cc6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
index e799c82418..6c596395f9 100644
--- a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
+++ b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
@@ -1,4 +1,4 @@
-From 220c37b496f5c883bbfa955ee7fee471e41c34d4 Mon Sep 17 00:00:00 2001
+From c8270cea98bcce0d22ddc8e2f86eae2c9989efd4 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 25 Feb 2022 19:21:06 +0100
 Subject: [PATCH] interface/vcos/pthreads/CMakeLists.txt: fix build with
@@ -20,7 +20,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/interface/vcos/pthreads/CMakeLists.txt b/interface/vcos/pthreads/CMakeLists.txt
-index 1d81ca3..43aca03 100644
+index 1d81ca3..100207f 100644
 --- a/interface/vcos/pthreads/CMakeLists.txt
 +++ b/interface/vcos/pthreads/CMakeLists.txt
 @@ -33,12 +33,14 @@ set (SOURCES
@@ -32,11 +32,11 @@ index 1d81ca3..43aca03 100644
  if (VCOS_PTHREADS_BUILD_SHARED)
     add_library (vcos SHARED ${SOURCES})
 -   target_link_libraries (vcos pthread dl rt)
-+   target_link_libraries (vcos pthread dl rt ${EXECINFO_LIBRARY})
++   target_link_libraries (vcos pthread dl rt $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>)
  else ()
     add_library (vcos ${SOURCES})
 -   target_link_libraries (vcos pthread rt)
-+   target_link_libraries (vcos pthread rt ${EXECINFO_LIBRARY})
++   target_link_libraries (vcos pthread rt $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>)
  endif ()
  
  
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
