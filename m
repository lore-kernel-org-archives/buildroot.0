Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3631CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 15:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B2FD408BB;
	Sat, 23 Sep 2023 15:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B2FD408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9tgZKg5pUyS; Sat, 23 Sep 2023 15:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B87408B2;
	Sat, 23 Sep 2023 15:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B87408B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69CE01BF310
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 15:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4341C61199
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 15:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4341C61199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGYQ3QkmbRXE for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 15:35:37 +0000 (UTC)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AB5661194
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 15:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AB5661194
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 38NFZRQ4085694;
 Sat, 23 Sep 2023 23:35:27 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Sat, 23 Sep 2023
 23:35:27 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Sat, 23 Sep 2023 23:35:22 +0800
Message-ID: <20230923153522.1903628-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38NFZRQ4085694
Subject: [Buildroot] [PATCH] package/openblas: Add support for RISC-V
 architecture
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
Cc: Julien Olivain <ju.o@free.fr>, Yu Chien Peter Lin <peterlin@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current version of OpenBLAS (v0.3.24) supports the
RV64 architecture. With this update, we can install
the library and packages such as GNU Octave on RISC-V
platforms.

This patch also adjusts the alignment for adding
"RISCV64_GENERIC" in Config.in. 

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 package/openblas/Config.in | 73 +++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 58976e657a..26a76d29fb 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -1,55 +1,56 @@
 config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	string
-	default "P2"           if BR2_x86_pentium2
-	default "KATMAI"       if BR2_x86_pentium3
-	default "NORTHWOOD"    if BR2_x86_pentium4
-	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
-	default "BANIAS"       if BR2_x86_pentium_m
-	default "CORE2"        if BR2_x86_core2
-	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont || BR2_x86_westmere
-	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
-	default "HASWELL"      if BR2_x86_core_avx2
-	default "ATOM"         if BR2_x86_atom
-	default "ATHLON"       if BR2_x86_athlon || BR2_x86_athlon_4
-	default "OPTERON"      if BR2_x86_opteron
-	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
-	default "BARCELONA"    if BR2_x86_barcelona
-	default "BOBCAT"       if BR2_x86_jaguar
-	default "STEAMROLLER"  if BR2_x86_steamroller
-	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
-	default "POWER4"       if BR2_powerpc_power4
-	default "POWER5"       if BR2_powerpc_power5
-	default "POWER6"       if BR2_powerpc_power6
-	default "POWER7"       if BR2_powerpc_power7
-	default "POWER8"       if BR2_powerpc_power8
-	default "PPCG4"        if BR2_powerpc_7400 || BR2_powerpc_7450
-	default "PPC970"       if BR2_powerpc_970
-	default "PPC440"       if BR2_powerpc_440
-	default "PPC440FP2"    if BR2_powerpc_440fp
+	default "P2"              if BR2_x86_pentium2
+	default "KATMAI"          if BR2_x86_pentium3
+	default "NORTHWOOD"       if BR2_x86_pentium4
+	default "PRESCOTT"        if BR2_x86_prescott || BR2_x86_nocona
+	default "BANIAS"          if BR2_x86_pentium_m
+	default "CORE2"           if BR2_x86_core2
+	default "NEHALEM"         if BR2_x86_corei7 || BR2_x86_silvermont || BR2_x86_westmere
+	default "SANDYBRIDGE"     if BR2_x86_corei7_avx
+	default "HASWELL"         if BR2_x86_core_avx2
+	default "ATOM"            if BR2_x86_atom
+	default "ATHLON"          if BR2_x86_athlon || BR2_x86_athlon_4
+	default "OPTERON"         if BR2_x86_opteron
+	default "OPTERON_SSE3"    if BR2_x86_opteron_sse3
+	default "BARCELONA"       if BR2_x86_barcelona
+	default "BOBCAT"          if BR2_x86_jaguar
+	default "STEAMROLLER"     if BR2_x86_steamroller
+	default "VIAC3"           if BR2_x86_c3 || BR2_x86_c32
+	default "POWER4"          if BR2_powerpc_power4
+	default "POWER5"          if BR2_powerpc_power5
+	default "POWER6"          if BR2_powerpc_power6
+	default "POWER7"          if BR2_powerpc_power7
+	default "POWER8"          if BR2_powerpc_power8
+	default "PPCG4"           if BR2_powerpc_7400 || BR2_powerpc_7450
+	default "PPC970"          if BR2_powerpc_970
+	default "PPC440"          if BR2_powerpc_440
+	default "PPC440FP2"       if BR2_powerpc_440fp
 	# P5600 is built with MSA support which is only available in Codescape toolchains
-	default "P5600"        if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	default "SICORTEX"     if BR2_MIPS_CPU_MIPS64
+	default "P5600"           if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
+	default "SICORTEX"        if BR2_MIPS_CPU_MIPS64
 	# I6400 is built with MSA support which is only available in Codescape toolchains
-	default "I6400"        if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
+	default "I6400"           if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	# OpenBLAS assumes SPARC=Sparc v9
-	default "SPARC"        if BR2_sparc_v9
+	default "SPARC"           if BR2_sparc_v9
 	# Cortex-A15 always have a VFPv4
-	default "CORTEXA15"    if (BR2_cortex_a15 && BR2_ARM_EABIHF)
+	default "CORTEXA15"       if (BR2_cortex_a15 && BR2_ARM_EABIHF)
 	# Cortex-A9 have an optional VFPv3, so we need to make sure it
 	# is available
-	default "CORTEXA9"     if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
+	default "CORTEXA9"        if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
 				   BR2_ARM_CPU_HAS_VFPV3)
-	default "ARMV5"        if BR2_ARM_CPU_ARMV5
+	default "ARMV5"           if BR2_ARM_CPU_ARMV5
 	# On ARMv6, OpenBLAS assumes that a VFP is available, and
 	# EABIhf is used
-	default "ARMV6"        if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && \
+	default "ARMV6"           if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && \
 				   BR2_ARM_CPU_HAS_VFPV2)
 	# On ARMv7, OpenBLAS assumes that a full VFPv3+ is available
 	# (and not the more limited D16 variant), and that EABIhf is
 	# used.
-	default "ARMV7"        if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && \
+	default "ARMV7"           if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && \
 				   BR2_ARM_CPU_HAS_VFPV3)
-	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
+	default "ARMV8"           if BR2_aarch64 || BR2_aarch64_be
+	default "RISCV64_GENERIC" if BR2_RISCV_64
 	help
 	  OpenBLAS target CPU. See TargetList.txt in the source tree for
 	  the possible target strings. A possible value is set
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
