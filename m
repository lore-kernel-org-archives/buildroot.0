Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15731C79F91
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 18:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EA660602;
	Sat,  5 Sep 2026 18:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xoyu1pp41nk2; Sat,  5 Sep 2026 18:50:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 67A20605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788634243;
	b=BM7Tv8FBf3O8EEIM4Zt33o1FYerl+jZckRvcPA31ulncd2j3x9qFyCG8D4UDfgHa19GK
	 eHfU6eHCH1uW9ji7vJ0sJk6VLIFCjKAIKbslLZTNySgxNQ+1rU1MwMqL1sQq/04EbQSYs
	 962XKoflQKWUtJeWlmpCs0f1ZqTZf8ALDimY6KyyXL8mmiszXMwzKg1L7+YeE1yM4MpCF
	 X4n2Lj3Sw9K21RA3RC2PEWKoTXodVef4P/UzYo/IeWZOItHop/41ToeioFBDDVVdkoTWA
	 Vx4IPKqNw93zZ55/XKJosWK7Gm0ezwHEgPtpC8k80o40kJEuaWNodCnBmn/PG1S9wuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788634243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y0cCiZuKLL8IcQK/poxd8PL+zRLl0UrHvnWE0jW09wY=;
	b=Bm34ZNTIwiqBaY6xx9MNhhg1yAetpGkbi8E7qVC+qq6VG2dxU088CtgAaSf/+Le06iFg
	 o79JcGByssa1HqaQtsCBpBpBQe5eTF9ThStFo2tQdNX2vKn3GOLmOG9QCZUZ5AXJivdEq
	 J9j0XzjqeWvT56n6swCh6PtXfSs4hR+xfoOAnUYkSU0hcA6T8Wk1VmNMNa+BKCkyOViQc
	 lFvKHVhBPXMwdgK+q4sOrjUo07dWg5DEyZVCty9Ol/2WmzOtRNuTBSwqotC98LilGwtvR
	 jR0JpFVhFlrBFMYDEpkkEmZSzOPGkf0PauSkUy25Y0FkXkIjQjlwOks3c7hz0vNPxJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788634243;
	bh=Y0cCiZuKLL8IcQK/poxd8PL+zRLl0UrHvnWE0jW09wY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZutI+W6Iqmf8IOS382vkrVA31kfM7g/Q5UQj6Bl/u9Tsdc++Y5hoaQlLINhMFBImT
	 LxdB70mN3C3n1gl7LSdchWFIgmLyI9qTRIlNhICsZh06lAEDr9V8pVKJZ+4pTshwWP
	 yiQcdBkiJ7QS8Jy73AZsNLjzFLpS5HRRpOZBWJ+wTfYViSrpqgYZQC1q+vgIecO5B8
	 qR6hssk1Z58ML9tYlPKcN26I4QqyJRwY7RhQvCvUg7EkW1ik883JgBWYNipqPl461k
	 PCh3d+jcFnbEBDAQeuJJY6Hm/Lzzs1LIg+2hlI27ifvNZBMJRKJVyRuxM+CS+849WU
	 EnMtK1s65Fpew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A20605F3;
	Sat,  5 Sep 2026 18:50:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6F4C279
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A902940049
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ir7MtPhzHdeH for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 18:50:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C48EA40067
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788634238;
 b=p3xifnJbUXqXBH+wYphjfAztbYdPCwJbraEE+/sWzptBL9A0oJDRx8UspVlQTHpsRQJD
 VQlBp8HDibN5XkkryWEYKNr6cujHg4lJ01ZMMUDexMUxcjGOKtoZQE5keWUNgOWhpP66J
 hr05Iee6/Q3RX/dFWMRolxjVaI5xI2MBywattldq8guDPTRkF9YtVWkU9t+zqcyyHBmm8
 giV9BGLKjpofsik6XHY+Qwnyu31O2sOSZM06WDmgJZC9+cELUjv8Kwhs8lzK+CXe4FHzp
 siUrdNIIVwMtnBhboY2Wrzg7PGhcOfYCydKYFhQ0qVFZxY1h1Du5omGithCCJei/Nhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788634238;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ygdPr+Bk1h5S9U9RR0qsaL5pXTfVtmPDHrcDdgipXW4=;
 b=gR3Cro3LNle4iK7S7OLMiFcVOVPjNu7mPSUY998HjvYF5EpCrVXf/zFboJSaGorhSZ1x
 O5AS3T6a2SRy/3PW7v/vzecUxSMm17NXGTZFdVG5hqhC+0hAHpPpypjuOElcmJhXwGlZB
 efyZ5IEpLvLhxqanrQy8zyQp2vnK3zi4RYfY9FIIJleRmJZgMQB/T+K35LcZC8jWoXVaJ
 bLkcxtdI0MOLxoLWjKPF/S00Gi/GZvfFcCWDAjylffmnxVgremWG4nA2+R31QNSAcwxKT
 ApnWyUZYjHUt1L7iko6I1ybchtW5veXmAL+nUBQpBrIgNX4LrA91GoBIUbX/Tshao7w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C48EA40067
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9053D95281; Sat,  5 Sep 2026 18:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 20:50:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3469c6793ce6db8f813b3c203d3fc5eeb398e107
X-Git-Newrev: 9c6eed9ec03431079780ad9dac8dfb53c1ae3691
X-Patchwork-Hint: ignore
Message-Id: <20260905184937.9053D95281@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing,
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate
 after MMU dependency update
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c6eed9ec03431079780ad9dac8dfb53c1ae3691
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Regenerate the Bootlin toolchain Kconfig and test configurations using
support/scripts/gen-bootlin-toolchains.

