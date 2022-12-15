Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AEFC4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 11:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C58404021C;
	Thu, 15 Dec 2022 11:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C58404021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQRugzItdsKp; Thu, 15 Dec 2022 11:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 203A540242;
	Thu, 15 Dec 2022 11:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 203A540242
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 747F91BF308
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 11:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4272E81F69
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 11:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4272E81F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLUmqL5ekStj for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 11:18:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5816181ABB
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5816181ABB
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 11:18:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKS/oqQZkR0UCVsjsVTcpuu5+b1lF9Lx2omds2uBipGTnJFtVSzmNBP2Sj30Mt/iOyDPAJ01mFiwi/Ru9EbMLLeACDp49+pcWpelYVdJsteN4a10JszVtRy2bbNcOoy5xEK7Q2aWmYfu4QISXUCIW3+N2Fjzz46U/nxXaYJS51PZdkWIs5KD/VQvoQ7k0cSfE8JzLGxNHzdXgsj0P9QtokF1H8mWKZld7Y0rV/fxM/cM6tCjCnEREoPyUkwWinNpzyMSAWQdDrpUfrdA1rbozAat88Q7dZLoPFfRVk4HeDBjRpoxsbGLeeS/0dCzUMhlUwTU/f+p4KochjXvh+RaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOfVXv5m5sp7S7CM0tEdGRax/O1PtvMmk95wJv5GBxY=;
 b=gRppE2Pt6/2F6bYiGcHp94S3fBWlXBGCvmZmVlyX8r6Xl6YD7QNPclpRFwHHmjRnE3VCq0dENzPSYTU3L8zGM6dbGCWbiuQqwqxv9UWOzjgd1//iCyjOGS93UnARdYugfTpiv15Tej+B7F6nThj+yRIXXy45M+/AU19tB8GXFgkUw1rv3j0XsFKMDIMIZ+weBsI2QIIj0iyKOR/YDFcb6ZGJdoni+xYj7cEUfHBzwQC52RmXkKhtpt2l14mpf7i4cZdtEeUjoug+uyzfYGbNxfQBmSKB9cB6FOtUbc1FHalKmoRBS6RldBekBmSbmZWN3S3BxoxyBZKHKXmuQSP7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:3bb::12)
 by SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 11:18:36 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::55) by DS7PR03CA0067.outlook.office365.com
 (2603:10b6:5:3bb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 11:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 11:18:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 05:18:34 -0600
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 15 Dec 2022 05:18:33 -0600
To: <buildroot@buildroot.org>
Date: Thu, 15 Dec 2022 11:18:31 +0000
Message-ID: <20221215111831.11956-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT015:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df1fef9-7b1e-4db7-bfb9-08dade8e1b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCFFQ/z7NYk5ftB8M9p+J/ua57Gztd6sKm7VD/wV4CDgR+KbxNM3RP+djY34WZAznskUD4xEku5jIVWfaFsihtySh7Y9AqNzrUue+F8JTHauthQGQZ5Gyz7Qj4zHDD1k3+4nCgG341TYzbaOAEn5g90ahH52jUhFhV73LPRrS6WmsnlCDJMI5rpMJgFT620MMoNRx8J09NbeFh5SljmHy0SexsJ181Yd93C7MDJSxnRx4zY/aISKTaS/u23ILBV9DBwXRkDt76+T+YDoFHZOViORP0htdGwe1nue3zhZQ16P9Xg0L/jqFY2bQLfjvi0MTgavfSlWwRuATdOh9XVBM+z6GY5J64ewnPqyKA/Sl/tssXhmQn9Y3MRYM9TIGCB+y+ug0hIauREMVwK7eLTnkD7nNJO5hpNQEpMzC5xoRdQZwe09iQelltW80ResaEL9UDu0AnuPmYUMetUbAUCMg5KAPm1a3uvf8t9p21I+NWRNEof2yxflRllj2VCaXN9erwoVGGA825vM5g1Lc9M10YkFvw56uY9VNR3eckiAMrtjFxDRkXIVwaPDWkhiFoyJI4Uf/l8Ny3fz7Lzs/r/ucXoyNIMKeywGpRQNmrDjmd+f9nLRhyWUQ1Rgqqf5/klJdPrijvgk96wa35sO51W57WfNdnVaVkuuyd4H1DcL5CKtMG3Och0FEx+ErWopEHQGaJvkUOWeq5tC0PQBg6XUr7pa/oFQSNCtlGNA5ATCq7E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(81166007)(44832011)(82740400003)(4744005)(40480700001)(356005)(26005)(41300700001)(4326008)(70206006)(82310400005)(70586007)(36756003)(6916009)(5660300002)(86362001)(316002)(8676002)(8936002)(36860700001)(54906003)(478600001)(426003)(83380400001)(186003)(1076003)(47076005)(336012)(40460700003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 11:18:35.3765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df1fef9-7b1e-4db7-bfb9-08dade8e1b88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOfVXv5m5sp7S7CM0tEdGRax/O1PtvMmk95wJv5GBxY=;
 b=a4X+H6sxLF6nFResDX5cIqeTFUhiFJgOXoid9cDjyzfWKK9ReGLWTD5OsBqiBtxX9u+ByGou0MoXBlQqOlvXfIhm7+N64ncghUqFl1gfWOTgxf+RyDRZTsJYui6eubzDRf3QCSCBVVb7mTD9zbuGK9KzVznvbR0idXls9z6a7d4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=a4X+H6sx
Subject: [Buildroot] [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
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

Reduce the configs in the kria/uboot.fragment to only what is necessary.

This patch has been build and run tested on a kria kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - CONFIG_DTB_RESELECT is no longer removed
---
 board/zynqmp/kria/uboot.fragment | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 9e32edfb36..a6a262a562 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -6,9 +6,5 @@ CONFIG_PHY=y
 CONFIG_PHY_XILINX_ZYNQMP=y
 CONFIG_PINCTRL=y
 CONFIG_PINCONF=y
-CONFIG_POWER_DOMAIN=y
-CONFIG_ZYNQMP_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
-CONFIG_RESET_ZYNQMP=y
 CONFIG_VIDEO_ZYNQMP_DPSUB=y
 CONFIG_SF_DEFAULT_SPEED=40000000
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
