Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0189DC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9752B413A3;
	Fri, 28 Jul 2023 20:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9752B413A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5OK4Vcy9fgY; Fri, 28 Jul 2023 20:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F25841907;
	Fri, 28 Jul 2023 20:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F25841907
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E66361BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 744236059D
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 744236059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7iM0qUYM_Tgc for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4127C6076C
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4127C6076C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E82483946; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:04:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfbd1aae23ce09130f385d8f1f354d2560cd30e8
X-Git-Newrev: 3009095ba8a87a22f55f6b89e42f667487563b94
X-Patchwork-Hint: ignore
Message-Id: <20230728200820.2E82483946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add support for gcc 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=3009095ba8a87a22f55f6b89e42f667487563b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gcc.gnu.org/gcc-13/changes.html
https://gcc.gnu.org/gcc-13/porting_to.html

Backport upstream patch to gcc 13.2 for RISC-V build issue with gcc 4.9.x:

GCC should still build with GCC 4.8.3 or newer [1]
using C++03 by default. But a recent change in
RISC-V port introduced a C++11 feature "std::log2" [2].

Use log2 from the C header, without the namespace [3].

[1] https://gcc.gnu.org/install/prerequisites.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e3f19d4f4304dc
[3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-member-of-std

Rebase patch 0001-disable-split-stack-for-non-thread-builds.patch
required for uClibc-ng without threads support.

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589

Runtime tested on gitlab-ci:
https://gitlab.com/kubu93/buildroot/-/pipelines/947874770/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++++
 ...002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch | 48 ++++++++++++++++++++++
 package/gcc/Config.in.host                         | 14 +++++++
 package/gcc/gcc.hash                               |  2 +
 4 files changed, 90 insertions(+)

diff --git a/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..e801085dad
--- /dev/null
+++ b/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
diff --git a/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
new file mode 100644
index 0000000000..55fb40e358
--- /dev/null
+++ b/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
@@ -0,0 +1,48 @@
+From e5253b777eefef7d66d3bd1c641de6d133d3573d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 2 May 2023 14:21:55 +0200
+Subject: [PATCH] RISC-V: fix build issue with gcc 4.9.x
+
+GCC should still build with GCC 4.8.3 or newer [1]
+using C++03 by default. But a recent change in
+RISC-V port introduced a C++11 feature "std::log2" [2].
+
+Use log2 from the C header, without the namespace [3].
+
+[1] https://gcc.gnu.org/install/prerequisites.html
+[2] https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e3f19d4f4304dc
+[3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-member-of-std
+
+Fixes:
+https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589
+
+gcc/ChangeLog:
+	* config/riscv/genrvv-type-indexer.cc: Use log2 from the C header, without
+	the namespace.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+(cherry picked from commit 87c347c2897537a6aa391efbfc5ed00c625434fe)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/riscv/genrvv-type-indexer.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/riscv/genrvv-type-indexer.cc b/gcc/config/riscv/genrvv-type-indexer.cc
+index e677b55290c..eebe382d1c3 100644
+--- a/gcc/config/riscv/genrvv-type-indexer.cc
++++ b/gcc/config/riscv/genrvv-type-indexer.cc
+@@ -115,9 +115,9 @@ same_ratio_eew_type (unsigned sew, int lmul_log2, unsigned eew, bool unsigned_p,
+   if (sew == eew)
+     elmul_log2 = lmul_log2;
+   else if (sew > eew)
+-    elmul_log2 = lmul_log2 - std::log2 (sew / eew);
++    elmul_log2 = lmul_log2 - log2 (sew / eew);
+   else /* sew < eew */
+-    elmul_log2 = lmul_log2 + std::log2 (eew / sew);
++    elmul_log2 = lmul_log2 + log2 (eew / sew);
+ 
+   if (float_p)
+     return floattype (eew, elmul_log2);
+-- 
+2.34.3
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b6adf1f127..73ecc14398 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -59,6 +59,19 @@ config BR2_GCC_VERSION_12_X
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
+config BR2_GCC_VERSION_13_X
+	bool "gcc 13.x"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_powerpc_SPE
+	# uClibc-ng broken on sparc due to recent gcc changes
+	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
+	depends on !BR2_sparc
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
@@ -89,6 +102,7 @@ config BR2_GCC_VERSION
 	default "10.4.0"    if BR2_GCC_VERSION_10_X
 	default "11.4.0"    if BR2_GCC_VERSION_11_X
 	default "12.3.0"    if BR2_GCC_VERSION_12_X
+	default "13.2.0"    if BR2_GCC_VERSION_13_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index f478962af8..d5f8135ff6 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3c
 sha512  a5018bf1f1fa25ddf33f46e720675d261987763db48e7a5fdf4c26d3150a8abcb82fdc413402df1c32f2e6b057d9bae6bdfa026defc4030e10144a8532e60f14  gcc-11.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
 sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.2.0/sha512.sum
+sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b789e1232a34a20be1a0b60097de9280efe47bdb71c73251e30b0862a2  gcc-13.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
