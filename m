Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF0CC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 12:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91F5D408DA;
	Sat, 29 Oct 2022 12:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F5D408DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOBOsT6Y7me6; Sat, 29 Oct 2022 12:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 597F7408C9;
	Sat, 29 Oct 2022 12:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 597F7408C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8121BF681
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 12:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEB63813BA
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 12:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEB63813BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r98RDXu9B5DL for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 12:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4A5813B9
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF4A5813B9
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 12:09:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so6417067wms.1
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 05:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gfC7HsthKjpZA708QQ8n10CiW7LdMcJF3m/llVf0ze0=;
 b=72iI+lo5nKr2cSMYmf6ODl9kyOSGuQI+2wdKOzM3n7YxF/g08gc+ubvBkE/Nyb8tvO
 4HtHfAAS5B77AoAgzZyOa6jUAsbItg6SOuXH3FKCMh49/Xzo1Rx/cuez4fG6LZLdfku/
 RHepAfEFJ5H9JpKYt1djaiZHfr+pNaSAGbMxAb/mk6tte83S/Y9SDvcQiZEi5krfNQGQ
 iHh1T1xVWBU9B1j1d9ADnpH5hO7Fr0TWpnYlnpj/9MNtvU8Xy8fwlC1j/qXs2ILBnBKb
 aMLRVQN+vnllefS8SMQJdrWVF9OPpgOLu4iCRwXLhOVhhRXCUYZ78upXBocERtCa8XS9
 GSkQ==
X-Gm-Message-State: ACrzQf3COnU7VVuPDf7HzXHJnRCY5Zb9JyW3WCT/erKWtNCoTMlQ3z4I
 gwm0N2wlOKQGR2A51FnOshgFL1B3pOc=
X-Google-Smtp-Source: AMsMyM4bVv5jPzpISxZeLYEYhnq9CYCqNKgO5EJppkzDjkxYjte+I9ARR/4MoBy3q40GedC5sii2fQ==
X-Received: by 2002:a05:600c:538b:b0:3c6:b66d:4027 with SMTP id
 hg11-20020a05600c538b00b003c6b66d4027mr11920210wmb.146.1667045381590; 
 Sat, 29 Oct 2022 05:09:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j31-20020a05600c1c1f00b003a8434530bbsm1533182wms.13.2022.10.29.05.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 05:09:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 14:09:37 +0200
Message-Id: <20221029120937.820995-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gfC7HsthKjpZA708QQ8n10CiW7LdMcJF3m/llVf0ze0=;
 b=bU0jSTAK7AhYK/b7uqQ+OlwHzcivzv9R2QiqGv8Ohr5Hu2ualez4IAL7LM4ns/pouP
 F+S5W4KubYgm/WmQ1/fyJbrkxXXiQB4qaYRNmJ50t+ztWA3QqXsooySYTUNDWwjCpJ/u
 pF4N7dikHNbFX4YEqq/yq1RR1fw3LlpbiqXvJXqYm+81XtVlWlmnehDk9PZSeBt5Z8uK
 NIgeMm5vrD1wSic9tovYxY2DJ/S81pyUtOJPzwXkVequdmqEZTmDOUKm/bYAgrXQ5WCg
 p1HpcERZHk8TgBIQAfoW67cmRZ9b2AWTr5BWs4m8eFuV0MZTFeAPcjpGVumChs1o9X4v
 6ntw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bU0jSTAK
Subject: [Buildroot] [PATCH 1/1] package/hackrf: bump to version 2022.09.1
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

- Update site
- Drop patch (already in version)

https://github.com/greatscottgadgets/hackrf/releases/tag/v2022.09.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ndFFTW.cmake-fix-build-without-fftw3.patch | 34 -------------------
 package/hackrf/Config.in                      |  2 +-
 package/hackrf/hackrf.hash                    |  2 +-
 package/hackrf/hackrf.mk                      |  4 +--
 4 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch

diff --git a/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch b/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch
deleted file mode 100644
index 2b1f34879b..0000000000
--- a/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3e32f46c7948f6b26476558905995ebec9b01760 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 15 Oct 2021 23:36:54 +0200
-Subject: [PATCH] cmake/modules/FindFFTW.cmake: fix build without fftw3
-
-Build on Linux fails if libfftw3 is not available since commit
-https://github.com/greatscottgadgets/hackrf/commit/a8c1fc92e9fa10843cb4aafd68c52f9903ebd05d
-which replaced
-pkg_check_modules(FFTW REQUIRED fftw3f)
-by
-find_package(FFTW REQUIRED)
-
-Fix this build failure by updating FindFFTW.cmake to check for fftw3f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/greatscottgadgets/hackrf/commit/3e32f46c7948f6b26476558905995ebec9b01760]
----
- host/cmake/modules/FindFFTW.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/cmake/modules/FindFFTW.cmake b/host/cmake/modules/FindFFTW.cmake
-index b9f3bfb81..802db4f5b 100644
---- a/host/cmake/modules/FindFFTW.cmake
-+++ b/host/cmake/modules/FindFFTW.cmake
-@@ -16,7 +16,7 @@ IF (WIN32)
- include_directories(${FFTW_INCLUDES})
- find_library (FFTW_LIBRARIES NAMES ${FFTW_LIBRARIES})
- ELSE(WIN32)
--find_library (FFTW_LIBRARIES NAMES fftw3)
-+find_library (FFTW_LIBRARIES NAMES fftw3f)
- ENDIF(WIN32)
- 
- 
diff --git a/package/hackrf/Config.in b/package/hackrf/Config.in
index 05d01adc96..d5df328dfa 100644
--- a/package/hackrf/Config.in
+++ b/package/hackrf/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_HACKRF
 	help
 	  Library and tools for accessing HackRF SDR boards.
 
-	  https://github.com/mossmann/hackrf/tree/master/host
+	  https://hackrf.readthedocs.io
 
 comment "hackrf needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
index 9053858f76..16ccb9dcfb 100644
--- a/package/hackrf/hackrf.hash
+++ b/package/hackrf/hackrf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a43e5080c11efdfe69ddebcc35a02b018e30e820de0e0ebdc7948cf7b0cd93a3  hackrf-2021.03.1.tar.xz
+sha256  bacd4e7937467ffa14654624444c8b5c716ab470d8c1ee8d220d2094ae2adb3e  hackrf-2022.09.1.tar.xz
 sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index c224afc332..4317da60bc 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HACKRF_VERSION = 2021.03.1
-HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
+HACKRF_VERSION = 2022.09.1
+HACKRF_SITE = https://github.com/greatscottgadgets/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
 HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
 HACKRF_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
