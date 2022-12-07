Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011FCC4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 15:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7F0409FC;
	Wed,  7 Dec 2022 15:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B7F0409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQLJuGwjNvvG; Wed,  7 Dec 2022 15:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBA6418A2;
	Wed,  7 Dec 2022 15:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBA6418A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88E4E1BF40E
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79AEA418A2
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79AEA418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBTulFseOFY9 for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 15:46:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED77409FC
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ED77409FC
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 15:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEDYkwSTIpIC50NA8Iu2nUcZ4nF3GPelQAol4AjsVxO/znbJ5Qi/PMOUP/mD4zn07qUtiMoo1/3G2d9ATtAP0Ga/pWARkP/LAVMI9hKxQ/Do+/4jWhGWppeAarSNHvKNR88H3FnOXEfC/QbTEyV/XY/G25jfuFbNctOtBKAq868L0vgMrNpFJOkdCXgNSdVPBK6OGZawSQWiqCt/hOqlihQSh/GQ/AUuguafQepE0ho3fOy/ZjEY/CUZVbQQI8LF/NJIK6DrAoAFpyLe0X2J28vbyaKFIENUBJaqtwSV6HjURm0zzOgwRYLP79ABDFIOz07wQFpfIMCG7Ck5vlu2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cp5/f9YMe7AorCBjg76s5YMqTlIPTOdTxS6/eZh8BRY=;
 b=MZZj+d4M7lKsATwEdHuymLSedrWGuwwEouvXSLb2Q5/cy2KMO2k/76IalpfpIwg8un041iIgtU/xrMUllA0dezcmNyODSTFK48omVeQbsU1f3FR0Onc8QvdcAb1mOyEZysRDwwi4262Xvd0QDPp3k76Mx5vlbyzlKKpk7kUcu/4DafJp8kTe8wOmKXKVJfRYs370NOiQqo6ds5mwkg267YBXfR2yYwg5CGSZEjDZZC0IfUypWfTWpmXDebs8yMf+ADYtFhRL9uJzksTHWFffDyuL/+qA6kpJ2lqYw9qktLdLabqHOwy2qhDL5MhiU1h/tdSYMoHeoKQ2CPrKUMvNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR15CA0128.namprd15.prod.outlook.com (2603:10b6:930:68::18)
 by SJ0PR12MB5472.namprd12.prod.outlook.com (2603:10b6:a03:3bb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 15:46:44 +0000
Received: from CY4PEPF0000C977.namprd02.prod.outlook.com
 (2603:10b6:930:68:cafe::e0) by CY5PR15CA0128.outlook.office365.com
 (2603:10b6:930:68::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Wed, 7 Dec 2022 15:46:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C977.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 15:46:43 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 09:46:42 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 07:46:42 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 09:46:41 -0600
To: <buildroot@buildroot.org>
Date: Wed, 7 Dec 2022 08:46:34 -0700
Message-ID: <20221207154634.48866-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C977:EE_|SJ0PR12MB5472:EE_
X-MS-Office365-Filtering-Correlation-Id: fabc924e-7458-4e0f-0069-08dad86a3d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smSCMd9bBUls5xzGjdaR/vw1So9+EVbqcL6ZAcRIBThWAZA8nc82kFpq3WSV0Ttj/OM3nUGjTSPVMng/EU6khWmr/DE6g1eZh9Cv74Ati5Iji/WHpYdrjIIjO5T1OD7MnEhm7TLVXZ+EaIkuhKw2MpAGinPAa/8H5YR6ThvLBYLIheXfwwtquH42ljNGyV9+9jv2Ypud3IJHyZkcL06rKvrJ9Kb6islobjuguy+JUgc61vnFAqdGV3+XHzgr3M/BlmN9fj67SJwm62qTbwTh7+yb2nDxYhG4JTfENuHw0hz4O+jmJJDWldqF8met26JxajU37yF0kfSWBOw3HLG0bJbehPdpmpEIzI6IQGU3KajWBjrgHq14kJWmeDJJ725H0S25giugivFj1FDK7iY5x5Z1NeLmx8ECsGbhNKSHXB4P9UkZPfN/pDG2NRZouOmb8VcWIRCkbZm5mQX0qqvyM8EwOqkadu43Vf520SpUev7mfCTaHbKu6n54ojwi4PkJLeFES3eUB4vB8g0RAcredM2ZVT4phLDi1eTdyoN0PpJmCzrShX4B9M7EuAqmZKHKXJpOWoNWMO85R0OgKIxhub+E5cKQ2Ba3W2FwgvDb5kBZ/kACyQDloBtJmzfDr6ROf0K4yL430WG8RK2xMVvejpTUTw2XX4E/wttPxKAd8DiJNzpQTc8d/AQXafUMjCnA9F3Xv6zHaNwkGYLkK3qyQb/Y6YD7XytZ7WfUFNSwOXM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(81166007)(40480700001)(36756003)(356005)(82740400003)(86362001)(40460700003)(316002)(54906003)(6666004)(478600001)(6916009)(44832011)(2906002)(5660300002)(8936002)(4326008)(41300700001)(70586007)(70206006)(8676002)(36860700001)(2616005)(83380400001)(47076005)(426003)(82310400005)(26005)(336012)(186003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 15:46:43.2039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fabc924e-7458-4e0f-0069-08dad86a3d50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C977.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5472
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp5/f9YMe7AorCBjg76s5YMqTlIPTOdTxS6/eZh8BRY=;
 b=fZ0lgp85lxoKu1pwKUypz9/ph6v7FZIO5efKVRNcEy0WqvFU/JGFtsINDoZHRpALckwPdS5v9mpZzDGyTPGUDeXxn1UJ4bNpS3u0iHhNUG8fTLE/FDBvrOSDW7lXy2KYOsDfA8iqezl67moogRq6/qEoxY9Mi1vnciZolB31qoI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fZ0lgp85
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: use
 correct u-boot.dtb in boot.bin
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

This patch fixes a problem in the vck190 boot.bin generation as it should be
using the u-boot.dtb as the u-boot device tree and not the Linux system.dtb.
While both dtbs are basically the same, it is better not to mix this up.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/post-image.sh      | 2 +-
 board/versal/uboot.fragment     | 1 +
 configs/versal_vck190_defconfig | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 board/versal/uboot.fragment

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 890522c31d..f45f29a155 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -24,7 +24,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	  }
 	  image {
 	    id = 0x1c000000, name=apu_subsystem 
-	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/system.dtb }
+	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/u-boot.dtb }
 	    { core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
 	    { core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
 	  }
diff --git a/board/versal/uboot.fragment b/board/versal/uboot.fragment
new file mode 100644
index 0000000000..6f71907379
--- /dev/null
+++ b/board/versal/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_OF_SEPARATE=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index d87df221c6..fcda6eb431 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -25,10 +25,12 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/versal/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_VERSAL_FIRMWARE=y
 BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.2"
 BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
