Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5449EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 08:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB476403AC;
	Tue, 10 May 2022 08:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOx1QDtp3-KQ; Tue, 10 May 2022 08:59:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB5D34013E;
	Tue, 10 May 2022 08:59:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 860631BF20D
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 08:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81EE84013E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 08:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLbFWrSrBOrI for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 08:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::625])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19939400CB
 for <buildroot@buildroot.org>; Tue, 10 May 2022 08:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlG72M7AhXJEOaOof+bSW3lKqwyYrj+mAjDQRSXNEzMXv/3YP9zBzpBq9s4dyVkAnyPd2NwtpP51e14DwSknJ/WpX1tf+hAwWwifuk3iXXogPZmyR3wXZq5OGV45rTd+3iLeVMgEW3IA3oXXa0rZBZLqwoHCdHrdsMiTNZgtTP6WwJvdtY27WerVK7l+Zb4izxIrDjqvWemZn4Xqt/0IlkeWTKmdciCk//hIOZ2OcDlXcBsu7lFBYXGl0tRxKI4LRmtCL7rMB0K3YkfBTbH9LBEWNgx/eWeXPFo5RpKDNNm9l5ac77SICXqAmRuAFmIhRVDjp73CJ/dtwbnmp7wQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3OtIGEeCDTs2q5QoIlrfI5zOVfYWs6Kbl4hBl0X4Oo=;
 b=YbtOskvwZa4po8GAL5ErBy8W6HgCm61uq4xoVRtxrPvtmfDYjc+0oLDAnnAZgmqGKpo0QJqFO7ps4tR97/u95NBMSclmO1qABY96qXUhu9nYWS86DL4r/zFbuWkLpJKdt0d/R3wxOhTkBIrg5a2XE8Lhp9vH2AJoU5LGOZ60jdPM1Jh+c2qd+hTWSck5GNAwGq//1GAeCsOBwRyzbxlnXm5tOrrSAJx93mINl7FvBltUB0OaNOM/nntp3I8sCicLOlTJ0b5E7HtQKjbxOqWdGWK2fjxngqn20gjnj3Ab3YmcZz3N0t+a84MnGUnDNIxpaF0hkbWPpAZZiDYu8LNiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3OtIGEeCDTs2q5QoIlrfI5zOVfYWs6Kbl4hBl0X4Oo=;
 b=apdiLfOM79TcT/1M8VWbnJ+fiEfUCSxFruA9lIZKY1rstUZ4cZxzlVz9fQ4sHK0RzO40+6K9KxtgVZ39op1t+k8CeVLcCI5cDIkLw4TBreMqEuKKf3YJova9fiWVk6tGWmrE+RM0P4bn2UZ649g6hXheJ2bohYtFA1VYykp3Lq0=
