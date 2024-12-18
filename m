Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583EDE77183
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 06:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECC79403BE;
	Wed, 18 Dec 2024 06:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIlGnr12cij3; Wed, 18 Dec 2024 06:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1B6403C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF1B6403C9;
	Wed, 18 Dec 2024 06:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 651CFCE
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 06:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C0C54056F
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 06:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACA6zfiFruDZ for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 06:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::61a;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CC5A4049C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC5A4049C
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::61a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CC5A4049C
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 06:52:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4i+dtKfb9iMmcmDiohwabGipCr3d0MkPg2DEGpvO0PtHg0GDYVU0xUKZIrvVmfwDU9x2ybUpsGSnlAs72pdgr/E+NqX/nHXwwfYTmZnLamL5GkNtQcI9ccMwlXSBNQHv+hhsl+6yE7FcKOQ7eHpVKpEHXhXmJmLnnpKcAm/fOk+40/bCXaN1aG9F17jxWMJTYLvTQVzqKc56Ry/TgeH0HsB15UyG2Hwe1qW3HQhxu6UPFfSNQWYLPmy/nIYW/3ngYYhiROOllzcEEzbkujen1y2m+leh9MEXFvpHJLmdGTyfu++OoU492eO1qtIUI0O1cMsWh5KV3NFJRFcBDn0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZucAzQVt7I8xEk0gvK6wqZH9UniOCSx1KsbWk0VFd0=;
 b=saXLXCO063AX+FxaEo9BCB/vn/gRFIS/Rcj/jujbSvsj53hb/PU1Zdtc/H9yrZqP5olDicUxnPEpz8f54Il8eiIop2SjwLpZg/a7FUaKhFw1tATpjkQZCxbGN9EqzpqfZ4QnURiGkSXv7aDNfgz9R+rBaxfkxdM+A3/3/6mQVOUZLTktq8zxcT4sdHkiZwt26cHqqj1cU1eLO49326T5IrGlY91ip9UY5YOdsTvQihe+6YBWtwzjBTQY5SVOywaZTiSEJqoepxDjHqPfFzAEGEnysfDbE1QZ/uZtjXIQSV/Ei25thhYxu3Mf15ZwOaaQyCuq7NOOplL1W4pn/4v7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7PR04CA0176.namprd04.prod.outlook.com (2603:10b6:806:125::31)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 06:52:44 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::db) by SN7PR04CA0176.outlook.office365.com
 (2603:10b6:806:125::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 06:52:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 06:52:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 00:52:43 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 00:52:42 -0600
To: <buildroot@buildroot.org>
Date: Wed, 18 Dec 2024 06:52:38 +0000
Message-ID: <20241218065239.503162-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a67e38d-b95a-4301-ab17-08dd1f3092e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cjae8l/2j7pd5aekz+I7EGdCh+LcYRWgBcacE/x7Ud/s/wjZ7lkS6eq4IpWE?=
 =?us-ascii?Q?BMykfVU36cmXUrYS7Paw9fF/e/2iu3HHAoXUPuYavOtWJwAdlVv0D/BIsFFe?=
 =?us-ascii?Q?4breE29Lf/pB5uhlh3rN6U7k3l+02X36cPnyr8FnzR5iVOSM4GR3wzqZeL+F?=
 =?us-ascii?Q?KLkc2OjyC/424M513yUri6jQ7lHhqiP6v5WVSTtT5+QpMChnZp2yGyGCcwMZ?=
 =?us-ascii?Q?cvCZHXeWemo5/sftCeR7keGBerOFda2MECfLAZkludG4ujISXRWpnIiOU8g3?=
 =?us-ascii?Q?ui//gBJxXPkSfAouQo4CO3F3E3UQfNJc+XF5PdXMn2ZiXbEngsQ7c14ZC//I?=
 =?us-ascii?Q?KVMSDWDxzJRJiL4gEOC7jyXJpOVgYEzbJiVq0I1kP5IIqecVoJU4vAEI+TPf?=
 =?us-ascii?Q?JHnzyGoswRbtIrtlMMfxScisEpTdPLytGZBCRN2lf76zgeOi9RiU40WQxWpO?=
 =?us-ascii?Q?MOF2bh6FPyPBk1pCyoXlzKZhzGpvKUwebZWJjLOIDTaisqb2eyAKeexEGiTr?=
 =?us-ascii?Q?pu1kwlyBX/cq7Y/f4cCNxWEXf+5ytI/Pl7/aLjzq+asQFba2TZgPRn/KaSlo?=
 =?us-ascii?Q?olzOttxjVoO5Pj0PL39LQ5al04LRi/9hQEyQI3fUtPsweSJpb1fcEMjjsVRL?=
 =?us-ascii?Q?0lszlDZMmlQacQ0zGfbSsHYXCvQunOLC2Vu1I9zG4Lo4aIL3hi28LKTAOzXM?=
 =?us-ascii?Q?gJImin1r/xL5wuV6NHm7jWZMSYHt8TUKoUbVWtUco2h0d1kOpjxsf+03MJ0o?=
 =?us-ascii?Q?dc9xx0NdYwIXmRO1fkcgFKSAeYnGm1t6kBNEOun/hj8OKvJSCoJlpl6NWtPn?=
 =?us-ascii?Q?tSY9mGc0ACtqwADjjiCQ9osM1UbqXqDgv3SUc9WFvQ5gEkRsYC3opAnii2L/?=
 =?us-ascii?Q?68Xl/eXGihZ6C0PhIrECuXeXbppn7PxVcgEU7IKuSzrde/5cONJV5evk+g8Q?=
 =?us-ascii?Q?L3o2Y5yFins66prdFiwfcTrVUFzjDP550jj2KKwotZIMy6x0BgPfRVAEHR/a?=
 =?us-ascii?Q?H/YG6EJ3bV2lAliyYrDgbwa+QRYoDlcMWHKCXapeoxMS6ot55y7j3tBAnCPq?=
 =?us-ascii?Q?kHJYWLf2IUF0lhWnSq/ZWuyukFaFOReJaOkUTEnhGFR5ipSJVF8m26kr92ik?=
 =?us-ascii?Q?avtTM8LCnel1hbuM9oe6kEAHoTU1l4wKDWeo/9hpuorm038RReVeZJ9nizKh?=
 =?us-ascii?Q?e9YKg75VqlazH5T/i0qK64Z1jYA9oRzIkbjhMjLpbmWcVEyQ2YYvmp5l2c5t?=
 =?us-ascii?Q?//fyQwPA//cTKZd0BKyr//LZLcROnkhdhLcrKeMdC8K1Xr15pT6ZuSlEVgWG?=
 =?us-ascii?Q?cKwn2Pqtc17nN2xM4OcTYMWq0O864/B6tM9YNvbsixsImF/a8OzlFN5jlyo9?=
 =?us-ascii?Q?2Qd4J5myA36s3JHJjcduEys14yukeP0YIq0EXQwG07aTUri3CRC0LEGWT2j5?=
 =?us-ascii?Q?rLQhz0ahMlxhDfhienWA2WrQkqJq6Y6nT4Rm9Rr1/VP1QQY1F6BAeLUl2/x6?=
 =?us-ascii?Q?r5G/4nwwrww0UqOg8mG6CdA3vNfdNYS2nzIc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 06:52:43.9310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a67e38d-b95a-4301-ab17-08dd1f3092e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZucAzQVt7I8xEk0gvK6wqZH9UniOCSx1KsbWk0VFd0=;
 b=bxeXlZzz7Hzqmri9+m+8nLulDUSjWnYXAp37x0XVVSidg6mON4UX7X6obyfuIvbzRy2SItpwVwR8WU4GldJ0BGygy8DEVHdMRmm0OKzTUgJZ4V+RWuS1z6CXHqy7/+GXeyOaeDnt6M5unmI7ccfBlyQmui5/bQY1szwSLqotTP0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bxeXlZzz
Subject: [Buildroot] [PATCH v1 1/2] boot/uboot: binman generates u-boot.itb
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
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using binman to generate u-boot images, there will no longer be a make
rule for generating files produced by binman.  However, these files will still
need to be installed to the output/images directory.

One such file is the u-boot.itb.  If the u-boot.itb is generated by binman,
then the file still needs to be copied, but without the make rule.

Here is an example of how binman generates the u-boot.itb:
https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d8faef648f..fd0323bb71 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -103,8 +103,10 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ITB),y)
 UBOOT_BINS += u-boot.itb
+ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 UBOOT_MAKE_TARGET += u-boot.itb
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
