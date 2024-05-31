Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A0AC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBAF34163B;
	Fri, 31 May 2024 09:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZzOO2TnWak1; Fri, 31 May 2024 09:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18AD24163D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18AD24163D;
	Fri, 31 May 2024 09:48:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AFBF1D502A
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94B5C606E2
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLfLUb42Aww7 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::601;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B536760641
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B536760641
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B536760641
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ks2Zs1NWnhUqWSGRCpOaxG02zmJLsufXdcxJPVgfomq9uLDWxXvJx/BGymp6eWoUm7eEopPCkO9tshjOdutEbRZT2xoG9TG1y2t7S0j+fKJmA+Jas0NZDFTVt01agdAH7P6CrqLdki14KhcFD3BB0x9uVVNNVTNDWIrCBFTjy4/wcw58cnKCgM9zd+os839MQ1wz6QfibwiP3Ht/cAtzJQNO3EIrEcw1duWopVGzOfexx+rod4CD61OKDB7YjPK6Idwds/EaWfzth2DF/DquS/P9lSGDTMRdag3ncPTa4dZAusX1geeReb8eBOe+ecT9+q4vV/+wVycz/2dOE5iF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbM7f01rV8DjyZI/0TecY7ZFxWh3eg4YNdPKY6iJDo4=;
 b=Q7BA3MFb7RArRk9F/RR+LHEwfPnTsUZV3sLuwqfUtTBSyjgPuZ4lT51QOQICHrsBbsmzZRecoc0z4N/V+Inuda+1VFqgnh6Hn4LApIPvo+j25nTuCInsdyOGWhkMRuYw4ZhrKlw7qnGaUtHxpSEbJZ5OIErdSSBB3/+DKRrLXOaQKTMb8GAcQ7lpwkgX0cG3pjBgNazENC8gA7imoCzihDoa/GZZLLupvzrAjMBeO4AlUApwX6wZUgSGY0HRibGTZ2QNvzP87XUrMMMXJxMXdbUcL8cTSBYV2mD8xj4ZaxJPFXzUvtdhXJNW2sjR4rtTz+P98Ck8udlCaGRImEnpvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR03CA0335.namprd03.prod.outlook.com (2603:10b6:8:55::34) by
 MW6PR12MB9019.namprd12.prod.outlook.com (2603:10b6:303:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 09:47:59 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::17) by DS7PR03CA0335.outlook.office365.com
 (2603:10b6:8:55::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19 via Frontend
 Transport; Fri, 31 May 2024 09:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 09:47:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 04:47:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 04:47:56 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 04:47:55 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 10:47:46 +0100
Message-ID: <20240531094752.3760287-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|MW6PR12MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f31f064-1e91-4883-a3e0-08dc8156c05e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|1800799015|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X8u4Rv7f50BmxToGb7Om0zEMNWqtyf/qDBpkuPWiY/jeECMl8oBLbTVhUrtG?=
 =?us-ascii?Q?bSJyVTWTiyZn4mvS4T7YSqe+4gif/36WWyoUrRHSG/JvWvDh1+lbc3yLhcT8?=
 =?us-ascii?Q?xM0L4oqok4f1UGky0dYBmWrGDFzJ7Fiwd5VjGWLeyyV3GUI5/mYqkRfNnx22?=
 =?us-ascii?Q?v8txpyBNJXsDDbJ1yWYd0mFDl7rKUWrZzmbas5bm+jt5rECjRGe1kSeas6om?=
 =?us-ascii?Q?j7v2RT2LF3AzVKXOpIqTjVgyL4quMNgwTGIbSiwTxWM4LRggW8PQsmaABq7F?=
 =?us-ascii?Q?zFhbCmlerMv+Rb3KAqHKMkgO9UUBRvxQZkU7SlSXZGHsUuQhx63X30tLM1VT?=
 =?us-ascii?Q?uyek5+YE4130s8Ij21V8CgQhqD3zJk4BKM0YZDNNURIxDKg5SfhW1ns/gLHY?=
 =?us-ascii?Q?mXN9g/kN8vbpuvRs4L6Kg24m+9BRUVR4uU1M65rTFWoCmEZn/OEB4S0U02d2?=
 =?us-ascii?Q?MHrZacLBagZRjTe0za+avyDOqowx2YG6Vt0aWXKGPegyYIhu4cnbZldWZoFx?=
 =?us-ascii?Q?jZLJst5Byv0lA1FdmZm9qHyD6Kk9FbCgP3UG+EfdHR6xzmMfPFKQATyy0EzG?=
 =?us-ascii?Q?T6lXxvf8+ynkbfbJ246sUssp1KYXbkOIoJjD6BqQEbNbRRun6ThwRKXt5Gdm?=
 =?us-ascii?Q?qiO/glyIYaYzl7kYDJwpvEh//jE9RHIIfa4c2FLuGjRYGCTZIB9m9tU5viRl?=
 =?us-ascii?Q?SRpLyt7JBp9h+AWmDaqqoqrclM+w8sveYoEQA4SVqfoQPs07nNL7d75sK+/r?=
 =?us-ascii?Q?ZIpzjIvRykjiWeB/DiPukFPY33iCWZEPPPfHZdH0jV1Z6xBUmncFOoA7xmNC?=
 =?us-ascii?Q?kxRR7G+xeMgsV9aJ2KT1nWPa0XC5PGE6olZw8AyMpFe0sK9NrQtMVuERyIKF?=
 =?us-ascii?Q?NjATuIyjPcU6CANKqMZdIB+c6zm9gXXOJPZsXZFUWdMXGtN7fCDnAPEwgNH6?=
 =?us-ascii?Q?OAHedQoN7b6+xJlewXp6PaG+M/mbMQWd5hyabJUUFQTKb+6hIeAb2KcMZMoa?=
 =?us-ascii?Q?JlZPrgvrCBHq0fMDF10mNfWpKPh68W925LFT/7PLTlqKvE4hKRdFGYPdd2j0?=
 =?us-ascii?Q?EM2/di90Szkhz3fG6Cw9Rmunl4hWWID0sHL2mNzBFXB4dnRLJ0g9xEWEz6fP?=
 =?us-ascii?Q?rkZL6V+mEDD7XClj4WkecGMYXf7zkIxi4d0JGKTaGoFKnOXcykk+LM8EBjbV?=
 =?us-ascii?Q?ePr5s1iHZwHokQF7N+ou1/nbVrZcIHCsJSutR25LBwzSM0OzGc0G1X7jfwbk?=
 =?us-ascii?Q?ywYMBp1E9X1PqyqVaMHcf6RsyM/vadeS60bA2IvbCP3ilB2swPYmRnW/+yAA?=
 =?us-ascii?Q?nSG06lMv4ApT9OFGIffKLW7c781kL8+ohLdm0QfcPcIT602mqGqEAxji4ae/?=
 =?us-ascii?Q?vbDBxNDs5YNXQctcuOM4yJf7Qwt9trZza0JvRsgaSynlr2xQ1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:47:57.3584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f31f064-1e91-4883-a3e0-08dc8156c05e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9019
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbM7f01rV8DjyZI/0TecY7ZFxWh3eg4YNdPKY6iJDo4=;
 b=E2CoJeUbl7m9nwkRuXRX7FnDMYyVGdRxO0Ur4Qjtcd1DRZem5APX7yiXHZEvkocjM3JmQqpTOElUl6oxfWzDHWddV/vW6po1PoTWNfxedAUosIAhJJ/y/8HNQPvASnPgt+OzI9IqZbxCICPNqfPwyrqfx3FghaWjpq7hne79oBo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=E2CoJeUb
Subject: [Buildroot] [PATCH v2 1/7] board/zynq/patches: add xilinx_2024.1
 hashes
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the Linux and u-boot hashes for xilinx_2024.1 release.

xilinx_2024.1 release includes:
 - uboot 2024.01
 - linux 6.6.10

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
---
 board/zynq/patches/linux/linux.hash | 1 +
 board/zynq/patches/uboot/uboot.hash | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/zynq/patches/linux/linux.hash b/board/zynq/patches/linux/linux.hash
index 8ed4bbead4..db57012f98 100644
--- a/board/zynq/patches/linux/linux.hash
+++ b/board/zynq/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  56acddefc6f6fdc00df5b75ceb4f86a9d0af9a4fef78cf57f9f2c274b22f006f  xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz
+sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
diff --git a/board/zynq/patches/uboot/uboot.hash b/board/zynq/patches/uboot/uboot.hash
index 35e54e0baf..516707bf26 100644
--- a/board/zynq/patches/uboot/uboot.hash
+++ b/board/zynq/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  32a997a748697ff27e5e6db8edaff5ba893077214bc18b5267daff0b708dab53  xlnx_rebase_v2023.01_2023.2.tar.gz
+sha256  58e391a001d9d8ed347ab3258ff7c8435c866b1ff2b2c22ebc95af592444c0f5  xlnx_rebase_v2024.01_2024.1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
