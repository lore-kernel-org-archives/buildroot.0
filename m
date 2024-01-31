Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5595AC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CFC461564;
	Wed, 31 Jan 2024 11:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CFC461564
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOzLgL2Vwa0n; Wed, 31 Jan 2024 11:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DAEE6156A;
	Wed, 31 Jan 2024 11:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DAEE6156A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 458B51BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1779841F2D
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1779841F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Ds66Py2Ixm1 for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:24:08 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3611C41F0F
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3611C41F0F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKRj7ak4GTwIu4YiUGztuuL64hjpWAHYJA/5sp5FtN2Qdv78gNUdD1VtLEPhM5ChKPH5y1R0cyPscg/ZcXEW/O4NptDlqSKh1AD64atMFyQwP8FtOvrueWr4yYuljvEKKBjMcPEKZAAg1RO6rEnaow+kRgj4eNlU0FNyZ0+3ocZK7AjO7cZOHTISCIRzqdUUPj6s6rzvEv6fUIt82YznLr29WHDPFg0P35zdGVsP6/w31HYbJwxjQXoyWSfhlF+THabfWRZ5QJr+T1KF8fGZ+eDhIz9Kwu4mdDk6+Pu3RO4CoeAntiQ3OuF7YBxyC+9pnEbEBxjTB8Q1UCVGVl12vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPjslLi/+NAwsvcyxAILYJxL5egmydR7NBI6V5e/Gzs=;
 b=ldaH3r7Mj/wMyL6WYWqXzXFY3xI1jNblganLT1SokeBu8GPNN6ZfEaglb6tDS8mwfFhP5lo0zBi9U3GuuwfKuc+5F7mAqHZGZROKMhZgx0C5U7x0qTLQh35HrTqAzNnM5oCrI/8D+uVf5zKzk6mCHVhttTk2ukY80+yomk9xfYQWitK2cCWNdVyi1kf/ZDNEc7TODIPEfLFzoeV7CP6RJG4baDV1tInVEW0StmSQkT9SOERud2xkd8zjGFagnW5Ac8xtw7xgH4ibpbBDtn47Ocjzas56vpsKzrVTx83LWrRQpoCJrJZMh4sHuSCnxILT2hwFZZOHnYIFtSPnfo8zew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5PR02CA0004.namprd02.prod.outlook.com (2603:10b6:610:1ed::21)
 by CH0PR12MB5124.namprd12.prod.outlook.com (2603:10b6:610:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Wed, 31 Jan
 2024 11:24:05 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::b) by CH5PR02CA0004.outlook.office365.com
 (2603:10b6:610:1ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Wed, 31 Jan 2024 11:24:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 11:24:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:24:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:24:03 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:24:02 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:22 +0000
Message-ID: <20240131112223.2175855-10-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|CH0PR12MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb5ca06-1ef1-4160-a8e6-08dc224f21ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VlOpwHau9EDJMB9NFtGWOwF5A4KvWvNX8K/dJkWh4/i/rNLF5zsKov09whuTaJ5tkYo7UTwejVkO6X8gigJX6DkLfMGS4X1Qco9q2pKR0wUbHjdoY27WFRMJkZCTyh1GNVIFjXyE9W9arMXWUQaK3s6YN+j6hBBy165v32XM4P/IYDxjlVk2//3/lvsWdO8BrPrYkuB6m2As6gM15Y1iNgaLqQApRfhis3wV8a8dROlTtHwt/uLXStECYu7eQcqxbBrwzi6pRSlLfPtEUXfxxtT4kQwFjwMVzdb/rzo+Jt1AL6Fxr+l+Rl8qytmEZIPPi+WK2IQp6voF81fyhS3RMJ4dWBBrnuB8IMPDLNwG8vEAQ737lQ2M5c1uo8BMpmxnq3XLw1Sv+OxyFtdcwN2PSSl8ZnFmAikHgDRlq6t+IZ/7XQYokBqvTCxvf1G82UkOD1m9vxHVma2lQ2Cbl3q+ntidtwrQKTJtPuoQqvBjwDTdN3sw5b1bSXVq+lsjx1fsVyVhEbHonlyOMgbn1HcXK8ZJHffxL5Oxp1gaLCBJxMnksiyv0VcntxU1YcCvOX6Tx6/KS19yxUoLQOuta9ah2pPWFmaqL/rOXPvh4HAMcXXTpWP6D53Ywyq6AOBNDgd4FcLLOAWkgVXr22Kmyw7pvmldYsxnuiE6nFWdkMSzJ5ahOSTkXNLB/VsA+ZsLCbz/mJK6JxyYAgpTFZDeISjE9W/UOvD78w0lMSENNgsFBoKdikVpFfwFZXZPy0wIEDBmyhoeZqiRVfU1ZweA0Ng7oA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(40470700004)(46966006)(36840700001)(36860700001)(47076005)(41300700001)(36756003)(86362001)(356005)(82740400003)(81166007)(426003)(6666004)(8936002)(8676002)(54906003)(6916009)(316002)(478600001)(70586007)(70206006)(5660300002)(336012)(26005)(4326008)(83380400001)(2906002)(2616005)(44832011)(1076003)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:24:04.5945 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb5ca06-1ef1-4160-a8e6-08dc224f21ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5124
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPjslLi/+NAwsvcyxAILYJxL5egmydR7NBI6V5e/Gzs=;
 b=eJ0nQ6uokU9rLGRohOne6Pq/HKeMjaWnvRZ1qRihTUqNMaku+nxlFQllOL3VidwEJ6yQfAp9ldg70DMpKYosyxGy0+G2aC1M7kgXr9g95Ervpnm4V83qgVRYgHXqEj2C74dTvA0D6tJhKxxXAwpEOBR0C+/kKIHo+l9Iape8RNw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eJ0nQ6uo
Subject: [Buildroot] [PATCH v9 10/11] configs/versal_vck190_defconfig: build
 plm and psmfw source
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the versal_vck190_defconfig to use the new
versal-firmware package for building the versal plm and psmfw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V5:
 - bootgen is selected automatically now
V5->V7:
 - no changes
V7->V8:
 - bump to xilinx_v2023.2
V8->V9:
 - add BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH definition
---
 configs/versal_vck190_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 8561b6641a..5a0dddc070 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,11 +32,11 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_VERSAL_FIRMWARE=y
+BR2_TARGET_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/vck190-versal/vpl_gen_fixed.pdi"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
