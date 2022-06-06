Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18789C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D126B60C03;
	Mon,  6 Jun 2022 13:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1QldzPwMNZb; Mon,  6 Jun 2022 13:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D722C6106B;
	Mon,  6 Jun 2022 13:04:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 171E71BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A9E7416F3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnpk24oQhExZ for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09D8F416F4
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CC02286D93; Mon,  6 Jun 2022 12:52:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:57:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cbcdbf0add46da55020eb56b5e4b974b44e958b
X-Git-Newrev: aeeb621e725a63939d80693b67d6068545de09a2
X-Patchwork-Hint: ignore
Message-Id: <20220606125201.CC02286D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eigen: fix build without Fortran
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

commit: https://git.buildroot.net/buildroot/commit/?id=aeeb621e725a63939d80693b67d6068545de09a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without a working Fortran compiler:

CMake Error at /nvmedata/autobuild/instance-17/output-1/host/share/cmake-3.18/Modules/CMakeTestFortranCompiler.cmake:51 (message):
  The Fortran compiler

    "/usr/bin/f95"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/37f3f40ee39739b5e557d634b71a448762107a4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-Options-for-controlling-build-components.patch | 85 ++++++++++++++++++++++
 package/eigen/eigen.mk                             |  9 ++-
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
new file mode 100644
index 0000000000..693e610d0a
--- /dev/null
+++ b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
@@ -0,0 +1,85 @@
+From cf82186416d04ea5df2a397d8fe09dc78d40ca65 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Antonio=20S=C3=A1nchez?= <cantonios@google.com>
+Date: Sat, 5 Mar 2022 05:49:45 +0000
+Subject: [PATCH] Adds new CMake Options for controlling build components.
+
+[Retrieved from:
+https://gitlab.com/libeigen/eigen/-/commit/cf82186416d04ea5df2a397d8fe09dc78d40ca65]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt        | 6 ++++++
+ blas/CMakeLists.txt   | 3 ++-
+ lapack/CMakeLists.txt | 5 +++++
+ 3 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index de1c23e91..0af36a53a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -477,6 +477,9 @@ if(EIGEN_BUILD_TESTING)
+   add_subdirectory(failtest)
+ endif()
+ 
++include(CMakeDetermineFortranCompiler)
++option(EIGEN_BUILD_BLAS "Toggles the building of the Eigen Blas library" ${CMAKE_Fortran_COMPILER})
++option(EIGEN_BUILD_LAPACK "Toggles the building of the included Eigen LAPACK library" ${CMAKE_Fortran_COMPILER})
+ if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
+   add_subdirectory(blas)
+   add_subdirectory(lapack)
+@@ -611,6 +614,8 @@ set_target_properties (eigen PROPERTIES EXPORT_NAME Eigen)
+ 
+ install (TARGETS eigen EXPORT Eigen3Targets)
+ 
++option(EIGEN_BUILD_CMAKE_PACKAGE "Enables the creation of EigenConfig.cmake and related files" ON)
++if(EIGEN_BUILD_CMAKE_PACKAGE)
+ configure_package_config_file (
+   ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3Config.cmake.in
+   ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
+@@ -655,6 +660,7 @@ install (FILES ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
+ # Add uninstall target
+ add_custom_target ( uninstall
+     COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/EigenUninstall.cmake)
++endif()
+ 
+ if (EIGEN_SPLIT_TESTSUITE)
+   ei_split_testsuite("${EIGEN_SPLIT_TESTSUITE}")
+diff --git a/blas/CMakeLists.txt b/blas/CMakeLists.txt
+index 8d3cb86dc..c530957fb 100644
+--- a/blas/CMakeLists.txt
++++ b/blas/CMakeLists.txt
+@@ -1,6 +1,7 @@
+ 
+ project(EigenBlas CXX)
+ 
++if(EIGEN_BUILD_BLAS)
+ include(CheckLanguage)
+ check_language(Fortran)
+ if(CMAKE_Fortran_COMPILER)
+@@ -59,4 +60,4 @@ if(EIGEN_BUILD_TESTING)
+ endif()
+ 
+ endif()
+-
++endif()
+diff --git a/lapack/CMakeLists.txt b/lapack/CMakeLists.txt
+index c8ca64001..8d6d75401 100644
+--- a/lapack/CMakeLists.txt
++++ b/lapack/CMakeLists.txt
+@@ -1,5 +1,7 @@
+ project(EigenLapack CXX)
+ 
++if(EIGEN_BUILD_LAPACK AND EIGEN_BUILD_BLAS)
++
+ include(CheckLanguage)
+ check_language(Fortran)
+ if(CMAKE_Fortran_COMPILER)
+@@ -457,3 +459,6 @@ if(EXISTS ${eigen_full_path_to_testing_lapack})
+ 
+ endif()
+ 
++elseif(EIGEN_BUILD_LAPACK AND NOT EIGEN_BUILD_BLAS)
++ message(FATAL_ERROR "EIGEN_BUILD_LAPACK requires EIGEN_BUILD_BLAS")
++endif() #EIGEN_BUILD_LAPACK
+-- 
+GitLab
+
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 9df286e11f..7fe3fbdac6 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -18,7 +18,14 @@ EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
 EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig
 
 ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-EIGEN_CONF_OPTS += -DCMAKE_Fortran_COMPILER=$(TARGET_FC)
+EIGEN_CONF_OPTS += \
+	-DCMAKE_Fortran_COMPILER=$(TARGET_FC) \
+	-DEIGEN_BUILD_BLAS=ON \
+	-DEIGEN_BUILD_LAPACK=ON
+else
+EIGEN_CONF_OPTS += \
+	-DEIGEN_BUILD_BLAS=OFF \
+	-DEIGEN_BUILD_LAPACK=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
