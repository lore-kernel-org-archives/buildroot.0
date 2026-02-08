Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E17BEF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 14:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE9B8222B;
	Sun,  8 Feb 2026 14:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaM0TcwNjmqL; Sun,  8 Feb 2026 14:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3BB68222F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770561412;
	bh=Wn3zOc/4QDT3xoSh8g2KLwu4yjLxGwASEfR5YptSnRY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p1mEdOFkfUXt7Y0zo1UNJktBv2EtimG1lzr0n1T0tpqR9mqdoz5PGnQUl6rp+Oaod
	 28XXyGDPvM2wz/R/Vxl/kpG3nK9KbAOMlsgC6vCfeEdF40Q9XMK3EM+JoUVPeVoF4e
	 yc1XIljtGJz8WBlt2SXHGlAx10JHA71CYG/94jR9jOJd/MT1lVQ6hIUIkyok566Stw
	 wOKKEBP0kWgDUTTLYiO5DEWFXLBSRp6D4E41VgWYeM70BIwaiulKf5Zl79QLOYZYmg
	 d8BLW0X+5DMH60uRp2pdVV7vXhBFQYk06lrMPcOCZKRERErk5vrMR3XKtCglgqh9od
	 VcGgmtF2Rjefw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BB68222F;
	Sun,  8 Feb 2026 14:36:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6CCA219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C68D8222F
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAlRA7EwYTL6 for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 14:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56A658222B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A658222B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56A658222B
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 69FF319F5A7;
 Sun,  8 Feb 2026 15:36:43 +0100 (CET)
To: buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  8 Feb 2026 15:36:04 +0100
Message-ID: <20260208143604.1477756-6-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208143604.1477756-1-ju.o@free.fr>
References: <20260208143604.1477756-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770561407;
 bh=47bqJBMmNy5Jw/kuZuAFioBLqxwh2L48ZYy9leQyW50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dUBXRyG8Jjoz3Ztbv8BGLXlgLel4FWZsdMosqSa0Di3jCqvOUQPU6cWQo3TQwQCxL
 3PWkDt5RNwnRkjMEXMDAXvaFsSTZn/E5c0r3L8Y9Rz9VH69io5h5nm7eLyp2wavQKK
 pkbf9XxBMIBhLhPu1ZVclWr5zuiVcCXG6CN5QfZeSDOjvu8agzjtZP9v5hzF7NC4Cb
 PvZNmqS6m3jmquFRgm9EGJ07Rdqa74Ph3pGVjeTfmGsTVG6LUgphWf7qTnVXlU6gil
 JZDJwYU1pV9384PUbA32Ec4c/vXR59RVxBZRFzUCWzW2+/djmoGMpmiAEserlyfbzz
 rmXOVxGJVgQmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dUBXRyG8
Subject: [Buildroot] [PATCH RFC 5/5] arch: mark a set of target
 configurations as secondary
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those target configurations marked as "secondary" will be tested with a
lower probability in autobuilders. The intent is to focus the Buildroot
development (and bugfixes) on mainstream configurations, while still
keeping some other, less common, configurations.

This commit marks the following CPU architectures as secondary:

BR2_arcle (ARC little endian)
BR2_armeb (ARM big endian)
BR2_aarch64_be (AArch64 big endian)
BR2_hppa (PA-RISC)
BR2_loongarch64
BR2_m68k
BR2_microblazeel (Microblaze AXI, little endian)
BR2_microblazebe (Microblaze non-AXI, big endian)
BR2_mips (MIPS, big endian)
BR2_mipsel (MIPS, little endian)
BR2_mips64 (MIPS64 big endian)
BR2_or1k (OpenRISC)
BR2_powerpc (PowerPC, big endian)
BR2_powerpc64 (PowerPC64, big endian)
BR2_s390x
BR2_sh (SuperH)
BR2_sparc
BR2_sparc64
BR2_xtensa

In the following CPU architecture, only specific configurations are
marked secondary:

