Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A88C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 10:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F351F844CC;
	Sat, 29 Jun 2024 10:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2qXDWvMvX-u; Sat, 29 Jun 2024 10:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 038E9844CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038E9844CE;
	Sat, 29 Jun 2024 10:21:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4F11BF380
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 10:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 769E54066D
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 10:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DM0yJvJpNkd2 for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 10:21:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9BCB4062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9BCB4062F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9BCB4062F
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 10:20:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0B712B0053E;
 Sat, 29 Jun 2024 12:20:53 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 12:20:47 +0200
Message-ID: <20240629102047.107513-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719656455;
 bh=z2xLdZZvxMuu4tPJG6KLWuiH/0GQghNt2on0HhF6Vxg=;
 h=From:To:Cc:Subject:Date:From;
 b=b7JlMy+AxExMmEKZ/X/7WuFIXEpyFx4OCNGgulawyK8OjCRsAx7ydao4mRSOKUSLM
 513DvylS8iximXBvRJ/+mFG4dtLZR2sBCUNheZQCVPhy2DhN5CqnXglDzym8pWfTpX
 iBfY3A9yTaJIEUiCcp/S6bA8wYHKTUAz5JskLUmcFjedYDzoxXsahEyi75jJ7jt4iL
 QcCrR+EX1kYd4fOCdPFslOWklca0OTEDcNL3o15jsH4MIKKkvYaBNYJhNpq/TMkm+3
 yNmwSCFQfqcGfu/j9VwLQU3dK0SRHtq/2ceJ2aFe8armXM/TuuN93gsz8XN+yFjuCb
 LdAaCx8qPT/cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b7JlMy+A
Subject: [Buildroot] [PATCH 1/1] package/eigen: fix patch fuzz
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, eigen fails to build with output:

    Applying 0001-Adds-new-CMake-Options-for-controlling-build-components.patch using patch:
    patching file CMakeLists.txt
    Hunk #1 succeeded at 495 (offset 18 lines).
    Hunk #2 succeeded at 615 (offset 1 line).
    Hunk #3 succeeded at 652 (offset -8 lines).
    patching file blas/CMakeLists.txt
    patching file lapack/CMakeLists.txt
    Hunk #1 FAILED at 1.
    Hunk #2 succeeded at 450 (offset -7 lines).
    1 out of 2 hunks FAILED -- saving rejects to file lapack/CMakeLists.txt.rej

This commit refreshes the package patch on the current package version.

Fixes:
http://autobuild.buildroot.org/results/6fd059b4e7f83a38683341ea1ea02e13d1a92449

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...tions-for-controlling-build-compone.patch} | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)
 rename package/eigen/{0001-Adds-new-CMake-Options-for-controlling-build-components.patch => 0001-Adds-new-CMake-Options-for-controlling-build-compone.patch} (80%)

diff --git a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
similarity index 80%
rename from package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
rename to package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
index 693e610d0a8..737e7d39b71 100644
--- a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
+++ b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
@@ -1,4 +1,4 @@
-From cf82186416d04ea5df2a397d8fe09dc78d40ca65 Mon Sep 17 00:00:00 2001
+From f49d5c1a6b7c22be359189cd0b1e2e766bd05365 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Antonio=20S=C3=A1nchez?= <cantonios@google.com>
 Date: Sat, 5 Mar 2022 05:49:45 +0000
 Subject: [PATCH] Adds new CMake Options for controlling build components.
@@ -6,6 +6,8 @@ Subject: [PATCH] Adds new CMake Options for controlling build components.
 [Retrieved from:
 https://gitlab.com/libeigen/eigen/-/commit/cf82186416d04ea5df2a397d8fe09dc78d40ca65]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Julien: rebased patch on 3.4.0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  CMakeLists.txt        | 6 ++++++
  blas/CMakeLists.txt   | 3 ++-
@@ -13,10 +15,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  3 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index de1c23e91..0af36a53a 100644
+index f3e69b845..74ff755f5 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -477,6 +477,9 @@ if(EIGEN_BUILD_TESTING)
+@@ -495,6 +495,9 @@ if(BUILD_TESTING)
    add_subdirectory(failtest)
  endif()
  
@@ -26,7 +28,7 @@ index de1c23e91..0af36a53a 100644
  if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
    add_subdirectory(blas)
    add_subdirectory(lapack)
-@@ -611,6 +614,8 @@ set_target_properties (eigen PROPERTIES EXPORT_NAME Eigen)
+@@ -612,6 +615,8 @@ set_target_properties (eigen PROPERTIES EXPORT_NAME Eigen)
  
  install (TARGETS eigen EXPORT Eigen3Targets)
  
@@ -35,7 +37,7 @@ index de1c23e91..0af36a53a 100644
  configure_package_config_file (
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
-@@ -655,6 +660,7 @@ install (FILES ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
+@@ -647,6 +652,7 @@ install ( FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/UseEigen3.cmake
  # Add uninstall target
  add_custom_target ( uninstall
      COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/EigenUninstall.cmake)
@@ -44,7 +46,7 @@ index de1c23e91..0af36a53a 100644
  if (EIGEN_SPLIT_TESTSUITE)
    ei_split_testsuite("${EIGEN_SPLIT_TESTSUITE}")
 diff --git a/blas/CMakeLists.txt b/blas/CMakeLists.txt
-index 8d3cb86dc..c530957fb 100644
+index f3a94ec4a..d07090f69 100644
 --- a/blas/CMakeLists.txt
 +++ b/blas/CMakeLists.txt
 @@ -1,6 +1,7 @@
@@ -55,17 +57,18 @@ index 8d3cb86dc..c530957fb 100644
  include(CheckLanguage)
  check_language(Fortran)
  if(CMAKE_Fortran_COMPILER)
-@@ -59,4 +60,4 @@ if(EIGEN_BUILD_TESTING)
+@@ -59,4 +60,4 @@ if(BUILD_TESTING)
  endif()
  
  endif()
 -
 +endif()
 diff --git a/lapack/CMakeLists.txt b/lapack/CMakeLists.txt
-index c8ca64001..8d6d75401 100644
+index e48497fda..71255d96d 100644
 --- a/lapack/CMakeLists.txt
 +++ b/lapack/CMakeLists.txt
-@@ -1,5 +1,7 @@
+@@ -1,6 +1,8 @@
+ 
  project(EigenLapack CXX)
  
 +if(EIGEN_BUILD_LAPACK AND EIGEN_BUILD_BLAS)
@@ -73,7 +76,7 @@ index c8ca64001..8d6d75401 100644
  include(CheckLanguage)
  check_language(Fortran)
  if(CMAKE_Fortran_COMPILER)
-@@ -457,3 +459,6 @@ if(EXISTS ${eigen_full_path_to_testing_lapack})
+@@ -450,3 +452,6 @@ if(EXISTS ${eigen_full_path_to_testing_lapack})
  
  endif()
  
@@ -81,5 +84,5 @@ index c8ca64001..8d6d75401 100644
 + message(FATAL_ERROR "EIGEN_BUILD_LAPACK requires EIGEN_BUILD_BLAS")
 +endif() #EIGEN_BUILD_LAPACK
 -- 
-GitLab
+2.45.2
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
