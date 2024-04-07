Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA34CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BF360A45;
	Sun,  7 Apr 2024 14:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjPk5VAW1mBE; Sun,  7 Apr 2024 14:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A8760A49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5A8760A49;
	Sun,  7 Apr 2024 14:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1D5D1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94FCC81E9E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9kI18dNPcmu for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:54:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF95D81E82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF95D81E82
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF95D81E82
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:54:01 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-415446af364so26916805e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712501640; x=1713106440;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hS7c1MPvhoK7sR+/vWk/7zaNKQKdQRc9cxSCP9mUNeo=;
 b=sA2N5RS4W9lcufFIYulMloIuf28d4GWIc+OOgXLQE2OFxitJ6dhNm8ie1mEE0bML9d
 qb1+hrCyWNZQugZJkz+vgt0JE+xKHJSxTilqlaokdm0GIdKhs7Te7tQBQOWBDb8GgM/r
 IfcQcI8njl6+SA8bLrTz0vgYQhSbA6eLq2PRz+lFSHH5DlHpVYwmVMYanrMlGhGy6o3R
 +wyVMjnzIVbR06EqBSreVpDZGQAQ2eVN8wisLmw3Mc3Nx6TMGpL9YOk9Gy9tFdF5ippJ
 SWMeVtMwzji9rqlZELKAVjUQSfs8li6fUeKEF5mryQo43a/v0e8BJs9uRPR3vaCjCpf9
 Dpbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaEs09+/hdq1HuOdg5aO0N6/uNkW+RWmfSK+Rl8Gamx3AC2gSEmzCiW2zVE9NF1jomymeJ4TmvaWhGxjgIMt5viZcCfOh30g==
X-Gm-Message-State: AOJu0Yx+xTVTY8fwSrZ5JQwfDxSyoL8ITTB5vgyRtoExicasw8otaLCG
 F2leImazDG6U6DRgwzfvTK2lwyELDOBZ7tnxUTo/11RxJPGx8zB/FuBwRIAcOPU=
X-Google-Smtp-Source: AGHT+IG/9uOXbUlK8zXMshsASVsDX775+EuqBNky7qGGD9Y0Tehx/EFPSzvw3mXbfHTuN11H9+nyzg==
X-Received: by 2002:adf:f9c7:0:b0:33e:c91b:9083 with SMTP id
 w7-20020adff9c7000000b0033ec91b9083mr6382391wrr.16.1712501639546; 
 Sun, 07 Apr 2024 07:53:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4c8f000000b00343daeddcb2sm6836970wrs.45.2024.04.07.07.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 07:53:59 -0700 (PDT)
Message-ID: <8404d45f-22ff-4391-be58-e8c94949ed82@mind.be>
Date: Sun, 7 Apr 2024 16:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240225114414.2556543-1-romain.naour@smile.fr>
 <20240225114414.2556543-2-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240225114414.2556543-2-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712501640; x=1713106440; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hS7c1MPvhoK7sR+/vWk/7zaNKQKdQRc9cxSCP9mUNeo=;
 b=RaINKHsb5G7Xjlr6zhygNA8J/jXIUk56KxL2t6djxv/4IJ+/TG7fjc/NrIlmJYpIkC
 5rzNMKx+7jB/laYViMlBfQMZ7t6PEIOjkjSomTB508bk/GSGYoLlOXeFcLWIEs1I+gOW
 t1xchFjaMd/60tCaFS1CdKxJWjNoVsgUGcVqjkcuzEV1a3SiSbiRCvX70/k9Aoyhdt47
 TeMyMWbcsRnJggsmebcK6nThFpZ0lYJ4WMYxILf1JrIpCZ9wJXybFNY2s/Hh629gM7zq
 z00pdRfA6cHAxw739S8MK3PnPCUc1OI5dRA+EAH5cpOtBC36iOUeoKQBkcuRk+iPKc+L
 QccA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RaINKHsb
Subject: Re: [Buildroot] [PATCH 2/2] configs/qemu: update defconfigs to
 Linux 6.6.18
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/02/2024 12:44, Romain Naour wrote:
> Update all qemu defconfigs to the latest Kernel LTS version.
> 
> Remove m68k kernel patches already in v6.6.x.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

  Applied to master, thanks.

  Next time, please also enable BR2_DOWNLOAD_FORCE_CHECK_HASHES and add the 
