Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C05C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 14:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97AB94052D;
	Mon, 18 Mar 2024 14:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaLVDKEbchTU; Mon, 18 Mar 2024 14:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E5B40568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49E5B40568;
	Mon, 18 Mar 2024 14:03:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6669E1BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 14:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D09607C3
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 14:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZe8CRFhaWFH for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 14:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::600;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F62760797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F62760797
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F62760797
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 14:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMkYHmHoSndrm6XKJOw/ohJBZ3BinXAgB7JORVIK9JFlwlrQkzDrfO5N9VcflE3KbVq3M5Ptk1TcwqHOLCSzWjckDhW29bQPpBvahtM4gx0ITUWsZy01kWYM+TdGheHJbVpkT8uswBJFrVMXlyB7CjOFnFoXccHlPSZ7cC83rhZjtz+/bGerIDjAS7veYgPKgFdqsjxe96+qOH26lhjXqLqna+KQ/4TyQMiOE327ZfBZMOn9uedda8uPUJW/TtRUn9vP0t/PcOmQYjGKyCx1pwPQ5ScTHcVcK44DffxH5DuvXVo4/rK1qKDa2A5KzTpYivTG5OiuBvNT+fS37Seeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F7nxFN4PnaOxAZWVQsVOmKHGMPZhdzPy7QTQn+TUN0=;
 b=naJaOdc3JiwK/LHEdWlQN5lXZ9iMghB/NY2AuBPpMYxYld+V9Ucq6+PzB9JHoOfLzsln2XLCVFAHT04HcP9hJiprtQFgqxc9WBVUOMnK1gv3xmlm20lbEDnjg/CXEWTj0jAC+HWY1Wvr28CV9sTpwRlfkAUFJL+5mIMtV25y8Qvs1+AW0rFh1eeIw5Zw1xI9MCKv2SzNLzZtmmUUoFYz0Vrlp12HDfZJMwHSxRtxlcVbWWng2CM+yHqZ4J501w7mQK51CmFnLWgaFQv3nZXjkoIHO4SnWtEIUFPgnubhW14lvGeGOZUaSWkqnmGH3raDZFFR0TzDq3+PiXQvuj1SDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL0PR02CA0143.namprd02.prod.outlook.com (2603:10b6:208:35::48)
 by SA3PR12MB8047.namprd12.prod.outlook.com (2603:10b6:806:31b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 14:03:16 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::a9) by BL0PR02CA0143.outlook.office365.com
 (2603:10b6:208:35::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Mon, 18 Mar 2024 14:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 14:03:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 09:03:14 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 09:03:13 -0500
To: <buildroot@buildroot.org>
Date: Mon, 18 Mar 2024 14:02:57 +0000
Message-ID: <20240318140258.1083375-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318140258.1083375-1-neal.frager@amd.com>
References: <20240318140258.1083375-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SA3PR12MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: a09ef3a3-04f2-4ea8-c0a5-08dc47542797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OG+nkAkXuc8+xkS483AZd9odRpb7fMedOLyT1qXCDpXka1CBMIcrgzxBSCjmPIVThah8G/CWDnGC4FLU5Jv7SWOr3EQl70SWynt5xOHmY+RAFNJSoZLm+83vEmkS91F4Gq9yIUYLz9dw0+uSy7d+hCxtGCha1n1vWmao8dmzUpyjv9TeETM787Y+yIS0lAZX9iAGKnByht+Id6wIFmIPn1i/cdPZKYBPy/KwIE3EdmcU30kIhrocru9pmdxNEGWIE9MzJA1kC1ZH+PIg9FxZvlyBxIpHCnLHnq1iK+bgWcXTOd1UlGoRPthhu81AWNHbniVZleKaP02e85rVxUEUqdxzsTnEZMG9PQDQtQGpwjuWPawJJYre8nYoain6vOOuNPYe+ynycZOVFpCPO8Tk4JEJIqCYZAMhjoN4GnZTy36f3zEPTkhHQnqmFEWeaOJUMPfUrl49mc9Uu6HhUjmzewWUTMMrTCuc3t2sPmc1Ns1Is9+18vWWEY4yn4D2vdFdkCQ8awFz0KmFCGrFhNDgZqSQl639p+sfR5h5rYdyJxKAQva/a3dc9sgMSjt/L82Qrg+XVxXK7FuzWhdBZy8IBFtXJEgQs0Tda0HhLSHoLmAE0st77KvLjA0nrfZG+PjMDQWyuF2RzNez2ayrlpGI3lRXb+wHt3vrBPdmf/lIx9/fAFZzu87nf4nPboeV5hNqHVgO+wMCd+Dmgg5pS1FYPs+9c6/CKtx+F88t+4wpxw9NvRJg99Wz14SRYrgd8vTK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:03:14.5443 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a09ef3a3-04f2-4ea8-c0a5-08dc47542797
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8047
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F7nxFN4PnaOxAZWVQsVOmKHGMPZhdzPy7QTQn+TUN0=;
 b=NK5oXfHaZQ/dRqYIQHzuP++sTXq9E4PXWMRHY+IkKU6ZQZb/FwU/e2h5Q9uUPldYZojqp1igb7CpFirVZyPoVLSiyvXxaiTAT2J3emMX9AGoIVavmNgIvDQwbUcATPD5SxMVsAZZlanPhQl2QLMapwLSx1j/DnuLxdiWBsL1Gas=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NK5oXfHa
Subject: [Buildroot] [PATCH v1 3/4] configs/zynq_zed_defconfig: bump to
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

This patch bumps the zynq_zed_defconfig to Linux kernel 6.1.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index a3a94687f5..4bc1880481 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
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
