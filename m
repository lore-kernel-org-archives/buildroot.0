Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C8DC001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD52840C0D;
	Mon, 31 Jul 2023 22:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD52840C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnExl-c8o3Zs; Mon, 31 Jul 2023 22:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B2C440C14;
	Mon, 31 Jul 2023 22:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B2C440C14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F80F1BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08810610BA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08810610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xa5x4H3KokyE for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:15:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C536661107
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C536661107
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD06483EF4; Mon, 31 Jul 2023 22:15:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 00:14:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b4d921e1da614a72fed2a79d5c4f8e0b6d1cd45
X-Git-Newrev: 22e476d7886163484d233803b42a2a4c2b588a5b
X-Patchwork-Hint: ignore
Message-Id: <20230731221531.AD06483EF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: add Intel and AMD GCC
 targets
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

commit: https://git.buildroot.net/buildroot/commit/?id=22e476d7886163484d233803b42a2a4c2b588a5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sync the Intel and AMD CPU target list with GCC 13.

Multiple references are used for flags and synonyms [0] [1] [2] [3].

For Intel:
  Add Ivy Bridge, Sierra Forest, Grand Ridge, Knights Landing, Knights
  Mill, Granite Rapids, and Granite Rapids-D.

  The Sapphire Rapids CPU target supports Emerald Rapids.
  The Alder Lake CPU target supports Raptor Lake and Meteor Lake.

  Note: Knights Landing/Mills are based on Xeon Phi and do support
  some AVX512 extensions, but not the full subset required by
  BR2_X86_CPU_HAS_AVX512

For AMD:
  Add Bobcat, Bulldozer, Piledriver, Excavator, and Zen 1-4.

Add a comment to BR2_X86_CPU_HAS_AVX512 to explain the expected
extensions supported by the CPU. This flag was first selected by
skylake-avx512 and encompasses what appears to be a standard subset
across CPUs [3] and chapter 3 of the x86-64 psABI [4]:
  AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL

CPUs selecting this flag should, at a minimum, support this subset of
AVX512 extensions.

[0]: https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
[1]: https://gcc.gnu.org/git/?p=gcc.git;a=blob_plain;f=gcc/config/i386/i386.h;hb=refs/tags/releases/gcc-13.2.0
[2]: https://gcc.gnu.org/git/?p=gcc.git;a=blob_plain;f=gcc/common/config/i386/i386-common.cc;hb=refs/tags/releases/gcc-13.2.0
[3]: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512
[4]: https://gitlab.com/x86-psABIs/x86-64-ABI/-/raw/master/x86-64-ABI/low-level-sys-info.tex

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 202 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 8ddd1fa994..86e148dee6 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -19,12 +19,20 @@ config BR2_X86_CPU_HAS_AVX
 	bool
 config BR2_X86_CPU_HAS_AVX2
 	bool
+
+# BR2_X86_CPU_HAS_AVX512 implies the following AVX512 extensions:
+#   AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
+# This subset is common to Intel Xeon (excl Xeon Phi), AMD Zen 4, and
+# the x86-64-v4 psABI.
+#
+# Only select BR2_X86_CPU_HAS_AVX512 if the CPU supports this entire
+# subset of extensions.
 config BR2_X86_CPU_HAS_AVX512
 	bool
 
 # This list of CPU architecture variant is (loosely) ordered according
 # to the gcc documentation at
-# https://gcc.gnu.org/onlinedocs/gcc-11.2.0/gcc/x86-Options.html
+# https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
 choice
 	prompt "Target Architecture Variant"
 	default BR2_x86_i586 if BR2_i386
@@ -227,6 +235,17 @@ config BR2_x86_sandybridge
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+config BR2_x86_ivybridge
+	bool "ivybridge"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_core_avx2
 	bool "core-avx2"
 	select BR2_X86_CPU_HAS_MMX
@@ -335,6 +354,54 @@ config BR2_x86_tremont
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_x86_sierraforest
+	bool "sierraforest"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+config BR2_x86_grandridge
+	bool "grandridge"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+config BR2_x86_knightslanding
+	bool "knightslanding"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+config BR2_x86_knightsmill
+	bool "knightsmill"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_x86_skylake_avx512
 	bool "skylake-avx512"
 	select BR2_X86_CPU_HAS_MMX
