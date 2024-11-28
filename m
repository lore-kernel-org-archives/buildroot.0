Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860FCD690E9
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 08:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B71C9608D2;
	Thu, 28 Nov 2024 08:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejVDw4bXSweX; Thu, 28 Nov 2024 08:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8155A607D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8155A607D6;
	Thu, 28 Nov 2024 08:16:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A69911167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 08:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94894607D6
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 08:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oCzvUjDEr82 for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 08:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8BAD607AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8BAD607AA
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8BAD607AA
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 08:16:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZf+0jBhA9o/7h11fKJc2XzNrDP/WPTXGoC7cSl7CY1gTZ4Jbsd1TTqOZczj5f4vMOaWVl5hhKDlvSEfa/ADFQc4Gf9NuK/wCYErU+9Aw1ZQxVu+rF46FGp+NEbOXZWamNe1NmJCpAmzJ/RiSakeQqD401RNgbhWfE4IHFn+2yyDkWZYzG/5LSpwHfNnYawLMAgNfG5m3hsXsVmDUQR/UF0/Pkz/bqyKuokQhvWLwVfmjakhLPEDbTtZQv6J7J63jyV8OBhmF6I+tnGjwvjd7psLNcOy4e3FPe4sadSWyjRxYqSOrLuBGvFT49/dx2I94kPrSn/OGtUu+52SlJtjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19M3Z9ZXvoSwfNBoXIh6Iuglmw6Q6h6LrQJpZz39KSU=;
 b=NY/wMn9Lvi9y6BkqsXAc3ykFv0kkUoWECkGxXXT9Bi82y72QZWg2O6zscTiQhoBpgU0AjOhFwzL2FdHEhPQJIsk2DLD/4rubZ7kakR0sDnQ29sT7m+0qLjtyo5bRGaL5fUMiMJr6OMCBuWbG1nMKvmkvaortc4+n86+DsvzPN0DrIfERrvqULnRPbYFIpDm4pz6w9dJGNT55u1bE2znNxV0T/zZkSYC99lMeP2zEzFqpJklgWuPcvZxvLlffV0IWQd2eKVHkfhbtWdQCb6H4O8zt3zDYk/FvYMKAxKJdQ3Jy1hEWYSbsn2EY94PCEb55WZhXfYxFsDAU7xQZqnxfTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0990.namprd03.prod.outlook.com (2603:10b6:408:109::35)
 by DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 08:16:42 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::f) by BN9PR03CA0990.outlook.office365.com
 (2603:10b6:408:109::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Thu,
 28 Nov 2024 08:16:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Thu, 28 Nov 2024 08:16:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Nov
 2024 02:16:39 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Nov 2024 02:16:37 -0600
To: <buildroot@buildroot.org>
Date: Thu, 28 Nov 2024 08:16:29 +0000
Message-ID: <20241128081629.3100977-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DM6PR12MB4340:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6ca450-e469-4401-b24e-08dd0f84fd15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ga6zvvJBcOp8irU9inCzyM4NuwfyKuIlyI97EdWhtVW8WxacZpOfJSNL5UVt?=
 =?us-ascii?Q?2ikat1zoYhSHniSl9eYaEPAjaTQYv8Gy0TgoJTYlWmkPZReAKhEoCrhqeNGz?=
 =?us-ascii?Q?WixzS9AOe2toQ4YecNHgEy9iuP0wFfliwKk3Y4Nfs60OZRW5niYv23wAjVwN?=
 =?us-ascii?Q?X8qSmx4b2/sb7hhMAxFfOfXfh4+AHBOJoOf7nDG69C1v/paKRH/Li5zMraHM?=
 =?us-ascii?Q?ISvcgTCD9VjddCFS2HDTyvxD2Usgq3JTAmMHLpl/5rYO1wXS/L+EbWTgxRrC?=
 =?us-ascii?Q?l0nwBP/dNHA/ssBbg9kmj8e5F9qQRLNnRRA1xSm2MkRMmPFynJvEnu7WFP5z?=
 =?us-ascii?Q?79F4P2Gp4WMpKf3thKNsUtHwe83MzumcwJsZKBjJLQcooO38GkK0fjV6IZNz?=
 =?us-ascii?Q?v0QW6k085RN+62e4G7s0lILtbuSMH+0jVNh3hT1Jv5GBimNFkIsy67dPA8GE?=
 =?us-ascii?Q?4rRQrK/50DT0nV9eB9Z+7pzD0hJi+Efj8If2ITuIDT0pYxegDDn2Jl579Tbo?=
 =?us-ascii?Q?vlrbSn3v9l3AJK6v4noDEv8GSM835a2vNKPglWzVebojljo7ZBrXzLY50Mtm?=
 =?us-ascii?Q?/d6g8D0JGSW6Zxq7e7j2JUBAcZZANsWL3OvZoGbtpKroxc+Zm2fMHAdGTt8G?=
 =?us-ascii?Q?djX6IS5+LWkQ54+izevNOzeo8ln7DL2y48+jWcmjZuQfl3Z6/RmEZQph4OiP?=
 =?us-ascii?Q?12aL4RWeia1erRMkpPVLTogtzxPqN9cDFJy7llQVfsnk5ToKqTO6m+CxCUUr?=
 =?us-ascii?Q?16qFmP+aW0LH7oEble7YRQeS4MYR6YDdpLUVfYXMRIhf1wf2mvcEJKjNff/4?=
 =?us-ascii?Q?rNJmXZB7bpzmhJETTFMqzjn1sUU1sGgR9icFXmOhE9oeoiqzDcHOlCX681BK?=
 =?us-ascii?Q?T6ADeiqqWDXLpceBeWhTQnhafaYBdtzwSIvuav/v+qu1vPCU7Z8soICMo9va?=
 =?us-ascii?Q?OiBRT2XP+h+6pahNksHUDs8QYWubbFsNZgqkYO5snv2KVy+W1Y6TxiuWJ7AU?=
 =?us-ascii?Q?N4Bcevvj/a7ETHENteXajuWSEUW/PkmicfwuRseVVTZhvQjzrt0kOLzlihSu?=
 =?us-ascii?Q?JdRGWEIqO1vYnZXHb7TNWY831v+9n3BxmGBQkdz/UHAJqyVza2vgJOWCfQzT?=
 =?us-ascii?Q?FvtmWwTNDZ/+Cml2LudDrd67U382q3dgkJjq527M3gNcJqlwqCbYX1jfNpUx?=
 =?us-ascii?Q?1CLav4gLBNmS/dVJqfKMpai2NM1Exw4sG7zCW9P/iiO7R79h5A0m9wxtP078?=
 =?us-ascii?Q?Tx3EDQsCE/81Pf6bId4kmwKMxBGbmfQ9w/tqSVGyeeQPUa34vFD8LJ0rIQLr?=
 =?us-ascii?Q?P6vVutmbtpPET6bVjnB6hyakD3MsglhWZDlIGF7PaGvGgplndkYBfcoudOYc?=
 =?us-ascii?Q?04b9J763aiEFf5ZJX49JFwcKvhWQvvHhFKQn8HwolRtP+2NyYt93+2DhzdvS?=
 =?us-ascii?Q?z2ldxvhtODlP2jg3rI15Xt0Ty8EW8c/56VEWExPY6Jf0uop8cZJJTwgfptLv?=
 =?us-ascii?Q?EGiW3CBJiapnzQk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 08:16:41.2010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6ca450-e469-4401-b24e-08dd0f84fd15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19M3Z9ZXvoSwfNBoXIh6Iuglmw6Q6h6LrQJpZz39KSU=;
 b=JvfWWajxyfAyYsfULaD+s7gg6oV2GAjw3119BXt5B94bsr84wdkHe0svMXk2syr51aqouf2FQLnN04cMvXNqcNfM62L6FMSQtJ7O2NGRpwaeb4nCBaX7VqVai4XYpYKujBUPEBY9RqSHYvYfEJ7TKp7msBAgRUx/oUaNiT/c5jo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JvfWWajx
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vek280_defconfig: bump to
 xilinx-v2024.2
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the versal_vek280_defconfig to xilinx-v2024.2 which includes
the following updates:

- ATF v2.10
- Linux v6.6.40
- PLM xilinx-v2024.2
- PSMFW xilinx-v2024.2
- U-Boot v2024.01

The board specific Linux patch for the vek280 needs to be changed for the
2024.2 release.  While the Linux vek280 dts files were correctly updated, the
prebuilt vpl_gen_fixed.pdi file is still not defining the DDR memory region
from address 0x8 0000 0000 to 0x8 8000 0000.

For this reason, a new patch is needed for 2024.2 which is only a work around
until the pdi file is corrected.  This is why the dts patch will not be
applied upstream.

The following patch has thus been removed:
board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch

And replaced with:
board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch

Upstream: n/a

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...al-vek280-prebuilt-pdi-is-incorrect.patch} | 33 ++++++++++---------
 configs/versal_vek280_defconfig               |  8 ++---
 2 files changed, 22 insertions(+), 19 deletions(-)
 rename board/versal/vek280/patches/linux/{0001-arm64-versal-Fix-vek280-memory-configuration.patch => 0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch} (53%)

diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
similarity index 53%
rename from board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
rename to board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
index d894ad35d1..9451727513 100644
--- a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
+++ b/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
@@ -1,47 +1,50 @@
-From: Michal Simek <michal.simek@amd.com>
-Date: Mon, 15 Jul 2024 08:24:57 +0200
-Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
+From e79a96ff89b11fea03680633ab830894288ee9f0 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Thu, 28 Nov 2024 07:50:28 +0000
+Subject: [PATCH 1/1] arm64: versal: vek280 prebuilt pdi is incorrect
 
-Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
-configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
-(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
-tab but not available as option in wizard. That's why only describe 8GB by
-default.
+The prebuilt vpl_gen_fixed.pdi for the vek280 is incorrect and does not define
+the DDR memory region for address 0x8 0000 0000 - 0x8 8000 0000.  For this
+reason, the intree Linux dts memory node for the vek280 will not boot.
+
+This patch works around the issue until the prebuilt pdi file is changed.
+
+https://github.com/Xilinx/soc-prebuilt-firmware/blob/xilinx_v2024.2/vek280-versal/vpl_gen_fixed.pdi
+
+Upstream: n/a
 
-Signed-off-by: Michal Simek <michal.simek@amd.com>
 Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
 ---
  arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
  arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
-index 1641dc0b5141..ad5d590318e6 100644
+index ad5d590318e6..a306eacca5b3 100644
 --- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
 +++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
 @@ -19,7 +19,7 @@ / {
  
  	memory: memory@0 {
  		device_type = "memory";
--		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x1 0x80000000>; /* 2GB + 6GB */
 +		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
  	};
  
  	chosen {
 diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
-index fda47cd87b3a..80aae8fa4b11 100644
+index a5ee80a373e2..ba54a5ef0c73 100644
 --- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
 +++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
 @@ -19,7 +19,7 @@ / {
  
  	memory: memory@0 {
  		device_type = "memory";
--		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
+-		reg = <0 0 0 0x80000000>, <0x8 0x00000000 0x1 0x80000000>; /* 2GB + 6GB */
 +		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
  	};
  
  	chosen {
 -- 
-2.43.0
+2.25.1
 
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index fcf440ed89..e90408e6b4 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
@@ -18,13 +18,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -35,7 +35,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
