Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7CAC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4415F81D5F;
	Wed,  5 Feb 2025 10:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2Em04yRuO26; Wed,  5 Feb 2025 10:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CBE48381F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CBE48381F;
	Wed,  5 Feb 2025 10:44:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 897C512F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CBCC60663
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blKyUZIobIK5 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3DEA60598
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3DEA60598
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:44:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E202D86E1B; Wed,  5 Feb 2025 10:44:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 11:43:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9845bd4541cb03e97e577281f3c64f00c6ead881
X-Git-Newrev: c39f677e6a7142394bb2713181bca69b768e9f9e
X-Patchwork-Hint: ignore
Message-Id: <20250205104418.E202D86E1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/arm: add the Cortex-A710 core
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c39f677e6a7142394bb2713181bca69b768e9f9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the Cortex-A710 core, which is an implementation of
the armv9.0a ISA. See: [1] [2].

This CPU support was added in GCC 12. See [3] [4].

Cortex-A710 support has been added in QEmu in commit [5], first
included in v8.2.0.

This CPU supports Aarch32 only in EL0 (user-space). This means it's
technically possible to compile Aarch32 code targeting. GCC has the
support to do so. Since Buildroot recompiles a full system (ATF,
Kernel, user-space) this support has limited value. This is why this
CPU is limited  to 64bit builds only.

[1] https://developer.arm.com/Processors/Cortex-A710
[2] https://developer.arm.com/documentation/101800/0201/The-Cortex-A710--core/Cortex-A710--core-features
[3] https://gcc.gnu.org/gcc-12/changes.html
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-12.1.0#l163
[5] https://gitlab.com/qemu-project/qemu/-/commit/e3d45c0a895764203f489184d361fe4c74b2cd57

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 68b4dfea26..546ba8070e 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -506,6 +506,12 @@ config BR2_saphira
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 
 comment "armv9.0a cores"
+config BR2_cortex_a710
+	bool "Cortex-A710 (aka matterhorn)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 config BR2_neoverse_n2
 	bool "neoverse-N2 (aka perseus)"
 	depends on BR2_ARCH_IS_64
@@ -906,6 +912,7 @@ config BR2_GCC_TARGET_CPU
 	# armv8.4a
 	default "saphira"	if BR2_saphira
 	# armv9.0a
+	default "cortex-a710"	if BR2_cortex_a710
 	default "neoverse-n2"	if BR2_neoverse_n2
 
 config BR2_GCC_TARGET_ABI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
