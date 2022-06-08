Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C2CC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905D884268;
	Thu,  9 Jun 2022 20:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fx-UeLsp1qYG; Thu,  9 Jun 2022 20:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5F958425B;
	Thu,  9 Jun 2022 20:30:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9D241BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6BC26112B
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_kWMadCsYoX for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:30:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F3D960AE9
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4811986EB1; Thu,  9 Jun 2022 20:18:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jun 2022 11:46:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 749ec74cf9007cf8853426bf8b993f14a0bda5d8
X-Git-Newrev: c9b39a81b566f827686d41682ae29ccfdaead4ef
X-Patchwork-Hint: ignore
Message-Id: <20220609201811.4811986EB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: armeb no-MMU is not
 supported
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9b39a81b566f827686d41682ae29ccfdaead4ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elf2flt does not support ARM big-endian, so supporting Cortex M3/M4/M7
with armeb is not possibly.

Therefore this commit makes:

 - MMU mandatory on armeb
 - Prevents from seeing Cortex M3/M4/M7 on armeb

Fixes:

  http://autobuild.buildroot.net/results/9bca0cbfb6a66c455e74ad194526bca942665978/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in     | 2 +-
 arch/Config.in.arm | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 49e16fce38..da499b37ab 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -49,7 +49,7 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
-	# MMU support is set by the subarchitecture file, arch/Config.in.arm
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by ARM Holdings.
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index fa2e882550..eb71d70430 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -242,6 +242,8 @@ config BR2_pj4
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
 
+# Cortex-M cores are only supported for little endian configurations
+if BR2_arm
 comment "armv7m cores"
 config BR2_cortex_m3
 	bool "cortex-M3"
@@ -258,6 +260,7 @@ config BR2_cortex_m7
 	select BR2_ARM_CPU_MAYBE_HAS_FPV5
 	select BR2_ARM_CPU_ARMV7M
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+endif # BR2_arm
 endif # !BR2_ARCH_IS_64
 
 comment "armv8 cores"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
