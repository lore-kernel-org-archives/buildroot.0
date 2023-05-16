Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A42EC77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 04:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E952B40B72;
	Tue, 16 May 2023 04:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E952B40B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Ddck5pL61td; Tue, 16 May 2023 04:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CD3D401E1;
	Tue, 16 May 2023 04:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CD3D401E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1DC41BF29F
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EEE48400C
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EEE48400C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQw6PPYppscI for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 04:15:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E933184007
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E933184007
 for <buildroot@buildroot.org>; Tue, 16 May 2023 04:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiMZHROuMhvM/mNzocjG/NSXpwk9Rr6dE1nZPvSIhIUbrF6qrObdXqYQ2mMShqhPPGuY09Rg2HcVRp4UNZZeFS4VWFPOrrX9bvYAnaRSos/lGKGtS7Kq9+pymFs0bIIcPKW6lIPWZ6FVf4kbQccySUgQCMxLOOL0hrN6khri3gdxL1cdxGHQFU6OlXm5SH5Bs2u5BtYU0GuququEO67tDj6aYb77hTdvq0Bhdj/ZKlDfJyRe0kgRRT/ACjv73YeonhuXc8ktztxPnukH8Lu6wGVUGQ8qSzfvb/Dg18HyPB/0Us/4iGyoS/yU+/t9nGbeC8QkmeuYOdD7s5dbxlJTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs40lVfvzVl2Uus8BwhCbe7kTyaeDnsaEqSiWIzYdDc=;
 b=dI1T6VYg40keLPG2AlNbvFbAKPvgsZ2YelznaOo/eRP4KiD+BWw/xWNrdx3v+VCa4gxsvGz8W/vXWmkATfI0fG8cU8KqHBGXPN6wYzj0IAcjORu5n1LRw4u1GIDBLEHbzE+UxsAaiNb4cPHI5pLRHQAnjbO4MnTEGyoXQPPBJNgq7lneF+S7x1ifV2Bn9ArZiLSlppJXQXX08CR6zIV1YpY7BmX+WefmyU6hcTG9HqEnKfFQX5d278ujk31SMjSXTHS8es3SBMjzHXAnJmIQkujU2yMe+7s3I5R9zh1886+yPE8uRAcLLtALt/0bjrpL8lVW2S1p95gGxnjIva48zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0359.namprd03.prod.outlook.com (2603:10b6:303:dc::34)
 by MW3PR12MB4412.namprd12.prod.outlook.com (2603:10b6:303:58::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 04:15:42 +0000
Received: from CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::6c) by MW4PR03CA0359.outlook.office365.com
 (2603:10b6:303:dc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Tue, 16 May 2023 04:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT099.mail.protection.outlook.com (10.13.175.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 04:15:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 23:15:37 -0500
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 May 2023 23:15:36 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 May 2023 05:15:33 +0100
Message-ID: <20230516041533.22408-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT099:EE_|MW3PR12MB4412:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c2ec8b-f619-4e3a-e841-08db55c4366d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r53zyyJ0zUVqwYF1le2Yu6lR0coVkWfd/SX/X9BUGU4XU8qSzmJD97YAvCYCjRFzsTPJ5/2THDWGI+6bfPQeJGGpxpnTOyQpawHGw6XqwhXlq7TzQf5U99nfbGBCwkj+ecJWXPxyr19f5wXyN1jK9N3EvhNtAg4F+CD20emLEIMKgGVXcbh/wC1FoUfUQRQ1HSLPgK6iPlj0BMOcX1IVnfu6MrF4pCs3P2FmudnsBMNIbyC9Bdm0BLTjT12kGHvEAKTB/Ih4orS+0ICsFNDh0fOSngVWdt8JdO3mTJO9djhzNmOFPpKkloqv8TVNZYr9K5idt0Vxmg/ADQf0xdWhCh9M3o7uzIPSTM/Fz77oEYx/EiMYBm5HQO3D+vzbUoMP+IuSskYQ6ZVyx+0QzJGo/MKjPMFF0B2meN9wv6Lt6tvI5gfTE7GufodNBtFcvrOPITTa2UUdpXK5dF0WgQ3QcZAEKLTGVkQPCJUJavHYJNslc3PNorGUd3fBywPRD/W/l4IsQc8iSpK5QNaVl7zeH35e5G2Vp9Q6qnkQFvfpXsJ1fyaL8qOFSThNy5sn40FgYnNRIm4ihxqf9OLl9lQN5beZS7SzqKSSOogc01ne7I+4KQzk5mu1djkxAP1hFROYCx3SqIpN0n8S4lGeVxUKeLlqTFHB3UlBg5RWTEA1aA/1ty8aLw02SxSuUjKHakFrOq4ABNhw1cTL/kePl2J44aEmP2Z0B8UkprhaSPp4Z/Tm5p+q9+wsSzQY91m1+t9bV9Au52m1EhCkL6yGPixb9Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(83380400001)(47076005)(336012)(426003)(36860700001)(82740400003)(4326008)(356005)(6916009)(36756003)(81166007)(41300700001)(40480700001)(26005)(1076003)(478600001)(316002)(70206006)(2616005)(70586007)(8936002)(40460700003)(5660300002)(44832011)(8676002)(86362001)(2906002)(54906003)(186003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 04:15:41.6618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c2ec8b-f619-4e3a-e841-08db55c4366d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4412
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs40lVfvzVl2Uus8BwhCbe7kTyaeDnsaEqSiWIzYdDc=;
 b=eWxQmZlSjULQT+CVuu8KVfx8gBp6cDtA6vOJujWAQnffx9dgHU3+/Y+fHiAxan9WIbDDHShobs+7a4oN5IfPFSBBy0mu2OJx6nGzNCDFL+GvX6tZssSGbfKk9tQexXGL9yE85GSTfe2zSAZ87xo9iozIciN55ENrNdICoFY2n4A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eWxQmZlS
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to xilinx_v2023.1
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

This patch bumps bootgen to version xilinx_v2023.1.
The patch for build machines with modern flex is no longer needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/bootgen/bootgen.hash | 2 +-
 package/bootgen/bootgen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 5d77c164f3..937509c859 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acbb3  bootgen-xilinx_v2022.2.tar.gz
+sha256  2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea8e  bootgen-xilinx_v2023.1.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 88bc73b604..d83980d925 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2022.2
+BOOTGEN_VERSION = xilinx_v2023.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
