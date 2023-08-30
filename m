Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DD8C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 08:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D5FE81B10;
	Wed, 30 Aug 2023 08:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D5FE81B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CS3FDYs71s1j; Wed, 30 Aug 2023 08:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0ABB81B7B;
	Wed, 30 Aug 2023 08:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0ABB81B7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6E3C1BF282
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 08:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D811418AD
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 08:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D811418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w5khMMSCsu5E for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 08:59:10 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::611])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1453840545
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 08:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1453840545
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+4MvikdQjV1FxmhynlbDf+c54+54RpVFPJdUqVmKUAMVp4u0vx0CcIYOAqq61m4b/1QH5YzrSkmA/MGbM6qCvCcCrhFiC52+R0tmHePn5LjAZtpMlpr0PshdClp/5V+Da+AjjT9CQnRk2QpaVVMlxxpSnGUB5sevYQWl3GYERY5zX7mOOqEnutU9vHHgSkfiZHCmRjyxEagts1e8DMtB2792djMoScfcQDoyp3deqpWykvGlf/nuLV7Gnyu29M0Htd2ayPMbsY75NSA9eO8Grn1LOc+q7lualJc5dT6X+uhMksfJcn3Fx0sgBzJu5AC0urYN8PEB52sZaR1KskQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdyDUqvpuWQFtRWU0OW2l8rnoUuLq00XHjNK+R9l1JY=;
 b=gNOhItAIwWT1Cu0LiELk1DaGM6Gm2FHmKQ58BT2KJtDxPLSO7glSg4XkB11Pq3XgO7MDHctE6fJLmpM2MN/Q6zY0yHFPGjNri22X37dRXs2C7FrJmF1UYmTLT4si8C6Z7jHE6HHZGCpZqEhiq9BtNF+gWLn7kJLNOL/RuF1vRQTwrLhNUtnv+yW8Rj1IH3uKdXnyPy/3v3ISb65LxCi0kYMi6G7MXS8uvEzb98u0RU0ANbFclUrkGvQ4C3jnXBNMzuqZkQjdlXHfVILOeN9Q/I6Yb2NYPrA2CCtrwPOwZMoJumN287lhKfl7UlfcaU2GwSHek5Xb2YXcZNzU558uTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49) by
 BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 08:59:04 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::4c) by BYAPR01CA0072.outlook.office365.com
 (2603:10b6:a03:94::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Wed, 30 Aug 2023 08:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Wed, 30 Aug 2023 08:59:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 03:59:02 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 30 Aug 2023 03:59:01 -0500
To: <buildroot@buildroot.org>
Date: Wed, 30 Aug 2023 09:58:59 +0100
Message-ID: <20230830085859.524233-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: e939db16-1f49-4074-206d-08dba9375c2d
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rEX1FU1HdW36WK0EtMCGzJfj5zfuYSNa9xzojkKpdDTOIYlcU8axATFWUEsPLO6c1b0NPqWTH4vEHWsQahURDrbTbwTNCOh4Dn9Cshmi9V5Dcue8wisqkAO6IvhWZCNogxI6W4Ydc8Y3ITkY1hOojWxdQ/w4MzVZ8MdrSfwViPrSOpc6VycQetwh3QV7Xq8RFNScbPoEq36+OPlG+gd++139fFY4Tf7gJVyD0ydHWJDXSan9SSEgqSXw8ByDw6k5wjLxW4PTVGnKbtkSqzvo9N2rkT8kqeL5VErXl/Dfb9sLfe/+1jAK32asKRx2U0lx470iVRYVo33Y14g1ajYSlq4eiDRVOKeRqTil0v+eaO0/TcQA6itLqFZQfb+ApafSpXbmG++v43o88LukUN3EVbDizLpMS9+8eY1UQHAC68gSDsZ6Jwa6RhWk7+ukP1BWzponiLwnCNyaoVBkBRqK+qQstUrS6jvR6MRC/TeJZG7PlIMtyn4vOcRKidUSFHOZEEwvjFwQyBFmV/wq9fwR549vsf3PZDkE5QboDgC4IAt0evKjtmyeEP75GhWI9dTQVBPyg31uXb37xgAs0XXYZArYHMyTaoLZNxD4uriUeut5nqVOIeLKqmQ/Ml23XtL2gtTdYzUjSU/X6xlGSVqQUSZ8JBiIXFpEaGqK1oqqwKiuhRFUDRalMHevIwKCayuOfVlYqVBXAQPaKgzueh9UFrcSYJccBKpc0eQeIh1LbM1k4kMOwSGNNYjKAyjnxmeiI4YU9LFSLh/kygYT6FW6rjCmNqNwV+pON8SHaOzVdAY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(82310400011)(186009)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(83380400001)(966005)(45080400002)(2906002)(1076003)(70206006)(426003)(478600001)(26005)(336012)(30864003)(6916009)(2616005)(316002)(54906003)(8936002)(4326008)(41300700001)(8676002)(44832011)(66574015)(5660300002)(70586007)(36756003)(40460700003)(40480700001)(86362001)(356005)(36860700001)(81166007)(47076005)(82740400003)(66899024)(1406899027)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 08:59:03.6095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e939db16-1f49-4074-206d-08dba9375c2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdyDUqvpuWQFtRWU0OW2l8rnoUuLq00XHjNK+R9l1JY=;
 b=qUG8jH8bp9sX3ojWmjmLbVFnm0piiKQpxwlFjKjDRZUQzWK1VwOCvQNC6qpaUcJX8kDW3ecgxq7CDskJjGY8OPFyyywDfcay6s+FyJ+hNNJZJBnoq/eRC62tjVAVI5GlPMvxwW1I8JnIHi94Q7BSHoHxkSJVnx4QwE9+EmUA8m0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qUG8jH8b
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kr260_defconfig: new
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
http://patchwork.ozlabs.org/project/uboot/patch/20230830065737.4083577-1-neal.frager@amd.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - Submitted u-boot pinctrl tri-state patches upstream
---
 DEVELOPERS                                    |   1 +
 board/zynqmp/kria/kr260/kr260.sh              |  12 +
 ...-zynqmp-Add-support-to-check-feature.patch | 209 ++++++++
 ...ion-check-for-TRISTATE-configuration.patch | 183 +++++++
 ...utput-enable-and-bias-high-impedance.patch | 188 +++++++
 ...zynqmp-sck-kr-g-revB.dts-add-output-.patch |  74 +++
 board/zynqmp/kria/kr260/pm_cfg_obj.c          | 496 ++++++++++++++++++
 board/zynqmp/kria/readme.txt                  |  29 +-
 configs/zynqmp_kria_kr260_defconfig           |  42 ++
 9 files changed, 1228 insertions(+), 6 deletions(-)
 create mode 100755 board/zynqmp/kria/kr260/kr260.sh
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/1-3-firmware-zynqmp-Add-support-to-check-feature.patch
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/2-3-pinctrl-zynqmp-Add-version-check-for-TRISTATE-configuration.patch
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/3-3-pinctrl-zynqmp-Add-support-for-output-enable-and-bias-high-impedance.patch
 create mode 100644 board/zynqmp/kria/kr260/patches/uboot/v1-0001-arch-arm-dts-zynqmp-sck-kr-g-revB.dts-add-output-.patch
 create mode 100644 board/zynqmp/kria/kr260/pm_cfg_obj.c
 create mode 100644 configs/zynqmp_kria_kr260_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 241de082eb..238ac109a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2234,6 +2234,7 @@ F:	board/zynq/
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
diff --git a/board/zynqmp/kria/kr260/patches/uboot/1-3-firmware-zynqmp-Add-support-to-check-feature.patch b/board/zynqmp/kria/kr260/patches/uboot/1-3-firmware-zynqmp-Add-support-to-check-feature.patch
new file mode 100644
index 0000000000..994dcf8777
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/1-3-firmware-zynqmp-Add-support-to-check-feature.patch
@@ -0,0 +1,209 @@
+From patchwork Fri Aug 11 05:48:27 2023
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+X-Patchwork-Submitter: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+X-Patchwork-Id: 1820137
+X-Patchwork-Delegate: monstr@monstr.eu
+Return-Path: <u-boot-bounces@lists.denx.de>
+X-Original-To: incoming@patchwork.ozlabs.org
+Delivered-To: patchwork-incoming@legolas.ozlabs.org
+Authentication-Results: legolas.ozlabs.org;
+ spf=pass (sender SPF authorized) smtp.mailfrom=lists.denx.de
+ (client-ip=2a01:238:438b:c500:173d:9f52:ddab:ee01; helo=phobos.denx.de;
+ envelope-from=u-boot-bounces@lists.denx.de; receiver=<UNKNOWN>)
+Authentication-Results: legolas.ozlabs.org;
+	dkim=pass (1024-bit key;
+ unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
+ header.s=selector1 header.b=pSwQ9PId;
+	dkim-atps=neutral
+Received: from phobos.denx.de (phobos.denx.de
+ [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
+	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
+	 key-exchange X25519 server-signature ECDSA (P-384))
+	(No client certificate requested)
+	by legolas.ozlabs.org (Postfix) with ESMTPS id 4RMXsy5MdWz1yYC
+	for <incoming@patchwork.ozlabs.org>; Fri, 11 Aug 2023 15:49:10 +1000 (AEST)
+Received: from h2850616.stratoserver.net (localhost [IPv6:::1])
+	by phobos.denx.de (Postfix) with ESMTP id 6D876868ED;
+	Fri, 11 Aug 2023 07:48:55 +0200 (CEST)
+Authentication-Results: phobos.denx.de;
+ dmarc=pass (p=quarantine dis=none) header.from=amd.com
+Authentication-Results: phobos.denx.de;
+ spf=pass smtp.mailfrom=u-boot-bounces@lists.denx.de
+Authentication-Results: phobos.denx.de;
+	dkim=pass (1024-bit key;
+ unprotected) header.d=amd.com header.i=@amd.com header.b="pSwQ9PId";
+	dkim-atps=neutral
+Received: by phobos.denx.de (Postfix, from userid 109)
+ id 9A849861E6; Fri, 11 Aug 2023 07:48:51 +0200 (CEST)
+X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on phobos.denx.de
+X-Spam-Level: 
+X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
+ DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
+ SPF_PASS autolearn=ham autolearn_force=no version=3.4.2
+Received: from NAM04-MW2-obe.outbound.protection.outlook.com
+ (mail-mw2nam04on2061d.outbound.protection.outlook.com
+ [IPv6:2a01:111:f400:7e8c::61d])
+ (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
+ (No client certificate requested)
+ by phobos.denx.de (Postfix) with ESMTPS id 89407868F9
+ for <u-boot@lists.denx.de>; Fri, 11 Aug 2023 07:48:49 +0200 (CEST)
+Authentication-Results: phobos.denx.de;
+ dmarc=pass (p=quarantine dis=none) header.from=amd.com
+Authentication-Results: phobos.denx.de;
+ spf=fail smtp.mailfrom=ashok.reddy.soma@amd.com
+ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
+ b=NP6jkYL8qxDCp2oQ9GM+ExQXs1NUQWXSnQBAd4q/7M7DO88dE/qXrybl46iKxIUUJxxhi0RfoROwvs+YfACLM3ze+IZUjUisiqozItghDG3p73Lgym1kY9Hqe5S7Qptw7ZMr8aHv3MQgy8e6KDcHh9aShV+pYSuPc5cUUOi+vfsTKYy/AQJww3x+2toS5Jf39RLJEVCwaHWVbG7WuNkHnuHA8DJLCHOVOijp1ZaNSWCu9Ki++ONYht8BZiKgWKmIjRS5rzUjztuqEae39Xx5NNqdmvD5CmAOP0AmR5JeN0KD9igiZYQpiFZg1s6KXwSXaZ5EP+i5U9noHzVZcCM9fg==
+ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
+ s=arcselector9901;
+ h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
+ bh=fyjsl+jndltlb3R78hHk4vX1IfLVm8OzOtXYPvpv5Zk=;
+ b=FBe0kgm1zhbTYnnbOZGGKFWny3T5iPvcg6MRe2AbMYZyA6SUIppyT+1Uvh6gxssBKBTmH1NItCVM5IDzka2AaQtf+bf9WlZ2lVuiVmWexjwOMEmfKmH8tldoOBPlrjJ3TeOVnVokLCZoeC0V2D78CBr+xqO+gDr13Njr6mXNquMEiq6kxkvl2vipC5CV1F+A7zwSTlgi6KhxXNw+rRXUqJ9LsUZbWx4brKRoa2YODi4Ebwoo9hCmS1HMD3Auvl3iWtnCF32fjSSHgQj5zvU9D3Z5AEKznFgYSGFZP2LWxMi6ZAgEqsOGjkHe1r6h3J3eNlP/k2y/ct0WLaO1uQP8GQ==
+ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
+ 165.204.84.17) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=amd.com;
+ dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
+ header.from=amd.com; dkim=none (message not signed); arc=none
+DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
+ h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
+ bh=fyjsl+jndltlb3R78hHk4vX1IfLVm8OzOtXYPvpv5Zk=;
+ b=pSwQ9PIdbfhUvtylumlnsvPwkWWb0z5PE89AkVXn4FwFF7oYLDSD32MUYKJ1/cePNR+YqfQ9Tb4pGZn+nJmA5xL1iN8C1ucHRKWaTQCQtX8lZ8HtuJZ7bZjwuL/+U503gBoEUrunUQsXmiDhdT2asJiMdDKeY0XO4/aul6gCjLY=
+Received: from PH8PR02CA0011.namprd02.prod.outlook.com (2603:10b6:510:2d0::10)
+ by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12)
+ with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
+ 2023 05:48:44 +0000
+Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
+ (2603:10b6:510:2d0:cafe::70) by PH8PR02CA0011.outlook.office365.com
+ (2603:10b6:510:2d0::10) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
+ Transport; Fri, 11 Aug 2023 05:48:44 +0000
+X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
+ smtp.mailfrom=amd.com; dkim=none (message not signed)
+ header.d=none;dmarc=pass action=none header.from=amd.com;
+Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
+ 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
+ client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
+Received: from SATLEXMB04.amd.com (165.204.84.17) by
+ SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
+ SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
+ 15.20.6652.19 via Frontend Transport; Fri, 11 Aug 2023 05:48:42 +0000
+Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
+ (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
+ 2023 00:48:42 -0500
+Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
+ (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
+ 2023 22:48:41 -0700
+Received: from xhdashokred41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
+ (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
+ Transport; Fri, 11 Aug 2023 00:48:40 -0500
+From: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+To: <u-boot@lists.denx.de>
+CC: <michal.simek@amd.com>, <stefan.herbrechtsmeier@weidmueller.com>,
+ <git@amd.com>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+Subject: [PATCH 1/3] firmware: zynqmp: Add support to check feature
+Date: Thu, 10 Aug 2023 23:48:27 -0600
+Message-ID: <20230811054829.13162-2-ashok.reddy.soma@amd.com>
+X-Mailer: git-send-email 2.17.1
+In-Reply-To: <20230811054829.13162-1-ashok.reddy.soma@amd.com>
+References: <20230811054829.13162-1-ashok.reddy.soma@amd.com>
+MIME-Version: 1.0
+X-EOPAttributedMessage: 0
+X-MS-PublicTrafficType: Email
+X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|MN6PR12MB8567:EE_
+X-MS-Office365-Filtering-Correlation-Id: 4ba8d12c-def1-4d2f-106c-08db9a2e9f02
+X-MS-Exchange-SenderADCheck: 1
+X-MS-Exchange-AntiSpam-Relay: 0
+X-Microsoft-Antispam: BCL:0;
+X-Microsoft-Antispam-Message-Info: 
+ 4mkaZgBVos4fa4lPQfWY22d82TnCPJoWxhvXQr+ztK6MKhwsRa5k8hzanDjAexNVEZwQCOWd6Fx2s2lbEOkSgqIU/JCdcGsYzZ72uwcP+G3kWdhn9kHS4Pxmiyqb/ypfl22hYcMmBd7cfaAqQoP8fLDCLUMU5IBQyKn7wyuTQcFrOI0iHHQRxJHwz91Sq6UjjlfrQcstK0OWipro7a9f3P+7shfae0yla+w1bmz4Egfh5v7RYw55a+OJ6MceXVaP/XKiH5ms+Vt8TQepR+8QNJc5749Jc9EgSETNfROZkaW2U7HVRqI4pwseAxrq4vzhXNjDRN+vnL710C2lcnXfeCZaNnFJ1dEVhgsFdvFG/VkYihVju0AesoJKnPff263WMP7S/ymWreu9nUzJ+UvtvADIGbdIOj5/dzMcf06Z+Laqa1GvCAKCQzJuNdknhW1FGqKq5rhg7I1BT9A4HShxHKotBJzjwqzT0JSyM4CJPjnFgtMnx3PkCepstZs0rlkN9+/raYlDX/4DXcWLpPojgzMq3N5ABDy6xzWoeGHPpWzi3yosDugCOc8KvEaFSFA7r22F3L+CpxbRlgtV+auz+59Xv+eePEKhhMbU5OSccPOSb1vKeD4Ex/kjLH6DLTZQr1g3byVOl0Whl5WkXOH9srzmdb/4+PyTpuSkoHwwmJdIZ8geO4b52+cIgikQGEq04zfR/r2mghQYxhxMhH9ZOxtpZfwIxfzoej0gbnQ8Aifcwp/4ZAivLEnpMIuOICp0J/qq0oGT0dLAWxOSOm+wRA==
+X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
+ IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
+ SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(82310400008)(186006)(451199021)(1800799006)(36840700001)(46966006)(40470700004)(2616005)(103116003)(478600001)(426003)(86362001)(40480700001)(36756003)(2906002)(6666004)(336012)(40460700003)(1076003)(26005)(83380400001)(356005)(54906003)(81166007)(316002)(70206006)(70586007)(6916009)(4326008)(41300700001)(5660300002)(47076005)(8936002)(8676002)(36860700001)(82740400003)(36900700001);
+ DIR:OUT; SFP:1101;
+X-OriginatorOrg: amd.com
+X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 05:48:42.9161 (UTC)
+X-MS-Exchange-CrossTenant-Network-Message-Id: 
+ 4ba8d12c-def1-4d2f-106c-08db9a2e9f02
+X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
+X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
+ TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
+ Helo=[SATLEXMB04.amd.com]
+X-MS-Exchange-CrossTenant-AuthSource: 
+ SN1PEPF000252A3.namprd05.prod.outlook.com
+X-MS-Exchange-CrossTenant-AuthAs: Anonymous
+X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
+X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567
+X-BeenThere: u-boot@lists.denx.de
+X-Mailman-Version: 2.1.39
+Precedence: list
+List-Id: U-Boot discussion <u-boot.lists.denx.de>
+List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
+ <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
+List-Archive: <https://lists.denx.de/pipermail/u-boot/>
+List-Post: <mailto:u-boot@lists.denx.de>
+List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
+List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
+ <mailto:u-boot-request@lists.denx.de?subject=subscribe>
+Errors-To: u-boot-bounces@lists.denx.de
+Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
+X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
+X-Virus-Status: Clean
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
diff --git a/board/zynqmp/kria/kr260/patches/uboot/2-3-pinctrl-zynqmp-Add-version-check-for-TRISTATE-configuration.patch b/board/zynqmp/kria/kr260/patches/uboot/2-3-pinctrl-zynqmp-Add-version-check-for-TRISTATE-configuration.patch
new file mode 100644
index 0000000000..3325d387b3
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/2-3-pinctrl-zynqmp-Add-version-check-for-TRISTATE-configuration.patch
@@ -0,0 +1,183 @@
+From patchwork Fri Aug 11 05:48:28 2023
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+X-Patchwork-Submitter: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+X-Patchwork-Id: 1820136
+X-Patchwork-Delegate: monstr@monstr.eu
+Return-Path: <u-boot-bounces@lists.denx.de>
+X-Original-To: incoming@patchwork.ozlabs.org
+Delivered-To: patchwork-incoming@legolas.ozlabs.org
+Authentication-Results: legolas.ozlabs.org;
+ spf=pass (sender SPF authorized) smtp.mailfrom=lists.denx.de
+ (client-ip=2a01:238:438b:c500:173d:9f52:ddab:ee01; helo=phobos.denx.de;
+ envelope-from=u-boot-bounces@lists.denx.de; receiver=<UNKNOWN>)
+Authentication-Results: legolas.ozlabs.org;
+	dkim=pass (1024-bit key;
+ unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
+ header.s=selector1 header.b=0uLgsBDp;
+	dkim-atps=neutral
+Received: from phobos.denx.de (phobos.denx.de
+ [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
+	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
+	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
+	(No client certificate requested)
+	by legolas.ozlabs.org (Postfix) with ESMTPS id 4RMXsn59X5z1yYC
+	for <incoming@patchwork.ozlabs.org>; Fri, 11 Aug 2023 15:49:01 +1000 (AEST)
+Received: from h2850616.stratoserver.net (localhost [IPv6:::1])
+	by phobos.denx.de (Postfix) with ESMTP id 2A570868FC;
+	Fri, 11 Aug 2023 07:48:52 +0200 (CEST)
+Authentication-Results: phobos.denx.de;
+ dmarc=pass (p=quarantine dis=none) header.from=amd.com
+Authentication-Results: phobos.denx.de;
+ spf=pass smtp.mailfrom=u-boot-bounces@lists.denx.de
+Authentication-Results: phobos.denx.de;
+	dkim=pass (1024-bit key;
+ unprotected) header.d=amd.com header.i=@amd.com header.b="0uLgsBDp";
+	dkim-atps=neutral
+Received: by phobos.denx.de (Postfix, from userid 109)
+ id B1F20868FE; Fri, 11 Aug 2023 07:48:50 +0200 (CEST)
+X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on phobos.denx.de
+X-Spam-Level: 
+X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
+ DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
+ SPF_PASS autolearn=ham autolearn_force=no version=3.4.2
+Received: from NAM10-DM6-obe.outbound.protection.outlook.com
+ (mail-dm6nam10on2060d.outbound.protection.outlook.com
+ [IPv6:2a01:111:f400:7e88::60d])
+ (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
+ (No client certificate requested)
+ by phobos.denx.de (Postfix) with ESMTPS id B4C80861E6
+ for <u-boot@lists.denx.de>; Fri, 11 Aug 2023 07:48:48 +0200 (CEST)
+Authentication-Results: phobos.denx.de;
+ dmarc=pass (p=quarantine dis=none) header.from=amd.com
+Authentication-Results: phobos.denx.de;
+ spf=fail smtp.mailfrom=ashok.reddy.soma@amd.com
+ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
+ b=ZLj5NJMCdf6sMkEuvHbBTEA01e4wTtioSdhF1D5yw72Y03QV27E0s+KAKw4tM8L/FQXaVIukV9WfTji2i/ru2LJg2GVhQCcJyNMbPhv7DbUocbw6aGAMNN4YmIHLdlABM8KDkb9Ja56kG5S1yIbVAtB3P8Z2A/QNKjvbw78p1as0SPp0Uhkik8vDjPMhSqGebWUDU2tSIRFprsPqHVoqL3E5j3JNWlb+cHCtH12dUa3WYMV4qOcmsuslgTcHiP0zJ9hugP+bWgIRI7sBXt8s0nxETnc7+Nv8iQTMQ5TJl7+/AKL+0ZsofR2d82GOLwCpkQC1xL2jPZlsRWC/R1A53A==
+ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
+ s=arcselector9901;
+ h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
+ bh=+84R17hRI5aqh4qgiTIpSl2HJc5Rezsl2a3UOL7kVpY=;
+ b=GIZsxJLK+oHp6HtGEyoMs3enRzYkq/AfEEjXB9cU1X+rs0+RRU7AfMakN169N0FN9H2e2D6TLCbE0oeaEUYKGSmPLp8sv65pArFMjh6IIQxx+/1/1P8Zpc8qlDVzgWhsTs83R9Be1kU8UxN2BHE1EDHhOl+38e7EIZQaprgaGGc01U3Q7LsaT5m4VtTb+WKa0Jci/99FKkffvj5r9g33F8MgVA1BHCEPKzULvC9prKHknzWag386scwwE+kVG0BBAxNp43uQRQ97XyLHrTumPtoq1wCOGDgvj6vrznymp2L/J7xLWymEP2A05A2xuyyZQv/WPVavf3uWRsJusEqmyQ==
+ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
+ 165.204.84.17) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=amd.com;
+ dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
+ header.from=amd.com; dkim=none (message not signed); arc=none
+DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
+ h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
+ bh=+84R17hRI5aqh4qgiTIpSl2HJc5Rezsl2a3UOL7kVpY=;
+ b=0uLgsBDpDqbYandHH37+F2he5bfGS9PlHIs/II4B4yY2Njhe/FVquSycTtkN+2KX8yfdomTFHMQ/PNP2N5kSMu0fapl6hx1Q7QjRZ4wiSau/iln8tWaiz3iCSc63g1LpN3i+PC73syBzts7k49P+WcAYexkv/itxXaJFDUNxzqI=
+Received: from DM6PR06CA0092.namprd06.prod.outlook.com (2603:10b6:5:336::25)
+ by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with Microsoft
+ SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
+ 15.20.6678.20; Fri, 11 Aug 2023 05:48:45 +0000
+Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
+ (2603:10b6:5:336:cafe::74) by DM6PR06CA0092.outlook.office365.com
+ (2603:10b6:5:336::25) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31 via Frontend
+ Transport; Fri, 11 Aug 2023 05:48:45 +0000
+X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
+ smtp.mailfrom=amd.com; dkim=none (message not signed)
+ header.d=none;dmarc=pass action=none header.from=amd.com;
+Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
+ 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
+ client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
+Received: from SATLEXMB03.amd.com (165.204.84.17) by
+ DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
+ Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
+ 15.20.6678.18 via Frontend Transport; Fri, 11 Aug 2023 05:48:45 +0000
+Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
+ (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
+ 2023 00:48:44 -0500
+Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
+ (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
+ 2023 22:48:44 -0700
+Received: from xhdashokred41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
+ (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
+ Transport; Fri, 11 Aug 2023 00:48:42 -0500
+From: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+To: <u-boot@lists.denx.de>
+CC: <michal.simek@amd.com>, <stefan.herbrechtsmeier@weidmueller.com>,
+ <git@amd.com>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+Subject: [PATCH 2/3] pinctrl: zynqmp: Add version check for TRISTATE
+ configuration
+Date: Thu, 10 Aug 2023 23:48:28 -0600
+Message-ID: <20230811054829.13162-3-ashok.reddy.soma@amd.com>
+X-Mailer: git-send-email 2.17.1
+In-Reply-To: <20230811054829.13162-1-ashok.reddy.soma@amd.com>
+References: <20230811054829.13162-1-ashok.reddy.soma@amd.com>
+MIME-Version: 1.0
+X-EOPAttributedMessage: 0
+X-MS-PublicTrafficType: Email
+X-MS-TrafficTypeDiagnostic: DM6NAM11FT026:EE_|DM4PR12MB6184:EE_
+X-MS-Office365-Filtering-Correlation-Id: b48c8eb7-ed87-443e-2d08-08db9a2ea069
+X-MS-Exchange-SenderADCheck: 1
+X-MS-Exchange-AntiSpam-Relay: 0
+X-Microsoft-Antispam: BCL:0;
+X-Microsoft-Antispam-Message-Info: 
+ zi1/zek0E+nWB2sB1bClmDZrbNfxUA8z1335YGMizwJNBPY/yGzg9ezsANmxqaNIfWekGlZ5r0ZM0wS1H979ZYleZhtpK+qF4cb6OIISqtZfVbqfiT6BzZp/oDGnv0iGrxzrRoNsEtRXqtkNXBzYkTbJX9XcsMTAgthCfQOc3+qS37W0RI83HeU5uTS0Q5BHoUTlMQXH0oS1dSJE4v/N2vL9CmxxSYajeayBVhiSI/V2+p6JBs5geDIWbNIVyYkO6etnTaX5fk2S5XM2F5h+qgiU7anxzXHoXELnCQcSuf9Q8hwq8sM3W4t9O2NjI2rxNRqMuubLqJKn89DV60N+Iz8bzlbiC6Drj6DuEydA5IiPlwSC5OYsf+IblLjxUq7wKS6RRPUE1uDjiIzeoWhMCwVnr3efZvd8qM6LSInkp/VNSA49r7NQGGqD8ej+2X/uOQSRw4j0ju6UPouMB9wvpFTs3vNBrmdR3l2YRUALHmgolvK/wh02NS7x2Q/h+iizCXak9jM3YdVifISOwDcnN6jVclGzOFImBta0grqRxj5jUHCon91ZpAfnts/7skNZqKnGnZ8vy+P6cZGHJR+ZE/qahobsjA4TPl4s3/aBXuxaKcNjC6v9D8IYJwYDFkDfgIARuX/gAX4IeImJPX2mKjgJdJiTUNaM5k9cFbxRJMpaWk4yJE8OfX4UGnWGgMZVC24ViOQs2hRS+Ps/gTCjfr1VQaSGDcdE5YJH8MqnK5nXdxoHi5wJVEpucZDx9zykjeRujF/aN/VN2zhA6C+pgw==
+X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
+ IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
+ SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(186006)(451199021)(82310400008)(1800799006)(40470700004)(36840700001)(46966006)(426003)(2616005)(47076005)(6666004)(54906003)(36860700001)(26005)(336012)(1076003)(82740400003)(83380400001)(36756003)(478600001)(103116003)(356005)(86362001)(81166007)(5660300002)(41300700001)(316002)(70206006)(6916009)(4326008)(70586007)(2906002)(40480700001)(8936002)(40460700003)(8676002)(36900700001);
+ DIR:OUT; SFP:1101;
+X-OriginatorOrg: amd.com
+X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 05:48:45.2696 (UTC)
+X-MS-Exchange-CrossTenant-Network-Message-Id: 
+ b48c8eb7-ed87-443e-2d08-08db9a2ea069
+X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
+X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
+ TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
+ Helo=[SATLEXMB03.amd.com]
+X-MS-Exchange-CrossTenant-AuthSource: 
+ DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
+X-MS-Exchange-CrossTenant-AuthAs: Anonymous
+X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
+X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184
+X-BeenThere: u-boot@lists.denx.de
+X-Mailman-Version: 2.1.39
+Precedence: list
+List-Id: U-Boot discussion <u-boot.lists.denx.de>
+List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
+ <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
+List-Archive: <https://lists.denx.de/pipermail/u-boot/>
+List-Post: <mailto:u-boot@lists.denx.de>
+List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
+List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
+ <mailto:u-boot-request@lists.denx.de?subject=subscribe>
+Errors-To: u-boot-bounces@lists.denx.de
+Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
+X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
+X-Virus-Status: Clean
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
diff --git a/board/zynqmp/kria/kr260/patches/uboot/3-3-pinctrl-zynqmp-Add-support-for-output-enable-and-bias-high-impedance.patch b/board/zynqmp/kria/kr260/patches/uboot/3-3-pinctrl-zynqmp-Add-support-for-output-enable-and-bias-high-impedance.patch
new file mode 100644
index 0000000000..e2647922f1
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/3-3-pinctrl-zynqmp-Add-support-for-output-enable-and-bias-high-impedance.patch
@@ -0,0 +1,188 @@
+From patchwork Fri Aug 11 05:48:29 2023
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+X-Patchwork-Submitter: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+X-Patchwork-Id: 1820138
+X-Patchwork-Delegate: monstr@monstr.eu
+Return-Path: <u-boot-bounces@lists.denx.de>
+X-Original-To: incoming@patchwork.ozlabs.org
+Delivered-To: patchwork-incoming@legolas.ozlabs.org
+Authentication-Results: legolas.ozlabs.org;
+ spf=pass (sender SPF authorized) smtp.mailfrom=lists.denx.de
+ (client-ip=2a01:238:438b:c500:173d:9f52:ddab:ee01; helo=phobos.denx.de;
+ envelope-from=u-boot-bounces@lists.denx.de; receiver=<UNKNOWN>)
+Authentication-Results: legolas.ozlabs.org;
+	dkim=pass (1024-bit key;
+ unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
+ header.s=selector1 header.b=XoYvY3m2;
+	dkim-atps=neutral
+Received: from phobos.denx.de (phobos.denx.de
+ [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
+	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
+	 key-exchange X25519 server-signature ECDSA (P-384))
+	(No client certificate requested)
+	by legolas.ozlabs.org (Postfix) with ESMTPS id 4RMXt82qk2z1yYC
+	for <incoming@patchwork.ozlabs.org>; Fri, 11 Aug 2023 15:49:20 +1000 (AEST)
+Received: from h2850616.stratoserver.net (localhost [IPv6:::1])
+	by phobos.denx.de (Postfix) with ESMTP id B2C69868DE;
+	Fri, 11 Aug 2023 07:48:55 +0200 (CEST)
+Authentication-Results: phobos.denx.de;
+ dmarc=pass (p=quarantine dis=none) header.from=amd.com
+Authentication-Results: phobos.denx.de;
+ spf=pass smtp.mailfrom=u-boot-bounces@lists.denx.de
+Authentication-Results: phobos.denx.de;
+	dkim=pass (1024-bit key;
+ unprotected) header.d=amd.com header.i=@amd.com header.b="XoYvY3m2";
+	dkim-atps=neutral
+Received: by phobos.denx.de (Postfix, from userid 109)
+ id BE97086911; Fri, 11 Aug 2023 07:48:53 +0200 (CEST)
+X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on phobos.denx.de
+X-Spam-Level: 
+X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
+ DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
+ SPF_PASS autolearn=ham autolearn_force=no version=3.4.2
+Received: from NAM12-MW2-obe.outbound.protection.outlook.com
+ (mail-mw2nam12on20621.outbound.protection.outlook.com
+ [IPv6:2a01:111:f400:fe5a::621])
+ (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
+ (No client certificate requested)
+ by phobos.denx.de (Postfix) with ESMTPS id B6A3A861E6
+ for <u-boot@lists.denx.de>; Fri, 11 Aug 2023 07:48:51 +0200 (CEST)
+Authentication-Results: phobos.denx.de;
+ dmarc=pass (p=quarantine dis=none) header.from=amd.com
+Authentication-Results: phobos.denx.de;
+ spf=fail smtp.mailfrom=ashok.reddy.soma@amd.com
+ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
+ b=SSCfZZkmLHmlriFpCng8pCavVWyl2ccXX19Laz310zlTbAVHNX1XMRL2uUqvFBvUK2SKjZnHwd5P1eVe6TmzOutG7L/SpdyLkJnRqoWZ45LQYj2tEsVFcz8v9gyYLqobq4tN6hZawFF72ziL7xpNPXShpYLBpn3f5U9hHe2PgvsOeuDVPVXSsChXzrUu7KK5IOi6/3nMEH2Q77q2T0Kl/Ta3tahDNxjkL79+H8cdd9J9sdOdqjmAl9/1uwJDEWAAglVrezBptdWOcIN+Gr2q4R5Dqa13VXt3P7T5GyRdRTO+NMz5qwa3BvPit9I9IEeZHmEKp5wwpgFJter7iuek3g==
+ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
+ s=arcselector9901;
+ h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
+ bh=Ji2k5Nsq+SAW1PTo6qJsORT1DULVM1nRyHQ3YFv/e7Q=;
+ b=bbCgRvehz4ggrJoMYZymuxIoQbfqoqML2eXfrD5A7XOk+laluGYfnq+JBD9vqQ6Z6yJ2JkYk3grVLaMtWs50EZX1/UifKeocJHoq6zYfM2jxMRC+BE6yBUPhm/zcyFgYC9YoMY12HOjz1mp9MFKQY+w962skhXkjxX0JEOFdwxwRu+SOe1yLWTOhE23Mrm82kCntp8Qd4gO3fByjiOg7LnEjm5PdjPggruQoBYW4oe8QGQoYw4hK6DVPZYJk5h6EEVv9gwRpDW2v3rhHDzgakNvgHqzB01LKAeb2D3kxc7XS6MMJy71GYwHP5+A7GcD6rfHdMxQ+qrRWuJTP+qd6iw==
+ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
+ 165.204.84.17) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=amd.com;
+ dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
+ header.from=amd.com; dkim=none (message not signed); arc=none
+DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
+ h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
+ bh=Ji2k5Nsq+SAW1PTo6qJsORT1DULVM1nRyHQ3YFv/e7Q=;
+ b=XoYvY3m21iRdZ3YfVMYhNT8EC3As1vFu6qel8r9XWIsY2FUakREBD1RoYyhV2hn+5FSAGqewYF6hZhDuUfeCEdxU6hj5QWwOuL1XXoWLvOr8NYBOOvX+BjfjLfvu++W6HDhIN/4c0zRhljtki4BSOVla3ZZI9TYOJk16aGqCs8M=
+Received: from SA0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:806:130::20)
+ by SN7PR12MB6886.namprd12.prod.outlook.com (2603:10b6:806:262::6)
+ with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
+ 2023 05:48:47 +0000
+Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
+ (2603:10b6:806:130:cafe::28) by SA0PR13CA0015.outlook.office365.com
+ (2603:10b6:806:130::20) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.7 via Frontend
+ Transport; Fri, 11 Aug 2023 05:48:47 +0000
+X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
+ smtp.mailfrom=amd.com; dkim=none (message not signed)
+ header.d=none;dmarc=pass action=none header.from=amd.com;
+Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
+ 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
+ client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
+Received: from SATLEXMB04.amd.com (165.204.84.17) by
+ SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
+ SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
+ 15.20.6652.20 via Frontend Transport; Fri, 11 Aug 2023 05:48:46 +0000
+Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
+ (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
+ 2023 00:48:46 -0500
+Received: from xhdashokred41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
+ (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
+ cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
+ Transport; Fri, 11 Aug 2023 00:48:44 -0500
+From: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+To: <u-boot@lists.denx.de>
+CC: <michal.simek@amd.com>, <stefan.herbrechtsmeier@weidmueller.com>,
+ <git@amd.com>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>
+Subject: [PATCH 3/3] pinctrl: zynqmp: Add support for output-enable and
+ bias-high-impedance
+Date: Thu, 10 Aug 2023 23:48:29 -0600
+Message-ID: <20230811054829.13162-4-ashok.reddy.soma@amd.com>
+X-Mailer: git-send-email 2.17.1
+In-Reply-To: <20230811054829.13162-1-ashok.reddy.soma@amd.com>
+References: <20230811054829.13162-1-ashok.reddy.soma@amd.com>
+MIME-Version: 1.0
+X-EOPAttributedMessage: 0
+X-MS-PublicTrafficType: Email
+X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SN7PR12MB6886:EE_
+X-MS-Office365-Filtering-Correlation-Id: 61f7e4bc-6e89-441d-b8e4-08db9a2ea165
+X-MS-Exchange-SenderADCheck: 1
+X-MS-Exchange-AntiSpam-Relay: 0
+X-Microsoft-Antispam: BCL:0;
+X-Microsoft-Antispam-Message-Info: 
+ lI0dSCzmBOrB+1HVqFw25lKDQFelIysna/dr0mQFBKNzJPyJZ5cvfW1PwOgK/Zq3F9Kcf3pdcJQ+fUZoNXCbxfFdp1RwyxUKWkgSBSfBNVIZXOPDnqcNsEtyUQ4iOAW9tKp73goHxYMHFkFWbCIGIUvVQ5XSDxK54mVTEmYj1iFViYt/npTuC9oPmkXxq8ycnXWyWHTWJMTy/Ma2SJXJwDBtaI/x5dyswadlBnnJA+oufqK+mOZtuKiElzi+0tBQ+sbRTVGe+W+RtcZbTXhF0XDheELlL7fnJheKz6S2B8lI8xC4Dd61bd3Vf0HRKC04So8ZIO45D+nGXWOAsruRPluS064NXkYabBq6gz8f1wPHimwLH5ArkkM6EPCCL9mkWJM5RaM9Grjq9Iw7VODlSrKnjAewOQzGCHVrOg4HLYo132VOHMuDK4BJWYPTADifzAjent4NrCUGDOFVwIj+y5LIOJlCZRkg4OzU99ECcNbRhbgefKAGyE/ta4a3j1L+3fswElFlIo5U0934uaKh8miNqyu9jk2bFPkNOl+lX0eUCaGAnRXCTu6nad+BrWX21yTDRSVucEXGHCdEEcnYt6EFubScA3H/JejaPUgDf9xaqbUcu4ULW6tLrF96Xd9wBIItcOJcq6HOq4GshZSX4p4dWKbjJ3rMUjGVfDG0rFjjzIZ7VZKAzzedJoMTG24IyU7kaqAfVQHg0IW8JhH8UaWIC/D5mL1dxh/6y4aT2QjPqbYav4YVIg3i2Hn49r//2QMIH7YU8TYSrI2Gp1DRVA==
+X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
+ IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
+ SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(82310400008)(186006)(1800799006)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(336012)(36756003)(47076005)(1076003)(426003)(26005)(2616005)(36860700001)(8936002)(8676002)(6916009)(4326008)(41300700001)(86362001)(70586007)(70206006)(5660300002)(316002)(2906002)(54906003)(478600001)(6666004)(103116003)(82740400003)(81166007)(356005)(36900700001);
+ DIR:OUT; SFP:1101;
+X-OriginatorOrg: amd.com
+X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 05:48:46.8622 (UTC)
+X-MS-Exchange-CrossTenant-Network-Message-Id: 
+ 61f7e4bc-6e89-441d-b8e4-08db9a2ea165
+X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
+X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
+ TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
+ Helo=[SATLEXMB04.amd.com]
+X-MS-Exchange-CrossTenant-AuthSource: 
+ SN1PEPF000252A2.namprd05.prod.outlook.com
+X-MS-Exchange-CrossTenant-AuthAs: Anonymous
+X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
+X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886
+X-BeenThere: u-boot@lists.denx.de
+X-Mailman-Version: 2.1.39
+Precedence: list
+List-Id: U-Boot discussion <u-boot.lists.denx.de>
+List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
+ <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
+List-Archive: <https://lists.denx.de/pipermail/u-boot/>
+List-Post: <mailto:u-boot@lists.denx.de>
+List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
+List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
+ <mailto:u-boot-request@lists.denx.de?subject=subscribe>
+Errors-To: u-boot-bounces@lists.denx.de
+Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
+X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
+X-Virus-Status: Clean
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
diff --git a/board/zynqmp/kria/kr260/patches/uboot/v1-0001-arch-arm-dts-zynqmp-sck-kr-g-revB.dts-add-output-.patch b/board/zynqmp/kria/kr260/patches/uboot/v1-0001-arch-arm-dts-zynqmp-sck-kr-g-revB.dts-add-output-.patch
new file mode 100644
index 0000000000..e5457384b5
--- /dev/null
+++ b/board/zynqmp/kria/kr260/patches/uboot/v1-0001-arch-arm-dts-zynqmp-sck-kr-g-revB.dts-add-output-.patch
@@ -0,0 +1,74 @@
+From ab2d8eff511cb8e9d3adf5f720af9cfb28c7fbd2 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Tue, 29 Aug 2023 14:18:25 +0100
+Subject: [PATCH v1 1/1] arch/arm/dts/zynqmp-sck-kr-g-revB.dts: add
+ output-enable pins
+
+Now that the zynqmp pinctrl driver supports the tri-state registers, this patch
+makes sure that the pins requiring output-enable are configured appropriately
+for the KR260 Starter Kit.
+
+Without this patch, the USB to SD card bridge on the KR260 starter kit is not
+enabled correctly when booting via SPL.  This causes u-boot to fail to detect
+the SD card interface.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ arch/arm/dts/zynqmp-sck-kr-g-revB.dts | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/arch/arm/dts/zynqmp-sck-kr-g-revB.dts b/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
+index 1ebbe683f3..104e67ddf8 100644
+--- a/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
++++ b/arch/arm/dts/zynqmp-sck-kr-g-revB.dts
+@@ -248,6 +248,7 @@
+ 		conf-tx {
+ 			pins = "MIO36";
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux {
+@@ -299,6 +300,7 @@
+ 		conf-bootstrap {
+ 			pins = "MIO45", "MIO47", "MIO49";
+ 			bias-disable;
++			output-enable;
+ 			low-power-disable;
+ 		};
+ 
+@@ -306,6 +308,7 @@
+ 			pins = "MIO38", "MIO39", "MIO40",
+ 				"MIO41", "MIO42", "MIO43";
+ 			bias-disable;
++			output-enable;
+ 			low-power-enable;
+ 		};
+ 
+@@ -314,6 +317,7 @@
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 			power-source = <IO_STANDARD_LVCMOS18>;
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux-mdio {
+@@ -344,6 +348,7 @@
+ 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
+ 			"MIO60", "MIO61", "MIO62", "MIO63";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+@@ -371,6 +376,7 @@
+ 			pins = "MIO66", "MIO68", "MIO69", "MIO70", "MIO71",
+ 			"MIO72", "MIO73", "MIO74", "MIO75";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+-- 
+2.25.1
+
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

