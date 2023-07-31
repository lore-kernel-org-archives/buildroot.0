Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B5EC04A94
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 06:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DC3B40A69;
	Mon, 31 Jul 2023 06:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DC3B40A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtcYwAheRW74; Mon, 31 Jul 2023 06:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F82740545;
	Mon, 31 Jul 2023 06:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F82740545
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 675C41BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 06:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4069740545
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 06:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4069740545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJGvffk8JsKf for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 06:11:35 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2540F4029B
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 06:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2540F4029B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4qPoNFk2iUJbShS/D8mnTbDL7B6M0r5QSeNQac/Cf62Eyz/UEXous9476nY9P6orW/0TWKHTh5nVzLSGSInvgKMDgOOYESQV8qa9275Q4J3ScgNexv36XvkCfv64qb5vMZ7WkOyNVn3cA1fQuVob8XGCw4CKyYxQYk1KneKQ8Pj0afQn9hWPOayjmf6E93WXHTMmKOUdExbm/+HQTlg+HXLQv3Gr/Stz8zy/ctC9PP9VsJfJUcxLo8chVN770zVSWi7ZvK3uI++jF5Gpl7Z/neAZR/0l0Wy4WTXU/hhqIcgqn37ohADv7wtW2PQQCD2NPzOyCPZfhOEOKlC5opnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1W5atL9awb60Ekan/gNt9BGMST+ZZTbt+Pp3REFfsM=;
 b=BzRaMVx1kGpQbl7MvNzjYny0zVe6PRC93TufdPVgNfkqosda7ncuZ3sNXLSzs7ve5VuVikWAUSPZk38vgowexLfM3IICvx5mxeVQTkj3iGUbkSt9rKVNl/1dhceFfVlfML9NiKRit9I8vVErze8v5q9+g+w36QRGORl2jo48bUM9vwblo25CDSdxm1rhNZl9vllrdB9MOH1wvEXwYnls1HDA3st2w8nmgHhVAekvjPC0n3ijzch2FSBXxeL6rFk4yYYh7u/aFRdFRQXImpEXo+MmYE9XI4UAGXJPg2J9W9c+MlN2sFf8MHP1TRMlO8mU9Aw39YTucKOqNq4m4YUGuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0165.namprd04.prod.outlook.com (2603:10b6:303:85::20)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 06:11:31 +0000
