Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C710AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89CD440A13;
	Thu, 21 Apr 2022 18:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lftLMeCwiUdP; Thu, 21 Apr 2022 18:03:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E893409EC;
	Thu, 21 Apr 2022 18:03:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AE3A1BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5459B60E00
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDd_qxnPGCY1 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 913A160EDB
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9D2AE83FB8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:32:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b47bd987f9d549b3dc5d7127d1773275560196d
X-Git-Newrev: ef58ef062e5c65d28fd1551ec2ab4584a5856928
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.9D2AE83FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: fix build without
 C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef58ef062e5c65d28fd1551ec2ab4584a5856928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without C++ raised since bump to version
4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:

CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
new file mode 100644
index 0000000000..c6d6d07dcc
--- /dev/null
+++ b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
@@ -0,0 +1,44 @@
+From 726b36eca158063d8871c91ad99a29113ea35aea Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 13 Apr 2022 21:03:26 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without C++
+
+Fix the following build failure without C++ raised since version 4.2.0
+and
+https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:
+
+CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
+  The C++ compiler
+
+    "/usr/bin/clang++"
+
+  is not able to compile a simple test program.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/warmcat/libwebsockets/pull/2613]
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 08aaf8c6..96e3ad18 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -71,7 +71,10 @@ if (ESP_PLATFORM)
+ endif()
+ 
+ # it's at this point any toolchain file is brought in
+-project(libwebsockets C CXX)
++project(libwebsockets C)
++if (LWS_WITH_SECURE_STREAMS_CPP)
++	enable_language(CXX)
++endif()
+ include(CTest)
+ 
+ if (PICO_SDK_PATH)
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
