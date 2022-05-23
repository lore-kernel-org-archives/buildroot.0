Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27896C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 05:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F0F60BC7;
	Mon, 23 May 2022 05:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yN45c_bTv-_Y; Mon, 23 May 2022 05:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72CA660B9F;
	Mon, 23 May 2022 05:39:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 522391BF589
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 05:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D4FC41869
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 05:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKjZ3obt_JJo for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 05:39:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::623])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3D8041759
 for <buildroot@buildroot.org>; Mon, 23 May 2022 05:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2fD5yhSodbD8Do9R7zTU378KUGw+ySk68zNdUMQ9cwieGJQrwO+5B5adHeKk31BhnxMGoka6uw9E2bflb+F2A+Eq0AzyVjOetgdPFfN6rcx4MSmD1B1Cil1ELLETstUSsHCuYMRoy1TJDiY8/Vkq679Xfqx73TzQe0mQkeG9xWCslSCJwhh0dhY9evnObLaKTl+Hu0eIP4YzDTrRKxrmPesSm9e8Vd7vhVoGTwjeXkoII+22WLbaxBB2d7ly1lj7GtVfWJP+3Ti/ClAQ5m05LZbu8kYHi+7xvBG4SNhWxX2gU9pUF9aCMgWNbsel+lm+K0HTqo50MJkm9BGdCuoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIV3rEClVZPqOBlT5QufW3Luy4Q3iOH3B03KPKW2w8s=;
 b=huTgon+Ged5UQkqH7a/Imi8JL9me9fbFoM0c1AUqjDsm5NG7si/XJrZ9hPOuKDE/bwu+Kmm1/Lzb51cqQYb5v/es/TCQXH48b7FBrrdFpejXw80ADMrtL6VqOl4GvUy7xkwUiEz1V/DJ5IWT5+f78YhjhMe0pulVaiQrSvzNcjOtCijWqtcmj6Bt67AxgUffPMolvq+RvCCq6R74QmT1L9t2KnSwgS4y+BLlN37nFlouzL4uSAlPz2vfiqXpqIYc9d9Aev6VTp98JrAb8kieD2Zph2AtJq/oXkv2PSGpo4gN2jTRdZnoXy+lYW7zFNM4TXYF0+xKD8kHgnJALoYNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIV3rEClVZPqOBlT5QufW3Luy4Q3iOH3B03KPKW2w8s=;
 b=iTgD0r0Qzgl9LLb4NeXagRAW/Pow0iSsqwaZVBJUXKUeYahnqwMTgJ7L1QMLPltHxv3jRnCQUtzE3Nl8mujenf0A14hUPdLb1q3pBh+VqKIWfEkILqx3lBo4DYqWc8PL+ngyQojP8d9GiAUIF8dRLWuAmPpI5pUaKvkTtmMK/Pk=
