Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB137FF5138
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B04FD606C5;
	Tue,  7 Apr 2026 20:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3MGYhdkm6KC; Tue,  7 Apr 2026 20:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CC4360D4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775592007;
	bh=0kUeQ4AaESPqj1pq50ygdhYDSepDanqXlEmVFAdgg0w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pba/xwpPCdeBq5Ui8aHy9VBJ7TuOMK/Xio5VpC/zhAUOhrc8hIwufh9sl44TeypxD
	 pgPVCKhhB/iMV4t+X4QEOp3PqcQHLTRAu0QLKM6t+91Sex3EdEMa5f1v5nRbuePbZu
	 mUt0/Dbyhehe2rs1C3eYhfuC3wMELQMHtjPdjK8wZP0y9uxOvIW2lQuUPYP/NAQ1oA
	 mb0A3qHjvOkcqpjhRZW8tFvoiyboS69QGbe+9MnSseMFb/Qx6Wr6VnZq1ChBQ1qmHW
	 xqYwgOgyXfHHILMAz7uKQN3H8BR6ZKiGsUroW+gUKx44OOvxbsSFaSddQAIh75uAE8
	 mNq3xlndEESrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CC4360D4D;
	Tue,  7 Apr 2026 20:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51DA7237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4301D60D4D
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jch18zcCxCG for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:00:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F033C606C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F033C606C5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F033C606C5
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:00:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2BAEB97BCDA; Tue,  7 Apr 2026 22:00:02 +0200 (CEST)
Message-ID: <a41f1be7-85f0-43b2-a7c2-a797dd1f3e40@rnout.be>
Date: Tue, 7 Apr 2026 22:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260307180711.1025866-1-ju.o@free.fr>
 <20260307180711.1025866-5-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260307180711.1025866-5-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775592003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=LJXyS+FSMbSkOkRIN8RyJF4aBWD6pyDPoPdf5Ee5fRk=;
 b=paLs/9kvfZdlvC5lwJFW5GLIFCN0NUSjJrAd90BjIueZqDqn0rCmnyPAhpxKbfNCfN53bH
 4nKzP6Sg9DwGx4zgRQcT35nu0n8GrcTf2iCT/tCMsUsp14gro8Tu36AVYzeROWUhzBfnc+
 2d9gisG4fMkCT6WlX9RS1QxO1BPZJ/uSUjGez83siZrGqVSZMmrlsYOiHTQA71jFPN7tbI
 QM8qC5ZX4A7c/+Piol7LRhkUdYFc81dDsF1CWuZdfY7R1zuCeGU0NolTauYQ8Tz16zDx0R
 atx+DTI8kNkUsyw4tCHjJJbm1MTKxJ8E97Do77LrniODTT9ncVUuUojja9E1UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=paLs/9kv
Subject: Re: [Buildroot] [PATCH RFC v2 5/5] arch: mark a set of target
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/03/2026 19:07, Julien Olivain wrote:
> Those target configurations marked as "secondary" will be tested with a
> lower probability in autobuilders. The intent is to focus the Buildroot
> development (and bugfixes) on mainstream configurations, while still
> keeping some other, less common, configurations.
> 
> This commit marks the following CPU architectures as secondary:
> 
> BR2_arcle (ARC little endian)
> BR2_armeb (ARM big endian)
> BR2_aarch64_be (AArch64 big endian)
> BR2_hppa (PA-RISC)
> BR2_loongarch64
> BR2_m68k
> BR2_microblazeel (Microblaze AXI, little endian)
> BR2_microblazebe (Microblaze non-AXI, big endian)
> BR2_mips (MIPS, big endian)
> BR2_mipsel (MIPS, little endian)
> BR2_mips64 (MIPS64 big endian)
> BR2_or1k (OpenRISC)
> BR2_powerpc (PowerPC, big endian)
> BR2_powerpc64 (PowerPC64, big endian)
> BR2_s390x
> BR2_sh (SuperH)
> BR2_sparc
> BR2_sparc64
> BR2_xtensa
> 
> In the following CPU architecture, only specific configurations are
> marked secondary:
> 
> In BR2_armeb (ARM little endian),
> - armv4 cores (arm920t, arm922t, fa526/626, strongarm sa110/sa1100)
> 
> In BR2_riscv:
> - all 32-bit configurations
> - 64-bit no-MMU
> 
> In BR2_i386 (x86 32-bit),
> - i486, i586 and X1000 CPU
> 
> There was no strict rule established to build this list of secondary
> configurations. This list was built mainly from the observation of
> which architecture/CPUs are still widely used in the field
> (disregarding its age), the quality of their upstream support and
> the general relevance in the Buildroot project.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2: no change.
> ---
>   arch/Config.in       | 19 +++++++++++++++++++
>   arch/Config.in.arm   |  5 +++++
>   arch/Config.in.riscv |  2 ++
>   arch/Config.in.x86   |  3 +++
>   4 files changed, 29 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index bf638e6226..7caa28e380 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -28,6 +28,7 @@ choice
>   
>   config BR2_arcle
>   	bool "ARC (little endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS

  Replaced all instances with !BR2_HIDE_SECONDARY_TARGET_OPTIONS and applied to 
master, thanks.

  Regards,
  Arnout

