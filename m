Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3E3C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E718484996;
	Sun, 15 Sep 2024 21:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nywZVhw6-tb; Sun, 15 Sep 2024 21:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8054584993
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8054584993;
	Sun, 15 Sep 2024 21:42:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADF551BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D4E608B4
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HChQ0VD2sbWi for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 785B96089F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 785B96089F
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7444782285; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 12:53:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccbca4754d0e7f1d6326d7a04a5959ebe2a689dd
X-Git-Newrev: ab90f61dab58b6690c8547f26668b088ba326b6b
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.7444782285@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: fix build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab90f61dab58b6690c8547f26668b088ba326b6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling libssh without a C++ cross-compiler the build will fail.

This patch remove the CMake C++ dependency to build libssh. That dependency
is only used for the code coverage tool and is not required to build the
library.

Fixes:
  - http://autobuild.buildroot.org/results/927/92794da6346b856ad74f14f87cc51415871cb5d2/
  - http://autobuild.buildroot.org/results/89d/89dcd4982e4061732de635f9e7669db1f257330c/
  - http://autobuild.buildroot.org/results/b3f/b3feff5c21defb53c65a3d5d06b13230cfed3317/
  - http://autobuild.buildroot.org/results/bc8/bc8338d2c61eaa7c98c99140de5c491b7528c4f3/
  - ...

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Only-enable-CXX-when-running-the-coverage.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
new file mode 100644
index 0000000000..c1f39b7d9a
--- /dev/null
+++ b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
@@ -0,0 +1,57 @@
+From 328ae3d2306c9f65b5e85a2be98a368c07287a05 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Sat, 14 Sep 2024 21:07:30 +0200
+Subject: [PATCH] cmake: Only enable CXX when running the coverage
+
+Commit 25a678190c42b24076fdd805a8d7a722a8a9c798 introduced code coverage
+collection. That also introduced a dependency to CXX language.
+
+When cross-compiling libssh in an environment that doesn't have a C++ compiler
+the following error is raised: "No CMAKE_CXX_COMPILER could be found.".
+
+Since the C++ part is only needed for the coverage part, this commit only enable
+that language dependency when actually needing it.
+
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+Upstream: https://gitlab.com/libssh/libssh-mirror/-/merge_requests/537
+---
+ CMakeLists.txt                    | 3 ++-
+ cmake/Modules/AddCMockaTest.cmake | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 13330ea3..5595a47a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -9,7 +9,7 @@ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
+ include(DefineCMakeDefaults)
+ include(DefineCompilerFlags)
+ 
+-project(libssh VERSION 0.11.1 LANGUAGES C CXX)
++project(libssh VERSION 0.11.1 LANGUAGES C)
+ 
+ # global needed variable
+ set(APPLICATION_NAME ${PROJECT_NAME})
+@@ -190,6 +190,7 @@ endif (WITH_SYMBOL_VERSIONING AND ABIMAP_FOUND)
+ 
+ # Coverage
+ if (WITH_COVERAGE)
++    ENABLE_LANGUAGE(CXX)
+     include(CodeCoverage)
+     setup_target_for_coverage_lcov(
+         NAME "coverage"
+diff --git a/cmake/Modules/AddCMockaTest.cmake b/cmake/Modules/AddCMockaTest.cmake
+index 79178183..f49961ba 100644
+--- a/cmake/Modules/AddCMockaTest.cmake
++++ b/cmake/Modules/AddCMockaTest.cmake
+@@ -117,6 +117,7 @@ function(ADD_CMOCKA_TEST _TARGET_NAME)
+         ${TARGET_SYSTEM_EMULATOR} ${_TARGET_NAME}
+     )
+     if (WITH_COVERAGE)
++        ENABLE_LANGUAGE(CXX)
+         include(CodeCoverage)
+         append_coverage_compiler_flags_to_target(${_TARGET_NAME})
+     endif (WITH_COVERAGE)
+-- 
+2.46.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
