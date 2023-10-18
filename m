Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ABACDB483
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 11:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92AC823AA;
	Wed, 18 Oct 2023 11:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92AC823AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVSimXXdnb67; Wed, 18 Oct 2023 11:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E57D582389;
	Wed, 18 Oct 2023 11:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E57D582389
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 602BB1BF865
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346F3405A0
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346F3405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4emuSemmV_eT for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 11:09:09 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7064240104
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 11:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7064240104
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpbJnu1qvAesj0yCAQ6hg+NnptKP48b0Ln+YE0Znuxmejb/kkUOeBNDYxBPVGts1Vb9yeVjWPdCdYC7hKgKPkIk05ozhTU+p/MBAEcNW3mHVZ+tEqlonUTxHb/ubHVZ1boyUQheexXjxjP6FNG2JEPj1KRvp9RffFW29p5gcJGGVEPvPv2sKXxudmZwT7zudpOO4Fk75WbYPaWHXvYdky5RL6YWwkbefEVjzb0sSNfbV4qrxxZ94CsuyRBOdL9MRWky2s/5TcwG2RWcGKXIWUwlel/IrfyOrtDaNVQ10CGbswCACUKYHQstk0mY5Sjq4GAOTwulOnYakdgWusVLV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk5OKwndkk71OUYB85zXWojmZqCYpX3RsGoAVF/409E=;
 b=NAym+XGLVeZni2nx7qGw2PU7dgw+BSPDImheztftqen6k3PgYciL4epwSNpfcJ8JkFCJbYrpV+yLoOYAEO2esrspe56kFjphJdW/WCKwXI+4kCyzzyNIa9iSMrlo8deTcWmRFdm8LZHwhLPwE0jEDOMSEcK+qGoJga8QqBu/itQ1zbG/diSQVNA3hkPy1n3vfVV84FL70bgDggr3x0hf1VGIjRE8O24h+gesTnn+tvcm7Y7pVC8yJdI84UyA17HBvMAvxSbxXRsLMVi5PVH8L28UiaZbVxkEqztiwlp+K7pi5iY14VSJwg2oDxHQsHyW53XZtuMqWLrbHUoFvq0xuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BLAPR03CA0049.namprd03.prod.outlook.com (2603:10b6:208:32d::24)
 by BY5PR12MB5509.namprd12.prod.outlook.com (2603:10b6:a03:1d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 11:09:05 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::e4) by BLAPR03CA0049.outlook.office365.com
 (2603:10b6:208:32d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 11:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.21 via Frontend Transport; Wed, 18 Oct 2023 11:09:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 06:09:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 04:09:03 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 06:09:02 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 12:08:54 +0100
Message-ID: <20231018110854.2891928-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|BY5PR12MB5509:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d83a48-e615-4c60-ada1-08dbcfcaa3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2mvjynmgUkALuCFrIragLxmlYFp3oLQm4t/vVLeuYPFy+upNpvS9KTJlryrFfOc/cMrJoZYgpQCemB2nEJ+HxfODOiFMm/BaHzZYwg30IO5CCa2nK4SNfxM0kQAmYzCwnfhdOSnoZ7p5/jVgIZGnoHYiUCmlxh37H1Fx6Q2ofN/rW8M92vGodeySb+dGKg0Up45zPcfaWC3HacZs3NfueZgYAs4mxiOfynGrR4qbgnBoJLuN66Qby19/Y97lv805EmTGQDrduv5wIN0ovYTCgePVVmmtyiX0p6egwCQQ6CfeUirgmSEh1XQxTlGhJfL2gCrPpupO6UjvrF+/PpEVQ9YQE0HGjo17pQglOW9IQ3mymPpawc8h/qt/YGYZConzpICGQQY2RpLGguyqugHACHgC2sNmaskj58e02GXsOFNZ2wUQpIEJdKbxkAo8XcO60CeYcgnFiaWfih1cVryUwv6N8r4kprwXKb1Y+oxr4k+GkOHCLPGTDKMl93KTXbt197aIP2eG14i/HIud/Hw2oBOWbGBxAG442j9X5ojtCKs++NPhMPVmBLR5ZaD6v/cHVtXI5cH9VPmsY98RRL04wL9fHwjYJEr6gzpBURW7LWiZ5pK5hHhXdtVFEU9iI0e06aCeO/1zIVbLL/xZc5ek+Wd/Jwgh/QuCXTMTUpN13ZLxO+X1EhxespRaj6JUyu8ki4rRj+fseLfVtGqnXNwP0SABS6YPukatLJRRmwEjjr/ddfUvZ4FmcwY0zTvFpANlOA2wm7lOreFZB5bOgK9/mA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(40480700001)(966005)(40460700003)(26005)(1076003)(2616005)(6666004)(426003)(336012)(44832011)(41300700001)(47076005)(8676002)(5660300002)(4326008)(2906002)(36860700001)(70206006)(70586007)(478600001)(316002)(54906003)(6916009)(81166007)(82740400003)(356005)(86362001)(8936002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:09:03.8934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d83a48-e615-4c60-ada1-08dbcfcaa3ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5509
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk5OKwndkk71OUYB85zXWojmZqCYpX3RsGoAVF/409E=;
 b=KHRSBf73fvW9npEjV1SwkGP+5naVmviH7MD8QS/gdzQPdGx9NoKkZL3PD+QPckqDUpENSQTXVClcQZJUbrKljWre40rSI1Osn7vWK/vUeV+WWnaffOCcNbWEVEp2v/jLUrxE++jqA+hN6LGTFQr8KIerAVzt6A+OE+JHZckX9r0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KHRSBf73
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zc702_defconfig: new
 defconfig
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Zynq ZC702 starter kit.

ZC702 features can be found here:
https://www.xilinx.com/products/boards-and-kits/ek-z7-zc702-g.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                   |  1 +
 configs/zynq_zc702_defconfig | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 configs/zynq_zc702_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 57015e245e..e4729010fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2193,6 +2193,7 @@ F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	configs/versal_vck190_defconfig
+F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
new file mode 100644
index 0000000000..e85285a832
--- /dev/null
+++ b/configs/zynq_zc702_defconfig
@@ -0,0 +1,33 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc702"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc702"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
