Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6554DC18E7C
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3590E83661;
	Wed, 26 Feb 2025 15:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6aZB1zbdoqo; Wed, 26 Feb 2025 15:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A323836C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A323836C8;
	Wed, 26 Feb 2025 15:13:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C979294F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C23E6412A0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D84kCbS1emZy for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::62f;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C00524129F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C00524129F
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C00524129F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6FtDCyaCWNFmWyutvgBHYg94NfhWuI+BttOFnoSPpM30OIiCb08lzr5g+RwyhcsAxGPkpk4qEk0aBZF2CJNYtIGG8Iz24dpP7FWbr78jIFVKpPNdfDm8AMnCPr8AdA2rdwIbTgQTJhUD5nlXkt3bstFyhMOkZryKUIjcKXnqfU1NHZctTO7I6eJIrlzrZCKfTlJPTdYJSPKAJlvwBg6zBuQDknrS9ru0GIgrfVEVbvJY58GlJ6cXGjrgELh6kGsW8L9nNwoaomn56tHoqMexKyklxryNOIxCJLlOdbvZkn24nwhnXjkDM3OOGMmSzXNPOivaCVs/UFiIrp5I/d61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc3gi0VPRqoxnHel+/a6nps39kndPIQ3yRmlObAmeLY=;
 b=vi33w6QWfoGJgt0eJmqyOi35hmCJekIsun7qnJoi7NYePSoPq4BwpK3DlsgmCiQGZAGeuP+H3cUxlVFdlprt9q4Y+NzPxxtrPEmj/TszkziDlPSlzmmzOHL6EdIUcnCWD1p9AL046JOuMAGF9AtWbeFQCgP0FBGm9FRa5WMdofGDgAfH2EvB8pHS4n7ljsjCd3jFAljbvbyq6qB1D+K1DG/tL1tgHvf51c2+SRJo+/3ne+3Mh0gY29+Gtxaj8wC70BkohotamboZJWwNaQLz+F/tC5wFiwJ7fe1eKzIwOEz3eFuXhHh66i+DukrHe/Ap5h/1g8zYEyhGQZC55B58rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR16CA0002.namprd16.prod.outlook.com (2603:10b6:930:10::23)
 by DS7PR12MB8276.namprd12.prod.outlook.com (2603:10b6:8:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:13:42 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::f3) by CY5PR16CA0002.outlook.office365.com
 (2603:10b6:930:10::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 15:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:38 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:36 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:13:31 +0000
Message-ID: <20250226151332.2538312-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226151332.2538312-1-neal.frager@amd.com>
References: <20250226151332.2538312-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DS7PR12MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: f131a395-d15a-4a1f-a8bd-08dd5678276c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A7eHdmRcUfqwfC8CnTv1b/WNinMbde8sldWHr9HG83DNu7kpiiY1Zfy7fz8t?=
 =?us-ascii?Q?ttV0ZyKcox2Y2Mv5iuH7WC/9jkJNaevde4Y+j1EcpdBOQf1yn7LbUXONiI+O?=
 =?us-ascii?Q?ZbbM/TMzlrEayCTryVcWdOUen1xeEIvUAQwIZP3tRzpmuaI/ZRPeFikqUimr?=
 =?us-ascii?Q?KVPfOG8of6BBM5UEADqJU9fKspObWC+kiYGBwvUHr0ck+a1YL2tJDFcuEhus?=
 =?us-ascii?Q?tE68LnrYSiBEhV+x6e7UA57brrHhQdSOkgX4gNjpgiWKWpJnUnimtNZ41xKK?=
 =?us-ascii?Q?ZTsfc/gKNDGH55nHrE+5BvefPW2xqxUXpxM0ye+V38h3KXNYeGIA9UZoNLuo?=
 =?us-ascii?Q?Hjbt6/xs2tgIb5pPvzaLzA6n8aLpnzgaA1PrP47Xm9MmZSqGuz36op5z1YKi?=
 =?us-ascii?Q?vLtQI4y6qcEHV+DdbW4UMBD1g9pk1q+MYILVuPakb/b0XHBsgxvKhT1idIUr?=
 =?us-ascii?Q?2v5ZcPDgv/5ScwpwSemOeIqzqMFI2xdESfn3aXgDB//zOfpQrxfkN2gLeJfF?=
 =?us-ascii?Q?4BhxecysM+ym4yvDB+XDCPemcikzpNMsiq8Wd50zcs6C6OFkxRNm37vHL/IT?=
 =?us-ascii?Q?K7EF/jf8uFp114QM/PguExIs4/5nEGyC8Rsd91+AqWRayrzpha+Y3lzOxki3?=
 =?us-ascii?Q?Zn2yR06HKfvvNCjElwBBLsO4LgslBIwvRr4cdBNWxdTaYUadauM4HSAnP/qG?=
 =?us-ascii?Q?Drri1pCyGAtfkVnthhft8Bx0qXJHtZ+e+MwOvF/u1d+S+4c/Hai1qvKWmxnh?=
 =?us-ascii?Q?PF4YE0j3nTZ2Ky3SHxRiNaJV9b5q0MdPglYBOpMQfrsjsajIhO+1sR5ktBR7?=
 =?us-ascii?Q?gTA8e3OgDlMKUAP5Zoz5QFU1AnnMTe9R4YWQGfPMYh63wAZDkdMf+xxmv0XU?=
 =?us-ascii?Q?nNuRSnIAjaGlMT7TgEnNlpA2pB4OVqxj3CUmGPLNrd6GaBZAWb1/MvrQV3r2?=
 =?us-ascii?Q?jdwmTRvRfa5rJz4bY+gv+zTm2BUXSgT/X3oxQj23IiAGzuH3uK2GvQQDCRNv?=
 =?us-ascii?Q?XypGJb8uO1x8wcury+1W3+YTTvl1lHluE0TEGgzAApxDqoqgqG1zOhXcMdni?=
 =?us-ascii?Q?y1ooV272a+L+deDDQO8nD3j8TAb1zX7traocyUj/Lbr2ZXduxwlp/wUo71j+?=
 =?us-ascii?Q?Tm4YkYxDQPmRmgkHKvs+A0kd2kIWgFEdUM3aitsmxfVsUxiWXD6nIDQ3iC1u?=
 =?us-ascii?Q?E1Dg75SQFszydVzJxTbrqomZ0O/maX0XlYNAZ+PAdxJdRqTlcFgNhRYiC1Hk?=
 =?us-ascii?Q?K8d2g9J7TnQuSWA+N8DXWZMAGMSu2+UISakCFB4you3s4iN1QCyclZTh2f0Q?=
 =?us-ascii?Q?++NpVTPnwIMP25jUMS+dQe076rgYiWG7BT8dhiONN4qn5nWG4IHXHL2SGV+D?=
 =?us-ascii?Q?OosBNxlRe2HiPjuYbNOqpr9cUw9VmSEhPmDFAhO0b4uCyD3yakMcmVmpJcBe?=
 =?us-ascii?Q?K49P7HVpHlSHSU9A3wzZTleyhAPAlPw///MNWduvhxrBeap24Slv8Pzvue/F?=
 =?us-ascii?Q?QvS+AUri5qxkaBJSiXOIUEbuFneG/EVrRqFF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:41.2412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f131a395-d15a-4a1f-a8bd-08dd5678276c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mc3gi0VPRqoxnHel+/a6nps39kndPIQ3yRmlObAmeLY=;
 b=M93AO0s3XnrL7G2Fe9c7Otx52lfM7wQeWEm/GILxckD1zl7W0Z0ME7b9L+laZIONPHLCeO60vDrK/NQ1YeOxsG0KFhHXeetzqP7SaiQ5GCOQZibvb67dBtfOPKD91H3azUxpcSRsPtQo3u/tvlu1yDG4Reawd5p19pymFGv9eEA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=M93AO0s3
Subject: [Buildroot] [PATCH v1 2/3] configs/versal_vek280_defconfig: bump to
 Linux 6.6.70
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the versal_vek280_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vek280_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index c0c850e586..af8bed884f 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
