Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A6BC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 06:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 998B9403E9;
	Thu, 22 Dec 2022 06:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 998B9403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcO73MYZg-0Z; Thu, 22 Dec 2022 06:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5452403BE;
	Thu, 22 Dec 2022 06:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5452403BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA291BF39D
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 06:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78DDA60BDB
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 06:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78DDA60BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5myKFvy5dwLT for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 06:37:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAB7360AAF
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAB7360AAF
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 06:37:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxmJjqbsgMVFeUomfPBDXPYqzDjSq7NbSB8Lz9Pg5etfhbicvyfEebnYJSNHlhPWNEvLD2I3grbTLVDUdIxRl5wXIPOPdGLF2WknLN/i4K2mvDBaQ6Ki7OR06Dk0uu4FueEV69S6C6seDnHF4Y8ej5edMqIe3Mz8Yva2ksu/p+7K7sT5C++pSch80GaUfOEa/MkQ8NEcFbJ8fI6AbzhsWJkmjOtlTHvf8R0lGZn85lhUk1wb38zvVvhlo63k2ofr9YjgFUVx23dfKSoKwrv/PM04a11M1eBH3Xflse5cABzUCoA3lNqyxkn5bY4dhhnXJKH/84bJgNFJCVnQRYmxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7X+5Jn4dm/pxjtk6H3Sd2cF55E70s79URpip9L7eWY=;
 b=g+trJFVNlBb6VgBvLtrcHwjdsJjXtw/jMl04YS7adrpNT7y+RWcwSzSOzWiR87O+3DKCsRMjEoNzHW/8NWwmiOgAY3B5tS8uVSdoQBHnkt5wK9lEx0++vfTKXqkgG2JyjKExnaDf4SSmF6Sb6Yd1jBXFf3MOAFSB8r7RXkGISHmlLrT9oTLnkLh+YWnGhB19uVci0XW0iqn4RAzyNeuXEgXkaAlmOZNPakQj7BrIfmB73IK5Ab5iy/U648MxXooY/VW/XoGwx5V4yvGjRKjN0kc3idWGr6skX4tIWDFSQCYNArBfrVzEJrVBKcxCDYP2F+iMoEtfNtKHhBy5gCI+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0244.namprd04.prod.outlook.com (2603:10b6:303:88::9)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 06:37:17 +0000
