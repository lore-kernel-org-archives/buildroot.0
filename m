Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3832FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA22540587;
	Sat, 23 Jul 2022 21:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA22540587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmLswT8_y79X; Sat, 23 Jul 2022 21:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48706416A6;
	Sat, 23 Jul 2022 21:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48706416A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA9191BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5088847EA
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5088847EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fanvqk9do2ov for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:14:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE28847BA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EE28847BA
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:14:15 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id a11so4615725wmq.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o1OPs+pUyYxNkCN5LDb6CoU89mchox1xbnh75uPQM8Y=;
 b=yL1tf6Jh3IBMzFD9KjFpC4IKB7wTROdDbuZCWJMJw/h9WhcKs/Y3+KLyehvE9AB+Bq
 vpDv2FC8uIQXtLCMeEF9YoUpRaeznbCmuUkJA5VgFtxkehigvn6X0E91rovwejaouEjN
 ZDgtTwFn2vwsuHzFcHc5PfGewSxAM6kniy5TJz/krG5kGSCF19jd2QQwaaUEFtnBVdfe
 +EtOe6LgPXrX3nJqboXzWAVoZ4CwQYC/dMAtQB/71Uye77Z3/Q2OggHYi8W9bY7WoRd+
 DtAyon6z1YAQjOl1qvfsbq9NS7cbBH8ErPkvWW+QQ6za8uRBUTseuHFMbshjh+vS9Elk
 NpPg==
X-Gm-Message-State: AJIora+vqWa+zhN5leSYv9+6ygcjDpH3r21MTIe4CpDL18v6gQQhibPq
 gTGHTk7Ke2ze7LpQ4ySn/DurI9YjOEI=
X-Google-Smtp-Source: AGRyM1vqJh0vy2hWPhAM7uFjVsylWDVezzL6hfBAzCnGtOe0yqwkLZLuOy5KipZ0QFT+/mh4s3iGgA==
X-Received: by 2002:a05:600c:4e4d:b0:3a3:1fe6:6b20 with SMTP id
 e13-20020a05600c4e4d00b003a31fe66b20mr3805092wmq.197.1658610853507; 
 Sat, 23 Jul 2022 14:14:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5d498b000000b0021e42e7c7dbsm8040205wrq.83.2022.07.23.14.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:14:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 23:14:04 +0200
Message-Id: <20220723211404.487090-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220723211404.487090-1-fontaine.fabrice@gmail.com>
References: <20220723211404.487090-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o1OPs+pUyYxNkCN5LDb6CoU89mchox1xbnh75uPQM8Y=;
 b=Ml3wj3I8H91nbdgn6KqpCFqaV0ZovDalhplZljC1CrgIF5a69TUwQa7bfIik4h9COq
 fObalmXrLccxSt2AQV+qDky9mlgkqRyuwoKZ8fqFmqjgfWA7ynSN0gC3lKinYQ4aCb7r
 pf3OmokYbZI82KbJ6M8JlrRM8StWwiwa5YfuxErUnBtGTG6TWHYBmW+ofgJxb/lj+hDL
 9hUpF8LtDxeUAlBBNAwz0pp2J8R6Abof6EPVQkpXDOlZfBF8dvNcvzjYsy2agAQ+QQtW
 SrfyWFXTBVWEFh077VO3hJb/O7wdcSTl8N/yPXu50Hu/K1aIBwh0k5YrAvYOV8vJJ4kr
 TEqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ml3wj3I8
Subject: [Buildroot] [PATCH 2/2] package/hackrf: bump to version 2021.03.1
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

Drop patch (already in version)

https://github.com/greatscottgadgets/hackrf/releases/tag/v2021.03.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Don-t-require-a-C-compiler.patch     | 37 -------------------
 ...ndFFTW.cmake-fix-build-without-fftw3.patch | 34 +++++++++++++++++
 package/hackrf/hackrf.hash                    |  2 +-
 package/hackrf/hackrf.mk                      |  2 +-
 4 files changed, 36 insertions(+), 39 deletions(-)
 delete mode 100644 package/hackrf/0001-Don-t-require-a-C-compiler.patch
 create mode 100644 package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch

