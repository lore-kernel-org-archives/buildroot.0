Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E027C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 05:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06DC40A9A;
	Wed, 19 Oct 2022 05:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06DC40A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G658iYyl3eKj; Wed, 19 Oct 2022 05:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0686B405F8;
	Wed, 19 Oct 2022 05:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0686B405F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87AD91BF330
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 05:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5725941B9E
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 05:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5725941B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtG0VqrjhDIo for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 05:18:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F73D41B97
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F73D41B97
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 05:18:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gagmV73Y1i00QUe5f+kddnYOwV3BzG91oCdi5Zx4D/aD2/xjFx3UB8gdT1OeOesNUXJk5WCeagZqiplNUOmbJFoT6pc6GSSdjWM04fjv2iNROlvZt6WrI0v0c7crFyLFJfrjniMnBiF5kaSKAlUIzkYT8YBcoU0Nh7PCH8l4i9mQn4leQREAjNjKxGQQlOeE7nAgXNWeDoLS3lVH0CIqPGBddkl0VfjekXOzF9zb4k8pw/rmqL9OrU++eZyVMiaAKI0Aab8v1RhtY6ALeHMJBvyrhb4qok7ozcdbiWxjSgounu/KLkkCHuwEeANmkoAvdWWKfd1pEcbMJFkHTfTkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdxrfsUP6nED/zfysmsCMikfXA6TwUZeHS/9AXlHEgs=;
 b=P0oq3K4FH20U6UfrmYXDOGBFsh4tcQB+bh7BjzvxiECS1txmzHrwpZw0duiHMTtmnq25tjlFaqWxXst141jH5MpCxIg7BLOfOdQg+hFBwArFUSMFV17PGV1tP4crpYPtwCJz0hKGNIexmpz6PSy5MOJOnVa4oCk0Mb/j4Yf7lKLQvO1pgEer59m6OLlPbrHJzOTvAxYaV9yM1hWUi2rgkW1IQBTIb/xe5/POdUkcyN8OaabgJDO2QLCPsvoq2s1q7MpXrhW7Y6GOMS/pPBN6BGzN3fw2+gcqaaK3L4uOSv1FJ02ucYhZvwN0eAI88p9DhRI7lgEUnQFdUoYfw0Mc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0076.namprd03.prod.outlook.com (2603:10b6:5:3bb::21)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 05:18:42 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::e3) by DS7PR03CA0076.outlook.office365.com
 (2603:10b6:5:3bb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Wed, 19 Oct 2022 05:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 05:18:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 00:18:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 00:18:40 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 19 Oct 2022 00:18:39 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Oct 2022 23:18:22 -0600
Message-ID: <20221019051823.26706-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221019051823.26706-1-neal.frager@amd.com>
References: <20221019051823.26706-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT099:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 778aa314-5852-448f-a47f-08dab19162a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NApSDclnjA4OAopS75gDzmyGvG3SNnWYDDqPqe1NQOXTFPEe6xNdrIHuCEo5Ke3L6d36p0aVcw523wDp/xEDJbjVceC8rPwXeKHu+PGp9DOMPq4TjBtvN+DIOjUQIeenW/sx68+H0XethbkB5e5kWSsF4lB1DSOJid5ToDqjZ6WYXiBLvuftcm9ikNDktaeUB4NlW/dweLSIu4KBp1Y4ZMBVw/c7kMV4H0YLbR0o+xKRP26Ul0ahCLXKyBlCEnjIP3QC43jAm0vZNt1N0wDtOhMg7VmCXdaMO0lZ/FSX2VoLjelWIqSvAA06R+evCQPZ25ck+sw50P2WLVMCLHxvpf8YP8MUwAWZAWrs0l+u2GUa0nN0kmIWtx0MX7CVK7bFMNLswwO+bQtkeiXHc8/1cPV+unp3YQs8D0RS8IZHr5uTLNtJtDdv8mJTKztMLRpNMsnp5BK7wDk33T6OmQvc7L6Ib8NGedaErNl24z9wPWhNPFWM/i5Krc6ujz9owQmAO5SZTJPX6nzQFNI6Ts+Wd/8lXgbCkK0fzihBvmJXyteXgir0Yq/bzIzfEtASztGGzCfCEncSm4qim+LQw0+3eFRViHnSH5e76hje/DNKsNuC9n6cT0Cv8ayOBOb0APngNVwLCLr8JdjnVPPoftxBsR7MfQVo5Za7IA1F8ver3SDEiljoER51ULPIQxj25X2Tv1KFxrhVB2TUhaVJtQDZCG6ApOutceGpjDjjQhquT5qg77ItycdxzeBRlbCpOowJsq088b8Mkrm9j3qKGn1IxbTDbO/gd+RKDmVbttspZA/Qq0sORhQbduH63Vk7Fk9EKUW7jN+f0cePcSUpkzg+sA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(86362001)(82740400003)(6666004)(41300700001)(82310400005)(316002)(6916009)(26005)(54906003)(5660300002)(40460700003)(40480700001)(81166007)(8936002)(356005)(4326008)(478600001)(44832011)(36756003)(8676002)(70586007)(83380400001)(70206006)(47076005)(186003)(2906002)(2616005)(36860700001)(1076003)(336012)(426003)(36900700001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 05:18:40.8765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778aa314-5852-448f-a47f-08dab19162a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdxrfsUP6nED/zfysmsCMikfXA6TwUZeHS/9AXlHEgs=;
 b=M/Iifs34CQ7BBNdscwNSnBVuICoTJV6gW7+6JNBQKJVVNAhAkQ3Uu80BN2nNWpkgX4ruEuVx+NK+jBAyGOcL3fF1g9GMsGkVmSx3PfcebPoTG4jclidxK/zH9AdG7Mk0GRj948aHSuZLEJPkwUWN5qbOr0OuZ1mkDE2XZjJ3y6Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=M/Iifs34
Subject: [Buildroot] [PATCH v1 2/3] configs/zynq_microzed_defconfig: bump to
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

This patch bumps the microzed to Xilinx release 2022.2.

Xilinx 2022.2 includes:
- U-Boot 2022.01 bug fixes
- Linux bump to Linux 5.15.36 with bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 10a4f4095f..8115a34ab2 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
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
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/microzed/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
