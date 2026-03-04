Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151B0EF8FE6
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 13:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1535440871;
	Wed,  4 Mar 2026 13:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JI_-8cfvBjyH; Wed,  4 Mar 2026 13:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E22340869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772631181;
	bh=/0UWsAwc3Sie8UtVHc5DpRHfo1MwJLI+maRSLmSDkio=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=deSb5d83W4HxHmolA299JpmVjwd3A9X/rVKukpml+EtZqiWqzag2mnK0GpMx3I6mB
	 ASzZJyJdPeTd1CiOe+RwUTVpDFQheeNcxj3A9sMX+6eyQVWxJ/aZ+oCQC1fFlEUzox
	 q8VOKXug6DgmIPSCXRqx/1RprD5Qnj0fo/mSTJ2SzJRn4sRjdr7p1JvBIz4XNo4Yu5
	 +kQKlvUksrcVIth+1SAsIZSSi8JoeVfLth02/1SFhzvHtMOPwO7PfbT5YbWjQ5XBNo
	 TfvJsYWxgRJUyxRpqKlvpjaIGtPl1fmp6mrfx5fz2Os7tcsg4KFw0H0+X0rKP9m/Fj
	 ZFWha0brwHu0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E22340869;
	Wed,  4 Mar 2026 13:33:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11BD31EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB665403E7
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qv2qQ8jBSwyY for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 13:32:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2EE9E403B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE9E403B8
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EE9E403B8
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvjuhoWPcO39MJS0JSjZphJt3nIG0/ppLM+afiyh0220UwatneC54eB3NrY4qXOyrMYt9pVDL7gXGc/NXDvAAL+zlN2PVKC8LnVGv0nlZ0dKRhbNeUBpR0P0dm06Ewos3VD3RoWpt9qDoNlWyXFThDDASHctk19Iuk9cC7xajDGtlQIkOcRXVNUNdkR8Aj0Vhc3WWZa4e+4frD33pRnQ9VcfjE8dG8dQqjy4aVkPJqJTCzw8Y5wQzMQMNxswU/CB/qApR4APB4HRllxkaANUNYG64PWvjiA36mAzSPYGZU1dDKa9gi35LZTXWWUvrM0C8Qg5azJkbKH+U6q3QVO0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+SIK75PNYeYZd2A/vVK14z8lz1BIQjmxHbpHzazEFM=;
 b=MpUPsi8MjKYxor/U8hL7kqmKCEQPDWoesS8Ux1MZGf8HHmJWWQK2L5q/zhlNYsbN++Tg01i4wTy8i4unqFaE4ib886eJUGQFaP4TJaV5NhrzNO2OuC7o4U70pRMBDxsllPsq9ZDTApEJAHb4h+RE2yHANuykUlJCpruXS+nppLmy+1kPzuEB+GjnZVp02EUKSltxT6W1Vd4gp9QRltsnEjOVQrN6KP8lqZ2CaD7IR3IR4FkXFDubt7s9+9cSgIKbV1RswjCxOE3oG7QdrB1++PK8AMe5bQHTIh6ZmJF8oalFagGBBUZ0PUAjEH4nSlpmZj0I5nvL36s0tL8NIBHq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::31)
 by SJ2PR12MB9139.namprd12.prod.outlook.com (2603:10b6:a03:564::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 13:32:53 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::9d) by SN7P222CA0023.outlook.office365.com
 (2603:10b6:806:124::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 13:32:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 13:32:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 07:32:50 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 07:32:48 -0600
To: <buildroot@buildroot.org>
Date: Wed, 4 Mar 2026 13:32:39 +0000
Message-ID: <20260304133241.3389941-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SJ2PR12MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 77893d75-f1e3-4115-6df7-08de79f2890d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: JRaG82khGbfwehRyTrC/VRGDzVkgoG5tytvlW2JKXYN+/kkrGigDKhgksZE56fALjKHN6KqlHPYaJ4p4+s9tTM+4ZuxwdIuiiVK04yYjyr0LH/pb55zlDT+kPHdyXbAJYmQ1REcnYDvp6k56PAY/ja7AaArWoa9SL+qEMWMJ5b3EmtO30vGf9OAS08UuzkVof6oVb2UcojhJhc+/lcIZcS4aFSNUGtPA6dzEvPZZiqtvpyvh46fC7ziDEQoRvNdsqup3KlQUjx4OCRjHXrlDv/86m+F3yCSBMR6rkiU2b9XmEAJpMba4FDYJ0HKNuNuTkUrs7c9lHBKUULzqRZeZzb/3ZKu9IE89n56ijLQaBDFE9S1SFRIy1QUesyOea6eZqmNCLgL80OdR2VpQgKY5UiGqOhyjgTIgaAJhiVrtPkICf1GkYdX2935iXG3G14HyAKYgngZ1wJCfa+jXVQbyuD+eRqYBH2XXCnVLNWRoVuNsWGvVShMr1QLEC1IplwNSsA1WonGIdT0B3+SXxH/vMCp9dMXb8hjLDIXPNkTvQnklVgFOrkh8px3kK5DbTQCxTGFf01qQVn86dfFsO+O95wmK5AuBSztj2Ug6ZjemKT9YT594SLRyrvrGZ0HEH2N5EE9aLrGyv4UKDa6DMR9jx8lhrFCeocqxXLXybmvTMHg+FWOdZIDUEGk4P0SHd+GbB6sflGzGmscpDwr0uo1EMybQvvYYlDmDzrx19LKcaA3L8+uQyxv0bPuQbH/njXmNhyd+tl7dcd3Na/qsmflnYqyca9q8u39nbBmmiZgbE4VwJ3wNcwJvah5itm7h7oRVkP4S6vNhWjrq5TAqrov52g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A22mMhRqVCmLchWmKFwyDPWxf4zXDoefMBxcO63F34EZmNgAPbW7C2jgWJvMCKBcI8hZ8dLmEtHW+w1cFHA772bI0R3ENU7u0BRQjsbEfK3g2BzxmQeGXcrDyXoeMPRQ8DyfqToNeTqE27d5RpfUX8AANEBUKzndtQKUFTcgVqr7rBLwVq/Lfa8rqLWhN/N1WpdSo/vmic6HAeYh/SVcVYMjtyfkSVK5WNVxK7JKv+BM/u75CMZnGUtB8Y3LIF7tIaRdVHjk3S01bYfeApqGe/cL8aodMTIkd2mSHt4BKUmGCWUtnagCTPUlMEeUEZADLxSUKRM1YjmiL7qzfTLeeKi/HI09kNKdWFvIDsUF+i8asomrzlrcYI9qwF/LZ8ucb/M7Hz0bmQpoO/bPFyooNtyHlUiJReUmrMU5O1bRCl7dTckS7sNDg9+HOyfJWyFw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:32:52.0977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77893d75-f1e3-4115-6df7-08de79f2890d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9139
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+SIK75PNYeYZd2A/vVK14z8lz1BIQjmxHbpHzazEFM=;
 b=i86LPy2irwWTxEYfQrwfRCIgs21RuYBn1lIfHJxjD+VD7wZajl6EZMfuDMLEn+7Ebutlbbv4jjrV/zcvhkXfAX6mqs2CLsd6fka0RWajF5xrWPHdgakLONIGIPPKHS5xAR3IxEyvKHZwRymFXTl856mefs5lWUw6/ASxl2kG1Vs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=i86LPy2i
Subject: [Buildroot] [PATCH v2 1/3] linux/linux.mk: export LINUX_DTBS
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Users of the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config for custom hardware may
wish to have the dtb filenames for use in their post-build scripts. Since the
BR2_LINUX_KERNEL_CUSTOM_DTS_DIR only specifies paths to custom dts files, the
actual filenames are not available for any post-build scripting.

By exporting the LINUX_DTBS variable, users will have a list of all the built
dtb filenames that are built and installed, and they can use this for
convenient post-build scripting.

Even if users are working with an evaluation board with an intree dts, the
LINUX_DTBS variable will still give them a list of all built DTBs, so the
same post-build scripts which work for custom hardware will also work for
evaluation boards with intree dts files.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..6ef9f54ffc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -226,6 +226,9 @@ endef
 endif
 
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
+# Post-build scripts may need to reference the LINUX_DTBS,
+# so export it so it is easier to use
+export LINUX_DTBS
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
