Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FCEC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B9C340A40;
	Tue,  6 Aug 2024 15:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anv950i8Vf1T; Tue,  6 Aug 2024 15:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB60E40A20
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB60E40A20;
	Tue,  6 Aug 2024 15:10:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 236A01BF35B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10724403B2
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGSmIjYzfmSY for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:10:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::61d;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F93A40394
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F93A40394
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F93A40394
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKpwNv4veHYAZm3QYPqdcMoOMYm5nCoh3Y2RFp+AVE2C27viKd/Ivl1aVz5paJdHZPo8o8GAfxq6bXai9+pMSpQcnh2qW032EIUoM1IGRJZY6KgVmoBMRBR5jWPBSiar6mA2jsDphJC9LjiloWN0jSs/gKzO+D15iTNAFRktl9rMKfEXsloK1ODxjybCp0H2wgYYkT4Fx3WVT09AyR2gWNkzI1YQW3hcU7VMQ75Tvqikm2nQradhrXSeW4xfmJ6E7jE/lI+yrPT+wQHHLAKXOCNU1oZxQQE1YnwzFR9Llgctq5Jw+mbfnvvTnwfZC3PdUB7Kot2zE45wUHwL/lBAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlvpzH85FFx85vZuanqOdo6OHxIEnkkCGSWZ5q/Ev+k=;
 b=g/KZ4h8iH8Whuxvwq+KXFKUoBOmW7IFrIJ71bKhq6vjtjSxj+B2eMV2IXeSG0k/hESUhdjZzq1ETSWqmieLR5t8eh2hUZpAp+0mWBg7tCfSXb0LOyv12IiAqg0lReJd4MGhRXKMvQBJtMPvfu9IK2cF729EGY3dLwRAmv0sqGDOi9+XdQyD3g0jkA+DAp3YN68tRQpHF/VhOM+LxSp4TgtQ6sHCo4AnLyu2EcrhSgWuFH430cC1x5pynKUBIcRk7BzDx4IA8X5i9V+T7VKPy/VqOkr+H6Xjs9RUdIX77Wc4O550rDrMmvLRj4TDpjqndJZfM8j5JDC+fmIELBRdZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::15)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 15:10:05 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::5) by CH5P220CA0014.outlook.office365.com
 (2603:10b6:610:1ef::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Tue, 6 Aug 2024 15:10:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 6 Aug 2024 15:10:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 10:10:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 10:10:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 10:10:01 -0500
To: <buildroot@buildroot.org>
Date: Tue, 6 Aug 2024 16:10:00 +0100
Message-ID: <20240806151001.2307572-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d059b9f-6574-4ac9-39d8-08dcb629d9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iwDy+dkEjRH3Bv/cks4piT+S42b5/A4DAHHvPtZba3TLcjrR2cH85MjhP9vr?=
 =?us-ascii?Q?cVBWLMFuFRp/MCEQv6LVHT019/hddMs9SeDrX8yXgD9c8Bk2qSioglhV4cYv?=
 =?us-ascii?Q?vuBebV4nlwZd5X3h6hwg6H4dNBipmt6+USiLlfGqZwsAipgsxGQY1YUndDIu?=
 =?us-ascii?Q?8BRdPnCEPPXiRd16j2JvsRbO9UBkGoKlpUlAakIMXdOm8WuLB22cgzwIMILP?=
 =?us-ascii?Q?+qxPpntG0RHXJWLASg7J6WuA625Kep6j5wmg70azRnV9Ahryef4iJl4HFHEJ?=
 =?us-ascii?Q?yz8xB9mhmVQQB3pp3DdG66lS6gAvPneteMyWaj4D3q55QnxJMjBJJGv/Ajz2?=
 =?us-ascii?Q?1fAEbU01PwLXwmNYBWgBlbPIjreyz53Awza7XLi4t1R/Es0R9PgEeUpONA+2?=
 =?us-ascii?Q?boiLbK7nr+oV4agXTEP4ZhNwY6kpC1HmEpN7OHSs+Kqfrf7ZHuLNtJ+avAKU?=
 =?us-ascii?Q?WeQ9q/iEphYhJyGvWXWfWp+gvqscn0AL0GndxLwRAhqKdovnJ60jydShJO+h?=
 =?us-ascii?Q?ZYb03HmjItjitWMNQjqo1Ze1p3H8NS3sDBGB21sj0GoHQk+HKxtaicqMoZsE?=
 =?us-ascii?Q?PDCTpkKj5GXlAkf3PYPJ/fs4sYlxsRZR68r38lXx6P+DM1ZSbxatmWYgR/ug?=
 =?us-ascii?Q?nDHvCTDNoTDDWEf7Rv4Tyh60f26KgTATWs2ePKS0FqdpZ6TVjRjk+v3RimLR?=
 =?us-ascii?Q?9/hQzLFQCeLIhF1TpEyJQcxVDff5q9fgnS2JC7RJk//+HFzTPRShDLpZc2Jj?=
 =?us-ascii?Q?H6pDoSNuR36gUgkNY6P3yKmKlQq6/O84X/sL1wOKcd5HtnpJtrMov13mIo5W?=
 =?us-ascii?Q?eytOKa2dxOFhUbt8KNtYv9wjPoVPsGp0NQbjVLqtDo2lLzy8dCs6nM8TPQSm?=
 =?us-ascii?Q?UJ3dFo+XSl1evE/yBtinhdLUT586RZO9y83SLIHQtxGaU+sYjMBngK5bGnHH?=
 =?us-ascii?Q?W9MyfJnAh5fDPnC5FlER6t/OZscO46Pi00pTKZy9yMjacHGISdwvFeKXqkrH?=
 =?us-ascii?Q?n5kWqPjVWwd7NWzTFjO8ltbcyLEhg1+3WsgUvO4vRsEVud9+niZ6oMXTIPDc?=
 =?us-ascii?Q?qjq5fvwyoU4Hgc02V/MtuKldIS8kBEAINbix1V4KYrys78//Aia2igoMam3E?=
 =?us-ascii?Q?QAzrPy5d3GCSZyKvFwtcU0HusVZwW53fnPnVpqFVyUgkWJrkZt/ZAfOxSz9N?=
 =?us-ascii?Q?KoVDJTGoo3StzYl05d+bPcjy+S1+001qwvtTQmaTsLfDgV3HnFjGl8g0CqaZ?=
 =?us-ascii?Q?lVdF3NPBkHRfCGGz/i6gleh1TJD9ugyDeRCpTkqdg8J1nFyKOADpp0LWpzxu?=
 =?us-ascii?Q?Eq+v1N06KUzgaBaM/g4G8U/95kG9+QhPPAnYpHFh4Smzo835VD+KdxBNF9+2?=
 =?us-ascii?Q?9PICkvnfH7sCk63pB0UY4Yc7X5zirPO/HNNhGRp5aJthR4rWiMxu1rSdwGSP?=
 =?us-ascii?Q?wwncx3VmEKvsCClTXdZW8rFGkONCJ3s0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 15:10:04.1630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d059b9f-6574-4ac9-39d8-08dcb629d9b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlvpzH85FFx85vZuanqOdo6OHxIEnkkCGSWZ5q/Ev+k=;
 b=WfyhdarQZ/DFn8lrjDwcwalp2wRg/q8bHa0kTLURRUVBfzJU2v5sdx0zb0LN/8ykRurb6nBnIq/EUkyLRBP5MypThgaOBkX+xrDeS8nkzdi042yWTY0/+8/zn3SnbNSrlpQumD3IhwgXl+gFyVj8C3FlwhxVoCU55JXx30eDcdo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WfyhdarQ
Subject: [Buildroot] [PATCH v3 1/1] configs/versal_vek280_defconfig: new
 defconfig
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

This patch adds support for Xilinx Versal VEK280 Evaluation Kit.

VEK280 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vek280.html

The VEK280 requires a patch for the memory node in the dts file because it is
not currently correct.  This patch has been applied to the linux-xlnx repo and
will be included in the 2024.2 release.

Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Fixed memory range in dts files for vek280 evaluation board.
V2->V3:
- Added Upstream link to vek280 patch.
---
 DEVELOPERS                                    |  1 +
 board/versal/readme.txt                       |  4 ++
 ...rsal-Fix-vek280-memory-configuration.patch | 47 +++++++++++++++++++
 configs/versal_vek280_defconfig               | 44 +++++++++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
 create mode 100644 configs/versal_vek280_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 76f7fc5ed6..d07f41fe91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2403,6 +2403,7 @@ F:	board/zynq/
 F:	board/zynqmp/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
+F:	configs/versal_vek280_defconfig
 F:	configs/versal_vpk180_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 9cf499b35b..4d8406fb1f 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -4,6 +4,7 @@ Xilinx Versal boards:
 ******************************************
 Supported Versal Boards:
 Xilinx VCK190 board
+Xilinx VEK280 board
 Xilinx VPK180 board
 ******************************************
 
@@ -12,6 +13,9 @@ Evaluation board features can be found here with the links below.
 VCK190:
 https://www.xilinx.com/products/boards-and-kits/vck190.html
 
+VEK280:
+https://www.xilinx.com/products/boards-and-kits/vek280.html
+
 VPK180:
 https://www.xilinx.com/products/boards-and-kits/vpk180.html
 
diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
new file mode 100644
index 0000000000..d894ad35d1
--- /dev/null
+++ b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
@@ -0,0 +1,47 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Mon, 15 Jul 2024 08:24:57 +0200
+Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
+
+Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
+configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
+(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
+tab but not available as option in wizard. That's why only describe 8GB by
+default.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
+---
+ arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
+ arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
+index 1641dc0b5141..ad5d590318e6 100644
+--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
+@@ -19,7 +19,7 @@ / {
+ 
+ 	memory: memory@0 {
+ 		device_type = "memory";
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
+index fda47cd87b3a..80aae8fa4b11 100644
+--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
+@@ -19,7 +19,7 @@ / {
+ 
+ 	memory: memory@0 {
+ 		device_type = "memory";
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+-- 
+2.43.0
+
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
new file mode 100644
index 0000000000..37e479d692
--- /dev/null
+++ b/configs/versal_vek280_defconfig
@@ -0,0 +1,44 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
+BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
