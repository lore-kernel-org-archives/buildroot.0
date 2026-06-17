Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6FFCD98EE
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 222856F79C;
	Wed, 17 Jun 2026 05:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTjUVo1mBEcs; Wed, 17 Jun 2026 05:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D596F79E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781672763;
	bh=iYPRgDrj099dTPpC6lpYquK/nLFoTYAnfBliBiezjVo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LxkM69TVp6i7zLHd1D4KK2IWM89+Gt8RMoVF3u9JIDn+AogFRDAJ1wZhVyh8yM0YH
	 LfBj8EPh+RauhO2IOse1s+899+SImxdVa48p/YzMAn6MGHKQzIpRQO53NcLk6s1SXy
	 dNH6SE1y9gmPN2o/GhBZBeUIbVkTK5Do/xUABZsyaEXjauYcnUfOo5iDfCLhvK6jBq
	 JwW0ce3mrKtHoK67HkkAcUkOi+rurfh6bhGxg8501HUFKuhqz9sOxJEPo9KXEyZbQB
	 yRefxQX1rzGjH7JrgPKAkDWHxiijd0iz1Pad5J2971TNjFkxVc3C2DU5kIqItoC9uf
	 RWoL3FcbosE8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D596F79E;
	Wed, 17 Jun 2026 05:06:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 457CB33C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37F3C6F79E
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cmo1jglQEYJm for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A1206F79C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A1206F79C
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A1206F79C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPwFQNbbg3sQM/h+K5qYeZczz26jzKN3orRW9lOARWJC8I4/wQ/Ykkus9CZVx4kOYei90QsN79cPnAv+lAIGpkEuGv5qHSc0VZ9xiPpyClYzMUnOWNpM4n3D1NOFHQ2QMQJpFtnihRgin+3/9zeREtoD0dDc8aByZ3rkEvRPJ5JX1fk2ADBOQb49a6GGmLIy0jS3rN+kbsJK6ixbTMmlztclk5qLigsVB9JKzw/NNd1Yb7qHLxtCAuq6e0LJqixeIZe7LpYWJTuNPCBOyw5TimWlZD/zO1/UgBM/E5unEElZ3i2V1TQ+jwpZ3NwduysE61DvHsKsYE27G9vZG+CM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5retsjmDHEWolw2inevYFm3cpI4p+bBVKFavI05029Y=;
 b=jV7OHX3Fxm9hE/nHLIjt8VgOw3DC2gYjaku//nVfjBC3dj+cIsB6h1Ww/5D43N8VJZi/xcqECMv2bHsqje72VvRyNwnkeznsYi+9LsBPLxRKfdSNGkdIs9+pEXeYNuWyZ3bU0jTaZr8UYooGOXPM+66FkYytkWVNVyBAS+795BU9llsCCCr4SkAwDqMJNTei3DPg1HuuN7ZNG8pLcBrRvmcH1zmpyJLeFpWBY29C5yUoO2rfsWCHU3lph8lKR8qjLfFSfQJ5vgX0SFPLaf88QJHxEmCkmDfC8bJMQTz23ENmVKlyNJjBW3FjK14yUspfOrxDfSmMh97PY/0zurqOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0283.namprd03.prod.outlook.com (2603:10b6:a03:39e::18)
 by SA0PR12MB7463.namprd12.prod.outlook.com (2603:10b6:806:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:05:52 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::5b) by SJ0PR03CA0283.outlook.office365.com
 (2603:10b6:a03:39e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 05:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:05:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 00:05:42 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 00:05:41 -0500
To: <buildroot@buildroot.org>
Date: Wed, 17 Jun 2026 06:05:28 +0100
Message-ID: <20260617050535.2670810-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617050535.2670810-1-neal.frager@amd.com>
References: <20260617050535.2670810-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|SA0PR12MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: eafd0c45-a154-4b76-73bb-08decc2e1a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: 7Kxi8ZJRiZAiMzNip1QagUP7F58JKtz43UzaUSa+KrOATJv2XMmOc94gu0bpYO//A5nIq0JiJpgEWPoLPUGXdM9ZeyRlrFzvC3p1aQ1xJXSF/UOvQRNBDLl99ponMJB1GdeLkobacr/ATPhVe3FXffmh5z8ffozeEgBNS+37DawgryHXYYSfIKd0DHFZQWqXHA3ix7wpNlWB5+GSKY0bzMM14gwaxyzn1YYV/3wnrPOuSqlB35jGE2vnePPgS4TDd3HdClXY4fG7NUwLQ2+nnTyWEmT2IzxWkJE/E8mJzMuTh1OYXlVM647nxGn/DM8zsfDSuQuM0H1lxIKJ6LIcVDZB/Xk0Wqt3GWRbVK8WIzlYGvMJnagCMVjfDFgdH3NghSmvCw6SxenvrRKT9qNXXuwZ/x+v+GlYL4x/NApFX7qrb657K7IukI+87CiXkAWTiJvLmsiH6/Qq92COkYdH2GJLTtpKiUfCSr4c0VAlzS2YVj7zyhzZO386AJRpnw49p5mTV8lj8+tliHoCQ+TRwZBYcAC72GAVvJHmBBbreY2yQFIcP/G4PmpypNWYeWBE+5OhKVydgo6RN5rVamBQxvp1VIzJhVBS7huAblaMgLxnUJzxxmgJkSjszzDld9JHtp8yGfdrbuQVTJR3vXJUbqHLNBAXNa3nFEK+eBkMx0ZnBKz1otT1DhgTso45nOD1HqRgrIINqQ9OOIuVtXqxrgH/J0nh1SdcDroulxU4r2ks8Ok6Lg2/Kiz5qdBmHX1uEk1hdBnig16N2W2jheWeeMlZkJW48/xmDc8fI5THaxE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8aZ7yHQ9zMcNCARcY/iGahtiZcotS8Engzo7j70es0RYo26umLybc/zc37fsgTqNKHGR3XeKicryZ07rSsI8MYCajOaQAIvDwFz4J+NlnQYjylrXe7CvCDCr/1mv+Syb6u6ADy6s2Nj/ZKorls4oqE31K6ZewFzDThyaMIawhjtrNiDmLjmX+tzYLYatEQlsDxsbl7FJ47PaOhuBwOfVUW6e9HaXO/eV5BrsYOmEF91QkC0jh5+F0XB88ybXw1gIjMPecJE+GwOA47yhjo/6v5EgJaoWpp2/GXPbSehASysOXyawKZgVDJM4a/l+Egcky44DNzCuA3EDJq4Z1D8d9lLp2UmElxNrWY2gn13NheZtnFr9dOR0kII1NiU8+w9e0S0GFR44haER/8oy3uVMs3cMgUC/7cJK/1j7xE7uRTdNHXTMMf6SRh1wFCU9OSuf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:05:51.1880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafd0c45-a154-4b76-73bb-08decc2e1a28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7463
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5retsjmDHEWolw2inevYFm3cpI4p+bBVKFavI05029Y=;
 b=W9CrMLEn1ln2MG3WHa3QaUG+K4LyKnj5hob17wb5rgwCNh59uxYiwz2oHabx0vEddD8mtWfKiT/KgUwGrofMJ8YUGDj2ybR5fMfXWq2+hn8VrblMkVG1YBqNUVQtBfkyIVgLjELxiIa2Q+K0ZhYt7ml0ukFnLZmcK9P8AaQYe3Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=W9CrMLEn
Subject: [Buildroot] [PATCH v1 03/10] board/xilinx: add xilinx_v2026.1 hashes
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add hashes for the Xilinx vendor repo xilinx_v2026.1 release tag.

Create a new sub-dir including the version name because the legal-info hashes
change between versions for linux and the arm-trusted-firmware. This way, any
time there is a version bump, the new version hashes can be added before the
old version hashes are removed and the legal-info can always be verified.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 5 +++++
 .../patches/linux-headers/linux-headers.hash               | 1 +
 board/xilinx/xilinx_v2026.1/patches/linux/linux.hash       | 7 +++++++
 board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash | 2 ++
 board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash       | 2 ++
 5 files changed, 17 insertions(+)
 create mode 100644 board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
 create mode 100644 board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
 create mode 100644 board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash
 create mode 100644 board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash

diff --git a/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..d40bcad589
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  6047af5f352fa7aaacd988a3fe0d018627dcc200dfdf93de0c0dc8072adef828  xlnx-rebase-v2.14_2026.1.tar.gz
+
+# Locally calculated
+sha256  dbc8c4c1042f833ac961730cda41f87b6845068d9b5be2c90726504cfc82382e  docs/license.rst
diff --git a/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash b/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash b/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
new file mode 100644
index 0000000000..6bfa4d2408
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  23c9cf18f5f419dfaafe5c3d3eda4812eb71bf1f2fbf3b35470478bbaa3d96bb  xlnx_rebase_v6.18_LTS_2026.1.tar.gz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash b/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..8dde8c24ea
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0d33919008db24241580ac54c355d5c7efb18b089c2a7248704676a769790380  xlnx-rebase-v4.9.0_2026.1.tar.gz
diff --git a/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash b/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..52fcaf846f
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  bc42689fffa878f9852120b167b871d8294697441cdd9f8347506a30d4024e8c  xlnx-rebase-v2026.01_2026.1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
