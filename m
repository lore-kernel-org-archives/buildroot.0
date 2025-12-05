Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47111D33992
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD7E61CF4;
	Fri,  5 Dec 2025 16:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9WCT58vv9y3; Fri,  5 Dec 2025 16:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED94A61060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764953051;
	bh=b5GksoWL/diOJ5VVHnBDHYC2QgCKg2bE9X5ulBea0qA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=NmYS0flBowvLPNWi6uWZHSA6DtF+BFPwNDeaiDHXTh7LauAELb4Re6aom33cLFQ+g
	 s9pgTFDduXh7tTa1B6250E+A20+CMKiRUNPvflJmJ2qgsoXDX6Z45BVqUOJmMwUJd7
	 x66XfGdQ8oF8UoktdLpN2Y5lqnpBfC65NQzJFNb6DQQtnRI+jwOeDobmvwJY6YtLeM
	 pdhSi4mN2YBOpb6lJuYoKW52Xeb2Zkv0GiarMjsK1ZU0RIEGNCb0TojpkQHW+xGJB/
	 GF/E3KQmnXk7KzqHd42uhC/uTbP4WByCuLGOesuhnVbtt2pmvM3omLW8w4ljSwoKTD
	 tewXNuTYjI3kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED94A61060;
	Fri,  5 Dec 2025 16:44:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E862D1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA9C1416BD
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GULhFvQPqima for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 16:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c007::2;
 helo=mw6pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9781400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9781400F5
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c007::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9781400F5
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHGvTGrLTeSqU2KpiWbFI/6BoyHd3FLd3WNBL8O1yfPvcuQwkle97nSa/BC7/SldsOwA/5vuxM6z8QwYTBKPrIJ3ltuP7rR3Y6EtMK+qwcQIA2p0I0UmMelaaiz9suqKQ371/2OA8tY5Ax3+DeJsDVLwl/emXYyC9IapI9188d6IzV1P0XNrpCc7WnF0Cq+Xb32rZ3aQLzq+3aswhB+hDQzIcPbjEM+Nsck2ygLlyzf0ngyjZhdqhpBSQjdS+VEy0pXmt8aUOQCsDz0hHFtONnYK7lGMSNLt8IiRmDCP2tX5fUDtzvQXudCdCG6VLVsJYXAk3qT57yUud3HYDVVdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAWi0OCWXDNzTuoNN2Gg1XDYZsgdGGTYrjwyZsYGsJo=;
 b=Belq8+DPk4oj10d1oM7Uej/8vQgvBfmxr4/Caa4EL3gYP4wJYtD9IcTQxhL8KiCoXWvmBJufYQS8TVIDkvd5o04hKkZEkSKYAOEyz3y7wudk61w+kqMLL/U13ZHcHVk6cafMYqPPvUxcocNRlCWiApzP7UMBx+dEVT9+3hxp52KMq1P6xGxfho1dtpsmsO/XNIsQUP7mM/hEcHUg9vmTBzqV/6GaZX0Di2XTSnI/VrDErLthGsqBi7XIn12Q/epT7ZojWR6ljZ4cO+QC5NbVY4reZ+/oHy1WSbO7unqtTpE8uHbdReqodU/an6ygp2eo5xc2YwNVYxC9xEFj+gKXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::7)
 by MW4PR12MB7000.namprd12.prod.outlook.com (2603:10b6:303:208::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 16:43:59 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::6a) by BY1P220CA0020.outlook.office365.com
 (2603:10b6:a03:5c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 16:44:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 16:43:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 10:43:58 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 08:43:57 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 5 Dec 2025 08:43:56 -0800
To: <buildroot@buildroot.org>
Date: Fri, 5 Dec 2025 16:43:46 +0000
Message-ID: <20251205164346.2031642-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205164346.2031642-1-neal.frager@amd.com>
References: <20251205164346.2031642-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|MW4PR12MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 7745466b-7bf5-422c-02d8-08de341d7d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cCDMGjwGbbdq1HULT47pmhP52KY1gE8gDZCYJES00/95aFsPMPptGAnE8NQt?=
 =?us-ascii?Q?dTmCu2HO9dgpu21j4MO3F4swMgGKNiJ65XoXYAWZEqeOwZngkMwEz+SMgytb?=
 =?us-ascii?Q?345hwo4w3NMBO/8JGyXglrLY0MBsAoiB4KyMfn0AC5rt6JXw36MTJ+PVV6px?=
 =?us-ascii?Q?VBVlXiwEtAsccCThKpNFM3ucOhoUzi+wFEdjSCNvSHTV5YCkWffEBp2niJ1B?=
 =?us-ascii?Q?eJEzS+cnleyXxxnri/U93B8WFVeYAIsesqOe20plkXLCX8okQ9sCeWL0CS7t?=
 =?us-ascii?Q?x2Sy+ywFJtoqTG4YUOlnoOMDZIZRbH+lgMmwFGtKVcYinvKSIeC5LfIcRNbx?=
 =?us-ascii?Q?B2S/t6nKdHCSnR3Y4qPIJudbcAtdeFsg4WiK4cvC+NWuWcBmXZAYuMbvhB5T?=
 =?us-ascii?Q?0ZhFo+n6u38TwU074Jsphk0NUxp8lPnEcfBwThsShaBcubS5jGeE1V+W76mM?=
 =?us-ascii?Q?V37z/C/DFe5JUfJUD3G42LjSY40W6EgtUs0asaqLNnm6NpKKRC0tSkNJNZkU?=
 =?us-ascii?Q?xSDDVQLfT7lWii0hnQuNgkRH0wD0bpviMgeehTB8FJW5x4vZwTRtgPpstYkf?=
 =?us-ascii?Q?thRXfP4Nf3j2DHCJNHkhbZWDZkYtsxQWhsOPp3BY2+zuwkqGGbdAgsFU3okC?=
 =?us-ascii?Q?OAilPwtz/jV2NM8y2w+4zznxzONWTjEckmmwz19fvH8vZZxymBFNufyUGa7i?=
 =?us-ascii?Q?w8Ifl5S9ERYsyR/UG9O1SVFdpr3vJeZXFkPpsNjps9Dstu8KFkJCVPrfnm9X?=
 =?us-ascii?Q?HrfH38b/b5uy0GR6HWdOB1ApvNEytGxOvpKtOlv8+vh8/JkqDbxZDTCjyUJh?=
 =?us-ascii?Q?y2nwM9OhY2sjZWQyLblpAdE4pKDTcmF60kd0JqSUdJqwAZJAFgJxxy3R0BkG?=
 =?us-ascii?Q?xsnWgQYaABGURItv7iR+XV+yhuHWhN4yQdiE4owJHRhzVpVAd1iwvddV3WhU?=
 =?us-ascii?Q?vyklGWjtF2ovjpiPC+jbfbvf4A0lrEpvtj6c6fmMHaHTzHKvFoJaMZgCxOfM?=
 =?us-ascii?Q?dGhDbRRvTBiLifWaeOYmn77Km6reSLmFJVv+eVnepi/qQFxoI2A5rxg8UIW3?=
 =?us-ascii?Q?0oE0hhXcX5BkhGP290dZrAoxfRqO9WubLiTQzeVXCnmIfazxiEw3uyBl+t/m?=
 =?us-ascii?Q?fFsAZWe69Omi3etySX7bATvFt3qcl9c++d+cyMWzuJ0e9vEd2sNmeoUAhYOA?=
 =?us-ascii?Q?MMAs9qBS2hEy3FVwWzrm73Id5rrrjen5J2QOaf9xQ9sJHujF5awPJkwVIsJg?=
 =?us-ascii?Q?8GxnnL2/3bpLlfQ4Po9ULXH3EKQiuPLrPreHfT0wUNIamLVMvdHCxQKLKEVQ?=
 =?us-ascii?Q?e8AnPV7B1tKHSJC4vL1BOCwB/zOxBMH+T0RehQkUkJoFm/Hs/CLJIbieZmBX?=
 =?us-ascii?Q?B1rLsANrPlrW734blTYHEMXXI36aOL/Gll+wYABtsO5WyFJS9i5C5rNqz5r/?=
 =?us-ascii?Q?sw7MOdakY9E8AJRYqJH3oIY6ko8wV/+3k+w8pXolBlWKuXKYaNH5lTQgFrZw?=
 =?us-ascii?Q?jmZ+NQdk3212n3igtuKy5hhcEmI9Wty4V+MAjYsQsxZ7xRb/eOqJxf7872gK?=
 =?us-ascii?Q?ip5uTjiIidhptn3FNv+7pJa+esIebXsTPJdv5bVu?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:43:58.8548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7745466b-7bf5-422c-02d8-08de341d7d0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAWi0OCWXDNzTuoNN2Gg1XDYZsgdGGTYrjwyZsYGsJo=;
 b=03KtfN9lp6dkEB+T3rHkmp2FbXpq3wFZpuwkpF+t5S/1O5Z+cqT/F0M7XeZrb/ljtkjFzpj0D6orsE1wo07bDKCKxvcATNpR3aOoidn97piNxAGNLw86XYRf99a0MtD7oKI6zC9kWHn17dgk5PYIJbOS7R9w6InfGTqtt/Tsl4Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=03KtfN9l
Subject: [Buildroot] [PATCH v2 2/2] configs/versal2_vek385_defconfig: add
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

Since not all versal2 optee_os features are upstream, use the downstream
Xilinx release tag xlnx_rebase_v4.5.0_2025.2 for version xilinx_v2025.2
which is based on optee_os v4.5.0.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- use Xilinx vendor specific optee_os release tag xlnx_rebase_v4.5.0_2025.2
---
 board/versal2/post-image.sh      | 1 +
 board/versal2/readme.txt         | 1 +
 configs/versal2_vek385_defconfig | 6 ++++++
 3 files changed, 8 insertions(+)

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
index a2d57a0976..9a70a6bcb2 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -26,6 +26,12 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,ar
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,optee_os,xlnx_rebase_v4.5.0_2025.2)/xlnx_rebase_v4.5.0_2025.2.tar.gz"
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
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
