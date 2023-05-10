Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63131C7EE26
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 11:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1636984262;
	Wed, 10 May 2023 11:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1636984262
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBRAcNOWHWwo; Wed, 10 May 2023 11:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D33F8425C;
	Wed, 10 May 2023 11:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D33F8425C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 513E81BF30C
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 11:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBCC361619
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 11:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCC361619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6F0N5Jd6ir5 for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 11:36:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A851961135
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::625])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A851961135
 for <buildroot@buildroot.org>; Wed, 10 May 2023 11:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSU9VI3l2stTaSFR6Gh7aFjGEWuEggvLc7pHH9P66l6kzfUV3SD+w0KljPjmkqgisL9JFeixz3b2SAeZ8dZUg44L5M0h/QSF/ebhArBpckGI72DwUUfYJwaoBDq6HPzKSc59sYP3SVo9c9to+JMibB3ykR+aXzO324Rfs53tfSJfU92let+HqBaVj+xHBLA0haGujBwKnvgp+SPnttBRFS0QIXHx3z7s8zi9howQ67o5gqLd8FT/DcL+V9IdS9glYtozwRwT1FtQilXgIttxoXBatsrYPQW+3n7Clqg8t6DdlzfcltCRyzCSoKB5wQA2r8ks369Vij4/LFl1FN7CUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lAozstSFF2XPoAQO94GiKg/9siwbbNp9hOX6ap37ks=;
 b=M/PcAKRTlR+5mzgeW9paIu0WJLPCIUT97DKAJ6wG4k8qhLA+hpoUVZRbAoHGDO9CL3s3SMokSBn1fxObUdBVmwjhzjaA/7nXkSM7+aKUsDTaBwA0YgXUQp4V2gpHjaHhdsgoAqlnqD+Gnj5yZlu90gS3dOQC53AdOnb4n9Pg0I4PiHxNTSKKx3cduJCB/oBjOJfR0tL6Xdl87aU6TslB1BJEY9ik7m7TFGRMMtGz2r2tPMnQPMqGNsHWHd4IWo/iqvglvUOmM3BccQ5OG5HwDgNLNMYG9naPjOLRwW26RwBnabfWhGgHTwFDvp0lfGFsrECGf3k2b7wh/VG+5kUGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR01CA0001.prod.exchangelabs.com (2603:10b6:5:296::6) by
 PH0PR12MB8029.namprd12.prod.outlook.com (2603:10b6:510:26c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Wed, 10 May 2023 11:36:53 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::5b) by DM6PR01CA0001.outlook.office365.com
 (2603:10b6:5:296::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Wed, 10 May 2023 11:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.18 via Frontend Transport; Wed, 10 May 2023 11:36:53 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 06:36:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 04:36:52 -0700
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 10 May 2023 06:36:51 -0500
To: <buildroot@buildroot.org>
Date: Wed, 10 May 2023 12:36:48 +0100
Message-ID: <20230510113648.52895-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT062:EE_|PH0PR12MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c65cc7-9052-49ef-f403-08db514ada0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DU0OIfF3bj6GRTLieElkqZyG4Akk18JlFb+XIAOCV3L2W4saTUatTD3MokyxfrGx/+r1bvlL+50Xud7C6yCsVdgZuYpV/f8c2Jk89mholb+O6TQ8A977k5xRnzQztGHlHSoE6ZdVNeiwt3LSxWdia7+kFA81lXXAEvEVUcWtWxLWRnazBTGurnBzIy1J5CN9kJTC3Qbiyc+Z5gCilBiwNbcZNXq7mS/QO+fI0VcONjrXCyN5uy1b4rjhrH7NoEqGTxHHx+yzQWXHdwATVq15epYEjKOCJhBifWTfH5wH0ILGE2gsuGRDII54WJvTbTokbjfA4W6C+PZdvUyO5yBRbd+W3weWevT/RJ+5+KrHC3ZXbu2PtTZp/fV2TDB8vDsCTV1gKtFxDkKcADg2sdcsSJCDDVrHaUtVqdqD3CVXncQgbUWrw1VCxxDwN8Iex/0xNkk15rxeRR6CNO15k1hqYZNh6etUDZeagF1rGoJK4N/k0Vc/J0Npyg3NPpVvkZCKoM+PVi3818ZS27UEO/pSg5nRqwwfIMw6k2krTna25HVHSGPPGlNHjN6dsJqYwb+KdcpCC7rPxPrCX98LUhLGW2OLnvthn9CSyMuF++FJD2sCNoPpxLt97IggVu7XQKAeuBwzpNTZUxzkjhqp8+x6H2ARAUFyoc+M4s11/eD4RiDNXB81S0DEIffaCfqHXmUC42reJI2iBKFgPQ8Ath5ZlY0YDjz5Lx372HZKv8GXpZ8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(336012)(186003)(40460700003)(2616005)(2906002)(4744005)(426003)(36756003)(82310400005)(36860700001)(86362001)(82740400003)(40480700001)(356005)(81166007)(47076005)(8936002)(6666004)(8676002)(316002)(41300700001)(5660300002)(54906003)(70586007)(6916009)(478600001)(1076003)(70206006)(4326008)(26005)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 11:36:53.0053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c65cc7-9052-49ef-f403-08db514ada0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8029
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lAozstSFF2XPoAQO94GiKg/9siwbbNp9hOX6ap37ks=;
 b=WJZF+m4He8JM3WM0vlJiBBNxqxN7BTmqJW/Hkew2Qn6Bgh1oAUy+Wl2+FrFpfM68ENP/7XYCFuLqojVZvKsS5C2W4KJKULRM+mlqerGpMuM8nNWBn1Tw093wE2XD3tTQxKg3u6w9LTQT98fPU/0Ltdwx9v91lgq8uHeZEXxyJzM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WJZF+m4H
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: set
 BR2_cortex_a72
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The versal vc1902 on the vck190 evaluation board has an ARM Cortex A72 core.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 2808fa522b..a393b681c8 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,4 +1,5 @@
 BR2_aarch64=y
+BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
