Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B76C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 19:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 625BC40136;
	Sun, 21 Jan 2024 19:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 625BC40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RQcnwYwpvCV; Sun, 21 Jan 2024 19:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D77240142;
	Sun, 21 Jan 2024 19:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D77240142
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9E221BF3C9
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C29A740142
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C29A740142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tP5W7d4pTSsm for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 19:25:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8D7940136
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 19:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8D7940136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91EB6863F6; Sun, 21 Jan 2024 19:25:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 20:24:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d59705cd383229eced90e0c8acc5e187b01991c2
X-Git-Newrev: bc680b5a1e8320b08fb7b3c710bb4323ac33cbef
X-Patchwork-Hint: ignore
Message-Id: <20240121192544.91EB6863F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/highway: fix riscv32 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc680b5a1e8320b08fb7b3c710bb4323ac33cbef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not set -march=rv64gcv1p0 when building for riscv32 to fix the
following build failure raised since bump to version 1.0.7 in commit
0db3c08daf335571a2b2d18a16d8980ddf4567ab and
https://github.com/google/highway/commit/7c15872e81d88c77bca5e74fe0a6543cc374601a:

cc1plus: error: ABI requires '-march=rv32'

Fixes:
 - http://autobuild.buildroot.org/results/3f8def50c93f73c26339f72d6a13951d5fb41c30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-add-required-RISC-V-flags-to-CMake.patch  | 42 ++++++++++++++++++++++
 package/highway/highway.mk                         |  4 +++
 2 files changed, 46 insertions(+)

diff --git a/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch b/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
new file mode 100644
index 0000000000..bfcbfb055c
--- /dev/null
+++ b/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
@@ -0,0 +1,42 @@
+From 5d58d233fbcec0c6a39df8186a877329147324b3 Mon Sep 17 00:00:00 2001
+From: Mathieu Malaterre <mathieu.malaterre@gmail.com>
+Date: Wed, 13 Sep 2023 08:37:54 +0200
+Subject: [PATCH] Add an option to opt-out of HWY_RISCV
+
+Fixes #1740
+
+Upstream: https://github.com/google/highway/commit/5d58d233fbcec0c6a39df8186a877329147324b3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c2bf57b3f5..be639c945f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -61,6 +61,9 @@ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set copts for Armv7 with NEON (requires vfpv4
+ # skipped. For GCC 13.1+, you can also build with -fexcess-precision=standard.
+ set(HWY_CMAKE_SSE2 OFF CACHE BOOL "Set SSE2 as baseline for 32-bit x86?")
+ 
++# Currently this will compile the entire codebase with `-march=rv64gcv1p0`:
++set(HWY_CMAKE_RVV ON CACHE BOOL "Set copts for RISCV with RVV?")
++
+ # Unconditionally adding -Werror risks breaking the build when new warnings
+ # arise due to compiler/platform changes. Enable this in CI/tests.
+ set(HWY_WARNINGS_ARE_ERRORS OFF CACHE BOOL "Add -Werror flag?")
+@@ -260,9 +263,11 @@ else()
+     # gcc(13) and recent clang both support V, but not yet runtime dispatch, so
+     # we add the gcv compiler flag, which then requires the CPU (now when using
+     # either compiler) to support V.
+-    list(APPEND HWY_FLAGS -march=rv64gcv1p0)
+-    if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
+-      list(APPEND HWY_FLAGS -menable-experimental-extensions)
++    if(HWY_CMAKE_RVV)
++      list(APPEND HWY_FLAGS -march=rv64gcv1p0)
++      if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
++        list(APPEND HWY_FLAGS -menable-experimental-extensions)
++      endif()
+     endif()
+   endif()
+ 
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index bb87e5fc0d..b45fa8df74 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -41,6 +41,10 @@ else
 HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=OFF
 endif
 
+ifeq ($(BR2_RISCV_32),y)
+HIGHWAY_CONF_OPTS += -DHWY_CMAKE_RVV=OFF
+endif
+
 # Workaround for gcc bug 104028 on m68k.
 # See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
