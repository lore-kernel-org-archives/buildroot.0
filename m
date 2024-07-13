Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AECC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 08:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86088462D;
	Sat, 13 Jul 2024 08:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amdJiJk1AcWZ; Sat, 13 Jul 2024 08:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F5DB845BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5DB845BE;
	Sat, 13 Jul 2024 08:46:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42EE41BF405
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 08:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C1F740190
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 08:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOLHi4OZgQJW for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 08:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DDA1400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DDA1400D1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 08:46:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7CCF863C7; Sat, 13 Jul 2024 08:46:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 10:36:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d62687d0024f7e3bac68157f1250970ef45abff
X-Git-Newrev: 1fbd26f83169a206bdf9c36c85510a33c0e7a864
X-Patchwork-Hint: ignore
Message-Id: <20240713084620.E7CCF863C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x265: fix runtime issue on ARMv6,
 ensure correctness on ARMv7
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fbd26f83169a206bdf9c36c85510a33c0e7a864
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build logic in source/cmake/FindNeon.cmake caused the x265 build
system to always think that the CPU supports neon: it was looking in
/proc/cpuinfo, which of course is wrong when cross-compilation, but
then the sequence of grep was interacting badly with CMake, causing
the build system to always conclude that the CPU supports NEON.

This causes runtime issues on ARMv6.

Setting -DCROSS_COMPILE_ARM=1 fixes this, as it tells the x265 build
system we are cross-compiling and it skips its bogus NEON check. So
for ARMv6, we pass -DCROSS_COMPILE_ARM=1.

But then, we still want NEON for ARMv7 processors with NEON, so this
commit adds a patch that allows to explicitly specify whether the CPU
supports NEON, in the -DCROSS_COMPILE_ARM=1 case, and we use this
option when BR2_ARM_CPU_HAS_NEON.

For those wondering why -DCROSS_COMPILE_ARM=1 is not passed for all
ARM platforms: it's because from the perspective of x265, only ARM >=
v6 is ARM: it has assembly code that needs at least ARMv6. Earlier ARM
platforms are not detected as ARM by the x265 build logic, and
therefore fallback on generic code.

This has been build-tested on:
- ARMv5: generic code is used, no assembly
- ARMv6: assembly code is used, but not with NEON support
- ARMv7 with NEON: assembly code is used, with NEON support

Reported-by: David Barbion <davidb@230ruedubac.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eLists.txt-allow-setting-CPU_HAS_NEON-whe.patch | 40 ++++++++++++++++++++++
 package/x265/x265.mk                               | 14 ++++++++
 2 files changed, 54 insertions(+)

diff --git a/package/x265/0002-source-CMakeLists.txt-allow-setting-CPU_HAS_NEON-whe.patch b/package/x265/0002-source-CMakeLists.txt-allow-setting-CPU_HAS_NEON-whe.patch
new file mode 100644
index 0000000000..51be8f2d02
--- /dev/null
+++ b/package/x265/0002-source-CMakeLists.txt-allow-setting-CPU_HAS_NEON-whe.patch
@@ -0,0 +1,40 @@
+From 0088d29e7c75ea7f100a100aea4e2a797469427f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 13 Jul 2024 10:10:54 +0200
+Subject: [PATCH] source/CMakeLists.txt: allow setting CPU_HAS_NEON when
+ CROSS_COMPILE_ARM
+
+The logic in source/cmake/FindNeon.cmake is not appropriate for
+cross-compilation scenarios, so in order to allow cross-compiling for
+ARM, CROSS_COMPILE_ARM needs to be defined. However that currently
+doesn't allow the enabling of NEON support, so let's allow the user to
+manually set CPU_HAS_NEON in this case.
+
+Upstream: https://bitbucket.org/multicoreware/x265_git/pull-requests/26
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ source/CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
+index a34bf4d4f..072bf62ab 100755
+--- a/source/CMakeLists.txt
++++ b/source/CMakeLists.txt
+@@ -239,8 +239,13 @@ if(GCC)
+         endif()
+     endif()
+     if(ARM AND CROSS_COMPILE_ARM)
+-        set(ARM_ARGS -fPIC)
+         message(STATUS "cross compile arm")
++        if(CPU_HAS_NEON)
++          set(ARM_ARGS -mfpu=neon -fPIC)
++          add_definitions(-DHAVE_NEON)
++        else()
++	  set(ARM_ARGS -fPIC)
++	endif()
+     elseif(ARM)
+         if(ARM64)
+             set(ARM_ARGS -fPIC)
+-- 
+2.45.2
+
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 51c39df4cd..bd5180b24b 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -13,6 +13,20 @@ X265_CPE_ID_VENDOR = multicorewareinc
 X265_SUBDIR = source
 X265_INSTALL_STAGING = YES
 
+# For CPUs before ARMv6, x265 does not consider them "ARM" but generic
+# CPUs for which no optimized assembly is provided, hence we don't
+# pass -DCROSS_COMPILE_ARM=1.
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
+X265_CONF_OPTS += -DCROSS_COMPILE_ARM=1
+endif
+
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+X265_CONF_OPTS += -DCROSS_COMPILE_ARM=1
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+X265_CONF_OPTS += -DCPU_HAS_NEON=1
+endif
+endif
+
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X265_DEPENDENCIES += host-nasm
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
