Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131A7C54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7216410CA;
	Sun,  3 Mar 2024 09:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ow5SuzyJR2GQ; Sun,  3 Mar 2024 09:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C263E414B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C263E414B9;
	Sun,  3 Mar 2024 09:21:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4A2D1BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D111F40373
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWyqpXinEQBL for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:21:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::600;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAB91401AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAB91401AE
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAB91401AE
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:21:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfmVfv6na08wNb8v2s6uh/6QVtf3ocJlLXQOGeb4cd1k+ER/FXw51UBy5mSbwRvdSpAdO8w8seIXxb6BuDb4IkWDe8RX63E/rKGbSnVeQDSalqLseTgpARaT4sK07JEevIiel3rPWrUgGcOGY+XLo89kcJwArUns59zHkA6H0QEiFduLrPXdL1EOizDexQMpiKq4sGVo5q3FGA5Danko/p6+oAPV/xm6XVPbGzxrG2rDqb8dWhj/mAdndPxR6n8HixmYTHglr+KqK1mW2tF9sEhZ6Yh+2iavcPIHIBM9nalnCKejYy6IchS8Dh8W0CPj/YOrCC5LKI3ClR2/tFXb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgs9/96YNCf9KOWgW3jzbwEsM0GNIs3OGlXIQRT5Lv4=;
 b=Qdmy1AW5GSC3VZsWKUreF8XxbgtfhwF7kdBDwbC1CH7SRZByrKbEemDYm3NuPgLU1RcGv/CWcN+4GLDsH9i5HQjlYaL4SUZ+mBNk2u6KD82t+uV5bjrc0OVfEvDsLniWHQIFaKqmWMVGJrKmSWW8YaBVi5FpjGOntvB/abQ7w7nNuSSrFItG9mwDBe/r2yAktuE62aDYavzGdV8lQA6FFLdGrvyp0UHsKGZUBPj1/7GJKAu2XJk94FFyOZOximbHFpFVMtL/6hGnr2Z4jOBs2NyBp3wX2YyZfeq48FdCpcG5/fJPXvkWY1eE86hskG/ylRl5+Q0kZXDrh6B1mVBnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.36; Sun, 3 Mar
 2024 09:21:14 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:20:cafe::ec) by SA9PR03CA0002.outlook.office365.com
 (2603:10b6:806:20::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Sun, 3 Mar 2024 09:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Sun, 3 Mar 2024 09:21:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 03:21:12 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 3 Mar 2024 03:21:11 -0600
To: <buildroot@buildroot.org>
Date: Sun, 3 Mar 2024 09:19:55 +0000
Message-ID: <20240303091956.352661-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240303091956.352661-1-neal.frager@amd.com>
References: <20240303091956.352661-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e9629e-2c78-4e09-bcec-08dc3b634521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9wxcsto/Sd1qqug1YbAU01V3p/uhZpUKNYP/+ME63t+UJjWw8JPyE4yMRX61Gafzcjz/lKf+XuSKN1ezKamU92VpfSdBNUjetRJCl5jSjK2jhrwMuLBjpXRlcWMtpP9FY89He41kZbGcPizaTgvsL+lxDCPyftfFu4tJAKxEkyqz1mx2Rr6xdCuh6IEjcqC6SQZwUMJtbxNpUh9hT4VmFdCsDIG+wd1Siy45BQ+9li6NUI5vdgWD9eYHRxiwXJ8XihlKW6uZnDc4/Gw71+DcmEvZLD60Ut8LwklLsCckDyZAUZAwvt2nvmOJcmKds/IqIkQZeRfE371SAlmliseAhNPbDH7+/+ESAfGng1V5pmbdpm8YFGwexvBtRdbD/EpwLIJ5NmPOtOOLn6XGl7oyiZXDX991hwOobcpaKAmhjJnXxqxGABXwjeaWT1IRl7slmVHbE04PoNTZd4MOrzZI6mfjLJjXiAAQGz1YhYkT1HTYnxc1AXA82kGquvi9O7h+p9oK276JM2m7fWcEeDciuqVDdT5PaFNsxVoYRZ3yK3jMx7nP6sZSpLoyhpeAAP/FcWmzSRGkRbmtmGFt/tNQn0HGBem3yPnkwLDKjKX3QDknek/S/q/omnFfBtgAqfPtmtZKcKBw4pSC98CZAnheVL+09srdSAQWeosub0Bryd8rJ6Y1EtDPdRk7CZjQCJBcBkS9yAOUonEIgJSdb9/Ew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2024 09:21:12.6782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e9629e-2c78-4e09-bcec-08dc3b634521
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgs9/96YNCf9KOWgW3jzbwEsM0GNIs3OGlXIQRT5Lv4=;
 b=RGEl+esrwj8MU1dlMAwx2fV1ppEZlVxU3gmjuW3tNbafV4AMtZlqlj8P/qKg9ZF2rzptvqJEQxcYmHo1T6PR4nWx1Pxzb55FstG36WM1B3PZURTWU2NM7Owocj8aqmZhqIhi1Hwtlbs/s9BgEXy0wnJzyeHI1a8vCP1HJlqne6Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RGEl+esr
Subject: [Buildroot] [PATCH v10 5/6] configs/versal_vck190_defconfig: build
 plm and psmfw source
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the versal_vck190_defconfig to use the new
versal-firmware package for building the versal plm and psmfw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V5:
 - bootgen is selected automatically now
V5->V7:
 - no changes
V7->V8:
 - bump to xilinx_v2023.2
V8->V9:
 - add BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH definition
V9->V10:
 - no changes
---
 configs/versal_vck190_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 8561b6641a..5a0dddc070 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,11 +32,11 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_VERSAL_FIRMWARE=y
+BR2_TARGET_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/vck190-versal/vpl_gen_fixed.pdi"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
