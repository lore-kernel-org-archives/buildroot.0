Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E4C30653
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 09:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179AB405DE;
	Sun, 30 Jun 2024 09:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DR4YSC3qx7U6; Sun, 30 Jun 2024 09:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A7D1403F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A7D1403F8;
	Sun, 30 Jun 2024 09:28:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF33A1BF364
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD8BE60608
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWD1UDgi7xdH for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E9560603
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3E9560603
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEA95836A8; Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 11:23:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1c86e1cac9f41f930d915cdca03608b57b83182
X-Git-Newrev: ddd79103cfdef63b078933477ae5781166ffdab5
X-Patchwork-Hint: ignore
Message-Id: <20240630092850.AEA95836A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eigen: fix patch fuzz
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ddd79103cfdef63b078933477ae5781166ffdab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Since the patch file name changed in the regeneration, the
".checkpackageignore" entry is updated accordingly.

Fixes:
http://autobuild.buildroot.org/results/6fd059b4e7f83a38683341ea1ea02e13d1a92449

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 +-
 ...ke-Options-for-controlling-build-compone.patch} | 25 ++++++++++++----------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 313201b0e6..9d441eb427 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -564,7 +564,7 @@ package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
 package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch lib_patch.Upstream
 package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch lib_patch.Upstream
 package/efl/0003-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
-package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch lib_patch.Upstream
+package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
 package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch lib_patch.Upstream
 package/ejabberd/0002-fix-ejabberdctl.patch lib_patch.Upstream
 package/ejabberd/0003-correct-includes.patch lib_patch.Upstream
diff --git a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
similarity index 80%
rename from package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
rename to package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
index 693e610d0a..737e7d39b7 100644
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
