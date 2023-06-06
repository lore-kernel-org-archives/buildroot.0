Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2414DC77B7A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B43881F9C;
	Tue,  6 Jun 2023 17:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B43881F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0mraG8fQY9M; Tue,  6 Jun 2023 17:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9AF581F27;
	Tue,  6 Jun 2023 17:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9AF581F27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 771751BF292
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 17:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2015260C00
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 17:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2015260C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t17qB-eEOMhP for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 17:55:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6ABB60B43
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::611])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6ABB60B43
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 17:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdjbuPKHXVvCCKUl3JVhCjUcVs1aEIsFJEstor09yiCI72XODl3FLIRlB1rMn3LGHParkaY84jIsD4JghwcyG5hotMEzTvUgu61wmZDBIMuDX9MWMdawpRjV2418k1IzClsG+xp6C7dGLkKgDkn+ft5AWJ26nlnMPcjMjlLl+GNIxsU5hxC7mPeY5gvcy/TmLNEegIz2E8VcIleo1/NUroKWOThAgLLIph4pnmp5wlkj4D3vmROwC2b1jtSeVpgYV8TPxPky+pzj3cKnZIKKBkS6/cCWdX9Wr1F7eSHLIqyef5c/F8vAAdF2tzpYaih1fPdM3qLDuaZ6j6F9gC3YLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8h3bzPQpRAkkPCvwWU/2OwP85tu9HnELEBiVvR7IHzQ=;
 b=VlnL76UlLnQY6Vedc7Np4m37j0a+7B35lGH3tpi+CUjq3F49n45+pA0NzF1TSvP/XjK1+jCEtAfIHKTaCDhYvfh/3VWx1A9U+iaNiD9muEIIoMVK12+ywC8svgAPTNI/WbrKv9qbPmtsgTDJr9DWwlfi5Wks+Z2UfArjMceisSPCYjSHZ8FMT+N7S+4bKFAvyJZoCcZahPypq66JzcnmKCt2I2VfP2D4GwstT62W+HmwCswXmDFH86uDnLHMPqKmRBp6oNv6GYmvsT7DfqLZndOr9gRpikL8C85jjeP+ATrRDQf2elhGlmr7cPCvuvDt+rNyKF/Qut+QWc2ND0iIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0244.namprd03.prod.outlook.com (2603:10b6:5:3b3::9) by
 BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 17:55:07 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:5:3b3:cafe::81) by DS7PR03CA0244.outlook.office365.com
 (2603:10b6:5:3b3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 17:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.0 via Frontend Transport; Tue, 6 Jun 2023 17:55:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 12:55:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 10:55:03 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 12:55:02 -0500
To: <buildroot@buildroot.org>
Date: Tue, 6 Jun 2023 18:54:59 +0100
Message-ID: <20230606175459.21887-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|BL1PR12MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1880c4-daf0-47cb-caf7-08db66b72933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oYMBbpwwLI2+8LXVb67/24WO5CuxbFF153+aEtu2Cxd11BmBiW12+hPQ74vsBGSmp898mWB/p0odsN+yujBQjq6TsaTbeHwwrdiwO5BBbNiJh6Eja8JF6wtxs28rjDmYRQGtOh9v4YWmUU0u1Atgm1aWEI81MiyBQFGJFCWUSLi78MMMUta2hvTMcLCRtmGs8RFGNhRQXvPkaRPv/1hPPYgvUgy+zKwIRyDD66HmtBdsPTev/F9drk6k/DEWum/qfnhmWMTvilioFCr/ESbgrezour4ufCcUzlkuWK4jBMO8F/UxdYRfArIWI33Zwd+vmXLl4k7ouvl8c4rrvzT/EHmA1bPhNlfB0dDhJIn6IBTISRIV4KzkKg4g1QbbC9vwbw4QUthf+uvOBL+Yo4gbbEo2AI+iZL3u6Bm8nxWKyMa6GYmwpHzHxdTLMsB9HMdddWUwQsXYIY75882l/tAcGeQlziXqt8V/1dEHTpeeZiX54oWqBvlDYSySq/PK+162u0U7Z9lLDRq/mQFY8XwUB/i2a2Wj4uksaNQh6OtjkAa7X26txWzaL5PxBwGP40plPI4hOVfKsW1Owdq5hjY6HdbCWOCp13YdnCIrWpTArN0WzXo3dlc15ZFir4luh0/p3k9BFJ17kWVDF/zz35SiNTwNncck7Yj1UJEefYrxw6g5rvAvp59Z4bJscNtsfADAHmo85ZnKjkpVhxirFZkiOqAVGECq/dRW+rMGASGYXIHsaT4h99jKmEaWjOGZdX9kUVJjyNNmD6b0caG84le8Xw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(1076003)(2616005)(41300700001)(426003)(6666004)(336012)(36860700001)(26005)(47076005)(83380400001)(186003)(40460700003)(40480700001)(478600001)(54906003)(81166007)(82310400005)(4326008)(356005)(82740400003)(316002)(70206006)(70586007)(8676002)(6916009)(8936002)(44832011)(86362001)(5660300002)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 17:55:05.7959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1880c4-daf0-47cb-caf7-08db66b72933
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5032
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8h3bzPQpRAkkPCvwWU/2OwP85tu9HnELEBiVvR7IHzQ=;
 b=iccfRn/IaWG1T4/DRAn1moZBo25JMAD8VbhwCNrDoeBUAY//6DZ0DfdTxD+GQL6S0dRfH4SlAXmeXPfkfCke7yg7zZ37RCtilNVIs4EbZr4RVipqdEWw/4XvIo2I/jSmHymwdOBuxmRVfr07q2RqjPqtLCojh6SbvkiCIXpeg1A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=iccfRn/I
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix shellcheck issues
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

This patch cleans up board/zynqmp shellcheck issues.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .checkpackageignore              | 3 ---
 board/zynqmp/kria/kv260/kv260.sh | 6 +++---
 board/zynqmp/post-build.sh       | 9 ++++-----
 board/zynqmp/post-image.sh       | 8 ++++----
 4 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 10e70f0787..8d41aa2d37 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -103,10 +103,7 @@ board/versal/post-build.sh Shellcheck
 board/versal/post-image.sh Shellcheck TrailingSpace
 board/zynq/post-build.sh Shellcheck
 board/zynq/post-image.sh Shellcheck
-board/zynqmp/kria/kv260/kv260.sh Shellcheck
 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
-board/zynqmp/post-build.sh Shellcheck
-board/zynqmp/post-image.sh Shellcheck
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 boot/at91bootstrap/0001-eabi-fix.patch Upstream
 boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch Upstream
diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e03d67d8b0..089c1ea58f 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -6,7 +6,7 @@
 # drivers are missing.
 # This will be removed when u-boot can build the kv260 u-boot.itb natively.
 
-UBOOT_DIR=$4
+UBOOT_DIR="$4"
 
-fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
-${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
+fdtoverlay -o "${UBOOT_DIR}"/fit-dtb.blob -i "${UBOOT_DIR}"/arch/arm/dts/zynqmp-smk-k26-revA.dtb "${UBOOT_DIR}"/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
+"${UBOOT_DIR}"/tools/mkimage -E -f "${UBOOT_DIR}"/u-boot.its -B 0x8 "${BINARIES_DIR}"/u-boot.itb
diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
index 0713bd1b05..d373ff4d4c 100755
--- a/board/zynqmp/post-build.sh
+++ b/board/zynqmp/post-build.sh
@@ -3,14 +3,13 @@
 # genimage will need to find the extlinux.conf
 # in the binaries directory
 
-BOARD_DIR="$(dirname $0)"
-CONSOLE=$2
-ROOT=$3
+CONSOLE="$2"
+ROOT="$3"
 
 mkdir -p "${BINARIES_DIR}"
-cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}"/extlinux.conf
 	label linux
 	  kernel /Image
 	  devicetree /system.dtb
-	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
+	  append console="${CONSOLE}" root=/dev/"${ROOT}" rw rootwait
 	__HEADER_EOF
diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index c5de2db820..ecf6032fce 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -6,10 +6,10 @@
 
 FIRST_DT=$(sed -nr \
                -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               ${BR2_CONFIG})
+               "${BR2_CONFIG}")
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}".dtb "${BINARIES_DIR}"/system.dtb
 
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR="$(dirname "$0")"
 
-support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
+support/scripts/genimage.sh -c "${BOARD_DIR}"/genimage.cfg
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
