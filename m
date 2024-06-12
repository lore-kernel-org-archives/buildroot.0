Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D91C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 07:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7E382259;
	Wed, 12 Jun 2024 07:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdjT1Wml4Ff9; Wed, 12 Jun 2024 07:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0D268221D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D268221D;
	Wed, 12 Jun 2024 07:56:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FBF81BF3A1
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BFF740522
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl1XC6t-rJLI for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 07:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::600;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85C7040506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C7040506
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85C7040506
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 07:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5EelhjcSSKsy84IZ6rI5D5tsHM7u5BMwZbQ6hXG5btxkFEo79MUmZWv6OGUFgPHswuZXlL94cd2R1rHud+FZzIo6IOEsPKggipggAFqRtzhXXXonqqZa3nmyzkVd6JNUBhnYd3aeOrUnZTPfZc4aV7otoe4WT6egGaF0+F6lGLNvWsvYhdSC/wobs8fFKuKSJ/HwKq5OcQ5fBWSy+JNXrPE0Q4NNPY3Hj8tpcRqfGwEznNfiVJKF5CPsRJOgsOaSRmu0N6fOvaOr6K6SOCeg7JnKhuVt+AbgXo/sdGXVrHRRG/KEWtBH6g1O+3k0NRL/tEobFt3pFafSXqDjdiaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTBkcva/1Cb4lB2HvUAvf8KXHcRiXXA/Gdd5nQ+SJ+o=;
 b=VZtnON51hGabXHkSpDBC503np7NIwz8mzyMSSk/vwnjWYFfV/8yWay/glfQA/vxA3wZPJUcFqOmHnw8vNG6diJKQni1PGVmjjB5vBQgwqQafbUzDGh5kQkHK+vh3SsPDb4rSS4ToU41Dk4CS3NUPNnm0vH7nbmLj2vF0op35ssoNM/D6PMJtVa4DV/ZdfyRtzv1S9Do80av5aiMfpQAGxoAnRmHVNhTq0umYvk1vzIXD7gX8E3SKkqDHTDEnbKVZJ/hqlfOouRsm0H5Ole5OQfSGgdDeZWAPOiID0u3jzwB8T8qrHnm7QbCBRCjkmn5DUhkrjo44aAl7R5GmnZOQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH3PEPF0000409F.namprd05.prod.outlook.com (2603:10b6:518:1::4f)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 07:56:11 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2a01:111:f403:f913::) by PH3PEPF0000409F.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.19 via Frontend
 Transport; Wed, 12 Jun 2024 07:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 07:56:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:09 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Jun 2024 02:56:09 -0500
