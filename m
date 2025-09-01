Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F212CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 13:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19BB26134C;
	Mon,  1 Sep 2025 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BJo2Rplfxj5; Mon,  1 Sep 2025 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 015926134F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 015926134F;
	Mon,  1 Sep 2025 13:29:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E4810E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E44A2404D1
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mn2pKehzoeIK for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 13:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::61a;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFFDA404AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFDA404AC
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFFDA404AC
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:29:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEPKUD53Sy4LGL4Q7ltmkudIP1Xm7IrLVoSadk88zivcBaJFswFGJCMW6rV1NqFv5DG6oK8MZyW9QUgCIumGqhmmFk7krjryw90FezEXNQAhwnm5bUavxOmj/npYTXk3IrnZ9mIoYePXk/S4/oEuU7lF2Lwalve6FcEARcH5wzGiv80mD91fAW2tM60VhuCctOe+PvSpc4Um4i2H+HTAAyE7qNbclTMbLizywf+BBndozXDg8S2IcyJj02vHMH0KcUuNsfR6Hy3XJsI0xHHAo00T6rCF8upcv1B4d7zJaNKnxMDjVqBGCPHEj4xxxHibxvb0FyscN0wAiYQeX2r1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLaIQgFIMXoqoUBuHp0Qf8ZEIFxMA7OHc9/C4jdqDKI=;
 b=Sn2jBmk2l4czyuNTz/pJ/3fjvEcxFHHQ2XoYbkGWODuDY1guyznYKKTXh72bY/ks/smBzxgV2bD+vQNYTD69WUEZ7TwYd9bGWxPAMSHe6jzirrMweLfSd0PXqVuywdL2rDZBBWFOqD6xmTIev++3MxqRc5kYW6g7B5/AGeklTjLQM9hWyiEOcIsVy5WRy4+kCmOh9EOIF2faVLigJknMqBU2bk6t4mKWwN5M/18iLDWXprwrBXH80zx2eldSZX/booTVNsr220yqgGoNglhk01/y3/UDLm2XkDvemS5M0b3klr8NcFm+yRCsWkSeO6HhKUiyd0H0/ZcIGePt+Y5meA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR07CA0023.namprd07.prod.outlook.com (2603:10b6:408:ac::36)
 by MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 13:29:43 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:ac:cafe::d1) by BN8PR07CA0023.outlook.office365.com
 (2603:10b6:408:ac::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 13:29:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 13:29:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 08:29:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 06:29:40 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 08:29:39 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 14:29:33 +0100
Message-ID: <20250901132933.937424-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901132933.937424-1-neal.frager@amd.com>
References: <20250901132933.937424-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|MW5PR12MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5c25b6-1893-4583-5aac-08dde95b9b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z9sGG/4eD9x5lkBSUeSrpS7IsKi/azB7raf7xxHvYv1oj3AshYSt8XCs3R3d?=
 =?us-ascii?Q?ndXxX/v5q4mZmphj25kbN3UwtcPOpg0ghLraVNJsXrUenPOVjjUj5wI6V9xB?=
 =?us-ascii?Q?BbJi2v21kk9CuH+k2SE5t02GCmNjC4pYLq6BMa9OrvedHH6Bw95+GsHXmBoU?=
 =?us-ascii?Q?ru0qq9IvfDL+IvcSUfVdxygmk49WdHWZGcK0O7ED8wceA3ScUXNKktvPF/r1?=
 =?us-ascii?Q?ECie7PgUraBfMrsgc3MVSLjLm4SZrzSDLCYZhmMHRFg1JzbwOTEPOf7vkB63?=
 =?us-ascii?Q?AMq+2algHWLB/hECQqynsvBYUt1LdZzu2zeNvhj8S8UqTjHijpPBuqTB2Ype?=
 =?us-ascii?Q?HDr4xVklR7rB1x97VxFNFs43nRK2bqC4J4bOcWjnKV9Sz+mjKLpF1m1LEHH3?=
 =?us-ascii?Q?i5JASaPNZZYLvpPpI0cYOcal9gmcXa/RM4O21nIy5XsmdVcNMRCfWKkH+oTh?=
 =?us-ascii?Q?WSKnFcXj5BKr8YIKRXMxeFgRYz5Nnatrcc0/888+SGveOnZ+iKvABzsijzBA?=
 =?us-ascii?Q?NrSWSTTyZfEusgI3d0k2RNouQHfTHOVec86UhkXMczqaOSmtx8ovnNMuXTQH?=
 =?us-ascii?Q?6EK+c2ICn2Wf60wkVwh/dKYTAfoSoi9odvu6MlC7Bl2dmtxNoWZmO7+w75dS?=
 =?us-ascii?Q?ILuoBLIc+nRaZf0DVWB2m45BUpOCnqH3DCCTu90CDLdJtuzLQUq9kGDOP2+z?=
 =?us-ascii?Q?Jv5KfD8AOMA0qLCWSyhP7zFlKZUYPLHKtJXFOeBV+bGoQk2qCJ1eDkf4iAWf?=
 =?us-ascii?Q?PN0Ct1ynpibDc9zyPxGVPLycF1R+RslOqJ6Ir4WIkOBfPcPnLxTl9qdNNbO9?=
 =?us-ascii?Q?xKKNGY80XfrsrorepfvxTbpj+897tE4xruMV01U8xa5qb0hQ82tKHSYdWNrj?=
 =?us-ascii?Q?PuqIaehHGxRqRW8MJzyVhjPrGl91rQaZH3reK1vhfIc7GQZMMJF/ZOKzbiKq?=
 =?us-ascii?Q?2pb4xaAb7u/hAwFaDWRs66B1eiec3m6Earv3QLEeLScBSu31NcQfDyE2fTGE?=
 =?us-ascii?Q?ovrEAZgAxZP2UDGFh+hZyVyZzAu773rv7SAeS5Bibu0tE/DsDg4/8YNdiztT?=
 =?us-ascii?Q?FmbYZ4B3uqthqPCWjHYmNyorMaG5wzzAZ5wZsJ/UNgV+9SOvfvIRvggVbmzn?=
 =?us-ascii?Q?ntb+xCX5MJz99aEukndWB0Ye3mU0/IELd2DA0BimYtqP8VA7x0aVE7jSUfZC?=
 =?us-ascii?Q?+iG5S2PpixzFd1ZIfPLPuEfdGoA0LSgWZnIilakJyPjZbpYl0fIbk+za1iys?=
 =?us-ascii?Q?5ZVDY5/C7p+DAHJYhT5ncqUtYpB4jlNq6B6pqRto9nDHAhDAcHeM4fuaGwOQ?=
 =?us-ascii?Q?7rLIcc79+dECyDwaRT1UlxY0Gzc5eTEDwn3qk/aHc/soIR7v9FHt/400enfa?=
 =?us-ascii?Q?2gdlmg+NCyubZZI6dWPTtKd3YC7RKzy+k5LycZ0hYfuuGbAu3Gu1fXP+WfIn?=
 =?us-ascii?Q?81pUfoNGXn4zimiLBJkU1giyHoIvr5IBkeQcHDul+9mO3tBhQLdgMeoRh8eD?=
 =?us-ascii?Q?w0D4g+YceMTDXYz3gFVQrs6rRGZZXBa+aw5mB2ZB/eEQEhqeUPMYSRcMEkAy?=
 =?us-ascii?Q?pcZRrqCCD1U1jsni5Pc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 13:29:41.3735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5c25b6-1893-4583-5aac-08dde95b9b5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLaIQgFIMXoqoUBuHp0Qf8ZEIFxMA7OHc9/C4jdqDKI=;
 b=jbo9Bfx8cAsi1iRtI6tKJIbqmB4H1dZofpwp34PMrigYtAvmwzL+OsG2WKPetgQ3OkCNX0EbWneBBJDQn3WK05y5djPAUbYx8+ShKcteRqh8dGtaKdgPCW5yUvVzaGaQTg20wzdYOMsVSox3n2ocStt6/hikRfJZf8uQLx/UTkY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jbo9Bfx8
Subject: [Buildroot] [PATCH v1 2/2] configs/versal_*: bump to Linux 6.12.40
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

The memory leak patch is included with the Linux 6.12.40 release tag, so it no
longer needs to be applied to these defconfigs:
https://github.com/Xilinx/linux-xlnx/commit/9691533f6e6fd0a596ac7688e82eeea53f22c434

Also, since all Xilinx defconfigs have been bumped to Linux 6.12.40 with this
patch, the Linux 6.12.10 (2025.1) hash can be removed along with the
Linux 6.12.10 memory leak patch.

This patch has been run tested on the versal vek280 evaluation board.
This patch has been run tested on the versal vck190 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...ux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch | 127 ------------------
 board/xilinx/patches/linux/linux.hash         |   1 -
 configs/versal_vck190_defconfig               |   4 +-
 configs/versal_vek280_defconfig               |   4 +-
 configs/versal_vpk180_defconfig               |   4 +-
 5 files changed, 6 insertions(+), 134 deletions(-)
 delete mode 100644 board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch

diff --git a/board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch b/board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
deleted file mode 100644
index e9dfee9f97..0000000000
--- a/board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 333678d7b9edc29e8148411d48f70950b1b614c1 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Mon, 2 Jun 2025 11:07:03 +0100
-Subject: [PATCH] include/uapi/linux/xlnx-ai-engine.h: fix
- CONFIG_XILINX_AIE leak
-
-Linux Kconfig options should not be exposed to user space.  This patch fixes
-a Linux kernel leak of the CONFIG_XILINX_AIE option by moving the changes
-implemented by the CONFIG_XILINX_AIE from the uapi header file to the local
-Linux kernel header file.
-
-Upstream: internal AMD jira process
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- include/linux/xlnx-ai-engine.h      | 37 +++++++++++++++++++++++++
- include/uapi/linux/xlnx-ai-engine.h | 42 -----------------------------
- 2 files changed, 37 insertions(+), 42 deletions(-)
-
-diff --git a/include/linux/xlnx-ai-engine.h b/include/linux/xlnx-ai-engine.h
-index 44a1e40ef9b8..10905dc84ae9 100644
---- a/include/linux/xlnx-ai-engine.h
-+++ b/include/linux/xlnx-ai-engine.h
-@@ -171,6 +171,13 @@ static inline u32 aie_get_error_category(struct aie_error *err)
- 	return err->category;
- }
- 
-+int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
-+int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
-+bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
-+int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
-+int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
-+int aie_load_cert(struct device *dev, unsigned char *elf_addr);
-+
- #else
- static inline bool aie_partition_is_available(struct aie_partition_req *req)
- {
-@@ -271,5 +278,35 @@ static inline int aie_part_rscmgr_set_static_range(struct device *dev,
- 	return -EINVAL;
- }
- 
-+int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
-+{
-+	return -EINVAL;
-+}
-+
-+int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
-+{
-+	return -EINVAL;
-+}
-+
-+bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
-+{
-+	return false;
-+}
-+
-+int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
-+{
-+	return 0;
-+}
-+
-+int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
-+{
-+	return -EINVAL;
-+}
-+
-+int aie_load_cert(struct device *dev, unsigned char *elf_addr)
-+{
-+	return -EINVAL;
-+}
-+
- #endif /* CONFIG_XILINX_AIE */
- #endif
-diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
-index 424c5f4c4097..1680aed8ad85 100644
---- a/include/uapi/linux/xlnx-ai-engine.h
-+++ b/include/uapi/linux/xlnx-ai-engine.h
-@@ -781,47 +781,5 @@ struct aie_rsc_user_stat_array {
-  */
- #define AIE_UPDATE_SHIMDMA_DMABUF_BD_ADDR_IOCTL	_IOW(AIE_IOCTL_BASE, 0x1e, \
- 						struct aie_dmabuf_bd_args)
--#if IS_ENABLED(CONFIG_XILINX_AIE)
--
--int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
--int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
--bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
--int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
--int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
--int aie_load_cert(struct device *dev, unsigned char *elf_addr);
--
--#else /* IS_ENABLED(CONFIG_XILINX_AIE) */
--
--int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
--{
--	return -EINVAL;
--}
--
--int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
--{
--	return -EINVAL;
--}
--
--bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
--{
--	return false;
--}
--
--int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
--{
--	return 0;
--}
--
--int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
--{
--	return -EINVAL;
--}
--
--int aie_load_cert(struct device *dev, unsigned char *elf_addr)
--{
--	return -EINVAL;
--}
--
--#endif /* IS_ENABLED(CONFIG_XILINX_AIE) */
- 
- #endif
--- 
-2.25.1
-
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index b14fa3d7ee..994d637d50 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  25795c354f30a3358506ab02deeac99e7f79850804c52d6c3d5539fd310f0491  xlnx_rebase_v6.12_LTS_2025.1.tar.gz
 sha256  ea55acf69bead3d4cf121de414cccfbe75a3c36465c93d9500cc00688d9b8d9d  xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index c9d99876d5..8640d65582 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 4aa25f8d67..6c434199fc 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 500298c2f4..c2d52d7e33 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