>   	select BR2_USE_MMU
>   	help
>   	  Synopsys' DesignWare ARC Processor Cores are a family of
> @@ -46,6 +47,7 @@ config BR2_arm
>   
>   config BR2_armeb
>   	bool "ARM (big endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  ARM is a 32-bit reduced instruction set computer (RISC)
> @@ -64,6 +66,7 @@ config BR2_aarch64
>   
>   config BR2_aarch64_be
>   	bool "AArch64 (big endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARCH_IS_64
>   	help
>   	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
> @@ -72,6 +75,7 @@ config BR2_aarch64_be
>   
>   config BR2_hppa
>   	bool "HPPA"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  Precision Architecture (a.k.a. PA-RISC) is a 32-bit
> @@ -87,6 +91,7 @@ config BR2_i386
>   
>   config BR2_loongarch64
>   	bool "LoongArch64"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	select BR2_ARCH_IS_64
>   	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
> @@ -97,6 +102,7 @@ config BR2_loongarch64
>   
>   config BR2_m68k
>   	bool "m68k"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
>   	help
>   	  Motorola 68000 family microprocessor
> @@ -104,6 +110,7 @@ config BR2_m68k
>   
>   config BR2_microblazeel
>   	bool "Microblaze AXI (little endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
> @@ -113,6 +120,7 @@ config BR2_microblazeel
>   
>   config BR2_microblazebe
>   	bool "Microblaze non-AXI (big endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
> @@ -122,6 +130,7 @@ config BR2_microblazebe
>   
>   config BR2_mips
>   	bool "MIPS (big endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  MIPS is a RISC microprocessor from MIPS Technologies. Big
> @@ -131,6 +140,7 @@ config BR2_mips
>   
>   config BR2_mipsel
>   	bool "MIPS (little endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  MIPS is a RISC microprocessor from MIPS Technologies. Little
> @@ -140,6 +150,7 @@ config BR2_mipsel
>   
>   config BR2_mips64
>   	bool "MIPS64 (big endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARCH_IS_64
>   	select BR2_USE_MMU
>   	help
> @@ -160,6 +171,7 @@ config BR2_mips64el
>   
>   config BR2_or1k
>   	bool "OpenRISC"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  OpenRISC is a free and open processor for embedded system.
> @@ -167,6 +179,7 @@ config BR2_or1k
>   
>   config BR2_powerpc
>   	bool "PowerPC"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
> @@ -176,6 +189,7 @@ config BR2_powerpc
>   
>   config BR2_powerpc64
>   	bool "PowerPC64 (big endian)"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARCH_IS_64
>   	select BR2_USE_MMU
>   	help
> @@ -206,6 +220,7 @@ config BR2_riscv
>   
>   config BR2_s390x
>   	bool "s390x"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARCH_IS_64
>   	select BR2_USE_MMU
>   	help
> @@ -215,6 +230,7 @@ config BR2_s390x
>   
>   config BR2_sh
>   	bool "SuperH"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  SuperH (or SH) is a 32-bit reduced instruction set computer
> @@ -225,6 +241,7 @@ config BR2_sh
>   
>   config BR2_sparc
>   	bool "SPARC"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_USE_MMU
>   	help
>   	  SPARC (from Scalable Processor Architecture) is a RISC
> @@ -235,6 +252,7 @@ config BR2_sparc
>   
>   config BR2_sparc64
>   	bool "SPARC64"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARCH_IS_64
>   	select BR2_USE_MMU
>   	help
> @@ -255,6 +273,7 @@ config BR2_x86_64
>   
>   config BR2_xtensa
>   	bool "Xtensa"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
>   	help
>   	  Xtensa is a Tensilica processor IP architecture.
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index a0bf6c3386..80e197529c 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -112,22 +112,27 @@ choice
>   
>   if !BR2_ARCH_IS_64
>   comment "armv4 cores"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   config BR2_arm920t
>   	bool "arm920t"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARM_CPU_HAS_ARM
>   	select BR2_ARM_CPU_HAS_THUMB
>   	select BR2_ARM_CPU_ARMV4
>   config BR2_arm922t
>   	bool "arm922t"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARM_CPU_HAS_ARM
>   	select BR2_ARM_CPU_HAS_THUMB
>   	select BR2_ARM_CPU_ARMV4
>   config BR2_fa526
>   	bool "fa526/626"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARM_CPU_HAS_ARM
>   	select BR2_ARM_CPU_ARMV4
>   config BR2_strongarm
>   	bool "strongarm sa110/sa1100"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	select BR2_ARM_CPU_HAS_ARM
>   	select BR2_ARM_CPU_ARMV4
>   
> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
> index 299190f364..4ca2ff74c2 100644
> --- a/arch/Config.in.riscv
> +++ b/arch/Config.in.riscv
> @@ -58,10 +58,12 @@ choice
>   
>   config BR2_RISCV_32
>   	bool "32-bit"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   
>   config BR2_RISCV_64
>   	bool "64-bit"
>   	select BR2_ARCH_IS_64
> +	select BR2_RISCV_USE_MMU if !BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   
>   endchoice
>   
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 548bef9226..64bdb2cd86 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -42,12 +42,15 @@ choice
>   
>   config BR2_x86_i486
>   	bool "i486"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	depends on !BR2_x86_64
>   config BR2_x86_i586
>   	bool "i586"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	depends on !BR2_x86_64
>   config BR2_x86_x1000
>   	bool "x1000"
> +	depends on BR2_SHOW_SECONDARY_TARGET_OPTIONS
>   	depends on !BR2_x86_64
>   	help
>   	  The Intel X1000 is a Pentium class microprocessor in the

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