In BR2_armeb (ARM little endian),
- armv4 cores (arm920t, arm922t, fa526/626, strongarm sa110/sa1100)

In BR2_riscv:
- all 32-bit configurations
- 64-bit no-MMU

In BR2_i386 (x86 32-bit),
- i486, i586 and X1000 CPU

There was no strict rule established to build this list of secondary
configurations. This list was built mainly from the observation of
which architecture/CPUs are still widely used in the field
(disregarding its age), the quality of their upstream support and
the general relevance in the Buildroot project.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in       | 19 +++++++++++++++++++
 arch/Config.in.arm   |  5 +++++
 arch/Config.in.riscv |  2 ++
 arch/Config.in.x86   |  3 +++
 4 files changed, 29 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index e6b4fd040e..c97836a506 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -44,6 +44,7 @@ choice
 
 config BR2_arcle
 	bool "ARC (little endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of
@@ -62,6 +63,7 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
@@ -80,6 +82,7 @@ config BR2_aarch64
 
 config BR2_aarch64_be
 	bool "AArch64 (big endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
@@ -88,6 +91,7 @@ config BR2_aarch64_be
 
 config BR2_hppa
 	bool "HPPA"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Precision Architecture (a.k.a. PA-RISC) is a 32-bit
@@ -103,6 +107,7 @@ config BR2_i386
 
 config BR2_loongarch64
 	bool "LoongArch64"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
@@ -113,6 +118,7 @@ config BR2_loongarch64
 
 config BR2_m68k
 	bool "m68k"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
 	help
 	  Motorola 68000 family microprocessor
@@ -120,6 +126,7 @@ config BR2_m68k
 
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
@@ -129,6 +136,7 @@ config BR2_microblazeel
 
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
@@ -138,6 +146,7 @@ config BR2_microblazebe
 
 config BR2_mips
 	bool "MIPS (big endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big
@@ -147,6 +156,7 @@ config BR2_mips
 
 config BR2_mipsel
 	bool "MIPS (little endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little
@@ -156,6 +166,7 @@ config BR2_mipsel
 
 config BR2_mips64
 	bool "MIPS64 (big endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -176,6 +187,7 @@ config BR2_mips64el
 
 config BR2_or1k
 	bool "OpenRISC"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  OpenRISC is a free and open processor for embedded system.
@@ -183,6 +195,7 @@ config BR2_or1k
 
 config BR2_powerpc
 	bool "PowerPC"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
@@ -192,6 +205,7 @@ config BR2_powerpc
 
 config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -222,6 +236,7 @@ config BR2_riscv
 
 config BR2_s390x
 	bool "s390x"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -231,6 +246,7 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
@@ -241,6 +257,7 @@ config BR2_sh
 
 config BR2_sparc
 	bool "SPARC"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
@@ -251,6 +268,7 @@ config BR2_sparc
 
 config BR2_sparc64
 	bool "SPARC64"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -271,6 +289,7 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
 	help
 	  Xtensa is a Tensilica processor IP architecture.
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a0bf6c3386..80e197529c 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -112,22 +112,27 @@ choice
 
 if !BR2_ARCH_IS_64
 comment "armv4 cores"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 config BR2_arm920t
 	bool "arm920t"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 config BR2_arm922t
 	bool "arm922t"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 config BR2_fa526
 	bool "fa526/626"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 299190f364..4ca2ff74c2 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -58,10 +58,12 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
+	select BR2_RISCV_USE_MMU if !BR2_SHOW_SECONDARY_TARGET_OPTIONS
 
 endchoice
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 548bef9226..64bdb2cd86 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -42,12 +42,15 @@ choice
 
 config BR2_x86_i486
 	bool "i486"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 config BR2_x86_i586
 	bool "i586"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 config BR2_x86_x1000
 	bool "x1000"
+	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 	help
 	  The Intel X1000 is a Pentium class microprocessor in the
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
