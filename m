Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD56D68BDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 06:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A06AB60AA2;
	Thu, 18 Dec 2025 06:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fStNLwaWs3hW; Thu, 18 Dec 2025 06:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF55460BB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766040698;
	bh=Ws1HTXUtrcDDPEkrxOGihh7txSD9rAUfz/aJmKvKqSg=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AeHxIFOgTmjc4asJ3VeRrncO+sjCiPH9gdtL2F+u75ZlMWfu1kJBhNZKgnH567lVX
	 F6/uB+ef1FOC8jgm2apSTv1yun0QhPGY6QrBbOcJ0GtegfuKYLLtxpCIYlwEzrFSQc
	 4YyhrQVP3g5dpQy3eGs3ZC2G7q4uPvR74aMvtNxmD9XOFvBWWsAON5D65JO8bc9/ae
	 jJwV2W07vSPIaWj5TpJCdWLaSm8q3R6hJFQ9WaxGaStFpmkBFbuu+/ebb3PeklHAG5
	 5cm/IlX50Joc+rlpuDOuoghqMY1n6da2f3K8KAwItyAvpoFE+TekJxhLevNPm3UbKX
	 Xhnj3jHJFFBQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF55460BB6;
	Thu, 18 Dec 2025 06:51:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 340A71A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 06:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19D5760AA2
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 06:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLF0xtDSStio for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 06:51:36 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=s-sadik@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19E6B60680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E6B60680
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19E6B60680
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 06:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE8D+RzQnYYc7x4FJgdY4r4FB5DztZRIXN7HA0vBb3F9OkFQ3uxsZ9qkQp8474We4jWu5a7X7l8oN7v0hhwPu7dGr8i7AAfdWcHmV93hBjl0v4yan/CensRYPbYrWe8NDgjJOIypJzqDOvn81Zm1IpUAW9Yb6AaJji+ME8wrjBzTnF7p1uWWm/cu3W06eD5nNPc+D7yreJRi9juzJ9BZeftEpqQIPKiVhQvNhM4aQW2GO04rA3cp0DP0WzL7F+/jb3WoaeVGMRSoBNpCQfcgt+iBxkanpGENsJnrddIGJ4FhW7Lbjm155n9g4nH8k8lpJesvvzBoeaH3834eW1U2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl9sq8SJbYR/f9iQVCyLFOmTuKlRS5nbUJTFHE5/sms=;
 b=ceIz958ChC8eX8ko7EYqqbbw5ro4QrBSVcdUJ4e0x77u97P5v3RKWb3ieSSfjOV6ELUv1fIl5c7AuEQT+S4/wmlN1gkVe7euIh9lRgQ7tVVsGywkPqBldkiDnCS1kBOphn/Pr43+VDI7J9s0m/HGzzczACnaxuSG6tgjYoy4zOqnbLtlNNZaZws6m0gnjPYM+kRluXC05jT8oLqMgFYCrAtI+9SQXOQ6l6cRhN6TMb1L3VYiNhjH1Ov8tyFpoGeDPK3Cj1rFTSZnMjHpZKuDffdliaMAHOzUT1sP6XZtbIVgiJOXhmaI74nwT1t27BoR9TuP9J5MOjMYz7lzcjMFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from DM6PR14CA0041.namprd14.prod.outlook.com (2603:10b6:5:18f::18)
 by MN2PR10MB4159.namprd10.prod.outlook.com (2603:10b6:208:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 06:51:32 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::6f) by DM6PR14CA0041.outlook.office365.com
 (2603:10b6:5:18f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 06:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 06:51:31 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 00:51:27 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 00:51:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 00:51:27 -0600
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BI6pPVM2870693;
 Thu, 18 Dec 2025 00:51:25 -0600
To: <buildroot@buildroot.org>
CC: Bryan Brattlof <bb@ti.com>, <thomas.petazzoni@bootlin.com>, "Bajjuri
 Praneeth" <praneeth@ti.com>
Date: Thu, 18 Dec 2025 12:20:18 +0530
Message-ID: <20251218065017.1286139-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|MN2PR10MB4159:EE_
X-MS-Office365-Filtering-Correlation-Id: d117bf05-57d6-4570-2fe0-08de3e01e081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JrvTX1rKe/Z4mFlp+58CiqS4rPivT6nYukHsFU7Kxs0PqQug/srgFGYXjtJF?=
 =?us-ascii?Q?wJBC7IRt8zspIPzYWIcaCLIFGB9iLEix1MbO8dj3ebeRogGub6J18nEI40Hh?=
 =?us-ascii?Q?EWDj4kdR86vP4s523BI7+qJ7lDLuKpFFANaG6er5K3Ip0vn4RT8+747H+UgQ?=
 =?us-ascii?Q?Qed/M6LAq2AQKJe/5MssImJhg9Q51LhtrnZMHqVPQ6sVWXW66mcOzwATImBd?=
 =?us-ascii?Q?+slaYNn70TOBnbmeWMVHj7HtxcthMkRke3sbYIWH10b6IhQgci+VbXmmvSRn?=
 =?us-ascii?Q?6FVBPbJrfEDwOYGA3prN1nvC3VWss1fzgPQqI0VMv1Km+YcZYJy/mmgEVPen?=
 =?us-ascii?Q?HDAGPiYT4/xrLTi/jos6+ODyMA/bXVFcdEUZoH8YZy1aqQrHYyaeThHZ9Biy?=
 =?us-ascii?Q?rZANTqPKDtcLlmOHBugcbNzp95pToz3FGCBvgjoErZI/ntvIX4G5NY9PGV3p?=
 =?us-ascii?Q?YXWxbBjyqkTxP+X5pru0nG+q2ayhtNboWFCSjEV44VZLbbYTHqHVxkUeSgcp?=
 =?us-ascii?Q?ZAn/WM48gpk5JqEugmJSMWB6OzHzmqJ6jOuctFGxJMENsTpuzDGvbsD8Weth?=
 =?us-ascii?Q?n6Wt1dcMTiDpm1nWpGqvqcbz8Xu53rqVXI7wKbrP/TX54SMWIOb99yhfnXqr?=
 =?us-ascii?Q?wift1KAzp6hriSuRFq8EVhDeUr/yPCH4l9SDaSVWXRqHJmnYNzq81vgV3edQ?=
 =?us-ascii?Q?za2MClLcv929rDoNjw648KF+mnsySEzix/myaRasT+J7A3cG1XcoLmb7iSsY?=
 =?us-ascii?Q?RqaQX1wXR/lQxhw37ILRy97nNoYbl6ShZUd7V1K+/msjFviHeEU0+DBbXl23?=
 =?us-ascii?Q?cKjfvtKJUcdg9gQokw9nvYTNsB0Rv47POylxH3sK+mNJU3TZ5gc2gKqPA17k?=
 =?us-ascii?Q?iParV9ktwimWvdx7CBP29FQx3vPEC+K3F2F+XyHWbWAGve7kvjAmyYFl0qB/?=
 =?us-ascii?Q?vNjP8PbPxFztxPPTHsmWHtSH/qDeOsUFXEKkY3hlTMqEHeoSVhCoEzxL8piq?=
 =?us-ascii?Q?arH68vfERrlJrzZ27gk+7JugoZdN+/D5wKBxGAO67++bSqtibt2XpiDHZoNs?=
 =?us-ascii?Q?sMfFDihXRir4s1ufJVv0JBepg1PxcuDKNwAZRC3+IHAaSwRfK7KY8HKmeJMv?=
 =?us-ascii?Q?D82QZcqippfXGid9BCDgYNy2KQzF1KwEvyQ7B7f+Ok4wmwsDR9n5qbPNB5ky?=
 =?us-ascii?Q?LrhpyYmydP6UbBRGx4PlnxMiID8kfECSC4eP5PyAd0qjcAZlqYu0XtgngJs6?=
 =?us-ascii?Q?TiFJMI/JS9VpGPK8/8Vbr2Bb1iEcjNbMHg7oor/IJOdFS4rXFo4DTASNi79v?=
 =?us-ascii?Q?yd6SIHCJPgb3m0hbQLtjyWZ5/0pbvKsnea+CEM5DG9zhIjYpsB6GdCtXbhU6?=
 =?us-ascii?Q?VwMZO3Rtsy+zBTi3IzBfhulPTNp/fjG9SzGK6BtubCexstNdzNc2CnM5qZ24?=
 =?us-ascii?Q?ZC3lvkiuiJ7GLD8bnsCSF6QQNLlK342qNdjNUW6254R5BGJ5BPVNILFtJsHf?=
 =?us-ascii?Q?a8wFdkzbD33cp7qzubL+sUFpZPq7lLqwV2LOA+yuFTJf7YwQSEMOFP0r0ZVk?=
 =?us-ascii?Q?BJaIL9m3Xjy1HbT7O08=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:51:31.4953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d117bf05-57d6-4570-2fe0-08de3e01e081
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4159
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl9sq8SJbYR/f9iQVCyLFOmTuKlRS5nbUJTFHE5/sms=;
 b=S8bFG/7/uug5qwf72+tgtKGns8BuuNiONeqxktUcT5r2/ZFwInrd+pD1OKV/2hqY7VVMQ0jNDCkPSG7PUzTPgA2HN2Sn5jlTMAaRMrwJR4XCmt+zWheJosZ8W1b5mBV4Fa1pTqL0EEU1XJHn6jaZ4UlwIYxj3VCqx++PvMnUdoA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=S8bFG/7/
Subject: [Buildroot] [V2] package/k3conf: new package
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
From: Mohammed Sadik Shaik via buildroot <buildroot@buildroot.org>
Reply-To: Mohammed Sadik Shaik <s-sadik@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

K3CONF is a Linux user-space standalone application
designed to provide a quick'n easy way to dynamically
diagnose Texas Instruments' K3 architecture based
processors. K3CONF is intended to provide similar
experience to that of OMAPCONF that runs on legacy TI platforms.

K3CONF currently supports Texas Instruments AM654, J721E, J7200, 
AM64x,AM62x,J721S2,J784S4,J722S, AM62Ax, AM62Px, and AM62Lx devices.
Along with the BeagleBoard variants of the above mentioned TI SOC's.

Signed-off-by: Mohammed Sadik Shaik <s-sadik@ti.com>
---
v1 -> v2:
 -Fixed indentation issues
 -updated the config.in help text with upstream link
 -Include hash for LICENSE
 -Kernel dependency: Added K3CONF_LINUX_CONFIG_FIXUPS for CONFIG_DEVMEM
 -modify author initials with Full name

Link to v1:https://patchwork.ozlabs.org/project/buildroot/patch/20251215132425.136858-1-s-sadik@ti.com/
---

 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/k3conf/Config.in   |  6 ++++++
 package/k3conf/k3conf.hash |  3 +++
 package/k3conf/k3conf.mk   | 17 +++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/k3conf/Config.in
 create mode 100644 package/k3conf/k3conf.hash
 create mode 100644 package/k3conf/k3conf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..a32c98e5c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2471,6 +2471,9 @@ F:	package/libfribidi/
 N:	Mircea Gliga <gliga.mircea@gmail.com>
 F:	package/mbuffer/
 
+N:	Mohammed Sadik Shaik <s-sadik@ti.com>
+F:	package/k3conf/
+
 N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
diff --git a/package/Config.in b/package/Config.in
index 22970b4d45..a0aa112070 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -110,6 +110,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/google-breakpad/Config.in"
 	source "package/hyperfine/Config.in"
 	source "package/iozone/Config.in"
+	source "package/k3conf/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
 	source "package/kmemd/Config.in"
diff --git a/package/k3conf/Config.in b/package/k3conf/Config.in
new file mode 100644
index 0000000000..6146a5413b
--- /dev/null
+++ b/package/k3conf/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_K3CONF
+	bool "k3conf"
+	help
+	  A Powerful Diagnostic Tool for Texas Instruments K3 based
+	  Processors.
+	  https://git.ti.com/cgit/k3conf/k3conf
diff --git a/package/k3conf/k3conf.hash b/package/k3conf/k3conf.hash
new file mode 100644
index 0000000000..2c8d4ef664
--- /dev/null
+++ b/package/k3conf/k3conf.hash
@@ -0,0 +1,3 @@
+# Locally calculated sha256sum
+sha256  a3459f80e7af5672da6b41bc0814114690dd549aac4cf81ba4e5dc84d42ab9c6  k3conf-v0.4-git4.tar.gz
+sha256  f962a0a4912aeae2d6f2f6e07bc3f79f7f1df9d4bf1abfb5c421b9b14352bfaf  LICENSE
diff --git a/package/k3conf/k3conf.mk b/package/k3conf/k3conf.mk
new file mode 100644
index 0000000000..da21fcccbb
--- /dev/null
+++ b/package/k3conf/k3conf.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# k3conf
+#
+################################################################################
+
+K3CONF_VERSION = v0.4
+K3CONF_SITE = https://git.ti.com/git/k3conf/k3conf.git
+K3CONF_SITE_METHOD = git
+K3CONF_LICENSE = BSD-3-Clause
+K3CONF_LICENSE_FILES = LICENSE
+
+define K3CONF_LINUX_CONFIG_FIXUPS
+        $(call KCONFIG_ENABLE_OPT,CONFIG_DEVMEM)
+endef
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
