Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9127C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 10:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 812AB60BEB;
	Sat, 13 Aug 2022 10:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 812AB60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xr4b1OrH_Mcc; Sat, 13 Aug 2022 10:57:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD1160DDF;
	Sat, 13 Aug 2022 10:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD1160DDF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB0B41BF3DA
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85803416AB
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85803416AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRfs5V0edzLQ for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 10:57:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E33D416E3
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 10:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E33D416E3
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DD55F86ACB; Sat, 13 Aug 2022 10:42:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 12:57:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d4f2ccea31c381e0defca7debc49618cefbef4f
X-Git-Newrev: 88ae4ebd21d6996ae85ff47a9259325c43c1280a
X-Patchwork-Hint: ignore
Message-Id: <20220813104250.DD55F86ACB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ne10: fix build without C++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88ae4ebd21d6996ae85ff47a9259325c43c1280a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without C++ raised since bump to version
1.2.0 in commit 8cdf680799d7055a272190387064f87c7c638906 and
https://github.com/projectNe10/Ne10/commit/20b1896fd6532336e6a46608778bd6e0396dc4dc:

CMake Error at /nvmedata/autobuild/instance-11/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/a86d09d569babe6b88cb8e5fbb47483772f42aed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ne10/0002-fix-build-without-C.patch | 55 +++++++++++++++++++++++++++++
 package/ne10/ne10.mk                        |  6 ++++
 2 files changed, 61 insertions(+)

diff --git a/package/ne10/0002-fix-build-without-C.patch b/package/ne10/0002-fix-build-without-C.patch
new file mode 100644
index 0000000000..9dafffd5b0
--- /dev/null
+++ b/package/ne10/0002-fix-build-without-C.patch
@@ -0,0 +1,55 @@
+From f19b109f2a879af7b0753d94a2a312e4039adbed Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 May 2022 23:52:36 +0200
+Subject: [PATCH] fix build without C++
+
+Fix the following build failure without C++ raised since version 1.2.0
+and
+https://github.com/projectNe10/Ne10/commit/20b1896fd6532336e6a46608778bd6e0396dc4dc:
+
+CMake Error at /nvmedata/autobuild/instance-11/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
+  The C++ compiler
+
+    "/usr/bin/clang++"
+
+  is not able to compile a simple test program.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a86d09d569babe6b88cb8e5fbb47483772f42aed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/projectNe10/Ne10/pull/280]
+---
+ CMakeLists.txt         | 2 +-
+ modules/CMakeLists.txt | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 40e1b72..10081f8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -26,7 +26,7 @@
+ #
+ cmake_minimum_required(VERSION 2.6)
+ 
+-project(NE10 C CXX ASM)
++project(NE10 C ASM)
+ 
+ option(NE10_BUILD_SHARED "Build NE10 shared libraries" OFF)
+ option(NE10_BUILD_STATIC "Build NE10 static libraries" ON)
+diff --git a/modules/CMakeLists.txt b/modules/CMakeLists.txt
+index 4f158e9..951527a 100644
+--- a/modules/CMakeLists.txt
++++ b/modules/CMakeLists.txt
+@@ -173,6 +173,8 @@ endif(IOS_PLATFORM)
+ endif()
+ 
+ if(NE10_ENABLE_DSP)
++    enable_language(CXX)
++
+     #enable NE10_init_dsp
+     add_definitions(-DNE10_ENABLE_DSP)
+ 
+-- 
+2.35.1
+
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index e529caf2af..3946605556 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -16,6 +16,12 @@ NE10_CONF_OPTS = \
 	-DNE10_BUILD_UNIT_TEST=OFF \
 	-DNE10_LINUX_TARGET_ARCH=$(if $(BR2_aarch64),aarch64,armv7)
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+NE10_CONF_OPTS += -DNE10_ENABLE_DSP=ON
+else
+NE10_CONF_OPTS += -DNE10_ENABLE_DSP=OFF
+endif
+
 ifeq ($(BR2_STATIC_LIBS),)
 NE10_CONF_OPTS += \
 	-DNE10_BUILD_SHARED=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