diff --git a/package/hackrf/0001-Don-t-require-a-C-compiler.patch b/package/hackrf/0001-Don-t-require-a-C-compiler.patch
deleted file mode 100644
index 3369dca670..0000000000
--- a/package/hackrf/0001-Don-t-require-a-C-compiler.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8b0a8b2be8cf2e4a76c03d3bcdf99bff5025ba22 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Sat, 31 Mar 2018 22:50:37 +0200
-Subject: [PATCH] Don't require a C++ compiler
-
-By default, CMake assumes that the project is using both C and C++.  By
-explicitly passing 'C' as argument of the project() macro, we tell CMake
-that only C is used, which prevents CMake from erroring out if a C++
-compiler doesn't exist.
-
-Upstream status: https://github.com/mossmann/hackrf/pull/469
-
-This patch differs from upstream because:
-- project name upstream has been changed into HackRF;
-- in Buildroot, we are only interested in host, not firmware.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- host/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
-index 874163f..d9cbe31 100644
---- a/host/CMakeLists.txt
-+++ b/host/CMakeLists.txt
-@@ -1,7 +1,7 @@
- #top dir cmake project for libhackrf + tools
- 
- cmake_minimum_required(VERSION 2.8)
--project (hackrf_all)
-+project (hackrf_all C)
- 
- add_subdirectory(libhackrf)
- add_subdirectory(hackrf-tools)
--- 
-2.16.3
-
diff --git a/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch b/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch
new file mode 100644
index 0000000000..2b1f34879b
--- /dev/null
+++ b/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch
@@ -0,0 +1,34 @@
+From 3e32f46c7948f6b26476558905995ebec9b01760 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Oct 2021 23:36:54 +0200
+Subject: [PATCH] cmake/modules/FindFFTW.cmake: fix build without fftw3
+
+Build on Linux fails if libfftw3 is not available since commit
+https://github.com/greatscottgadgets/hackrf/commit/a8c1fc92e9fa10843cb4aafd68c52f9903ebd05d
+which replaced
+pkg_check_modules(FFTW REQUIRED fftw3f)
+by
+find_package(FFTW REQUIRED)
+
+Fix this build failure by updating FindFFTW.cmake to check for fftw3f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/greatscottgadgets/hackrf/commit/3e32f46c7948f6b26476558905995ebec9b01760]
+---
+ host/cmake/modules/FindFFTW.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/cmake/modules/FindFFTW.cmake b/host/cmake/modules/FindFFTW.cmake
+index b9f3bfb81..802db4f5b 100644
+--- a/host/cmake/modules/FindFFTW.cmake
++++ b/host/cmake/modules/FindFFTW.cmake
+@@ -16,7 +16,7 @@ IF (WIN32)
+ include_directories(${FFTW_INCLUDES})
+ find_library (FFTW_LIBRARIES NAMES ${FFTW_LIBRARIES})
+ ELSE(WIN32)
+-find_library (FFTW_LIBRARIES NAMES fftw3)
++find_library (FFTW_LIBRARIES NAMES fftw3f)
+ ENDIF(WIN32)
+ 
+ 
diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
index c0cf732213..9053858f76 100644
--- a/package/hackrf/hackrf.hash
+++ b/package/hackrf/hackrf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a89badc09a1d2fa18367b3b2c974580ad5f6ce93aaa4e54557dc3d013c029d14  hackrf-2018.01.1.tar.xz
+sha256  a43e5080c11efdfe69ddebcc35a02b018e30e820de0e0ebdc7948cf7b0cd93a3  hackrf-2021.03.1.tar.xz
 sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index 6d694f5fbc..c224afc332 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HACKRF_VERSION = 2018.01.1
+HACKRF_VERSION = 2021.03.1
 HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
 HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
