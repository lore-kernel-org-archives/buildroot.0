Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF303D2E01F
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 07:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6441040A23;
	Fri,  5 Dec 2025 07:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4hAKedPv4UM; Fri,  5 Dec 2025 07:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73D8D40A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764920720;
	bh=oyhf/G4avh3EtLXvUkoKcVQKnrde0F4AYRCYglUrjoU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=N4284Upe2guLJEvHQCWnmsQ9B7IzGDsoWpkbdGm64qtrFhDuyuJtyK8EURHGE2Isj
	 4JS1rjvAJjwLpR2VWDXQLjd+tWh/TKHlv+1+5/Q89v+NCAZBx1bR1LGcKUvUBUCO+g
	 OjLI0eFhAxS5VriwRdu3OEKWbeudivLardJgYgWA8y4xZHiWxYjrJvdOZCQRQWD3qw
	 JSsi3BKFoPLoVtzKZEE9O1bX4RKIYGSWdrZXfiHrt6ONhw5rZfUZU6xzDIj9zyZzLi
	 y9LdIpL4pRAFN6gmLqr1a2J0nlrMpazVFAr/aHCTH/GsYTNud8cYu8/i8IVSGrf6ow
	 /nLA92zfyv6aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73D8D40A61;
	Fri,  5 Dec 2025 07:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 890E1E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 07:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A35760860
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 07:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvwPYTkmXiLd for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 07:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E9A860853
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E9A860853
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E9A860853
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 07:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lla3Vm43feJD4AycyqBCXgV6tQXgKHI6XN6DInR5YqBb0nMqEJjrDRwJ7x81HRSZkJOp1/F9DYtHGUGkDCP3JzHHnpUt71dXnwbMGx6irXE3g2p2qdvVmhpztrunxgadVA6vVaDcQp9Y3+RCDU3EuvxhXlKmSYBXArMMpdvC5qd5R1kSevLEfcLkCsHUHR7DnndVWQeoBhkg4Gsg19l4UNiFQmxxu+KHJhOS8pUuinwcKIyUy13g1VQNh0TLxZHCPA+VzJpPRQxm12AYY3idquz2swQ05SygtKthiWirIt8Ygv5iQAJnIKNzTbYR4fd/33KvAOtBv24PbjKdWh4qoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbjdYI/CgODrAVGunTkDHn0CnyIvHr9eDh/6efyiX4M=;
 b=j+n4Ev8AvcyHjmqg4yCQjA5tPOij3ORDBSvxtiQ5q57dYpydaCBpKMbwPcwFk9xEkxeomDrud3+gCzlL3u6bxNLJzVyyPMwgY/6PmhAd38IT6HNal4J8Lk0ihD1LajgObhkcv6hKY302yDgbzb/dngICCqCKD7mP+JDi5+YBd/InXMeB1HB4/GDbdlRSRq8niY9Aon/WVUNkfm0SkGh41Q8ODZYbO3R32ZIRXKPPlcLApZ5IyVNN77s5mnOHbIneifvm5XnnHj5l1UiFMZAd3lyjaP+5hAy4FLJ2TiXIq7NNGGrK2sy2S+C8yF07g/VIHbpFMoOq8q07/MZpdYiy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:1d0::32)
 by LV8PR12MB9183.namprd12.prod.outlook.com (2603:10b6:408:193::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 07:45:09 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::f2) by BY5PR04CA0022.outlook.office365.com
 (2603:10b6:a03:1d0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.10 via Frontend Transport; Fri,
 5 Dec 2025 07:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 07:45:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 01:45:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 01:45:04 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Dec 2025 23:45:03 -0800
To: <buildroot@buildroot.org>
Date: Fri, 5 Dec 2025 07:45:00 +0000
Message-ID: <20251205074500.772333-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|LV8PR12MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6d35f3-fb61-4772-79a3-08de33d235f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m509M+qGippZRLfb6YBSi5rZVyOdjE9mf/F7yB9JBZAEcQVTvkh8guMH9r/m?=
 =?us-ascii?Q?CsV/ymAwOaPw0DRvhs2N2WdN8OCKSzZcTm9Xoz9MQ+Iz/la/RW+odAklZDJm?=
 =?us-ascii?Q?Pf7FL6EbUghIBa6AY4tLGvjX831PiVo31s87qeur5OTc8Em9bCOOC5mNG5E/?=
 =?us-ascii?Q?B+macXBvfi+kOjzHIiXyhcQ3Bf61uLWMkQ8UlGl9I6oR4uwia8McW6KYlSVO?=
 =?us-ascii?Q?SdzNTfnifWl7g91fYBVuNQyM5z0y3s7Bny0cF/yM/UaFGllVM4o77qITCY0a?=
 =?us-ascii?Q?raSNZtt2fii6sMwvleoPGucvYfeADX4qcBBhM2lMYW5FRs81Us6dCNoHvN3k?=
 =?us-ascii?Q?BPQQ8zEnjzzA1TQ+L82StDMF9wqdLxabDP+LbE4gBzKA+PTrT0Aizfyi5BaI?=
 =?us-ascii?Q?SRDoKvZm+7KIirev1kq0ofYLc4IgksNtbK4zh+DQkMvDmH3VIU3AGlOvhXqB?=
 =?us-ascii?Q?dqLO3zmII6SVgEx22MjZ5hQVFIRG9zXT5JcKT16ssC9uHZ2GMpATR1NYYjb7?=
 =?us-ascii?Q?J5y1vlWyIVfJVsyE2/7Ayh6D2DkZvJ8cM+cGg0zKf2c8c7//VeqZW5wYz2Hx?=
 =?us-ascii?Q?4ab/BDTZ2j5XuVTxb1Zb/S2fdCQ56QO2MdDBFRn0ajwNa3GJfJT3fAQOIwdf?=
 =?us-ascii?Q?F0GQVxGcbkKeWF28MqwkmAc0TFRH0DgstwHNmJMbJb3+7MbN9gAsX82+teCr?=
 =?us-ascii?Q?1rahnMDf+PJzpgA+dU+iHD2maiQXhz+xrfKKPJ4bYOcJGBdhS+DU/1ReomUM?=
 =?us-ascii?Q?dmyjkql5vXiLRaDzF5rH14CADeYmhbLc7v/8cOke0SnMtRXUx7JNUmurdX3u?=
 =?us-ascii?Q?jLWD12tT9P85POfKequapdlx/lb3JtiDE5fIcwrpwi+jZP2AEhNRoUIW/Nne?=
 =?us-ascii?Q?ICqPp7OOBNTxnPlhJ8mojBKVPLDK0pkqBC+q6YI/x0EOUGrw3Lgw/jlBkuwT?=
 =?us-ascii?Q?0KNbEny1lWGz4Mjz6zZj4elztDEtehQjFfUY62G6thcY4qmAIz/bij50/AJ5?=
 =?us-ascii?Q?bfwmB0z5QQ770UGD0Y4cbeuXUqv17NarHucA51W0IfSOVso/ywH+DlEfM1lO?=
 =?us-ascii?Q?jIUqzCJIr5XXR3UE+sCdXdIe+Tq0sXpXMuPh6F09M052b7u0axu8wBalpoec?=
 =?us-ascii?Q?xAUKWoU002aFpmAAdGrw/R0KdiqEw+P31wQi0YBl7jwy5wxSa/VDjr1gD50M?=
 =?us-ascii?Q?u28DsAJvtPJDMQe+z7JqPlO7aTH9FCNxJ0+6vl3SsJE6KOjnf73GH9yNK2OI?=
 =?us-ascii?Q?Dpxyl94JXIspd+l/gLT4Plyb0bE037GLKU0A0obk7DbFgbGwin5iPmvc2Xvk?=
 =?us-ascii?Q?qeELStyKmtdpgR8K1VksPZG9lmvMDmdtWG63ZfQEZR5GusSHOD+OGNYNrPps?=
 =?us-ascii?Q?f37DvmqcatnLR/xhAvS3iWyTolhM6N4RlsFOiVjWl0ws5hopcyNKTT+mWueH?=
 =?us-ascii?Q?nu44k3so8JQXojOvLzqhKeo5uTZqV7p16r71XMDwfxtFwekxlbKBBvdEeOn3?=
 =?us-ascii?Q?oJG3ohUXa1tzkxeNqYDarfIkD8lfM0blHto9p8MyFbPT/KIuQzNObRdN/Cq6?=
 =?us-ascii?Q?PZtCN4XcJX+6gny0btMOlGXDBQcIZuO7A9L7gIV2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 07:45:07.3840 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6d35f3-fb61-4772-79a3-08de33d235f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbjdYI/CgODrAVGunTkDHn0CnyIvHr9eDh/6efyiX4M=;
 b=2z9s2gIcP3Nj3emPa6Y5BQhtDeTHs2ew/CXJnubPWPR3kK4SszRvTpTfo4K7c4KwxcTMsrQ3EPiW1d+B109E/RypF8lz8ZeqH4IbcPUEZXCe/OxEhkR3ynnsuDfZ57ApagKPYqEtVl+U/HuuDie/Eq+uU/sQMlyzR7YxV0KI/Fg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2z9s2gIc
Subject: [Buildroot] [PATCH v1 1/1] configs/versal2_vek385_defconfig: add
 optee_os support
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

Add optee_os to the default configuration for versal2 devices including an
example with the versal2_vek385_defconfig.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal2/post-image.sh      | 1 +
 board/versal2/readme.txt         | 1 +
 configs/versal2_vek385_defconfig | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index 36cd2eda19..17746271e1 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -19,6 +19,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	    id = 0x1c000000, name=apu_subsystem
 	    { type=raw, load=0x01000000, file=${BINARIES_DIR}/u-boot.dtb }
 	    { core=a78-0, cluster=0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
+	    { core=a78-0, cluster=0, exception_level=el-1, trustzone, load=0x1800000, file=${BINARIES_DIR}/tee-raw.bin }
 	    { core=a78-0, cluster=0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
 	  }
 	}
diff --git a/board/versal2/readme.txt b/board/versal2/readme.txt
index fd7d092cc4..4498392bcb 100644
--- a/board/versal2/readme.txt
+++ b/board/versal2/readme.txt
@@ -41,6 +41,7 @@ After building, you should get a tree like this:
     +-- rootfs.ext4 -> rootfs.ext2
     +-- sdcard.img
     +-- system.dtb -> u-boot.dtb
+    +-- tee-raw.bin
     +-- u-boot.dtb
     `-- u-boot.elf
 
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index a2d57a0976..f0b15ea338 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -26,6 +26,9 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,ar
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_PLATFORM="versal2"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
