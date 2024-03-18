Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AF1C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 14:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C9D40308;
	Mon, 18 Mar 2024 14:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9Mm2KVB1lqk; Mon, 18 Mar 2024 14:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C5A94052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5A94052D;
	Mon, 18 Mar 2024 14:03:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EACF1BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 14:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BABE60797
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 14:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5pQaU9UG2yRs for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 14:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::601;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9851607C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9851607C3
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9851607C3
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 14:03:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYL9CeNXc0Mbr76Sm3/5dXy9xqqtebm9DV3TWunFeI6B7XLQZPNEBRd4IkqCpgdkPVpGwCqpdjF53Lb6MvYuPVIWPOwM96fYlY9huorcFwgZ4jjuu5v9U0ehdnw132A6pm3HhiYUBysokhwZyikDJxH5FLrjurmxL7HlZNKH8aKIv3GLbLD4DuwemXFbzT3fiuURnaXNUIA7v3tjtVNbrujUihcRTovikSE7rXgjHl82TP9kGosCJEY8igk1UQIMMkaW2TCb7FYM0f3R6E+MD1BRdhorVp2InzmAShJfeOkKPRTQCSfOvv0KX26qCWExAhPBFzB68a9S/mgeRBb8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRtN32sn/EWpx4zLuc/NwOS7DUV10XuhgJIKgLn7POM=;
 b=Oaxd8nRuetZhS+vm/3pDO9xaktuO3dFXOH2RgBscx+I71HD/U6cMUn18X16A6TKICWI4/eo/5xJJGFi66hLEaMe0JiAW7ME2S7TpfZj8nwyFeOZfOezQpMxX8vs43u9oug21f8zs9z+V0v9zFp1sKOdjKhgBlm2YCkagoym0Lij+axATKw9TBj2r6RbRW/2xT5fy+PPtzOP0ZubqICHZiuwWKO3fa5cBoZhyEdqFqjNFHq2/bVR9wW5Dktb2zdj7PIwIWHyp3Ywk9LexL38X8xv6bJYk1P3qP732o2gOROUnkYC6ODgxtrPdkaCRwv2DBYcPtJJWK7UJAN89pwPwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:b0::21)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 14:03:09 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::f4) by CH0PR03CA0016.outlook.office365.com
 (2603:10b6:610:b0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Mon, 18 Mar 2024 14:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 14:03:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 09:03:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 09:03:05 -0500
To: <buildroot@buildroot.org>
Date: Mon, 18 Mar 2024 14:02:55 +0000
Message-ID: <20240318140258.1083375-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1e6d89-71a0-457b-4fc9-08dc475422de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oOWSnF9Lbkx1zxPD7nOz/TniAKvY29X41eUNO4NRfMPBV1TisuM9oBbTt5haiYTpuhMCgpUWYROSiB4rhnW2LTNepMAh7UkJLqb2hE1FedB+gNXtNkBwvUg8q8QEEkfATUQ4UsgrkpMSCzbcMkb8nuBYMAWPh2FEyI+XClWJwgaccMoskATqSSag1pvY+cMy1pFJ2PkyR2m35Msfd4bEbpF8FuMpTGTB76mgb9R34tVrSYmDEoHDEZS8xjyluoyIV3690jy/5Wxr5L3xxQs+U1Um2L40fceDEnlLjLPpKZUYCqxZXi3aScgJatMuWrrRda8QFzymK8sicLos9kiGK7eqyCwZULzNBSQ78b+AUK2YgX8VcDdEzrkjM6uKqAntXidkC6XHc+2LZqAZoldnopPfEQUL0Y/Bub0VJIiMZNJCa3+rjMDEmkRkJkr58cCiqtjYgr3mq/rEn3gv1mgCKkJ+kR6iSzxPrZ+tTutRcb9uwIqNa/z+wnDHBxRnyqpFICCUG1xDrOyvkF1uOFkpQD16XIkVXqfW6C8+R5whg0FNw55m/RSR2akkU8CjDmIeWBSVmLEzyb6DcqHI1FvE7B5iVPTUBlEzxOkuOUdQ7g71ibaWKShiSif78oGyrz3yILL5w0nu67SsWB+CuQALarftPEqmCGl+67h0YOA/Vq97jFnoTd+jk7E6hoxBTjj5oqwehH6inxRTVB6eXU6CI+K//CMeUpsKhZF91rcnDDwcpRKYooeP7e4hutYgcVNb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:03:06.6962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1e6d89-71a0-457b-4fc9-08dc475422de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRtN32sn/EWpx4zLuc/NwOS7DUV10XuhgJIKgLn7POM=;
 b=pDu9aMtL+LNQ9GVPglc0gwSsaE9ePyYs667WoBwL3WFURX2chZ2EdJnJYrJjSAf9JQrGdNu96V48ZiVAduRClfYVVJz9otvkO+GJ3f8POhfRinjOVMx4A2OIamZw0JcRTvs9VESCyDj8vEFUhku3Bq77Sl2S01uwEuDhgz4AXVY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pDu9aMtL
Subject: [Buildroot] [PATCH v1 1/4] configs/zynq_zc702_defconfig: bump to
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

This patch bumps the zynq_zc702_defconfig to Linux kernel 6.1.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc702_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index e85285a832..7f762abc58 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
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