@@ -439,6 +506,8 @@ config BR2_x86_sapphirerapids
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  Use for Sapphire Rapids, Emerald Rapids
 config BR2_x86_alderlake
 	bool "alderlake"
 	select BR2_X86_CPU_HAS_MMX
@@ -451,6 +520,8 @@ config BR2_x86_alderlake
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  Use for Alder Lake, Raptor Lake, Meteor Lake
 config BR2_x86_rocketlake
 	bool "rocketlake"
 	select BR2_X86_CPU_HAS_MMX
@@ -464,6 +535,32 @@ config BR2_x86_rocketlake
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_x86_graniterapids
+	bool "graniterapids"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_AVX512
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+config BR2_x86_graniterapids_d
+	bool "graniterapids-d"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_AVX512
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 config BR2_x86_k6
 	bool "k6"
 	depends on !BR2_x86_64
@@ -501,6 +598,13 @@ config BR2_x86_barcelona
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+config BR2_x86_bobcat
+	bool "bobcat"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_jaguar
 	bool "jaguar"
 	select BR2_X86_CPU_HAS_MMX
@@ -510,6 +614,25 @@ config BR2_x86_jaguar
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
+config BR2_x86_bulldozer
+	bool "bulldozer"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+config BR2_x86_piledriver
+	bool "piledriver"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_steamroller
 	bool "steamroller"
 	select BR2_X86_CPU_HAS_MMX
@@ -519,6 +642,68 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
+config BR2_x86_excavator
+	bool "excavator"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+config BR2_x86_zen
+	bool "zen"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+config BR2_x86_zen2
+	bool "zen 2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_x86_zen3
+	bool "zen 3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_x86_zen4
+	bool "zen 4"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_AVX512
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 config BR2_x86_geode
 	bool "geode (no mmx)"
 	depends on !BR2_x86_64
@@ -603,6 +788,7 @@ config BR2_GCC_TARGET_ARCH
 	default "nehalem"	if BR2_x86_nehalem
 	default "corei7-avx"	if BR2_x86_corei7_avx
 	default "sandybridge"	if BR2_x86_sandybridge
+	default "ivybridge"	if BR2_x86_ivybridge
 	default "core-avx2"	if BR2_x86_core_avx2
 	default "haswell"	if BR2_x86_haswell
 	default "broadwell"	if BR2_x86_broadwell
@@ -614,6 +800,10 @@ config BR2_GCC_TARGET_ARCH
 	default "goldmont"	if BR2_x86_goldmont
 	default "goldmont-plus"	if BR2_x86_goldmont_plus
 	default "tremont"	if BR2_x86_tremont
+	default "sierraforest"	if BR2_x86_sierraforest
+	default "grandridge"	if BR2_x86_grandridge
+	default "knl"		if BR2_x86_knightslanding
+	default "knm"		if BR2_x86_knightsmill
 	default "skylake-avx512" if BR2_x86_skylake_avx512
 	default "cannonlake"	if BR2_x86_cannonlake
 	default "icelake-client" if BR2_x86_icelake_client
@@ -624,11 +814,21 @@ config BR2_GCC_TARGET_ARCH
 	default "sapphirerapids" if BR2_x86_sapphirerapids
 	default "alderlake"	if BR2_x86_alderlake
 	default "rocketlake"	if BR2_x86_rocketlake
+	default "graniterapids"	if BR2_x86_graniterapids
+	default "graniterapids-d"	if BR2_x86_graniterapids_d
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver1"	if BR2_x86_bobcat
 	default "btver2"	if BR2_x86_jaguar
+	default "bdver1"	if BR2_x86_bulldozer
+	default "bdver2"	if BR2_x86_piledriver
 	default "bdver3"	if BR2_x86_steamroller
+	default "bdver4"	if BR2_x86_excavator
+	default "znver1"	if BR2_x86_zen
+	default "znver2"	if BR2_x86_zen2
+	default "znver3"	if BR2_x86_zen3
+	default "znver4"	if BR2_x86_zen4
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
