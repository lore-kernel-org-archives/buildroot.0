Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91028D75E5D
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128A042F86;
	Sun, 24 Nov 2024 21:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vKo_qQzOVRL; Sun, 24 Nov 2024 21:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 872A142F83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 872A142F83;
	Sun, 24 Nov 2024 21:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3477931
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 21:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2286D84C30
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 21:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtKDiSiBLJq1 for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 21:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8C9C84C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C9C84C2D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8C9C84C2D
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 21:30:47 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D1167B00563;
 Sun, 24 Nov 2024 22:30:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 24 Nov 2024 22:30:30 +0100
Message-ID: <20241124213031.2515138-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732483844;
 bh=iyiGB3clhUo7NzAAo45RUqEO4bLFPqX2vG/pUCHlCXw=;
 h=From:To:Cc:Subject:Date:From;
 b=b7JhYoWOn8BCmAQOhqZ7Gty+wZlM8fW3zJrTr88B5Jkhv3/R7k/VmKQl9UNdL+yJI
 iUWi6bbbnTVjvQnFmItoIjkZywFk1nrtVSMtkAJmuFY1W7PpDHYmryQkOtDAO3Prwu
 MbyROMBuOxPaKCgaVID445yqET8OpXh4zVHbzgAitMxLPRwPrT+kSBzXrDihiL76Gm
 ooG30tS2CqzWFOkjnv0zvNT57RBdmbhqqnggKmrxmTLtPTTbq0xAvrXhmuxPiqFIs9
 0BTbxVdLOuuCHjY6QZZUpXOZaI/hldF8n/0iSLdYujZv8NXR1hAZi5OPLeSfuLIy9a
 mkhQUk2NokuGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b7JhYoWO
Subject: [Buildroot] [PATCH next RFC 1/2] arch/arm: add Armv9-A and the
 Neoverse N2 core
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the Neoverse N2 core, which is a armv9.0a ISA.
See: [1] [2].

This CPU support was added in GCC 11. See [3].

The Neoverse N2 CPU is included in the Arm sbsa-ref platform in Qemu.
The Armv9.0-A Buildroot support will be needed to update those SBSA
related components. See the note in commit log [4].

This commit introduces the BR2_ARM_CPU_ARMV9A Kconfig symbol, which just
selects BR2_ARM_CPU_ARMV8A. This is because Armv9.0-A is a superset of
Armv8.5-A. This symbol can help package recipes to detect this new base
architecture.

Neoverse-N2 support has been added in QEmu in commit [5], first
included in v8.2.0.

This CPU supports Aarch32 only in EL0 (user-space). This means it's
technically possible to compile Aarch32 code targeting it. GCC has
the support to do so. Since Buildroot recompiles a full system (ATF,
Kernel, user-space) this support has limited value. This is why this
CPU is limited to 64bit builds only.

[1] https://developer.arm.com/Processors/Neoverse%20N2
[2] https://developer.arm.com/documentation/102099/0003/The-Neoverse-N2--core/Neoverse-N2--core-features
[3] https://gcc.gnu.org/gcc-11/changes.html
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/c58a2a9687c045379c0f768c8c6c1c1a41842a85
[5] https://gitlab.com/qemu-project/qemu/-/commit/dfff1000fef24f6686e0be5e6472613985a363dc

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit c0a5fcf with commands:

    make qemu_aarch64_sbsa_defconfig
    utils/config -k -d BR2_neoverse_n1 -e BR2_neoverse_n2
    make olddefconfig
    make

The generated toolchains targets Armv9.0-A by default:

    output/host/bin/aarch64-buildroot-linux-gnu-gcc \
        -dM -E - </dev/null | grep -E 'ARM_ARCH|SVE2'
    ...
    #define __ARM_ARCH 9
    ...
    #define __ARM_FEATURE_SVE2 1
    ...

The system can boot using the sbsa-ref machine with neoverse-n2 cpu:

    sed -i 's/neoverse-n1/neoverse-n2/g' output/images/start-qemu.sh
    output/images/start-qemu.sh

    # login as root
    cat /proc/cpuinfo

    processor       : 0
    BogoMIPS        : 2000.00
    Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 sve asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp sve2 sveaes svepmull svebitperm svesha3 svesm4 flagm2 frint svei8mm svebf16 i8mm bf16 dgh rng bti
    CPU implementer : 0x41
    CPU architecture: 8
    CPU variant     : 0x0
    CPU part        : 0xd49
    CPU revision    : 3
    ...

For comparison, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/c58a2a9687c045379c0f768c8c6c1c1a41842a85
---
 arch/Config.in.arm | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 219215d122..9e6c8661ba 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -95,6 +95,14 @@ config BR2_ARM_CPU_ARMV8A
 	bool
 	select BR2_USE_MMU
 
+# Armv9.0-A base specification is a super-set of Armv8.5-A. It is
+# fully compatible with Armv8. This symbol is defined to allow checks
+# for doing Armv9 optimization. Armv8 is also selected for
+# compatibility.
+config BR2_ARM_CPU_ARMV9A
+	bool
+	select BR2_ARM_CPU_ARMV8A
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_cortex_a53 if BR2_ARCH_IS_64
@@ -488,6 +496,14 @@ config BR2_saphira
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+
+comment "armv9.0a cores"
+config BR2_neoverse_n2
+	bool "neoverse-N2 (aka perseus)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -880,6 +896,8 @@ config BR2_GCC_TARGET_CPU
 	default "tsv110"	if BR2_tsv110
 	# armv8.4a
 	default "saphira"	if BR2_saphira
+	# armv9.0a
+	default "neoverse-n2"	if BR2_neoverse_n2
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
