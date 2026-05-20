Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9DDCD4F3C
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 12:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 937C041350;
	Wed, 20 May 2026 12:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCTfA5u0C6lv; Wed, 20 May 2026 12:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F6241372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779279702;
	bh=yVUiCiqVpd6xn5rxQ7SaPLsVP09X69gl5wEr6eXL0yU=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eCGAKA0+YFE68rNEDdBnbrHT8GvmIxBfh5cJ0WqmXivpZ+BefZXXGuCo3Z2qssBOO
	 wG2xqF5pIeF41+botebzdfFoCF62gtJZ6ykr2CiE+RnojSizlLQUYQOk+sHlz0NLq7
	 9onzhyjesc2hMKgiphOm+nLtY5eH8bdx/EN0J1fS+dXzuw+oaaRhiFuEVAPwlN2IMi
	 EYlpTBIi//QhFq915Q4MlqWWVMXI/g9WOQHegW8YmdLEF3ZgyCgVP+NCBKGG3E6bXp
	 gNdvjt3R4rolbfQbsO9u3o5qbEVgoO4Bw+9h2DVirLJ4ljTce4gsY8BYLm1bOlvkmN
	 7Vf16DTE7PiwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F6241372;
	Wed, 20 May 2026 12:21:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 210411B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1059E40899
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfKKGLwb2O7G for <buildroot@buildroot.org>;
 Wed, 20 May 2026 12:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c202::7;
 helo=gvxpr05cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEB7B40898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEB7B40898
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c202::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEB7B40898
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTLJyFW4B/Lw8wtzoXxM/32niX3tn4xxCGUtHBfo22WDw7Ro5mrhhK4zm6A6IF7e2+/keEint4fDA5OvFgr+9eWopxPQWYqfAyLUcbxePMZfxPyRiPgXgYvZU/Tvg2H71ydpmusZcm/2b233K8C17YNxcCdXfZceLxP2Svsl1Gijtzq6pJ6N3rVpy2J+7XzVsHXk06DVddrLkTHbwbyZN0Y8cc525ZADjW3s9dw+0s6YxjBk+hgY9TZGYYvGQ3qQditzTsglxjIFTWQ3IkKdHgapCrQDtW/6/sEH7ewqQ026L61ootLbL4D/T10V37wt1TZjzSIVG7RJ0++5A2iM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OktF5359m+UUMJQD64UDMIV151r4qlly3RS9zxHffZU=;
 b=WEPi8t44laGH98WWOl1FEui81dcWfD7YnCvlIpl8Zk5nGH51n12ekzlihwbdD03hkxhN8Gs5Huy77FHB3LdniWCaSt29LzZJQhjRX2f57P9gUfnFQF+8rGgVo/KNkgISv+ZGWDFPtjvqiEcN3Z+IUE3TgM2VWAbhnann4+oAD6w9CTb22y0sCD6+7dFU3Wbc5a6DM6VfJGIXKjB+3jYDsgrKzWuX/XrsAlgSrcDmlgHHiieWqXGx4s5w1xpWitbAXOokf8RsJldBFB2dpAc8VlVhVUAaEQZITF4Hpi/4ziaUpnoY6FOP6gnnv1rUZktFedoei9QuKGh1Uf05x5qKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from AS9PR06CA0742.eurprd06.prod.outlook.com (2603:10a6:20b:487::23)
 by AS2PR02MB9882.eurprd02.prod.outlook.com (2603:10a6:20b:60a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 12:21:31 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:487:cafe::21) by AS9PR06CA0742.outlook.office365.com
 (2603:10a6:20b:487::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:21:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:21:30 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 20 May
 2026 14:21:30 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 20 May 2026 14:21:30 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id 0F98A1CF3;
 Wed, 20 May 2026 14:21:30 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id F01CD305C406; Wed, 20 May 2026 14:21:29 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>, Damien Le Moal
 <dlemoal@kernel.org>, Kanak Shilledar <kanakshilledar@gmail.com>
Date: Wed, 20 May 2026 14:21:27 +0200
Message-ID: <20260520122128.1190263-1-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000092:EE_|AS2PR02MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: 794d658c-7dcc-488c-1ac2-08deb66a52c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003|13003099007|11063799006;
X-Microsoft-Antispam-Message-Info: qlT1YQ3afEe9xa7vvO0BHWCHKI3HylUIvCCTgHmAoCyHL8aDNWzRbM0gDbuqpUvjd+hROEJhdpk1xXC+f2Z2Ysi9ysudDn7A+LakoyMHSYvf6NPSIKc4hGoF5bKgBFBINXD+GLOgmYTTCddFXJqW6GK+xSKQ3tcRYvysUPq0JWUUk+FyDpnaUv3xJzBdQJYayfHlPjJ7aUvaGDFfCxdyBvFISu9OtWuY460DUwjrk6sEZTm4xOFkF2ttxZePp+PD/GP9cFwk5RI2M9Pc4kZgRMrBscdG0RRNn3AsMjCW6G28q7W+b+calUw/GyUEexelr7ml3HQxERUamZkpJn7NAimVr4PivRo1hGMBhwfhAAIcnSk9N8Q2TUQOzCxQ8/1BLwUELWD2YgsxPR1IhDi+wvOfbmQTbMj+32TGOdrKkI5q3xnKJGwF/tviwFV5PhP45kCMmbJKNSSA00dsO97+hN9DCXLsTwzbevuV/3diiOEuQBzwyUg6YDQ+o2+4Bk1qGDe9JbKVvgajRGhaC7sB4M+FLrbcMN5gLlOvExTB1hLFjAwfo+tUjUnUZ2dqWuG0kqI5sBA47eTf08RhPctnXieeVtrWo4G8zhqi39gz5dg+QmsNt9C/VGB7rbnMwYDWoD/CwYK1jmRAFW496bQlBpG7YRRwC5fbYQBNm4PIYSK3QC2GXBNS3Vj+pUTcNDaA1zezfTbMen2gibgWrSpsXjV+mksfA2IBGdv6K8ACUCo=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(13003099007)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: j8xyAvBv3g2PF+1idjY3MfTu7dqXVYuFD5UqrSA6pW0rcPFuhtz/4R6VkCWBOLOLHgOFRaMIsIZr+EXKvNOxVblqu7ntbr0fT51tsfCV81iX/R3/Ugr+SHro3Dqi3LrmAL9ewEPlMQj1Krcp7XgVaS/BgNo1JcWkXkbWp+doEWqZJgaO9WB1ssLq/2Ys5q8DHZXsFl2Ji9w9vtuh+CNnawunt5kPGKlWhrA1RfurXtQaTCxiv9eFiMDQRh+q3ugiGT4HRw7cBHNd/qQXh/XxclvgJB0Hkn2qv5wjip5xCUbFfn4GFFXAySla/xF4YXgmYYv068HqL/IWHOKOVJITRGAlikImzI5WBRoa9jcVOPIved38rM1yPZS5ZPAuADZKP6QOXvW/8BCC45V9dwrM0H1712KZhHp5niqwp/zS7fVx/X0F4Cx6RUI3/DzyB6Wh
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:21:30.4055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794d658c-7dcc-488c-1ac2-08deb66a52c3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9882
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OktF5359m+UUMJQD64UDMIV151r4qlly3RS9zxHffZU=;
 b=nYXgj28FMqHQ5E5hRHq1/8dblZswe4ekCdFhdQHw6MTPRchxTCaqYn8bd9aW5lXB12aWXQpJgsn3m+0N87IL/RQQh9Ij9gH7QUdg2syCFZI45BRCgpxYO/Scb084I7lJvyb/oU4lYJdGd+X+ENvpLw5yMCrNgMOk3TYlrBy/ZKk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=nYXgj28F
Subject: [Buildroot] [RESEND PATCH 1/1] board: licheepi_4a: Upgrade BSP
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
