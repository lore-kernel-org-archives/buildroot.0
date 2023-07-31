Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6570CC001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 15:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E245341759;
	Mon, 31 Jul 2023 15:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E245341759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vE8N-1uoZr0S; Mon, 31 Jul 2023 15:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69FBD41747;
	Mon, 31 Jul 2023 15:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69FBD41747
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4520B1BF3BA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 15:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A04160B9F
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 15:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A04160B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKpOeo1YyZld for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 15:47:49 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A540060ABF
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 15:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A540060ABF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcitSFycnk/qiD0+3hzJd7itRRCUReojLevLWKw6+AX5NaWYd1va6YyX153TxlezcSmP9zjQKDa5qNt+7l+uf6GlnUVx/leLFuOnbXI2HPoh/+BtkTqW0Zwc0yyg4gFl7GjYtq902VpUif5caZbdEGrNve3ftPjVMcpImpK72IvpF1BdWP5694N3tjKCvdiJNv9ZWDa3fiG3TLdxirIOZYm9K0EnZvpULEkwOOZwLtxKVojpHikSBdyvWNq4qUShDb4RVh+UVg/ddtXrOxAE/dey0FMor1gPUOsAwkn+sXKamDuY02TZwcUFBk8pAIwVNoJ00k/43fw/DVmdm3MGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6AzDa0MZYpIUVIfNO0qafYxWJu9ZiIzYeYA8PJWf3Q=;
 b=Wykxs1ji5egCyLTHIjUNVXKVltmOp1EX+0Dzw9BxsQ+Wo+s6hV3QcuTDE4xmDLm9z8GAvKJLYA7sXrNyQCaYiTQt6JsWQ9aXwYIs+gsi/15Q/kivI4t9Izk9GD6pm9o29VFZHyKgSAr7nX/xO5ogDqJg8ksqMZs3LxBiIR2pePiPVFoioVcjhnLdJH19qgtf3RVmkK9TQVoxvVwkngBUMaySgFaM4qv2aVQOtwHll8V2xh32OHwsJz+lYMiZkP4TKkqszQOePgU5bqMwnrKQJuieny6swES+HWn1aRewJYS5wtanAjVVbjav4A2e+catNmHVkmKseaXvDFoNhckWvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR07CA0043.namprd07.prod.outlook.com (2603:10b6:5:74::20) by
 DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.43; Mon, 31 Jul 2023 15:47:45 +0000
Received: from DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::7e) by DM6PR07CA0043.outlook.office365.com
 (2603:10b6:5:74::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Mon, 31 Jul 2023 15:47:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT083.mail.protection.outlook.com (10.13.173.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.42 via Frontend Transport; Mon, 31 Jul 2023 15:47:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 10:47:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 08:47:43 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 31 Jul 2023 10:47:42 -0500
To: <buildroot@buildroot.org>
Date: Mon, 31 Jul 2023 16:47:38 +0100
Message-ID: <20230731154739.1371164-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT083:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6f58ef-fb13-44ce-8935-08db91dd7b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzd0U9FfR3tlFpLRMm4lFau1ul1UkPj+RNM1TlolzgeUJVeeZyiuaA31gL0e74ygDLLBauZ3qrPs7yqI45xyy33M+sCd51MTnMiJAVSJvlm/D5pIUlajlea6VFqWwkVIUbPbBxwzVabz0Z3KqPHKnWYMByoBdWopxZDNU9ZMU1rFfrY7l1oDlfbUXEXtz2CNyvI4F0L7ir67K/QPEnqJ1sT/aDgP/3vHsqYGyCwrjslaaqrfetS1lnFz7ujuj5yDotRbYo4jdHAite67MiQlmWY45fK8jWcMcT1DmKakwsTzOmm93PVfzskZzHpgkZGLDp0PKQxnzrgMzc3pxRRjsZrzLv8jdsgiGgWLrsJ1B4NVLQY76YIv0gkD9CVqke3gLpdJnI0jJW2bsaiHyUszQizp55xObFUUaCh1sF2Akpd3bWuAqJ2N5T+2aLzVHL1n8s/Q9Am2DD7a1oYtW0WwdLN3p1dmMMSktbD2Gss7/1LLk0/f11+2jUhhDd7r9RUDOQrMST0pn6owE7z1VANleWGR7zc6cv/FLXQq6XQ5WsIDQsNniIQLvDixOOaiPDveFmYmMekiN05k/A9p2/oaEgHuyC6rU2h5UUdSu4IKrrY/q7wDNEQPeH4oaU5S7/ulvoXctnvAN4OxuQS+kepRbMYWw7+DV1CMAI/4fC6MBAwiUUMSyf6aCMcbOt3h1gwWZdocOwZS/aaEUBtDv4nufF+HpOF+igBucQz9OMg3O5+aJ/VE/yQn7znfy6g+JYi/aOGVJliO4V6vqEfYsiDTzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(86362001)(8676002)(8936002)(316002)(4326008)(5660300002)(6916009)(54906003)(356005)(41300700001)(81166007)(70206006)(70586007)(82740400003)(478600001)(2906002)(6666004)(36756003)(47076005)(36860700001)(44832011)(966005)(26005)(1076003)(83380400001)(426003)(186003)(336012)(40460700003)(40480700001)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:47:44.1281 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6f58ef-fb13-44ce-8935-08db91dd7b18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6AzDa0MZYpIUVIfNO0qafYxWJu9ZiIzYeYA8PJWf3Q=;
 b=Qwn4O0lBIEip3xDGMeJQxCcxsNY8FmpQJRPGoQy50v9gBhITMotESL6Xzwe7sqrPh2zyP50EgPw+bAixjQzoO4XMgRi08DqPfCBZnyvSgyj0zoJm76R/BlqIV1m5BIdrZXgKgERlm/XUjRiqrj3K6Ozc5BKUrVR1F63yoF2GF8I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Qwn4O0lB
Subject: [Buildroot] [PATCH v2 1/2] board/zynqmp: fix atf build failure
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

Binutils 2.39 now warns when a segment has RXW permissions:
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107

This causes the following build error:
aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
permissions.

This patch applies the upstream boot/arm-trusted-firmware/v2.6 patch already
included with buildroot to solve the problem.

Fixes: https://developer.trustedfirmware.org/T996
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  -switch to upstream version of patch already included with buildroot
  -fix commit message accordingly
---
 .../0001-feat-build-add-support-for-new-binutils-versions.patch | 1 +
 configs/zynqmp_kria_kv260_defconfig                             | 2 +-
 configs/zynqmp_zcu102_defconfig                                 | 1 +
 configs/zynqmp_zcu106_defconfig                                 | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)
 create mode 120000 board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch

diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 120000
index 0000000000..695cc80b94
--- /dev/null
+++ b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1 @@
+../../../../boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
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
