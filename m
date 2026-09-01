Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A00EC61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 08:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F9080BCF;
	Tue,  1 Sep 2026 08:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkitUzvIUgyT; Tue,  1 Sep 2026 08:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788252329;
	bh=zPKnZiIgk+NnRr6rqDth9z+s55mMsYO77H3yMLzcsq8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=inU+fLyE5RklGSrTq0Ikl+eLzGB/pvaeKJd7iGIOs/9vDDG2SN/AGXk584nR5+y/W
	 E9KxbbTF6g4xJpjeDtIq0FfhKVGDBC4Eu5AZPmv0gqKtgSF4f1GdJ9B4Kd/7fSzNNH
	 4qsb2tjwmT+QUJczJasz0vaGd6LkvwpgmAwTz8oxqJsp4xaPAh78m87D8O0tt4HNBF
	 EC6nCbuE56vgY/Crq2Diqxi1A4iAzF+uSPcLidBd5n+/tj3IuSLrOwX8iIbJMRS2ic
	 WtAwi1HBjMFyaPdYDhx+OI3oY9T4Gmir1ZQ53hxi9iWz6CaWCC06WoOJjpBTMJogvv
	 QCSFT3ofccb9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DFB80B8B;
	Tue,  1 Sep 2026 08:45:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AA75363
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AA4C4009C
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yzRbX_CPUIJ for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 08:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 117C74006B
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0PHQSSaTCvXaS0t1x53rTHbS+29WaspvkJXPbtywQL9PmVk7NJPCNzLP+aelXgq/LO1n0vbP3ILHCoXz7Lf0IPoZBUY8zQ/XtehXNmhd6xua8iFXauIh/sosQDIdtbFfiZqUwm597m+2IMUdoEVXkyc2AuBuFG5dkA1EHh8ayzcbkGe0y5vpaGZQ3iNXLKlRXm/Gm3nZVRUCir+cClr4XAQqS0wSyOXo2Gi6qCDYqAWbx2NQCfvHyNaE6EZBrarcDQsx1rY/LDsiWyabzWDJ7GnVzLAlnU0N5B3sTk7gs/7AVcKDNgRSS0V2Fn4LoyxCZcICLB0+YoCqZKvXNFK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwJ9pcgABdlDJF3tG4QSB5tzH1PNN3Ow5oPRIIgwTNU=;
 b=Er3aokoppWjpRW64QExHKk6lNwQtcB/0WDovW9PI4QYy4utMzeAM/5kI25SYWgtcOHBgxj4tIxtylE3C1vCXI8jxORTW1WFvsCVdxVThtT60szuXXjjd5cx606cjqaecEAAg9Vg1yAPyoXiHP/noQ0maLBfbsyRd2PCGx6jE7XK0h2oDZQ9PoEfFb/qeZSgL91UXjHaGDzBoolqeFrg1E/goQnRSVCkqI77GL8sIFTUCTVUhNep+e/KHsM99mFWxcRgMr/oKH6+PXZjABweW4BYVpMC4cFQly76ltRlIrDoCogGvldyfV7GtLMErC2oIYRpDSPr6V/J5SSeNRdXCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR21CA0029.namprd21.prod.outlook.com (2603:10b6:a03:114::39)
 by BL3PR12MB6427.namprd12.prod.outlook.com (2603:10b6:208:3b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 08:45:16 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::1f) by BYAPR21CA0029.outlook.office365.com
 (2603:10b6:a03:114::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.1 via Frontend Transport; Tue, 1
 Sep 2026 08:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 08:45:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 03:44:59 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 03:44:58 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 03:44:57 -0500
To: <buildroot@buildroot.org>
Date: Tue, 1 Sep 2026 09:44:42 +0100
Message-ID: <20260901084443.584247-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901084443.584247-1-neal.frager@amd.com>
References: <20260901084443.584247-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|BL3PR12MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fdcadea-940f-4001-2f8e-08df080557b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: BpmaOP1LOvnzEJ7N9s6Vlk8Lf2fLiA2+UDa7qjB36Y6v6h1wQ7xXxBLUVbd8rxJ+EmL6brxTtZrn4jVH+IT4RrL1Eb9+l07UitmvyS7noSUCTt97IrG+mUF76Rm2WQOqQkKl72ePtqkbC2D3jVWIirqQhZzwUpAPWGcTR1LaPlPX4kAmeI4/5nqAtO0I2kMuOZgUzxsg9CpQwn5IXcaayNGD0rYPZ27Gxgi23IsmcfdTlcXEeb5uKBiCjIE9L0kXuzdIbdbHhrmt6I4USYYBV+nA7kPb1BAvOY2vJedVkPLf16PM4ri0ANRiD8mMrGIR0uxjOYcd1Dr/7JWBZwYHCLBfZR9rZrt5dBFonhx4LGaFtIfNyAjRgBDJsekEnJeDzs5lpFpxQqcgvLQ2vttmrNzP92DY/FumqcogILQa8fo52C7iMYO9bvIBeiYmKZzbsM/TmE0Mzs2l89oIeJdvKnQX4xG4W637xJ3aOKZFcpRopZ46wp/ZdC0vSgPFdQ5GBC4FN2JCW4D5v9E1imwgQyGSfJ9EbdReFit9Iz/Rlatt04wl7ygraIulZTaJwIXSsvizcmjj5ngZylKKx2dcjYU+Rm366uEIVALK9DDOqj2rdJQe4+OQf2BqMms+/SMxoRRXFHzURt2jpZHdpduyOgBTThBUBZsdyDLrp3/K42BIQ2K7gLDcmfiYvsgP7PyaiUQItAUYJmfDrdGRQ/sNDJDiARRoiN+ZRwaui05P5Kg1Hh0nr2HO8sPjsVbUroH1uxTFdfYwPvGk5z1QH8J4Ww==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G2acXVZokqJqtL7wyKjUFW6CggYmVfxN1oCaefBT7G+YEvtQg/JmABWSZoc3w3l+syt74f2lMYUA0MXaWzeLOEdwmkA4smRXQ8LQCmOTbRu3xJpvzk6ObQfiegIRGWM0J95u2jINlxwHGHuT5MDZFxlHnYrYDHVQ3oJGp/xWgh75uZZZZ6wQ8NB7wkl7IPaRukyeIROcu51DWXrVVop07/VUwaMFi7sktLe0Sz4sFaThFA84fhnMLSF7Vg/QzJ1EVXVHIcxQ1vaKyA3wZBHRjhrD/N4K1ttjSBj2qCBcDczAShbH+0Pq8c1LePkBv1B0waAopwAp66cVorGyush9w841rtTC3qJH4zoxYyw4YZNCES1j94g60NvE4oPvB0gD21Ev+mQrLROsTMghYE5hMnoUbSm8NxtADOHUKobGPY0GFS58V42OCu2ZWqZxMC2p
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:45:14.8240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdcadea-940f-4001-2f8e-08df080557b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6427
Subject: [Buildroot] [PATCH v1 5/6] configs/versal2_*: bump to Linux 6.18.40
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
 thomas.petazzoni@bootlin.com, arnout@rnout.be, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the versal2 defconfig to Linux 6.18.40.

Run tested on a versal2 vek385 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal2_vek385_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 97d8364ec7..89d2385d1d 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -6,14 +6,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf riscv32-buildroot-elf"
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_XILINX_FPGAUTIL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
