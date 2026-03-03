Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22406EC142A
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 10:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11C8613AA;
	Tue,  3 Mar 2026 10:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xy-KaDzszOx7; Tue,  3 Mar 2026 10:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877FF6139B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772535524;
	bh=1aRN8/A5JiptISBb4j5QYgsSVbemoESmfmoQhK8GoAA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=sKucsQR0kuY8Oqy48IYNQMkWeqfgbw0ZfN+ptp64zskRmFhspuVEqDz9GmaMLCgY+
	 7zr0MJDMouz3kmBCDIKSj0LKkm4LMEz6qnfOSrbNjJtbV6ZEAH0BctjMyU/N4Su1xB
	 KLolMkwJBtIl0whY0l3uzHwD/iNginH5aTMLrjQL0ffN/ZsUEV+DX2T7NSQ0RLZ0kY
	 ZG3TObyopq3AVRb8ZjHyXJgvG0jpuZwnjamJHtpV1Qg/y7/U3u3Yc38M958pAyoWGF
	 xcTAfpvniE4mfl36mVjORrJqXGjXSUBrDWxsjtbH0W8cGBT/XEHqIbZJLy2USnXiJn
	 9K91FOK2D6yNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 877FF6139B;
	Tue,  3 Mar 2026 10:58:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B654625B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7BB76139B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZDmjqCA03aJ for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 10:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 43E906137E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43E906137E
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43E906137E
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sq1aKHbpVwZ6AtI/C0HirsOn7VSOQB/cOsoJp+CeFTBOopzjOPtVwXJribtlCfIjtkpLhUv9Alolgn0XwCXN/iwse9WVJNEQPpC2jt0+wS0SbkAK/20Y+FoeEd395miVx9e7tkkyEvsQDtYRQQN78iuwvZiqbLDL3ADNhta0Ng3Dm+w3sF6fbGUZlObyXUmct83ssrJEvc0bv00IaydZbAws2JiTCbMX34iMwfKerSZU1Nvb/IqVTIkFbmPkH12dUX9yeb15RoCD8E6mYeZX4jzI2DgDDUNrEmcYR/bc+HY/3zuXCCiUSGbagOKe5Cv9Vqitc+bdCZZVlsj5dFPLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WT74iWkWtvZzot3rCqPxKddBUzx0Eyf3YE+PW7c1OZo=;
 b=LvmpSE21uXumgXoAGK71fgyoWyogZWcsFzV4l84aky9b3rRJPI6XK4jDHmpJZRzM9VbyJmw+JMAL+XUoyUv1VkcLDbrdFib62UILsD7dVfSCNNV4IhcCedZhbt91yfyytqB5DWV62shOhjzdn33XP9XZa1wyVwBwo4ZAS1VdtNo10rpHCfOwscI849eicxpk2ixpRVVYvEK6iiMIU/O9BQ+C4+NIqJ95pzCTeNKc6eDw5Vn2Ld0YUY+K0064y/bkh+f6wAnUzAvGI8BS0Xwvo2jBfD36kzL4YCHLtD7NdLV2du4cNRUyyGnpo+yzx/IVojVS2a2gt8Y1LS277xUkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::12)
 by SJ2PR12MB9209.namprd12.prod.outlook.com (2603:10b6:a03:558::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:58:33 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::1b) by SJ0P220CA0005.outlook.office365.com
 (2603:10b6:a03:41b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 10:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 10:58:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 3 Mar
 2026 04:58:31 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Mar
 2026 04:58:31 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 04:58:29 -0600
To: <buildroot@buildroot.org>
Date: Tue, 3 Mar 2026 10:58:24 +0000
Message-ID: <20260303105825.1234428-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260303105825.1234428-1-neal.frager@amd.com>
References: <20260303105825.1234428-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SJ2PR12MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4c45cd-ffe6-4578-8115-08de7913cf95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|7142099003|41080700001;
X-Microsoft-Antispam-Message-Info: LjbQHa4Fnc9LZFpcOa6p+lUxV2ycXdwF49eTT82pCMKLdIT07yOPf+o50bIofZUjFO6eMkrqic5MN1WrzpZpOYQawUA65NHPvcX5xACpBOi/1JkNJNxPTjHMCLpcqg4cexXXgD/tvlmavy2lrqqvKfOr4RcX1+EWGieeCsBaNztviSV8JK7VRXYABb5uZRE5zppasLGcCyJH61E9WipdjSbJWMxKxm8Rq1at9K477mdm1xFvA3iOTHbemicrpwMYEklfOxtUMg2cHLzrMH6+R4Zwrx+b/M+mLIV4KHU0VCdKHE3XDe+cQUf9y4yW8TG0UlEOxW9J2xvZYsGA1tqiycWwUZXqW/46SFpD8SLuYDiQEeGqMLl1C7ZU+IQlV1570FufH4lsxBZfeaSpH9TS6DJfBvij//Fo3iOuXnluyzpHQWGXDNBOza24s7fugXOfy7lb6SadZz9s6mtCk6CFakN5SuB3IXXLR1BNKn8RTe+vNzgD/+aK9K91DZ+2fGesSDgvC+ttSyzmZU5JSTsAq69VHk9Eni942oXzxOgbhotMvC9y03YekNZaFI/UYZ+Oz4ySSWFKOrxbb76sgJMwS21tFALG2SgcpSAHDjuzxqgWFrmLhRtJvNJoUG1XYzh8bCczZVkelEvsy9qI7t5o9nWjoIejg8BQFBa0QGLhqiIVvxRNg9QyXlOZhblSHq+8G1YDHx9+PPSvv5JGApFFVjUp7P4Ao5AgKrnDINF87iZ34MvBKVnn94KHB1brU6vXuqpNSwzvRi4HXHyfmD4ushqR+AS00hMgEgJeMyly2EpGL6kH3i8utyHUu/mPmtmGvpGGl87XqZjgTTPctc15BfUyvv9tE+6yvNIGOYj4okE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(7142099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fMfnK9f8hbe155DS6rOZR08BKahOAKu2jtoWFX1YJw+yEXMO50reNrIoPB3TdufICpfW68EAxUWqZYB2dvc3iK+RgVq99DWGs4bgHaExZ7NjNNjuTnIX09l3L5W8hbENsFJG01xSbdt0dA/LYqCL/j+6Yty6LBQrlcMfAYrKmVe6XrlbBibddGDJvy9CJdweZgcwyoPybYtkp7AUOqRU+AKtu/W1dM3oiJhfwujJKtdfghcMqJ1k3Ay3wq7yzVT8iV0UjYmxDO0ahfA1TuNRuQrMG+kDwZtZzQK8dnXM0s/6NuehxTxQBUN1t6e7YEm9X8DwAkirnyktyHpVs653PGZ/RiEZbkujevOzq0UnuMO3qqsz/XuFzbzr1RQAtKCVu6lRgfjX4eNVPx73UN1zLIlTnhXSxJ/MPc1+Q2Gi9+vupTPTKbrdJktvpWIKIwRb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:58:32.5855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4c45cd-ffe6-4578-8115-08de7913cf95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WT74iWkWtvZzot3rCqPxKddBUzx0Eyf3YE+PW7c1OZo=;
 b=kKpB4MzueUKWbk3d5TcJUS2E6JTDiFYeJkVVCvAsh7jjP2P8nMoQKsajV+3n2PYqcXtvKA+QCouYHsJn4+IAMmsdlJb61a0gqNZTQr4pLkaGHcBOb1sc2w+vG3QFlRTaXXhw9c1f1TRCrwa4zzMuDnLjmVwAvToEIpR2Kyluj4I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kKpB4Mzu
Subject: [Buildroot] [PATCH v1 2/2] board/xilinx/arm-trusted-firmware.hash:
 add license file hashes
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
Cc: kory.maincent@bootlin.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that custom arm-trusted-firmware versions can specify license files, add
license file hashes for the Xilinx custom arm-trusted-firmware version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 429f610a56..88e212d76d 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256  ea59fbfb702857a24f96ee8e9cf04f997942db1de98f8406b7daf9dcc8f4e9ea  xlnx_rebase_v2.12_2025.2.tar.gz
+
+# Locally calculated
+sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
