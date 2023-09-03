Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043B0C83F2D
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 07:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65C24400EC;
	Sun,  3 Sep 2023 07:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C24400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7w6VBxQWw6aK; Sun,  3 Sep 2023 07:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD33740338;
	Sun,  3 Sep 2023 07:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD33740338
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D49B51BF470
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 07:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91C1A416B9
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 07:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C1A416B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFatqjsVn0FN for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 07:54:47 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::610])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16819415EF
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 07:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16819415EF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AecQMrjiCwO7prQfvG92qsL8tuAIf5KtmL19AF9mEQWHiiHYlDjovpaKWKD4rquaSeF3OIWtv6tyGF2J5/ayPUHRgvVRyhPiWSXt/5M7UmGWXMByoN+sdoxD98uc4sG6H7SO6spd/OsKpQ+jU+gslsxUDOQPdl3htg9pa6lNij6+2UUzE0XCLbSa2Za3ZAoew3yJPW11pzW9ncOIKy3OOZiaqPZBKGKKvEiB5huA9Z5bVfO/jaqMa9hDXnvXuIOrD6DJJJXlNrAkzss31/CkGLpTy95yNUm9LQyQJ438MPxsmWGdcaydlG0YO29vUw1pznbhJBotbwcfIthZGjd/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXFHdXo7As2G2bEuSh2evgIJMyURv9ebKeRhBq3u5ec=;
 b=i9uldnR9ojrcPSO+EJJAtkzNMpDvuhadvdcLy0FkFLo5H7+AatPvhvwwrYArbM9FIRIQ9hWZXNBZ++TEKjc6es5gKKTNgpMxd92DDMibZawZbICry9zk91txbHmFohHzVA4Qq8NmesAY0vzclk6iQuubZ/j3gqitZuXMpC3HxmDd7SToGt8UoXa/pcd3w+BcFH+lT9g00PyLAj+XKquKw0d1qJHXjyDvFPUDnLu/2V3wnNBFnMROC50Ap6vkr0JEpb1g6cVq23i1lxYGa+fD8qnnB2FriAiRo9MlDEwJgbih2AA17Xsz24DL7AcYEtRbYmTjC2gYvN8uW9RLS5USgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:907::16) by
 PH8PR12MB6698.namprd12.prod.outlook.com (2603:10b6:510:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Sun, 3 Sep
 2023 07:54:38 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::5b) by MW2PR16CA0003.outlook.office365.com
 (2603:10b6:907::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30 via Frontend
 Transport; Sun, 3 Sep 2023 07:54:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Sun, 3 Sep 2023 07:54:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 3 Sep
 2023 02:54:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 3 Sep
 2023 00:54:36 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 3 Sep 2023 02:54:35 -0500
To: <buildroot@buildroot.org>
Date: Sun, 3 Sep 2023 08:54:27 +0100
Message-ID: <20230903075427.738733-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|PH8PR12MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f20781-4ea1-4d64-1594-08dbac530597
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2c0dGdH9jOOtG+VhsAuWJBcjmezRNR6M2Mr07Eh57c4VjE6WZs0TcP40+LuZG8ko91vVe3/7yKN0ov98UiQ+vvLjnoFU6fwGlOaoJ4BD1AXSl8WppMuAvN7+2DxGQvLTC9c2MAXbZxOgC6Rq3pCqTkCYlqXPSC9F1h7KnbR/fp+Ra7vHgAQLKuqs27RtB/HCdU7hSGaPpNmoi0QIPdnqC/JoRH7S0X1o8AyRP1Z7Zr+vxcQaTVw5WWQCFkAH83ukzR+kcdbgH7cdIpY+FAiojco3iUu4erNVFgRvALYPM80fmY9aGvZz5to7RTjP4KPUYzEdd/0KKgQr+gbu+pwAOu0BB1c6aSGTkascfB5HOvSZW3tMble5bUFFSV9cucA4sGRpjN3CesisBoHaIp3x12PW/ys+sJH/0gpYyC5fDcgyPdm8YvIH4DYqbhb/B1pN9Ib9evAHx/0Rj2EqRQpmPFP9MyoqqnXk5prkekDqP1OxFfomDJvbcT/69hD4UO4+WdJE+inFneErlzQlfsOJxUaG6HNGrA8zs6pnqBriU9fZKb3SRwP2WUsmSOwikyKgH18vNBbaqgW8fnOaaWIHnoeArIQpcxMdY62IqSSPujlVgxVw+H10DRNhLdaev5wRiJmXgCIZpPMagd2UX4cIubNuESj8pkdiZwR3CdjC5OsKXq/exYir9E9QqlkSmRI2Esle/djpYhi9CoCaLK8goyb6Z2H9nLyCCXwY38yheIaVZw57/NtctNr2CNV8jlfKLbXR8gPSqUaH7gh00BT57H+2gdBXD4wE4QQvNFhRBU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(30864003)(966005)(8936002)(41300700001)(40480700001)(83380400001)(44832011)(478600001)(6666004)(2906002)(70586007)(70206006)(5660300002)(8676002)(6916009)(54906003)(316002)(4326008)(2616005)(1076003)(40460700003)(26005)(36860700001)(336012)(426003)(36756003)(356005)(81166007)(82740400003)(86362001)(47076005)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2023 07:54:37.7701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f20781-4ea1-4d64-1594-08dbac530597
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXFHdXo7As2G2bEuSh2evgIJMyURv9ebKeRhBq3u5ec=;
 b=VnMU6H/krgkFexT6PCJuS2O6LWXAYHihyYJrQilb9BCplI872W3KG9VpayRWHXEmBXP8n6RYWEdI57TID6AhftkngOm14wpzQw+4Lgp+wN1CArAn1qFSCA7gp8LN6trHmdNP9b/1ddqR1vMePmiF6gKImlUwX7wabhr8yVIXk7Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VnMU6H/k
Subject: [Buildroot] [PATCH v3 1/1] configs/zynqmp_kria_kr260_defconfig: new
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
Cc: Bradley.Gamble@entrust.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, david.evans@ebv.com, dylan.bespalko@amd.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Kria KR260 starter kit.

KR260 features can be found here:
https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html

While the Kria SOM is based on a ZynqMP SoC, there are some key
boot config differences from the other ZynqMP evaluation boards.

1. There are no boot switches on Kria SOMs. The boot mode is thus
hard configured for QSPI flash. A pre-programmed boot.bin comes
with every Starter Kit. U-Boot can then find the Linux kernel and
file system on the SD card.

Optional instructions for updating the boot.bin in the QSPI flash
can be found in the readme.txt file and the link below.

https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM

2. Kria SOMs use UART1 for the console instead of UART0. For this
reason, Kria Starter Kits will use a separate extlinux.conf file
from other ZynqMP evaluation boards.

3. The KR260 has a USB to SD card bridge, so the Linux kernel
and file system are found on /dev/sda1 and /dev/sda2.

4. The following patches have been submitted upstream for u-boot.  They are
required for enabling the pinctrl of the tri-state registers, so that u-boot
can detect the SD card connected via the USB to SD card bridge on the KR260
carrier board.  These patches are temporarily included with buildroot until
they have been applied upstream.

http://patchwork.ozlabs.org/project/uboot/list/?series=368369
http://patchwork.ozlabs.org/project/uboot/list/?series=371196

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - Submitted tri-state patches upstream
V2->V3:
 - Formatted upstream patches to remove all of the mail server messages
---
 DEVELOPERS                                    |   1 +
 board/zynqmp/kria/kr260/kr260.sh              |  12 +
 ...-zynqmp-Add-support-to-check-feature.patch |  58 ++
 ...ion-check-for-TRISTATE-configuration.patch |  33 ++
 ...utput-enable-and-bias-high-impedance.patch |  41 ++
 ...ynqmp-Add-output-enable-pins-to-SOMs.patch | 223 ++++++++
 board/zynqmp/kria/kr260/pm_cfg_obj.c          | 496 ++++++++++++++++++
 board/zynqmp/kria/readme.txt                  |  29 +-
 configs/zynqmp_kria_kr260_defconfig           |  42 ++
 9 files changed, 929 insertions(+), 6 deletions(-)
 create mode 100755 board/zynqmp/kria/kr260/kr260.sh
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/0001-firmware-zynqmp-Add-support-to-check-feature.patch
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/0002-pinctrl-zynqmp-Add-version-check-for-TRISTATE-configuration.patch
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/0003-pinctrl-zynqmp-Add-support-for-output-enable-and-bias-high-impedance.patch
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/0004-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
 create mode 100644 board/zynqmp/kria/kr260/pm_cfg_obj.c
 create mode 100644 configs/zynqmp_kria_kr260_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 26d0a0c223..b5a86872f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2188,6 +2188,7 @@ F:	board/zynq/
 F:	board/zynqmp/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
+F:	configs/zynqmp_kria_kr260_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
diff --git a/board/zynqmp/kria/kr260/kr260.sh b/board/zynqmp/kria/kr260/kr260.sh
new file mode 100755
index 0000000000..df8b0ccde5
--- /dev/null
+++ b/board/zynqmp/kria/kr260/kr260.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# This is a temporary work around for generating kr260 u-boot.itb.
+# The problem is there is no way to currently configure u-boot to apply
+# the carrier board dtb overlay during build, so all kr260 carrier board
+# drivers are missing.
+# This will be removed when u-boot can build the kr260 u-boot.itb natively.
+
+UBOOT_DIR=$4
+
+fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo
+${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
diff --git a/board/zynqmp/kria/kr260/patches/uboot/0001-firmware-zynqmp-Add-support-to-check-feature.patch b/board/zynqmp/kria/kr260/patches/uboot/0001-firmware-zynqmp-Add-support-to-check-feature.patch
new file mode 100644
index 0000000000..8f6d1f0589
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/0001-firmware-zynqmp-Add-support-to-check-feature.patch
@@ -0,0 +1,58 @@
+From: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+Subject: [PATCH 1/3] firmware: zynqmp: Add support to check feature
+Date: Thu, 10 Aug 2023 23:48:27 -0600
+
+Add firmware API to check if given feature is supported.
+
+Signed-off-by: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+---
+
+ drivers/firmware/firmware-zynqmp.c | 13 +++++++++++++
+ include/zynqmp_firmware.h          |  3 +++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/drivers/firmware/firmware-zynqmp.c b/drivers/firmware/firmware-zynqmp.c
+index ab4c4f1a69..43fb7fa778 100644
+--- a/drivers/firmware/firmware-zynqmp.c
++++ b/drivers/firmware/firmware-zynqmp.c
+@@ -195,6 +195,19 @@ int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value)
+ 	return ret;
+ }
+ 
++int zynqmp_pm_feature(const u32 api_id)
++{
++	int ret;
++	u32 ret_payload[PAYLOAD_ARG_CNT];
++
++	/* Check feature check API version */
++	ret = xilinx_pm_request(PM_FEATURE_CHECK, api_id, 0, 0, 0,
++				ret_payload);
++
++	/* Return feature check version */
++	return ret_payload[1] & FIRMWARE_VERSION_MASK;
++}
++
+ int zynqmp_pm_is_function_supported(const u32 api_id, const u32 id)
+ {
+ 	int ret;
+diff --git a/include/zynqmp_firmware.h b/include/zynqmp_firmware.h
+index 18a87d2749..73198a6a6e 100644
+--- a/include/zynqmp_firmware.h
++++ b/include/zynqmp_firmware.h
+@@ -453,6 +453,7 @@ int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
+ int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
+ 			      u32 value);
+ int zynqmp_pm_is_function_supported(const u32 api_id, const u32 id);
++int zynqmp_pm_feature(const u32 api_id);
+ 
+ /* Type of Config Object */
+ #define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+@@ -492,6 +493,8 @@ enum zynqmp_pm_request_ack {
+ /* PM API versions */
+ #define PM_API_VERSION_2		2
+ 
++#define PM_PINCTRL_PARAM_SET_VERSION	2
++
+ struct zynqmp_ipi_msg {
+ 	size_t len;
+ 	u32 *buf;
diff --git a/board/zynqmp/kria/kr260/patches/uboot/0002-pinctrl-zynqmp-Add-version-check-for-TRISTATE-configuration.patch b/board/zynqmp/kria/kr260/patches/uboot/0002-pinctrl-zynqmp-Add-version-check-for-TRISTATE-configuration.patch
new file mode 100644
index 0000000000..db58e51158
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/0002-pinctrl-zynqmp-Add-version-check-for-TRISTATE-configuration.patch
@@ -0,0 +1,33 @@
+From: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+Subject: [PATCH 2/3] pinctrl: zynqmp: Add version check for TRISTATE
+ configuration
+Date: Thu, 10 Aug 2023 23:48:28 -0600
+
+Support for configuring TRISTATE parameter is added in ZYNQMP PMUFW(Xilinx
+ZynqMP Platform Management Firmware) Configuration Param Set version 2.0.
+If the requested configuration is TRISTATE then check the version before
+requesting Xilinx firmware to set the configuration.
+
+Signed-off-by: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+---
+
+ drivers/pinctrl/pinctrl-zynqmp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
+index 02626a7561..e9857f5ed9 100644
+--- a/drivers/pinctrl/pinctrl-zynqmp.c
++++ b/drivers/pinctrl/pinctrl-zynqmp.c
+@@ -158,6 +158,12 @@ static int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param, u32 valu
+ {
+ 	int ret;
+ 
++	if (param == PM_PINCTRL_CONFIG_TRI_STATE) {
++		ret = zynqmp_pm_feature(PM_PINCTRL_CONFIG_PARAM_SET);
++		if (ret < PM_PINCTRL_PARAM_SET_VERSION)
++			return -EOPNOTSUPP;
++	}
++
+ 	/* Request the pin first */
+ 	ret = xilinx_pm_request(PM_PINCTRL_REQUEST, pin, 0, 0, 0, NULL);
+ 	if (ret) {
diff --git a/board/zynqmp/kria/kr260/patches/uboot/0003-pinctrl-zynqmp-Add-support-for-output-enable-and-bias-high-impedance.patch b/board/zynqmp/kria/kr260/patches/uboot/0003-pinctrl-zynqmp-Add-support-for-output-enable-and-bias-high-impedance.patch
new file mode 100644
index 0000000000..ca0ba76148
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/0003-pinctrl-zynqmp-Add-support-for-output-enable-and-bias-high-impedance.patch
@@ -0,0 +1,41 @@
+From: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+Subject: [PATCH 3/3] pinctrl: zynqmp: Add support for output-enable and
+ bias-high-impedance
+Date: Thu, 10 Aug 2023 23:48:29 -0600
+
+Add support to handle 'output-enable' and 'bias-high-impedance'
+configurations in pinctrl driver.
+
+Signed-off-by: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+---
+
+ drivers/pinctrl/pinctrl-zynqmp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
+index e9857f5ed9..517035961d 100644
+--- a/drivers/pinctrl/pinctrl-zynqmp.c
++++ b/drivers/pinctrl/pinctrl-zynqmp.c
+@@ -473,6 +473,10 @@ static int zynqmp_pinconf_set(struct udevice *dev, unsigned int pin,
+ 				 pin);
+ 		break;
+ 	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
++		param = PM_PINCTRL_CONFIG_TRI_STATE;
++		arg = PM_PINCTRL_TRI_STATE_ENABLE;
++		ret = zynqmp_pm_pinctrl_set_config(pin, param, arg);
++		break;
+ 	case PIN_CONFIG_LOW_POWER_MODE:
+ 		/*
+ 		 * This cases are mentioned in dts but configurable
+@@ -481,6 +485,11 @@ static int zynqmp_pinconf_set(struct udevice *dev, unsigned int pin,
+ 		 */
+ 		ret = 0;
+ 		break;
++	case PIN_CONFIG_OUTPUT_ENABLE:
++		param = PM_PINCTRL_CONFIG_TRI_STATE;
++		arg = PM_PINCTRL_TRI_STATE_DISABLE;
++		ret = zynqmp_pm_pinctrl_set_config(pin, param, arg);
++		break;
+ 	default:
+ 		dev_warn(dev, "unsupported configuration parameter '%u'\n",
+ 			 param);
diff --git a/board/zynqmp/kria/kr260/patches/uboot/0004-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch b/board/zynqmp/kria/kr260/patches/uboot/0004-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
new file mode 100644
index 0000000000..cf95042b22
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/0004-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
@@ -0,0 +1,223 @@
+From: Michal Simek <michal.simek@amd.com>
+Subject: [PATCH v2] arm64: zynqmp: Add output-enable pins to SOMs
+Date: Thu, 31 Aug 2023 16:27:53 +0200
+
+Now that the zynqmp pinctrl driver supports the tri-state registers, make
+sure that the pins requiring output-enable are configured appropriately for
+SOMs.
+
+Without it, all tristate setting for MIOs, which are not related to SOM
+itself, are using default configuration which is not correct setting.
+It means SDs, USBs, ethernet, etc. are not working properly.
+
+In past it was fixed through calling tristate configuration via bootcmd:
+usb_init=mw 0xFF180208 2020
+kv260_gem3=mw 0xFF18020C 0xFC0 && gpio toggle gpio@ff0a000038 && \
+  gpio toggle gpio@ff0a000038
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+---
+
+Changes in v2:
+- update commit message
+- add also fixes for kr260-revB and kv260-revA/B
+
+ arch/arm/dts/zynqmp-sck-kr-g-revA.dts | 6 ++++++
+ arch/arm/dts/zynqmp-sck-kr-g-revB.dts | 6 ++++++
+ arch/arm/dts/zynqmp-sck-kv-g-revA.dts | 5 +++++
+ arch/arm/dts/zynqmp-sck-kv-g-revB.dts | 5 +++++
+ 4 files changed, 22 insertions(+)
+
+diff --git a/arch/arm/dts/zynqmp-sck-kr-g-revA.dts b/arch/arm/dts/zynqmp-sck-kr-g-revA.dts
+index d318773bd9d6..30a0230d4767 100644
+--- a/arch/arm/dts/zynqmp-sck-kr-g-revA.dts
++++ b/arch/arm/dts/zynqmp-sck-kr-g-revA.dts
+@@ -250,6 +250,7 @@
+ 		conf-tx {
+ 			pins = "MIO36";
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux {
+@@ -301,6 +302,7 @@
+ 		conf-bootstrap {
+ 			pins = "MIO45", "MIO47", "MIO49";
+ 			bias-disable;
++			output-enable;
+ 			low-power-disable;
+ 		};
+ 
+@@ -308,6 +310,7 @@
+ 			pins = "MIO38", "MIO39", "MIO40",
+ 				"MIO41", "MIO42", "MIO43";
+ 			bias-disable;
++			output-enable;
+ 			low-power-enable;
+ 		};
+ 
+@@ -316,6 +319,7 @@
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 			power-source = <IO_STANDARD_LVCMOS18>;
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux-mdio {
+@@ -346,6 +350,7 @@
+ 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
+ 			"MIO60", "MIO61", "MIO62", "MIO63";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+@@ -373,6 +378,7 @@
+ 			pins = "MIO66", "MIO68", "MIO69", "MIO70", "MIO71",
+ 			"MIO72", "MIO73", "MIO74", "MIO75";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+diff --git a/arch/arm/dts/zynqmp-sck-kr-g-revB.dts b/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
+index 69dba0761b37..8f4c52d6d643 100644
+--- a/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
++++ b/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
+@@ -250,6 +250,7 @@
+ 		conf-tx {
+ 			pins = "MIO36";
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux {
+@@ -301,6 +302,7 @@
+ 		conf-bootstrap {
+ 			pins = "MIO45", "MIO47", "MIO49";
+ 			bias-disable;
++			output-enable;
+ 			low-power-disable;
+ 		};
+ 
+@@ -308,6 +310,7 @@
+ 			pins = "MIO38", "MIO39", "MIO40",
+ 				"MIO41", "MIO42", "MIO43";
+ 			bias-disable;
++			output-enable;
+ 			low-power-enable;
+ 		};
+ 
+@@ -316,6 +319,7 @@
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 			power-source = <IO_STANDARD_LVCMOS18>;
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux-mdio {
+@@ -346,6 +350,7 @@
+ 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
+ 			"MIO60", "MIO61", "MIO62", "MIO63";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+@@ -373,6 +378,7 @@
+ 			pins = "MIO66", "MIO68", "MIO69", "MIO70", "MIO71",
+ 			"MIO72", "MIO73", "MIO74", "MIO75";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+diff --git a/arch/arm/dts/zynqmp-sck-kv-g-revA.dts b/arch/arm/dts/zynqmp-sck-kv-g-revA.dts
+index a81b3f6f51ad..55bef1df75d0 100644
+--- a/arch/arm/dts/zynqmp-sck-kv-g-revA.dts
++++ b/arch/arm/dts/zynqmp-sck-kv-g-revA.dts
+@@ -205,6 +205,7 @@
+ 		conf-tx {
+ 			pins = "MIO36";
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux {
+@@ -256,6 +257,7 @@
+ 		conf-bootstrap {
+ 			pins = "MIO71", "MIO73", "MIO75";
+ 			bias-disable;
++			output-enable;
+ 			low-power-disable;
+ 		};
+ 
+@@ -263,6 +265,7 @@
+ 			pins = "MIO64", "MIO65", "MIO66",
+ 				"MIO67", "MIO68", "MIO69";
+ 			bias-disable;
++			output-enable;
+ 			low-power-enable;
+ 		};
+ 
+@@ -271,6 +274,7 @@
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 			power-source = <IO_STANDARD_LVCMOS18>;
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux-mdio {
+@@ -301,6 +305,7 @@
+ 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
+ 			"MIO60", "MIO61", "MIO62", "MIO63";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+diff --git a/arch/arm/dts/zynqmp-sck-kv-g-revB.dts b/arch/arm/dts/zynqmp-sck-kv-g-revB.dts
+index f935f25c887f..1b1d9e772f55 100644
+--- a/arch/arm/dts/zynqmp-sck-kv-g-revB.dts
++++ b/arch/arm/dts/zynqmp-sck-kv-g-revB.dts
+@@ -193,6 +193,7 @@
+ 		conf-tx {
+ 			pins = "MIO36";
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux {
+@@ -244,6 +245,7 @@
+ 		conf-bootstrap {
+ 			pins = "MIO71", "MIO73", "MIO75";
+ 			bias-disable;
++			output-enable;
+ 			low-power-disable;
+ 		};
+ 
+@@ -251,6 +253,7 @@
+ 			pins = "MIO64", "MIO65", "MIO66",
+ 				"MIO67", "MIO68", "MIO69";
+ 			bias-disable;
++			output-enable;
+ 			low-power-enable;
+ 		};
+ 
+@@ -259,6 +262,7 @@
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 			power-source = <IO_STANDARD_LVCMOS18>;
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux-mdio {
+@@ -289,6 +293,7 @@
+ 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
+ 			"MIO60", "MIO61", "MIO62", "MIO63";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
diff --git a/board/zynqmp/kria/kr260/pm_cfg_obj.c b/board/zynqmp/kria/kr260/pm_cfg_obj.c
new file mode 100644
index 0000000000..9692a30d37
--- /dev/null
+++ b/board/zynqmp/kria/kr260/pm_cfg_obj.c
@@ -0,0 +1,496 @@
+/******************************************************************************
+* Copyright (c) 2017 - 2021 Xilinx, Inc.  All rights reserved.
+* SPDX-License-Identifier: MIT
+******************************************************************************/
+
+#include "xil_types.h"
+#include "pm_defs.h"
+
+#define PM_CONFIG_MASTER_SECTION_ID	0x101U
+#define PM_CONFIG_SLAVE_SECTION_ID	0x102U
+#define PM_CONFIG_PREALLOC_SECTION_ID	0x103U
+#define PM_CONFIG_POWER_SECTION_ID	0x104U
+#define PM_CONFIG_RESET_SECTION_ID	0x105U
+#define PM_CONFIG_SHUTDOWN_SECTION_ID	0x106U
+#define PM_CONFIG_SET_CONFIG_SECTION_ID	0x107U
+#define PM_CONFIG_GPO_SECTION_ID	0x108U
+
+#define PM_SLAVE_FLAG_IS_SHAREABLE	0x1U
+#define PM_MASTER_USING_SLAVE_MASK	0x2U
+
+#define PM_CONFIG_GPO1_MIO_PIN_34_MAP	(1U << 10U)
+#define PM_CONFIG_GPO1_MIO_PIN_35_MAP	(1U << 11U)
+#define PM_CONFIG_GPO1_MIO_PIN_36_MAP	(1U << 12U)
+#define PM_CONFIG_GPO1_MIO_PIN_37_MAP	(1U << 13U)
+
+#define PM_CONFIG_GPO1_BIT_2_MASK	(1U << 2U)
+#define PM_CONFIG_GPO1_BIT_3_MASK	(1U << 3U)
+#define PM_CONFIG_GPO1_BIT_4_MASK	(1U << 4U)
+#define PM_CONFIG_GPO1_BIT_5_MASK	(1U << 5U)
+
+#define SUSPEND_TIMEOUT	0xFFFFFFFFU
+
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
+#define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
+#define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
+#define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
+
+
+
+#if defined (__ICCARM__)
+#pragma language=save
+#pragma language=extended
+#endif
+#if defined (__GNUC__)
+    const u32 XPm_ConfigObject[] __attribute__((used, section(".sys_cfg_data"))) =
+#elif defined (__ICCARM__)
+#pragma location = ".sys_cfg_data"
+__root const u32 XPm_ConfigObject[] =
+#endif
+{
+	/**********************************************************************/
+	/* HEADER */
+	2,	/* Number of remaining words in the header */
+	8,	/* Number of sections included in config object */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
+	/**********************************************************************/
+	/* MASTER SECTION */
+	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
+	3U, /* No. of Masters*/
+
+	NODE_APU, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
+
+	NODE_RPU_0, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
+
+	NODE_RPU_1, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Wake permissions */
+
+
+	/**********************************************************************/
+	/* SLAVE SECTION */
+
+
+	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
+	35,				/* Number of slaves */
+
+	NODE_OCM_BANK_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_3,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TCM_0_A,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_TCM_0_B,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_TCM_1_A,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TCM_1_B,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_L2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU_PP_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU_PP_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_USB_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_USB_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_3,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_ETH_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_ETH_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_UART_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_SPI_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_I2C_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_DP,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GDMA,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_ADMA,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_QSPI,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPIO,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_EXTERN,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_DDR,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK| PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_IPI_APU,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask */
+
+	NODE_IPI_RPU_0,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_IPI_RPU_1,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_RTC,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_PL,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+
+	/**********************************************************************/
+	/* PREALLOC SECTION */
+
+	PM_CONFIG_PREALLOC_SECTION_ID, /* Preallaoc SectionID */
+	3U, /* No. of Masters*/
+
+/* Prealloc for psu_cortexa53_0 */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK,
+	10,
+	NODE_DDR,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_L2,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_0,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_2,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_3,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_I2C_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_QSPI,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_PL,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_APU,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	/* Prealloc for psu_cortexr5_0 */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
+	3,
+	NODE_TCM_0_A,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_TCM_0_B,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_RPU_0,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	/* Prealloc for psu_cortexr5_1 */
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	3,
+	NODE_TCM_1_A,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_TCM_1_B,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_RPU_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	
+	/**********************************************************************/
+	/* POWER SECTION */
+
+	PM_CONFIG_POWER_SECTION_ID, /* Power Section ID */
+	4U, /* Number of power nodes */
+
+	NODE_APU, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_RPU, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_FPD, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_PLD, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+
+	/**********************************************************************/
+	/* RESET SECTION */
+
+	PM_CONFIG_RESET_SECTION_ID, /* Reset Section ID */
+	120U, /* Number of resets */
+
+	XILPM_RESET_PCIE_CFG, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PCIE_BRIDGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PCIE_CTRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SWDT_CRF, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GDMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU_PP1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU_PP0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SATA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU3_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU2_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU1_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU0_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APU_L2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DDR, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APM_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SOFT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_QSPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_UART0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_UART1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SPI0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SPI1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SDIO0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SDIO1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_CAN0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_CAN1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_I2C0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_I2C1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SWDT_CRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_NAND, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ADMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IOU_CC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TIMESTAMP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_R50, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_R51, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_AMBA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_OCM, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_PGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APM_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RTC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SYSMON, 0,
+	XILPM_RESET_AFI_FM6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_LPD_SWDT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_FPD, PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
+	XILPM_RESET_RPU_DBG1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_DBG0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DBG_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DBG_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_VPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IOPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_7, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_8, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_9, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_10, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_11, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_12, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_13, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_14, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_15, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_16, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_17, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_18, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_19, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_20, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_21, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_22, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_23, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_24, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_25, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_26, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_27, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_28, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_29, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_30, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_31, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_LS, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PS_ONLY, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_92, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_93, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_94, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_95, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+
+	/**********************************************************************/
+	/* SET CONFIG SECTION */
+	PM_CONFIG_SET_CONFIG_SECTION_ID,		/* Set Config Section ID */
+	0U, /* Permissions to load base config object */
+	0U, /* Permissions to load overlay config object */
+
+	/**********************************************************************/
+	/* SHUTDOWN SECTION */
+
+	PM_CONFIG_SHUTDOWN_SECTION_ID, /* Shutdown Section ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* System Shutdown/Restart Permission */
+
+	/**********************************************************************/
+	/* GPO SECTION */
+	PM_CONFIG_GPO_SECTION_ID,		/* GPO Section ID */
+	PM_CONFIG_GPO1_MIO_PIN_35_MAP |
+	0,					/* State of GPO pins */
+};
+#if defined (__ICCARM__)
+#pragma language=restore
+#endif
+
diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index bea1430482..dc6915f081 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -3,14 +3,17 @@ Xilinx Kria SOM Starter Kits - ZynqMP SoC
 **************************************************
 
 This document describes the Buildroot support for the Kria 
-KV260 starter kit by Xilinx, based on Kria SOM including the 
+KV260 and KR260 starter kits by Xilinx, based on Kria SOM including the 
 Zynq UltraScale+ MPSoC (aka ZynqMP).  It has been tested with 
-the KV260 production board.
+the KV260 and KR260 production boards.
 
-Evaluation board features can be found here with the link below.
+Evaluation board features can be found here with the links below.
 
 KV260:
-https://www.xilinx.com/products/boards-and-kits/kv260.html
+https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html
+
+KR260:
+https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
 
 How to build it
 ===============
@@ -65,7 +68,7 @@ in that the boot.bin and u-boot.itb files need to be flashed
 into the QSPI boot flash such that U-Boot can then load all
 of the remaining images from the SD card.
 
-In addition, the KV260 Starter Kit QSPI comes pre-flashed with
+In addition, the KV260 and KR260 Starter Kits QSPI comes pre-flashed with
 a utility designed to make updating the QSPI flash memory
 easier.
 
@@ -76,8 +79,9 @@ https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM#Bo
 
 Additionally, it is possible to use u-boot for updating the
 QSPI with new boot.bin and u-boot.itb images with the u-boot
-commands below:
+commands below.
 
+KV260 Flashing Instructions:
 Flashing u-boot.itb:
     $ sf probe
     $ fatload mmc 1 0x1000000 u-boot.itb
@@ -90,5 +94,18 @@ Flashing boot.bin:
     $ sf erase 0x200000 +$filesize
     $ sf write 0x1000000 0x200000 $filesize
 
+KR260 Flashing Instructions:
+Flashing u-boot.itb:
+    $ sf probe
+    $ fatload usb 0 0x1000000 u-boot.itb
+    $ sf erase 0xf80000 +$filesize
+    $ sf write 0x1000000 0xf80000 $filesize
+
+Flashing boot.bin:
+    $ sf probe
+    $ fatload usb 0 0x1000000 boot.bin
+    $ sf erase 0x200000 +$filesize
+    $ sf write 0x1000000 0x200000 $filesize
+
 It is possible to boot the Buildroot generated SD card image without
 updating the QSPI boot.bin image, so this is an optional step.
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
new file mode 100644
index 0000000000..ee1c5267e0
--- /dev/null
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -0,0 +1,42 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kr260/kr260.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_TARGET_UBOOT_ZYNQMP=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/kr260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/kr260/patches board/zynqmp/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
