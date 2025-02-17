Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38297C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E3F81301;
	Mon, 17 Feb 2025 12:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdQVCtuN_yCE; Mon, 17 Feb 2025 12:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59BF8130F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D59BF8130F;
	Mon, 17 Feb 2025 12:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABD3C72
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EAF460854
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OJX4yrHyvL1 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:49:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::620;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6734606DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6734606DC
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::620])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6734606DC
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hyc1vX0FWDpoaPZXSm4o0tGe8IxRgeP7phkhFWxuxORHvGQhkDjpcDcBZywsnKDF9YtUZ3Bu1kkeqBpdnH0Sp1J1vhSajWBzUmB793mvs7Lwuuu27uv7XZjL6uYLsbzRFjqc0kZY0x5BamyNi1Y5GXX4YgMyT5lPEWfcgf0TbyC159HBAogCb8dukdVXnMi2Jmnclp8b91N2Lu8w9aoKa1A0lq4n26rMVSbs1C236nl6V0dJWUuCRyQ6dkyt+eDknRvGlj0yRH3dyjR9Vq21y3UVkWv/wBfWdVKnKaJsIN29Wq7LbKtk6Cc0wiBWzqtFiEl1h4km5ufBYMgJG974aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Psg6wLxP96Ud4VJj+Sg+m4Qy5nKwNAZ5jCKIoXggLm8=;
 b=NansAuZIDBhESeVjLnzmr8/gySp+sbND7gCuIxD1czvh6OIXp6HtumFpwC1+Jnp1xGll9UsZ3e8CXkdibJ5yRNFrnYuFWbj37CZdvmO2nCWSWvClSGACerqn0RaxxYAff3qQsvkpVGnW4shK6yfpVl/afwb9diT9E/wMovXEzRa4nAI+pBHDnnMVQTCL3eAfYp68I76z+S07v8cYiIO3rkmQYl6LCZaunuDC89RYA9al1SPauPBt9EQ1sOoIeNEZeEIPBwZ5iaeQ6mY06WNyxCp5Jb6fVtEpIusug63vOvRC6JdICSHBefGDVEd8PBKXFhc5mdUsL+rk1umzboHl2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0331.namprd03.prod.outlook.com (2603:10b6:408:f6::6)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:49:37 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com (2603:10b6:408:f6::4)
 by BN9PR03CA0331.outlook.office365.com (2603:10b6:408:f6::6) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19
 via Frontend Transport; Mon, 17 Feb 2025 12:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 12:49:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:49:35 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:49:35 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:49:34 -0600
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:49:28 +0000
Message-ID: <20250217124932.2653445-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: f627c6be-a5d5-40af-00a3-08dd4f5188e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zSsMI/vTia5O3S6po2o4Psm1/fONaoYyO5oUqZJ+Y6y9LeNiDBrnwPIeiVpL?=
 =?us-ascii?Q?EbQQ0+XBXHE2zNIbuxsT8EOIRIIQsrGmnwCJsxpsAnDyoho8RAEbVTYXhl16?=
 =?us-ascii?Q?zmm/g9eG8WHlvFAljMO+Wv1x5c467SX6ZsJpkd79HXpvXWPUzoy4yDEVbdoe?=
 =?us-ascii?Q?F7WHZfI74f1AjiW9OmgLRbMBBmCXGRDVRrch57wrccfon/yAwmbK9KOb3Y1Z?=
 =?us-ascii?Q?3pWuSnBduogei0kxrJZRwLygHHerqdDOuam4Wy470ZG/7WLZZaEqzDMasya/?=
 =?us-ascii?Q?VkPO9hz4H0viBiQyKA4chJGqmnWZ7mK46ZU8GrVojPyqz3gSnxpiT1+zdv4E?=
 =?us-ascii?Q?QvpQ6rCkrtwJblvGTQVTOZIhiUooiTKv1EQgmkx+UCUX8wRc2hE2HSv6BDR3?=
 =?us-ascii?Q?pvmUnQyf8kExrjJvk17DoWDSQLamohcUcc4w7FYbm/uJMt4UE4itfz3aBndy?=
 =?us-ascii?Q?8TtY7BCFgzw7nOLcnFUl9tzG0kr3e4MGvrckAxp9D5mkkxD3OCe8J66lk1xx?=
 =?us-ascii?Q?hEopyBanoE5Rp8vB6RX4hyctTrzXEmpRkNcfb22m9XBl4oIWfEI1yxIwlgr/?=
 =?us-ascii?Q?p+xqLRwOy/2eDxPPrXGpuFz+DzvlEb5LTnCiHmK+ZzbSAO3fcMXYygrXkXlz?=
 =?us-ascii?Q?HzRVA6eUnv9yXBt4iH9/QmTmxM9A3xUGel3mm4F153Vr2SJAUdnLeQfqJnka?=
 =?us-ascii?Q?XlCLO8luWSt5t4dCHX68RSUrDlntxIl3EmL2jEZ5c3KPJwxY3lvOnNKIIEeb?=
 =?us-ascii?Q?GzQfeRjY/kjQPyqzR/kOjLdSA64BMpmAfRORP4pWyUTEBYyFmzOfoQXJQXBK?=
 =?us-ascii?Q?1RSRbnbrk5LivBtYfZ6VJRYRlEUjqk75MfCpLEOMK36gbXbdwUQPs/UXBV/e?=
 =?us-ascii?Q?wTiapvojqwU/YiBST/8AOi1ykU8FHvuurceK77gOszoJH5VR3mevVv5qgYl0?=
 =?us-ascii?Q?rCmjAhN0PzwzxUSvCk7hUvdzoVwdnMs7bPwrS2VU21AvzCu7NciBWbxMjEgA?=
 =?us-ascii?Q?1wRGOJI63Kosius9hemqxSB5LL2EPS256IbwYVxPzZALiJiyIHF7Tj6ekB6g?=
 =?us-ascii?Q?AHmhHKRlgsksfvfYq2Z8cCQAN5Fe2J1Jng656DJSbbpVCOxKuQkWPH4UzQab?=
 =?us-ascii?Q?YwbkLzHQRSKRB/U4TOg5XckI8Y017OWcRFS2943A29E3JIZ3dL8gIBRFeHy/?=
 =?us-ascii?Q?gKIzMplWSvUgiUohA+QCx7xGDI9YX6ghC4ZndFbvj2WkACy2P3W2TTehq+IK?=
 =?us-ascii?Q?hcxL8tV98UcaxaHn3nnzGEjna4HNDV0Mq5jM3JgLD5WIPcvAhM7kPRP5zjXn?=
 =?us-ascii?Q?c40xENMaIVSLQ792pAV1/+fzMiyTphGnZz5tlOSYUndsk6OchkK8+vmfJIoV?=
 =?us-ascii?Q?M+sOjRZ8syZc/pVN8KWWQg1zu+HBJJPogbdBfvLKtRBizu/wySfGNHnFv0Lg?=
 =?us-ascii?Q?NHqwUtt/Qh56kg1uVIeFV1a+5BMYYtzlA86Yn7gjO5iK8VeiJNM6DKRUH00d?=
 =?us-ascii?Q?mM9GdESpMqW7V55oZsl9UbAhtzf8ul92dxSk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:49:36.3245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f627c6be-a5d5-40af-00a3-08dd4f5188e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Psg6wLxP96Ud4VJj+Sg+m4Qy5nKwNAZ5jCKIoXggLm8=;
 b=DwYxNfu7pLtPrMSOAAISnTOutQ5OAigpehKb4+NX+gIWWVw1f4QzsNbsevOX40TIUy3GomS0cX1ptGti9EiNAEfX6LpC1YyY60auAgkp+jBoJZvcynKtk2aBykkBtBiFig8HNZZTL86A6oYK4//9DXogJ8ts5jQEUTg7ZvlPNLM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DwYxNfu7
