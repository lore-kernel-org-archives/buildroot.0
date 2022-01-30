Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640EBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1251A83EA3;
	Sun, 30 Jan 2022 22:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZIhof-ETg1o; Sun, 30 Jan 2022 22:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D851E83EA5;
	Sun, 30 Jan 2022 22:43:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA0B11BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C81F460EA4
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AULsfsNYlHWN for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:42:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F8BA60E9D
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:42:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E48EF81730; Sun, 30 Jan 2022 22:35:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 23:23:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0876da5ea1a9bd74737a4ccef2995f124368bb86
X-Git-Newrev: d76301be855d6d05af5aa5860e1d31385c197d16
X-Patchwork-Hint: ignore
Message-Id: <20220130223546.E48EF81730@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: fix boost-fallback (only
 check for boost if really needed)
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

commit: https://git.buildroot.net/buildroot/commit/?id=d76301be855d6d05af5aa5860e1d31385c197d16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add patch 0002-boost-fallback-only-check-for-boost-if-really-needed.patch
  to check for boost if really needed (in case of legacy c++ standard < c++17)

Fixes:

  - http://autobuild.buildroot.net/results/8d49ab7cd9952f6a13bdd330e875012d0601f1d2

  -- Found Boost: .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include (found version "1.78.0") found components: thread chrono missing components: date_time atomic
  CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
    Target "cmTC_aac37" links to target "Boost::date_time" but the target was
    not found.  Perhaps a find_package() call is missing for an IMPORTED
    target, or an ALIAS target is missing?

  CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
    Target "cmTC_aac37" links to target "Boost::atomic" but the target was not
    found.  Perhaps a find_package() call is missing for an IMPORTED target, or
    an ALIAS target is missing?

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ack-only-check-for-boost-if-really-needed.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch b/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch
new file mode 100644
index 0000000000..7df29ea120
--- /dev/null
+++ b/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch
@@ -0,0 +1,36 @@
+From 24e7adc8d67b3c8f7d275b4f9a7e70a61b73fcd4 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 28 Jan 2022 13:11:01 +0100
+Subject: [PATCH] boost-fallback: only check for boost if really needed
+
+- only check for boost if really needed (in case of legacy c++ standard < c++17)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/cmake/boost-fallback/boost-fallback.cmake | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/cmake/boost-fallback/boost-fallback.cmake b/src/cmake/boost-fallback/boost-fallback.cmake
+index 8285b0b9..0ecf8c6c 100644
+--- a/src/cmake/boost-fallback/boost-fallback.cmake
++++ b/src/cmake/boost-fallback/boost-fallback.cmake
+@@ -55,6 +55,8 @@ try_compile(STD_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tes
+ try_compile(STD_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+     "${CMAKE_CURRENT_LIST_DIR}/test-stdatomic.cpp")
+ 
++# search for boost only in case needed for legacy c++ standard < c++17
++if(NOT ${STD_THREAD_FOUND} OR NOT ${STD_MUTEX_FOUND} OR NOT ${STD_SHARED_MUTEX_FOUND} OR NOT ${STD_SHARED_PTR_FOUND} OR NOT ${STD_ATOMIC_FOUND})
+ find_package(Boost COMPONENTS thread)
+ if( ${Boost_FOUND} )
+     try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+@@ -67,6 +69,7 @@ if( ${Boost_FOUND} )
+     try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
+         "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
+ endif( ${Boost_FOUND} )
++endif()
+ 
+ # Link the target with the appropriate boost libraries(if required)
+ function(boostfallback_link target)
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
