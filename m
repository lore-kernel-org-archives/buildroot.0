Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D3EC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 323A5843DB;
	Mon, 20 Feb 2023 23:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 323A5843DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGfV5WFzQ-4T; Mon, 20 Feb 2023 23:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49BEE843DA;
	Mon, 20 Feb 2023 23:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BEE843DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FFD11BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FDAF4178F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FDAF4178F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OECj6ytGy_Mk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36C8C41784
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36C8C41784
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32F2F86496; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 08:06:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 36741b9461a629002296e5debae848fc7f6e152f
X-Git-Newrev: 33c89f98377cb968b03eb1428af8a74eba9d13ce
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.32F2F86496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fxdiv: fix build
 without C++ toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=33c89f98377cb968b03eb1428af8a74eba9d13ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The cmake project for fxdiv sets the project language to C and CXX
even when only C is required.

Add a patch which disables CXX unless required.

Fixes:
 - http://autobuild.buildroot.net/results/b0f/b0f3b6352429a5156a8c3a2b932331753887b65b
 - http://autobuild.buildroot.net/results/52f/52f634c06bdfe983280a2c01bb9fec4b0e1a4b34
 - http://autobuild.buildroot.net/results/181/181b85d9dd505693ed23fab823085b001aa785f4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-enable-CXX-unless-building-tests-benchma.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch b/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
new file mode 100644
index 0000000000..0336f5e1cc
--- /dev/null
+++ b/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
@@ -0,0 +1,49 @@
+From 8c2d8fc60306a8edd21182a1f5f267a7aca55763 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 29 Jan 2023 21:18:28 -0700
+Subject: [PATCH] CMake: don't enable CXX unless building tests/benchmarks
+
+We only need CXX support when building tests/benchmarks.
+
+Fixes:
+CMake Error at CMakeLists.txt:4 (PROJECT):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/Maratyszcza/FXdiv/pull/3]
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bcae6b5..c75f558 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ CMAKE_MINIMUM_REQUIRED(VERSION 3.5 FATAL_ERROR)
+ 
+ # ---[ Project
+-PROJECT(FXdiv C CXX)
++PROJECT(FXdiv C)
+ 
+ # ---[ Options.
+ OPTION(FXDIV_USE_INLINE_ASSEMBLY "Allow use of inline assembly in FXdiv" OFF)
+@@ -16,6 +16,10 @@ ENDIF()
+ # ---[ CMake options
+ INCLUDE(GNUInstallDirs)
+ 
++IF(FXDIV_BUILD_TESTS OR FXDIV_BUILD_BENCHMARKS)
++  ENABLE_LANGUAGE(CXX)
++ENDIF()
++
+ IF(FXDIV_BUILD_TESTS)
+   ENABLE_TESTING()
+ ENDIF()
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
