Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70979C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 18:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 190A041782;
	Thu,  6 Jun 2024 18:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tBl4Yt7k8tU; Thu,  6 Jun 2024 18:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1A7E41858
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1A7E41858;
	Thu,  6 Jun 2024 18:48:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03FC41BF592
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1A9A8493C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iock-zubnaLP for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 18:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC3884939
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DC3884939
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 18:48:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF6A887D15; Thu,  6 Jun 2024 18:48:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 20:45:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee12457487e139f9ea0fc05941151f55bcbbeb1b
X-Git-Newrev: 9755de93360bf84801f551fb9da17b45359e8dfa
X-Patchwork-Hint: ignore
Message-Id: <20240606184842.DF6A887D15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ti/am64x-sk/patches/linux: backport
 linux clock fix
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8890996266525495008=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8890996266525495008==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9755de93360bf84801f551fb9da17b45359e8dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With newer versions of DM or DMSC firmware (v09.02.07+) invalid clock
requests will be NAKed and generate a warning in the kernel logs rather
than being ignored like in previous versions of firmware. This, together
with the linux clk driver assuming that all clock IDs are contiguous,
can generate a significant amount of warnings during boot when many
drivers are being probed.

A fix for this has been merged into Linux (commit: ad3ac13c6ec31)
however the backport to older kernels was missed which unfortunately
affects the current v6.8 kernel.

Manually backport this fix while we're using the v6.8 kernel

Signed-off-by: Bryan Brattlof <bb@ti.com>
Tested-by: Gero Schwäricke <gero.schwaericke@grandcentrix.net>
[Arnout: add Upstream tag]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch b/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
new file mode 100644
index 0000000000..788b6439d8
--- /dev/null
+++ b/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
@@ -0,0 +1,75 @@
+From 750cdf4cb6791c45d479ed73a97728100394fb32 Mon Sep 17 00:00:00 2001
+From: Udit Kumar <u-kumar1@ti.com>
+Date: Tue, 13 Feb 2024 13:56:40 +0530
+Subject: [PATCH] clk: keystone: sci-clk: Adding support for non contiguous
+ clocks
+X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=bb@ti.com;
+ h=from:subject; bh=CKSvD6FpqwRzx8blynhoCEc3XUR5TlwjFJdcgjQwpgg=;
+ b=owNCWmg5MUFZJlNZHYzOLwAAZP/////7puP/r7v/9q9s+8t7wa8/97UZO//d+XvPsvfv2/+wA
+ RsYHaQAAAAAAAAGg09IPUGmgAaAANBoAAAGmnqAPU9Q0DQ0HqMQDQ8ptTeqeogaABoPU0NAPUAA
+ 0GgDJ6gANAAMg0GmgNGgDEGh6jR6h6hp6mgepoPU2oDTIGho0IaHqA00yDQNBoGTRoDTRkAZNAD
+ AmTIBkGjIGmQyAZDRkAaANAYIxBk0DQAAHODcFn1CAGBsJeG8ZtU3FQCBdLH7LjDIouHeAszY1j
+ AFkqjaWIFXEVi8NV3giRplb1JjCYunXimTaK06SgQRYsUGRSbKOVQP2t1LlAYS93QjOMWF6CHXK
+ 69KzHyBDpXR2mHAAkHcHX0X3SAYJkxPElwJ1ZnHK1RfDKRfJcRQKzxnryM+4x2mCxpIFIIjpVLk
+ nItd1Vl1SEF2QiWZIYV4b0lawcUqLGgTQZ0+qpJ5QORYrvPXE4DR89JlJYBU4DjxAoyACH6KN0o
+ AiaknqZTfMwmF8iREpU4SgDEVun3X3OFlkBp3hBO+Ynb12GJoLSFBSz9IWE2ooLKFalh5XJMZfl
+ +GthEEOnlrMQHOF8qCr+JAKqXEqSrwLGuEIMFbnGEjJYruo4ENGOmGVlkvW+kLRp5ibCXAAcDMM
+ TPOUZ/i7kinChIDsZnF4A==
+X-Developer-Key: i=bb@ti.com; a=openpgp;
+ fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
+
+Most of clocks and their parents are defined in contiguous range,
+But in few cases, there is gap in clock numbers[0].
+Driver assumes clocks to be in contiguous range, and add their clock
+ids incrementally.
+
+New firmware started returning error while calling get_freq and is_on
+API for non-available clock ids.
+
+In this fix, driver checks and adds only valid clock ids.
+
+[0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j7200/clocks.html
+Section Clocks for NAVSS0_CPTS_0 Device, clock id 12-15 not present.
+
+Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
+Signed-off-by: Udit Kumar <u-kumar1@ti.com>
+Reviewed-by: Nishanth Menon <nm@ti.com>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ad3ac13c6ec318b43e769cc9ffde67528e58e555
+Signed-off-by: Bryan Brattlof <bb@ti.com>
+---
+ drivers/clk/keystone/sci-clk.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
+index 35fe197dd303c..eb2ef44869b23 100644
+--- a/drivers/clk/keystone/sci-clk.c
++++ b/drivers/clk/keystone/sci-clk.c
+@@ -516,6 +516,7 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
+ 	struct sci_clk *sci_clk, *prev;
+ 	int num_clks = 0;
+ 	int num_parents;
++	bool state;
+ 	int clk_id;
+ 	const char * const clk_names[] = {
+ 		"clocks", "assigned-clocks", "assigned-clock-parents", NULL
+@@ -586,6 +587,15 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
+ 				clk_id = args.args[1] + 1;
+ 
+ 				while (num_parents--) {
++					/* Check if this clock id is valid */
++					ret = provider->ops->is_auto(provider->sci,
++						sci_clk->dev_id, clk_id, &state);
++
++					if (ret) {
++						clk_id++;
++						continue;
++					}
++
+ 					sci_clk = devm_kzalloc(dev,
+ 							       sizeof(*sci_clk),
+ 							       GFP_KERNEL);
+
+base-commit: 9fbb5fcb41e7e96fb8769a9f5a12a35a984c23bd
+-- 
+2.43.2
+

--===============8890996266525495008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8890996266525495008==--
