Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D50C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E7383F1A;
	Mon, 20 Feb 2023 23:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E7383F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Y4vOYYGz3SG; Mon, 20 Feb 2023 23:52:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0910B843C0;
	Mon, 20 Feb 2023 23:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0910B843C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4D71BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A55141781
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A55141781
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmhoVSu3rfyL for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 329094159B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 329094159B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28B2B86495; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 08:06:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ed6062efbcda90eee7f523b3d63deb1fc36e4a17
X-Git-Newrev: 36741b9461a629002296e5debae848fc7f6e152f
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.28B2B86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/neon-2-sse: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=36741b9461a629002296e5debae848fc7f6e152f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The cmake project for neon-2-sse doesn't correctly set the project
language to C which causes cmake to try and detect a C++ compiler.

Add a patch which fixes the project language setting.

Fixes:
 - http://autobuild.buildroot.net/results/0eb/0ebb8c886e0a432b6fb43ab21010f625f6797b9e
 - http://autobuild.buildroot.net/results/a5d/a5db2f286dbd69e84d518d086df857ef434b936a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/neon-2-sse/0001-Fix-cmake-languages.patch | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/neon-2-sse/0001-Fix-cmake-languages.patch b/package/neon-2-sse/0001-Fix-cmake-languages.patch
new file mode 100644
index 0000000000..e0becb1ffa
--- /dev/null
+++ b/package/neon-2-sse/0001-Fix-cmake-languages.patch
@@ -0,0 +1,40 @@
+From 186ec82e033d8c718d760d14945535a9d7e160fd Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 29 Jan 2023 21:00:27 -0700
+Subject: [PATCH] Fix cmake languages
+
+When no language is set cmake defaults to C and CXX, since we support
+C by itself we should set the project language to C so that we don't
+get a compiler error when building without a CXX toolchain.
+
+Fixes:
+CMake Error at CMakeLists.txt:5 (project):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/intel/ARM_NEON_2_x86_SSE/pull/62]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e4b8980..8f58e79 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ # Modification: Copyright (C) 2017 David Hirvonen
+ 
+ cmake_minimum_required(VERSION 3.0)
+-project(NEON_2_SSE VERSION 1.0.0)
++project(NEON_2_SSE VERSION 1.0.0 LANGUAGES C)
+ 
+ add_library(${PROJECT_NAME} INTERFACE)
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
