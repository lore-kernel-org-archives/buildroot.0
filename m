Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B127C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 14:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 980FC4058F;
	Mon, 18 Mar 2024 14:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJPgT_U7M45t; Mon, 18 Mar 2024 14:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FA9405AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37FA9405AB;
	Mon, 18 Mar 2024 14:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46D8F1BF954
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 14:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FCB4815AB
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 14:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yf1Y0Kdq05H0 for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 14:03:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::601;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05C7C81492
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C7C81492
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05C7C81492
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 14:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwhH0mSUHXbfsme37eFObIUt2qMUV0JesJ3KkgydzZrwsnK5jK9huiFnaOQtD3+ZADL2q/O8VxZCSM4fwLchiWlveQhEtAftLqtFPqxxsJ9TTr4KylOYbhLoRNgTrThOB5wsFb97nOZDcQKu5uTe0X5WuMKLsQAMGEbyEUQ+3Pg+10bFtAc7MTZlBTc0PtUDYWBUiL+eBDFjhmyqhDD0CGiKxwTMEhFEGeaAwqsFvxrhD7Z2/a5XIyEJgajtSM1X4XmLcJ1JrjPe2g1v4d26Xs3KbYEexwEhOnkD578BiIqcoQJlYCrfK7VAG2u/yaIWGD4f8bqK1G7wWOq/oEmEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biagmn9607zd/meh7tL9ayIQSPxHqwNf3bdH4W5v8GU=;
 b=mP/gAYixTH69qxsq1BzPApdCb5rryA4tdiEi5IoiUDupNHSdoHSkXtzOZlQT7KRjg6L77AHooE3DtswD4dOt8tFDyjaCUWwIYboBuK2G47tmxukKoH9+7rtDPvCpjk4qHGFsEC2xA3Mx2Csj9njQp/5tsSM5plH0ZYTpRMAfhV76UD9mNCY//2MQXwDxvWszgfHUgBDwJO07G0LS4ECWbEfSRQUM7XERAQNRIVVIRsVG1GK1+PcSbTt9FHaXVEMIpIc5i3VKWa6d7A2o0OXMDiVB/x3BHw6+SGi1ogpWNUbOqJ5UjOaIQpX201by1AUnKn51dd7UZqpxIzkN2BI6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::8)
 by SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 14:03:19 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::9a) by CH0P223CA0022.outlook.office365.com
 (2603:10b6:610:116::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Mon, 18 Mar 2024 14:03:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 14:03:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 09:03:17 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 09:03:16 -0500
To: <buildroot@buildroot.org>
Date: Mon, 18 Mar 2024 14:02:58 +0000
Message-ID: <20240318140258.1083375-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318140258.1083375-1-neal.frager@amd.com>
References: <20240318140258.1083375-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|SJ2PR12MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 989704ee-f0c5-4e23-3ece-08dc475429bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gkcUfj8Cz0vodl9FqLc9h1lJCZ5vgbmFh1uTo/P3gkkGI6U8/hqsrWha9YhnRke5ysy/gkMCg30AGOtZjiaS4k+KugyyL+aiPPxhk6rXKYaWahVDCgemSzx0/kH2cHA2YqEn7l0wvGCFCxP/vL+jRUYXCm2zwgva9F30QMZmvlSExQdJ5MoX3cEYoB03AyYvXq+gqoKG4G/xjYIng4g6fwM8fm8GiH1OdRyjo/BwiTryKMVCYmrEdzwb11M6E2dG126Ir0mn5r4I0oC3feqyuOAaQjGy/XtDKupnqlmpyILI0J431NmNg0kYEZPeqkiwhoWHAuWZ9fToma0XsPFH9tfZa0oYtLyqkMZ0Lrjl2RUeVo2zENfcAvOCIjat+9cB0jpxLuz4GVKvD+aDkSLrcsmIWfYWDbFsgeyOgcKy6vwoB6n4DAAIJHWoiNcNCMpF3fiiu+EZQmCD3m15u97pDM9vlQ2F98OQO75YQlRtZjnPSwLbFuanWhb12ZqhdElfb6sBOiR5Nu218au8OobpL1qYYWP/EvPZ70ccXMthh8zs9/oCOxgw12VSEhIv7EeIuSyTGO2AGduFWmQgPFUmKRaGSBnhySihYKg3ysEbG4xIhqvBVoX1MmHp9ueqNJMfaMxGMLD36OPvsTcpNP8BK0SGVmsxQW6AIQze+wk8ekbF5YDvA77AXQQvwSBE31Hkj0lQSLhqm4X0YND4lbhQCJEJ/CaGmFdTlB4sM8h9YPDqYIgyLPSR+GQAf1C2Qf11
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:03:18.2523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 989704ee-f0c5-4e23-3ece-08dc475429bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8690
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biagmn9607zd/meh7tL9ayIQSPxHqwNf3bdH4W5v8GU=;
 b=OmlXu4+Zbft6S/kqlJXoAtegjfO+r8sbezcqG1ro45mu8wEfE06EFBB14jXkMYjIpWxYY5Ag7bobxvP4lwPrFj/yaFZ4rH6dKLnLJ0INnDRSeEDCGMLvwIYY7UJ6JZTG6EXshmUQFrYkvoun2trwvFgMC9oCWHgeQA0MgHSQvE0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OmlXu4+Z
Subject: [Buildroot] [PATCH v1 4/4] configs/zynq_microzed_defconfig: bump to
 6.1.70
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_microzed_defconfig to Linux kernel 6.1.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index d598a46c39..7ada84cb6c 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_merge_6.1.70)/xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
