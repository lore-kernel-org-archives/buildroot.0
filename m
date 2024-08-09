Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF785C52D71
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 09:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC0340747;
	Fri,  9 Aug 2024 09:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjXrkEAp23_d; Fri,  9 Aug 2024 09:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B72408C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B72408C5;
	Fri,  9 Aug 2024 09:42:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4F41BF2F6
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 09:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31393408C5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 09:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYD9Z0aoSaX0 for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 09:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::600;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA0EF40747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA0EF40747
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA0EF40747
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 09:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tci6pl3KJS3lha0r4AaxBTSIJM6hVtGkCQXvIMFGbHel8w90wOj2MeTc8sCc28/gzjH/kiPzayXsCFovKenPc0b8MtI7fE2UH/U/COLudLXevPI/p9sQhuM37qYzUthfGtw92tR1SV4hEiQByqgaPwYGBx6EpqJ+iOJ+tjkbrSHuYUMKDXiMCd5PNYwS6MyzqqM3FtDK/gsmpmD7MQONfB3tIp0EOv0B+k723tE9opDbhs+G0nsIEq1sRk0e3WyXFSOugH4bWchs57HFylmU5JSUC+6lQigOwvxPIn3hm9tlWhNFoaoQkCPvU1b9pQGWGRlpRu5mV6aRoJrOXdzZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MncwTux83Gz5crLsf0LwfYQlfqNdggU/s2DoOvviXg=;
 b=H7cQQ7/1y1rzSFbE6Qr6OKvS5nts8QChDPUbawTFAn4BMyx/fJg/tHM3pcfK8CnaM5hDHdjZqgkYgcDex1DOxpO/x4t9b9M2M7ze7HvTRZDZMXS3GnU4Ug/hM3HllLP4p1SNTWgCu1s8JlfpeSkKL+/dTh9ionCkp01UfXGSvmUImBYL4FTnHQZsY3yEEVN8b5qtL8wSQA1tJyCpadK+bwPFJXWl33jiTn2L3D165lRRd7sdf/JIAEGQl8PdxwlDgdK7h0Wi8HgKthK+jh9Zve3maQZbt0H0Tu9HIVj5OmG/2BRe5RvKap8tKGQ4gaxyxFyTJ1dA329vN1oXl5kqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0180.namprd03.prod.outlook.com (2603:10b6:408:f4::35)
 by IA1PR12MB7757.namprd12.prod.outlook.com (2603:10b6:208:422::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Fri, 9 Aug
 2024 09:42:09 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::f5) by BN9PR03CA0180.outlook.office365.com
 (2603:10b6:408:f4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30 via Frontend
 Transport; Fri, 9 Aug 2024 09:42:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 09:42:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 04:42:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 04:42:05 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 9 Aug 2024 04:42:04 -0500
To: <buildroot@buildroot.org>
Date: Fri, 9 Aug 2024 10:42:02 +0100
Message-ID: <20240809094202.3501742-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|IA1PR12MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e078d47-3ecc-4dfc-6d18-08dcb85788e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gbL/YE6c1ax5bND9DamXjYDC67gwrIFhYBXALVEMimbQzmMlbD7kLIV9QRPh?=
 =?us-ascii?Q?Zr8VOaZ8sEqFWPHUAXt6Cp2otMqhHg33tbZb5kNky3C4djwqhUlxyrbw47dY?=
 =?us-ascii?Q?2Ag19sf9VZStqwbJCLqZxkBo1bWnurpes6oPbKnSvKVM1jxrUiA8aolizUar?=
 =?us-ascii?Q?aQz4yR8xrDCTV+swjZrgM6YYW3RcQkaVvmCAavMFrJ3nupkg4mrhHQ6aF01v?=
 =?us-ascii?Q?tmWR14Q0hvblgok9jowCmPYCO2IzrFjddejXq29BgUBXwjSDeH+iDwrrVlaj?=
 =?us-ascii?Q?djtp0ya5En3kNwck8XmS10b9My5wIFSJn4PRhwhKrlFmbrNKP1yCEumG+5Pt?=
 =?us-ascii?Q?lrueHxbswzxdWRvbyHSY4GbkHm/GNYxG+7qmYaF5Y0f/Wc3DciBstTlfMc52?=
 =?us-ascii?Q?c2Ff29auF7JKhRYHIGnOKNhBpeY989g1PZeTwnDPEzbtV+l6LFX+Sm63SiM0?=
 =?us-ascii?Q?6bw6wpviy16BmleIrXB+cSoXjClvNc3sCcxM5b6SasZoTsJsBQK/+7lz0mhA?=
 =?us-ascii?Q?SZR+FvfbiK9ym3EdMbGe08ew0JYoO/M6QGCLDVy/CG5UNjXRhGsfiOwh7Ti1?=
 =?us-ascii?Q?gk5VbGHjA4iPBpNiscoyhmkkwZrV617wggzg+7ldEQtSP94LDJDDdn7Mc/J6?=
 =?us-ascii?Q?B/pa/oWmtX0MPGRgzQ6RbS31GDIadpI0WLZ02hVM34Dg84WeeKT/eIOlPYZo?=
 =?us-ascii?Q?OvsOUkXtt/nOAFlhQ8fT8vmVo+jDUBfX3Hbncfb+Jb8qsmkHGfbMwGjf+sfj?=
 =?us-ascii?Q?wxJRlrVmEG1OLXtD02yoIx/sORZt42WIfUdkN/CFP/kEU8R1nCBdlBrLF9GP?=
 =?us-ascii?Q?UjTSQEjaInm9/WcInCtneHpWdE60gmCo/DkZRqPWAz0pbOvXNAPfjlirKA1u?=
 =?us-ascii?Q?IapDSj4BJBHu9KIzCBg0dRwC7Tp67k4rHpTP///jyd1db601MRXlIVCXDnra?=
 =?us-ascii?Q?69QIBXoxSGyQbLVIA6DOo3XBkREmtGNE7bFRk++kcxQXJBp3ONhWerrs0Wak?=
 =?us-ascii?Q?EE149OmToU8k7TACGu+iiG8g2dsbKBJJi/nFBNuY7jrKpwSZ34g1ir5P2l4m?=
 =?us-ascii?Q?tO0rHh64A+DJN7SuAlIDqFqEnncqkNkFFSeCGE1XAHSnXAiaweE5XBBH0fnh?=
 =?us-ascii?Q?A+RdOlRayjTZrtgeqS3zEcncU2DIIoLAfMz2RqSLnV2OombGYi0cUfeWzvnf?=
 =?us-ascii?Q?c1IZ5a3jVF+/Snbwf8KsGk3z1m0nKekIb9hwPZ5rc87skv8IVCvzLfWMY5KW?=
 =?us-ascii?Q?So1FfqHHHVoA4ULZKFHPUxMsMhacgyuxZzO+MuveoZ9zH4VG4MLjD+TgPI3+?=
 =?us-ascii?Q?maG2D5zMex64PItm4mQOMCHwGSN8/bKfew/RJcvK8RGGOvTHqxMqZYrVvY6X?=
 =?us-ascii?Q?kI0+gkTIj+4W8w2dLw43Ohmx2ZFOv4Qub6hGg3gUap9w+ha9/tL13KETytVd?=
 =?us-ascii?Q?y+Tq65OD5wZ00ifPYH3W+W56mkh0p9RMY7+8rwXcM1QlnrdrFZrpQaEFIeJp?=
 =?us-ascii?Q?b0+ZViGfBxxA82c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 09:42:07.7479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e078d47-3ecc-4dfc-6d18-08dcb85788e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7757
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MncwTux83Gz5crLsf0LwfYQlfqNdggU/s2DoOvviXg=;
 b=uVA1dg8FvATR+EDyYoht/GZqVrtQrt8JNRCMEEIIRHu8Z5+xFk7KRBpcPhxu+r+RUgOrQKc5VIKtSKISw5aFmVTZ/dJdL2FE+efI2Ugda7HZXUAWJQvinizpQsd9IDgs1WzlUA1pfk9i01UUAp56b25PefY+sQ8wudb8Z9L/pzU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uVA1dg8F
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu102_defconfig: add ddr
 comment
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a comment to the zynqmp_zcu102_defconfig alerting users that the older
version of the board has a different ddr memory requiring a different
psu_init_gpl.c file in u-boot.

Users with zcu102 boards with the original ddr memory need to use the
following config:
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-revA"

The issue is documented here:
https://support.xilinx.com/s/article/71961?language=en_US

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 3f1726a13f..bdab4af964 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -23,6 +23,12 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+# The original DDR memory that was used with the zcu102 revA is obsolete.
+# Users with zcu102 revA boards need to use the following u-boot device tree:
+# BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-revA"
+# For more information:
+# https://support.xilinx.com/s/article/71961?language=en_US
+# zcu102 boards with the updated DDR memory, use the rev1.0 device tree:
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
