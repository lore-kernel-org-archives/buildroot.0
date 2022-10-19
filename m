Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4A8C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 05:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E3748138E;
	Wed, 19 Oct 2022 05:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3748138E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1uA0-po6j96; Wed, 19 Oct 2022 05:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 887EB81327;
	Wed, 19 Oct 2022 05:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 887EB81327
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8221D1BF330
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 05:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21A7B404B2
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 05:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21A7B404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4WUJPRgHY3i for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 05:18:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 981D340111
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 981D340111
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 05:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoHRDYzsnZROe9+IQk3d/yiksKpla3FYlQcV8q5H/T2yIAaxbAUHClWwFQwoLX+VYkMQUWTm0ilk1fyGLHG9boQfYdyyW9oHUbZMfKei2Sc7QneowEwZ1ug2LZ5c8ZAF35zglkbM+VLYxF45yocXjW1khWUQYnxZZzLh6q0w2PmZG8fgLATY79B6vg3UkVgvxQ7jYlo3q1vfYC4KBeUxeIObidKHEf4+Lbl3aYWIsnT1CcXaqiQFq4d3+dC30yOqZRrSxm80SgP/JWjIfaDAn8xJaxEaaXCLgTMswtQok+d7eNvNWRR5y3pQ3tofYPkR4bUZbys8ROHrnbbIaCpbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxFF6TW0fOSQvme297eUu4BVNpEUR64Eu69V2ctx6CM=;
 b=PSRczgLhWCTa8aFeMINpCLE8+qYmnxPF+XKk2hmqO4ovjPG9p67hpm8MFm5iC3nlM7iOs/+SQ2R8R6ReuRMqTo0LzT7aUS+d4+9OOQT4682NwH4BvpM2lb7UotA0Avik2oV7fjJCBLxaIXuNBMrtdr5WGmCcEg6T6aRu1DGDBtCfuLHx99bu+c6J6xEkTegmuvZ8lU1FarYkIiYSHvvlK5RWWRDcGtD0uC/dhxvudKZDDsRP6ZdVb3E6IVBmZGZnEODk9WpBhLCcIwiGrjJGSJnuXfXH8KEi51Ka2u9kDspW6QUdByoIQAiHnJJ9x8yqc1w8DTh4CnXip/l0O7haqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0049.namprd03.prod.outlook.com (2603:10b6:5:3b5::24)
 by DM4PR12MB5118.namprd12.prod.outlook.com (2603:10b6:5:391::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 05:18:36 +0000
Received: from DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::c8) by DS7PR03CA0049.outlook.office365.com
 (2603:10b6:5:3b5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Wed, 19 Oct 2022 05:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT103.mail.protection.outlook.com (10.13.172.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 05:18:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 00:18:35 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 19 Oct 2022 00:18:35 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Oct 2022 23:18:21 -0600
Message-ID: <20221019051823.26706-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT103:EE_|DM4PR12MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1edc6a-80dc-4cc1-21fc-08dab1916010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AUxa7xNckTkJWSaGf/SVvHzDBNgbRUeDGPm+/KTG7blBBoVulPLZNmWiU1LxMGJuxWYEAXGD+LZ4K8yKTH7dFqDrdNYa56199IKP+4Qc/dKu9Di8EYFihU2X8doyznfus0+5toraEDP74tmgdJz5eyOydP5nrL3b1fsVZ5BJfrSF8NzBJyXI5MNY8cW4yiFhgMYDNcROm9ZtEfgqceTVgDwhlNBsNOekC5xIHpebvs+xyODR/SpV97D4Hg4aNR0DgKyG2uw4fUBeDd5OkKROIx604jEoEkBDX+x+ub8irxDb3qdaq/xn50Vj1qf2W8rQsEfQMomQZ8zZY/AHKtpa5ojNAXdhfKqHPJboXjGrFVlLj0WbMY6iT/mp74CJdi8pnc9sK4lamfbczzIE6V/Y7qDnCfn0d3c5VOZOeMh/rg0X3ivRMvwJzwm4pLoCjF0hZPqb4J+WR8zJ3zNN806iKvHUqNrHhEfxVGSDOTFsSrQpJP/+Yhgt/i/NskoPxyLEWoYFm3xElKZAcJA3BVutyrW6MvTR9xPbOeDLnz549pk2uhDrXrPtTPfpaUoTcySCmZUN9eea78zcI/CX7mqOjoKmMJuKCAdHMZ6vQu7Z0jGkGiEQCLYTHFWpNyDYrXQFUyaXlxL0caVsSXcQP+kEkgJ1AvCc9SYuBgodIqlIYSorjzc9UwHNtNPOKXf/unlairFpgWXGAX9f39ta0lDchCwIVuhJb+OXpsy/Pnth8qmGxeTAEi/hKPK0BbtFHGYiemDwKZLS4RVoYG/WzsMWqDufhv218e2b4s/GpvnjfLydrNsuBN0CSt0rRgtpaNqvfZPs9qr8LxBmE9wMbd7THQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(54906003)(8676002)(6916009)(4326008)(70586007)(6666004)(36860700001)(70206006)(2616005)(316002)(186003)(1076003)(2906002)(5660300002)(44832011)(40480700001)(86362001)(83380400001)(47076005)(336012)(40460700003)(426003)(26005)(41300700001)(36756003)(8936002)(81166007)(356005)(478600001)(82740400003)(82310400005)(36900700001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 05:18:36.5609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1edc6a-80dc-4cc1-21fc-08dab1916010
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxFF6TW0fOSQvme297eUu4BVNpEUR64Eu69V2ctx6CM=;
 b=BBcqfeiofl8vRVjLdHTC+mEvc+ea7ZPfKuX25gHLOzidVHionAWOn9w+Y+rPWgpwo4HID7KP/k9931fUrW0lDCwHayhqimrA8xEZKwbqmrmLi8OcFlRVH5fiGKE8seW7dW/Q1NwqUYzjX8A4fkY7spvb9jdMvBAVJkYYKE21Xsg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BBcqfeio
Subject: [Buildroot] [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump to
 Xilinx 2022.2
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
Cc: ju.o@free.fr, Neal Frager <neal.frager@amd.com>,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zc706 to Xilinx release 2022.2.

Xilinx 2022.2 includes:
- U-Boot 2022.01 bug fixes
- Linux bump to Linux 5.15.36 with bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 82c47be7a5..e9b9e0264c 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
