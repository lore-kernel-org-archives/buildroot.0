Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C970C5518F
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 14:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0FA40612;
	Mon,  3 Aug 2026 14:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiZRy2IlWVFS; Mon,  3 Aug 2026 14:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D396340593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785768751;
	bh=k87gs9t0a9R/X+281r5eGLNCzJMuUsMkrw3CLNvN2jI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=N+4KwELQ9yfNDhVq12HiMWori9jNcIoMQCnX3B/y9eueUiKvtRUmaLxA5/4aAp7U4
	 qvOZ8Tc+4STLzCug0tyBTC/5l1zpv8HU4C9m8ieE/+AR4DTNRZ3gBKPNYL0M6fsDCb
	 geFHWmCsi7fHQxky0aMCIQ8UUCA5MVrqbVWhmPyz0nUGqgMhn4ZMpbTd3x8G5Wgpn1
	 kPZAq5Pq3w47/5Ba4O7xkN389ru4b76LiMfg+dGVTdT/KBcG4KBT/C0gYgEsIOucxj
	 cb7jjELHp1v9xHIMC+hda7iy3xxkFPAmLwPw5E4pI+WECUbffrRgWwr6n9lc3vMVva
	 /dYl55IBrNuTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D396340593;
	Mon,  3 Aug 2026 14:52:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE2B282
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DDED405B3
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwVqaEADpY4p for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 14:52:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E65340568
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E65340568
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E65340568
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhGTZRslc+IqXB57aw07Vbv9A9sDqfWeLkdCZy3CtHUlO7eQAIgaYmRPCJO9bGaUGpgO8jQOMiUDT8GdxEwrG9SHmg7bxyqrVSh2fQ0My5Y6WZawrFZEVFwy/JMTjzbRHNmffMA3fi8P+xSk1v35gbxfqIb7EE3VbIQz0W9zj6XHah1Jk38iVQvztbI/7B+YKqcF06OmZuknt2ZHZ2hE45BRf+PV5CeJGAbDHNpzHUPtoAUjF+gvOSeRnU96PTaCPiPnNVEFWJ4Zba83fIL7WF7ix5UgiogE7iIm8+ywD2YbM/ZU3hgoSbvrT8w6CkjutneozA0Dc33X/AlTE9cH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkQCRonf26cfOcdxzklBIgg32qhdwyQcQfb7VBWCa28=;
 b=kBQ7YeF/ZLFy0ob/JRBLmD1Fed7sZRS6E1B5Mwp148fymgITO3igzQYakW1fCDaNuLqJv8iwwI5GWS5bDyDovKL/45V9BwaIOLjqBv64HlfC5fjpWrvmhcJW+3cysNxbxENUXqW2BgJx/0GlTgQAl27MjOPtwFg9Fzt0LjIEPufQOawocZn9boA+8xEqaYzi/qtnG5GRxU88T3Z3oPQaKhPosclBHzs3SHySOlRrRaklJOdayHmmYexryS15e3F/xGfH9u6AzP8roFx55jqQ0BkGbsLwtYPp/yXDGnrNp8pzUgHWYRElifsTeB6i9HK7mrlJ8UUOaYcc79iMLcBRfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7P220CA0104.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::19) by
 CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.18; Mon, 3 Aug 2026 14:52:19 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:8:25d:cafe::72) by DS7P220CA0104.outlook.office365.com
 (2603:10b6:8:25d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 14:52:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 14:52:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 09:52:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 07:52:07 -0700
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 09:52:05 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Aug 2026 15:51:42 +0100
Message-ID: <20260803145152.102135-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803145152.102135-1-neal.frager@amd.com>
References: <20260803145152.102135-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CH2PR12MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: 107b64a9-36e6-4404-d653-08def16ed0a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|7416014|13003099007|11063799006|56012099006|10067099003|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: VGwfu9jC7Hi3K7etcT69+W6k054KNiC/EkspTdaZDICtwIL+5Sr13ceMuAJCAlKQCvOWUfulfYu2vQZJuqkyWI5cvBd+sob0sYQ0jz6omjk0flG+iPJfTXWuQ+deBWh/YaYIYlUaiCkwovvhZBhcV8ikMo42Ph6XFN00ubN0c4c4hWcPInOWAIHJrj9UGLF01t577cE7Fle5iawlWaGCk/NmbpADVUo2mG0vC4LY7CPeM/NQ6ktLK2DOvY57Cpo7srlVe5kzM2tfPuNIYQuKy0qC/2imHd494qvJ41+HUCLOqfrnMcGt1SWCPbqksP5eroGMndwBxUHHAh5XZVJ4PrnEj4cBZbZ9hy1KtlryOigJ6JvDVYW1puXdcvU/4lw9qMXgc6OnheSeVgrFdV2tMbKi1nEwTJf80ULCHRo8ywGcgZeOO743SDLQYHPHoNVeMiyrJ4gNBe5d7AF0AEy3/us9xSeyp8v7Q9RGgXW1YKZzc0PDs5nkXqeZmduvG9ak81qH3cmRF0D2U9kAcIudpTQeTbkuba9VeWaxrMSJrT7Fz/pkayPFrAanLIFijDrQulpgdVVWdJIoqgPHk9iHly2TO07ztrXSgAyK78UPYS+W1BpbbKVG+MT2kfTD8PoYu2itDwqSkc3nYmWQyXuAVZxUOl3qgphQBKWApFKd9dSP7qPi2TumrAcvXAMPc3MwQyozw2mmDGCuw7+N5vhOUA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(7416014)(13003099007)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MBO0tc7szDFpiWrc+WLLabw3TXnFlv5ybpBfBzOxmEzyev0BITTr2UGwPbA+fzj+PuX6ZmneDuiaVIFBVGcFmm5rPuSTAwPtgVDY8lfR0vhb3Gi45Iv1xXuPVWJshZvewE236CCqO0esd1/6iQENPTqZvzMJwJPXXRozygc5o0VP10SjXZboJi1Z2vs+YNLIj6FcFFD83EfEaZA7Hll+Onsx1Fw2gCmRCBPn1D087dsw8B2s+dUe0EWBabUPFECglifUoL5jLi1Q4vrHkuQ6ESSxOOHMd94yty6svcuK7NXDCImhHeU7TjTB5EH8a7snrlW25VKTxujP2JgAD336zkUWE+8CYX33x6jBim+dF3k/+PbPBA47E7x9S+SNX4JbTIIqsqm9Ry6ClnEznIz++ImnTmbzz0gPG7os+FfBbvmjmLLbcQkG6jWhqRaPd/t0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:52:18.1424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 107b64a9-36e6-4404-d653-08def16ed0a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkQCRonf26cfOcdxzklBIgg32qhdwyQcQfb7VBWCa28=;
 b=MZYqSNuhyuuAwTxd+hzQSnv+2HwRFSVpmFIRn4VQfqVMtFuHxtMDn911kD4+Eo/i0++aadrV9VZdTWh1EcGeEeiLXsd+oS00hbuI16PSWZV0sX2f3Lws0TjofijJsmYWlx4mnswzklBdGvu35psDRI1Zldr1mfgJxydENoPwcoo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MZYqSNuh
Subject: [Buildroot] [PATCH v4 2/4] package/xen: add custom version support
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
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the ability to configure specific Xen versions while leaving the default
version unchanged to avoid breaking any builds already using Xen 4.21.1.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
Reviewed-by: John Ernberg <john.ernberg@actia.se>

---
V1->V2:
- rebased to updated master branch
- removed the line move of the XEN_SITE definition
V2->V4:
- merged into new patch series as the second patch
---
 package/xen/Config.in | 25 +++++++++++++++++++++++++
 package/xen/xen.mk    |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index d63a3f6002..e50b232f0a 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -10,6 +10,31 @@ config BR2_PACKAGE_XEN
 
 if BR2_PACKAGE_XEN
 
+choice
+	prompt "Xen Version"
+	help
+	  Select the specific Xen version you want to use
+
+config BR2_PACKAGE_XEN_LATEST_VERSION
+	bool "4.21.1"
+
+config BR2_PACKAGE_XEN_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official version
+
+endchoice
+
+config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
+	string "Xen version"
+	depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
+
+config BR2_PACKAGE_XEN_VERSION
+	string
+	default "4.21.1"	if BR2_PACKAGE_XEN_LATEST_VERSION
+	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
+				if BR2_PACKAGE_XEN_CUSTOM_VERSION
+
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
 	help
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 75252d1123..51d51333ac 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.21.1
+XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
