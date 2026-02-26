Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD09EFC5906
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 07:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C0A81151;
	Thu, 26 Feb 2026 07:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNf6ALk0Hk2p; Thu, 26 Feb 2026 07:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA93C80C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772089598;
	bh=IYzScS45/LdTy2FYP/UGoftcN4ooSjXvCDuf+e99FT8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=jV8pELj8KwXekANbC3OyTFOjSqOIhwWzSylKopilisnOPhjEbRYcOgfq51z0wAKYN
	 B1XDpSqQQs6pc6q5VDaqox7zEBPw5uKUD48Gm2HiqbuYiulEmHUipD37xB3MH0/1gl
	 mIOoWmXJps8mLEIGoHa0bKlDG08CddRfcfFCHttRH0on8TnJ6Wgf+YyDEcOxF6QGOr
	 k6qZ0KTp/hdfWBA8VRthA95pb4BQ4GKFSXWhX3bb7O2au3CG+jPlSsJiRYkckq+PWB
	 4g+ruKy0PJgW0wzkHQwwcDxCR10JowSGiLYL8Y0z3AC5G79MGjihqViSrnMLMVnRjU
	 EeH7cN6Adx0Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA93C80C26;
	Thu, 26 Feb 2026 07:06:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE1F204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D55340079
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AbJdg0TntdO for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 07:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E870640073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E870640073
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E870640073
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxLG9Jw6vJF8PMpEN7xpP9ZAs+l8snCe9RBD0nlDzAKvgENQYV3NHUY/6Zx6xXX0OHQG4jxWijP4HGbrHwUuB4fzpdTkWu7aTXKV9QlBt4VQ6MBSOCpglPLrgZpdq8f+R6dIf2JBsyg7HWG4O/WaZFpQafdrZyBzSa+qYkYC7Nk9XjvoSJ6fUlMuzXIdDwT0vugNQSqwZjWjfOmrMcZgTVYuIs9MHiApbrirNlbmYUVYJvkbECLgoKzAdbt0VtC2Ef219H5Cy9uy7RnPzTyWn1r5lk9rCdKs++ZAfhwguNsOaAqfLYrNAkhbe/bXEzg9B7tcm8mLU6fRZ6humAGGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Pa8MRvq+Bl+lgN7Te0ZCG670zuhsippa7bQjLwnsaM=;
 b=F103RWGzWPZZZLxAa6DyUQMfggqYcXNqqv/gPey9LJHD11uRG5IIlTnTKgNc9RQfhR47PozP83s9ceFHn/NpF12LirzL6cYJiIQmgjlXr81Cpn7wDQlLHAX7xeWAFQA3qZEFQjUCprq72mxcBciaXdUXJECU9zNYWYlFrO/gJdtFivB+h5lOU56slcH35q8dvDMjThGShoXKRqxJiVMLjwmQjLp2Sxk49yhMDzkPYZWxg3Wn/Gsp+RAX/lNMp0CDsDPY6+qjKVnPmffVSPAbSt2HgHfjq6RN/gzZtqqg8y+8JubNnYHNfUp6yrYtl9ugDJNmpLBM2ESn4bnaSX1JhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR15CA0136.namprd15.prod.outlook.com (2603:10b6:930:68::24)
 by IA1PR12MB7568.namprd12.prod.outlook.com (2603:10b6:208:42c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 07:06:29 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:68:cafe::d1) by CY5PR15CA0136.outlook.office365.com
 (2603:10b6:930:68::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 07:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 07:06:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 01:06:28 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Feb 2026 01:06:27 -0600
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 07:06:23 +0000
Message-ID: <20260226070623.3826260-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|IA1PR12MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 7caf4b98-0f20-428c-3b72-08de7505904b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: AP6xFRLPmGO+r4d2Kh5knX8xOf9ivdovwdtmDPGz/il1He/vI0Asxl7D2hz2ImnirLZicrW45yNJb+lVTPUJsEQ53sSh6LzdZuZgHGw7C/upXpqeE+pSs/kEZIOXtjJS3MDCh71ju880+GrTyD1FKbaEKoEdD/d3nt8mPkp/NNghPyIhJiUKATG+Qqxe1evZU1P6d1BO8b58DRpwzku5gYSLDpdK29zpMpszaP9YArE3RYgOBVEwaqKka04UQ2oL1lNcQybOjOA6kNhY3qsVMy2trPm1V0QCRZ8he/0fAlcjurHsCiWdh7YhiCucbp43SH4UmWVN1NjNt4a1ZneFTTRmo4ihQwNXybomf91djPROZvsxv0lioMHpwjISKaluNlU+w507TvHooyUABM+JuZvQiicEOwOw5nHh0doT9GqLP7BkEm3TlTas7VqzgXmWwHe00px4P0DWnhc+Z5D53f6vk8wM8BxSQYFnVTi9m+AENJpRpZm0yamKdc2Q+b9I3QJwiaFr5K9ZPLCB4pqWyZbpM9LB3nHsPorQCpdc5lsNn0E3bhAkVOeu3RAnUMh8sokaWCMAp392byhgl4T8jVcgUO6KB+nG1kPMpDvebe3GdKQRfgjdEjJ/kldaksq824lWENxUJnr9xdCtn8h5fsIu6f7haervnXb1G6s6dFutIXM2c3ZnFoiTbVXGDL6V5Aaprd+GLbwVQinq5CRV/C2+Xvtz5QHJu4QvNmI9YD/rAUFwhDEkoEAPATHOGWIptqKxcEk1qqrHP1usG9h4o5RZKd2OsgjSkj31vpLFI+yujFyHDyBDK9/Y4CxLhY8X+YXeazBcX9C19AAVmXzkoqryESm4iO4ry5BgZt3quW4WkKKVWgZh+BNhtyGX1B5g
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VR3QZKCBs1RAhtP7u1e9Kc1bzrfQnC/lacmsSaw0YKy46rk2B5jbtKw7AJoK9p27wZE5kU1IQPFdRUx9E78Bb0/dRxjYIKoA9sBni0whksHOBPUSMCMwT3xnK+ciwf8DE6j94I74/j2G+ye58qOSjt3gSXRkW6blxHHrOr8kZLcuILRNsPoT/Y9kMuneUB2wUCDLSDUx8LQ9um7rRfgL8wD11qEVHohmJ282nBfT93NOEMdGNH7hpWW8uNNynu24OOmMbAO7HoLe84AE5dsIXE8iEdSrojzRJ27xw/7kfQprT8eWRAFaCPPyNP8NPOA+ETUUJ7K1eJOkc8Ei1EV3i+DCdpWei9bbnsqaeLUSn5EvpzvVrsMLFa2c+ONQsa1cJN91RuDBXS99ZECNJCCCsEObzCLJxhBPHxEoH8YfJISIjq8xOq857Rx2ySkB6TUU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:06:28.8430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7caf4b98-0f20-428c-3b72-08de7505904b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7568
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Pa8MRvq+Bl+lgN7Te0ZCG670zuhsippa7bQjLwnsaM=;
 b=IHdDLfd7Prn7PEc6Gjt/iKsBji2r1DMXLHaX/vhtvbgJEvRKn+yvg2pZ6x8KEXA7v5zNvRl9nUwpPQHnx2r5FVSyLmzWeR9FnVIpzpa1h6r34JZLCyIrRPpbPOsVmAcZ1JJwXiecgINCgHqdyxGtqFpqhJJS0/SHqPdcjJIRaPA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IHdDLfd7
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vpk120_defconfig: new
 defconfig
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
Cc: akbar.anthony.rezvanpour@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add versal_vpk120_defconfig for vpk120 evaluation board.  This board has a
Versal Premium VP1202 soc, and this defconfig further extends the portfolio
of example defconfigs for Xilinx Versal SoC products.

More details about the evaluation board can be found here:
https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk120.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/readme.txt         |  4 +++
 configs/versal_vpk120_defconfig | 50 +++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 configs/versal_vpk120_defconfig

diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 3bcaccbb0e..80ab068495 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -5,6 +5,7 @@ Xilinx Versal boards:
 Supported Versal Boards:
 Xilinx VCK190 board
 Xilinx VEK280 board
+Xilinx VPK120 board
 Xilinx VPK180 board
 ******************************************
 
@@ -16,6 +17,9 @@ https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vck190
 VEK280:
 https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vek280.html
 
+VPK120:
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk120.html
+
 VPK180:
 https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk180.html
 
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
new file mode 100644
index 0000000000..1c9ef448e3
--- /dev/null
+++ b/configs/versal_vpk120_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk120-revB"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.2)/xlnx_rebase_v2.12_2025.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk120-revB"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_BOARD="vpk120"
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
