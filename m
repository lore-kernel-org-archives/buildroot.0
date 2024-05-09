Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E12C25B4F
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B594416C3;
	Thu,  9 May 2024 14:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgYqP6Api3D7; Thu,  9 May 2024 14:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FFB541706
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FFB541706;
	Thu,  9 May 2024 14:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB8A81BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C936C60687
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pt0RlRXQb230 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7251C60682
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7251C60682
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7251C60682
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:49:34 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 449EnUbY102251;
 Thu, 9 May 2024 09:49:30 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 449EnUhj022675
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 9 May 2024 09:49:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 May 2024 09:49:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 May 2024 09:49:29 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 449EnUYF126228;
 Thu, 9 May 2024 09:49:30 -0500
Date: Thu, 9 May 2024 09:49:28 -0500
MIME-Version: 1.0
Message-ID: <20240508-clk-fix-backport-v1-2-92b8e66fcac7@ti.com>
References: <20240508-clk-fix-backport-v1-0-92b8e66fcac7@ti.com>
In-Reply-To: <20240508-clk-fix-backport-v1-0-92b8e66fcac7@ti.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4345; i=bb@ti.com;
 h=from:subject:message-id; bh=2EO0th0se4pr+cWf19OFeKavDQhqDXHP1BKfuq4SaN0=;
 b=owNCWmg5MUFZJlNZHb6B1gAAZ3///v//b7/8/r/WG/f/dzT6/unyV/f129/hX93fz7x/+vWwA
 RtqB2oAZANA0AAA0AaA0AAADQDQGhpkGgAADQDQDRkA0D0QNHkIeppmp7VEGgGhiAyAyDTIZNAB
 oDIA0MgyNNADIyGgNMgyANHqPU0GgGg0ZAaaBiaPSAB0HqAaDEBoGmJiAGQABoyaZqYJ6gAAYgB
 kZDEDQADQZNMmg0GQ0AANAAALJ3P3zneAPbxoiB5PB2SDqFjawQT0/iAyTwsW3MGqW+BswQZ2X8
 yELMi+rsBDN6lVNLUwM78i7eFoAJ6uRrfUlaXIGxarv33WHhEzl1A6/pV1aiDMStPUsePM1uxEi
 J9ZkkRDT++hGXM86gijasn054vztEmE4ZD5zp+LIgb2/8VnlAf3mc+qVCqhu2voUO149GuoTGwi
 gCXR1GhXJauoOUZwXD7+gcC8bgt5yxtNTdC9k3uhOmO0WR5tT9DeA6frwoS4sBCE34nNdV3u0xD
 f4z5sVwQd3Z07xQucmWDWCDDEpFCv+Wie6kX7QfBWqIUEWvvqnSx0ObmkYpjhTpWo61nwLaT1As
 eGVKOEXla9nRhC/cc6lonTMjcNosHzxhii8F2F7EroEdGJDz8Vrkw5pekEPIpxd8SaTlKDqgBAT
 KXcGhlAKmP8XckU4UJAdvoHWA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1715266170;
 bh=4/Yt9CcT98IxCxgf9SxM/KWCLNEeLUJGYSo8ndU5Kig=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=zAc1iF1fGb433wJkT6jrw9fjwDz2x8oJyNzODLqHjpo503KboFDslfoHW5HdqZgxK
 Rj3APRU4V/6Dt/qpgo4hn8xGcLzghsW7f5lkOFPi0TTzx0RcUSjG4+ztHzLFSik+Ae
 7sh5iWuTObHFR7Q6bOVBn1Q+P41z0hDggmn9/A5U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=zAc1iF1f
Subject: [Buildroot] [PATCH 2/2] board/ti/am62x-sk/patches/linux: backport
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With newer versions of DM or DMSC firmware (>v09.02.07) invalid clock
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
---
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/board/ti/am62x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch b/board/ti/am62x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
new file mode 100644
index 0000000000000..bb2babf6aba0a
--- /dev/null
+++ b/board/ti/am62x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
@@ -0,0 +1,74 @@
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

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
