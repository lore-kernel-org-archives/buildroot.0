Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4FECD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 15:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D42C88434C;
	Fri,  8 May 2026 15:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmU6shD4HjXN; Fri,  8 May 2026 15:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5C3C84407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778255326;
	bh=yVUiCiqVpd6xn5rxQ7SaPLsVP09X69gl5wEr6eXL0yU=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UZ09h/lpH+UXdA6r5Otxa0wU838J/r38Qfli8cyt1R6Fas4hd4c+9x61nUY4dsxnl
	 lvlSAKp6YHgyVa3503HzAgTL0MHiOWUkn7tCf0xL6pLCdkMX0JpCfJ9UrHOujw/jiA
	 j3tzUl5Go/NVhyYzXFME4wHLLCyp0BkeCFnKRlbDhVeFfkfcexsV3oPsrWFKOMIegn
	 Xspi8iYM5ZMOn45+yFWWE9w8O1CYT0UKwHnIAgFQGj2fSkhi+l2h0wTSi/T3YrfXkG
	 mg8MgX7OAf4CIgBsKGeYXsCM4BI2twevrhuwon28FdgRdv3ogyRKAS+SkhsAuWYHt+
	 Wf72mbchX4B5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C3C84407;
	Fri,  8 May 2026 15:48:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84829358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 15:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6244084407
 for <buildroot@buildroot.org>; Fri,  8 May 2026 15:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWQbMGKL2-lY for <buildroot@buildroot.org>;
 Fri,  8 May 2026 15:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20f::7;
 helo=osppr02cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BFB28434C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BFB28434C
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20f::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BFB28434C
 for <buildroot@buildroot.org>; Fri,  8 May 2026 15:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhUBkKUHxEj7OaOj0AUcZcv1wZsI3w+v+URvGfziL0/giDGxHsNRu4vClcqNYc2D8/N/ly7uvjWFeJtq6fAh8Q1I4C9grVDx+LILFO4QRPa0GyP39Isezk4J0GnSKGmJI48TCknHEQNsLVyu80RwfxLSOjUYnuCUKZ/LZuBGNqDVZDZHxS75X6z/intUi9GlRrLVVbm8/wavtVQXgohuLUb/QUXjBQkNLvW4Rij4hDtGYnpexn1O2Eo+i3VfrvPB7uUVuZv6nTCDoFhRec1zEBAlBueLK8sZZaUNIAfi7mgBECL2ufxtDdcV+mxmFwlsEKiMMC4HH+4Mu69bG3IGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OktF5359m+UUMJQD64UDMIV151r4qlly3RS9zxHffZU=;
 b=WHYLv2lBhFMcrUC3xhH+4uPytaTGgTfjvmoC4zXwfZBD0HckdC074g6jyt36WmMQ7mS4JG+6CMRCvmFb/ZajeCuSdXNc+m/63csHpTeNwTHnQ23IaOzyoSOmG4ttfeQWQx9KzPHa+pmpV5UDYg1IiuSWw8sOQ0N7r930xqsI2BmzlYlYzsQsMJQOK8aNtmgbvHp/M+TheT8uq7aLNh2RWPZkOHUJl2xdfW+mWYhlEss79LkgKILQ7u1VQvo6LDbU8jSYQy2SOjuKZYK6EfUVW5Eq/ZdCQegfqjwUEiIlgzd3wmEk7t7eJVnzBlowKS46S6F/yKO0QV5hRVh/9LTZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from DUZPR01CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::27) by DU0PR02MB8805.eurprd02.prod.outlook.com
 (2603:10a6:10:412::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:48:36 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::f5) by DUZPR01CA0092.outlook.office365.com
 (2603:10a6:10:4bb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:48:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:48:36 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 8 May
 2026 17:48:35 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 8 May
 2026 17:48:35 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 8 May 2026 17:48:35 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id AE59D18B2;
 Fri,  8 May 2026 17:48:35 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 9BEA53062FC3; Fri,  8 May 2026 17:48:35 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>, Damien Le Moal
 <dlemoal@kernel.org>, Kanak Shilledar <kanakshilledar@gmail.com>
Date: Fri, 8 May 2026 17:48:11 +0200
Message-ID: <20260508154811.3559477-2-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|DU0PR02MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e5f5a2-39f0-4d2f-4903-08dead19442f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: dsVcm+gIDbl4LScl8s8tOMBupLzoxuCEPF5Igu8/QCdqYbGcjCu7QawYAamXc9nXXWWpcww7ADJIzePzEWWZQM8zKBSW1/VRamwjwJUpiLRbmGgv/KrWzCYmZuzgPCF2JQYqXgrijXKrWDN0gQTZHAj9sXEvKn3C2ADJx0iIjES4wYMlgB7v3yMXB/RWjmOfOPytnQyqnNb6uYWRtAbHXKawp68DdSBP8Viq7yIgPSAhnrtxvZTTtAIm3jQ7TIb5iUz4RM3+5Bhl/6QiosJbQA0bzzX2FWdMzml6yEUF+S63EdoTEcCcaXTcZKeElbf+NxlQaLs4eN+zpeRKOpiey8quQ1RCfqKr3viQZ1yrIXSLGOi1Bes3wtj0N/ktqoJo0L1ED2k4hxPRH4ipOFvvBzRA3Ce1DYdZBL5/h+0zxEl7CHPhLIWC/wJNUTOKtZrt0J6L4iwkZRcwFTcjnTMxoM3B24o4pKHJXOaUn82beUqmOOYxkaKMDgg/Wb6rq21OuXzyXhg0bpA75yDEVx7tMBdURATSX2iK1WF280+e14z4IShFZMfT7SWnt/toE727WFLSBY7XoenKsXQcNXRebMyhKmRuYUIywoWryjIWg4/ofuWuWejNVSXVfVBArimJTTSkBHT4VmpulJcoqPGeYQkWUYVuknMBCiO42UmtgpdqfZnBPTFwUU5U4KWYl3ry7shnRGyggn2py9hUQlk5lcNCs+kklbPo+NcKG8kUTho=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(13003099007)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LkSkMVde8X/VovbGhi8oXY3xURhpb+rQC8AfkFVXGouzT0yMOl65PIUs1DJmM/5X/LVf9tf2ufReaswPec69X6UW4u21srNwKc/Ndx+KHd+mkyj7PztSQHxcfx+ZRT08bdqa4PeQ3o2DCbuSW6Yp2pJZqB8ysIvVuo2PoABL2Tk5Cwl1CnVKio2DjKTlnhsdFq7g+Z5rCYkyZ8rEuqBBPuiYh5Uijra6iX1QMPMF1bVTthk4X/bbZmbGaH53nxbRRsW1YJd7yVpi+lrjE2p9FqFrmcT0UwPrk/pt0X6B+H8K/WnDsxxXPPL/WUZQ6vPFLmwSpHlnjkv3zrRH3zCJixSJ/06miDu8SuLzrqa7/DQIxq9Xs2uzENnVQXcGncCG83Q+xgs4m+MhTtGlWbbTKZFq5wixjGrMNz5p+ZJxS8U1V0meEhD/B4FcOhTDmu6X
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:48:36.2441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e5f5a2-39f0-4d2f-4903-08dead19442f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8805
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OktF5359m+UUMJQD64UDMIV151r4qlly3RS9zxHffZU=;
 b=PT4T7P5ufgPpDrICsO1aRlK+tw+UelBshKKDABpkSoNg3F+NmGqJ5W7xMQFVmKolmqtRF6xR+6eC0ja/yBYKC2dFXlvvT6akYCV1RY65Nr2Yx3SJcjbhi2DO+goiunD/rVu/b6a2mbc9w5SrEtP/nOBkroEjNURMkn2Vjfjniqs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=PT4T7P5u
Subject: [Buildroot] [PATCH 1/1] board: licheepi_4a: Upgrade BSP
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated the BSP for Sipeed LicheePi 4A.
* Updated Linux Kernel to use latest release
* Updated the opensbi to v1.6
* Updated uboot to latest from the vendor
* Removed Architecture Vector support from board's defconfig as it gave
  a kernel panic.

```
[    1.677829] Run /sbin/init as init process
[    1.689056] init[1]: unhandled signal 4 code 0x1 at 0x0000003fa8231b80 in ld-linux-riscv64-lp64d.so.1[11b80,3fa8220000+21000]
[    1.700491] CPU: 2 UID: 0 PID: 1 Comm: init Not tainted 7.0.4 #1 PREEMPTLAZY
[    1.707697] Hardware name: Sipeed Lichee Pi 4A (DT)
[    1.712626] epc : 0000003fa8231b80 ra : 0000003fa8231392 sp : 0000003fc1ad08f0
[    1.719893]  gp : 0000000000000000 tp : 0000000000000000 t0 : 0000000000000000
[    1.727158]  t1 : 0000000000000000 t2 : 0000000000000000 s0 : 0000003fc1ad09d0
[    1.734420]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 000000006fffffff
[    1.741685]  a2 : 0000000000000006 a3 : 0000000000000001 a4 : ffffffffffffffff
[    1.748949]  a5 : 0000000000000000 a6 : 0000003fa8242ec8 a7 : 000000006ffffdff
[    1.756208]  s2 : 0000000000000000 s3 : 0000003fa8220000 s4 : 0000000000000000
[    1.763474]  s5 : 0000003fa8220000 s6 : 0000003fa8243c40 s7 : 0000000000000000
[    1.770734]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
[    1.777993]  s11: 0000000000000000 t3 : 000000000000000a t4 : 0000000000000035
[    1.785252]  t5 : 000000000000000b t6 : 0000000000000000 ssp : 0000000000000000
[    1.792608] status: 0000000200004020 badaddr: 00000000cd817057 cause: 0000000000000002
[    1.800618] Code: 0206 9381 bf31 06a1 0513 1f85 e8e3 fab6 3a83 008b (7057) cd81
[    1.808151] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
```

Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
---
 .../licheepi_4a/patches/opensbi/opensbi.hash       |  2 +-
 board/sipeed/licheepi_4a/patches/uboot/uboot.hash  |  2 +-
 configs/sipeed_licheepi_4a_defconfig               | 14 ++++++--------
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash b/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
index 5ced5c95cc..a08d207608 100644
--- a/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
+++ b/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2510c0e867b4f8c28579def9a21e97fa2e8de95b8c7d66bb8b6642202bcee3b4  opensbi-61d7484c752a5e4c464d5dc18e21d9ac67fbbefa-git4.tar.gz
+sha256  514f652aafdc8f45864922fa28d54a1fe493d8997707f0ec3546f8e2bdc32628  opensbi-1b8e883a7368676c2bafd6236dfd2dd5edabe067-git4.tar.gz
diff --git a/board/sipeed/licheepi_4a/patches/uboot/uboot.hash b/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
index b63a8d79d4..7dc3fac84c 100644
--- a/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
+++ b/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6158b9c6faee41a1e790ad4ba2e1b3e18a122ecdb5749fa77c7495a2d1c56262  uboot-b5ee6e549a7b5ff382a14021a5d6a3c94017bddd-git4.tar.gz
+sha256  198b6181303f9973e4c585ee5ab2440d412dd97ef5d42194943aa5fed172b500  uboot-a13e24ed9ed773d4a07f079576a2fd654af6bfbb-git4.tar.gz
diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
index c7867ed05d..e936a1258b 100644
--- a/configs/sipeed_licheepi_4a_defconfig
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -1,7 +1,7 @@
 BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
-BR2_RISCV_ISA_RVV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_BINUTILS_VERSION_2_46_X=y
+BR2_GCC_VERSION_15_X=y
 BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
@@ -10,8 +10,6 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sipeed/licheepi_4a/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="thead/th1520-lichee-pi-4a"
@@ -28,14 +26,14 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_GIT=y
-BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/thead-opensbi.git"
-BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="61d7484c752a5e4c464d5dc18e21d9ac67fbbefa"
+BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/opensbi.git"
+BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="1b8e883a7368676c2bafd6236dfd2dd5edabe067"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="light_lpi4a"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/revyos/thead-u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b5ee6e549a7b5ff382a14021a5d6a3c94017bddd"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/revyos/th1520-vendor-uboot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a13e24ed9ed773d4a07f079576a2fd654af6bfbb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
