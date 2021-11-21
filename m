Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0229CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975034035F;
	Sun, 21 Nov 2021 20:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSWvH-fWDSnL; Sun, 21 Nov 2021 20:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C383B40345;
	Sun, 21 Nov 2021 20:54:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 728EA1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6282880E28
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UzMY-EuDkRKm for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:54:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AEFF80E24
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:54:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 747608E01D; Sun, 21 Nov 2021 20:50:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:53:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8ec47a29cd63b5532f63a991c1ef5bc8cee653e
X-Git-Newrev: 5b115aff1a3bc906bd53ea6dbb091c9376e4f3c7
X-Patchwork-Hint: ignore
Message-Id: <20211121205011.747608E01D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_zcu106: fix
 arm-trusted-firmware build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b115aff1a3bc906bd53ea6dbb091c9376e4f3c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig uses arm-trusted-firmware version 1.5 which fails since
commit eacf7a1d0b952d8df8829b6bad9b08cd94e8bf0f ("package/gcc: switch to
gcc 10.x as the default").

Backport a patch from v2.2 to fix the build.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915296
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...erity-fix-Remove-GGC-ignore-Warray-bounds.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
new file mode 100644
index 0000000000..0c1a9ba2a4
--- /dev/null
+++ b/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
@@ -0,0 +1,68 @@
+From da003e6ada7d0217fe99dc7c649a731f8ebd3c34 Mon Sep 17 00:00:00 2001
+From: Deepika Bhavnani <deepika.bhavnani@arm.com>
+Date: Thu, 15 Aug 2019 00:56:46 +0300
+Subject: [PATCH] Coverity fix: Remove GGC ignore -Warray-bounds
+
+GCC diagnostics were added to ignore array boundaries, instead
+of ignoring GCC warning current code will check for array boundaries
+and perform and array update only for valid elements.
+
+Resolves: `CID 246574` `CID 246710` `CID 246651`
+
+Signed-off-by: Deepika Bhavnani <deepika.bhavnani@arm.com>
+Change-Id: I7530ecf7a1707351c6ee87e90cc3d33574088f57
+
+Backported from: 41af05154abe136938bcfb5f26c969933784bbef
+[Adapted to apply on 1.5]
+
+---
+ lib/psci/psci_common.c | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/lib/psci/psci_common.c b/lib/psci/psci_common.c
+index 2220a745cd6e..6282d992a2f0 100644
+--- a/lib/psci/psci_common.c
++++ b/lib/psci/psci_common.c
+@@ -188,21 +188,17 @@ static unsigned int get_power_on_target_pwrlvl(void)
+ /******************************************************************************
+  * Helper function to update the requested local power state array. This array
+  * does not store the requested state for the CPU power level. Hence an
+- * assertion is added to prevent us from accessing the wrong index.
++ * assertion is added to prevent us from accessing the CPU power level.
+  *****************************************************************************/
+ static void psci_set_req_local_pwr_state(unsigned int pwrlvl,
+ 					 unsigned int cpu_idx,
+ 					 plat_local_state_t req_pwr_state)
+ {
+-	/*
+-	 * This should never happen, we have this here to avoid
+-	 * "array subscript is above array bounds" errors in GCC.
+-	 */
+ 	assert(pwrlvl > PSCI_CPU_PWR_LVL);
+-#pragma GCC diagnostic push
+-#pragma GCC diagnostic ignored "-Warray-bounds"
+-	psci_req_local_pwr_states[pwrlvl - 1][cpu_idx] = req_pwr_state;
+-#pragma GCC diagnostic pop
++	if ((pwrlvl > PSCI_CPU_PWR_LVL) && (pwrlvl <= PLAT_MAX_PWR_LVL) &&
++			(cpu_idx < PLATFORM_CORE_COUNT)) {
++		psci_req_local_pwr_states[pwrlvl - 1U][cpu_idx] = req_pwr_state;
++	}
+ }
+ 
+ /******************************************************************************
+@@ -228,7 +224,11 @@ static plat_local_state_t *psci_get_req_local_pwr_states(unsigned int pwrlvl,
+ {
+ 	assert(pwrlvl > PSCI_CPU_PWR_LVL);
+ 
+-	return &psci_req_local_pwr_states[pwrlvl - 1][cpu_idx];
++	if ((pwrlvl > PSCI_CPU_PWR_LVL) && (pwrlvl <= PLAT_MAX_PWR_LVL) &&
++			(cpu_idx < PLATFORM_CORE_COUNT)) {
++		return &psci_req_local_pwr_states[pwrlvl - 1U][cpu_idx];
++	} else
++		return NULL;
+ }
+ 
+ /*
+-- 
+2.34.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
