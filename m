Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96DCCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 13:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D074612A7;
	Mon, 27 Oct 2025 13:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_OPi0Awmy_6; Mon, 27 Oct 2025 13:18:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6F0561258
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6F0561258;
	Mon, 27 Oct 2025 13:18:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68E3215F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5987B811C8
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOOBuHbvawDf for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 13:18:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 529D481177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 529D481177
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 529D481177
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Te7LeFhbsUgg4EKwy0VpfkDNHJjVwIzGPyiwOndoS8ZJUqhVBf+IgAgVxYrwOm0lFSIU08in4VmUg53b0C0IubOBzfP6cKjs48yPLSIQUJ8FlmW9t+pjOQ+vX5ROsGvVBXqZfFpUb1r5u3x0JrENE17habnUbzhTBkp0pHJDSvle6ej75ww30bNluft6vgK96+cL0io17OQkuKqwv9iDaSqTU5nERs3GTfQO1nJ5m16OCraY5aVSt6Es/DvmJgdEojirZEHUi3rds8sk5AAKGKCFFTz2sRTKrMmiTNSjy4ZZGu/O6yhp+KPdbBLzb3IM0ORC0D9s+YV9NxYH/7lHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xO6hzmFAPXEek/ayd8URTIhFEHiAEF12tIV9NWPRHY=;
 b=blJaCSLfNKLWnAHhVTAQ8bO55uurKFjuQXShYhPwYowuBTPFoa3HL15vU3tbwGbsJLEQGTSPzA8tPhWpTsSx5ERqOHoBXAOQDtM9He2COkOqCFkn967eq2z5tPODDXRdMTMWRiPsx6XgwPWyiQW26vIDMqg/3/4bLlVu18c3BGrKTEDk7I4oCsxW0KrLD47VLWnaFkB9kiFvOlPDXRKSqLohSfP7mpeTTH8alhqzsz3Jx7eokTE5tfoZ4tvYvyHGgiw2SOu6JSjfB53pHlgWtbhaoUdG7B+4AQBSzDel8WHJRnjytGd29KLU99gSt0oK2+f0+C3ZhTTv3AGbZwJuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR05CA0091.namprd05.prod.outlook.com (2603:10b6:a03:e0::32)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 13:18:50 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::5d) by BYAPR05CA0091.outlook.office365.com
 (2603:10b6:a03:e0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Mon,
 27 Oct 2025 13:18:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 13:18:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Oct
 2025 06:18:48 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Oct
 2025 08:18:48 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Oct 2025 06:18:46 -0700
To: <buildroot@buildroot.org>
Date: Mon, 27 Oct 2025 13:18:39 +0000
Message-ID: <20251027131839.2779098-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca779c3-4d8f-47d0-d304-08de155b5daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Goq3PGQ/oBZ+Wff+/9JDzmp13t8KbXD7tFs+zn0uGAYtIG8vHL89qpGZSdns?=
 =?us-ascii?Q?XZRSSzEwnDLRyLFz5J65/Rkf2R2vV9imk1/COBAenplST/0wgWrFqWVQWpPs?=
 =?us-ascii?Q?I64MECChIJ+B7vF6p/XiNdATEvyFpJFSEn3kjNeyKEltP2RGc/vE9giD4Q+s?=
 =?us-ascii?Q?3EScWplGJN0JjQRnWDyExisziLXwPtWeqbPG4KV291oLO2PhoZfT4bzbY2Lk?=
 =?us-ascii?Q?BmrdkpI4hkVO0/hkPDWvczV0WhMT+ZIx7iMAOkDX7NeLjpr0Bfl8Ml1VAskN?=
 =?us-ascii?Q?znQvKEiovx5X+S2O6jZhW4rBbfrtby25gVN8Q0eJ65jUu94lb0XyPTzl6Qjo?=
 =?us-ascii?Q?1Wls75wyqb7ATfXrZ68n4aThWCPD+GwYyODNRR3yoF3MOnL5AfYaRTX1E+sq?=
 =?us-ascii?Q?M4j+Dxvq+C0j2rnZxuQ/NvKDutxA9YX4AlMdt4o0JNrzK930shEUaGN+vVAM?=
 =?us-ascii?Q?wPpsPG+KFTjWhfhTGvBmd0/1Z65KlV6blYHk/MEiux7w7Qg4X31UaRH8sAD4?=
 =?us-ascii?Q?2MghAXP1aIM/vgu8lUyzS9ZrfmtVVT5P5f/77iY8aLA54jNM16pek9Wq3BFI?=
 =?us-ascii?Q?YvSw2zPYM/4D/kLLVtMlKul8OilnjX4lewrly9szI8oE9jOMyKlpF+9upPp9?=
 =?us-ascii?Q?9zJTmzSwNfra9VkdVoWOGRvjbLQZ5FlZDNRe89jH/NWSMIGAIjx2Ku9zMKb2?=
 =?us-ascii?Q?MRwT7k8I4i9nikj8BHQOsV2DkawZfSJM5NUggGNLC3cma0wpEh+9aSmg7Akv?=
 =?us-ascii?Q?1kFJ3oC3gwF0I/A/1Jk8G247qmK3XQapjzia+v6H5kAlz24ulKI2e5vlUWt3?=
 =?us-ascii?Q?TVtR4M4kzeGMr7KSnLkWJBdSZ+qBUz8VO5osqay6TT/Rn1Ry+Veoxd1Nb1pB?=
 =?us-ascii?Q?SbEnKXtn3QBS+GtLLj/nFoo+UkKWvLdt04PUXEQhgazG+xBt4UiYZ44eZTMB?=
 =?us-ascii?Q?SR6PJPeOyK8TCOkWMaf5Ea/uAVawMMKLmtgPG6iHJMUpLVAGDp1PYX/zApty?=
 =?us-ascii?Q?MFHW9sDV1Fi8N/FzYNNEMWavTqp4UMU2z4akRAta2KEYt1Iq1cfFc3lNHNjg?=
 =?us-ascii?Q?8dku+uKvXveebJe9uOjfNw70YWE46JEwWb/AS8gBqr2g/m87/6Qv2oJA8DGX?=
 =?us-ascii?Q?G9FTZ8HwLHnJU2lov9lvR+LYWHa6369V7jdGP+Xv2+sjJE8iKoqDKDjv9wZa?=
 =?us-ascii?Q?Lk0gg2yP+eCn1aTC7QPuH9F2PzKFZ7zwefFrZGVLhKwJIKpMvofE/L41rxLH?=
 =?us-ascii?Q?JW6Wqsdj9x5eyeKLBKry24XyMe/lpC7/myK8JJ+50BAP8Bn9nDWYY3HDZuoh?=
 =?us-ascii?Q?ObnC8boKBxhTGoYsh/JfbXVAfo699BCmeHGKZWfu4ckAuJzfI/Ge7IEuNDKc?=
 =?us-ascii?Q?hnGz7OEGjau+7rk3g0/JUZw4yS90kfxuy9LpzxHmRrEbS0kVdjYhRlTgUqz3?=
 =?us-ascii?Q?Demkk4wCMv5cQxdiIqH8m2ESF/sG4qdY/g1qqAUFheoZS6ftCqSbGiUJ91Cu?=
 =?us-ascii?Q?V48DailyAT/u0rgKYotQtvJ4a4wn9P6M33FW60etTTk1XG39PRukFtRXN1D6?=
 =?us-ascii?Q?lThSVMKh6k4tPX/q3OkcBTrrtW/xULbjmIW2XtNl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:18:48.9528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca779c3-4d8f-47d0-d304-08de155b5daa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xO6hzmFAPXEek/ayd8URTIhFEHiAEF12tIV9NWPRHY=;
 b=p2CzKDc/YzuJ/SayJAOhxt3LgYx7q2tbVJZFlucTpPJmZv8C13AtjtbbAxZG09/5qhgZksGPKEmV0cv8xVWbLQpxoi6nwaFUskfm6VR9hEP27VcNNcqzZtlEqZIihwkBJ55a1ECpOV4OcaWEQMPzQ959kgB13G4rRy2cK17mJ9E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=p2CzKDc/
Subject: [Buildroot] [PATCH v2 1/1] boot/xilinx-prebuilt: add local versal
 xsa support
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

Most of the time, users will be running Vivado on their local host machine,
and will generate a XSA (Xilinx Shell Archive) locally.

Instead of requiring users to create a URL location for their XSA file,
this patch improves ease of use by allowing users to work directly with
just a path on the local host machine.

BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION can thus be defined as either
a simple local location or a URL location for the XSA file.

In either case, a hash for the XSA file needs to be added to the
boot/xilinx-prebuilt/xilinx-prebuilt.hash when using this option.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- updated help text for using a simple local path
---
 boot/xilinx-prebuilt/Config.in          | 6 +++---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index b218458ba5..1ca0cb06f9 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -60,9 +60,9 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
 	  file. This URL can use any protocol recognized by Buildroot,
 	  like http://, ftp://, file:// or scp://.
 
-	  When pointing to a local XSA using file://, you may want to
-	  use a make variable like $(TOPDIR) to reference the root of
-	  the Buildroot tree.
+	  When pointing to a local XSA using file:// or simply the
+	  local path, you may want to use a make variable like
+	  $(TOPDIR) to reference the root of the Buildroot tree.
 
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 95b656cdde..a7ec9abff5 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -10,6 +10,9 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_FILE = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION))
 XILINX_PREBUILT_SITE = $(patsubst %/,%,$(dir $(XILINX_PREBUILT_FILE)))
 XILINX_PREBUILT_SOURCE = $(notdir $(XILINX_PREBUILT_FILE))
+ifeq ($(findstring ://,$(XILINX_PREBUILT_FILE)),)
+XILINX_PREBUILT_SITE_METHOD = file
+endif
 define XILINX_PREBUILT_EXTRACT_CMDS
 	$(UNZIP) $(XILINX_PREBUILT_DL_DIR)/$(XILINX_PREBUILT_SOURCE) -d $(@D)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
