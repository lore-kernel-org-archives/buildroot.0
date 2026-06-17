Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D05CD98E1
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8573E6F79F;
	Wed, 17 Jun 2026 05:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kP887IY_k1Ui; Wed, 17 Jun 2026 05:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E3E46F7A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781672768;
	bh=vn/1ORWVsM2t+Msvv2Q8mVmVR3+2DAo2UofTYWLC37s=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=s5sDaqJBglj09LBMtBNrHeh+cLNCR84J/YGvNRDKQcp4G87ughR6fGhUxRoUR0RWk
	 iKLpJWOF2d/3heWB55O/z6KTFX0EEHadVoHEdwuYzRwNNVsU48Dgxrul6LEqVzpMq/
	 s5Dmlzj9Ed++3lfscZgLKAEc0M0FmiSZwNMAfuDpDsbMD7J68yEL2e6TGtOtl3dhiv
	 9bL525CxSpsUszs205IIlyZ2wuWEPzaS5EtnOcs0sd+TildeEN9vi2ywGXtoYcCz+X
	 LfqLWu2qBbTpik0jPVu+Zqjx+ZefobO+ZvvAmOPLcihbc/zl83LSE78ZoAthoTdgdq
	 eLmay6Hj1mzxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E3E46F7A1;
	Wed, 17 Jun 2026 05:06:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A17F347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 721124ECC0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44XdzvqlQnep for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB72D4ECBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB72D4ECBE
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB72D4ECBE
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIGD53Q3UX500Crvx4lZ3LngsH244VuKlX+0GlA8a0LNqfVgTKhQ6KrNKwfl/DM9OlPTw2hp9NQ1ItTwNWFU5/hOP5GupPDT37ZJJFDe1La/Gsbm9rKD37TEPYLEntrtnNMMmPqpyInjpc0aegiBMRi5UThjoT8zdEevpE+j0EVYVLcGoaK+I8ylzaA51CU0oIKCcZ4RWBssUATJfv/1ueDbsfoApLGQmB9oTKDFHCA8PN0pWyEC+1HmCiSywaL/QSjkuDadH3pwnUIq5DC+IMe7R4CIAHafPLrD1SicTpvK6RyxNa8qPDL18P0xwgaZuXHapZ68GypBsY+C9V+bjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CTxFcCk6hR4juvr+MFXuf3bdEGYsMidAs+9VFWlFmg=;
 b=d8V2Rfztt6h1kmFCAIGzPmbdkRB6n3Fah8RByIGSDmSpRhbydHTmu3l+DcCpVU73p2YTraQqFYv7Fi6fvl28cUqzMCenTy/Ujki3vc4ZFGzoh3etv0nvQA0o4YwGZkiVu9QNIstHATwj/Lnxg1nsH9Yegb7HBWCDNtX8WjRsBnikwqzO3miPHIZpjYEufU5pyjN0AoZzsVRW6ouSQNDop+H7F0rjMNMf9cSYi5ZcqErvNdNK19Jed7X0FC5OIaUJusi3gPXi9FGY0AWKl+RXjJ5Rl0knHNkE3ydx+Guf+PQ2ILRkCotj6HCK5v6ltmhKzNcwhZgEczJ/IRTI44Bp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0271.namprd03.prod.outlook.com (2603:10b6:a03:39e::6)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 05:06:00 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::2d) by SJ0PR03CA0271.outlook.office365.com
 (2603:10b6:a03:39e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:05:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 00:05:54 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 00:05:53 -0500
To: <buildroot@buildroot.org>
Date: Wed, 17 Jun 2026 06:05:33 +0100
Message-ID: <20260617050535.2670810-8-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617050535.2670810-1-neal.frager@amd.com>
References: <20260617050535.2670810-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c57fcd-c155-4426-eb8f-08decc2e1f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|22082099003|18002099003|11063799006|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info: phc3jIaQbUydyzcdLet2tlhx9zHbQCHy5h+Z5qWx8+jshJ5cNdNVC1cqJWTJkFy6rgidrg8yli7JXnc04YrUluYy7RDrRgl59XGLBiSYwN1/LTaZpI7/Ki14u8rSjsldGOJP0YhzJYt6tr0r0csK0ImrW/JC+QYqUQeDxvSxO4KgF8DZiEycx3pynjYkNfHb8Mdxevvhy4jUQm8JVSuDuua/8fs5U+0G9RijBccdMbFFze7vE2/F75sjwr7Us0CmvJssblontBOwHwMPGCE5aRTGSZMbcHyXpUpT5ecEhcPhAEwXbzQPHEhEWGZpOsCOWpFihSRHkp3DLmD5RPGjKxf34g82bzpKbzj1HkBSSkTJL98vgoNqJAYTZBoijsfSMxQLFZPuVL3YGfSOpsG69etXU+aepSYoERkupMYAXhVfjczomAglI+DNSpESQK+evHXMqhY7B0ym5YI+bDYKY2ajMFGl+De9ENhCU9ZFoUYYUGh3Yhebvr8qIgqE/CFnqHFsC8XFwUjHhr1zUonaPscN9ozDrXyEugcqpvSsZ+MwQ3GGvhTpLTlSiYy2ijgMkDq1u5nS++zx7UILWO/qONy7bCMLiquClpKQ00U51tDBHThDPadYbqcSU6JyHSazimXBuR48lrjAIqNsqtc6mfT3nMvQIr6or/rzeK7ls8g39TLf/LV3BiSL5WOq2AwdIKbf67Xr7cRLv7PLrktrkAVFRt+BsyL4iWOySWd3BJznRt7V8fpoYTLJpBzl0AcLsSOpZ8WXbRY8R3illQnehGpXGnSOU8NREmsBMPYrMec=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LBLF7ymVA8IjsgX81uSwjFmpKhIekMpVE/7RtOnUYcZDEgL65cVjcz+Bh0haKc4Rn2xeZGQKj58ssrN26mmfwoJQnsxnnrZ2cVCNieKFvZCcG3JsCmEGgpoCwokO1tOIuIbajtbiGOtKOZklY6l57Gaed62QpwcplHt5x63lOS4J2xFxkD3sD149Y1YiaHyECztY+zI2JxrrjmkeFHjjw5XlJ2lgXVJcaC8dx89zAo6I+Uf3VfIA/r/dbwGPbWt7yo6G1WAI0DRgQThjNCf5IHRYhKzamCtoTY6mSpkDviP98uEUk8RkE7S/ghXohVJaD/2aST4QIViCBIZiuKMbyjWlWeeESj05Rd10jeF59xyeFKEWRtpS96gsJcZD5w0ovkcRAHVcJV/JCsoPP+7TTru9GRu13gQ8sNdKatu9vxmZCZ/Hv9uKQhQvZTejOncz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:05:59.8417 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c57fcd-c155-4426-eb8f-08decc2e1f51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CTxFcCk6hR4juvr+MFXuf3bdEGYsMidAs+9VFWlFmg=;
 b=T5qsrmDZrd1JwmNFJ+EtZBK/MVt5yfsQg85FQQanZ69ZRfd1Vh8jNJQIDo9OFfUFOdMTpGoc5SbD/wOyZUKc6vmqe8q5Ywbg5j2VPX60d8CqTbcfm/w7Kev5WyzjQf4XnU6Opjsu9qeK4B7l7twOFhcTQ3r9HiWC+qkXSa5tgys=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=T5qsrmDZ
Subject: [Buildroot] [PATCH v1 08/10] board/xilinx: remove hashes for
 xilinx_v2025.2
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

Now that all Xilinx boards have been bumped to xilinx_v2026.1,
the xilinx_v2025.2 hashes can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 5 -----
 board/xilinx/patches/linux-headers/linux-headers.hash      | 1 -
 board/xilinx/patches/linux/linux.hash                      | 7 -------
 board/xilinx/patches/optee-os/optee-os.hash                | 2 --
 board/xilinx/patches/uboot/uboot.hash                      | 2 --
 5 files changed, 17 deletions(-)
 delete mode 100644 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 delete mode 120000 board/xilinx/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/xilinx/patches/linux/linux.hash
 delete mode 100644 board/xilinx/patches/optee-os/optee-os.hash
 delete mode 100644 board/xilinx/patches/uboot/uboot.hash

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 88e212d76d..0000000000
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  ea59fbfb702857a24f96ee8e9cf04f997942db1de98f8406b7daf9dcc8f4e9ea  xlnx_rebase_v2.12_2025.2.tar.gz
-
-# Locally calculated
-sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst
diff --git a/board/xilinx/patches/linux-headers/linux-headers.hash b/board/xilinx/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/xilinx/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
deleted file mode 100644
index bedb88c7ff..0000000000
--- a/board/xilinx/patches/linux/linux.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated
-sha256  002fa6c617d3d3eaf1e16219079f4e4303b84ea472b2b3c5d47f766a106a79c7  xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz
-
-# Locally calculated
-sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
-sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/xilinx/patches/optee-os/optee-os.hash b/board/xilinx/patches/optee-os/optee-os.hash
deleted file mode 100644
index 69bca84314..0000000000
--- a/board/xilinx/patches/optee-os/optee-os.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  3b8969a25815a0be84f34033827e5eb557e10f0f13ebabaee339461f8520ec72  xlnx_rebase_v4.5.0_2025.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
deleted file mode 100644
index 6ef11ef02c..0000000000
--- a/board/xilinx/patches/uboot/uboot.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  8819cbebda739436d5d2fbdef578ec3c9b902f7edbe0ce4ed6f0ddf254fcf2a7  xlnx_rebase_v2025.01_2025.2.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
