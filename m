Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6865C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 09:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7466F81B10;
	Mon, 17 Oct 2022 09:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7466F81B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTkVdk5Ao41m; Mon, 17 Oct 2022 09:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FBF681756;
	Mon, 17 Oct 2022 09:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FBF681756
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19E881BF3D0
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 09:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F33FF4170D
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 09:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F33FF4170D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4CZO9hjXwNU for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 09:44:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E75E140321
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E75E140321
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZVlEJ256ewAMGEZzqAtregDc512tZ1PeIs42w747OgaYTtrjzaHmtejdlKQtNZw+2hIis3+pdSXIf2h+oe1iWfBYbLWIEOj49VXIn+PURuyFa3m3Z92FiSf2Fvv+mDHNt3ppIXUM66xhIaJlvzeZhOoyo3faNrX71BkaSdqYRhaRBWN/yLRl7Zhzj8ubySF4r/Up96qOXlwP52osSPOCbkiHjZUxdATTEKBXGMhsaeW//OlxTm3vmV9r7K0KneUyhNCmJ9y0xX7FGO0mdiPdI/bDFtxdiB/Uf0oATgkh6fx49y36evBmG/COproRAr6sVLAMMzocTfMPiekiS49uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfTympskiE/Yq+kBmz/tKY6s9G4CP4Q7DuCGCWpHd5I=;
 b=IVL+XLLX2G6c/WpCOdqjhgdkAf+GIux1qTbE+QoEJvyhZKk8VE4tkZxyxex9s/m7uRkE4KLeTSjrCV7kki9VAWKgsdWNzh7wZ+B8ScN23FBmFsOOrvz9ffxQWRs970T0xXQc0stSpSklFKiqW39oHiksoadpIhSYKPyRo4cgGg5kq0AYC637CFDZJxyhqdYS13Arlbd/uvqJZmzhrJIrladJTZtXJW5942AxlitnIeuWCwNIYEKwP/NyNifmT/2W3++3zoLSyeucCSGy44AnPn16ukgAmV4Cq03LUy4kEBUzdXUMvlpX0vtPIzeqTtqUd52yGaoFBuFA0s6pWU3ddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW2PR16CA0045.namprd16.prod.outlook.com (2603:10b6:907:1::22)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:44:35 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::4a) by MW2PR16CA0045.outlook.office365.com
 (2603:10b6:907:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 17 Oct 2022 09:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 09:44:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 04:44:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 04:44:34 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 17 Oct 2022 04:44:33 -0500
To: <buildroot@buildroot.org>
Date: Mon, 17 Oct 2022 03:44:29 -0600
Message-ID: <20221017094429.4752-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT007:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 12dccc08-f57b-4dab-a0cd-08dab0243375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K6tYxOFpsEHyWoDFKPZJ51MwuQrPxxUhzaN4tl+M8Oe1utUXBx0Cww58QvAmFaJoAJa+Iz52mCpdx4lGUUenJDDs6h720smcDFHXupIcyePlSebGJCYMh83KmpKzExQXktm75e41Bmsmw5fssI8BlyvZfsk8ySMheEk+MkF8wDYKwxEBeAXD5i34Z1AR2U7PzdFE3XRMSQFmB68nkwP/MPvWYLH5Z+7ugP+mK6RaB490b4Bx4iGmX+KXdLWOtPK9t9nen/hOt21c+D9CGXfqFpl4bko9iz8jPGxLTGKqSbK1ZsQax9V8uF9MUTLqP7YyKpGYS85tXVbLP0y8+Hzc60IGpWn6mJvVuxRJf6Yne/lxY/aEGoFTkvOlx93d9PupHQywE9tw9NxBWtZ4XkSKu7nCqfP4q5SzMA/h5gZEasOpPBTjKavBYFiv56sN6nHt02rdSfCwYi8sxoZNHQJzDOZ6Eq/sd4VlL2RVIn3Mp81XYg2tccHfwrad6gA60XU0Et0iaiTDaHD239oa4x0ZiJqNvzCvntCV+mIMyaRcwDZ+1AD+i95sMRKFQC4KwLOtVJd9nfNkchdXjDmROvH9S+rXtNeqOeRrwsst1ByNTglMjeo7riUS3sxBDRraIOipul4io/tz7VRqJd/hsK4AApjXbel7s8PMhnZsq6uhQyWSJhKpSRRgFiEO+F5Fw8tQbj7CvTXBnsyRikcoxdkVbwg3cgag+Ppxi7Bif3XTzfS1KU+ViqqstBR+O5sn3ORLVeD7San1IelB2y4z5vuCNpYcIcOQy8YrkRgWM3TR+qXyEe+BEO+i3Xu8ddsCY2fqljM9b30Qoi0hTjkuLlJP4k+U5vjIJTXTOfdLWOqZJVs3VsnWEiBmCaykqSY4StN5CqU6wH9Md3UsJL8Tv0Gxgg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(54906003)(5660300002)(44832011)(70206006)(70586007)(6916009)(316002)(478600001)(41300700001)(4326008)(8676002)(26005)(1076003)(2906002)(186003)(966005)(8936002)(336012)(2616005)(83380400001)(82740400003)(36756003)(356005)(81166007)(82310400005)(426003)(47076005)(6666004)(36860700001)(40480700001)(86362001)(40460700003)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:44:35.3442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dccc08-f57b-4dab-a0cd-08dab0243375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfTympskiE/Yq+kBmz/tKY6s9G4CP4Q7DuCGCWpHd5I=;
 b=m7sWYw1ZOzohWE+StlOT5GUh+SRkKKJ+vq0OJOjPk+9IVXJkAwcls6NurAWVYl1WZ4IzpYWFcJzFzA/aKaO6A5sNl2KmyyVf06UU+rKQa2SUACVHN38vLUNmcBIJxuCvMUUVfYhJoRR2kd3yG03i7poofIab79vtQHKCsnT7Hlc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=m7sWYw1Z
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig: fix
 pmufw sw reset
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
Cc: luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>,
 kris.chaplin@amd.com, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch will solve the problem of the pmufw built by the
zynqmp-pmufw-builder where soft resets crash for the kv260.
Details of the issue can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Please note that this is a temporary solution as the kv260
pmufw is not yet available on the Xilinx github. This is expected
in the coming months.  The nealfrager github uses the same
licensing terms as the Xilinx github regarding the distribution of
zynqmp pmufw binary files.

https://github.com/Xilinx/ubuntu-firmware/blob/v2022.1_22.04_1/LICENSE
https://github.com/nealfrager/buildroot-firmware/blob/v2022.1/LICENSE

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 4700e651dc..25bab4cbb4 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -30,7 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.1/kv260/kv260_pmufw.bin"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