This adds BR2_USE_MMU to the affected uClibc entries and to the
architecture support conditions, and updates the generated tests.
The glibc and musl changes only reorder their existing BR2_USE_MMU
dependencies.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/toolchain/test_external_bootlin.py       |  8 +++++++
 .../toolchain-external-bootlin/Config.in.options   | 28 +++++++++++++---------
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 6bcebf80c0..ecbb364642 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -2223,6 +2223,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dGlibcBleedingEdge(TestExternalToo
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE=y
@@ -2240,6 +2241,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dGlibcStable(TestExternalToolchain
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE=y
@@ -2257,6 +2259,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge(TestExternalTool
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE=y
@@ -2274,6 +2277,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dMuslStable(TestExternalToolchain)
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE=y
@@ -2291,6 +2295,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dUclibcBleedingEdge(TestExternalTo
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE=y
@@ -2308,6 +2313,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dUclibcStable(TestExternalToolchai
         BR2_riscv_g=y
         BR2_RISCV_32=y
         BR2_RISCV_ABI_ILP32D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE=y
@@ -3332,6 +3338,7 @@ class TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge(TestExternalToolc
         BR2_xtensa=y
         BR2_XTENSA_CUSTOM=y
         BR2_XTENSA_LITTLE_ENDIAN=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE=y
@@ -3348,6 +3355,7 @@ class TestExternalToolchainBootlinXtensalx60UclibcStable(TestExternalToolchain):
         BR2_xtensa=y
         BR2_XTENSA_CUSTOM=y
         BR2_XTENSA_LITTLE_ENDIAN=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index e8c5301780..f59c6aed5e 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -11,7 +11,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_arm && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	default y if BR2_armeb && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	default y if BR2_arm && BR2_ARM_CPU_ARMV7M && BR2_BINFMT_FLAT
-	default y if BR2_m68k_m68k
+	default y if BR2_m68k_m68k && BR2_USE_MMU
 	default y if BR2_m68k_cf
 	default y if BR2_microblazebe
 	default y if BR2_microblazeel
@@ -30,7 +30,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_powerpc64 && BR2_powerpc_e6500
 	default y if BR2_powerpc64 && BR2_powerpc_power8
 	default y if BR2_powerpc64le && BR2_powerpc_power8
-	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D
+	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && BR2_USE_MMU
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D && BR2_USE_MMU
 	default y if BR2_s390x && BR2_s390x_z13
 	default y if BR2_sh && BR2_sh4
@@ -44,7 +44,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
 	default y if BR2_i386 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3
 	default y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000 && !BR2_x86_pentium_mmx && !BR2_x86_geode && !BR2_x86_c3 && !BR2_x86_winchip_c6 && !BR2_x86_winchip2
-	default y if BR2_xtensa && BR2_XTENSA_CUSTOM && BR2_XTENSA_LITTLE_ENDIAN
+	default y if BR2_xtensa && BR2_XTENSA_CUSTOM && BR2_XTENSA_LITTLE_ENDIAN && BR2_USE_MMU
 
 if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 
@@ -1087,8 +1087,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
 	bool "m68k-68xxx glibc bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1110,8 +1110,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
 	bool "m68k-68xxx glibc stable 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1132,8 +1132,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
 	bool "m68k-68xxx musl bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1155,8 +1155,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
 	bool "m68k-68xxx musl stable 2025.08-1"
 	depends on BR2_m68k_m68k
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1177,6 +1177,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 	bool "m68k-68xxx uclibc bleeding-edge 2025.08-1"
 	depends on BR2_m68k_m68k
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1200,6 +1201,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
 	bool "m68k-68xxx uclibc stable 2025.08-1"
 	depends on BR2_m68k_m68k
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -3455,8 +3457,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3481,8 +3483,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3506,8 +3508,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3532,8 +3534,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3557,6 +3559,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -3583,6 +3586,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -5411,6 +5415,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -5436,6 +5441,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
+	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