To: <buildroot@buildroot.org>
Date: Wed, 12 Jun 2024 08:55:57 +0100
Message-ID: <20240612075559.436482-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612075559.436482-1-neal.frager@amd.com>
References: <20240612075559.436482-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb5b78e-386a-4338-3f4c-08dc8ab5200f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230032|82310400018|36860700005|376006|1800799016|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UXOd+9ZR0qXyZnnkBHmVpswrBkCvrcJQFM9lwIPPFm6NS8THTPlojc5sPsTs?=
 =?us-ascii?Q?JoV3yYbNmVhajTJeEsgSXuEECgN0OvSaWgQnRcJ1nu8EsjFoyqigF7zpoI2d?=
 =?us-ascii?Q?mX0wUkBQBQujBZgFWFjbRk+WAJO1V8APlo2u+nc8OIUGnpIuhJ7AAmauSxIy?=
 =?us-ascii?Q?0cvT8muvUBlzE9tDMBVaX5LOhzAgAPNrtJD2rV47HK6vHclur4IxnCVeJrOW?=
 =?us-ascii?Q?KmG+AbWRGVDfaArTWLqIs1zYeK8ZPMUsgaGiDMOl82D7Cp7ZfqxeUmYCG5rV?=
 =?us-ascii?Q?FPrwNiRHKITMjJVuOIZ/w4BimPdtxkFm7yoEDVdliSWTtAT79rgXrEOO+H02?=
 =?us-ascii?Q?hqkbPFXifNl5pNTOEYJSL2CUpzC5Q7bRxBRIpycBaVQVkFtpBbeDUDFz3sX6?=
 =?us-ascii?Q?9ehYC1M0ZaBwSjOvuyyg+sz27zVJ1HSQGpMw3rNEhNyJScR3FgXWdANqOtJ+?=
 =?us-ascii?Q?qGsrNtFO4IyAWpThtGVtrh3OHISib3jgyY/PPbMbVPL+++Qv5QVazEkR8DYc?=
 =?us-ascii?Q?xJZ6twtC1yATZJinJWp0wXzZsSLmdFQCVHNMvsmid64ZxhajhxvcIguAA4IY?=
 =?us-ascii?Q?tn9zdoZOGs609pZFKXfUB+NbLAm0ZkmwQs5ADbAj4kls8DxvSU7sPwIEyB5U?=
 =?us-ascii?Q?1duGsBABdS6wyVswG6KGXzSm4VTv31ECw9DqJ44V5easNNomFSLHsJq+Up7A?=
 =?us-ascii?Q?9jPWECbNUCSmYHJ0ihqddw4nWZJwthCD4IRDy91qv0440p82jhmiZjNPbnF7?=
 =?us-ascii?Q?LQJJGHdPWgnIzBjS0jB+3QZqH7sheaR1KA8YTbkR+GUR4yV/53K/U6GetyBr?=
 =?us-ascii?Q?ojhCE7EzlOxlnurd2gBpIWME2/3gDaQ1vt4URhYji8E/yMSnibhrJV/cD5DW?=
 =?us-ascii?Q?DRI247IIsZpkWikikaegchbcZpOOJH8QcDvanaU2nz1RR+KhzTbOcRqRDdBy?=
 =?us-ascii?Q?TRKvBDY3zOkf2f+8b8GXTB1OpcfCMkHuLshcKbtf7KdGqmrHOsmleCFFlZeu?=
 =?us-ascii?Q?NbEH9f3uH8C3TdqDkroxK69utHGzFmi+ldPT90WYZaiO8YwS0ri0qfgpyzui?=
 =?us-ascii?Q?8I/5GJjoON/XP3J9qNNX1KPPDHBHCBkPfiy3AT71JGktHFd+5xtHuqoA42Vt?=
 =?us-ascii?Q?S4NWf5J3XpmqjIVuiah9IOMRXy+iHaHSC/4Gi2zxwM6isyc9Qc9t7P8XzX/V?=
 =?us-ascii?Q?g6e1FY6iExeJtzug0teOladx/yZr2fKXZohd7X0ybyfLv8GG/CCbVZ5gcS+J?=
 =?us-ascii?Q?ZlEf7hDVG5uuP9UpGQOGFrtcNm/2bEml4Lt6hTwRCmmYqdRXAw1lcOMYK848?=
 =?us-ascii?Q?U3vc01FBoPWiwoaDcYs/48uzjrKES32D/i2D0UkDQIbz1MWOmk7x037okiiM?=
 =?us-ascii?Q?x80UV+wc2BDfxGfUd7H0+C08LHdUdndjueZuojMLUWclQ4Gt6eLGdLRlMymC?=
 =?us-ascii?Q?5gQ4K8PsjSRzTiC+pHLbC+WCoEE4Mkjb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230032)(82310400018)(36860700005)(376006)(1800799016)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 07:56:10.8695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb5b78e-386a-4338-3f4c-08dc8ab5200f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTBkcva/1Cb4lB2HvUAvf8KXHcRiXXA/Gdd5nQ+SJ+o=;
 b=v6CwzGOuNmVAu20TIgUZf20ONfN2a5pISuDpOiov9W7+qMEcxX/FnIiZT8BsXax+epHhpF0p6b4H4BNVeSTrWMRlLC/G58Sy7c8XHwxrhq8eLlTUdhTuiKCVy8HaE//qlI1jCq7WeQyP+RBp25hDwRc6kh7YNMtY4o9orNrIfO8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=v6CwzGOu
Subject: [Buildroot] [PATCH v1 4/5] configs/versal_vck190_defconfig: migrate
 to xilinx-prebuilt
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate versal_vck190_defconfig to xilinx-prebuilt.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 69272e721c..ef5c0a4929 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,9 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2024.1"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="vck190"
+BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
