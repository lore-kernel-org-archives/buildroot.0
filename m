Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33DFF30928
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 10:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FAEC812BF;
	Thu,  5 Mar 2026 10:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqH18wm6fVca; Thu,  5 Mar 2026 10:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CEA5811F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772705838;
	bh=5JFuOnNFKq5D1L2V/TchA1tjOGuLJ02WmizWV68naeI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=S22OPc6kSzPLth84sMTkYvUmRAKfH3cpEaGkMMIZOGhFFCV5kZWQ64vDnl4WCtX+Y
	 WY5nK9ouOiD7c74ElCXDQzNG1RcA7NDAUPU4JssbnpCrywrpxGenNXaUrXkrMZUGBf
	 CKOKbRR1BcYZBgJPk4AiuJVH3SDA75i8+dUtdn5LLWiqkw6ZH+14OSf2RBsEtTdIpa
	 MOS82+2wnRC1jwK5iBq5ehA9hvOUzYrkNNFLGn6iTnYWtmbxMiTbMomXi7nSkJtZ2E
	 ZHjFfgWYWExFbVX8+QZqCsTTlF8rpUSLf4Zrw96v7e9mLEKvy1Kfu4d479FoxYmCZ4
	 ZAvb7CyAvdijA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CEA5811F7;
	Thu,  5 Mar 2026 10:17:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F29F91EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E491160B04
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfplGcbqBVQo for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 10:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39D8C60AE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D8C60AE3
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39D8C60AE3
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:17:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Capl2NGhzWbw3UAvmaFLqq6tg7ed95sdNXzGDs+c/H9SVFS201Y3J4vtq8S60OR/X36jo8WaO1Dv3X7FmxIGl4O/mzA7cbVtpKUOgECzMgNraGDxNcmB205W+n5AEzlXDygG8VQV2OfrxMYZYViCjebGQkBY3gSGlKRbooeDyBdYpEGjzd+ipCbUy4P6JpHivwXklJZ+apKUwpMO0nOvBUfvw3gLp8HofkKkmv2dleUbKsnear9ameCYdirPtv7MXjeLj5xtksc0Bh0fpUvxRMzIJocyye2/MFHkReLjoTTQ0B31Vszs1ECd4lAC3qKxVdOPTvM/sPv0YISJWbmyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trw1pdB7aRjURd47Y+6elmKUo48Bn/BXbthiIfKFnlc=;
 b=VSQcFf8nX4oV/+8aSVZDVsmhZ2P5NpeCqmTxiLpslONy/3cN+sUb1evK83w4GpG3nF375bUIs0TfZ7FjT6czqXfl9MqiIir9DyZTdxqlX+lZGWfox9KTb4B2jJltT/LNWZ6H7J4YFt6yl6zzTh6YlQ6oanBJs4U8GYY9MKDOb8TSBpTPfRX5iCT+3J/g680IKbK0/0wRTQaXtXonm5T33HsCIaseZHER10l6d+N615lj99QJkVp0bXzmlpeQs+cuKjTFpNYkSKRBPA+lde6LHhXyO5702NatT0NVdvZuFASYFfv2U6Ub+VVTf4A49Nrd85YrE33fFiYAqQ1NLeC3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from IA4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::10)
 by IA0PR12MB8974.namprd12.prod.outlook.com (2603:10b6:208:488::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 5 Mar
 2026 10:17:09 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:559:cafe::40) by IA4P221CA0005.outlook.office365.com
 (2603:10b6:208:559::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 10:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 10:17:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 04:17:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Mar 2026 04:17:06 -0600
To: <buildroot@buildroot.org>
Date: Thu, 5 Mar 2026 10:17:02 +0000
Message-ID: <20260305101702.924587-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260305101702.924587-1-neal.frager@amd.com>
References: <20260305101702.924587-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA0PR12MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: b863ecee-029a-4b91-daca-08de7aa05b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: LX4kh0ge6w8hQT3s1SOOiCveUO8FXIiJP1Mvdhoq6UDZuP3z4LWfwLrCHteVBmiGwzax+/CLNDt3gK2MtF/OjhyfsNCMiwFPpKvmeIb/OVP3/ONH6bXQFSUmRdsGH8F7F+8wF30Ae2OL+hnj1Km/kvGxbAnlsI3G/Bjp+EAQfCyXjnuAvlfETI4ETWIEwCZEB3BJbG8xoQH/M/VPnE8bc/wbff2RS7mdAiu5pLb7e44XM0/81tWyUg2XS7fZbLFwB4NJDiY6bgDqf9uZzGzZXoZlky2ew6mzG6wvWXzreSOy9At7H4hSUglnOA+AdZJDLsBmX0XrdO6Yo1YapGqyhzYIgok2kTOHoYElzLY7dmwBWwB/srGoE4FCoUcRTLzjoGf6tQzBfhgOG88fYIU/Rierqv9mVcQgya0HB3Qf73HZt4rSaiske5Z4bXKQosfbOz9LqEbCsi5J4wAAFo7a08TAacFmvpl9eI41qUMQWYKlQiq8tnWfOIt8i64KSXeMGF5ydtPoblR7BDfvLQkuQ8Us0wawlNjOwtShAeW1gIyFsktGhSOewyeckq4edap7OvJrBS8BvU+aWiiY3woO5pd8WAjQqyWH6OmWkbWu4ffaRWaI0MrU9TfrreAY44khWr15nvUs2GQHpGLNLrOOTBHAhhYcCzni5aLcCN/hJTUID7gdyTV/jNx9gru8ZzI4OUDl2EaIUB960so+EQ/7fdUEbZseb5/7gyQK+xpLkN97iqMuy+hPsfo0IFK7Xt37U/cLt0p/2jsj97e8vBFo6u6NShHzZtsyXu6EbLB/MJkbRfTEcVYqMv1W4h6o+5CLrCtnugSA0YmofTwQfI4crQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ztNP9Pq02Hc62TrW59rzk0rjkp94TTBMYC6TxHWJ5SDSUIzMgOAwIHle/2w0HtM7AaL0tHvHHAYjC9ubDVCCYkI0Y+LcrDbeCyetU/m+8fcUEfTuqSW+jxegyCTIwcXqf3niAZfeoyPRcKLM39eDSb+BcgKlezmF+Ty0pvAc2yPpQruzNXSnBTyUFbd/zKYzKB1j1H3lyFtPSYYXF3Asii9vNqCdliXgWf4+O48CvMJHQCCaDVQ9LsH/9+6aEJeyIlIyNbElKsTnfQzW6rTwQ3HN6rGmvKpNMr4SyTo5VATB+cOwJszTBURRrtHZcsUddu+wde267xMcdlyJk6Qau5K0FGXjt9dprEVSTQ/LQFN5DDv/Ka/6SPQRTBnO3qUsACYbdwzPTHZJSioituPoAgfBUpGTvt5Yssg+AiqcR10p/1eQkcgTAq5QXNke8rN2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:17:08.1672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b863ecee-029a-4b91-daca-08de7aa05b86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8974
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trw1pdB7aRjURd47Y+6elmKUo48Bn/BXbthiIfKFnlc=;
 b=NwvLXPDrzyDMRSAWmJrPmI2/mwqWLWt0xtqzN67jtdkq25tfk8aOdZHoTuvUFNGDGuswL1g0VnCUSXGiQUmggthNQJvLnG+GqsXmNwlz3Wkqdm/0xspZlF1a+uVIVBVQh8RjczqaMrVwrV4Kfn3nr8L3iD0k6DssD0EZVMzbM1c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NwvLXPDr
Subject: [Buildroot] [PATCH v4 2/2] board/versal/post-image.sh: use
 LINUX_DTBS variable
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
 yann.morin@orange.com, brandon.maier@collins.com, fiona.klute@gmx.de,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a versal evaluation board
to a versal custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- removed unnecessary $BINARIES_DIR from symlink source
V2->V3:
- ignore anything after the first space char of LINUX_DTBS
V3->V4:
- use make print-vars to get LINUX_DTBS variable
---
 board/versal/post-image.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 3242e4384a..168c7d6faa 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -2,13 +2,9 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+ln -fs "$(basename ${LINUX_DTBS%% *})" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
