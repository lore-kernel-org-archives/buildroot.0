Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCB0C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 06:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ED2140104;
	Fri, 31 May 2024 06:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tz-GpQarGEvm; Fri, 31 May 2024 06:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97EE240AEA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97EE240AEA;
	Fri, 31 May 2024 06:44:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 826071D4EA9
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 06:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F22840104
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 06:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mh-IOAk53yw9 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 06:44:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::600;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E270340AEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E270340AEA
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E270340AEA
 for <buildroot@buildroot.org>; Fri, 31 May 2024 06:44:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1+kXmc/0xTOloHGmFqCQVYm9xI2CMwPgpOAkreoxnKGbXWXN/hauSjOcLhCLPh/KGFjGnJVhh478M7t9eAncYJAmJFRLPOr6OMNw9rDaZek3iciiFlYtPGoTatRYFsr867h3kJsFA4CoO9aj7FxpauvG7+RqS3sP+nGBgk8pS9Ttqqh5XXc+HbSayZ6/TZE9FPR/EJy3tOl7FxhxSdvG+PBqiMgBsrBlHtHxJT3yBsh9lIVlg7736N3k8aKsNbBGxljq4Ai3joVbQBMdudh93mqeUCziBNKVt47XlatOI6lH71NR0W56POyZsKv0/uBnbCxxb9itpKyzZxW+N23nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkHJcxfpBF1+IDGG6iqxw5/Ibzu/VXsv8adftkqDkhQ=;
 b=iItzzbRYMlkiRzYFkVtgJ9AFACPyf79nTrSYYApblSBhzpF3fE/cLCImDvCXT1RRw70t5Kcpm5AwMBj9mGWOf+/GetW3Jv/pjfHQzLwWl2tomgnOBJurTlAfIsMtcLWFBFEf8xi/E6Sp8VkUwZ1Ki3NeuhHGHveCuVsDNLHzhNfmIMJ+cGMJRhJ3NRou43AGBXltcFVBBFjA+HfySj/fMAF+zJ5E9dZ+LOKBwp13GElMwsxozGbqsUDXd/OBO5S4rRD8En814LGupwB0Dxykyif3+PfwoqxdROAWc5QYl7etU29ZnEfK9BEnrlYxS2eW8YirrH4NoQIW5JxwRHKA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:a03:505::24)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Fri, 31 May
 2024 06:44:03 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::c7) by SJ2PR07CA0022.outlook.office365.com
 (2603:10b6:a03:505::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24 via Frontend
 Transport; Fri, 31 May 2024 06:44:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 06:44:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 01:44:00 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 01:43:59 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 07:43:50 +0100
Message-ID: <20240531064350.3160453-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b91b1c-290c-4cf0-191c-08dc813d0f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h/4qfShzz7Fgzw6wYGe+xNaomEN9CBYyauV3Pb7kZueWL4f+IYloav9i3GiQ?=
 =?us-ascii?Q?E6njYk8scUUDAfn52Iv6m2Wv79kJ58wAqew35r1oQx94R0UEiu1ZBxc1fyLQ?=
 =?us-ascii?Q?v0KOvyemFx4zCxpghKCIJJFFpn0a8asf5F4y1vB7en4Rbq7fZbPzRC2YE1dR?=
 =?us-ascii?Q?XGpczcjcB7kFx01FNcGTSZadwS05MebxCVmHP5g3QplVqT3hf+J2HayFsf9u?=
 =?us-ascii?Q?XDbppLj8rgFQk9NsHcPX9SFR7QPvbsfvh0/DP4EKKWKGcOUCjlN7WV5dUWOj?=
 =?us-ascii?Q?J160OkUf8uAsvGPcGveKI8RTNFDMHhfic7BRXpVDA6wvVkYiJcM29VusNACK?=
 =?us-ascii?Q?F3vCDDEi/BJ2nAI/YPkccn0+QyuEWDTtcDImunxD31jBWoip4CYgTGw+HH4+?=
 =?us-ascii?Q?Pc2i70TD5jjhWkhhzI7z87fgZWbV8+C1aU9nLgQH3WKgjcQrzuF8qFn7vch7?=
 =?us-ascii?Q?dN1aVdcsJgNTkQBbJpzD3Pnlgbayl6kRbouq9lQcLDUt9mPBD53zPy+J/ebV?=
 =?us-ascii?Q?QZbQBG5LjJ8JVWpSOGLsBe0H3vcvwxGnHaCoKANz3BKrj5XY1WGxBDsgZA3f?=
 =?us-ascii?Q?/FlC1l5UsG6uPISvd/vYITBhmWfQB+nKC3DpGXBmhMGB8spoexhkAC+AlDu6?=
 =?us-ascii?Q?FrJrv7S84esH8jvvmReSQ+xH+RLhQzh55qOd1EjetAVtLgK1cgI3btxHXwJX?=
 =?us-ascii?Q?LzuuzPYNhET/D760XEMORUAuiUb0aXjGgHrOPVdfJuts/XyJEond/d3yc1Fj?=
 =?us-ascii?Q?PXs9BkMZKveeRjbbeA2kY9VCGAGYNI8IYgVoUkPyA6epTcP+QzezKRR7XRDf?=
 =?us-ascii?Q?p6RtUMxUKpkcO4dKr0yGPAB4LcCRkbkTMxKYtl+KXBmSMOMSYbOqafKSOTlC?=
 =?us-ascii?Q?xt3PkSbL4AYeuWz6rAiBTf8U8fWUJuepniBSVlx0SvJI6dAHcP6GGznPaCah?=
 =?us-ascii?Q?lT4Kib2q9GBrLp1TwuU+Geb7Id+ruvYLxlfQKfhRtihmGBZwd1T1GLpGh272?=
 =?us-ascii?Q?e052moWgExI/NxcC7vx24h3AKQ+FZlVeV2NEoj5jz5WmSDPQDLRoRUs6fYKS?=
 =?us-ascii?Q?F442cxT5jh881wwujyCdm4sjBautdcKy7LylHmUvUdaUlT39jIbaQkkeyDoO?=
 =?us-ascii?Q?HrtekeOlst7Mao/FdlfOozmZIdVD5alAKBNwDI5Xqi2EbdgZfBxIOXuE/aDi?=
 =?us-ascii?Q?azYUKGgnv85SlAbYmcXt06YFUNlkMUhjwEU1zCMjZoC3Y4+MRWnrkN+JE/cM?=
 =?us-ascii?Q?Z74P3mp3slN2gKajVaZj/HDIBThRbl4UePp+PCLqdUecvy5xeQ4AuzmcnayO?=
 =?us-ascii?Q?UgNrgWgWbC7tAqGSQC61nwXL5fc1WIz2fgufRFr5qc5f5tPl7OuO8PyluL4D?=
 =?us-ascii?Q?QKH6BAUv5FjxwlzuMNYLuc4lymMn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 06:44:02.7143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b91b1c-290c-4cf0-191c-08dc813d0f3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkHJcxfpBF1+IDGG6iqxw5/Ibzu/VXsv8adftkqDkhQ=;
 b=bUzgpKIMBKLTakUNCssuWzN369umxRVT3le9LQ/I/k0jgqLOqXkXesEv9FyrewPzstkOyGzrr+51OQpopF2IIkURNBv0J6aRtIFYmLjnpJP7rYHFvOqlfq0kH4lzi45KmjlI/deo7w/1pxW2iGCmNhxORgOMwtuIVgrjHtGmXWQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bUzgpKIM
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to xilinx_v2024.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump bootgen to xilinx_v2024.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/bootgen/bootgen.hash | 2 +-
 package/bootgen/bootgen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 6f34b2b850..506aae8a84 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aa8120369d8a6016c731a3338188045c82833602e8ea955b53130a16560e5eb3  bootgen-xilinx_v2023.2.tar.gz
+sha256  7879c7d40642bcf7adcec177a51cf73f95bd45d315f75d125d3fc1680c0a9b24  bootgen-xilinx_v2024.1.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 70338090f4..912e2e31b3 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2023.2
+BOOTGEN_VERSION = xilinx_v2024.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
