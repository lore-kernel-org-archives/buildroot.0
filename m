Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA79E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E01B4079B;
	Thu,  2 Jan 2025 10:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEdGJhUbR36O; Thu,  2 Jan 2025 10:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCAC140787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCAC140787;
	Thu,  2 Jan 2025 10:25:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A82F27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03F8440787
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXfSKh-GWErI for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::625;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE86140784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE86140784
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::625])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE86140784
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7T6ngOjZssDFZR8EjKzuq0lVBuSOK73O/lZUfLnpoNYC+earj+Pry7YM4udnB/iLf5WWJqxAAwv33YIvmbGuSZbturd+ltwWLQptuceQxb1WGKXJ6vzruR9hQkK2nbrSnaAtZ2TllNsISuzhuAu3JNNXpmGXi0vE0b+9bXkAtKd48Joz+T21p0+gJS2lNImg1H9WTIqZBmGiDEc/wpbiyd8cnVuhAEBrDs/j/IBrvuj+n4m2mVBxlfCfHttxc/HjpuOode/UJQKYPBNaLhQ0OzhQar8HzabzyO+pfEmRWthQGwVAN+mpdwR5D+wsdfvgWx6rmym2helMPWO5QrrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVbs1H1hD0Y/wgcBmfSDrIxio//Gn9KiI1VrSizIq0E=;
 b=TGiAs5ZiV/Zt96TR6V9MstLGs6TDuN0m2VggsltD6LJLRBIy5SZ9I7vpnJ0NK6Q484sP9ngSbviwcLk9KAdlvt660ugxhID2caADOkM5yq55C+KSWcVedv79rhC159uadInHGxOHdDaBFX1QVqRZDnaE0xRuiHpbwe7JfHwF8p7BFYZoDIWsubpVfdPWrsOwYb7e8hncoEpVaqGQVOBi3JGuo5yUuGSvEMji1SFuczwVaCjHDvKYFKN6aAN42QrDN+Zye9XycCfFlh0NOlOL/QGiD2qN8m/to1zgJNs2mstd3TDhiRY20+jtgJqG6AOZaeoWYdMiTTAVPfVg0CHbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR02CA0023.namprd02.prod.outlook.com (2603:10b6:610:4e::33)
 by SA3PR12MB8439.namprd12.prod.outlook.com (2603:10b6:806:2f7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Thu, 2 Jan
 2025 10:25:12 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::a3) by CH2PR02CA0023.outlook.office365.com
 (2603:10b6:610:4e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.14 via Frontend Transport; Thu,
 2 Jan 2025 10:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 10:25:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 04:25:11 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 04:25:10 -0600
To: <buildroot@buildroot.org>
Date: Thu, 2 Jan 2025 10:25:00 +0000
Message-ID: <20250102102500.1420512-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102102500.1420512-1-neal.frager@amd.com>
References: <20250102102500.1420512-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|SA3PR12MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 733219e2-31da-4415-fc0c-08dd2b17bdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P6fiuBbiu8FD363tiAvDowoE2nTXecxpWkkDLIADN56pd7aNmvLYb+VY2IvP?=
 =?us-ascii?Q?3nnVhlOPk7dQ+Rtap2lBm2ub/+uXRsLrTwcU5Z0c7vr6SC6H23IZHuWeFaoa?=
 =?us-ascii?Q?SxNxYBvMl70OV+iG8gRIxTRv7SF40U9Lx3yDyfDtN8KW9KO/c9B8JVOXiept?=
 =?us-ascii?Q?zikS8bd10Dlp1S5nekyViuORBWIDdQOdl1UwPvNOwF43HXbpFpeSBBMLwAjK?=
 =?us-ascii?Q?ZZY+CYxIvl6Uk0ZohLl8NizN93nElZgqYXQnhl3+Yb49InISbLF+D9HcB0ed?=
 =?us-ascii?Q?mUNJO+S45qRiGIQfhzt2vxlE/2yv3wMyh0wtFkAFF8FQ7kWUdDqUbNQGdg7Y?=
 =?us-ascii?Q?qM6MJCN1vhkT8hw/5A6mhEOYa+9thbYQDraoFQzs2CdgNQgDYYzuXT/YPckZ?=
 =?us-ascii?Q?8L17mYnLeTVCgXL1RO0nNt0V+/3+ezLt1dXA+CInYQk3DLM6TenPJ+2UB/M5?=
 =?us-ascii?Q?mWZmAfngmELOgYtrTSQH1PoXT0+c19MpNNVNBEyPXy9mupVFZjiXKubjIMjB?=
 =?us-ascii?Q?RAN/myE7RRIzPGUmXxDkjBkPbWDXzQ9Kx4Y7BRs30GM6kzbVEtWGlAWjP4EI?=
 =?us-ascii?Q?8fVP+g/PH58ENoMae1FQbo2XklvmCHC8XzeXPetVr3kTKL/Llra4r/T/FuVr?=
 =?us-ascii?Q?vYhBDM6rxAGwRg7DeL++wnNAjKk7rMrANrOOIeCVEpIDSFFv2UYJZe9Voj/L?=
 =?us-ascii?Q?KdPk0KigRb+upGbX3dEF4r9brNTYXvy/huK496LMDEeB1uyDPistngmPl7ra?=
 =?us-ascii?Q?BvmjswP08p8TfzQknWzlyoNqMiI1WNTf1NAF8TUQqoWg0v8rJwo1u9CD7rMB?=
 =?us-ascii?Q?8WANLShRTnlFAuydLtXJItDNgPPgfLOVNVlg7XS15WEHgMGJEghNps0rpB7n?=
 =?us-ascii?Q?oDhZurTSKkmSq2VX5BAymslqWTdpnpusUL7H9u6JPUkuOYQ3lnd4dWFXSfWq?=
 =?us-ascii?Q?8ls5FaVR2bezkPipFeHDFGk/G8tM8Vy0MM478i95N5ws8imEjz+WvnfP/0Tg?=
 =?us-ascii?Q?VEBjD456oOBvH+vKJ9XFKF8i3ttQ6NzbKmfcuk8da5sQYAj79FVjmrSOLUa8?=
 =?us-ascii?Q?jKR4iVtIwXQDOLi9NYFaN4N+fEVckrM36FvbPjQgk2ptHpBIj1vqAAzd58Ay?=
 =?us-ascii?Q?NDloNLOqhK4gnqLyd+fx2MEL4/ewJULgoBL9llw4hSysU0jsFMNT2GOqVcoA?=
 =?us-ascii?Q?/UiSMhFS/ODLQPFJu05bRblu83HfiXnyw7zQVwuORpMr9+FHxUOmE0SHo/OO?=
 =?us-ascii?Q?WWHOo1KdCT8lnofofTSouCwweAca6gMWhX8HZWVtgCf90+HHCKPWHtCOyFKB?=
 =?us-ascii?Q?+Mp7ix80clb9427OjF7crKEydyBc8buGnRSNcBov5EDwoUm5hCJaB13n/gLA?=
 =?us-ascii?Q?hiEb6zKEsGQ+fYK1eHgAEsm+5VrJZYS/EKCZ8Jm57VkJVfeDsGeKQTxCAm1s?=
 =?us-ascii?Q?f7r83aWDCw/JCDyCcUZtqgI35OFFbyRIw3gALDSFqJeRDoiVeHatqau6go46?=
 =?us-ascii?Q?lr+j4ImLLWt/7rKGVQ8ud75H3DB3JyC61Dfn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 10:25:12.2038 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 733219e2-31da-4415-fc0c-08dd2b17bdaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8439
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVbs1H1hD0Y/wgcBmfSDrIxio//Gn9KiI1VrSizIq0E=;
 b=YCFa6AmhdS1vzAdHvnxR3xs8B4zFCqAsMrOUFEAevYOVCnoM4rW04d33rXf2cKnxhdoYuRhK6P8DmrKtjOkJUzFZKzhf4p0qweFyXqQtkUIjk9fvgTZtSiDNJH/slWnUu8GH6+D6rWj61D8I+hnwCmWdhXy2UE8ntjCmHmRhf+4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YCFa6Amh
Subject: [Buildroot] [PATCH v1 2/2] package/newlib-bare-metal: replace fixup
 with tooldir config
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch removes the post install fixup now that newlib 4.5.0 supports a
configurable tooldir path using --with-tooldir config option.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/newlib-bare-metal/newlib-bare-metal.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index a3532f0b22..e28e7a717c 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -33,6 +33,7 @@ define NEWLIB_BARE_METAL_CONFIGURE_CMDS
 			--enable-newlib-io-float \
 			--enable-newlib-io-long-double \
 			--disable-multilib \
+			--with-tooldir=/usr \
 	)
 endef
 
@@ -45,12 +46,4 @@ define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
 		DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
 endef
 
-define NEWLIB_BARE_METAL_FIXUP
-	mv $(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/include \
-		$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/include
-	mv $(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/lib \
-		$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/lib
-endef
-NEWLIB_BARE_METAL_POST_INSTALL_STAGING_HOOKS += NEWLIB_BARE_METAL_FIXUP
-
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
