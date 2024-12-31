Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37219C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F341A8123E;
	Fri, 28 Feb 2025 16:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fT-fB2YDTBB; Fri, 28 Feb 2025 16:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5E8884CB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5E8884CB4;
	Fri, 28 Feb 2025 16:53:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1030468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE6D042F7C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJsuExwX1eVC for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDD6542CFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDD6542CFE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7AE28769C; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 31 Dec 2024 18:22:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c438cf82563a641fc78284ae6b5b38f03ddb21fb
X-Git-Newrev: 0b785f5b063690f29d091198f9632f0c6b680909
X-Patchwork-Hint: ignore
Message-Id: <20250228162955.E7AE28769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libzenoh-pico: fix
 debug+fortify glibc builds
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0b785f5b063690f29d091198f9632f0c6b680909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The configurations that have:
- BR2_ENABLE_RUNTIME_DEBUG=y
- One of BR2_FORTIFY_SOURCE_xyz=y

Currently fail to build, as libzenoh-pico's build system forces -O0
when BR2_ENABLE_RUNTIME_DEBUG=y, but -O0 builds aren't compatible with
_FORTIFY_SOURCE, causing:

../../../per-package/libzenoh-pico/host/mips64-buildroot-linux-gnu/sysroot/usr/include/features.h:422:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  422 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
      |    ^~~~~~~
cc1: all warnings being treated as errors

We fix this by adding a patch that drops the forced -O3 (release
builds) and -O0 (debug builds) from the project CMakeLists.txt.

This issue exists since libzenoh-pico was introduced in Buildroot in
commit
a96361901dcc7b962a0c43f163e97a2de65687f3 ("package/libzenoh-pico: new
package"), but was hidden by other issues until a first occurence in
November 2024 right after the bump to 1.0.1:

  http://autobuild.buildroot.net/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8/

Fixes:

  http://autobuild.buildroot.net/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...txt-don-t-override-the-optimization-level.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch b/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
new file mode 100644
index 0000000000..9f911a750b
--- /dev/null
+++ b/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
@@ -0,0 +1,64 @@
+From 32d087860abaf5b2374043db7034174aec06b885 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 31 Dec 2024 15:52:57 +0100
+Subject: [PATCH] CMakeLists.txt: don't override the optimization level
+
+zenoh-pico's CMakeLists.txt has some logic to provide its own compiler
+optimization level: -O3 for release builds, -O0 for debug builds.
+
+Unfortunately, using add_compile_options() means that those settings
+take precedence over what the user can pass as custom compiler
+flags. And this causes issues for example when doing a debug build
+with _FORTIFY_SOURCE enabled, as _FORTIFY_SOURCE support in glibc is
+incompatible with unoptimized builds causing this build failure:
+
+/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:414:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
+  414 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
+      |    ^~~~~~~
+
+which is a warning, but as zenoh-pico builds with -Werror, it turns
+into a build failure.
+
+As it is unclear how CMakeLists.txt can pass a default -O level, while
+allowing it to be overridden by the user, we simply remove those
+optimization level options.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/eclipse-zenoh/zenoh-pico/pull/847
+---
+ CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7a9fb6d1..97fba56a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -85,13 +85,13 @@ string(TOUPPER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)
+ # Compile options
+ if(CMAKE_BUILD_TYPE MATCHES "RELEASE" OR "Release")
+   if(UNIX)
+-    add_compile_options(-pipe -O3)
++    add_compile_options(-pipe)
+   elseif(CMAKE_SYSTEM_NAME MATCHES "Generic")
+-    add_compile_options(-pipe -O3)
++    add_compile_options(-pipe)
+   endif()
+ else()
+   if(UNIX)
+-    add_compile_options(-c -Wall -Wextra -Werror -Wshadow -Wunused -Wstrict-prototypes -pipe -g -O0)
++    add_compile_options(-c -Wall -Wextra -Werror -Wshadow -Wunused -Wstrict-prototypes -pipe -g)
+     # C99 pedantic doesn't like struct anonymous in unix header
+     if (NOT CMAKE_C_STANDARD STREQUAL "99")
+       add_compile_options(-Wpedantic)
+@@ -100,7 +100,7 @@ else()
+   elseif(MSVC)
+     add_compile_options(/W4 /WX /Od /wd4127)
+   elseif(CMAKE_SYSTEM_NAME MATCHES "Generic")
+-    add_compile_options(-Wall -Wextra -Wno-unused-parameter -Wmissing-prototypes -pipe -g -O0)
++    add_compile_options(-Wall -Wextra -Wno-unused-parameter -Wmissing-prototypes -pipe -g)
+   endif()
+ endif()
+ 
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
