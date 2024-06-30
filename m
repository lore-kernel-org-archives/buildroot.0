Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A97C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 12:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9C540714;
	Sun, 30 Jun 2024 12:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6RZ3F83j777; Sun, 30 Jun 2024 12:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63289406A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63289406A2;
	Sun, 30 Jun 2024 12:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1B61BF386
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 12:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87930605E0
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 12:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlRdr6l4PNDp for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 12:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::601;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B272600CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B272600CD
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B272600CD
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 12:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6aYoanF7xLAez5GY5VAFiF7nVplLd2B+zKKbBBd9kk44rMyLgoW6QN/ZWziod0sWkW7AxNYso33e88ds6Pn0jZSJpFk/MCN2LZ36jLtpsGcG5fibuOfU0kjtuFrRCJiqrx8Q3NLaQsQBVs9njtW4SHs0xwIsJYpnMLHQKqPXllT7VjlzeWIuWl5Xp/pAbPA6maFwP9pK2MSw19vkoU4nP69XsXas5j2Gzwkq7ry4RGHK0doQOvTDcD9FFPLwvvjJZTmwfSJizSbOhmyTRGxAm5D0aBTe6C+Qpwkw4M1MpB1tDwELHnxA3RpTUQK7l64BVHbatBPaH1XYXF+St51VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTNpOWFhofSY8yI6/ftRTq7zRM9juRfEqw88/756bFE=;
 b=gVD/S+/Qfeb7706iedg20JbI4Bjy32+MXPbSpK388UDYnaEaKnmV7T+jO0hhBcVWYjGMS53V0WcCTZ3CUrcfSKfMzI/+4/Dj1RTk2h0SmjLoyl0fTBrso9z+4sWW5ZMAPjH1WGZ7J1v4KsDrOYGxQvQmzTblvhBLMqHAx1qwms0wwHqGisk8/Gqbcx354zDlcvSNPmlZO/lPiXrRl/IJUEuWhjJrij+mbtHAmqgHX8xW2g33L5WWev85S7VB2CUZhg8rn3TtDLpPfMkdXTL95tR/x06dXuFKnVIjnEYISN4aTAMMVNlvvCjBVQxGgT7RKTJrOYrYGSueQXeZXdicog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW3PR05CA0021.namprd05.prod.outlook.com (2603:10b6:303:2b::26)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Sun, 30 Jun
 2024 12:36:33 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:2b:cafe::e1) by MW3PR05CA0021.outlook.office365.com
 (2603:10b6:303:2b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.18 via Frontend
 Transport; Sun, 30 Jun 2024 12:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.1 via Frontend Transport; Sun, 30 Jun 2024 12:36:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:36:31 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 30 Jun 2024 07:36:30 -0500
To: <buildroot@buildroot.org>
Date: Sun, 30 Jun 2024 13:36:22 +0100
Message-ID: <20240630123622.3355670-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b062d96-eaee-4696-0bd8-08dc990145ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0qzMr4pTxGL4KNB7hIRWRaYUWAKnRIBfkQ7zN/NrU+xeyFrBdqRDHrwS2Oky?=
 =?us-ascii?Q?Gf+3+Rvs1K6ZCiwSIXLDaVZkC9nDbUBD+UF0Ynwpfigs6Y56gEubNNysXDlZ?=
 =?us-ascii?Q?Dl8ahTrw5F20eqFTSlaU/SiHfvQRitGIv2YQU9OiDSUHvRX4HBP5zBUz/N2S?=
 =?us-ascii?Q?3OCIW9Kc2/SJCM8xLNZDwZr7wysrzdpi2sIWwRJMOBQKzCRPeEHzAmhMkF7v?=
 =?us-ascii?Q?fyMF3f7EzqzFyLSiO1QRLZwQp4PoRYduc5OSiPP4orAjAJzkVwclkbNoa69l?=
 =?us-ascii?Q?HKG5AkAI9Ruo426a1rJvXsNt4fJS0wodsoqTrNpE4qrltOt64naJi4jgU64L?=
 =?us-ascii?Q?TwvuGEtzh5yhNcZrA8SFijWS3uz5WfxnNzuWkqwTa+ystnkn5XhmsUv0+Ft6?=
 =?us-ascii?Q?Mh9P/Qd1mxw5jX68Llezt3PFy7pY1iYjEcHRAp/ByG1GgYwQ7HT/TNGjFKRP?=
 =?us-ascii?Q?CJKUhrml5E0TXZE2lpcgDWS8Lq2jWuv0Me6VO2//ZVuGBBaZXEbtd7VJWdRd?=
 =?us-ascii?Q?PkDxYHMYg6/hhnS0mQ/wjsaqlvxUZW4pJdFAKWL3cqIvi9uOhEcPPOvdzK7H?=
 =?us-ascii?Q?shsyranqW1/sv5aq0YYJInWsAfKZFh1OPlX55XgysUWNnwkOJIvqFM+JME8v?=
 =?us-ascii?Q?s5JIvym4x2hGsL8O1YscqICMVkwGMPnoNJq+olXrK3d72lkx54d/1/0LCHHu?=
 =?us-ascii?Q?8GJJPqSRhyiCKleuHJ7qbO9k12fXINs79K86Nq0OAOZkYhE2Yvm8mhsq35ip?=
 =?us-ascii?Q?ztWbsZdD7TDMSUSv5GYw4TWvfKM24hcBCyhWSTVlbM1DMjA7Pe18nz2rfSal?=
 =?us-ascii?Q?jLSpF2500uv49G9vgRjNvhF9WFrMNqblUy3gsHPdmbMBGT/7xgRPp8z12PSZ?=
 =?us-ascii?Q?Hu7GuUk+9nqNpwB7D4uBykP2B68pPZvJ7Ysun0Efo0Gs/Yz65GDISeOidscq?=
 =?us-ascii?Q?C/uK3HXMJobuGEDtL6qllhrpTaDxgl7Qu6qcIbZDRkZPtHIfOxGhp6SO8u0a?=
 =?us-ascii?Q?8/vmfeE5jCatd5P0JkSfFw2lx1Xqe49YEKUxIGTPi7Ni5pEQS6yAC8b27gdl?=
 =?us-ascii?Q?K9ehdGUvuHpV6IVofctelCAVbJQ8htNLKluu6MW2byet5FwbjPY5kE+0mvjU?=
 =?us-ascii?Q?yNp7Kf42VWj/q0D5AlBIMbkU/jz6ZDRpwq9aWSHtuJ0rtMWVd5VoGgQIWEBu?=
 =?us-ascii?Q?SISH0Vw+N8KLDR2txdPJ1m21mE72dCiNmgPm+UP0EKeksFFe+lRERJytoTns?=
 =?us-ascii?Q?SaCRBjZMB+ybwk59386GW+a7U9oHM9AJ6fyMQkEB1C9A5pJlrvTVbegCkQrr?=
 =?us-ascii?Q?wGsaFwqZcKduArIS2ztTID2c/m9+a/k4rknvsn8kO2i0XE12sWysLVQenMPH?=
 =?us-ascii?Q?5E8e7ZzwbBi0iG+SmQiOrFODeZTc+LQraJsKy4DkcWgecu3CE7IHH5og35qx?=
 =?us-ascii?Q?haT1hE/5szJu4XCjToWK95SUnYCQuY2hl4SBaNWhukX3FeoAjF11Xw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:36:32.2042 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b062d96-eaee-4696-0bd8-08dc990145ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTNpOWFhofSY8yI6/ftRTq7zRM9juRfEqw88/756bFE=;
 b=bCdUKsH64WO3nIhVKQURH1ngfQ3ZJx7AdvZ5w9YG5E5piX2ejB10OTJoy/wlnco76obwTHDQJ0qhb2HPcmwweTe+chI2aYtHJu/fu9EMa21qBMvlDz5RN9xDip8RfV/QOT7jQ5hAzOu5zIKNfbYjbtlk/Tppa5dmWaNCQ2ccdKM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bCdUKsH6
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: fix comment typo
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Correct the spelling of the word 'there' in the comment.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index eb78ed10cd..0ebafd6a4c 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -18,7 +18,7 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 # We need the *.pdi glob, because the file has different names for the
-# different boards, but htere is only one, and it has to be named
+# different boards, but there is only one, and it has to be named
 # vpl_gen_fixed.pdi when installed.
 define XILINX_PREBUILT_INSTALL_VERSAL
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
