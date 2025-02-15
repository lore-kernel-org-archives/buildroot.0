Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FAFC021A4
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 12:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 410B560B0A;
	Sat, 15 Feb 2025 12:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aypY6F3ISODn; Sat, 15 Feb 2025 12:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDE960C01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CDE960C01;
	Sat, 15 Feb 2025 12:57:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0789DE
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C070C60C01
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IP_fcf_-WVMD for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 12:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::61b;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E38F660B0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E38F660B0A
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::61b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E38F660B0A
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdodhhsWg3vgAvC7Y4FJI45TTyiYgwAAttBpHmrKm69dWgjYKdPwOg0quAvrsNC19GvKIPoezbcSHuLKjuplZgezJs2sYuQr43fP2cfxaY1soOtMnJGPQARG7wqk/O6DaV9GSLhbsIgI7zc9xZAU6Qx98FRldY54KEh0QbgCQVRECJo+zr8n1Xjgt56ooWWgcdDLkGwa/ZCyZ9ObJsAXbr8vygRUFfWdfSCkZ1pPoIG/5CQfrZz1pQw9U8ubu7V9pDX2+EqYnqZeRBJj2uctUDb9oblfSXVNNlSjz8Vpg5HCO62sDK1J3ujC6IKwj2Aw/kiUu3YVpxN3TRoulmw69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orv/x2j6P/BuqfAyes5rfNs3nRXipz7hY1zCG9wCRfA=;
 b=NxI0dDJe7GG1m31HEvuDungxu6yFuoFyW/SdhXXj8J3ppsCXkIVPNlsDo5o8/a5Xftv+1pp5Ypji8x8atf0LK/9KJ5dQDZc1Insu432Sq4cEAJeOCy0kgS1sajFAW6RfTCKYA/GctZ0x4YAByAqCPYuhgh6ukTaRElNQDmxlGq6MrI4bhPEnoBbBjM/DmMd7WHbUPjEj7I772PEwUGf06uXQZ+bYfYhpfexCZVjRd4G08NcXYH2hCrDt4qNScKDbo7tk7E86EHSgTYNHOZN+XlzmILrsL2oJfVIHm4jBdmnhQUS8upliOUBc3jF41IQpIlkLfRtt8Qou9wl4UjHpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0092.namprd03.prod.outlook.com (2603:10b6:408:fd::7)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Sat, 15 Feb
 2025 12:57:38 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::41) by BN9PR03CA0092.outlook.office365.com
 (2603:10b6:408:fd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Sat,
 15 Feb 2025 12:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Sat, 15 Feb 2025 12:57:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 15 Feb
 2025 06:57:37 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 15 Feb 2025 06:57:36 -0600
To: <buildroot@buildroot.org>
Date: Sat, 15 Feb 2025 12:57:29 +0000
Message-ID: <20250215125732.2965257-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250215125732.2965257-1-neal.frager@amd.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 60aba1fa-affb-441c-0783-08dd4dc0535b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WzBV//10SnNEKp1wfKR0M37AtbySb9kkFkDlbhBBBNStcMrnKsFyTJzYj/0m?=
 =?us-ascii?Q?12z2vBL3Fu5ZTfFv8gD4mJ87qzHCPWfZqNfCHunXyy2asqUVIr71NKI0tAaH?=
 =?us-ascii?Q?mGnXO3D5Ak+nsy0rQXZORBk7yQdyVgf4KNcFG609Xq0KU19/ThGRDqA2UPh/?=
 =?us-ascii?Q?7S665WaqDJj+m2/ECrvUIj+ckNew+thKCr3KgtGuw50hxeVloFUnQkKQXGxc?=
 =?us-ascii?Q?xCxhSgjrvvep3zi4WJs6XeEENDim7RRZUMsrz+wZFe+gY24g4uXzLJavJJ3D?=
 =?us-ascii?Q?yuDvgBnwb0EQt1a8J47XFmrrW43zOUGAn88SUDbGKRO2bqm0CTJllnbU7K7D?=
 =?us-ascii?Q?pmjsKXTCF14HTYUJBYEIJf5IfKMokthhdQVym9+PkOdBiPenfRPI1dX+ePdr?=
 =?us-ascii?Q?o3EKO/DpfAXr65wyXv7KDWgRSjb1/ufjCF66ymAHMycs5hHxwi5BW7CJ7U13?=
 =?us-ascii?Q?2HYnrvY7xN2Z9ItVSJVctneXBxAHgZEdhpbRwC94qIAS5RrqhNSI3xpY2dEw?=
 =?us-ascii?Q?F/oHpyw1gZgoNC78U104XaJOU7Cmi8acifw3v5UEwpmmn8B81iAX22hQKEfq?=
 =?us-ascii?Q?tB3zSz7P8ZzKdRIdpTmGRaFpOtcV0u2OGW33giVY2ONTpbC90sv8SJr2p6ar?=
 =?us-ascii?Q?FGxX6NuFMB1UAzPfsROl4CR0BzZAVTCzRMuq+LWE7oNcfe9h6MzCmKJYBRrU?=
 =?us-ascii?Q?i/B1jx6sfGWwgT3BFI+Tfu1jSar4nD+PzNzsbRe9ZFv1Gf6YexevPyXpkX6T?=
 =?us-ascii?Q?nFTPaML12WuQtTCfJPttQfERUTG7ieIQ9Gw1+AiPRnA4Z2oaVn1QQQP1zJBi?=
 =?us-ascii?Q?gDSnuY7QmHSaAVsMerdNZZuwQJFldTekhm/ZTd+MBeqxe3GjTb+hRCH2AzKq?=
 =?us-ascii?Q?3jDGaZ7Vuoj3z+WiGP5EgDb5z9Ug7vUqNkZQ6cGEb8sEDMqLkGYqwm4VnJ1x?=
 =?us-ascii?Q?/xFeIaDbeWHMIlhczISspfkQ2GSJhXhc7/6pRoTnJdx+e9C2xeiITo9T6s0A?=
 =?us-ascii?Q?RAy+eCZoQCZVYCXYMwjKSVMn/Yg9we0RlBvcNtHm3saSRG5rAwUgeDQR2Oc6?=
 =?us-ascii?Q?lLnbyPj/SfDQhkpAyXROWCRwAGQGVuk6+mjHjVBYmFsGrjdXMI52iJ0Ec5+J?=
 =?us-ascii?Q?G9p+3C1HYKovRx+DAeCLDd5t68SrggKuFMVZ/JjAVzECEBHookDarb7ffJEJ?=
 =?us-ascii?Q?wl9OTeRWgIwNPiaBklVEzS9GAmaTbS3ONjzXsNHePw2cvelSV4x5YXnPqOPI?=
 =?us-ascii?Q?Jb+lWwxLoWik9ogU0vitjbebCV4wmJhQ3O1agb2kblz2PtUnMa317EfriKfu?=
 =?us-ascii?Q?stp8ysxQ6h3igoK7CmFqeSIDmNl0MZatJ/0WCHjZ/MAZdWO7xtEtcpZID4ih?=
 =?us-ascii?Q?yfBCg45j6II6C8An6WWXGdywOWYLmrptsp4c93DSCy+s4Z0BaxB/tIq18rFY?=
 =?us-ascii?Q?VkFS7MxDiBSQdHcRG9JNGjuCGhWjxCy5L6M/0F9x3PA+/Ylkap4Ko8QtDMgW?=
 =?us-ascii?Q?ETOrhxrDfCeM9TkTygmB8DoEOy1qqa2iUBh4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 12:57:38.3231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60aba1fa-affb-441c-0783-08dd4dc0535b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orv/x2j6P/BuqfAyes5rfNs3nRXipz7hY1zCG9wCRfA=;
 b=c1JL8j6oGbU26b0nwpXx/CmyVBYpxSCD0oknbPh0vAQ/u+TD1IySq1x37lQUN5jiHBd4Fh5oitQGiabBO4baAagzKVs29VgmlN7iT7DUoQ3y4ckzYcy24N3oIG0iHooM9/6TpUqfox4a6d3nNHzFannrw2s+gMrG59XVhqp3lSg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=c1JL8j6o
Subject: [Buildroot] [PATCH v3 2/5] package/gcc-bare-metal: add multiple
 tuple support
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

Add support to gcc-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- corrected sysroot configuration
V2->V3:
- removed unnecessary symlinks
- removed unnecessary semi-colons
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 89 +++++++++++++++---------
 1 file changed, 58 insertions(+), 31 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index adaae6c307..c47852d759 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -20,16 +20,6 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-mpfr \
 	host-isl
 
-# gcc doesn't support in-tree build, so we create a 'build'
-# subdirectory in the gcc sources, and build from there.
-define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
-	mkdir -p $(@D)/build
-	ln -sf ../configure $(@D)/build/configure
-endef
-
-HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
-HOST_GCC_BARE_METAL_SUBDIR = build
-
 HOST_GCC_BARE_METAL_MAKE_OPTS = \
 	$(HOST_GCC_COMMON_MAKE_OPTS) \
 	all-gcc \
@@ -37,26 +27,63 @@ HOST_GCC_BARE_METAL_MAKE_OPTS = \
 
 HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
-HOST_GCC_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
-	--disable-initfini_array \
-	--disable-__cxa_atexit \
-	--disable-libstdcxx-pch \
-	--with-newlib \
-	--disable-threads \
-	--enable-plugins \
-	--with-gnu-as \
-	--disable-libitm \
-	--without-long-double-128 \
-	--without-headers \
-	--enable-languages=c \
-	--disable-multilib \
-	--with-gmp=$(HOST_DIR) \
-	--with-mpc=$(HOST_DIR) \
-	--with-mpfr=$(HOST_DIR) \
-	--with-isl=$(HOST_DIR) \
-	--with-sysroot=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) \
-	AR_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ar \
-	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ranlib
+define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		$(@D)/configure \
+			--prefix=$(HOST_DIR) \
+			--sysconfdir=$(HOST_DIR)/etc \
+			--localstatedir=$(HOST_DIR)/var \
+			--disable-shared --enable-static \
+			--disable-gtk-doc \
+			--disable-gtk-doc-html \
+			--disable-doc \
+			--disable-docs \
+			--disable-documentation \
+			--disable-debug \
+			--with-xmlto=no \
+			--with-fop=no \
+			--disable-nls \
+			--disable-dependency-tracking \
+			--target=$(arch_tuple) \
+			--disable-initfini_array \
+			--disable-__cxa_atexit \
+			--disable-libstdcxx-pch \
+			--with-newlib \
+			--disable-threads \
+			--enable-plugins \
+			--with-gnu-as \
+			--disable-libitm \
+			--without-long-double-128 \
+			--without-headers \
+			--enable-languages=c \
+			--disable-multilib \
+			--with-gmp=$(HOST_DIR) \
+			--with-mpc=$(HOST_DIR) \
+			--with-mpfr=$(HOST_DIR) \
+			--with-isl=$(HOST_DIR) \
+			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
+			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
+			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib; \
+	)
+endef
+
+define HOST_GCC_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_GCC_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
 
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
