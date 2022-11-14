Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56FAC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 13:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466C34098B;
	Mon, 14 Nov 2022 13:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466C34098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rh8Sa22FL9RB; Mon, 14 Nov 2022 13:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E1A34094B;
	Mon, 14 Nov 2022 13:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E1A34094B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 831661BF379
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 13:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E0CA40A07
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 13:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E0CA40A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zoLOAWNs29XG for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 13:51:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6832640347
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6832640347
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 13:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcil2qAHXNnad1fKdok4o5UhFhCZtYXuqFTZRWBedqe4vJgDElD2rTXJc6Zvld+iWrzVGRlqMqVKMaYS9ChCzcutvMkW4NpOpYaE4E5JI4xxTTvAR8CPBKPe5SGicHSqxvvLMI8y8eLoN855KttV2S1yQqkjzBF5scqgsMzuf80CF7CBsx2Xna26tGDJycO6q/EQ8Tp3mqXetOkXYbN5wPlXgRvrcxagirRYWqPHPqpOZW2+MM2NL3SIAoM3Be6xh3/UnmUlzLE7pxGnj6Blrbqq/NmbXIg4Pe1xW5Q6Y4I30sg63W/PeDjNSgqhKptXliLZYwf2kPZalRQYX1g0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uztDFX3TCVrRNNiLiKiPkRngRE879yVmXm6LBymtsRk=;
 b=Tlgicpwyc4LNKwFHgkbOb4Xvu/p0XMvD3mVsE2s9szm1cpGvzltJc0BboIFT8IgHWKrIHNc2CJR2rXIVx2gXj193nLeBR1/nYMXs44u8za66nSOHx6kVo0aTGt2UlJQGIpPoqT8BaXHGMY+VPxpQGTNw7XA89/1BSMUn1Alcn3Md9721mVlR1IIvovyKcEZfD55Jic0P05OktwiJsD/J8aueYqEspBb6oFrd748KfKZSP28iDdfgUuB2bTMohbfz5HY5YO4o7l7apgSe6sKqD5Qf5gHKKsrYDHuMReBBHnAZr9wJTG1Q7wiQ4IF1JAEKrp+eDs1DR3xqAviNFAmprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN6PR17CA0030.namprd17.prod.outlook.com (2603:10b6:405:75::19)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 13:51:31 +0000
Received: from BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::d0) by BN6PR17CA0030.outlook.office365.com
 (2603:10b6:405:75::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Mon, 14 Nov 2022 13:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT092.mail.protection.outlook.com (10.13.176.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 13:51:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 14 Nov
 2022 07:51:29 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 14 Nov 2022 07:51:29 -0600
To: <buildroot@buildroot.org>
Date: Mon, 14 Nov 2022 06:51:26 -0700
Message-ID: <20221114135126.20201-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT092:EE_|MN0PR12MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a89db89-fbdd-4dcc-738a-08dac6475560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nC0haGM39VpwiW9dUcQ3kbrU+o0l2ncW/f5W5OL9ag5JZ/z5NSgEXa4itJGUIkwX8K3N0LH/a3Uhe2Rl5coVBFPEamUoCV8aKLk0952FxhMGbGFpJAp8XdiU9eyA1psYzbF+SRlE1FYEngMKVrfzIaueEO8qCVtkJ1MsiGECwNzDto+53p42k+C7HFyWASjEwFXDcQUjazelRrKA9u7G4icR6QaGarR6xUfVZyXCszKdmZr1uyN8DS8fIbaDEkK4btFJhG8TKen/bCKkGEWrr4Aw2OoHy5h3oUDcGReFvfwBA9NmZ2tbGb/yRP/z3BtKdKp9tupytfbr9HBazqEwvKhv4ZQTJPsNHr+JeDsBnC5XXd407m7vihTdulnDj6GzDgEsVqRjWcXQ5L4ku/zb+h3FRPMU3vpKzaVtnHUyG7JsBqSqL2rZ10PnWPX88nVVDo619CEXaQGIPU74P3eCw0hOG6/PFsUXRnX4f5lvzcnBEEit2o31gjXzNGPnxPvmHQvW7vl8a0oQXI8V9diPeTUCyxeLu6dUo1qAIE8Puc0SIdjoKAF69vg8Vo/MXDGO5P/DZo84XJcULfMUpVdVQqY9t7S6UWmZWi6ESRYf6IzBq7MsF29GhMlwcmAGU55pu8G92i4nrU3tTVtJn89tvNKCmB8W2qy2wI3oqFLEOqDc4pNl4aZI0Q1zvPyH4W/tqgIRNYgPPFdNL+EVnRKjOSJyK5crwhXtLZ6qMKFlWNePQTxQ5KpfwQ0Xl2gWPG3+f689aTs+qQ7IyGncwuQvv0Z5Dk/Q4Eb2gMmeBTep4L3herBCqBF5wyWRyNSbCBCWGE5YHQjVlJZd7G/7v1gDJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(86362001)(2906002)(82740400003)(36860700001)(4744005)(44832011)(8936002)(356005)(83380400001)(81166007)(426003)(336012)(47076005)(1076003)(2616005)(186003)(6916009)(54906003)(316002)(478600001)(82310400005)(40480700001)(40460700003)(966005)(8676002)(70586007)(5660300002)(41300700001)(70206006)(4326008)(26005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 13:51:30.3083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a89db89-fbdd-4dcc-738a-08dac6475560
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uztDFX3TCVrRNNiLiKiPkRngRE879yVmXm6LBymtsRk=;
 b=2/VXrBsQcQX2AABXfkmkQJFHZfIEQ8QV+ttFyJvdAgzrmqEkrPSmu2q4iu45F2lOqs8V4SBYIupVuhcE9D+Xk4zJQ7qkP7YuZHoFW770c1RumwWgWNMz4XqRf13jc6iAIEe0UneH3gGKG6Y+c6bL2gmhb2J+BjJ/2hCLzqPmWs8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2/VXrBsQ
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/kv260/kv260.sh: fix
 u-boot.itb without CONFIG_MULTI_DTB_FIT option
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes the kv260.sh to generate a working u-boot.itb
now that the CONFIG_MULTI_DTB_FIT u-boot option is no longer used.

    Fixes:

      https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/kv260/kv260.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e3467f3068..e891852009 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -8,5 +8,5 @@
 
 UBOOT_DIR=$4
 
-fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
+fdtoverlay -o ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
 ${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
