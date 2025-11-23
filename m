Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2556CFC518
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 17:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D4E460DCD;
	Sun, 23 Nov 2025 17:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akOd0COg4Ybf; Sun, 23 Nov 2025 17:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88865606FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88865606FD;
	Sun, 23 Nov 2025 17:25:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F6434E
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7745840330
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_16_1CAJblQ for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 17:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D12940028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D12940028
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D12940028
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sduEyRNpx+9TPci7a3N0IeWGlJ91EcqsZHu24UuxSMntmRxB0gDSL7m7DQTjS0aDSdSf6GuZhAVgPyRzZL1MdHQ3aIXMmMyFfLsYqzmGkGRGVWIZQSqLpws3z2z5UK2EaFUmmf64GEtX9187qAas89U0wNniJnM5d5evlYMK8vy+IIkgd0qSb8zvsmdP4A6H2nv8Unodto3OUbusPGPypB5cQ0fuSMZrJ0j+8+ciij9nWHzTaBHftDuHz+i0cojKgdf3e88B99/WsN5gpVLzHrRsveFoeIP+F84DcU8l+Zi9i4eGIhdgt1WPqk6L8x7tXLK1rGqFVDAQduEiJuR/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/uMt+wtUaTHjQGI5H9ut9jkePjaqNgcw45VvK/iV40=;
 b=JKDv+W/vRR2d34peBkhojf0atS3Svmvf9TTOaAlAyb1wt0rsy4G/ZD4f4u45arR94QriahN2Z5RuBSiMXzPnlUt63sfHxClijVDEHJxtCanZgVA/+ymLIGvRBoMsJmsEcThX8CIxB5Ntcqo5HPKX4DxJuwHv4HIDXDh8md+rX6xfGqMbTe9TOe+25a4abmv9Clu0L2JfL86k+kXXArZ6sbwPEAugCQd2dzcUai8skx6gFvQv031LunhbCNRbVofJuB4LpVW+HvT/QgwxjETZiFO6Or8oBIMn9hui+B8TIrJaWSP8Z5Oip/3I6LMI7hgdM+ah0jzBaFtycay2ZuyR1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR05CA0069.namprd05.prod.outlook.com (2603:10b6:610:38::46)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Sun, 23 Nov
 2025 17:25:41 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::3f) by CH2PR05CA0069.outlook.office365.com
 (2603:10b6:610:38::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.8 via Frontend Transport; Sun,
 23 Nov 2025 17:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Sun, 23 Nov 2025 17:25:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sun, 23 Nov
 2025 11:25:40 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 23 Nov
 2025 11:25:39 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 23 Nov 2025 09:25:38 -0800
To: <buildroot@buildroot.org>
Date: Sun, 23 Nov 2025 17:25:27 +0000
Message-ID: <20251123172531.527134-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 20619a6f-9553-49ad-5b95-08de2ab55319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|7416014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hgVlWUyg0jYgwBxtnDABSPcCDjheSLp816q9ay+/idGSecy3mtROQ1QL1YIS?=
 =?us-ascii?Q?JsDVEOZpaHJ5B9RqoYPr5Jx1cUruwQDjNdzrXXo1BJmK7GiS7f1co4t8Z3mh?=
 =?us-ascii?Q?iQ2DcbqZ5Pv6U9zp8rhkj5YxF/G6aHZf3WjuGSgDZtZs+dqqMZ4bJ+cbaZUm?=
 =?us-ascii?Q?FFfT9HiZaooYiLPhxfWTB/zS4KiE4Y7QHfGVD0LQY7DT7Fcy1pjP1z+lSpcZ?=
 =?us-ascii?Q?cY+3nfB06PDbjwp0OxhOcKPTNgWNppgIgaJlgfsQvecBSTUHx/Nt2gHibIY6?=
 =?us-ascii?Q?mQpAyDLnQ+C/SPPN8LZDk755xqPbf7/8s+h5bp8W/28Lq5awvY1U9vRoezsq?=
 =?us-ascii?Q?vBsmMlTJyH0Xsa6bUTPu8tpKQiMEdXo5xejV478wC0Qr9lS1KcEADxmlpLWn?=
 =?us-ascii?Q?124lGtE5qKCvliU6jpPo1AtEfps+tAENzvj3qNPSM6FqUZASlKyKED/CBflO?=
 =?us-ascii?Q?VbzAlrsBiyzESSaAx/A1/I1wV/IqzV4wZiwog5YwAH9fkyEglsEpji3xWjfb?=
 =?us-ascii?Q?a3pLsoMCvt8nPSZIdTPjPExGCHbVbjHou2+uBeWxtfE7g4kmxEL1TyX7Fl9e?=
 =?us-ascii?Q?1h7QXCqXHdkMNcf9JMbxBwrZxUDtBtyGXgffW+BFBaPdXyKXgAOgM0C+s1ok?=
 =?us-ascii?Q?Rc8H15DSDhMgg0oxBDwpCyh9c972zPXl1rQaAmUeIxi5YEKAul2jN0N2xS47?=
 =?us-ascii?Q?J/aErWgvBDExAQhfq1M1jvJNTbACM2sf+VqAfNiFaYziNPjtzQei2pj1bLoH?=
 =?us-ascii?Q?dokzapQJwja5q+SdmmV9RHP158E3Y/WcFVPkLI3SBWVUIF1GEbTo/NXfJPFG?=
 =?us-ascii?Q?Ch30X5QegU0B/El+Z/PX6+WKCgDYNFkMznDv11Kex8jc4nxisR7IxjbpuiFA?=
 =?us-ascii?Q?6bpBM0MtiI93S6BYPvQoG4/RlbUALRsjyEKiwCvchDSIpmW8Jdcgi/mtOiaL?=
 =?us-ascii?Q?x3u+VU3H76EHad4CX4HnDwTPt9xhFj1r0vRXKH0IO6HD1j1gp6FhRX6wa//7?=
 =?us-ascii?Q?VM+pZLZmwu9dNSPQ6PJckslbvJDYYgt+Mm5bGI4nSzjztSYKcpV1kGpjpe36?=
 =?us-ascii?Q?bx50fUyZ7tAA3wTmHfHT0YgOHZJvRbPtf4btTozY1Di1UAQrFCk6RxLGRX/c?=
 =?us-ascii?Q?CVclS4lbkq4ffU2eov6HQY4GgCev4e6a8eQBdRSUl365couvqDcZX3HLkVWz?=
 =?us-ascii?Q?bucmv1XXso5X/Jt6HTOx/chQ/d3Rh0RLuw0adNJHbdbNOipwWPuC94lRREtt?=
 =?us-ascii?Q?8oPMRLeSlVGG+6nbRM1YBOaIcXZvpOX8RGibgeUERuOjyB6LkuKkKqNWh855?=
 =?us-ascii?Q?bVEe62OwQKv0j+o4GDrE4dlxAgwrSM0LBe7OCKvCNgzxYTgC3Sl7Aq9VE8Qx?=
 =?us-ascii?Q?t57v/oJEM2DUfZbymd454ey7krHK6W6cAOMacuXi4v2WC6JR/NI4lFnp1ILI?=
 =?us-ascii?Q?6aKjyh82hB1cD/rDMPVzk4LXhNOxQi+VH5YJx96EMTnRha39fY9c76o6/+NC?=
 =?us-ascii?Q?YiV94sH13AAofSGM48Ntd+BIDGOBQ8C5RavGozFFTuqyZ3TlIXg1Y0tHKhRq?=
 =?us-ascii?Q?UFHgpI22wL7M/57ifXfCr6eudn7wNGiU/6GUG8Bz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 17:25:40.4255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20619a6f-9553-49ad-5b95-08de2ab55319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/uMt+wtUaTHjQGI5H9ut9jkePjaqNgcw45VvK/iV40=;
 b=uC6N9moNKhroCurngYHY+2d3mxzdvKvz2Q83+C49cbCAISMCFn5I96uYzWGtBOSFOdiMFJDPBvdGJvAQ02u04dtyvsnSNIzVqzNJ6oZtrJhw3YGpvNqiHq2Ffw4bsZ0yQXOk5wnBs3SplBnTa6+zMZV64tvnXmAd8s2ZqzvOFUc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uC6N9moN
Subject: [Buildroot] [PATCH v1 1/5] board/xilinx: add xilinx_v2025.2 hashes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add hashes for xilinx_v2025.2 release tags which include the following:
arm-trusted-firmware v2.12
linux v6.12.40
uboot v2025.01
with all Xilinx downstream commits included with xilinx_v2025.2.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 1 +
 board/xilinx/patches/linux/linux.hash                            | 1 +
 board/xilinx/patches/uboot/uboot.hash                            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index d7bd1e73ef..ef387496b1 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
+sha256  ea59fbfb702857a24f96ee8e9cf04f997942db1de98f8406b7daf9dcc8f4e9ea  xlnx_rebase_v2.12_2025.2.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 994d637d50..3ecbd03a27 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  ea55acf69bead3d4cf121de414cccfbe75a3c36465c93d9500cc00688d9b8d9d  xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz
+sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index 19192b182c..d46063b7b1 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz
+sha256  8819cbebda739436d5d2fbdef578ec3c9b902f7edbe0ce4ed6f0ddf254fcf2a7  xlnx_rebase_v2025.01_2025.2.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
