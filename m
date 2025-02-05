Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8A6C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E62134089C;
	Wed,  5 Feb 2025 10:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEi35z4eiwEf; Wed,  5 Feb 2025 10:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65AD840715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65AD840715;
	Wed,  5 Feb 2025 10:44:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C3BB12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33B934071B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyngjXlyIl0f for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E90B240245
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E90B240245
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:44:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D472F86E1A; Wed,  5 Feb 2025 10:44:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 11:43:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 824c660c7540bdfd969dbb260c094bdc0508e2fa
X-Git-Newrev: 9845bd4541cb03e97e577281f3c64f00c6ead881
X-Patchwork-Hint: ignore
Message-Id: <20250205104418.D472F86E1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/arm: add Armv9-A and the Neoverse N2
 core
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

commit: https://git.buildroot.net/buildroot/commit/?id=9845bd4541cb03e97e577281f3c64f00c6ead881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the Neoverse N2 core, which is an implementation of
the armv9.0a ISA. See: [1] [2].

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a11d581c43..68b4dfea26 100644
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
@@ -496,6 +504,14 @@ config BR2_saphira
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
@@ -889,6 +905,8 @@ config BR2_GCC_TARGET_CPU
 	default "tsv110"	if BR2_tsv110
 	# armv8.4a
 	default "saphira"	if BR2_saphira
+	# armv9.0a
+	default "neoverse-n2"	if BR2_neoverse_n2
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
