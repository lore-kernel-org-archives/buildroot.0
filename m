Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC25C54FB9
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 13:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 757D1400C7;
	Thu, 16 Nov 2023 13:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 757D1400C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHbu9iKv2VbI; Thu, 16 Nov 2023 13:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A00C640A5C;
	Thu, 16 Nov 2023 13:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A00C640A5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29B251BF5A5
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 13:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2C6540A5C
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 13:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2C6540A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id neYY5bWpFekt for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 13:01:44 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::626])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19935400C7
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 13:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19935400C7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHGVMn77qpOetU+Eq5I42SjutNiBQSMUnvY7tD2AGaeOllOs+SoXZ4H8a/rs5pIoFgsUMLSf3TnbsTzwRaz00sGZ2Gt2rV74ooyrgdtNiEHGsPiw2CWononA4MLI31lCiihFi01X07WmCWRSCvqG9kXemzfPfWUJP0PGpqXdldAI+qZBX6iEfD7CQFYeriiKkzLzRdojWl2UgnJDsNx5TAHzhSAOci5F2OFLUt7dCCM9fFXc3W4PwesEHxSRafXWM6HqFSJunQEa17oOdN1Q2LNlegp5xhuDy2CSgGzynutquDVzi5sr0gx2KV5XRhzR+ThDKGgPGmzBcmYLc5YmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UykeuPCJlaB82HZJ6kVuR+hLygItQOZUyhyEbqXpO5w=;
 b=ZV02Y2r2RLOwzCNmdCrUOSV+Ix3HQF8dnxcExKAKj/R/kA0gYP3zOkZk+p/do3mmjowCGjBtqIjQCFew/X2XXPeRxYvigojxt4IaFC3tzJDoh0m92F9wu/umRGmAE1KkHdn1uyX7g/5N5GgrUuyZTyuBSo8UMgeaCPIFZfYBSzF2YM3qbsKOLzwqOTALbBP/KR/LMUaMkgLrfP4ElPFt8wqgQutFMPSh2VXy4hYE3/sa0lprae47eMd4a0NqwfoI9Tg9rsBYVwViscU0rI0SNJAhFpERKgfw8l1AAcuCM+T7pWX6ce7FcqBo/ZauIG7V8w0ti6k2ojgRDoszM4r8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0093.namprd03.prod.outlook.com (2603:10b6:a03:333::8)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 13:01:40 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::68) by SJ0PR03CA0093.outlook.office365.com
 (2603:10b6:a03:333::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 13:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.19 via Frontend Transport; Thu, 16 Nov 2023 13:01:39 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 07:01:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 05:01:35 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 16 Nov 2023 07:01:34 -0600
To: <buildroot@buildroot.org>, <ju.o@free.fr>, <martin.chabot@gmail.com>,
 <juju@cotds.org>
Date: Thu, 16 Nov 2023 13:01:31 +0000
Message-ID: <20231116130131.3660078-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: cedf9ed0-b0f0-4fe9-f826-08dbe6a42c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEJUNhkfVaoZDABAHb/JxaJGJku/wfZE/pV0Ph/ByMs6wShg2+VlpWlZpwjIRbwz9XO5iJ4eKpTieBvvkgz4o1W11HQ7OnSlQnjnKvMLOa8N6hckkQpZXT5JajcESrPQn3gQJGzxi08eyQKDVowwVaJbMw4ijJP2hkNw6YPKO6CmPXIzjYizUZgC7g3HtKUkR6Gc1Uml5N4C+7NjvQsOtOBrkkDK11eVDeKSalBqBgwQ4GUQU9Dn3vFVK6FKrzK8uSmquNDMEOhRkiTDou/eSaiEs43Xn9y9ZjsubDKTNs2wteeg+KTiQmFbQfhPGuOAgSJTz461xQJqobU7+aeATOW1svJNVb4fRxLF3sq40/xDHSGWrwgAxpIdambe/Zt1ASAwdBEop/uqaWkok0aS9foZ3s7qKPN59tcml2zCvjnLwlrw3RKF8KOpOkxveVv8+HIZfrnP1PdTvc8srh8mLuMZRn+RHysEwfGMmKRGDOW6+9Seq5/Yj3spuZLeDStbt7a3L0CeLjFtuvSa0O+NTnlH3vD8rFCU0zUBFHhjsaJnT3eRWSjTnF+VZyO26L8NidBSsZcuqrayzm7N3HPbJRzos4PyPCvToYLLqfJ7plOTrU9LOyXrVzmUhmX1puR3DTNcymtxSM+uMoLXGcQBqGBZEf27ytRpn/AYyx8Hwsb6shQsmDIZm0ehrg94pHga1hkfoABfQKJ3SiVaCNikfKrWQaAIpPAhFmbWj2iJgnU8S/7KvlS2fl+7Czal6XTB83Ylg9U/UfwORRsVCf94f6TCsnNMahItfBDpG7wPv1nJxQRwkb/eeDbazJBe4q/Pfox5NIPbL53ZNV10aW9YwrFUTVDt+/49PDMk/TMm9UEUVSBQ/JXO7PWkzB4nR3sCUeSwnu1RXlKAVWvetWa+JQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799009)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(36860700001)(356005)(81166007)(47076005)(2906002)(86362001)(5660300002)(30864003)(44832011)(426003)(83380400001)(82740400003)(336012)(1076003)(19627235002)(26005)(2616005)(966005)(8676002)(36756003)(316002)(41300700001)(4326008)(54906003)(6666004)(70206006)(70586007)(110136005)(8936002)(478600001)(36900700001)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:01:39.2254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cedf9ed0-b0f0-4fe9-f826-08dbe6a42c35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UykeuPCJlaB82HZJ6kVuR+hLygItQOZUyhyEbqXpO5w=;
 b=5fmXhGIYDX35gSZNwjwIsseZYgvEi+eGqJAuOYZN1jwLAcw4CgHkrI+XOnWs0dzbIr+g281v5kQw6Mpmder16Jq/KSlJuZZS896QXRv2RQ6EwCDAIAkX3Yg4hSJ44bp9hSbEMMxP4qicn0kTVOT2Mb8oEnkR1oLDqBwHnMtDGD8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5fmXhGIY
