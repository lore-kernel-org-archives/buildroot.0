Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990C7C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 14:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663F060E57;
	Tue, 17 Jun 2025 14:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TznM4z5Euukl; Tue, 17 Jun 2025 14:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 811BF60DF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 811BF60DF1;
	Tue, 17 Jun 2025 14:16:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C3F9151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 14:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 796C982174
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 14:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HC7WCxODmVZB for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 14:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::618;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF5DC8216A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF5DC8216A
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::618])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF5DC8216A
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 14:16:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqB/wOiCEGKloQGaByuce00ei67AMaj5arT/PHVH3eiP0/QYUnzgRZnF+wuA6Fw/coMSpLzPvz2vYh5SeFDVAuciSU9VTNfK1y13RqcV9eyYguYX7UqKaVp/Ln9sQ4oiRf9Vj9nbaXBG3PpYpagvzJSXZUt5bagFv9j2OP1tDYM7FaZEnAyPTEETPXg18CfqtEAQChM7YD2mEhU0qV8b9tv2XyEApj56BjkHZER2ZUHaJ55Nzx/7uyaiO4MV1uQrJc7e2PWcxSq+RFjO/ypVXVAzh+iHgPufBW8eCd4PdVpNLnBqHACn9Dn3TD9Iy4DWcnB4jMDhGolMJk0iSHINuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rwDDkcXFr13Kl/3M5FZn1JISaR3gC+wEe+tbYEfqpo=;
 b=cVYME2VYRni6p99XQeZXuiHAVYH4NbTkKA1hQmC0myReHuqIe2K/TzLlkRlEoS0h8wwQBnXh8BMQuyKY+dtzNfrr0amY9/8dFxaBYbA3DxLSpLZkX/qNItGANOYjEuj366dlbQrqF0T/WXOvrni+Y3ohInMVp+ePfjDtrV1xKGbw+7D3aHa5ajHSDJ00KCUrolH3ZnCMkUPNJqKH4kZ7XA9vBa2i05MOHIPESm+k7MrpsQOKr/uXEplgRZ+SuZKxUSgvSDbIwCQMSxBKK/zRqju+f2LxxXTK/2TxF883M+6ewHFfl8nLl/Az5LZUlbHNW7QwGtpt1FSsFAHXKgIKYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR03CA0008.namprd03.prod.outlook.com (2603:10b6:a03:1e0::18)
 by PH7PR12MB8107.namprd12.prod.outlook.com (2603:10b6:510:2bb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 14:15:56 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::8c) by BY5PR03CA0008.outlook.office365.com
 (2603:10b6:a03:1e0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 14:15:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 14:15:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 09:15:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 09:15:43 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 09:15:41 -0500
To: <buildroot@buildroot.org>
Date: Tue, 17 Jun 2025 15:15:34 +0100
Message-ID: <20250617141534.2074877-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250617141534.2074877-1-neal.frager@amd.com>
References: <20250617141534.2074877-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|PH7PR12MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f611c7-8550-4e39-450e-08ddada97972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ZFOdXdLUqu/sAw/uabvsnLFfmqUgaek0KZNs0LRzO2BiZ5LOTKAVPEoLqh9?=
 =?us-ascii?Q?AaSiqv8er/tZ67Nc8iLGLL3zxXCwaC1TeQ980ooOFBoB6HLeVuTZD7QSPTOV?=
 =?us-ascii?Q?7R8RsB6V9yk8Z2WUjFFIJ0qMoPu8EL+7uNByLmFSaMaiXjmj3yeNsMO5D+pK?=
 =?us-ascii?Q?TZcsk6WVRbREy17Ml43+6+B1RQgaE8Xr6/SIfWvT6Wd9TuKaLNlnJYVpa5KW?=
 =?us-ascii?Q?bn3TJXM/Bjhzkt5rgqwTSUXdHBDxAtTJC+srLZ0tI0E7L5RK1vIAwMwdtPw9?=
 =?us-ascii?Q?rxlfcqaDc2KE3FUwkKDD9opALvaYRCW7/bj47W1LLr4KL48YsCWIcmVFyfqM?=
 =?us-ascii?Q?0vmkF50+TdFRGeaFiThgx8tbJu+V+S+61wGEcdwegcJFUMk4nQqR4Kepp5cW?=
 =?us-ascii?Q?+ddAYtWPPh6pLANks5Z3zizKRSOfOOKg9PvRcuwDigMiy3uSYv017WisKIey?=
 =?us-ascii?Q?YrPkL5RHxgQ/iRhfEJPOD8T8EhyervMvzDYq5EyBt5Nx7okvPvy782e0Q2Tr?=
 =?us-ascii?Q?qRhuytwPCe8ldNsY3NxltYxQMD4e8Di8oGyI2O6p+Y0hy3GN/3POzHznsroP?=
 =?us-ascii?Q?Sqksp0SrB/ATh+7SF/zwr8MowhtdGjSs1SDerNtq8F0+rAMUyuEV0cPTDB9u?=
 =?us-ascii?Q?plpD9ohI8WKK6XKqDbncALIbQP6r8OKBlYZSKgsFwnjR6Z1X371BeXM40fcm?=
 =?us-ascii?Q?1aD6y1Q/ogKg7oQAbFVSHChHCHvCmbkCDE7J7Od9dZX9Mh9thSx09/IwxK8e?=
 =?us-ascii?Q?bbXf6UkoXpEN0n6R/edMYn1vsv42/HLludDmGSDmjEfQYkHYwALqDsROMydO?=
 =?us-ascii?Q?E7pTPzuYuiDdlrler+Ckst7P5L0kAW/FsVLf8EcENnrsPnKSCsVofzt+uFeU?=
 =?us-ascii?Q?R+kP1hbYPqsvy9EB2ASajtDAlronV2KoFDLpl9UncaoPnYb5Vngf5dKNDpBD?=
 =?us-ascii?Q?8CUeOF28npcY6DHEUoXfIcYkjrTuS2micZ3SUGnHYFyyM+NoUBa41pwQYt1G?=
 =?us-ascii?Q?SpyvmZ7ZevX4PyZgE47MHBMic378lcd/T8whO3yIZ1xCu7t7BjzQdlInwEzK?=
 =?us-ascii?Q?hyDpzwIGwGlfF8labLBPtJWI+isDsi9nLGNHuYoZwk/IU2+qmHEpUTNSwvW6?=
 =?us-ascii?Q?uaANXtMFRDaxiWsCYsUIXCMD3isHTrHR23fPPE1IF2CQ2KNPIHvhNkWw7AR4?=
 =?us-ascii?Q?rMXo+8m9RKr5yFR+dIJCDEhF47LIDe4l/1ZX13yyESiv8yuQldDGZ2CtWH9M?=
 =?us-ascii?Q?n/OMV04DIMZZ5njjwxflcxBo68AeL15aRrYzttptFNWjl19Fosp05nenZbos?=
 =?us-ascii?Q?gx3Yr3tT3lnFIaRmluOHQE2z5qLApsUNQ3hE2sobk5bBroK5Rc63VvKyEQvL?=
 =?us-ascii?Q?uoZwyY9UkC/3QbhGv7qbIgYxXf8qO2rvh8eGKtV+7CW3BkuNH5fyVtkn3JXE?=
 =?us-ascii?Q?R8a1sx06bimhQsySY5S/lhTPo690bmOBR062QQd/gbyw/s0CklJ6MCwWqf+t?=
 =?us-ascii?Q?gmzT7/dVczQx5OR3qtqNitHP2xYFQAAR5zhvu/8xxD2PaCx9G4eAHb+hDV6i?=
 =?us-ascii?Q?2TByZh5mYowjBJyf/so=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:15:55.3733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f611c7-8550-4e39-450e-08ddada97972
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rwDDkcXFr13Kl/3M5FZn1JISaR3gC+wEe+tbYEfqpo=;
 b=nOMwUJoegMPpEEisHK6cA5NxQh0LVe3Mvaezcx4p6pMh3cxAsq8qnZEJI1MO7p2hWS7UsZhYSPvFwx6i1wk09k6+F6LV3hod2TN9bijU9ew5FpvdV4rLptwvIhOGUFod/vLDpq0Uprx9jxwSviWyC6fu1HfEFerKSaIJaxTD4Zg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nOMwUJoe
Subject: [Buildroot] [PATCH v2 2/2] board/zynqmp: add custom board
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
V1->V2:
- correct copy paste error as the output directory of step 3 should be:
    output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/
  and not:
    output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
---
 board/zynqmp/readme.txt | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index 3f1b3a80c2..a98ff78f6f 100644
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
+   output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/
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
