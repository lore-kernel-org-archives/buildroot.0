Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C346EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 18:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77D3840CF6;
	Tue, 17 May 2022 18:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YhreRyWpNVZ4; Tue, 17 May 2022 18:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D71840CE7;
	Tue, 17 May 2022 18:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 201A51BF855
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 18:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CD3A610A5
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 18:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fcbwtSoSoM_j for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 18:39:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 692C461094
 for <buildroot@buildroot.org>; Tue, 17 May 2022 18:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TH9Cfgw5kMEkVLDLJ84jEBRX21CX91ji8n0OnvOlavxStOZGjJPpYmy2oPJzJZmvNNM3oWQPB2tB9qoyQxjA1NxXb6jYoUMu7aeUIYmSS8tvzeuIoRro83CV1Fmch9vyx4C2NhvITxUnLFNTLo+w/vmcX/U63utFR2itmqDFN920fhA4Ywn1aGH8E8JvS8ttNIAyX5PSI2HwmXUybadlR1cJaeTTwp/w1MsgXQ0f0SS0aLJyGNAkkGkqtYkQes2AQ7QvEBdpj2lwtsY3XNb/mH9MB6DHvJnGw4wLfgyr2vspb765h+4CiBpc0EXMP0yiQaV37VImjbsz7s2wPhGTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQNYJamuAwL7PqZhatZJGpCYkaL59JPVq1u0Z3Ax9OU=;
 b=TsW9uhBn1pdr9CeiYeeQm14btgOpbu1QhWUamjCnGHUm/U49r9hXRt8Dkg27OFa1ymM01sgL5M/or1FI2yNH7axAks4JoPdJysA0zEoZO8cNpwSljTtf8o4Fus+T1tDOqEBu9CE2QQxkRKCbJ94rN6S7IXb9ST+O/iETBp96ZzZqZ6mdbPLRVBVJ162GgvfMttDxEMs1S7GNiZF+ENNTuEHzFF4Dvt/pmqfLaQpDVz7Xgjpr3mFblfjZQN4W/+bKex9oB7N8+C2JzlSZCyVHcs2NUC0NHTlZItEogPIX/QYe4SyMbBjUM1kFinPnIPgn1e7mVCiKK5oKr8zeOO9Sow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQNYJamuAwL7PqZhatZJGpCYkaL59JPVq1u0Z3Ax9OU=;
 b=jsFqC94wHmPqAuo7nX1cjSsXuUIPBlrfK87VdNrFv/j4W6epD5qOhiagKllhJ6IAnN7Yorkwmt69mrNSYXBdem6ODNJOie8pZucTqh+R07G5wfYWMoCRPz80azNpFA8N4AmvnOJ2SQmsGrcK+kx5xYmiWPmSPuxnOc6AYLb/thA=
Received: from BN9P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::13)
 by PH0PR02MB8614.namprd02.prod.outlook.com (2603:10b6:510:102::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 18:39:20 +0000
Received: from BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::79) by BN9P220CA0008.outlook.office365.com
 (2603:10b6:408:13e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Tue, 17 May 2022 18:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT023.mail.protection.outlook.com (10.13.2.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 18:39:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 May 2022 11:39:18 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 May 2022 11:39:18 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=33564 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nr26I-000BUP-6h; Tue, 17 May 2022 11:39:18 -0700
To: <buildroot@buildroot.org>
Date: Tue, 17 May 2022 12:38:42 -0600
Message-ID: <20220517183842.1389395-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517183842.1389395-1-neal.frager@amd.com>
References: <20220517183842.1389395-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d079317f-6f6d-43ff-ff5c-08da38348d9f
X-MS-TrafficTypeDiagnostic: PH0PR02MB8614:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB861491B148DCE14E2791C72EF0CE9@PH0PR02MB8614.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3jy7RTuoS1KW5CDGnIlNpGjxyNdfI5PSVLBx2O4MGzlFjpUqXTHai4vkpfz9xVldSXPgNIpl7uaepMIga+m8o+R985iKA79PIbNWTDAw8huEzse+399ez0d59elgyWIZC/ulm37ShmCOKwkV86ZUgF4Qb+Vhc4m/shM2ETUYYe2kDwX2L6ZhPHtXaIf3493Df0FAPOsTZgBmTGSqBonRRSVPnvXRrP3xtPNcI9uZ23GHTnU6uwNyPWioGawztOnpDz3LCFINvwU5uHqUin+mJOHA1Evb8dsqPq4aj/a7o9rmKs65/5Hruub3BpFhqc1MsUpA9y2UYCgClKFebgWxMnS/OJgjNy0AnlW6jn6UGR8C0SqdzyooB7jKj72B/8h+ZgF3wSSskKEsASDtCBvjwv0xowtFmTGlkm+RiNR366ngCnswzqUiTD+iybHGh9oN3RJN9RSpHMnpwS+RvR8FnGeRn0acmrFzZ3GJdkzQLfEGRU1AcVONeNL7ugraPabzscU4/ext5dkBHeN4UEe38eiGz93lAYqbmDh+a5iIIcOAsWogiKgo3dxYH/A4YA0+Tp5CwIbKSFq4rY0nMN5i4ga04r1bHXxIZNwMCFcIAPGAydIh/CLwRJ3DCBAz4Lh1SgtGKF/Uv3UKKzRurzG0sJwep3x2SpSgSqWBfnrodMSf+ubAJKN0F+1nkoADYeIrpbMl5QpSBp6vkPgMqHC/w==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(2906002)(9786002)(6666004)(8936002)(508600001)(4744005)(82310400005)(36756003)(70206006)(356005)(86362001)(2616005)(1076003)(336012)(47076005)(35950700001)(54906003)(316002)(6916009)(26005)(7636003)(4326008)(8676002)(5660300002)(40460700003)(44832011)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 18:39:19.0312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d079317f-6f6d-43ff-ff5c-08da38348d9f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8614
Subject: [Buildroot] [PATCH v4 3/3] configs/zynqmp_kria_kv260_defconfig:
 build atf with uart1 console
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
Cc: wesley@sonifex.co.uk, Neal Frager <neal.frager@amd.com>,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes an ATF issue by building the ATF for uart1 instead
of uart0 for the Kria KV260 Starter Kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d4a72a0d19..cc01fb9155 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -16,6 +16,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