Received: from BN9PR03CA0931.namprd03.prod.outlook.com (2603:10b6:408:108::6)
 by DM5PR02MB2652.namprd02.prod.outlook.com (2603:10b6:3:41::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 08:59:35 +0000
Received: from BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::25) by BN9PR03CA0931.outlook.office365.com
 (2603:10b6:408:108::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21 via Frontend
 Transport; Tue, 10 May 2022 08:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT064.mail.protection.outlook.com (10.13.2.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 08:59:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 10 May 2022 01:59:34 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 10 May 2022 01:59:34 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=56686 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1noLiQ-000EwV-9K; Tue, 10 May 2022 01:59:34 -0700
To: <buildroot@buildroot.org>
Date: Tue, 10 May 2022 02:59:30 -0600
Message-ID: <20220510085930.3646411-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aed574c5-2f59-46af-b892-08da326367e8
X-MS-TrafficTypeDiagnostic: DM5PR02MB2652:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB2652DF75DB76E93799B6FC17F0C99@DM5PR02MB2652.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJkirANyu6/AheB8Zdbsl2PFTFs66vkS9pMv7pisxMRCTiLCydKaeagZ9t/KMeqNqsIH0Cp5F1bImjMGCwbtFgAon44OlRk7OSU6SwNyNr0Iou3hyFhmYj77eiq/babi9wZ145k2+BCBtWx0O/945HkSn11LEUBS5mpeQvxnzNsZJnESDlw6RAGG1PrxbkdxcOZ8IT+5mTdl3DNhox8eexYBZBmFQrQxmps1kZeSX5+kV1p0amf5wsW2fPg7z6ZtRXy8tV39dExxo6Ee11fO5brPuEWLBwf/b4im3iUBHE59/no0Otjpwq/XwSKRf2scekgoCeVqKLLurskKVrU6gZhEsonHI2QjzWoxX3jXBp4HcJcAcAQlY9zSEPcrhv2Yw4IydK+tmkynGGAKllE5HMvc3jOQ6t+GefMPwwPwH0Wj0Gr5onqORnlWRvqj8F/3bl6ovgCShXk1aPHy7AqXy4s5iQ4j/DLwTh/k12zOBNzYdghH4g3G15yajO7bp8WJ8m5Iurt22C0NNWJZkb3qyKQtxfhCKpNidQTcsb39hDlEWikKGzmXJx9xbdWEQZt23NCTHNSDOYz7UW1+Kxe0H3eblmydWd3mlkQ/nz0XoLfl4UCpUhPu0YKKRIt0EZnccxRsqGOwu5uoQBU1dqLHZGkKaVqbRaofB/KrJkpb4j0CULoKIum2PETQMslA4vM+EVQCQA34yEEJWYE5IU78qJXZodf3c6n++P7/L8FM/SKT3IC3SVVAxlICDGPpaMAwjaWrcvtQehxxnp60sPpkjUgBkr2X1XPoTUFkLq4K8pY=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(336012)(47076005)(70206006)(356005)(8676002)(70586007)(40460700003)(82310400005)(4326008)(2906002)(26005)(2616005)(83380400001)(6666004)(1076003)(35950700001)(86362001)(9786002)(8936002)(54906003)(6916009)(5660300002)(36756003)(508600001)(19627235002)(316002)(44832011)(7636003)(966005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 08:59:35.0771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aed574c5-2f59-46af-b892-08da326367e8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2652
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fixes to boot.bin and u-boot.itb generation
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
Cc: wesley@sonifex.co.uk, Neal Frager <neal.frager@amd.com>,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch includes the following corrections:
  - additional kria k26 u-boot configs added to uboot.fragment
  - atf moved to uart1 with ZYNQMP_CONSOLE=cadence1 define
  - uboot patch added for correct fit-dtb.blob generation for kria starter kits
  - readme.txt file updated with additional details for qspi flash programming

Please note that the u-boot patch has not been upstreamed yet.
It is being reviewed to find the best solution to handle the dtb overlays moving forward.
For this reason, this is a temporary u-boot patch designed to enable buildroot development.

This patch has been build and run tested on a kria kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/kv260/uboot.fragment        |  14 ++
 ...qmp-add-kria-fit-dtb.blob-generation.patch | 127 ++++++++++++++++++
 board/zynqmp/kria/readme.txt                  |  28 +++-
 configs/zynqmp_kria_kv260_defconfig           |   2 +
 4 files changed, 165 insertions(+), 6 deletions(-)
 create mode 100644 board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-add-kria-fit-dtb.blob-generation.patch

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index e1aca68692..23529e7fdb 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1 +1,15 @@
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
+CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
+CONFIG_DTB_RESELECT=y
+CONFIG_MULTI_DTB_FIT=y
+CONFIG_DMA=y
+CONFIG_XILINX_DPDMA=y
+CONFIG_PHY=y
+CONFIG_PHY_XILINX_ZYNQMP=y
+CONFIG_PINCTRL=y
+CONFIG_PINCONF=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_ZYNQMP_POWER_DOMAIN=y
+CONFIG_DM_RESET=y
+CONFIG_RESET_ZYNQMP=y
+CONFIG_VIDEO_ZYNQMP_DPSUB=y
diff --git a/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-add-kria-fit-dtb.blob-generation.patch b/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-add-kria-fit-dtb.blob-generation.patch
new file mode 100644
index 0000000000..229ed57bc0
--- /dev/null
+++ b/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-add-kria-fit-dtb.blob-generation.patch
@@ -0,0 +1,127 @@
+From 4c2fd6d17cea1a304a3bbfb6bf8bacb9276def05 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Tue, 10 May 2022 09:28:30 +0100
+Subject: [PATCH 1/1] arm64: zynqmp: add kria fit-dtb.blob generation
+
+This patch adds the support for generating a fit-dtb.blob
+for Kria K26 SOM starter kits.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ arch/arm/mach-zynqmp/mkimage_fit_atf.sh | 10 ++++
+ som.its                                 | 80 +++++++++++++++++++++++++
+ 2 files changed, 90 insertions(+)
+ create mode 100644 som.its
+
+diff --git a/arch/arm/mach-zynqmp/mkimage_fit_atf.sh b/arch/arm/mach-zynqmp/mkimage_fit_atf.sh
+index 72a8a3eb77..18ca84c35c 100755
+--- a/arch/arm/mach-zynqmp/mkimage_fit_atf.sh
++++ b/arch/arm/mach-zynqmp/mkimage_fit_atf.sh
+@@ -112,8 +112,18 @@ __TEE
+ fi
+ 
+ MULTI_DTB=`awk '/CONFIG_MULTI_DTB_FIT / { print $3 }' include/generated/autoconf.h`
++DEFAULT_DT=`awk '/CONFIG_DEFAULT_DEVICE_TREE / { print $3 }' include/generated/autoconf.h`
+ 
+ if [ 1"$MULTI_DTB" -eq 11 ]; then
++if [[ ${DEFAULT_DT} == *"zynqmp-smk-k26-revA"* ]]; then
++	# Build overlays
++	fdtoverlay -o zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA.dtb -i arch/arm/dts/zynqmp-smk-k26-revA.dtb arch/arm/dts/zynqmp-sck-kv-g-revA.dtbo
++	fdtoverlay -o zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB.dtb -i arch/arm/dts/zynqmp-smk-k26-revA.dtb arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
++	fdtoverlay -o zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA.dtb -i arch/arm/dts/zynqmp-smk-k26-revA.dtb arch/arm/dts/zynqmp-sck-kr-g-revA.dtbo
++	fdtoverlay -o zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB.dtb -i arch/arm/dts/zynqmp-smk-k26-revA.dtb arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo
++
++	tools/mkimage -E -f -q som.its -B 0x8 fit-dtb.blob
++fi
+ 	cat << __FDT_IMAGE_EOF
+ 		fdt_1 {
+ 			description = "Multi DTB fit image";
+diff --git a/som.its b/som.its
+new file mode 100644
+index 0000000000..4fd9a9e2a2
+--- /dev/null
++++ b/som.its
+@@ -0,0 +1,80 @@
++// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
++/dts-v1/;
++/ {
++	description = "SOM versions";
++	images {
++		fdt_1 {
++			description = "zynqmp-smk-k26-revA";
++			data = /incbin/("arch/arm/dts/zynqmp-smk-k26-revA.dtb");
++			type = "flat_dt";
++			arch = "arm64";
++			compression = "none";
++			hash {
++				algo = "md5";
++			};
++		};
++		fdt_2 {
++			description = "zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA";
++			data = /incbin/("zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA.dtb");
++			type = "flat_dt";
++			arch = "arm64";
++			compression = "none";
++			hash {
++				algo = "md5";
++			};
++		};
++		fdt_3 {
++			description = "zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB";
++			data = /incbin/("zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB.dtb");
++			type = "flat_dt";
++			arch = "arm64";
++			compression = "none";
++			hash {
++				algo = "md5";
++			};
++		};
++		fdt_4 {
++			description = "zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA";
++			data = /incbin/("zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA.dtb");
++			type = "flat_dt";
++			arch = "arm64";
++			compression = "none";
++			hash {
++				algo = "md5";
++			};
++		};
++		fdt_5 {
++			description = "zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB";
++			data = /incbin/("zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB.dtb");
++			type = "flat_dt";
++			arch = "arm64";
++			compression = "none";
++			hash {
++				algo = "md5";
++			};
++		};
++	};
++	configurations {
++		default = "config_1";
++		config_1 {
++			description = "zynqmp-smk-k26-revA";
++			fdt = "fdt_1";
++		};
++		config_2 {
++			description = "zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA";
++			fdt = "fdt_2";
++		};
++		config_3 {
++			description = "zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB";
++			fdt = "fdt_3";
++		};
++		config_4 {
++			description = "zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA";
++			fdt = "fdt_4";
++		};
++		config_5 {
++			description = "zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB";
++			fdt = "fdt_5";
++		};
++	};
++};
+-- 
+2.17.1
+
diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index a3a4b5e65a..d64427a52c 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -56,23 +56,39 @@ Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
 
-How to write the boot.bn to QSPI boot flash
-===========================================
+How to write the boot.bn and u-boot.itb to QSPI boot flash
+==========================================================
 
 The Kria SOMs are preconfigured to boot initially from QSPI.
 This makes these boards different from other ZynqMP boards
-in that the boot.bin needs to be flashed into the QSPI boot
-flash such that the U-Boot SPL can then load all of the
-remaining images from the SD card.
+in that the boot.bin and u-boot.itb files need to be flashed 
+into the QSPI boot flash such that U-Boot can then load all 
+of the remaining images from the SD card.
 
 In addition, the KV260 Starter Kit QSPI comes pre-flashed with
 a utility designed to make updating the QSPI flash memory
 easier.
 
-Instructions for using these utilities to update the boot.bin
+Instructions for using these utilities to update the files
 in QSPI flash can be found on the wiki link below.
 
 https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM#Boot-Firmware-Updates
 
+Additionally, it is possible to use u-boot for updating the
+QSPI with new boot.bin and u-boot.itb images with the u-boot
+commands below:
+
+Flashing u-boot.itb:
+    $ sf probe
+    $ fatload mmc 1 0x1000000 u-boot.itb
+    $ sf erase 0xf80000 (size of u-boot.itb)
+    $ sf write 0x1000000 0xf80000 (size of u-boot.itb)
+
+Flashing boot.bin:
+    $ sf probe
+    $ fatload mmc 1 0x1000000 boot.bin
+    $ sf erase 0x200000 (size of boot.bin)
+    $ sf write 0x1000000 0x200000 (size of boot.bin)
+
 It is possible to boot the Buildroot generated SD card image without
 updating the QSPI boot.bin image, so this is an optional step.
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d4a72a0d19..42b8fdaf84 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -16,6 +16,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -35,3 +36,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
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
