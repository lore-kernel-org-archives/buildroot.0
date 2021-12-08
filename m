Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D079C43217
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A3C60F1B;
	Wed,  8 Dec 2021 08:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQ2m351VevPR; Wed,  8 Dec 2021 08:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8995360F19;
	Wed,  8 Dec 2021 08:45:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4841BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EF6C41CB0
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vQfkgdEa5so for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:45:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9349A41CAD
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E9328185A; Wed,  8 Dec 2021 08:40:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:44:52 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 95ea3836463f0c7fb2566afabeaed8a09a2fe6d8
X-Git-Newrev: 5fa69e10ace5692f9eca1d469c1c43467417dcfd
X-Patchwork-Hint: ignore
Message-Id: <20211208084047.6E9328185A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] configs/zynqmp_zcu106:
 fix arm-trusted-firmware build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fa69e10ace5692f9eca1d469c1c43467417dcfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

This defconfig uses arm-trusted-firmware version 1.5 which fails since
commit eacf7a1d0b952d8df8829b6bad9b08cd94e8bf0f ("package/gcc: switch to
gcc 10.x as the default").

Backport a patch from v2.2 to fix the build.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915296
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b115aff1a3bc906bd53ea6dbb091c9376e4f3c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
