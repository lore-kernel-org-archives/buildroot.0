Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A2DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 14:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E24F740B8A;
	Wed, 14 Dec 2022 14:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E24F740B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qzy-dJETrDi0; Wed, 14 Dec 2022 14:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29FE140B86;
	Wed, 14 Dec 2022 14:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29FE140B86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31AA21BF470
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 194A960672
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194A960672
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZuSrhsOWlIxl for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 14:57:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45FC160670
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45FC160670
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeYPFULbGXlH6/Sw9DVEl/sNTQH+geptxp5g8XKQsc9sRo0g2Kq+BuYuggf51/S2SzNPIK6lvZ/2L/LSAC74K9HQaICqkkzTzVXddRwTNAKlWzG6QoQCSwIrFwFd6gGUQMQ1kAhaC836iVU3mN3xojln8C7HcfQvh91RPRXbTK0nIurcLzw61a2n+ryPVpIaHrigP5hGJ4yw3jKHMWjy4sW8xVL+5v05MMWrAJSFCz0NkV1E04afHy+qAGqhDNowqvIsbL16IOXxZ78t8emNJdhAb2KaAVoqjS31jDBGJw6g1OepDJUyWOdOIxjH0yT9WPR3dWM27o6JrTFsyomFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxDB7Ho3JZ4Qdmh/reCgbr9LriRWfQUZL7iHsV7AazA=;
 b=hebm8jOpro+/rW28z7w65Zo+EPK0YkC8oeg6h2hwgyfTVQBxm+VlaM3P5BukdtZ1jxrWkLQOP+xx0ZXSv6oGou+ZBp6CARGhaHLbqo26YdemlGcR341CojJUGskBZ0tGSe5TWZBAQsj5m7S+RqqQDLNdvBmsI7cY58Y/ts/PS3aFvutJHxIxOmeXPQWHFLWqYgcdm5fvQC1AYDmt0MP1A58jfX99y8Q++Km5Xt6nox31SFEIPP4s+3M/tZoVwSOe6OzB+ii92tXzaprczbhHLY+3cLiLpDBAzS+pVre3+wJmx/LDKtWUlwRVvby70V1lV4WKRkDUGBg2J5IycUKa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0125.namprd03.prod.outlook.com (2603:10b6:303:8c::10)
 by CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 14:57:46 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::f9) by MW4PR03CA0125.outlook.office365.com
 (2603:10b6:303:8c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Wed, 14 Dec 2022 14:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.11 via Frontend Transport; Wed, 14 Dec 2022 14:57:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 14 Dec
 2022 08:57:42 -0600
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 14 Dec 2022 08:57:41 -0600
To: <buildroot@buildroot.org>
Date: Wed, 14 Dec 2022 14:57:37 +0000
Message-ID: <20221214145737.31849-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT004:EE_|CH0PR12MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: e32eab76-8737-423c-4080-08dadde38eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: st1uyxtjdp/A+HCHmsL4OMTDyUXIbPc+3I089kYSErfyc8vQGOu6kuzK0uf8lVROStYboTfbKr5VXD/ya5gY8IjHjE9zIXOARntLk8ojYzp38jIxmfd7eVBtQ9WbwDkMZjMXNx89+JFXxwrqwuIHrtStl5IiByo4lIsw1hTfj5GR0NZbL7vJ4dKNIjll5ToeNbNNegtfRqgGSB9f4yudC8C6rIk/wRXr/Sx/esWYm3Dwkkxw9X3bZduv6ztwcHXqqdX720/M3xg4Y0PKZdiyWXf2Htmla1iyQWwWbNyiz70SXh9Zv/3mqa4JiQIJdsu3Xq5nfBbirOvONDuK8Y5Rdw8P1U+079Fk81ZIqK3qtQSf+yfwZLDBcV4wdquTaYPQH8VmzBrmW+iZf8rGiY1+luSIltEMxJd5isOjb98k982ZpZ5EDSJF3zx3l+kyC3MrafuNwD/bVuqmn4Z4kDPPpT8jgFkRAiKEKC75sdRyXJeX8X7STBL++fevYCOucQF/D2f98lMzxbh81whkbWBaObcZREl5lvBUzYI7u/tOHr2/bTPlHPIWoLea8WCj+Mf/ZQATwrUceJrcdWAkaR8NdMXcjyh+RrQxOKlFy+HYWKlEPzzJZTTIF/1NKZPDXRuO6CDgqhrbKzAwdCR8kR+blc+gs+rds786khNCKXzpDSIK93BJ6Saoz2nN7AMFo9PixTRvcJVz0SyzBHX3tVl5E4aLw+3f6dvPHws/g4aVEfQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(186003)(81166007)(82740400003)(26005)(478600001)(8936002)(83380400001)(40460700003)(70206006)(70586007)(356005)(4326008)(36756003)(44832011)(2616005)(426003)(86362001)(47076005)(336012)(1076003)(41300700001)(82310400005)(4744005)(5660300002)(6916009)(2906002)(54906003)(36860700001)(40480700001)(8676002)(316002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 14:57:44.6367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e32eab76-8737-423c-4080-08dadde38eb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxDB7Ho3JZ4Qdmh/reCgbr9LriRWfQUZL7iHsV7AazA=;
 b=Illjw4F2Vbv8l9DdkoOsMMwI6D6OFqjin+YXoj8obwC6NCCTT+NDZKVK9zDTYKcZnyly5e2jKckn1d9StPLAF/6lJOHy9Jbn7Oe6BKW5j+YejeBeYXk3pin9Qo+O9TK0bRdy7CYew7HSOcTfy9hZeBOGzfxIEBW2d10P3JvbBIg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Illjw4F2
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/uboot.fragment: remove
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
 board/zynqmp/kria/uboot.fragment | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 9e32edfb36..f91baa2d8b 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -1,14 +1,9 @@
 CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
-CONFIG_DTB_RESELECT=y
 CONFIG_DMA=y
 CONFIG_XILINX_DPDMA=y
 CONFIG_PHY=y
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
