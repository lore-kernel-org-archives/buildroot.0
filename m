Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7DFCA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 05:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE1DC608D7;
	Thu, 14 Aug 2025 05:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNjNv6kieAZn; Thu, 14 Aug 2025 05:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B3B9608FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3B9608FA;
	Thu, 14 Aug 2025 05:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F1A01BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44A904007F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxorkSoGRGXA for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 05:26:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::621;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90C554007E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90C554007E
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::621])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90C554007E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pg10LlmWhdM5aftPtagTBUjg5OcLRZP7q3s9ztJFxS/ba8DXCNCHSXdEanbVsEGboo2+lnAPzeeNSYiluKsauiqVqgT3ZVkmnbhtFdB+1VoboQaFzoK5tGCguECcg4y++YYgXNuG9+5YSHe6KeCf4kJoArzANO6AEQuJwZOAB5h7Br5S0w0c5wED999N3crhNPUFPy93i+K81o4dy1WAdZeLPqfxXWKQhsMJCF1TEkfn5ywnsHYfgBIMne8JuF9wMCa60p5xYPDvqmRWiOlNFlF/0704WTTxsPz7bZgswcmcpZUi7yUzY+tdDBY8b8g6Z3F8QmothgZNbyjyo4RQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iteTHHbvT5c3Eh7tgsIl62GQwlfResP21Pw9afDSYTo=;
 b=ekC3O4nnsnr26d+1hMQ0RkzzM/1M0B2pWPXp789xT2ly2OFJta8bJUf2WoJpXIFlH9S/+ycvtC/gcvVa1BYaEAFFLLny2+ZagcwFDo7Ekz46BoJFI13PLMxIVSczxrnRAnge9eoPCt3UKDuJ0UiAtL67oyvwIte/MsLaHOGLZdA/FXATPP6kJPzLh/qB8Bw71AUnhVUYWN6l+THlqZ8I6CV002VlndcUjcis1Eon7szg8TgJvIAbvgxddwaPUe8Lek1/u5YIcYsyswXH8RVm/Wm0K1ka9XT7ipKQIVFUSmDCael6VtRvJwuIgRkGscyIfmmKgDEP2Ee/5Agu3zVryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::26)
 by PH8PR12MB6747.namprd12.prod.outlook.com (2603:10b6:510:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 05:26:49 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::3d) by BL1P222CA0021.outlook.office365.com
 (2603:10b6:208:2c7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 05:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 05:26:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 00:26:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 00:26:47 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 00:26:46 -0500
To: <buildroot@buildroot.org>
Date: Thu, 14 Aug 2025 06:26:30 +0100
Message-ID: <20250814052631.3412836-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814052631.3412836-1-neal.frager@amd.com>
References: <20250814052631.3412836-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|PH8PR12MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: b6dd8734-7570-4a87-2bfb-08dddaf32af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w65C6I/ePZ2u4qaPVTNS4hiz59yLDtPE1cq3G7G7xbc+oBGk/wrhditdyu6n?=
 =?us-ascii?Q?emYVRflR2odirCs+Pt9D4Jw6//KfnL7Tkf0HE0PFfBPnYyoTcwcjSbplG8tG?=
 =?us-ascii?Q?RfDrbdmQS4wiVC+trotjlWdeVjqzZXyoe7H8Z8aagmT0Z3e3XmUthHhaXdW1?=
 =?us-ascii?Q?8Dn/oLAg8gOfQCJUUpuaEJ08NwXlWMo/bwZLV+pS9/LdE/ft9v/q6/rR8030?=
 =?us-ascii?Q?fKF8MS+9NIB0swOW0CI9ZFMPFwjbHsVMJ90RJi6cgW6LP2rSGpua8Vw7oRvg?=
 =?us-ascii?Q?97nJXrigS+P5JPpwTbULlFQII8Pm+v8ZwDcXoLwcwJ3WqTk8P1AIVlVNaSRk?=
 =?us-ascii?Q?fa+80CIStjo/tD0NqS0An/fx2DNPhEBOQqckxPm2AfzSrKWBTXKqdW1dPvGi?=
 =?us-ascii?Q?8ccUuTG3SvpS6Pg1cpBlg5oFzjZQLKQ1CSl/RAp0YwX+DPQD62B06Q5SoFTc?=
 =?us-ascii?Q?Hm/A5u9adBhOlp491pFgh12mB5bB3TeObb3sWtOyMDalUcurCn1JTaAXPlor?=
 =?us-ascii?Q?oTBhA6qPP6/lV52PJTZG9q09wFLN+VQaAl/56HxhLuZVZlodtT/eS3cZV6Q6?=
 =?us-ascii?Q?PPYmKMCUxwtkY5FoyGuKVbcMyBneBCO39+IQ1KR2IKzXfvbMSgks/iY8znrw?=
 =?us-ascii?Q?EeANBuCv9QSC0wXAwyERBOoWE+KAJCjx9c/kBB6G7lSctaqtE+rpjRNLiFJR?=
 =?us-ascii?Q?uiQZE3ZDjN7urcWhoWlcKqs9lji1353NYBhWac0qPUVOZvEGucFdHMDEMGQb?=
 =?us-ascii?Q?LnRwwTTf/qD9uYR28Tn8wuMAfNpYlaHEXcQWsJa4NVfKrnxkkW9wFmoXr3iy?=
 =?us-ascii?Q?X0WMBCP/2xkinzflNxq+YGBapzf6VnFhIWqj83bgj3luROCKXxYpSFCwL+a5?=
 =?us-ascii?Q?YMnG4uv1sjA6tD1aBTuGF1idMEIswoKgnaZiiMjzIf9xFjUzJ5Jj08YnZ4nK?=
 =?us-ascii?Q?vWK61vMpJAU/7f/f0kLJJ6CKwyyPI7sKymGHMlkay/3s/8d1H9XqGtSjiXmb?=
 =?us-ascii?Q?aZ1nju6E0MdsDAQUYt69Uj5TLBmHt9bY3KTLrPW/uw4z+Ve+iPYYYaJFRACH?=
 =?us-ascii?Q?X4LaYIZAK1yaTWynd1ULauci1oU5rxwknybqkwJAcxSizZhPmKH75zzseKk9?=
 =?us-ascii?Q?qbQdUn4/sbs7rSKiRcvPm0kJdrIQ11t2u94FgRhVloHU4tkpm/d3oR9rcvZb?=
 =?us-ascii?Q?WrPaYPpMw8Lg8K63k3knu+DEtgtAunsHOrTdtv48n2Tl5Ej/L1Z1AgWR79KQ?=
 =?us-ascii?Q?YTx6/amSMt7HVRV7JiG0npWiCMdXJ7h/eG0Z+gFKulcULdO1EVTTgujiNh7w?=
 =?us-ascii?Q?+fSCykxJ36Srd6WRw0xofEdOYsp+3TqHZb5/ZTzdedYZUDIq2NF3dzeKlxGe?=
 =?us-ascii?Q?6pzp3mCbydRfPrD9dAVb39WAkSqPzaYUaAC/wUd54mx1KKvxjiGUWTDGbWEE?=
 =?us-ascii?Q?wij5BY12etOzfpseZHNEW7PBJKMf+N0XzWvzUFW3w0sB0FAKzfCt4ngqmor2?=
 =?us-ascii?Q?1GV4LfXtWIgsgI1tKK/2ynWvM2FfZ+cf8CDoTPO+ObV61aE+0NT2CZCXjJsH?=
 =?us-ascii?Q?dc3gXy4t0ClV1rF7NDA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 05:26:48.8916 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dd8734-7570-4a87-2bfb-08dddaf32af9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6747
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iteTHHbvT5c3Eh7tgsIl62GQwlfResP21Pw9afDSYTo=;
 b=syNNXA2kFDInWk6mIlwh8pCPOqJx7LpyDmwondkxPx31PQraU2cf9SC18OA0IwnpqOlbQXShVG4iRsACmWMPguBztsDwMzv+Zle1DRYhwJYGl9rfWUucUy0GmEbMC93NciAcbji1LNiKNjIDZpEHvAskOQMKZcvyY566cldi9BU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=syNNXA2k
Subject: [Buildroot] [PATCH v6 4/5] configs/versal_*: make savedefconfig
 cleaning
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the new cpu dependencies included in the xilinx-prebuilt package,
BR2_TARGET_XILINX_PREBUILT_VERSAL is now default when BR2_cortex_a72 is
selected. This means that BR2_TARGET_XILINX_PREBUILT_VERSAL is not needed
in the versal_*_defconfig files anymore.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V6:
- new patch added to series
---
 configs/versal_vck190_defconfig | 1 -
 configs/versal_vek280_defconfig | 1 -
 configs/versal_vpk180_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index c9d99876d5..7a08501547 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 4aa25f8d67..16283de2e5 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 500298c2f4..3efe9dd875 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
