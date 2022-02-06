Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128C6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 15:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87544026F;
	Sun,  6 Feb 2022 15:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4B6IPXEKdIm; Sun,  6 Feb 2022 15:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0C140246;
	Sun,  6 Feb 2022 15:35:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4DF1BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A16340246
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KorWta6K7K-j for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 15:35:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82AA6400B0
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 15:35:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D98D682BBB; Sun,  6 Feb 2022 15:27:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 16:34:05 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: f0b03fb9423652804aa5b16a8789a453527b7ba9
X-Git-Newrev: 2a660956f3a14453d05831ad874e756bb39e3c86
X-Patchwork-Hint: ignore
Message-Id: <20220206152743.D98D682BBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/log4cxx: fix
 boost-fallback (only check for boost if really needed)
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a660956f3a14453d05831ad874e756bb39e3c86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
(cherry picked from commit d76301be855d6d05af5aa5860e1d31385c197d16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
