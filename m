Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5007C5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 05:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EAC7607A2;
	Thu,  5 Jun 2025 05:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8DfYBCPT5ga; Thu,  5 Jun 2025 05:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB82260785
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB82260785;
	Thu,  5 Jun 2025 05:48:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB0D1A4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F26ED60789
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJZu-G6rbrpX for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 05:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::62a;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7B3F606B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B3F606B0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7B3F606B0
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lM2HHyovDeaLZz9Ur4lb98Q/dIXGnX7MG4z7NnJPmh6durea8QJYO3a3wolE2IsZiunbOMzg7fXzPVelRV3ygUVAY5pJBT6xCBgf0/xKmxM4T4ETpyCys8DE6dsTTIkOOwoYCtGfMNnrVDVGMWYJOpkc8Dce9PBKUs5MFKhYaWMRK3Uu1hrSjgJygmUNwwEDVjYfUTVFflSjhry452YXVP72bnFlaZ8c9F9LQvXmb0WxnhVLHGUr3qJ3w+C0mVsMrY5MfL+Lj2dluwYuByGi4WtVuYi9fS4XkZM/InPC3Be1CQaFwDru5N/ebs9ng1x4Pbwb5lul+qzX/TgRGf+HCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI4WP7mvelM2e/cDmxmyaqgRUdrw6D4grPsOinokaVg=;
 b=WWMZ7A8LV9fjnpA3thmL/X0N0hfrjTX5OrIbsWrLpnzZGskQ6to2wx2YYlHssyGZGRzICs5JOWb7CPUYOHwZ79RZpogofxZzxlWo9XftF7e1riG1Zfo0wrtaiiRz4hqgFKmZqcCHJMe1SjAXwbgmXwdNBM3yBpprTLRoPvME4tHJcnQkPG1ZUibRPvfBc2296pR88gn1tAtqfR4zu0vMX0JBdINr8Je8ZrntkNG0GU55GlDCI22nSmaU0svOJ3nZuO0Ba93O2cAEtxoLYQOiDINcXD9OBey7fQG4lb6K/eBCKADgtMz2UM4/6XM1dx7Yoj2zJAYvKiOpfWhUkU12ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5PR05CA0010.namprd05.prod.outlook.com (2603:10b6:610:1f0::22)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 05:48:36 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::b4) by CH5PR05CA0010.outlook.office365.com
 (2603:10b6:610:1f0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.9 via Frontend Transport; Thu, 5
 Jun 2025 05:48:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 05:48:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 00:48:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 00:48:31 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 00:48:30 -0500
To: <buildroot@buildroot.org>
Date: Thu, 5 Jun 2025 06:48:24 +0100
Message-ID: <20250605054828.4181912-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5333c3-1c3a-471b-fa2d-08dda3f49c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VoGs09cQ3Tl7sMuaeaKTmWXZxZegUuMOEux//WpppPi/fUUg5O1WKLIa5Om2?=
 =?us-ascii?Q?EjNdCmA6GXlMBzJG1SfeNklv3c6I1eRfkrioHLy+BrAs+ccIbhiL1Z3mk4dv?=
 =?us-ascii?Q?aT3WHvo+byCnTHwp8FPZZMLJOsIM5/yF7w62QxD3uTIxnbIfwx+4JpbXmQs4?=
 =?us-ascii?Q?17GIfWA43TDmvDTkENGo01nxelrBiKK5eCTfUOC1OGW5qYppUnf6Y3rVinEv?=
 =?us-ascii?Q?78+00/v2EWIYsCChCQHcWyA3tVE+qJei6La7YfA3eB/IjV/X4E1IOiw42gUu?=
 =?us-ascii?Q?Ih4S+chtXUTFBOZD5WTCmCJzJZuG84oMh/TIVnQlXW1B1QvkTK4aNb0JsiFD?=
 =?us-ascii?Q?veE3lfNN4YZj2EZ3lGkY/VATe70q9VnOlml0XONJDg0qyO08M8G7T1tR4sg4?=
 =?us-ascii?Q?my8XARDvc3wMgxd6dYblb3X4Jzk9X9ZPkaB1a0WPEmM6s67f/V3C1lt23I4P?=
 =?us-ascii?Q?0mQUWwiivoCHG5NFYSdugrlA19eWtTEF2rt+vlcXuV25NVtdLdtih7cb5CSC?=
 =?us-ascii?Q?2GXrvyAWh1auD9J45c4A8s2xehXga8t/qryvxKKrtnfJ3iGV/PT3Wb5p73ty?=
 =?us-ascii?Q?XyOyRWAOC0lz73qPVqsWCgYCPXQ8cyCcQptEqWQ/jNYzAt5uEDjHA0k98wEO?=
 =?us-ascii?Q?uCsEEwCQyJ/0NYpO7xiVblUGvaY9SRWUAiCTciY9V56SmaG+V1MKscG9mz8k?=
 =?us-ascii?Q?SK1nzo2qJCuX8oFtlBvlbQ+S8c19msV3jygF4wnIYBSb097Pt1jsk/YH7EuR?=
 =?us-ascii?Q?zbSaakNdlIl1ozQ473hVKteL6lri6kQEbvCkeQS/Ir0VqVZVYoqZI0k55Amu?=
 =?us-ascii?Q?Cp5O5+o1idnxA+fH3caejzUGbtl4/4kPEpHXFma6+zZJbUShso3r5h/OTV3J?=
 =?us-ascii?Q?61G3WclqcEInFpNdITAnaiiiWsHpxr2t+uUPpsG53nqMavl1OSaa+1HCobIo?=
 =?us-ascii?Q?GUOW389GFon/KzX3IY+GIFLparu72Z9pdscSAxATjTTKQECqZhup2vVArGtz?=
 =?us-ascii?Q?HpIyjI10VdDOt6si4U/dNJHMZacL8oUFkYUuPy5tacENM30/OCML5SwKMlNd?=
 =?us-ascii?Q?4gLurGdKh7H6NoHeKbjsFitj7B5D63gygOKEJJHw3BBG5ufLNbYmHpao179/?=
 =?us-ascii?Q?kzSYMc7LGo1TT9ikRkJiFf9V88NeVbJTnH6mTFKVNlPWuLoucWL9ga30oO7Z?=
 =?us-ascii?Q?3854H7PK8Q5TVbAmSoGqLiBH5JQsn0JQR21uKVTIbr6EyEpBTHiluCoEoPFv?=
 =?us-ascii?Q?DMYNDjKEi0eUNYfX/IzXcXhOt0hUK1z3YdVyXAfONF1FnRwCltcU78TOd2ND?=
 =?us-ascii?Q?w2Z4LkvsPwwiA3pofWveI/ClTpXlz21I7KUXfUGgLdCbnCo1aUMFKfkKUp0v?=
 =?us-ascii?Q?svRlVHctEPwpKwjmvdRSTzTzkteDy4iwdCTY7J410ThVLUUUESkX9OxBnxDY?=
 =?us-ascii?Q?jDzDt5jtY9N5bM3vG4gEjOerA3zIkRMgbm/kZoWNIZaYqiyupEoaOu/OfhmL?=
 =?us-ascii?Q?/kcCEUPwFLkaGDSxkWeREEptiq99B21RPIIlVd1v65rX2kp1crVYOpcntZeF?=
 =?us-ascii?Q?1ygU08r25vS98z25Jcg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:48:34.7860 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5333c3-1c3a-471b-fa2d-08dda3f49c73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI4WP7mvelM2e/cDmxmyaqgRUdrw6D4grPsOinokaVg=;
 b=dJXnxzs/NjYdOj/KY7Ep/3lVAmytuuVotzmoIb9vaTfL4xAtxSTZqJtjnxpIPQVfTRXz4URd2DY/ug2qBA72Ey6MbqYn/VdsKhMYXidS7n16KSO98CWPDuFq69FEfO5bHDR4F8Q16pASjtUl8HAI2Oue65Qd/pMMrZdwfXhXrh4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dJXnxzs/
Subject: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: add support for
 xilinx_v2025.1
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for version xilinx_v2025.1 without changing the
default version.  This way, the zynqmp and versal defconfigs can bump
individually from xilinx_v2024.2 to xilinx_v2025.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following two series has been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
https://patchwork.ozlabs.org/project/buildroot/list/?series=459345
---
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index 35f7070e5f..8e8940e5ed 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  86ee9629366aa8c0d70b87202152a793804ed4090e3a6fdac4eaf855bcc4d458  xilinx-prebuilt-xilinx_v2024.2_update1.tar.gz
+sha256  b9e2572885ad12243e10d48d9fccb24771a528b9f27aae1b29b45f0806ce9f1f  xilinx-prebuilt-xilinx_v2025.1.tar.gz
 
 # Locally calculated
 sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
