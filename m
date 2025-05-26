Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D008C5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04DA54178E;
	Sat, 31 May 2025 16:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xyvY3jsZBFrx; Sat, 31 May 2025 16:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C5340B8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C5340B8E;
	Sat, 31 May 2025 16:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A488920
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E42F1401E7
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bazTI6j6ptos for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 389BB401CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 389BB401CB
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AFBD87703; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 10:15:58 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 70aac2d9e8bbf3fbbfaae713c996abff6bdf1c97
X-Git-Newrev: b76a0177449df3d7f61723a24c8edeaf0eb6a5a9
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.2AFBD87703@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libical: fix
 deprecated CMake 4 policy
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b76a0177449df3d7f61723a24c8edeaf0eb6a5a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The commit [1] updated the version of libical to version 3.0.20 which
included a number of build fixes for newer CMake version.
This patch is not included in the 2025.02.x branch and libical remained
subject to a number of build error with CMake 4.

This patch backport the fix to remove the usage of the now deprecated
CMP0005 policy with CMake version 4 (see [2]).

[1] 8cdeeb536c package/libical: bump to version 3.0.20
[2] https://cmake.org/cmake/help/latest/policy/CMP0005.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...o-longer-support-old-cmake-policy-cmp0005.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch b/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch
new file mode 100644
index 0000000000..6e21c6d6df
--- /dev/null
+++ b/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch
@@ -0,0 +1,42 @@
+From 7f07ace91faa8b1d578bf5bac2987660f91f31ca Mon Sep 17 00:00:00 2001
+From: Allen Winter <allen.winter@kdab.com>
+Date: Sat, 14 Oct 2017 15:49:54 -0400
+Subject: [PATCH] CMakeLists.txt, src/test/CMakeLists.txt - no longer support
+ old CMake Policy CMP0005 ISSUE#315
+
+Upstream: https://github.com/libical/libical/commit/7f07ace91faa8b1d578bf5bac2987660f91f31ca
+[thomas: backported to v1.0.1]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+---
+ CMakeLists.txt          | 1 -
+ src/test/CMakeLists.txt | 2 +-
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d5aad80c..e2d5de72 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -50,7 +50,6 @@ project(libical C CXX)
+ 
+ if(COMMAND cmake_policy)
+   cmake_policy(SET CMP0003 NEW)
+-  cmake_policy(SET CMP0005 OLD)
+ endif()
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules)
+diff --git a/src/test/CMakeLists.txt b/src/test/CMakeLists.txt
+index 322b5e40..31ab6199 100644
+--- a/src/test/CMakeLists.txt
++++ b/src/test/CMakeLists.txt
+@@ -6,7 +6,7 @@ include_directories(
+ 
+ set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR})
+ 
+-set(TEST_DATADIR "\\\"${CMAKE_SOURCE_DIR}/test-data\\\"")
++set(TEST_DATADIR "\"${CMAKE_SOURCE_DIR}/test-data\"")
+ add_definitions(-DTEST_DATADIR=${TEST_DATADIR})
+ 
+ macro(setprops _name)
+-- 
+2.49.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
