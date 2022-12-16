Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8408C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 10:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1942A41056;
	Fri, 16 Dec 2022 10:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1942A41056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMbY0ObHyZ1l; Fri, 16 Dec 2022 10:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 548CE41052;
	Fri, 16 Dec 2022 10:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548CE41052
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC4281BF30B
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 10:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C00341052
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 10:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C00341052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtdxhfODZKUC for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 10:00:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6245B41040
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6245B41040
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 10:00:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwGvju5HVcvrHXToOhsMsL7KRVwXryM2mFJMrKVBq6Hojy2TzpnQyxnzVk+3rne08V1+tVsF6g08xKWrrxDVbTSMT8PXZkYsOUMFo7lIs7+s0h9kHIsSmh4XdmEgwP3TVbtRrs+BOx4ZL6yGDezvqBNHkdEGH5ORcH9xhNxbBP46PGGQLuye2uca3wk2IsJy+nytiM87CkLYxPM4XR+5TNTn1RpcPks0qXSDJEknOC8aU8SCjBEAWx9/6a7t2IduNN9IXtDaUVkF7oCswQLLqWK3lB+78z2heUqNEFS7nwp72vrqpyqGiTPLBJfXh2qPtKy1HO4YRHiSAoD8ht/i3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzTrdj96w0X9/ZSSXRi9gtbvuq223BLN4VyZfRPsSu8=;
 b=dk8tc7Ng/5ajtMpSIRQpxbKydSm+O6aQyj6jC8FbtVkWgtbYCUKc/VbW9y27Zw6e92WVOMQnMA44mhJW70S+Own91o42baPWz/l8zq53eJ96oAz2+H9FEkOnq94lX1RpC/QC0vAnNOtNtVMrZX6VFnP/HQuYu5qgvy1F6vDFnmGYi9GT0jEBclABE1LkZWCX9MpLoaxx6FyYg2qF1iDsV6Nlt6v212vZzBzLYr50y0ezwbcuNb1r/eHVP92qngwMsLzPfXuPOcaCKInPBsDX/hc+k2OLPx9vDQtBHvDfH2r0W2INbQ1KshG9kizGbMtIt1wm2DRvMoZmKICC6F1SRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR08CA0035.namprd08.prod.outlook.com (2603:10b6:5:80::48) by
 PH7PR12MB6812.namprd12.prod.outlook.com (2603:10b6:510:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 10:00:49 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::aa) by DM6PR08CA0035.outlook.office365.com
 (2603:10b6:5:80::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16 via Frontend
 Transport; Fri, 16 Dec 2022 10:00:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 10:00:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 04:00:48 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 04:00:48 -0600
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Dec 2022 04:00:47 -0600
To: <buildroot@buildroot.org>
Date: Fri, 16 Dec 2022 10:00:44 +0000
Message-ID: <20221216100044.54270-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|PH7PR12MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 204db241-b569-4e44-f1e0-08dadf4c68a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZCVZS24LhTHI5Y2fMINIfUPDqMT47k/4+yUB9CRrrJA/R+KDLYGOdcLZF0wf7P3tmxyU331ZaHdx7ZuSMUTux1mqpOJ0VGUCUztREnLaoCyxbmofIsMYmpNSvOFBbeQL1J2HXyI3+DA/l88elxZnFbaxEpl+jpI84od6CbjtsfgGFQ20+PkHQclPJfwAqfZwDgwzIjgWUkXHY1B+WcQMc8ZjNZvHwMZY7rFRgwcclluaedkwqVCSoB8sBMpzwO/ZOvDlYMgSi203P1RImlHzFJdbB4oRR1lCd+BmlPhTc2wbX4ivJwTwpnovnUmXRXA6nDvzfSVfCK2nkjQ1v3TgRKqiSRM1K0v79QtSa1cSLMz2sAyyzw5TsjTlceFM2+AGMK1D6L/AF59kz2TO5LVHSdJ7qyqkXvhvSe8QofEAcopOGuS2QimjFGyU+ecAbfmyH7rUUF7PWOP/utEd8Zo9FP9nYoP6q4vb4Twxbl4wc3gFMScY4vvMU5pOWVOlURC7e/0VZhdcp2osqENSZ3FB97MPPPuFKD/ZSG153LM/U4SE6HDurWK6kdNfJWyB7RN0OeWSvxdmSRvgd49S2E+w7EfyNXe5W3gLyosZ+jua2lP9mwBUGBawz8zGkEsFMv73lcNPIUOiK2IxByV+7Df3Xpbaezd7AJhrXYjNnS22/esq1K4itW6JLXnStR5Zf2+lwoXMkyOUuxmbbWvSlr5LyDqYdYNnTZpPjrRva80Dgo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(8676002)(36860700001)(4326008)(70206006)(86362001)(40460700003)(83380400001)(44832011)(1076003)(336012)(2616005)(70586007)(36756003)(2906002)(8936002)(5660300002)(356005)(41300700001)(316002)(40480700001)(6666004)(54906003)(47076005)(6916009)(426003)(478600001)(82740400003)(81166007)(186003)(26005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 10:00:49.1714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 204db241-b569-4e44-f1e0-08dadf4c68a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6812
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzTrdj96w0X9/ZSSXRi9gtbvuq223BLN4VyZfRPsSu8=;
 b=cuwuUxpPXa8g7mRm775GWRE288ZOnecO+3yQWtudDb709OGschZ12L+ybpBGOASwrU5Q4Irc4pIzZ0My3NVHZaEIwWGGR/s+sl6bNBPhs30aP+Ckp0GP3SQdpW2JWaXXaLtZXJNRw/q7RbiP31NhYP3d0pJA1tD+4wY4bLNI4ds=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cuwuUxpP
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig: use
 CONFIG_MULTI_DTB_FIT work around
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change work around for kv260 u-boot.itb. Uses CONFIG_MULTI_DTB_FIT for fit-dtb.blob generation.
Adds a delay between fit-dtb.blob generation and building the u-boot.itb due to a build issue
when using the buildroot compiler.

This work around will eventually be replaced when Xilinx u-boot migrates to binman.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/kv260/kv260.sh              |  2 +-
 ...ile-add-delay-for-buildroot-compiler.patch | 33 +++++++++++++++++++
 board/zynqmp/kria/uboot.fragment              |  1 +
 configs/zynqmp_kria_kv260_defconfig           |  1 +
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 board/zynqmp/kria/patches/uboot/v1-0001-Makefile-add-delay-for-buildroot-compiler.patch

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e891852009..e3467f3068 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -8,5 +8,5 @@
 
 UBOOT_DIR=$4
 
-fdtoverlay -o ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
+fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
 ${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
diff --git a/board/zynqmp/kria/patches/uboot/v1-0001-Makefile-add-delay-for-buildroot-compiler.patch b/board/zynqmp/kria/patches/uboot/v1-0001-Makefile-add-delay-for-buildroot-compiler.patch
new file mode 100644
index 0000000000..391fa861bd
--- /dev/null
+++ b/board/zynqmp/kria/patches/uboot/v1-0001-Makefile-add-delay-for-buildroot-compiler.patch
@@ -0,0 +1,33 @@
+From 582b52bef69219df678ed04771eb643117cd094a Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Fri, 16 Dec 2022 08:35:41 +0000
+Subject: [PATCH v1 1/1] Makefile: add delay for buildroot compiler
+
+When using the buildroot compiler, it builds the u-boot.itb immediately
+after building the fit-dtb.blob.  This causes a build failure when using
+the CONFIG_MULTI_DTB_FIT build configuration.  This patch forces a minimal
+delay before building the u-boot.itb which works around the problem.
+
+This patch has not been submitted to u-boot mainline as it is a work around
+and not a proper solution.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index b96e2ffa15..0d3e33704d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1426,6 +1426,7 @@ ifdef U_BOOT_ITS
+ u-boot.itb: u-boot-nodtb.bin \
+ 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SANDBOX),dts/dt.dtb) \
+ 		$(U_BOOT_ITS) FORCE
++	sleep 1
+ 	$(call if_changed,mkfitimage)
+ 	$(BOARD_SIZE_CHECK)
+ endif
+-- 
+2.17.1
+
diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 9e32edfb36..40709549dc 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -1,4 +1,5 @@
 CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
+CONFIG_MULTI_DTB_FIT=y
 CONFIG_DTB_RESELECT=y
 CONFIG_DMA=y
 CONFIG_XILINX_DPDMA=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 5c53122b46..3214d45fa9 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -38,3 +38,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
