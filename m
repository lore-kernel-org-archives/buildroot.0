Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17AEC61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E4DA40633;
	Tue, 25 Aug 2026 08:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DG30awprP9GN; Tue, 25 Aug 2026 08:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787645010;
	bh=K66leX89r+CVDZ2S+0WekTp8wurxNscPKVFuX7ia23Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=a3HdTmlMOrcIi66NRMaO1hA1FQanl0ny8aLElg2bZreWScOhFinXV1+2TJwHNN3Tr
	 Wb60HPAfPGkf4Qmn4Om+cl7tMY1yShzIXdNJRT00bu82TSac4VJwMN9ALanJ+q0nho
	 i+7zcK03OeyOl9H5wKTpedrWSnr5xMZibPGQRLBX/cq3R23NZMJjhneyFbC1NBnARH
	 kARofdp0X4XSg0mUBbFtaLc0IF0l/8Am6X3ctHHlIqcV0nFjQtkIYNI16G4M35y74G
	 8DtSGReiZ9yAqHRnlxg6xs3f9uwvcfin6OAss5A5+bxeQilOgtka6VFKH52jML/RLv
	 KmxgrT4fV6/gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7465840613;
	Tue, 25 Aug 2026 08:03:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90BC7118
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F6A80D07
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zd5jQebzL6Ho for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 837CC80CDB
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeZSCRMxid2/qKL9sdef0loahtpFWdutlVhHVK2Wdp6eUZa5dkbHASz+ljwVzOca0eyTcNyPW+jQvmjPIcVlWZ4Nkyj64bFnIXgY2Xvt46Eelhm3DrJClk098tVR6H8vC3ueLKC/LYjPmPbkNS7smRQnf7nyc8gKfb77/tlGAxSolutEgolc3DnO1IUCPZSjoHXismCj0L+xzeJaMHjP48g+PC06KtguqH5POmzJODZAJCCWioN7Ym8dEK9KB4K6zJoFnzdGwQAmWntue5W0e2xUXHN6DHaAu8Uw06glvHuD5oF8LXturLYFsSVFZEsJv4jY/wiMQAgZg/3sOKqGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4Juo6qgSlbaYkss+3XFzSAl1HVi19y45jrHTB86mA8=;
 b=m1lfpU36CDbjVFRjofg1tgJ7Z3LLIWVI2nFLNU0Dbwp0tKvBWn62qYgCjzaSM8zNfQT5fX1FimiizOW0GSqGGhZaPP4dXE/O7XYEUknHaxFuNV3IulzA42vUJvDi65Qavpa6BeB/3bpCMj4ZC7gGdpwrkkZXQLwkcjhVlgGmQ69WRrHOhx0Vk9w97GJ2DoxQHDZ8gGXZDtv3agPFD3NUeOs51krtUFhhISEMVQgx7FWb7+4jHEosA1ntw6tLDsuloG78D2IIV2eCD9VQFOViwWW9+OOIPHiTYl8irn5mFcNtnyLMLSmtm5JUpXdRZPFZNl8ws99q8ot6V1mFltrkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:335::7)
 by SJ2PR12MB7800.namprd12.prod.outlook.com (2603:10b6:a03:4c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 08:03:19 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:335:cafe::aa) by BLAPR05CA0027.outlook.office365.com
 (2603:10b6:208:335::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 08:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Tue, 25 Aug 2026 08:03:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 03:03:16 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 03:03:15 -0500
To: <buildroot@buildroot.org>
Date: Tue, 25 Aug 2026 09:03:08 +0100
Message-ID: <20260825080308.3606178-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SJ2PR12MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a18a81-48ed-4fa7-c6e5-08df027f5245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|6133799003|3023799007|18002099003|11063799006|5023799004|56012099006|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: rupOh1SyL4JqWzVJbWzQNCw3ki4k6BwT/bMzDXRwIoIq0FFndVYp244aU1or8k4jeoDLMoJahG2xWZZO6NczJ9d84OGaxbvPZHNe+MeXeLnzuFNUXdQ5JTUYCKSffhiXcf05cEzKwTrGhEavy8SHONn1ERmyME94Nf9Sra/P1KWB6Z6XSU2e76D2w3HV05g5eBKwqvl1Yq5XvVrW2qD0JoaAgm13eWybXOwAVCo7qDzaTTHF+U0GhOGfubhvAFNBfelRKXEPUCPxmOLEAfnYZ1+ptqEdtvPahlNogryizSxl9OBoHh1y6vQeHT9R4QQf0MrzvMmgXYjee7gfaWkstLzWCEBMNFkFtwmioKvA5f2t1TJC66fz6P0QyzbBCUeCBm9H5r8D6cFUY4DpM0OyUwH63sbLwWp1bWE2TDtxXeL9t8Ck3TtmxKXTn9Qz618KD9BqbejeGvVu2xxGEvHXdQl4ek1pI9QVSZ5GbazVvb5IFKXOpFv97st7BCWB2HHErEar50ar4U8ZZlx8yT7H+a1Dg+BbKY57KoAV+zC6zpsblAyFC6okiULI4BVATVyeeamTEY16G0VB9YdkrrdyeJvG93Fh/MH0tQSaFSuUPVdSUAkIG+A4EjA45WU4OxLqZZwGG3Scq6xy0pzo2MuAeaRyZAIU6CR+82W6b5/MjWQk/OezQHHMTD9bNhyPs2OaCrDRBzmaQKk8O+3MwjtQoA==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(6133799003)(3023799007)(18002099003)(11063799006)(5023799004)(56012099006)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9dTAwtfUpLtJPwCi80jdmkrh9jgCNh0rhulqDdwBPGlTxpotBOzyK8l9B76RCVcDiib+lb1tb+omJmj2Bczdw8m+qwVOhgck+HEwIcQEiq8ujkdMBDFbITUZZmQoTjXSf1VylBKDxuqke/EVIb3sJApDwV9ikFck00gy/hfRxvNr7IERd9BKjIw945EUWNnR/hd+21MJ7J1qpmmoIjfvvdM7Y5/GmRmKeWZb7ytVVcfnOO0Hx8uqz17slowcm5XAEdk8oryfRfkpSHZqg7T6nuQgRQFsH9J6ACi/AZ0A3TZtxVUTwCgrdhCJHwzZEoAXGTCiWV/7z6GYMth4Dg8SVWnH6Wfu8qbsecLyGEsHCMdiOGAJrk3fsK1RdE/kUakcadKDOTuBxVfTDOkLAxpUG7T4FGC+9xs3hZSqLQSTxHYvApx4Rg/f0T/9WuYA14G7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 08:03:17.2563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a18a81-48ed-4fa7-c6e5-08df027f5245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7800
Subject: [Buildroot] [PATCH v1 1/1] configs/versal2_vek385_defconfig: config
 atf to load optee-os
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the option to configure the atf to load the optee-os binary:
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y

Without this, everything was still booting, and even though the versal2_plm
was loading the optee-os to its runtime location, it was never actually
loaded by the atf.

With this option enabled, atf is now properly loading optee with the boot log
below.

NOTICE:  BL31: Executing from 0xbbf00000
NOTICE:  BL31: Secure code at 0x1800000
NOTICE:  BL31: Non secure code at 0x40000000
NOTICE:  BL31: v2.14.0(release):custom
NOTICE:  BL31: Built : 08:41:36, Aug 25 2026
KATs execution completed.
In task dispatch loop
I/TC:
I/TC: Non-secure external DT found
I/TC: pl011: device parameters ignored (115200n8)
I/TC: Switching console to device: /axi/serial@f1930000
I/TC: OP-TEE version: Unknown_4.9 (gcc version 14.3.0 (Buildroot 2021.11-18033-g83947c7bb6)) #1 Mon Aug 24 08:45:53 UTC 2026 aarch64
I/TC: WARNING: This OP-TEE configuration might be insecure!
I/TC: WARNING: Please check https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
I/TC: Primary CPU initializing
I/TC: Cluster shift early-configured: 1 (cores per cluster: 2)
I/TC: ASU initialization complete
I/TC: OP-TEE OS Running on Platform AMD Versal Gen 2
I/TC: ASU ECC: NIST_P192=SW NIST_P224=SW NIST_P256=HW
I/TC: ASU ECC: NIST_P384=SW NIST_P521=SW
I/TC: ASU RSA driver successfully initialized
I/TC: Primary CPU switching to normal world boot

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal2_vek385_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 76eb455043..5fe099bc8a 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx-rebase-v2.14_2026.1)/xlnx-rebase-v2.14_2026.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
