Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AD8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 09:38:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24249611BF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 09:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24249611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC07403B3;
	Thu, 18 Nov 2021 09:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZeYp_NLoWye; Thu, 18 Nov 2021 09:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288A140361;
	Thu, 18 Nov 2021 09:38:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9A811BF484
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 09:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6B8180B52
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 09:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKjyxaWGeX9B for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 09:38:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8335A80B2D
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 09:38:35 +0000 (UTC)
Received: from [79.2.93.196] (port=35746 helo=pc-ceresoli.dev.aim)
 by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1mndsH-000DzL-93; Thu, 18 Nov 2021 10:38:33 +0100
From: Luca Ceresoli <luca@lucaceresoli.net>
To: buildroot@buildroot.org
Date: Thu, 18 Nov 2021 10:38:13 +0100
Message-Id: <20211118093813.474-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [Buildroot] [PATCH] configs/zynqmp_zcu106_defconfig: fix
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig uses arm-trusted-firmware version 1.5 which fails since
commit eacf7a1d0b952d8df8829b6bad9b08cd94e8bf0f ("package/gcc: switch to
gcc 10.x as the default").

Backport a patch from v2.2 to fix the build.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915296
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 ...-fix-Remove-GGC-ignore-Warray-bounds.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch

diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
new file mode 100644
index 000000000000..0c1a9ba2a4c8
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
-- 
2.34.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