Received: from CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::b5) by MW4PR04CA0244.outlook.office365.com
 (2603:10b6:303:88::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.21 via Frontend
 Transport; Thu, 22 Dec 2022 06:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT078.mail.protection.outlook.com (10.13.175.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.10 via Frontend Transport; Thu, 22 Dec 2022 06:37:15 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 22 Dec
 2022 00:37:14 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 21 Dec
 2022 22:37:14 -0800
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 22 Dec 2022 00:37:13 -0600
To: <buildroot@buildroot.org>
Date: Thu, 22 Dec 2022 06:37:10 +0000
Message-ID: <20221222063710.4324-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT078:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: df441272-e1f5-47d8-e4ea-08dae3e6f72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBuvL5nNXmX30ScTyQz6xwckOintAADTQLkAWH/C3yX1taSrWqIOscoLdkPt5CpQfzyIun8yNc0uyaP+T93dxTJHr20E3vVkbP0ZHBaeoLGWNNqvcReBNO63J0ilmIWgzPOatQdYflydLLR/oPTenlQYskBfIdd5Mi2WAUkOpmTTgQ0PcZGqM1juiSA7U2c+VxEJCz6wjMcbA6YR9dA1MkES0FBz2zOEeBYOzmvRLHDJLAy3kv/yHlKIvmj4xBJXxI5Ms29VYRTG9kNKLi1XpgREhklF0zoIdu9S/1AFDGm2XN8TLEaEae2H/KdJimI6wK6P+qw1wWYVtr2Lp2VJMXnFEz9iDq3z7W4p46RyEmQm5dqu8G62Y23zy+vq5b/j6vDsF+0X1pikadvLQ+QpE3MPZQ4HuxcP/OU0dzAKINMzx7hTxfDBywX2RjOmLhAMWAkX8mNWrmxkCyusElp4kY+hNyg/JqU/V1PhBCRcrYfAl4vdO+1bZctv+Js3ckrRvfLp1QoTftUUJu1WR8WCmRZ6dPSp8tbebEVOj0ROdXjgZqnmzP6plONct9h2+ksX02Q/4PN8pcSNVCviuvUb5KqsaW/5VE4jlt6SksC067Lykbu62XrszUcF8kxx9PGK1Gqqw6vasvOZ2CttNHkYhq+GOhixF0ySmoZBPhReyNG7JH2WSuKG0aeyMBPVQeN5thZuxKyUnXsLYHzN8efzbtzI2Jj2CqsxSJBXAC4LZ5agZmck5bH8HdTBNsOug+9F6IFCUihgIfjbHJoMxgXcxbRm8kHezCMshtKLIFcw5WUfuesznx7iyf9v4NedGjrd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(356005)(81166007)(36860700001)(336012)(36756003)(47076005)(426003)(40480700001)(82740400003)(186003)(41300700001)(40460700003)(86362001)(82310400005)(26005)(70206006)(44832011)(5660300002)(4326008)(83380400001)(8676002)(316002)(70586007)(1076003)(2616005)(6916009)(54906003)(8936002)(478600001)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 06:37:15.3812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df441272-e1f5-47d8-e4ea-08dae3e6f72e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7X+5Jn4dm/pxjtk6H3Sd2cF55E70s79URpip9L7eWY=;
 b=ztvsCjEXZrsfu6n5Tto6BBeEzyCAm6TraUe1sNZq3CpiJ+RRs7+sct2GekT1+l2XcdG4XAcziR5IRXh+THdtBsHwPss67bbquIy8gFJToVQjQrkagmfzjHinbni84L4OPdIsrT+oesSIPHqTqWQgmUBz+8G2soVNP0KSc7WejQE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ztvsCjEX
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig: use
 CONFIG_MULTI_DTB_FIT
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

When using the buildroot compiler, it builds the u-boot.itb immediately
after building the fit-dtb.blob.  This causes a build failure when using
the CONFIG_MULTI_DTB_FIT build configuration.  This patch adds the necessary
dependency to guarantee that the fit-dtb.blob has finished building before
trying to build the u-boot.itb.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281

This patch has been submitted to u-boot mainline:
https://lore.kernel.org/all/20221221075446.47141-1-neal.frager@amd.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - Changed the uboot patch from a delay to a proper dependency wait
---
 board/zynqmp/kria/kv260/kv260.sh              |  2 +-
 ...-0001-makefile-add-multi_dtb_fit-dep.patch | 32 +++++++++++++++++++
 board/zynqmp/kria/uboot.fragment              |  1 +
 configs/zynqmp_kria_kv260_defconfig           |  1 +
 4 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e891852009..e3467f3068 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -8,5 +8,5 @@
 
 UBOOT_DIR=$4
 
-fdtoverlay -o ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
+fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
 ${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
diff --git a/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch b/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
new file mode 100644
index 0000000000..ddc04cacac
--- /dev/null
+++ b/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
@@ -0,0 +1,32 @@
+From 8b181bf582c17cf709a62cf499f9709c94f49d33 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Wed, 21 Dec 2022 07:51:42 +0000
+Subject: [PATCH v1 1/1] makefile: add multi_dtb_fit dep
+
+With certain gcc compilers, the u-boot.itb is built immediately after dtb
+generation.  If CONFIG_MULTI_DTB_FIT is used, it is possible that the
+fit-dtb.blob is not finished in time.
+
+This patch adds a necessary dependency to guarantee that the fit-dtb.blob
+is built before attempting to build the u-boot.itb.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index b96e2ffa15..682a5d94fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1425,6 +1425,7 @@ MKIMAGEFLAGS_u-boot.itb += -B 0x8
+ ifdef U_BOOT_ITS
+ u-boot.itb: u-boot-nodtb.bin \
+ 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SANDBOX),dts/dt.dtb) \
++		$(if $(CONFIG_MULTI_DTB_FIT),$(FINAL_DTB_CONTAINER)) \
+ 		$(U_BOOT_ITS) FORCE
+ 	$(call if_changed,mkfitimage)
+ 	$(BOARD_SIZE_CHECK)
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
