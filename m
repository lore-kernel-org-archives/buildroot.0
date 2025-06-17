Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E005CC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 11:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EC38820A0;
	Tue, 17 Jun 2025 11:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auXeG-AsEHrD; Tue, 17 Jun 2025 11:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8192A8207F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8192A8207F;
	Tue, 17 Jun 2025 11:50:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E960B16B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 11:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC9E403CF
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 11:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDnwYEJFqQkk for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 11:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::61d;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31EE1403CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31EE1403CB
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::61d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31EE1403CB
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 11:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGrHjbdkYRzBZSIOCaZtEfJRKTOjGfSKSMmdziKXnQCLth9FmNbhMCTgxX4mWYn0zGMrHAooXHCPATziRV6mZ8LZOSZ6+pTUWE2yDn9YSfuz/1du/U8jzI1fAOAFvZPR5+kEg1sGhjwY0su7NZu6iN0Rvmikzeib5CeJwzKl2X/oZo7PwcYdKEawMq0nZmqNu3WuzUPUbqyqVzOV9XmVSCyS0onoeVLC8ICJokwkqfS5dVYmVW9QTzMTY0Hw1e1ygFXbc0lHI+GWmFszHg5qMuFW0Kr/qw/NYGpsZpxk3gFy4gKf1ba/a22G4dIFjxuyGk5YXt3aSZ+V1DEukUQfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fW62jCOMAgJUlyLie78Y3Pr4aISAtNhKoWR1pz/7hhk=;
 b=P33J3pzPb5eih5XHHXQgqtax2Du5OdXtxqsbzZTJJwKksDBiyzFcDAQG0ZNMOi12d6MQvPrvKTenmBjjbGrNalil+pHXQ5RuijNaqC7pFiRYL9I0DkiJ892lUDM+KpTCZJwQL3nGPPOlZKD8GtwOrSz1I+9G6Wvbips+x2gX04xKqgdXpuny5xPSrA0U55boYhOyg84Cb8L7h3zA3AEk7xrQDc6JSgBOncdFUAnWG4LcznLu13og3PkPV0SGjwSW4TTcosAu36TtVF9gcpKYI/M7Q3tXXPCdfaBwLKLIdny88YinxJXijCfQHNuQW1RJflHYsAZ8sxp91TU1cS2Pnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR03CA0267.namprd03.prod.outlook.com (2603:10b6:5:3b3::32)
 by SN7PR12MB7105.namprd12.prod.outlook.com (2603:10b6:806:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Tue, 17 Jun
 2025 11:50:16 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::73) by DS7PR03CA0267.outlook.office365.com
 (2603:10b6:5:3b3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 11:50:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 11:50:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:50:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:50:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 06:50:05 -0500
To: <buildroot@buildroot.org>
Date: Tue, 17 Jun 2025 12:50:00 +0100
Message-ID: <20250617115000.2001160-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250617115000.2001160-1-neal.frager@amd.com>
References: <20250617115000.2001160-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|SN7PR12MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df83de6-8f4c-4f82-1b2d-08ddad952039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P22kVklBSrddONuxE7H2qDV0GHszjJWroA7jYTFcWl6JcF9ksajDPelmklJV?=
 =?us-ascii?Q?hvNIjxRR/UDUmHe4zg6Ux3C4DB7D5vSwrJ2MsaVu8iOluWdhlHfutL/LyHo1?=
 =?us-ascii?Q?mATB7BXWLPNF4mW5cfbshqMMhSWzzZOoo5X7IGI5KXEDk0f30RHhngT99VFi?=
 =?us-ascii?Q?x0eeDn5tWy7sueOAO8/O8qRBdrFba2m1Wc2r3yAM4ew/D1D9A1gOeG8VGSS2?=
 =?us-ascii?Q?sW8QZWQhJzMGUfr7iOPDctUWIm9cVHx087jPEFv2IiB95FKZ0alWqi2xZeXS?=
 =?us-ascii?Q?IKPZ7MoWSBC5ZKO8AhZi6Ig036uYdmVz8nvNudzFc+6KGz2kRQ2q8glwBBhb?=
 =?us-ascii?Q?TAq/tUfHGNXQBnHWlCmxaPkUTss5Yr0ojYMqz3prgqRRocL9rI7n9onVKPFR?=
 =?us-ascii?Q?e62Z8TAt4xz6RzFcJpln/sdoscuptOJQfAJbh17gqnhpgcayBm8owE4RZP5C?=
 =?us-ascii?Q?b8g/g82xfMftzD0WRahzXDQ1+pm7HpQnqLzLTZL7LL4DdFCXoK1le1orNefm?=
 =?us-ascii?Q?zLP/WHcw1IXEgWvpvyTwE8EW0gO+0LZjD9m65D+S2O4T3Wq4qW3VTydk7dNp?=
 =?us-ascii?Q?nnLNhcP1oQaFxw8AiT4cyytPxCYuSsJUN6btFuHdFS7v1q74oN4rs2dNpNvO?=
 =?us-ascii?Q?wWO4iYQCs6VeePYCAh7R5aBsmglh+LoU97HZWrgv+xIEt4w7azzUVGYsyb+k?=
 =?us-ascii?Q?DRQMgM0ZBjo/JVtIa661kYWf4RNKi5yqftm9cbmqT5xKcuCMSaAKyfJCx1pw?=
 =?us-ascii?Q?2JS9SGCkLYEUe4C9sOCg5NqoGNi/hoViDQzfVq5rdU6B30/PMSR/mmyns1Xd?=
 =?us-ascii?Q?LQ7yd7hgaysPka+5O/nyBYD8c9aK25XGYYc/mAsJQ4wYBhZgaH9MNPGn96/z?=
 =?us-ascii?Q?UKpA0ozMt2We31DMSrng1NmY+hDF72PeMTmP3f8VLNS8NWlVIbs2AhPuHBk7?=
 =?us-ascii?Q?Y0IiHWpDIQTS9t6kJrMZxkcHyUR/wM6Javdx22JT3WxEXVhR8G5btzxRt4oo?=
 =?us-ascii?Q?N2MMylly4KWnpuQ4DYDvuJCtCqtdVHpYl5T89QQGrOcqx/loPmEthMCEBc8u?=
 =?us-ascii?Q?uIXB8mtq/eIELU7XacdxCsX0n2Ls7w31OTNZLN5Cunvn4oUV27mC1/I2igji?=
 =?us-ascii?Q?LVhjtizIdQL8atb7K5IZY72ktj44whgsh/yQ5bGlt0JMfJVFWI0ctPOaDtjc?=
 =?us-ascii?Q?vrZGWIhm0FuNKjZ+UBwYVYipM4e255m1KSTTczHvIF3I8YlwLC/JCuT4VIHG?=
 =?us-ascii?Q?6rp1mjKUrgyaX8P07Dail0/jZUA5sBQah2ArlMcEzbYjqTGnMe/ZkTwJJxJF?=
 =?us-ascii?Q?IsVpjyyrW6ch/IW2FV0ViQq4UYvH2bUZAEUrVLw86R0o6TDJqQVK9X578pAm?=
 =?us-ascii?Q?rKrqv3T4ZJz3Cw7qtU+MEYY4KCgJbQ4tjSV2gu4yTpXV72TjbhIZ1rsoatPE?=
 =?us-ascii?Q?er8TIeuSEKQs0ekINilnzT0cw4lj5tCrsaudnVsN2KlOS0JoA3Ql8nQRtJj/?=
 =?us-ascii?Q?zu5tpTRRdFlYDpmPUr7Hy/R7N+puC17QsTemZNWSVUw9F14NDQBSlNwjbxNn?=
 =?us-ascii?Q?4+26yNz1iTGKLutH8Mk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:50:15.7936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df83de6-8f4c-4f82-1b2d-08ddad952039
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7105
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fW62jCOMAgJUlyLie78Y3Pr4aISAtNhKoWR1pz/7hhk=;
 b=eTMsvdKKURforCZ+Qa4S/lBsceADxqFhlLW55PmmrZwUlfX0KOABdyss0HaotQoCiliZvY0qXRWSdIqLhM4jxAP1xrUTtt8VRvNpz1y1+PKrmyZhyOjTbUK6R/2xruTMuh2HNo88LBNUey+/cG1cn7LVs2TOHwwdq2cgkBRoGNc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eTMsvdKK
Subject: [Buildroot] [PATCH v1 2/2] board/zynqmp: add custom board
 documentation
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The readme.txt file for zynqmp boards does not have documentation for working
with custom boards.  This patch adds documentation for custom board support.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/readme.txt | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index 3f1b3a80c2..882741b2e7 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -65,6 +65,47 @@ Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
 
+Support for other boards:
+=========================
+
+If you want to build a system for other boards based on the same SoC, and the
+board is already supported by the upstream kernel and U-Boot, you simply need
+to change the following Buildroot options:
+
+ - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
+ - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
+
+Custom psu_init_gpl.c/h support:
+
+To generate a working boot.bin image, psu_init_gpl.c/h are required in
+the U-Boot source tree. Without those files, boot.bin will be built
+successfully but it will not be functional at all. Those files are
+output from the Xilinx tools, but for convenience, U-Boot includes the
+default psu_init_gpl.c/h of popular boards. Those files may need to be
+updated for any programmable logic or DDR customizations which impact
+psu_init (clock/pin setup & mapping/AXI bridge setup/etc). See
+board/xilinx/zynqmp/ directory of U-Boot for natively supported psu_init
+files. If the psu_init files for your board are not found in U-Boot,
+you need to add them by yourself.
+
+1) Start with a defconfig supported by Buildroot (e.g. ZCU106)
+    make zynqmp_zcu106_defconfig
+
+2) make uboot-menuconfig
+    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
+
+    ARM architecture  --->
+       [*] Zynq/ZynqMP PS init file(s) location
+
+3) Copy psu_init_gpl.c/h generated by the Xilinx Vivado tools into
+   output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
+
+4) make
+
+Note: The files in step 3 will need to be re-copied after cleaning the
+output directory and at this time, there is no way to save them as
+part of the buildroot configuration, except as a U-Boot patch.
+
 ==============
 Important Note
 ==============
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