Received: from SA9PR10CA0005.namprd10.prod.outlook.com (2603:10b6:806:a7::10)
 by DM5PR02MB2297.namprd02.prod.outlook.com (2603:10b6:3:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Mon, 23 May
 2022 05:39:26 +0000
Received: from SN1NAM02FT0013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::11) by SA9PR10CA0005.outlook.office365.com
 (2603:10b6:806:a7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Mon, 23 May 2022 05:39:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0013.mail.protection.outlook.com (10.97.4.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 05:39:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 22 May 2022 22:39:25 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 22 May 2022 22:39:25 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=44396 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nt0mq-0005RH-TL; Sun, 22 May 2022 22:39:24 -0700
To: <buildroot@buildroot.org>
Date: Sun, 22 May 2022 23:39:21 -0600
Message-ID: <20220523053921.4076488-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eb02ffe-bf71-4f99-2e97-08da3c7e98f6
X-MS-TrafficTypeDiagnostic: DM5PR02MB2297:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB2297DE58E9D8C8BD9D93E97FF0D49@DM5PR02MB2297.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVCchubG208mYK8d9rDEsUCE9j2VZe6lSiqnCWbXDcHkRHsHYfvUYV3xRltTkGWyoKQaoSDCUPt3UDQkjNRHwkPu5UYxe1ahCJFDntGeHR9FK8JQA0E8kfHvO8qcpp0lxOfMX5XqpZv50j6+hfVGcBTCuf1htrKXzG1jvA+nAzIezSl4Jaict+qb1n++3Ecginaj+b2YYL/cvlM4LZWqbQHxXaixiSr9fDbyqnqhacEHMiFWEmIA1y8wSGfsCLNywKzDDDF+6FrQO/ZTw62LAtrSKp4CJEtoNpbeunMl7HzJYDF3MAtE55BAHKPXUkyrjfgsyU3Eua3MsWOZfg0yt46mpizwUxxntQOnt6ddsG9ifw/LAO6K05QfArM9SZ2dPSX7XhVqxlqBP3Ae762IXIk28awo40/nQA4Gv9+NxKfZsrMQJPLTUixtGqH0phY+yAjWPRnm2KxxLmIsrStr0iYnkk838hYFh+ttQpAayNORSKHi6ZuJ9Uj9COoSuEdYEeYSnCOVC36mYmjOPPV6E+YMCoMK2cX1RGwsDYk0UGqFTawZ9I24KHVYXrKEOLaBdA1eIw1CRIJCRT1rATembUfOp+Ldvj7tIQbsxI//FLtyQFDlRsfilVJB3GBf0Dx0N8lTWBM6Yn7ZLVqZwNSsklqP07iKsqFpgdEmeYDW05cx/Rb/U/hoCOSQ7Tdaw6MGv5I7Ft0uyyXkbqlpZ8vgjB9T1UWsHa6Fg8oQBwybbNW40ghy9lzbnSjQi7GroakglelIR+X6f9Dx6LOGzyEAXr3ot/b78q1TTUqyKv2bawE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(6666004)(356005)(82310400005)(9786002)(2906002)(35950700001)(19627235002)(7636003)(1076003)(70586007)(70206006)(316002)(4326008)(86362001)(36756003)(8936002)(40460700003)(508600001)(8676002)(2616005)(44832011)(5660300002)(26005)(336012)(83380400001)(47076005)(6916009)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 05:39:25.5381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb02ffe-bf71-4f99-2e97-08da3c7e98f6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2297
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_xxx_defconfig: uboot
 dp pll patch
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

This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
It needs to be applied for both the kv260 and kr260 starter kits.

The Linux DP driver expects the DP to be using the following PLL config:
  - DP video PLL should use the VPLL (0x0)
  - DP audio PLL should use the RPLL (0x3)
  - DP system time clock PLL should use RPLL (0x3)

Register 0xFD1A0070 configures the DP video PLL.
Register 0xFD1A0074 configures the DP audio PLL.
Register 0xFD1A007C configures the DP system time clock PLL.

This patch was build and run tested on a zynqmp-kria-kv260 target board.

Upstream-Status: submitted (https://lore.kernel.org/all/fa7e9abc419c9d7648405d1c62367dbe701d09b8.1652709736.git.michal.simek@amd.com/)
This patch will be removed from buildroot in a future release when no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...qmp-sm-k26-revA-Fix-DP-PLL-configura.patch | 39 +++++++++++++++++++
 configs/zynqmp_kria_kv260_defconfig           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch

diff --git a/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch b/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
new file mode 100644
index 0000000000..99dc056115
--- /dev/null
+++ b/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
@@ -0,0 +1,39 @@
+From c6677ee92c05e3f0f22cc08e3b309a996292562f Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Fri, 13 May 2022 14:02:07 +0100
+Subject: [PATCH 1/1] arm64: zynqmp: zynqmp-sm-k26-revA: Fix DP PLL
+ configuration
+
+This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
+
+The Linux DP driver expects the DP to be using the following PLL config:
+  - DP video PLL should use the VPLL (0x0)
+  - DP audio PLL should use the RPLL (0x3)
+  - DP system time clock PLL should use RPLL (0x3)
+
+Register 0xFD1A0070 configures the DP video PLL.
+Register 0xFD1A0074 configures the DP audio PLL.
+Register 0xFD1A007C configures the DP system time clock PLL.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
+index ed025790bc..e5598807e8 100644
+--- a/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
++++ b/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
+@@ -74,6 +74,9 @@ static unsigned long psu_clock_init_data(void)
+ 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000A00U);
+ 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
+ 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
++	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
++	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
++	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01013803U);
+ 	psu_mask_write(0xFD1A0080, 0x00003F07U, 0x00000200U);
+ 	psu_mask_write(0xFD1A0084, 0x07003F07U, 0x07000100U);
+ 	psu_mask_write(0xFD1A00B8, 0x01003F07U, 0x01000203U);
+-- 
+2.17.1
+
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d4a72a0d19..b5c5d1bb01 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -35,3 +35,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
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