Received: from CO1NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::54) by MW4PR04CA0165.outlook.office365.com
 (2603:10b6:303:85::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43 via Frontend
 Transport; Mon, 31 Jul 2023 06:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT105.mail.protection.outlook.com (10.13.175.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.44 via Frontend Transport; Mon, 31 Jul 2023 06:11:29 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 01:11:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 30 Jul
 2023 23:11:17 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 31 Jul 2023 01:11:16 -0500
To: <buildroot@buildroot.org>
Date: Mon, 31 Jul 2023 07:11:13 +0100
Message-ID: <20230731061113.193556-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT105:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f11d31d-d525-4acc-b67a-08db918cfb41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tlj6ROBOlCYY2Hiy1afnQ2DRzHAHnLKE07cMGAKLrH7VTYpFWfqcSVRvQlL1yx7e+7kxa9eisxsN0mjerjrID67Yu4inbSR1xOg0Q5OwJAVe89YI5TFMV0b85+SmXzAtXMpK82VbexPnqyQywifDHLQJYmGL2MWmAX14qh8dd6cpcxhxuxXbMcIHFbmBmJvKKjFhND83gU3Ukc8ADzGb8NyLaCogogBFHTuqnpXArpdEktwjZ273pWWYYGJS6yadQpCQaxgdIWDAIN6ZfmKiP2AAsTBBnEYZTws+DkmFO9d6FLnd5oUndVIKxOdM7PE7Acl0w0ttzBAYiISRXq18z+ciRa+88z8hwwzzQfkFnIL46JQ/9NJailPmKnqvchjvnxFB9LWleUMWBhMVyZIENdiGu35odbLPypVA1SABemZEKmUVUyujKwdnFSk2kDPcZCsh7TJ+VvFjD6sIUd8aQqWgvohCbod8UqtnbEvT3FNY+1IWF2q3TBKu+p4P4N/p9itx3AGfjbKiTdcCft3mzSEmWcgQqij3Qy28NfqKWIAWlRD3qH5AHM8sKRKmRovS93mjST6lExcURviuDYxAzdZJ4/3IUhhm0vT3eZxCJzbU5RbkdwUtI/sFnj1mKq1T7WMM7loomCeizcUp38+L2pHLBkol5ZmzfTDLgTcSUwdwwwti9SwKaLCy01qBTMAgQoDTqPo+1q7jUjbgYfpX0JO1oGa6Q/vFhIQ4Q3546f9MhQtDRl1n/PrwO4g1xOgvlixMC2De4a7uoMdV6Zhaeg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(966005)(47076005)(36860700001)(36756003)(40460700003)(40480700001)(2616005)(1076003)(26005)(83380400001)(186003)(336012)(426003)(44832011)(70586007)(70206006)(81166007)(356005)(54906003)(82740400003)(41300700001)(86362001)(316002)(4326008)(5660300002)(6916009)(8936002)(8676002)(2906002)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 06:11:29.8487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f11d31d-d525-4acc-b67a-08db918cfb41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1W5atL9awb60Ekan/gNt9BGMST+ZZTbt+Pp3REFfsM=;
 b=CoouiMH3fp06y6ZqqASM03vWAU5w++qRDpthBCUyGvijnrne75LE8DQT1lzIhtL49RUae64AOYojnX6nRp5K4wlKdaiWoXl3niiISn0N1f7jxLouYZiz/t/3gUxAb6C5KqKaQ+OYHTNbx9BYnz3JfVKhGY+EWlgGGXED/7r+ldw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CoouiMH3
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix atf build failure
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

Binutils 2.39 now warns when a segment has RXW permissions[1]:

aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
permissions

There is a ticket filed upstream[2], so until that is resolved just
disable the warning

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
[2] https://developer.trustedfirmware.org/T996

Fixes: https://developer.trustedfirmware.org/T996
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../0001-Makefile-no-warn-rwx-segments.patch  | 46 +++++++++++++++++++
 configs/zynqmp_kria_kv260_defconfig           |  2 +-
 configs/zynqmp_zcu102_defconfig               |  1 +
 configs/zynqmp_zcu106_defconfig               |  1 +
 4 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 board/zynqmp/patches/arm-trusted-firmware/0001-Makefile-no-warn-rwx-segments.patch

diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-Makefile-no-warn-rwx-segments.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-Makefile-no-warn-rwx-segments.patch
new file mode 100644
index 0000000000..1a3014ca37
--- /dev/null
+++ b/board/zynqmp/patches/arm-trusted-firmware/0001-Makefile-no-warn-rwx-segments.patch
@@ -0,0 +1,46 @@
+From 9e495d1fffd2c7ae18191fe76702eca6a54c0192 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 31 Jul 2023 06:39:41 +0100
+Subject: [PATCH v1 1/1] Makefile: no warn rwx segments
+
+Binutils 2.39 now warns when a segment has RXW permissions[1]:
+
+aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
+permissions.
+
+There is a ticket filed upstream[2], so until that is resolved just
+disable the warning.
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+[2] https://developer.trustedfirmware.org/T996
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..77483eec1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -427,6 +427,7 @@ else ifneq ($(findstring gcc,$(notdir $(LD))),)
+ # Pass ld options with Wl or Xlinker switches
+ TF_LDFLAGS		+=	-Wl,--fatal-warnings -O1
+ TF_LDFLAGS		+=	-Wl,--gc-sections
++TF_LDFLAGS		+=	-Wl,--no-warn-rwx-segment
+ ifeq ($(ENABLE_LTO),1)
+ 	ifeq (${ARCH},aarch64)
+ 		TF_LDFLAGS	+=	-flto -fuse-linker-plugin
+@@ -444,6 +445,7 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ else
+ TF_LDFLAGS		+=	--fatal-warnings -O1
+ TF_LDFLAGS		+=	--gc-sections
++TF_LDFLAGS		+=	--no-warn-rwx-segment
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+ ifeq ($(findstring ld.lld,$(notdir $(LD))),)
+-- 
+2.25.1
+
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index e180d5e7e7..8ceaa6983d 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -38,4 +38,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/zynqmp/patches"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 00b33261b6..f4789b9d88 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -36,3 +36,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 88295571af..516f1143ce 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -36,3 +36,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
