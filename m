Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9C2C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0319E41514;
	Sun, 19 Jun 2022 13:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0319E41514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDhTBg1JtHQ1; Sun, 19 Jun 2022 13:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C405410E1;
	Sun, 19 Jun 2022 13:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C405410E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC9CC1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5582405A8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5582405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7n84lnj-KcI for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:04:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12EB84012F
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12EB84012F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 20B318717B; Sun, 19 Jun 2022 12:52:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 14:59:15 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fb3c633cf24188b2300426201d1fe5578ebbf972
X-Git-Newrev: f522e99e2774fb47625a0c4033f103d81b0110a4
X-Patchwork-Hint: ignore
Message-Id: <20220619125204.20B318717B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] arch/Config.in: armeb
 no-MMU is not supported
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f522e99e2774fb47625a0c4033f103d81b0110a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

elf2flt does not support ARM big-endian, so supporting Cortex M3/M4/M7
with armeb is not possibly.

Therefore this commit makes:

 - MMU mandatory on armeb
 - Prevents from seeing Cortex M3/M4/M7 on armeb

Fixes:

  http://autobuild.buildroot.net/results/9bca0cbfb6a66c455e74ad194526bca942665978/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c9b39a81b566f827686d41682ae29ccfdaead4ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in     | 2 +-
 arch/Config.in.arm | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 1ea4e21413..1665009a62 100644
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
index 85040ac89f..657923f14b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -259,6 +259,8 @@ config BR2_pj4
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 
+# Cortex-M cores are only supported for little endian configurations
+if BR2_arm
 comment "armv7m cores"
 config BR2_cortex_m3
 	bool "cortex-M3"
@@ -275,6 +277,7 @@ config BR2_cortex_m7
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
