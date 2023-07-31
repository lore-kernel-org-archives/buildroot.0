Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A83C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B53E240861;
	Mon, 31 Jul 2023 19:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B53E240861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32qHT5achX_K; Mon, 31 Jul 2023 19:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0C6540905;
	Mon, 31 Jul 2023 19:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C6540905
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30A1B1BF2B5
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 19:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FB52813E7
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 19:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB52813E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-mufZpwUjz8 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 19:14:22 +0000 (UTC)
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8816F81386
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 19:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8816F81386
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 3C78220162;
 Mon, 31 Jul 2023 14:14:21 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 14:14:02 -0500
Message-Id: <20230731191402.1508702-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230730173242.6669-1-vfazio@gmail.com>
References: <20230730173242.6669-1-vfazio@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] arch/Config.in.x86: add Intel and AMD
 GCC targets
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
Cc: Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes v1 -> v2:
  - Clarify the BR2_X86_CPU_HAS_AVX512 comment (suggested by Thomas)
  - Flesh out the commit message with the additions made
---
 arch/Config.in.x86 | 200 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 199 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 8ddd1fa994..9c457268a1 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -19,12 +19,18 @@ config BR2_X86_CPU_HAS_AVX
 	bool
 config BR2_X86_CPU_HAS_AVX2
 	bool
+
+# BR2_X86_CPU_HAS_AVX512 implies the following AVX512 extensions:
+#   AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
+# This subset is common to Intel Xeon (excl Xeon Phi), AMD Zen 4, and the x86-64-v4 psABI.
+#
+# Only select BR2_X86_CPU_HAS_AVX512 if the CPU supports this subset of extensions.
 config BR2_X86_CPU_HAS_AVX512
 	bool
 
 # This list of CPU architecture variant is (loosely) ordered according
 # to the gcc documentation at
-# https://gcc.gnu.org/onlinedocs/gcc-11.2.0/gcc/x86-Options.html
+# https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
 choice
 	prompt "Target Architecture Variant"
 	default BR2_x86_i586 if BR2_i386
@@ -227,6 +233,17 @@ config BR2_x86_sandybridge
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
@@ -335,6 +352,54 @@ config BR2_x86_tremont
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
@@ -439,6 +504,8 @@ config BR2_x86_sapphirerapids
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  Use for Sapphire Rapids, Emerald Rapids
 config BR2_x86_alderlake
 	bool "alderlake"
 	select BR2_X86_CPU_HAS_MMX
@@ -451,6 +518,8 @@ config BR2_x86_alderlake
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  Use for Alder Lake, Raptor Lake, Meteor Lake
 config BR2_x86_rocketlake
 	bool "rocketlake"
 	select BR2_X86_CPU_HAS_MMX
@@ -464,6 +533,32 @@ config BR2_x86_rocketlake
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
@@ -501,6 +596,13 @@ config BR2_x86_barcelona
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
@@ -510,6 +612,25 @@ config BR2_x86_jaguar
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
@@ -519,6 +640,68 @@ config BR2_x86_steamroller
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
@@ -603,6 +786,7 @@ config BR2_GCC_TARGET_ARCH
 	default "nehalem"	if BR2_x86_nehalem
 	default "corei7-avx"	if BR2_x86_corei7_avx
 	default "sandybridge"	if BR2_x86_sandybridge
+	default "ivybridge"	if BR2_x86_ivybridge
 	default "core-avx2"	if BR2_x86_core_avx2
 	default "haswell"	if BR2_x86_haswell
 	default "broadwell"	if BR2_x86_broadwell
@@ -614,6 +798,10 @@ config BR2_GCC_TARGET_ARCH
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
@@ -624,11 +812,21 @@ config BR2_GCC_TARGET_ARCH
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
