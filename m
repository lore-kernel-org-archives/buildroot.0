Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0609DC55175
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A0B405A9;
	Mon,  3 Aug 2026 07:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sEp5OWEXWVh; Mon,  3 Aug 2026 07:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983D4405AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785742803;
	bh=VAuwSAcKAs/fIg03k3ErIMrAHQYKn7sCYQ8vYsHxuBg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ohFcKtxTuFWNaC/k3SGKDMxUvp9OzbosAjJPTLN+dc3vxzlALHSPAZNI8z9ynCtss
	 l85Mb0HvkxyRDHY7+tbYhK5e98gtID5F8QaYL6mmlKlMlzrmFgATRVQFgqGKZ86eza
	 i+t9eJm0e7prfVQ0fI9i4EJUFzmxcg/5dbiQx2w3r89D+dA+4HboDs+RTKeUJ5dYqB
	 I+qqb0yXFhLVmSBOCQzM1infy/faVL6VrepXIr5eK0Gf58VN6crSUKHGGnwYxAb//7
	 WsfaAB12q6ZsgPir9LortdIIqWDlaSkGc5mw0AWV0JJSuslDSW06fXd9v2GgInr40l
	 p+HmGGFmzx7YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 983D4405AB;
	Mon,  3 Aug 2026 07:40:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BA7C3A6
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D55B40024
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxCZe0T0yW0b for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 07:40:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1BC5400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1BC5400A2
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1BC5400A2
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:40:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rV98VuJzAAruXeSLiiV7fyA8XHfWW5LNj7C36q/SXOyO+/rvxrPW1ZInutV4K1eQ1agE3QvTDjKDeqk9VGKof4rNoPQDCMsvECxw7BtHnbor8o5AzzH/ZlDZfiKe7+HkeIk2Ev1UpjWzsLYfEiWInm6SPKxPGECGlCoKoXjdE12IJfOt/E9QneLzA94dt8yqtyXoi3xJUG6oSRRcfplax99yThYAofbhUMPjlVNztQDzeKvR5Z9wD6EwYO/mmK0toGCbCQHTZNYiUuO+n7xscvnR8sMipKzBc8n2vUYz1PBIRKUt+X4JPYoOkgLPiZrhk2FXtw9ke85Xg9T9083s2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oy85WzI0etYMfyV8cwW0biT5pTSDEQIy7UPRKn9WdU=;
 b=xL8P3tIkPVuMEqdk0ydLlnDqVdPtkzXu4mV2VSPYss4pgdm0DdzGcY7OPaRCUSxeCdDNlYopj7+2L5l4ewFyx5J4h2SAXhds8Wtg0vJOaQcUKnK1/6woFWoz0H3dBit00sfHgFSPuSKBmNDMlgfG3Q2B76GRFqGpJF+3xurg0ub4RlBbuSUMR21OsNbpMMEP28J8sVoesDBLYIM1UngQBhkE2T5svd0ceyZuWJKjD5Jd5CKE7oQH2btDFNr5t5/ZgREFtlQp98b4KtIG5kGmQRhYICWVd8c+d2mvK9qZbe/Cii9r+OGWj5/AEABCnd/SINzLnfj8Q/jr6Wm0/MGXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR01CA0011.prod.exchangelabs.com (2603:10b6:5:296::16) by
 LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.17; Mon, 3 Aug 2026 07:39:55 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:296:cafe::4e) by DM6PR01CA0011.outlook.office365.com
 (2603:10b6:5:296::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Mon, 3
 Aug 2026 07:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 07:39:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 02:39:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 00:39:53 -0700
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 02:39:52 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Aug 2026 08:39:48 +0100
Message-ID: <20260803073948.3631110-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|LV3PR12MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6f0d17-b34e-409d-7fcc-08def132691b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: BIDCQdGPV6o86bfoFUj+0+Mo98Bmc0lsJKuk4M99gctYiC0g5lU2xVYJOh8rDTHKPfIwzTNeyFTZPYJmLzumk0hLCOlH5d9vT5XW+2FUiuqED8hhCSvL1qR+j885hqx9btCMgyP32wn/65A3hSOwr+2LeRKRkkOSM3YAyG18rxfh4Qc2QPAajWDinsQmjLu/NARMO0Xvt7nhyF1/N3T1fSu28rCJiReV4o3CLL/EP5WhVKtDMbIVzqUagVnxAmbXwkxzZbYLGzStLupIWTi5qG/WkDalyPfLYaOKJR0Ts9e4nuTy4wNhbMYIlS4Gn9CUmyOalcMoDiXa1hVxtA4xCe1kxtRFNp9ompY7DzlmGqyqnNWgAGySU1kzlLMU1dnOOa7IdF8QJ3TRdlikhugp+8FbSsE+DLrxq519hyKz/yF+XzkKHipcdzzNpHWdDqDniWY0Z7PIwsjJiEo6/ApQb1IgFKm15Op81uvR1x/EI0eO4n5eAbr8JA1RwLagAXS3On9RJRHK39mgJrwFKVnOufaM9nfVTbrHYZnzT8vBOJqD+vwA5AvcIIRxk8YQ/jcqX3ti15sG5jM+WjsWfr3BlqFrib732LmP68dv8Cg8Gl4IhDK47NrWIhGu/fCKC7yVsdFdoZUJagDWyAXYp4YrnrEA4wg+VNBH2FdVYAJDc38oyHvbZs/MHdwhiFO3GNK7yfO4dZZnMThxGmDPaYLPHXX37UEdrjmhzxOiVJ+e5F+iouQA0MXBfimuEUA7ECQWlLVTtjEODrIcaDgGkQv5GA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GEw6SXuTayVREVKA66iQNcKHI6oKOF/cOsaNAXW3bmL/mMq+do8u89cFObcbKF6oVmk5xy/FE/OukXm6jHa3EPvArXunCZUXN/gl9sBWbCaGQ/uxo33VZImVbSAZE7HQXUunq8wRZxNxTy/9Bc57+YjyLtcw5ll/oWIwe2LQJwUbyW4yozwIGAbNFTrzTcp3h6Zo0C8PImIzZd4115yUA6KfMsXX3Qso/JA8V+yn6P4qiA6p3eFclimLsapK0+vyhV0n2p2EFvSsuDQus56ndW5WDY57Tf4Wmfs7cCx/qhgc3yae+G/ACJiSt/KEe2nA/TTT7D9jP45xtfq8dxjuHlWZbk2MOOgmj1YLmE5oGR50mRyCGpWHf32ToPaYcATexc9TeOuPqP+r+7ArNUtrT843OLAy+xtMGX5/D7sptikBobeHsgcVpgb0xM/5UntS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 07:39:54.6519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6f0d17-b34e-409d-7fcc-08def132691b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oy85WzI0etYMfyV8cwW0biT5pTSDEQIy7UPRKn9WdU=;
 b=ijcRIyq/uEWXRtdIAiLv4jRf02+8cUko/ULI20llYoDTgS/ojVBVBndITdmrExz5DtZOBfnn/oRosQo7sRSM0UUe3NVFO+QcN8Q9Q+DtaMMVpHHMZQ4hqalw387XkiT0+aL3iaS83rOUlX59zJ1OEw8/WgzzwPrSjO4N1iNhKA0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ijcRIyq/
Subject: [Buildroot] [PATCH v1 1/1] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
 yann.morin@orange.com, matthew.l.weber3@boeing.com, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
qemu-xen dependency will not be handled and the patch will fail to apply with
the following error.

Fixes: build error below
Applying 0002-Update-linker-flags.patch using patch:
patching file tools/Makefile
Hunk #1 succeeded at 36 (offset -1 lines).
Hunk #2 succeeded at 185 (offset -8 lines).
can't find file to patch at input line 76
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
|index 6bcc83ba..2590904e 100644
|--- a/tools/qemu-xen/include/hw/xen/xen_native.h
|+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1

To avoid making BR2_PACKAGE_XEN_TOOLS a required option, move the xen
dependency list out of the if statement, so that the qemu-xen will always build
before xen and make sure the XEN_INSTALL_QEMU_XEN_SRC runs so the qemu-xen
sources get included in the xen source tree before applying
0002-Update-linker-flags.patch.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/xen/xen.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 75252d1123..b7b6561e1b 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -52,7 +52,6 @@ else
 XEN_CONF_OPTS += --disable-xen
 endif
 
-ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
 XEN_DEPENDENCIES += \
 	dtc \
 	libaio \
@@ -64,12 +63,6 @@ XEN_DEPENDENCIES += \
 	slirp \
 	util-linux \
 	yajl
-ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-XEN_DEPENDENCIES += argp-standalone
-endif
-XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
-XEN_MAKE_OPTS += dist-tools
-XEN_CONF_OPTS += --with-extra-qemuu-configure-args="--disable-sdl --disable-opengl"
 
 # Place the pre-downloaded qemu-xen source where the Xen build expects it.
 # This prevents Xen from trying to git-clone qemu-xen during the build.
@@ -80,6 +73,14 @@ define XEN_INSTALL_QEMU_XEN_SRC
 endef
 XEN_POST_EXTRACT_HOOKS += XEN_INSTALL_QEMU_XEN_SRC
 
+ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+XEN_DEPENDENCIES += argp-standalone
+endif
+XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
+XEN_MAKE_OPTS += dist-tools
+XEN_CONF_OPTS += --with-extra-qemuu-configure-args="--disable-sdl --disable-opengl"
+
 define XEN_INSTALL_INIT_SYSV
 	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
 	mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
