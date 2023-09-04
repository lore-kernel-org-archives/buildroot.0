Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE41C83F3F
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 10:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0380981385;
	Mon,  4 Sep 2023 10:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0380981385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRdbalh7MQoZ; Mon,  4 Sep 2023 10:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C6581CE3;
	Mon,  4 Sep 2023 10:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C6581CE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC2D01BF215
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94A7E404A8
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A7E404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqzrC5h3hmEr for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 10:06:06 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB2E840328
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 10:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB2E840328
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8yRc9KPdIfCnpOXCqVzRSAYlj276LHwoSd2O3cgzTIOtJ/UYqUZkg/Vwt7udu4zJF370Xshoz7z67KhPDGw1y31aTL0Gif7wZd8Yx4lvSOQAVKFzNsVNoZlbNvDVd59LLaDc4hXX+XatSDJ6Dh3b9cdMBz10vC5lAYV5jKoapSlbGmuCvPXbrcLOHNQzsbcc6zDrnycsXHbw7VSfMbsIDBCSfDVtndQQdvDwM07U+RLhKY3x3K2pMA5YrWk1Si0rYEvV7U2gBKxDVmL8rQOi4m5McBhti/KM7BtVZJ39mJ2pdX1IAGpJkUpzT+hgCiSL3Umdg7LYkVeFzonbiH4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lQFgHmVIwbBrPW2/at/8KgabG8/GeHEaoAartEcLl0=;
 b=cmMNXrETfspXLgTh7+dMY9wb38xjwGYzIVB9+DzGN9nFH8QEM+KAASiMjqIskdlD7f9KB9FRP5NimSbIP4d7VrT6NHnx6X9N9HgxqYD0SPup2YkqsAleePUj9cqq97N3SatWojcC4D+6ubkdpefX85L6uJEiJ0xrzibTnT5OHNlGAhVYXm1J6PZyOY+h8q21BdpAWRPv5urjW80Qpx+XtJezgCiwfb7SoJnHsUjDdJGR3JWq6xmcAH3q3DNJ4qSPg7+yuTCd5c3KUy6ZJHyQK5VyyZImrqyHU3nRRZC5PTso3dDZ/PcgwxUmN7eiicmAnLGU758z9A9e++kkFx9tkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR18CA0002.namprd18.prod.outlook.com (2603:10b6:930:5::25)
 by BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:06:03 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:930:5:cafe::a6) by CY5PR18CA0002.outlook.office365.com
 (2603:10b6:930:5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 10:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 10:06:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:05:48 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 05:05:47 -0500
To: <buildroot@buildroot.org>
Date: Mon, 4 Sep 2023 11:04:41 +0100
Message-ID: <20230904100443.1613306-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904100443.1613306-1-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|BL1PR12MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f3d3e2-e247-4a33-7765-08dbad2e8b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUgUXYWo6ZDMSK4dNaMea7M7b1EQiyAkf1g4u81vC/zuU5ESS/mFk+SiX3x0tZcGDvwVus3OsjR87B4EdnGWwk1pCHbKyjAkBn3Zaco0kvqCRJxqd01bvyfX8Yq0WkfcmdQpSCgNiuuaL5///OtAV/I6fDs8w8r+kHYJOLEk+08yKUpmf3YnfjSXqe/tuehnPVKDUJK64YT/0FloqIzBx3PljCX6BVEyMZNj1vZ5fpWd0f3wHmbLzHaNt+xeEz03KuO6zpvW0H60bDDZYfABTAiHl17PSBDQ1Fb2HHb9K4lPUNF11zBynxezSZxpYhyX+AEEcaFWBk1c3lO3Aq3Jfsvra09ZRLe2HhmwsOoTVzdt2IsYu6DMsdIM5jhCpZd/uU4nEHA5I5pZdX9XhVqbdLznmOKlOQVX+t/eJll9fQFohe4ZDiPaWEN3kBrVnA9/jO9tKYa5xGoedrI+c+4pWkrR8zDCsl13oXdIHcoCiRrn2OkrVsf51ueEYLZvhKZjYpEq8N5HBMgfm1BiByau0tM35k0/OH3xdTFfc+xdPAb64lABa15OV+jDnNRSkn6mp5AvBciY8+FrDtpJn8D9dgWl1m5aGc7rjVnnOK3z1azV0PdNlqeFDLNbJEYSxliDMJiwewiv3tWREBtTpiR7GgKeOa0vOMknyOCto3+e2enGE/FUgOcn2XqjoW/6g67CrAYQNOejYV8oZf2MchotJwobxw4HI3rlldfLfq6hqvJbv/+8AQytvcBclHYedoRVOFQcXNZg3mzEGgT7emLMhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(41300700001)(40460700003)(6666004)(356005)(82740400003)(81166007)(478600001)(2616005)(426003)(336012)(47076005)(26005)(1076003)(36860700001)(40480700001)(54906003)(70586007)(36756003)(2906002)(316002)(6916009)(86362001)(70206006)(8936002)(5660300002)(44832011)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:06:01.6593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f3d3e2-e247-4a33-7765-08dbad2e8b28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5174
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lQFgHmVIwbBrPW2/at/8KgabG8/GeHEaoAartEcLl0=;
 b=GDDq4DyREZ/J+I0eGklE4ulx9cWm1Ey/szryWH5i2hWFTdQppXkD6d/CLyOhWxRpfyzpjwucuLBGbPtr+FugJhZfylRxHEbONCXTr58h/CItRZVOU/FZlnr2OVzXqlnC5XpgKBaLFqGQzOE0ZD0sPvILtec7mzhIxEw9L03WRNU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GDDq4DyR
Subject: [Buildroot] [PATCH v3 4/6] package/toolchain-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============1209529153239498181=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1209529153239498181==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

This patch adds a new virtual package for adding a bare-metal toolchain to
buildroot.  By default, this package will configure a bare-metal toolchain
for the Xilinx microblaze little endian architecture.  When configured for
the Xilinx microblaze architecture, this toolchain can be used to build the
microblaze firmware applications for zynqmp and versal.

Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - adds select option to bring in all packages needed for toolchain-bare-metal
V2->V3:
 - no changes/
---
 DEVELOPERS                                    |  2 ++
 package/Config.in.host                        |  1 +
 package/toolchain-bare-metal/Config.in.host   | 21 +++++++++++++++++++
 .../toolchain-bare-metal.mk                   |  7 +++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/toolchain-bare-metal/Config.in.host
 create mode 100644 package/toolchain-bare-metal/toolchain-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b8daa9183a..5978d79a06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1331,6 +1331,7 @@ N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/toolchain-bare-metal/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
@@ -2200,6 +2201,7 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/toolchain-bare-metal/
 F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in.host b/package/Config.in.host
index aa1f15e3ac..103d461a7f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -106,6 +106,7 @@ menu "Host utilities"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
+	source "package/toolchain-bare-metal/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
diff --git a/package/toolchain-bare-metal/Config.in.host b/package/toolchain-bare-metal/Config.in.host
new file mode 100644
index 0000000000..629b58d9c5
--- /dev/null
+++ b/package/toolchain-bare-metal/Config.in.host
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	bool "host toolchain-bare-metal"
+	select BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
+	select BR2_PACKAGE_HOST_GCC_BARE_METAL
+	select BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
+	help
+	  toolchain-bare-metal is a host utility for a bare-metal toolchain
+
+if BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+
+config BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH
+	string
+	default "microblazeel-xilinx"
+	help
+	  select architecture for bare-metal toolchain
+
+source "package/binutils-bare-metal/Config.in.host"
+source "package/gcc-bare-metal/Config.in.host"
+source "package/newlib-bare-metal/Config.in.host"
+
+endif #BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
diff --git a/package/toolchain-bare-metal/toolchain-bare-metal.mk b/package/toolchain-bare-metal/toolchain-bare-metal.mk
new file mode 100644
index 0000000000..407ad4ea33
--- /dev/null
+++ b/package/toolchain-bare-metal/toolchain-bare-metal.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# toolchain-bare-metal
+#
+################################################################################
+
+(eval $(host-virtual-package))
-- 
2.25.1


--===============1209529153239498181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1209529153239498181==--