hashes to board/qemu/patches/linux.hash. There are a few of them that also have 
a boot loader, those will need to be added to the hash file as well of course.

  Regards,
  Arnout

> ---
>   ...001-m68k-Fix-invalid-.section-syntax.patch | 97 -------------------
>   ...001-m68k-Fix-invalid-.section-syntax.patch | 97 -------------------
>   configs/qemu_aarch64_ebbr_defconfig           |  2 +-
>   configs/qemu_aarch64_sbsa_defconfig           |  4 +-
>   configs/qemu_aarch64_virt_defconfig           |  4 +-
>   configs/qemu_arm_ebbr_defconfig               |  2 +-
>   configs/qemu_arm_versatile_defconfig          |  4 +-
>   configs/qemu_arm_vexpress_defconfig           |  4 +-
>   configs/qemu_arm_vexpress_tz_defconfig        |  4 +-
>   configs/qemu_m68k_mcf5208_defconfig           |  5 +-
>   configs/qemu_m68k_q800_defconfig              |  5 +-
>   configs/qemu_microblazebe_mmu_defconfig       |  4 +-
>   configs/qemu_microblazeel_mmu_defconfig       |  4 +-
>   configs/qemu_mips32r2_malta_defconfig         |  4 +-
>   configs/qemu_mips32r2el_malta_defconfig       |  4 +-
>   configs/qemu_mips32r6_malta_defconfig         |  4 +-
>   configs/qemu_mips32r6el_malta_defconfig       |  4 +-
>   configs/qemu_mips64_malta_defconfig           |  4 +-
>   configs/qemu_mips64el_malta_defconfig         |  4 +-
>   configs/qemu_mips64r6_malta_defconfig         |  4 +-
>   configs/qemu_mips64r6el_malta_defconfig       |  4 +-
>   configs/qemu_nios2_10m50_defconfig            |  4 +-
>   configs/qemu_or1k_defconfig                   |  4 +-
>   configs/qemu_ppc64_e5500_defconfig            |  4 +-
>   configs/qemu_ppc64_pseries_defconfig          |  4 +-
>   configs/qemu_ppc64le_powernv8_defconfig       |  4 +-
>   configs/qemu_ppc64le_pseries_defconfig        |  4 +-
>   configs/qemu_ppc_bamboo_defconfig             |  4 +-
>   configs/qemu_ppc_e500mc_defconfig             |  4 +-
>   configs/qemu_ppc_g3beige_defconfig            |  4 +-
>   configs/qemu_ppc_mac99_defconfig              |  4 +-
>   configs/qemu_ppc_mpc8544ds_defconfig          |  4 +-
>   configs/qemu_riscv32_virt_defconfig           |  4 +-
>   configs/qemu_riscv64_nommu_virt_defconfig     |  4 +-
>   configs/qemu_riscv64_virt_defconfig           |  4 +-
>   configs/qemu_riscv64_virt_efi_defconfig       |  4 +-
>   configs/qemu_s390x_defconfig                  |  4 +-
>   configs/qemu_sh4_r2d_defconfig                |  4 +-
>   configs/qemu_sh4eb_r2d_defconfig              |  4 +-
>   configs/qemu_sparc64_sun4u_defconfig          |  4 +-
>   configs/qemu_x86_64_defconfig                 |  4 +-
>   configs/qemu_x86_defconfig                    |  4 +-
>   configs/qemu_xtensa_lx60_defconfig            |  4 +-
>   configs/qemu_xtensa_lx60_nommu_defconfig      |  4 +-
>   44 files changed, 82 insertions(+), 278 deletions(-)
>   delete mode 100644 board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch
>   delete mode 100644 board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch
> 
> diff --git a/board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch b/board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch
> deleted file mode 100644
> index 1f1ed75ae0..0000000000
> --- a/board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 0bb6b7477f5dcfafbdd76eea9c7aa7a5f78d7613 Mon Sep 17 00:00:00 2001
> -From: Ben Hutchings <benh@debian.org>
> -Date: Fri, 16 Jun 2023 17:36:10 +0200
> -Subject: [PATCH] m68k: Fix invalid .section syntax
> -
> -gas supports several different forms for .section for ELF targets,
> -including:
> -    .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
> -and:
> -    .section "NAME"[, #FLAGS...]
> -
> -In several places we use a mix of these two forms:
> -    .section NAME, #FLAGS...
> -
> -A current development snapshot of binutils (2.40.50.20230611) treats
> -this mixed syntax as an error.
> -
> -Change to consistently use:
> -    .section NAME, "FLAGS"
> -as is used elsewhere in the kernel.
> -
> -Link: https://buildd.debian.org/status/fetch.php?pkg=linux&arch=m68k&ver=6.4%7Erc6-1%7Eexp1&stamp=1686907300&raw=1
> -Signed-off-by: Ben Hutchings <benh@debian.org>
> -Tested-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> -Link: https://lore.kernel.org/r/ZIyBaueWT9jnTwRC@decadent.org.uk
> -Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> -Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=922a9bd138101e3e5718f0f4d40dba68ef89bb43
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - arch/m68k/fpsp040/skeleton.S       | 4 ++--
> - arch/m68k/ifpsp060/os.S            | 4 ++--
> - arch/m68k/kernel/relocate_kernel.S | 4 ++--
> - 3 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/arch/m68k/fpsp040/skeleton.S b/arch/m68k/fpsp040/skeleton.S
> -index 439395aa6fb4..081922c72daa 100644
> ---- a/arch/m68k/fpsp040/skeleton.S
> -+++ b/arch/m68k/fpsp040/skeleton.S
> -@@ -499,13 +499,13 @@ in_ea:
> - 	dbf	%d0,morein
> - 	rts
> -
> --	.section .fixup,#alloc,#execinstr
> -+	.section .fixup,"ax"
> - 	.even
> - 1:
> - 	jbsr	fpsp040_die
> - 	jbra	.Lnotkern
> -
> --	.section __ex_table,#alloc
> -+	.section __ex_table,"a"
> - 	.align	4
> -
> - 	.long	in_ea,1b
> -diff --git a/arch/m68k/ifpsp060/os.S b/arch/m68k/ifpsp060/os.S
> -index 7a0d6e428066..89e2ec224ab6 100644
> ---- a/arch/m68k/ifpsp060/os.S
> -+++ b/arch/m68k/ifpsp060/os.S
> -@@ -379,11 +379,11 @@ _060_real_access:
> -
> -
> - | Execption handling for movs access to illegal memory
> --	.section .fixup,#alloc,#execinstr
> -+	.section .fixup,"ax"
> - 	.even
> - 1:	moveq		#-1,%d1
> - 	rts
> --.section __ex_table,#alloc
> -+.section __ex_table,"a"
> - 	.align 4
> - 	.long	dmrbuae,1b
> - 	.long	dmrwuae,1b
> -diff --git a/arch/m68k/kernel/relocate_kernel.S b/arch/m68k/kernel/relocate_kernel.S
> -index ab0f1e7d4653..f7667079e08e 100644
> ---- a/arch/m68k/kernel/relocate_kernel.S
> -+++ b/arch/m68k/kernel/relocate_kernel.S
> -@@ -26,7 +26,7 @@ ENTRY(relocate_new_kernel)
> - 	lea %pc@(.Lcopy),%a4
> - 2:	addl #0x00000000,%a4		/* virt_to_phys() */
> -
> --	.section ".m68k_fixup","aw"
> -+	.section .m68k_fixup,"aw"
> - 	.long M68K_FIXUP_MEMOFFSET, 2b+2
> - 	.previous
> -
> -@@ -49,7 +49,7 @@ ENTRY(relocate_new_kernel)
> - 	lea %pc@(.Lcont040),%a4
> - 5:	addl #0x00000000,%a4		/* virt_to_phys() */
> -
> --	.section ".m68k_fixup","aw"
> -+	.section .m68k_fixup,"aw"
> - 	.long M68K_FIXUP_MEMOFFSET, 5b+2
> - 	.previous
> -
> ---
> -2.41.0
> -
> diff --git a/board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch b/board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch
> deleted file mode 100644
> index 1f1ed75ae0..0000000000
> --- a/board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 0bb6b7477f5dcfafbdd76eea9c7aa7a5f78d7613 Mon Sep 17 00:00:00 2001
> -From: Ben Hutchings <benh@debian.org>
> -Date: Fri, 16 Jun 2023 17:36:10 +0200
> -Subject: [PATCH] m68k: Fix invalid .section syntax
> -
> -gas supports several different forms for .section for ELF targets,
> -including:
> -    .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
> -and:
> -    .section "NAME"[, #FLAGS...]
> -
> -In several places we use a mix of these two forms:
> -    .section NAME, #FLAGS...
> -
> -A current development snapshot of binutils (2.40.50.20230611) treats
> -this mixed syntax as an error.
> -
> -Change to consistently use:
> -    .section NAME, "FLAGS"
> -as is used elsewhere in the kernel.
> -
> -Link: https://buildd.debian.org/status/fetch.php?pkg=linux&arch=m68k&ver=6.4%7Erc6-1%7Eexp1&stamp=1686907300&raw=1
> -Signed-off-by: Ben Hutchings <benh@debian.org>
> -Tested-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> -Link: https://lore.kernel.org/r/ZIyBaueWT9jnTwRC@decadent.org.uk
> -Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> -Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=922a9bd138101e3e5718f0f4d40dba68ef89bb43
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - arch/m68k/fpsp040/skeleton.S       | 4 ++--
> - arch/m68k/ifpsp060/os.S            | 4 ++--
> - arch/m68k/kernel/relocate_kernel.S | 4 ++--
> - 3 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/arch/m68k/fpsp040/skeleton.S b/arch/m68k/fpsp040/skeleton.S
> -index 439395aa6fb4..081922c72daa 100644
> ---- a/arch/m68k/fpsp040/skeleton.S
> -+++ b/arch/m68k/fpsp040/skeleton.S
> -@@ -499,13 +499,13 @@ in_ea:
> - 	dbf	%d0,morein
> - 	rts
> -
> --	.section .fixup,#alloc,#execinstr
> -+	.section .fixup,"ax"
> - 	.even
> - 1:
> - 	jbsr	fpsp040_die
> - 	jbra	.Lnotkern
> -
> --	.section __ex_table,#alloc
> -+	.section __ex_table,"a"
> - 	.align	4
> -
> - 	.long	in_ea,1b
> -diff --git a/arch/m68k/ifpsp060/os.S b/arch/m68k/ifpsp060/os.S
> -index 7a0d6e428066..89e2ec224ab6 100644
> ---- a/arch/m68k/ifpsp060/os.S
> -+++ b/arch/m68k/ifpsp060/os.S
> -@@ -379,11 +379,11 @@ _060_real_access:
> -
> -
> - | Execption handling for movs access to illegal memory
> --	.section .fixup,#alloc,#execinstr
> -+	.section .fixup,"ax"
> - 	.even
> - 1:	moveq		#-1,%d1
> - 	rts
> --.section __ex_table,#alloc
> -+.section __ex_table,"a"
> - 	.align 4
> - 	.long	dmrbuae,1b
> - 	.long	dmrwuae,1b
> -diff --git a/arch/m68k/kernel/relocate_kernel.S b/arch/m68k/kernel/relocate_kernel.S
> -index ab0f1e7d4653..f7667079e08e 100644
> ---- a/arch/m68k/kernel/relocate_kernel.S
> -+++ b/arch/m68k/kernel/relocate_kernel.S
> -@@ -26,7 +26,7 @@ ENTRY(relocate_new_kernel)
> - 	lea %pc@(.Lcopy),%a4
> - 2:	addl #0x00000000,%a4		/* virt_to_phys() */
> -
> --	.section ".m68k_fixup","aw"
> -+	.section .m68k_fixup,"aw"
> - 	.long M68K_FIXUP_MEMOFFSET, 2b+2
> - 	.previous
> -
> -@@ -49,7 +49,7 @@ ENTRY(relocate_new_kernel)
> - 	lea %pc@(.Lcont040),%a4
> - 5:	addl #0x00000000,%a4		/* virt_to_phys() */
> -
> --	.section ".m68k_fixup","aw"
> -+	.section .m68k_fixup,"aw"
> - 	.long M68K_FIXUP_MEMOFFSET, 5b+2
> - 	.previous
> -
> ---
> -2.41.0
> -
> diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
> index 75a892f798..84ab60a60b 100644
> --- a/configs/qemu_aarch64_ebbr_defconfig
> +++ b/configs/qemu_aarch64_ebbr_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.11"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
> index 5acfaea777..06cce72b6e 100644
> --- a/configs/qemu_aarch64_sbsa_defconfig
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/a
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index 1167060308..fedefd6d79 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
> index a0520edcf4..ea732721ad 100644
> --- a/configs/qemu_arm_ebbr_defconfig
> +++ b/configs/qemu_arm_ebbr_defconfig
> @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.11"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
>   
> diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
> index 7c93ae3e7e..2c73090d5d 100644
> --- a/configs/qemu_arm_versatile_defconfig
> +++ b/configs/qemu_arm_versatile_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="versatile"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
> index ccbcc8ea4e..12ec33ed7a 100644
> --- a/configs/qemu_arm_vexpress_defconfig
> +++ b/configs/qemu_arm_vexpress_defconfig
> @@ -20,12 +20,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index 11a5c98174..76e2431f28 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -17,12 +17,12 @@ BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
>   
> diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
> index 0c95756a8e..64b906b2e5 100644
> --- a/configs/qemu_m68k_mcf5208_defconfig
> +++ b/configs/qemu_m68k_mcf5208_defconfig
> @@ -14,15 +14,14 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
> -BR2_LINUX_KERNEL_PATCH="board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch"
>   BR2_LINUX_KERNEL_VMLINUX=y
>   
>   # Serial port config
> diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
> index a3a09ef775..83f3d03c60 100644
> --- a/configs/qemu_m68k_q800_defconfig
> +++ b/configs/qemu_m68k_q800_defconfig
> @@ -14,15 +14,14 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
> -BR2_LINUX_KERNEL_PATCH="board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch"
>   BR2_LINUX_KERNEL_VMLINUX=y
>   
>   # Serial port config
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> index a93ef3564d..9266b3e4aa 100644
> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
>   BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
> index 0b00b58b4e..bef418fd51 100644
> --- a/configs/qemu_microblazeel_mmu_defconfig
> +++ b/configs/qemu_microblazeel_mmu_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
>   BR2_LINUX_KERNEL_LINUX_BIN=y
> diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
> index 1fdc588998..29ab718748 100644
> --- a/configs/qemu_mips32r2_malta_defconfig
> +++ b/configs/qemu_mips32r2_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
> index 35d071010d..9f963d26df 100644
> --- a/configs/qemu_mips32r2el_malta_defconfig
> +++ b/configs/qemu_mips32r2el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
> index a57347d2a6..b3fa5f5e11 100644
> --- a/configs/qemu_mips32r6_malta_defconfig
> +++ b/configs/qemu_mips32r6_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
> index 9fb82a76d2..ef98362b5b 100644
> --- a/configs/qemu_mips32r6el_malta_defconfig
> +++ b/configs/qemu_mips32r6el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
> index f314b123a8..d645f2ffdd 100644
> --- a/configs/qemu_mips64_malta_defconfig
> +++ b/configs/qemu_mips64_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
> index 672c416a09..b64b577abe 100644
> --- a/configs/qemu_mips64el_malta_defconfig
> +++ b/configs/qemu_mips64el_malta_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
> index 15dba14cc6..5f7bc13b84 100644
> --- a/configs/qemu_mips64r6_malta_defconfig
> +++ b/configs/qemu_mips64r6_malta_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
> index 39b9c73bcd..500ec39658 100644
> --- a/configs/qemu_mips64r6el_malta_defconfig
> +++ b/configs/qemu_mips64r6el_malta_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
> index 698ff68e5e..327fd99196 100644
> --- a/configs/qemu_nios2_10m50_defconfig
> +++ b/configs/qemu_nios2_10m50_defconfig
> @@ -1,7 +1,7 @@
>   BR2_nios2=y
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="10m50"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
>   BR2_TARGET_ROOTFS_INITRAMFS=y
> @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel needs mkimage
>   BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
> index 4f1030b35f..3cbe89ce5f 100644
> --- a/configs/qemu_or1k_defconfig
> +++ b/configs/qemu_or1k_defconfig
> @@ -13,12 +13,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
>   
> diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
> index 8e68fae3c2..1f34a50b74 100644
> --- a/configs/qemu_ppc64_e5500_defconfig
> +++ b/configs/qemu_ppc64_e5500_defconfig
> @@ -11,12 +11,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as the kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
> index 4bc9534166..8c58fec24f 100644
> --- a/configs/qemu_ppc64_pseries_defconfig
> +++ b/configs/qemu_ppc64_pseries_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>   BR2_LINUX_KERNEL_VMLINUX=y
>   
> diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
> index 4975a90bc6..23ad5772c2 100644
> --- a/configs/qemu_ppc64le_powernv8_defconfig
> +++ b/configs/qemu_ppc64le_powernv8_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="powernv"
>   BR2_LINUX_KERNEL_VMLINUX=y
>   
> diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
> index 1cca03053b..207e5f5b40 100644
> --- a/configs/qemu_ppc64le_pseries_defconfig
> +++ b/configs/qemu_ppc64le_pseries_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
>   BR2_LINUX_KERNEL_VMLINUX=y
>   
> diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
> index 284982cf2c..1ebd2be5dc 100644
> --- a/configs/qemu_ppc_bamboo_defconfig
> +++ b/configs/qemu_ppc_bamboo_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
> index e50484f5a3..75833000e4 100644
> --- a/configs/qemu_ppc_e500mc_defconfig
> +++ b/configs/qemu_ppc_e500mc_defconfig
> @@ -11,12 +11,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as the kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
> index 6c14a1ca90..0234827092 100644
> --- a/configs/qemu_ppc_g3beige_defconfig
> +++ b/configs/qemu_ppc_g3beige_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
> index 33b9ec0d63..b03378b34f 100644
> --- a/configs/qemu_ppc_mac99_defconfig
> +++ b/configs/qemu_ppc_mac99_defconfig
> @@ -6,12 +6,12 @@ BR2_powerpc_7400=y
>   BR2_SYSTEM_DHCP="eth0"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
> index efbc5fc81d..9ae10a9577 100644
> --- a/configs/qemu_ppc_mpc8544ds_defconfig
> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
>   BR2_LINUX_KERNEL_VMLINUX=y
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index 74a67400ea..56341c768e 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="rv32"
>   BR2_LINUX_KERNEL_IMAGE=y
>   
> diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
> index 9999bcf7f3..34dd1c88ba 100644
> --- a/configs/qemu_riscv64_nommu_virt_defconfig
> +++ b/configs/qemu_riscv64_nommu_virt_defconfig
> @@ -4,7 +4,7 @@ BR2_RISCV_64=y
>   # BR2_RISCV_USE_MMU is not set
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # System
>   BR2_TARGET_GENERIC_GETTY=y
> @@ -19,7 +19,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
>   BR2_LINUX_KERNEL_IMAGE=y
>   
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index 52ad87fa7c..93c65b2727 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_IMAGE=y
>   
> diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
> index 79aadf78ca..0818b8f3aa 100644
> --- a/configs/qemu_riscv64_virt_efi_defconfig
> +++ b/configs/qemu_riscv64_virt_efi_defconfig
> @@ -1,11 +1,11 @@
>   BR2_riscv=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   BR2_SYSTEM_DHCP="eth0"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/riscv64-virt-efi/assemble-flash-images support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/riscv64-virt-efi/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.69"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> index 39dae4be2a..a768ca3053 100644
> --- a/configs/qemu_s390x_defconfig
> +++ b/configs/qemu_s390x_defconfig
> @@ -13,12 +13,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   
> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index 038a9763c3..e5570dcbab 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Linux kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
>   BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
> index a8988d4446..468d6567ae 100644
> --- a/configs/qemu_sh4eb_r2d_defconfig
> +++ b/configs/qemu_sh4eb_r2d_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Linux kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
>   BR2_LINUX_KERNEL_ZIMAGE=y
> diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
> index 8a61155411..213083c142 100644
> --- a/configs/qemu_sparc64_sun4u_defconfig
> +++ b/configs/qemu_sparc64_sun4u_defconfig
> @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Linux kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
>   
> diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
> index 9e99d9d2b2..030818199b 100644
> --- a/configs/qemu_x86_64_defconfig
> +++ b/configs/qemu_x86_64_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>   BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
> index 5c6bebd3e3..92764c9852 100644
> --- a/configs/qemu_x86_defconfig
> +++ b/configs/qemu_x86_defconfig
> @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>   
> diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
> index 8dcdced01b..d315f2604d 100644
> --- a/configs/qemu_xtensa_lx60_defconfig
> +++ b/configs/qemu_xtensa_lx60_defconfig
> @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
> index d1d59b9525..16a323db94 100644
> --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>   
>   # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
