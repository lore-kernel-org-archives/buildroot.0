Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB69CDB482
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 09:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE67E61068;
	Wed, 18 Oct 2023 09:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE67E61068
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RS-7DTu1JYF3; Wed, 18 Oct 2023 09:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0BD661074;
	Wed, 18 Oct 2023 09:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0BD661074
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24DA41BF5F6
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFBAF40439
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFBAF40439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EI3HOmQ4zcQm for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 09:10:13 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A94B9402E6
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 09:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A94B9402E6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZk1M+I5fjIgXQUGXrVVhEOns7I9MLTVnXBq88WYxPVGCpYCsy3zJxKouVQNhMpSNfUsDS3zS8xAj+YFkNt4/s7bp8u687TR0arAd324a6ml6y6ccpB1Q4N7pLAhmjMaSuxui9l8R2p9rPv+VSPHcrX2Zgjeujk/Z1bTqVZq965lqSROHU82kjLyA/XxNWmz2geexStIdMi/bNiz6JoeAbsc+xiY5t1aaWf6K8/wYPBXKIaPGUhvalvoibiued0pYMdNcAck1lFiIVTOqW5nx5HcKIyFptPpFNHEbivi0iIUyW4bOd8GJ+bc6DVkxhj7eNHuv9jndq3begKKScccuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkA6NSABNDQOP+bhdS2bTp3QQNkZgGnIE5jfzIhbQcc=;
 b=Gm81WfNQOITyc83HLyxoUP4+M71CASZcCkSmHgRIuQ1yTaOgfYviF/iOgQ9yiPfJfktZQfs1ttxwqBx9rmCF7PPXkcllQqEM0hzmBwSNz3IzCIN6I4HcpPITrTM9bNFnQNzL893qKd9V7r8LwBemNkGjhMUlL/a1h8ail1L7bwRRr5UZ4khE7og5mrJGD1+g7OTqN3UP4YnySSgTqmfgBoh3Blnbixv6xzmXcoocKzJ6agNmqBP/lCm3PgNbSbU7rmTVEN+QEKbDu2yRJww8f1LGhifvZrNaKu3LccIAT3vTBqrfjs4WNk4q6yq5ONvHNRUDZfPxjX8Au/XDuarHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BL0PR02CA0125.namprd02.prod.outlook.com (2603:10b6:208:35::30)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 09:10:10 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::15) by BL0PR02CA0125.outlook.office365.com
 (2603:10b6:208:35::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 09:10:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 09:10:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 04:10:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 04:10:08 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 04:10:07 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 10:10:00 +0100
Message-ID: <20231018091002.2162735-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SA3PR12MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 7340711e-0e4c-4e5f-e36b-08dbcfba0751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FajvBWppoz67ManD+qdO8qVE/K21jZN/4bkiS9z5j7eAgeX6OFt5idXXHWDZWLog1RtAebHh2uvtK1R9qxeAwm8QHg6tgPA5H8SoF8FnHSWbwx6gpBTS9bzbu6gHI2qJLmgXI/GMQS7P484YTj/DDIN5X6gAZYzrAL+OsN9eVJ3RIFu4Nl6+dNmU8J5sI5SLiyzc3PumuLtBWgpqzGKgK1B+4oMZQaYtHSuB6Q8qYyGksDaKoIcOeLJ9m+J6l1wN2o1nbCP3Z1qskbj2vKKO9eD7VzP8UJvZlravW1DrKNlc3/1GfcgbABPaXgmp7F00NWtZ2BujtMD6qzzEMxblWePptMqgnojFKJPX/EeGMmGNhdS/rgTG6S0ckscHc2RMO+jGtcaXzpMJa2MuurnkRCFQl+RZ8tfqBw0/6ienbOV82Y+9xdyVq3TJZy/XrnQztahOG2dgrd735FEEirtg/ZORiXZ1vip6BHVB13oZP+wEcjPp2w9nubLqhynB1SHh4EKgUpgz6dO1aHzWl9PD/5p+E6JHZmH/jygRsKdprbBLNUx/ZskkfPDC0TQu2HXeHJ7isCJ1sv9A7kYkPQIgOQv8Q5YcAfKjij8BFFRgXhV3n2HgDw4dA7oes76G5z4Z6bf7c+VXZOs0Xc2PqOV4UwuMBba/UmVqGwNqQqLO2KdPpEZTxOkLZ65TShaimJIi5DXU2X2n7Ofmq7IcBKljaj6y0MCGric+6UkhjueXUedBXoTnVmEaaVrGo7Sf8/kT3fpl5uPCM9B4mtpU3p4UZg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(1800799009)(451199024)(82310400011)(64100799003)(186009)(46966006)(36840700001)(40470700004)(40480700001)(44832011)(4326008)(8676002)(5660300002)(41300700001)(8936002)(2906002)(86362001)(40460700003)(36756003)(356005)(82740400003)(26005)(478600001)(2616005)(1076003)(426003)(336012)(316002)(83380400001)(81166007)(6666004)(36860700001)(6916009)(54906003)(47076005)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 09:10:09.6262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7340711e-0e4c-4e5f-e36b-08dbcfba0751
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkA6NSABNDQOP+bhdS2bTp3QQNkZgGnIE5jfzIhbQcc=;
 b=zK/toGqxXxw916SuXzQaOUtc+td/pfURLHiceZ/rg4VR43P4Ga3dKY66NmHWN2KXSB1NyoskseA6ohePkr+TVHul0EK7c4GBot+gezwiLoPFGLFNhD5YWYwpowO+U+i2LU0nycfhpYvOuMxC09WuoTnGn7/bll7KxGFJrABoKHk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zK/toGqx
Subject: [Buildroot] [PATCH v1 1/3] configs/zynq_zc706_defconfig: bump to
 xilinx-v2023.2
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

This patch bumps the zynq_zc706_defconfig to xilinx-v2023.2 which includes
the following updates:

- Linux v6.1.30
- U-Boot v2023.01 with additional bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 55e4d8ea23..3489f864e1 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