Subject: [Buildroot] [PATCH v5 1/5] package/binutils-bare-metal: add
 multiple tuple support
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support to binutils-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

To do this, custom configure, build and install commands are needed, so that
each step goes through a loop of the architecture tuples in the list.

To keep consistency with autotools, all the relevant host configurations have
been copied into the HOST_BINUTILS_BARE_METAL_CONF_OPTS while removing any
configurations that do not apply to binutils and removing redundant configs.

autotools redundant configs covered by $(HOST_CONFIGURE_OPTS):
	CFLAGS="$$(HOST_CFLAGS)"
	LDFLAGS="$$(HOST_LDFLAGS)"

autotools configs not applicable to binutils:
	--disable-gtk-doc
	--disable-gtk-doc-html
	--disable-doc
	--disable-docs
	--disable-documentation
	--disable-debug
	--with-xmlto=no
	--with-fop=no
	--disable-nls

One of the configurations already in the binutils-bare-metal package was not
needed.

--enable-static -> handled by --disable-shared

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
V2->V3:
- removed unnecessary symlinks
- removed unnecessary semi-colons
V3->V4:
- added all relevant autotools configs
- removed any configs not relevant to binutils
- corrected some configs already included in binutils-bare-metal
V4->V5:
- --disable-gprof was actually working fine and did not need to be changed
---
 .../binutils-bare-metal.mk                    | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3525e9fdf2..709d072765 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -22,13 +22,45 @@ HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
 
 HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
+	--prefix=$(HOST_DIR) \
+	--sysconfdir=$(HOST_DIR)/etc \
+	--localstatedir=$(HOST_DIR)/var \
+	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
+	$(QUIET) \
 	--disable-gprof \
 	--disable-shared \
 	--enable-lto \
-	--enable-static \
 	--disable-initfini-array \
 	--disable-multilib \
 	--disable-werror
 
+define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_BINUTILS_BARE_METAL_CONF_OPTS) \
+			--target=$(arch_tuple)
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
