Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D61EC0218E
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 23:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8E282983;
	Sat, 25 Jan 2025 23:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-KsHSnziFoh; Sat, 25 Jan 2025 23:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CFB82A0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CFB82A0E;
	Sat, 25 Jan 2025 23:31:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDCAEA6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D04A40F9C
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6x7Z-ZiydtNi for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 23:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::62f;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78C7640FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78C7640FA0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78C7640FA0
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngzWdHhbqZY2bAWdYyo7UDBRosYOZEanfniUBnOhElw3yQKfEB3ohAapAe97o+HREWgqS9xnJII6cvNLeF9t3zXDdAAf3bvZGpqFbXLDtX77PTvwUdbSdmsfWbTD3kuONdYQjbFJmpuanQs1mCdh522v1kbBhW9pljTK0dis9uQYZQeaxbRrknkIiGfM+lPGFRlQg900UYI8jdb5WmDiNavUcKHQRY6C0/q8BZAWGTSl+kKdzuJk8FOov/Gm3JJx2L9JOgz3DrHk0CN4XYHPTeuCLgNGo5TKWVMW164d+1V/m2FyBZiG26DkAyF4X3GYYvUjJ8rspgEVoo4FjPRfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hP6/CJtGDBAvYm/Bp28/o58mVErPMOhH0HDuvfO83hg=;
 b=Tq+Tl9Hr4qBtu2bqNsGCPA1A14B9shIheFFj0y4ZkyhyG3yj1MhUxvhtrfTYVZBeVPUeYNjXe2qEYWtTyRv5rxBgynI3CZJYOFmIzqRddjlVIScAUmNIblF5ElebfL3GXd+VuaiefAFv3y/auPWkb6qnOE82GLbOhxBpvI8Z3ezRJRc+5b3gQeTIWijzIxRRYVYgZGrHl56IDO6ynoTRBmpzus/GEB5UX6KEgHzKYDIwdHmh8YgQNBx7ubU3KCYgYvdolE092wJkamJSQ8SYvQOs/mNzL8PoSghmsJV04rNedHwUHdccKtQrRIqFgXELdJKCKieMgk5slk6ZrYC47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::12)
 by BL4PR12MB9480.namprd12.prod.outlook.com (2603:10b6:208:58d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sat, 25 Jan
 2025 23:31:47 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::6b) by SJ0P220CA0005.outlook.office365.com
 (2603:10b6:a03:41b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Sat,
 25 Jan 2025 23:31:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 23:31:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 17:31:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 17:31:45 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 17:31:44 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 23:31:34 +0000
Message-ID: <20250125233134.78433-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250125233134.78433-1-neal.frager@amd.com>
References: <20250125233134.78433-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|BL4PR12MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbf7890-3d57-4cc5-a351-08dd3d986f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MTq4IqRDQjxExJSZy7QaWmAw+jgDDECFEFck3YVyjsasG9zjUMMSzTfbcJfj?=
 =?us-ascii?Q?i7dXI/lSZoPmGqO6LgGdBwGvqHRaFZbOvcuL4H66IjhRKTlqquBrjehHfnHZ?=
 =?us-ascii?Q?R+i47KC+bC1lICV0JsxqPcgJLSAKr/N34tpjq4p3QWs1eW726axRXQ9GbBE9?=
 =?us-ascii?Q?vkpmQbycGDjG8/4YOBvAmjyaV94OEIRpyU6KSye3ANJ2vhCE0XveNZmJBBKA?=
 =?us-ascii?Q?KlxTsD2cYZo21M5x29RNWpRaSWjS/KJRn04iqSTCM4os7f9LqncynKFeD/yt?=
 =?us-ascii?Q?LtoZohFCmj6WkPAQfxIEPmcPtswEzokQbfl2d27xm3SyXVmW9tlpFt6m4trA?=
 =?us-ascii?Q?VZC2wmXJmcEO5ZRt12BlxyWsL1G5mZ7W6VzcvPp3TuYbIA9cQNjObaKH6Uxv?=
 =?us-ascii?Q?UatffOfKSa9AQLcyEeT4pf//7rPj299Mnnu5nWtpav7p3VEUD+N91MvxxjrN?=
 =?us-ascii?Q?Otyf9M9TdI+5X8nhyJAZX4VBmkQytaQrurPsMr9BkZ2ReeVWZclLWmebFQP3?=
 =?us-ascii?Q?5H120QH/VyE7wAspzuvAHaV3PjXZrDuPK/6FRWuNhwlq0e46fAiXbpgmsowH?=
 =?us-ascii?Q?eDFveyz8832QkXABXjnhLSMMw6rqGubkMMVFQ/guNiR6ZH2UlWjpA4voaHKJ?=
 =?us-ascii?Q?a0KXKgwjkRxgeZxCbTa5uMFKLIGKT5mIdZ9tSntQiiKSRbfVZFjezRXDIB98?=
 =?us-ascii?Q?+oFvkPHErmSVYz0woYWt08oABEdfuGPbs3kgVrVQTHuhFIvz65561hSUBrPP?=
 =?us-ascii?Q?/XALtzL1FamIrvexOc1JG6WG1UF1RGtIq2PCpel50yMG4TF4T/rtvZmZDi66?=
 =?us-ascii?Q?kfYziI+aFiZfooKXf37Kw4oVMZ6JBvbkMK6tCBnJRBt9nCSndJuHPt1TezKB?=
 =?us-ascii?Q?Buyc+S3U24ryLhi6DwsDlLNtOjcgPpiwF2NrSYo1aquMIO9syP0lhwStximl?=
 =?us-ascii?Q?0Jz9AHHQxblgcKuM4zX/jI5Kw4AFBgQ8/gDzEv6SO0I1pMV/WW4iyVSbXoJf?=
 =?us-ascii?Q?Hd31U5PRbN/fGLIL0T5gYEr7WN8PRSLkIOINXoymw7soxHOzcsEdplRc/CNq?=
 =?us-ascii?Q?RECG85jesHQHdGRzHXDTXh18m+ZWucLY6aYFFgJYTNO+0mQsG5iWa4YoEIiE?=
 =?us-ascii?Q?pwtZHTvoZEcoWxm0JF9E6Ap0+RuO38UVpMSFDw3WqsxyycKsifGWMBHxJXK1?=
 =?us-ascii?Q?rtpfYf+8EmJKIGmG0PnhyWqASOnMVGXdkgV9WP8s8+I1xvnZnE3lZw3gsErY?=
 =?us-ascii?Q?U+a3/c6bjSt77yjyoNTGL5+ytGV2PtqR6sf1/8J33FD7PieLPqLxFNV5kdyR?=
 =?us-ascii?Q?1Sk1s6itkbfBM5SGglBIZISJc1GLmCdt9+/fsPRqvkztpD3y6PfxiOXamRgS?=
 =?us-ascii?Q?qe1VEbAIsowG5j4eMUlfhxl0PtrDqOSicDVt2GosJkg42xeEdscbGrG1Jmv3?=
 =?us-ascii?Q?/w3zhCqHbis5aUEOjonNgxmkx3SNcUbhljWdojW3trgv6PgQenELNp50w9JG?=
 =?us-ascii?Q?vOKWsbs2rpRwxaY/eGhXVWikixHr7wCsZxrD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 23:31:46.5418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbf7890-3d57-4cc5-a351-08dd3d986f3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9480
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hP6/CJtGDBAvYm/Bp28/o58mVErPMOhH0HDuvfO83hg=;
 b=YoVKaAhLYQTpdMQfEEJAWTWOWLG7fxUF+q97w3TzmCSxBccho1oeoWxhTa/PhnGBmuEofPH12OSiMaXvPLcq7mkSzethX9vviqRslawOQGy28KLIGnUgOef5ycU/pKQ4t+D8TaZlR+egS45sPuiY1kh0brvMHCkNsqMYAAlzTG8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YoVKaAhL
Subject: [Buildroot] [PATCH v2 2/2] package/newlib-bare-metal: replace fixup
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch removes the post install fixup now that newlib 4.5.0 supports a
configurable tooldir path using --with-tooldir config option.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
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
