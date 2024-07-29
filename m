Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CAEC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 11:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3373440492;
	Mon, 29 Jul 2024 11:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzXSnytMhCfC; Mon, 29 Jul 2024 11:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2761404AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2761404AA;
	Mon, 29 Jul 2024 11:57:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68E2F1BF475
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 11:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 564E24018F
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 11:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B35G-1Tf5bdH for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 11:57:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::601;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F82840364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F82840364
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F82840364
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 11:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGlo7tOBwAbSkEunfDe7J+4vLx+NyY5iwUf9XsoHtxIBd45o3rrfKxm175K6AVGQZ5RuVW0GzbZdeYH1s7e1Nbq5Dze5Sxu1P7EzrYOKjKnh76TB3cbzLFldd8f9xgr9iq/5n1mHKwqEUF8zdiEmVii10LQZ8tL6S/yi5ACT/KW+zBFuCg/sMIt4ApyzH44LRV3o4+w1mcAsB2Or8+51kPvJzV4uPxgZiZvyTepP6nTCnehQXvY6Qps3jOZM5LiqnmnYmdJuyYjQFgwG+ravip064TlELVpbhN6cw3YEYOqwxl6pRYQp4hyBs4xupfOjSCr0WIKh6H8rbd9352fLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EfD9kuqPZF/L9TBuPeEcJzt5lPMHqCTnn5hXvvci5w=;
 b=PwmeBU6eYrAq0RQ5EnEDZTfIWY8nnPdHwecBUzqLMF/Metie6PPEwIrqPf4IvO8Zfwq4jm4env67GfqGdU3LuyDWErwAX4fFAyNN20IYB+tC3C22LGLtxO+gS7/ItdetGMaH1EQQxhiPlayfFJpWxOckqS8YfeiHdGPdS+DmQl9g+5EEpw7VTmdvry/jxtbB3FUZtngaJ4WF0AwjJUs/WC7RqM+of8CSpSRluBXAulztjsukLijClxRy1p4H1LII58oXpctMimBH24u6SBDT790aitfrGuDUKcT0tFdwBNq0olrAxRdf/VtDHKzhY47UfSsMqLwEY0kn2JAVK3Q7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR12CA0002.namprd12.prod.outlook.com (2603:10b6:5:1c0::15)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 11:57:08 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com (2603:10b6:5:1c0::4)
 by DM6PR12CA0002.outlook.office365.com (2603:10b6:5:1c0::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.34 via Frontend Transport; Mon, 29 Jul 2024 11:57:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 11:57:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 06:57:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 06:57:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 06:57:02 -0500
To: <buildroot@buildroot.org>
Date: Mon, 29 Jul 2024 12:57:00 +0100
Message-ID: <20240729115700.2355352-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b68ccb2-dd08-49c3-e14f-08dcafc591ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?baUO9ccvNmdeyA78P1suy9uBxZebc4SDU2L0Au/41K1SoGRokQde/gB4RTwJ?=
 =?us-ascii?Q?8iZg4QbIGbZdIaHoZOJhuzS6PmXNTtvddxWHL7u0RlmAcvCNicmbYM14gUZD?=
 =?us-ascii?Q?wjixrg12q/En7+WqQbyQKsy5mjnQq4S6Tc2RlpnrqULGKNBkUxpH/AEFNApy?=
 =?us-ascii?Q?HjL7FtdETI+rntWmSlao18sE4nEfpbTnZp+LYfCkChERBKUKOadwkb6FuZiY?=
 =?us-ascii?Q?drzmXqiMr0fsuJaNATYEsFu4cSUxO2IoKFB9wTknZwe72udexA4K6rq3+1MM?=
 =?us-ascii?Q?pc8iAEPdui+gbGDejQDlqjvB/QU1mr5DjVOGMDsVftzPbKhkyi27A7MlZPug?=
 =?us-ascii?Q?vgpK9c/etGoLZO75S0WuxArMvwiHohCwlyq03vpL8GCHe8JuVhrtAN5AJw/X?=
 =?us-ascii?Q?HlLer66Ha+2iFDs2s3GRrdefpKSMASpQMeUZRWR6QTGom/VWGZ5UKjCR4Klh?=
 =?us-ascii?Q?La9GjEOJ6DUJgftYNCq97AU6cvOe7fQFN4/eg7nCUQEwe7/MnT24lOqAab2V?=
 =?us-ascii?Q?D/iB0srX6/pPWogfJ5VcgOFWGGtnObLBpx2HgdKq456PhKZv+AFdNbwhH5+r?=
 =?us-ascii?Q?A7qfumzlinEu+93ow3n6+d9aBSyVKqVEB/Ie2/R6Re1aX2fGgEudNIojXOU+?=
 =?us-ascii?Q?LKqOofOwP8q7/4HnYJJojGw/5ErsWZN5xvWKaOv54YSRjYfYi0Vb2zKGNPnX?=
 =?us-ascii?Q?tStqjcdZi6RWk+mauOQDlXfm1DiigP9ZPUPpqgQOSpFoGUT+9ob7vfQPbu1d?=
 =?us-ascii?Q?pr1lfV6I+0eIVbpYmhoU8Zse8RWRgMn+V1qou9dVB52srpDg5bQUuM3Y9gXi?=
 =?us-ascii?Q?S4rTjDW12U50aN4Sf/RcXZlQxe5lbyiTvqYMbjfEGo7ZrAsiCIMgI1qO0qUi?=
 =?us-ascii?Q?yWrx0depTCFz0b/QcMs8f1UDxQfQL4FsXQCyuQH7xkmukgQlLn224038NS6N?=
 =?us-ascii?Q?eDU15xU916ZbxbTb+mb4uA9vvlOShwSEC9ukr01sd7IftN61ds+CgdTniNEi?=
 =?us-ascii?Q?GNSmTs7v997sVPtM9o9NMnJvBe7sDC/r5JJNWJLm9gWTMjHf/9/t9/kN8LYV?=
 =?us-ascii?Q?RQ6oxFJa8VP6XxuXeFAnk3t5Sp18buxymNPHdCSDbSeRY9ZkmtUoYrmrFkud?=
 =?us-ascii?Q?KL+Dhz78Bar2TKSPq81tvl6U4OOqw5xFeYGzE9fvRLq4lTYhHBHjN+5hUfez?=
 =?us-ascii?Q?epaziaAM2IMcWLceku/b7R4gnil6VGsVpIPLy45Iskcd6kpj5nOHBv+JB9KW?=
 =?us-ascii?Q?1BI3y+2Oqz2q0OPkeQcHJhhi+r2Yno+O0ENlv5DW2ZmK7fZy/w6cYBM6qTGK?=
 =?us-ascii?Q?/mQCHtEunEsZo23lgxGPJqIv1avemIVi228nCqKLuBZuqSqQPZZX7nHCllfu?=
 =?us-ascii?Q?aso44WAIenmwvN0L8QD2gHltXjHJBgJQqRoXIBMQLYeDKbvwx39T9/ufpcdQ?=
 =?us-ascii?Q?vJbFo2Mz1Pr52cAdmtLntXeixxWmH7zNLUxQZDbTRYNzzKVCDihOqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 11:57:06.7928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b68ccb2-dd08-49c3-e14f-08dcafc591ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EfD9kuqPZF/L9TBuPeEcJzt5lPMHqCTnn5hXvvci5w=;
 b=V9q3JDDqGW4LtHfmZsz+/nFFhbzA3cTMEktbsy3nbNcXtdO/1N48ODc5XByxKsEo7AE90JWSdVE8BYNjUxU62kumu79QKtSdRLSPug8X78oLWEc1lzCe3udlytZeVEDe0qnzfqj0R4RHoLT4hjoUD4JXbQQwvPtre9clPzNNK/A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=V9q3JDDq
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: support future AMD
 Vivado versions
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When creating a hardware platform for AMD Versal devices with the AMD Vivado
Design Suite, the resulting XSA file has a file named "psm_fw.elf" included.
This does not match the "psmfw.elf" filename that users will get when building
the boot firmware from the Xilinx GIT repository.

A change request has been submitted to resolve this issue, so that future
AMD Vivado Design Suite versions will generate XSA files including the boot
firmware file named "psmfw.elf" to match the filename that is generated when
building the firmware.

In order to support both current and future versions of AMD Vivado Design
Suite, this patch changes the xilinx-prebuilt package to use the filename
"psm*fw.elf" when obtaining the Versal boot firmware images from a user
generated XSA file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 0b0e85b820..9f36ee7285 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -34,8 +34,11 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
-# AMD Vivado Design Suite generates a file named psm_fw.elf.
-XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm_fw.elf
+# AMD Vivado Design Suite currently generates a file named psm_fw.elf.
+# Future versions of AMD Vivado will generate a file named psmfw.elf,
+# so to support current and future AMD Vivado versions, the filename
+# psm*fw.elf is used.
+XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 XILINX_PREBUILT_PDI = $(@D)/*.pdi
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
