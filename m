Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95197C5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 15:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D92261042;
	Tue, 10 Jun 2025 15:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8ERyfzdeqXG; Tue, 10 Jun 2025 15:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 792BD606D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 792BD606D6;
	Tue, 10 Jun 2025 15:28:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C1A61F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36176812A5
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qxsPcoHIFj0 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 15:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::617;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35248810AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35248810AE
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::617])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35248810AE
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jxagkr95MZaeAhCueKXo7xzoq3Uf5+sL3S2pz+pW3mH8iuc5OcfcbazA5GHivMsYiBHGUaRCEo0tT4sJQAtzrDYqWwxkzJyoZwSpR+w4H/SlTeZVuZgh5agMKk0rwD4++5L2S7qq8N7lxtzdH0chIyUrtLwpA9Syqn5TQ1qGdor/dqLLaIiFA286EELsK71GNUcDlwujCRKV8IVV5O27rBEIwFA0II5A8A7N06tGWSMjhEYRxFhzh/3pBMbWw4NjEz0M1NMpAnm/Z8fOYh/WebgORS2rY6wBeaoQt5HTtzA9VknY015HQdnUsfkiszncfxul1Ew61x54xvNowZT24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rizlEKa5LwovC5cNYmMyyJ4n2YJ2/JeOD3s3pTOohlw=;
 b=NxRZj1SFGzmKCQ7NzG37ZJ9ZkpKXJGhdfHDeWeQpYKySTWnlKLFNpl3OQ0rlPmBmfnCq16FuZBS4J9MYUZseisPr6L3pF7+fl+ZaG5UDFV3Ifq4uVPvTbn4AlCGH59oMJIKfKXjmhDoA7jM3vnunpwKEFL/Qk913aBMo/BYkQUwEd8vcyrh+US+GLbL95uxSN35ZXoc+NH9qvU0EKZDHvWiH+/a8A3lx4d0lpoYut15pgJghLMb9Go1TekLOzeJSMz4QGF64ogcngslJkWt+cUfkjLVSizsnLpy5UEXODlnRhViabFEJoLhH2lkUvg1KyR9JGueNj0Qr4El41WZjuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR03CA0045.namprd03.prod.outlook.com (2603:10b6:5:3b5::20)
 by IA1PR12MB7664.namprd12.prod.outlook.com (2603:10b6:208:423::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 15:28:13 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::e1) by DS7PR03CA0045.outlook.office365.com
 (2603:10b6:5:3b5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 10 Jun 2025 15:28:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 15:28:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 10:28:11 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 10:28:10 -0500
To: <buildroot@buildroot.org>
Date: Tue, 10 Jun 2025 16:28:07 +0100
Message-ID: <20250610152807.46341-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|IA1PR12MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ecee1b-7d1d-405a-d1ae-08dda83369bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?akYmKqVNC5S2NnZOyqWt0J7IjrCzjY2IAJxHLfigobwVZr6gCvCmMo9Cj+eq?=
 =?us-ascii?Q?dV/QaSwNaAwwGcA9mbuWomWxh9q574y5kx/9dCxSqw87bHRfvFWIPwAoc1bu?=
 =?us-ascii?Q?PHjic3pEN2XGZqxigEDw8Ft+m61BgIQmLhUwq8JwoDPReU5Ji3IKbR98G+il?=
 =?us-ascii?Q?ItSI7D4l6G2V+pVGyu8QMU5Cc1Bq745WTiZwPeORKOhCnh19cF+/6dXYC2+e?=
 =?us-ascii?Q?ehUTY+BUfi6Jjbk40OxwSqIRn35zRDZHdsxB3Zp5K5S7W6nqxPNkmGHG9G4+?=
 =?us-ascii?Q?aRaVaEDduf4bjR0snPXQS2kqYsIBKJNQ6v77ZaEkRfttor1f7vL1yNgCFwrO?=
 =?us-ascii?Q?V4+6OT7wrV5H4PZKEqqL3IHEExYEOJhfqiV9PJyww5eGh5lm2WAaVmtZRg5o?=
 =?us-ascii?Q?FA3iwo/mS0rU5pwdsv3FITqMqSWdKxPelu/+2H7ZO0Agq20ianwqHVLM3MdS?=
 =?us-ascii?Q?rnUK4y3ux3lXkaHSTb4XTiiF79p56qRRWgE/WdMroIjtoc/TbJCaXh52M6s1?=
 =?us-ascii?Q?7s0RwR2eByT02RzvzzMdt+JgFBzutMHzzv8/olLyuyyZucDrACISb1BPQol0?=
 =?us-ascii?Q?fV8eBOCjztG5L6zWEGXgZc8r+FOrtqGdalmFGlM3iIb7Lbp7Va2xIdHSuldO?=
 =?us-ascii?Q?DeID4W3icImrqSdEjJLVk8bi/C/WbxE6Vv7Vwr07I5x/50lpxZPXRQCLhjKn?=
 =?us-ascii?Q?L6aI6uA5EY8ZLSK0mEPFqzOLkUgZUxPVvq9OTNqu6bRH3XqrTtkb6GO/qvfZ?=
 =?us-ascii?Q?fLYFPyzwuLecy+DxAr3dCfJrIgC6PeqxiZSHcT7tBdmZWMP28zdIt93fYAq3?=
 =?us-ascii?Q?63XiPXA1rE5qqPv27L5rU26X1LY7diCna7yR5YG79ChQbXKtmIvzAJpjD+g5?=
 =?us-ascii?Q?h3XxDniqgixTFeblCtUnqiMnEj05B2NEosp1eeCmVQTOENCayt3/yDqn7Gaq?=
 =?us-ascii?Q?zECUNwE4MYNzjGVjnV371MN5tWcC405RdyzGzLtw5BKKIwbnk3L7w0uAuNbT?=
 =?us-ascii?Q?PqKyZ1ttkMh3WJzq8nt0KQb6ORO+Df9sRtjCLxMHsF4AyswDbLG/l3J/t6Hl?=
 =?us-ascii?Q?po5H/hzbWasa//YxbawtW9nb7mfiAuvpzVcWr6y2l4miLI1KuI6tdXyfOX9T?=
 =?us-ascii?Q?jpbCyydbCvIWaItqcrTUm91+Bbmc+jrkJp7K9i9il8ftSg4P2rFOOJzU0Tdx?=
 =?us-ascii?Q?ahNRbXl1IWwFbQrAZLEm7Ik2iqYzFxMFK9p+Ou8gtfKRGuJJKjOaaRcuLkNj?=
 =?us-ascii?Q?mgYdhi+njxgA4UQ/ai6QPAcsbwx1JKR5BWa1r3fE02HViDUdRUeyV9cZzSsR?=
 =?us-ascii?Q?8bPPj0GoeiRHCwuBFClHMFO142DCIeiLbttat2Mqxl1xlLf7Ph29Q+mqkBQY?=
 =?us-ascii?Q?Ir37v0Cwzd0QZWauN6Zb3rj6qU7GdFQOAV7ucvkxTgz8/9dKiwb6GWpjxHnp?=
 =?us-ascii?Q?P3wU81qLaSDx1Pp17+vqwu3dsHnirEUpEsrPUs/EfTWfaGHG0KP/c0t9ejd/?=
 =?us-ascii?Q?sJLlQ0hs84gleJs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:28:12.6384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ecee1b-7d1d-405a-d1ae-08dda83369bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7664
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rizlEKa5LwovC5cNYmMyyJ4n2YJ2/JeOD3s3pTOohlw=;
 b=VUNU24j2G8gqM7jozT4hddAgoNsNPsAXM+YAdJ7cSMlJy/POFPYRP3F+9G5X4dhFlefofmmbcWJ+SvWjwqJhB8LgE3KN+N/nv8fCpLe9XNeIPA5IG2ioj/Iowmnkx+V61xjtJF9YbfJEZjio7sqzoEPxGnn0xkN0hkxBhRilvm0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VUNU24j2
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_*: move to external
 Bootlin stable toolchain
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

This moves the versal defconfigs to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

This patch has been run-tested on the vek280 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
This patch is to be applied to the next branch.
---
 configs/versal_vck190_defconfig | 4 +++-
 configs/versal_vek280_defconfig | 4 +++-
 configs/versal_vpk180_defconfig | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 623646610f..0cfe0fad4e 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 0c65ef36fa..7c04b8417a 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches board/xilinx/linux_6.12/patches"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index e938aadeaf..aa953b0e3c 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