Subject: [Buildroot] [PATCH v1 1/1] configs/zynq_qmtech_defconfig: deprecate
 board
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a proposal to deprecate support for the zynq qmtech board.  The
zynq_qmtech_defconfig has not been maintained for 3 years, and is now using
a very out of date u-boot and Linux kernel.  Since there are 4 other zynq7000
defconfigs available in buildroot, do we still require support for this board?

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .checkpackageignore                           |   1 -
 DEVELOPERS                                    |   2 -
 ...0001-DTS-for-QMTech-Zynq-starter-kit.patch | 418 ------------------
 board/qmtech/zynq/readme.txt                  |  76 ----
 configs/zynq_qmtech_defconfig                 |  33 --
 5 files changed, 530 deletions(-)
 delete mode 100644 board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch
 delete mode 100644 board/qmtech/zynq/readme.txt
 delete mode 100644 configs/zynq_qmtech_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 0663149d01..dd3829add6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -76,7 +76,6 @@ board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
 board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
 board/qemu/x86/post-build.sh Shellcheck
 board/qemu/x86_64/post-build.sh Shellcheck
-board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch Upstream
 board/radxa/rockpi-n8/post-build.sh Shellcheck
 board/raspberrypi/post-build.sh Shellcheck
 board/raspberrypi/post-image.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..a42fb769d3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1707,14 +1707,12 @@ F:	configs/ts7680_defconfig
 F:	package/paho-mqtt-c
 
 N:	Julien Olivain <ju.o@free.fr>
-F:	board/qmtech/zynq/
 F:	board/spike/
 F:	board/technexion/imx8mmpico/
 F:	board/technexion/imx8mpico/
 F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
 F:	configs/spike_riscv64_defconfig
