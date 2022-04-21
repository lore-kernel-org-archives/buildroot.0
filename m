Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DE1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A88481450;
	Thu, 21 Apr 2022 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3XV-v1im_-X; Thu, 21 Apr 2022 21:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3264780B29;
	Thu, 21 Apr 2022 21:04:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13EB41C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00B8860EC1
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bX6dlrEIkGUN for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B475260F89
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7810A840FF; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce6374f8cd8b99ff4dab680406420d0b23fe63b1
X-Git-Newrev: 845f963842766019d3c83a6ab7ea592bc3017f75
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.7810A840FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip: fix build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=845f963842766019d3c83a6ab7ea592bc3017f75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 2.5.3 in
commit fd03e8192f1b4d5eae9a9458c5a06bebfa95fb7c and
https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:

CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
new file mode 100644
index 0000000000..b0cb6a6c1e
--- /dev/null
+++ b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
@@ -0,0 +1,41 @@
+From 4e7899f3d0533f83b7230ffa787087b65ddd45c0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Apr 2022 18:20:14 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without C++
+
+Fix the following build failure without a working C++ compiler raised
+since version 2.0.0 and
+https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:
+
+CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
+  The C++ compiler
+
+    "/usr/bin/c++"
+
+  is not able to compile a simple test program.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zlib-ng/minizip-ng/pull/621]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fef46c3..83adaf3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -661,7 +661,7 @@ endif()
+ list(APPEND MINIZIP_INC ${CMAKE_CURRENT_SOURCE_DIR})
+ 
+ # Create minizip library
+-project(minizip${MZ_PROJECT_SUFFIX} VERSION ${VERSION})
++project(minizip${MZ_PROJECT_SUFFIX} LANGUAGES C VERSION ${VERSION})
+ 
+ if(NOT ${MZ_PROJECT_SUFFIX} STREQUAL "")
+     message(STATUS "Project configured as ${PROJECT_NAME}")
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
