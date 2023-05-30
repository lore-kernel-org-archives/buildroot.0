Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78944C77B73
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 07:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E33ED41887;
	Tue, 30 May 2023 07:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E33ED41887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDd_YM0yqaAp; Tue, 30 May 2023 07:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86CD44187A;
	Tue, 30 May 2023 07:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86CD44187A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5781BF376
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5302D405FD
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5302D405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id th9iPKRP4guu for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 07:16:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 122E04015E
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::604])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 122E04015E
 for <buildroot@buildroot.org>; Tue, 30 May 2023 07:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C69h1jl1UVdSL0IvDXDJTXGnEXd4QcHDWifa2/3YlGyavPXKAUKY2WOPfzucbw/Bj5qUjEyaD5977spiXtIG8dvlkUQUCX8O0L5UnTQ1RQLzPw591axgTK8i0UPoObEu5ZFmocyIlMY4tKM9EqI5scEG63Blnenq9Gf24hSBNmTcWUu3idzpk0X6QMaCoyy5hMCgqeGb2BR8+OjEeqtDwsYSCPWU120iZjmvwLCLetwlq7clzd2Rkz4d7Dqa4zeUxDrGaqE+AcN6AzAVP86SGuC4NUQd7hkDZZlZP6DjLj86ajGkyPd0Z4dvj3zEgRiDIlTMra86hyu9wS5YINdEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuyKofUkdC9mGj4u+jHkygTSXdF+b2g44cKdvXJ289k=;
 b=hjJHLraAAkWyMLL8LOVZBtyG+7ceT4pnniudYnOThlrSYShEEDLViJGvzxVuxhC9CMClEWp7B+fAEYNLf0kmNkvowxAfsSe8FYWqPus3dH7oGSMBBpUFHUAMtdbA+pKZ/VBxF2tSdEWeB03gOsKjsVmkI5ceB9DhLh5UqyluiBfmp6kSLNjn4FKuqJniqrZAeIbtD9zqI8bgU8A+U7J8DPtqIwpTX35MScym0hByrSeqgSlfd0d+pl7BngroHPo9R5fCHuQNLgECKrXseplHdu92wF1TIp1Wd+Spe+EtLeacTGn8grPpCIm2K7C5aR8WboFioMIvOChBYeqiqOtLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0328.namprd03.prod.outlook.com (2603:10b6:303:dd::33)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 07:16:04 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::4e) by MW4PR03CA0328.outlook.office365.com
 (2603:10b6:303:dd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 07:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.22 via Frontend Transport; Tue, 30 May 2023 07:16:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 30 May
 2023 02:16:02 -0500
Received: from xirengwts07.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 30 May 2023 02:16:01 -0500
To: <buildroot@buildroot.org>
Date: Tue, 30 May 2023 08:15:57 +0100
Message-ID: <20230530071558.24994-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a05af48-b8d2-498a-6f19-08db60ddba7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZewJciTjkyp0BNbzW2+BaUl1rAESrswycyxvEXcGbmVFhFkg1KqNo6UsJUlquKrdmT5b/JG+ec3HHcw9tg5SusulJQWbv3pVh6rR7rZM54I95yj3gZIVpFkZZjPgAR+JBsTwEzf2wGVHtZZN2bSjKM+WcYC+Tx7EcjqjlePNiyj7mfw/i4l2fEd40ysfZrWMbGrB1n58YjhyamhKhyDkoSip0Ava/aXwb/DQpS0j25n4hGgVaaAuKtlvEUpoPt91EKqOMAR7fcmylL48no8h6QK7kyO9vHsTuGhJCbCzy4FP+bZN76W4FV7r2/ffjJJKYLTNr+pQkk8Ba//5YipyHq6zyR3fxhUwDYJDxhK45hhMcy4GUQY/u+372ky2A33o2PtOCIqwDl1JRfU5ARYhxz+4mjgpa137Ortq5PQTrFQU4VDN1UShlFMeQfgIn7kCFdUwNzeEa63SgEeaa3l2+n7ZanFgl0pF4ppEpQY3j/c9XzwisqYH6+sGHfex9EtTRZo/qIw1aJu5V98RqK/Oq9WfwslZFWulRhkpMcSwt9WAOocvXG1ygRvPzbpXTMcksoz7aY4o0V71quhIsKo+ZO2HN6SjBOWwW6z1NUTiRJD+jjKYu9l5foN4yWafaZ4k8BdYhnMab93vc3korZri7goYl3MvxI5Pgr74BkXVpB14bQtqDy/pOxeJQN4NU1hSiPWAUmRnNeko1WBujWUS8EQXuWxzZ+oX04a0L5gtC5mPWvGDSa88SFI4Yj2IKq/DEE1Qswl0PI7QqQiPKu7A5Cd5BrCJCgdpEQT+Ar6AR8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(86362001)(36756003)(54906003)(478600001)(6916009)(4326008)(316002)(70586007)(70206006)(6666004)(82310400005)(40480700001)(8936002)(8676002)(41300700001)(5660300002)(2906002)(44832011)(82740400003)(81166007)(356005)(2616005)(426003)(336012)(1076003)(26005)(186003)(47076005)(83380400001)(36860700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 07:16:03.4275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a05af48-b8d2-498a-6f19-08db60ddba7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuyKofUkdC9mGj4u+jHkygTSXdF+b2g44cKdvXJ289k=;
 b=2LevLuahbuvqtcVFjRxPvOuXXRn5g361l2CldNHrO1ipxSs7GvseJtePOiim3O8azf7/nWwGyLZcL8JGQD15XFBTOOqe5kYVtyzu+dVM8wEFu/oCRGUBgbsi646wZ+iqLiyHi+rP9CWHcgiPMD5MQ+kncRI+1XSWcf+yi+g9h9k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2LevLuah
Subject: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: bump to
 xilinx-v2023.1
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

This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01
- ATF v2.8
- PMUFW xilinx_v2023.1
- Updated pm_cfg_obj.c from Vitis v2023.1

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/zcu102/pm_cfg_obj.c | 51 ++++----------------------------
 configs/zynqmp_zcu102_defconfig  | 11 +++----
 2 files changed, 11 insertions(+), 51 deletions(-)

diff --git a/board/zynqmp/zcu102/pm_cfg_obj.c b/board/zynqmp/zcu102/pm_cfg_obj.c
index 68557c4cb4..04bfb16e35 100644
--- a/board/zynqmp/zcu102/pm_cfg_obj.c
+++ b/board/zynqmp/zcu102/pm_cfg_obj.c
@@ -30,6 +30,9 @@
 
 #define SUSPEND_TIMEOUT	0xFFFFFFFFU
 
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
 #define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
 #define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
 #define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
@@ -51,7 +54,7 @@ __root const u32 XPm_ConfigObject[] =
 	/* HEADER */
 	2,	/* Number of remaining words in the header */
 	8,	/* Number of sections included in config object */
-	1U,	/* Type of config object as base */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
 	/**********************************************************************/
 	/* MASTER SECTION */
 	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
@@ -81,7 +84,7 @@ __root const u32 XPm_ConfigObject[] =
 
 
 	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
-	49,				/* Number of slaves */
+	38,				/* Number of slaves */
 
 	NODE_OCM_BANK_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
@@ -131,10 +134,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_USB_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_TTC_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -155,18 +154,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_ETH_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_2,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_ETH_3,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -179,14 +166,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SPI_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_SPI_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_I2C_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -195,10 +174,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SD_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SD_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -215,10 +190,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_NAND,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_QSPI,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -227,10 +198,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_CAN_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_CAN_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -263,18 +230,10 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_PCAP,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_RTC,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_VCU,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_PL,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 00b33261b6..da62be8203 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
@@ -15,21 +15,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu102/zcu102_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu102-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