-F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
diff --git a/board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch b/board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch
deleted file mode 100644
index 86d8e387de..0000000000
--- a/board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch
+++ /dev/null
@@ -1,418 +0,0 @@
-From 22d955122ac0f7ac74ab74aadebf6b8edaf0bbbd Mon Sep 17 00:00:00 2001
-From: Julien Olivain <juju@cotds.org>
-Date: Sun, 15 Dec 2019 18:45:40 +0100
-Subject: [PATCH] DTS for QMTech Zynq starter kit
-
-Signed-off-by: Martin Chabot <martin.chabot@gmail.com>
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- arch/arm/boot/dts/zynq-qmtech.dts | 397 ++++++++++++++++++++++++++++++
- 1 file changed, 397 insertions(+)
- create mode 100644 arch/arm/boot/dts/zynq-qmtech.dts
-
-diff --git a/arch/arm/boot/dts/zynq-qmtech.dts b/arch/arm/boot/dts/zynq-qmtech.dts
-new file mode 100644
-index 000000000000..c6081dc0080e
---- /dev/null
-+++ b/arch/arm/boot/dts/zynq-qmtech.dts
-@@ -0,0 +1,397 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ *  Copyright (C) 2011 - 2015 Xilinx
-+ *  Copyright (C) 2012 National Instruments Corp.
-+ *  Copyright (C) 2019 Martin Chabot <martin.chabot@gmail.com>
-+ */
-+
-+/* Derived from:
-+ * https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2019.2.01/arch/arm/boot/dts/zynq-zc702.dts
-+ */
-+
-+/dts-v1/;
-+#include "zynq-7000.dtsi"
-+
-+/ {
-+	model = "QMTECH XC7Z010 Starter Kit";
-+	compatible = "xlnx,zynq-qmtech", "xlnx,zynq-zc702", "xlnx,zynq-7000";
-+
-+	aliases {
-+		ethernet0 = &gem0;
-+		i2c0 = &i2c0;
-+		serial0 = &uart1;
-+		spi0 = &qspi;
-+		mmc0 = &sdhci0;
-+	};
-+
-+	memory@0 {
-+		device_type = "memory";
-+		reg = <0x0 0x20000000>;
-+	};
-+
-+	chosen {
-+		bootargs = "";
-+		stdout-path = "serial0:115200n8";
-+	};
-+
-+	leds {
-+		compatible = "gpio-leds";
-+
-+		ds23 {
-+			label = "ds23";
-+			gpios = <&gpio0 10 0>;
-+			linux,default-trigger = "heartbeat";
-+		};
-+	};
-+
-+};
-+
-+&amba {
-+	ocm: sram@fffc0000 {
-+		compatible = "mmio-sram";
-+		reg = <0xfffc0000 0x10000>;
-+	};
-+};
-+
-+&clkc {
-+	ps-clk-frequency = <33333333>;
-+};
-+
-+&gem0 {
-+	status = "okay";
-+	phy-mode = "rgmii-id";
-+	phy-handle = <&ethernet_phy>;
-+
-+	ethernet_phy: ethernet-phy@0 {
-+		reg = <0>;
-+		device_type = "ethernet-phy";
-+	};
-+};
-+
-+&gpio0 {
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&pinctrl_gpio0_default>;
-+};
-+
-+&i2c0 {
-+	status = "disabled";
-+	clock-frequency = <400000>;
-+	pinctrl-names = "default", "gpio";
-+	pinctrl-0 = <&pinctrl_i2c0_default>;
-+	pinctrl-1 = <&pinctrl_i2c0_gpio>;
-+	scl-gpios = <&gpio0 50 0>;
-+	sda-gpios = <&gpio0 51 0>;
-+
-+	i2c-mux@74 {
-+		compatible = "nxp,pca9548";
-+		#address-cells = <1>;
-+		#size-cells = <0>;
-+		reg = <0x74>;
-+
-+		i2c@0 {
-+			#address-cells = <1>;
-+			#size-cells = <0>;
-+			reg = <0>;
-+			si570: clock-generator@5d {
-+				#clock-cells = <0>;
-+				compatible = "silabs,si570";
-+				temperature-stability = <50>;
-+				reg = <0x5d>;
-+				factory-fout = <156250000>;
-+				clock-frequency = <148500000>;
-+			};
-+		};
-+
-+		i2c@1 {
-+			#address-cells = <1>;
-+			#size-cells = <0>;
-+			reg = <1>;
-+			adv7511: hdmi-tx@39 {
-+				compatible = "adi,adv7511";
-+				reg = <0x39>;
-+				adi,input-depth = <8>;
-+				adi,input-colorspace = "yuv422";
-+				adi,input-clock = "1x";
-+				adi,input-style = <3>;
-+				adi,input-justification = "right";
-+			};
-+		};
-+
-+		i2c@2 {
-+			#address-cells = <1>;
-+			#size-cells = <0>;
-+			reg = <2>;
-+			eeprom@54 {
-+				compatible = "atmel,24c08";
-+				reg = <0x54>;
-+			};
-+		};
-+
-+		i2c@3 {
-+			#address-cells = <1>;
-+			#size-cells = <0>;
-+			reg = <3>;
-+			gpio@21 {
-+				compatible = "ti,tca6416";
-+				reg = <0x21>;
-+				gpio-controller;
-+				#gpio-cells = <2>;
-+			};
-+		};
-+
-+		i2c@4 {
-+			#address-cells = <1>;
-+			#size-cells = <0>;
-+			reg = <4>;
-+			rtc@51 {
-+				compatible = "nxp,pcf8563";
-+				reg = <0x51>;
-+			};
-+		};
-+
-+		i2c@7 {
-+			#address-cells = <1>;
-+			#size-cells = <0>;
-+			reg = <7>;
-+			hwmon@52 {
-+				compatible = "ti,ucd9248";
-+				reg = <52>;
-+			};
-+			hwmon@53 {
-+				compatible = "ti,ucd9248";
-+				reg = <53>;
-+			};
-+			hwmon@54 {
-+				compatible = "ti,ucd9248";
-+				reg = <54>;
-+			};
-+		};
-+	};
-+};
-+
-+&pinctrl0 {
-+	pinctrl_can0_default: can0-default {
-+		mux {
-+			function = "can0";
-+			groups = "can0_9_grp";
-+		};
-+
-+		conf {
-+			groups = "can0_9_grp";
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+		};
-+
-+		conf-rx {
-+			pins = "MIO46";
-+			bias-high-impedance;
-+		};
-+
-+		conf-tx {
-+			pins = "MIO47";
-+			bias-disable;
-+		};
-+	};
-+
-+	pinctrl_gem0_default: gem0-default {
-+		mux {
-+			function = "ethernet0";
-+			groups = "ethernet0_0_grp";
-+		};
-+
-+		conf {
-+			groups = "ethernet0_0_grp";
-+			slew-rate = <0>;
-+			io-standard = <4>;
-+		};
-+
-+		conf-rx {
-+			pins = "MIO22", "MIO23", "MIO24", "MIO25", "MIO26", "MIO27";
-+			bias-high-impedance;
-+			low-power-disable;
-+		};
-+
-+		conf-tx {
-+			pins = "MIO16", "MIO17", "MIO18", "MIO19", "MIO20", "MIO21";
-+			bias-disable;
-+			low-power-enable;
-+		};
-+
-+		mux-mdio {
-+			function = "mdio0";
-+			groups = "mdio0_0_grp";
-+		};
-+
-+		conf-mdio {
-+			groups = "mdio0_0_grp";
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+			bias-disable;
-+		};
-+	};
-+
-+	pinctrl_gpio0_default: gpio0-default {
-+		mux {
-+			function = "gpio0";
-+			groups = "gpio0_7_grp", "gpio0_8_grp", "gpio0_9_grp",
-+				 "gpio0_10_grp", "gpio0_11_grp", "gpio0_12_grp",
-+				 "gpio0_13_grp", "gpio0_14_grp";
-+		};
-+
-+		conf {
-+			groups = "gpio0_7_grp", "gpio0_8_grp", "gpio0_9_grp",
-+				 "gpio0_10_grp", "gpio0_11_grp", "gpio0_12_grp",
-+				 "gpio0_13_grp", "gpio0_14_grp";
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+		};
-+
-+		conf-pull-up {
-+			pins = "MIO9", "MIO10", "MIO11", "MIO12", "MIO13", "MIO14";
-+			bias-pull-up;
-+		};
-+
-+		conf-pull-none {
-+			pins = "MIO7", "MIO8";
-+			bias-disable;
-+		};
-+	};
-+
-+	pinctrl_i2c0_default: i2c0-default {
-+		mux {
-+			groups = "i2c0_10_grp";
-+			function = "i2c0";
-+		};
-+
-+		conf {
-+			groups = "i2c0_10_grp";
-+			bias-pull-up;
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+		};
-+	};
-+
-+	pinctrl_i2c0_gpio: i2c0-gpio {
-+		mux {
-+			groups = "gpio0_50_grp", "gpio0_51_grp";
-+			function = "gpio0";
-+		};
-+
-+		conf {
-+			groups = "gpio0_50_grp", "gpio0_51_grp";
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+		};
-+	};
-+
-+	pinctrl_sdhci0_default: sdhci0-default {
-+		mux {
-+			groups = "sdio0_2_grp";
-+			function = "sdio0";
-+		};
-+
-+		conf {
-+			groups = "sdio0_2_grp";
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+			bias-disable;
-+		};
-+
-+		mux-cd {
-+			groups = "gpio0_0_grp";
-+			function = "sdio0_cd";
-+		};
-+
-+		conf-cd {
-+			groups = "gpio0_0_grp";
-+			bias-high-impedance;
-+			bias-pull-up;
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+		};
-+
-+		mux-wp {
-+			groups = "gpio0_15_grp";
-+			function = "sdio0_wp";
-+		};
-+
-+		conf-wp {
-+			groups = "gpio0_15_grp";
-+			bias-high-impedance;
-+			bias-pull-up;
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+		};
-+	};
-+
-+	pinctrl_uart1_default: uart1-default {
-+		mux {
-+			groups = "uart1_10_grp";
-+			function = "uart1";
-+		};
-+
-+		conf {
-+			groups = "uart1_10_grp";
-+			slew-rate = <0>;
-+			io-standard = <1>;
-+		};
-+
-+		conf-rx {
-+			pins = "MIO25";
-+			bias-high-impedance;
-+		};
-+
-+		conf-tx {
-+			pins = "MIO24";
-+			bias-disable;
-+		};
-+	};
-+};
-+
-+&qspi {
-+	u-boot,dm-pre-reloc;
-+	status = "disabled";
-+	is-dual = <0>;
-+	num-cs = <1>;
-+	flash@0 {
-+		compatible = "n25q128a11";
-+		reg = <0x0>;
-+		spi-tx-bus-width = <1>;
-+		spi-rx-bus-width = <4>;
-+		spi-max-frequency = <50000000>;
-+		#address-cells = <1>;
-+		#size-cells = <1>;
-+		partition@qspi-fsbl-uboot {
-+			label = "qspi-fsbl-uboot";
-+			reg = <0x0 0x100000>;
-+		};
-+		partition@qspi-linux {
-+			label = "qspi-linux";
-+			reg = <0x100000 0x500000>;
-+		};
-+		partition@qspi-device-tree {
-+			label = "qspi-device-tree";
-+			reg = <0x600000 0x20000>;
-+		};
-+		partition@qspi-rootfs {
-+			label = "qspi-rootfs";
-+			reg = <0x620000 0x5E0000>;
-+		};
-+		partition@qspi-bitstream {
-+			label = "qspi-bitstream";
-+			reg = <0xC00000 0x400000>;
-+		};
-+	};
-+};
-+
-+&sdhci0 {
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+};
-+
-+&uart1 {
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&pinctrl_uart1_default>;
-+};
--- 
-2.23.0
-
diff --git a/board/qmtech/zynq/readme.txt b/board/qmtech/zynq/readme.txt
deleted file mode 100644
index 5fb95bb90b..0000000000
--- a/board/qmtech/zynq/readme.txt
+++ /dev/null
@@ -1,76 +0,0 @@
-*******************************
-QMTECH Zynq XC7Z010 Starter Kit
-*******************************
-
-This file documents the Buildroot support for the QMTECH [1] Zynq
-XC7Z010 Starter Kit [2]. It is a low cost (~55$) Zynq based
-development board. The board user manual is available at
-[3]. Additional files are available on Github [4].
-
-
-Build
-=====
-
-First, configure Buildroot for the QMTECH Zynq board:
-
-  make zynq_qmtech_defconfig
-
-Build all components:
-
-  make
-
-You will find in output/images/ the following files:
-  - boot.bin
-  - boot.vfat
-  - devicetree.dtb
-  - rootfs.cpio
-  - rootfs.cpio.gz
-  - rootfs.cpio.uboot
-  - rootfs.tar
-  - sdcard.img
-  - u-boot.bin
-  - u-boot.img
-  - uImage
-  - zynq-qmtech.dtb
-
-
-Create a bootable micro SD card
-===============================
-
-To determine the device associated to the micro SD card have a look in
-the /proc/partitions file:
-
-  cat /proc/partitions
-
-Buildroot prepares a bootable "sdcard.img" image in the output/images/
-directory, ready to be dumped on a micro SD card. Launch the following
-command as root:
-
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-
-*** WARNING! This will destroy all the card content. Use with care! ***
-
-
-Boot the QMTECH Zynq board
-==========================
-
-To boot your newly created system:
-- put a mini USB cable into the J4 Debug USB Port and connect using a
-  terminal emulator at 115200 bps, 8n1,
-- put the prepared micro SD card in the J2 micro SD card slot,
-- plug the 5V power supply on the JP4 barrel jack.
-
-Enjoy!
-
-
-[1]. QMTECH:
-     http://www.chinaqmtech.com/
-
-[2]. QMTECH Zynq XC7Z010 Starter Kit Product Page:
-     http://www.chinaqmtech.com/xilinx_zynq_soc
-
-[3]. QMTECH Zynq XC7Z010 Starter Kit Hardware User Manual:
-     http://www.chinaqmtech.com/filedownload/32552
-
-[4]. QMTECH Github:
-     https://github.com/ChinaQMTECH/ZYNQ_STARTER_KIT
diff --git a/configs/zynq_qmtech_defconfig b/configs/zynq_qmtech_defconfig
deleted file mode 100644
index f536b80f57..0000000000
--- a/configs/zynq_qmtech_defconfig
+++ /dev/null
@@ -1,33 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2019.2.01)/linux-xilinx-v2019.2.01.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-qmtech"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,u-boot-xlnx,xilinx-v2019.2.qmtech.1)/uboot-xilinx-v2019.2.qmtech.1.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_qmtech"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
