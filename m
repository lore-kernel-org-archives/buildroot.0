Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07935C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 10:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9645D404CA;
	Fri, 27 Jan 2023 10:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9645D404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuPsswNVgWwO; Fri, 27 Jan 2023 10:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5602841B48;
	Fri, 27 Jan 2023 10:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5602841B48
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B05D1BF306
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 10:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F0C98271D
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 10:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F0C98271D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbKuvMt2_CTm for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 10:53:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73F2F82B1B
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73F2F82B1B
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 10:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDWtkLY3eMbyiB4/sf/Rujm/hgIGhVYeB50Q5tXMvhiOJ2NgCD6ol2MiHwDttOmHDpq6KGGXv+e2yh4e6VUss3uwPnivAOsntpZlw2Pk8RubXznRs0kApG/FxXf8SWwGwfOz3BJlToFpYG6rTAh+9W+LlqxXWH+eScwqB4L18naufDMpVCTBBTRcSr0MX/tLnXwQiV4EYosoWDjxkBnF0Qir3mslr5PnGO4f9fNNqhoAYsZ93j2V2MrogZ+Ggmq9v7z/kBZ24lxuNw5J4SMmEvqCYiFls6fDGKNKh4bk123J3JMbUop//c5AlBheoICwlxFepqLMZfU1h/WC4ObhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWEuriLwEslUwMJQO3UWeAXRZIf9iB0ry4FR9a1NWU0=;
 b=nISSs8M0+rXam9LZL5dUZhLp2jYb5lTu2ZVrrx3ppWo/eE1SaKCb+iOLgkytTWKDtAW09FgGP0rZQlh0jPJXb6MlM5xTwxQkhKRaTmuTRa1H1Hzltff9eMFCVbF8rb53wRmthPExzaxcqv3tPPk4UAA76MjMDN6GBJW8/6JCX5awtFdvXJ4kDf2UC87M00bQLLo/vINxyYHfNzQUc2tVf5kwyof6Ub2TB8l+YTthh74lcdzopBlExjrksFyxCaHvKm1i7SNqB9xzl+1elN1VcpztkEq15u/PKOocJRJXKmW2dgzneLTUuDB1U9kqRXTQyQzmEmrZgS3BdoROT20wHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR06CA0036.namprd06.prod.outlook.com (2603:10b6:5:120::49)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 10:53:09 +0000
Received: from DS1PEPF0000E63F.namprd02.prod.outlook.com
 (2603:10b6:5:120:cafe::7c) by DM6PR06CA0036.outlook.office365.com
 (2603:10b6:5:120::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 10:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E63F.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.12 via Frontend Transport; Fri, 27 Jan 2023 10:53:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 04:53:08 -0600
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Jan 2023 04:53:07 -0600
To: <buildroot@buildroot.org>
Date: Fri, 27 Jan 2023 10:53:05 +0000
Message-ID: <20230127105305.25877-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E63F:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f442ec2-aa8c-49f8-bfa7-08db0054adcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sH5LJm3LkJadTQsLHuE2qVpU7bqSl6vipwbqWss4PH0EHAF+271uH2rKO4SSNSFk1ZxO7etp3Z1ICxHsg1qXkiWXtPnB1Bc4puMxGXIN3k1NtzaZ9aA0THWBCMns/f8YR8Rux9shPjjw7ayeAn1clVUO+o+Vxw0ReW85fcfN6mnoNgZF4SNfoc9qw7IYbenI3zRKn/MKbtrMmGzVF1XZ87cZLQnb0v/OjI0yc0qUExWszNl0QgtW9hjdbQYGlgKchcgDh61K8nojWmw9Z6D1kx9nlLLYwbH2Ox0BMbLKIwCOa44g+VteCRI7o82iv5aiid2nb4/Vwq2+DtJOa/9p0cYEGEnYxJHhm046PCbe9HPLtELAG9Em7k1jDd1wZpTwXThbRgHNIDTD7YvaiZpnnVYJE4ICEUEW4ASi9VXiANklxF9kAcQJXFkTX39D+T99lMXWhTh63kPFxBjEQwQZkF1BmBdKXne9OZB2fKFmC/2ldg9EKHA1RgGMrwgE/OlBOippFX9bO3y8sAOGD1zg1USbXLS/zrsx+w7APbzPt76fTj4W5RcER8Qd96xe3eonJFrL4UPZe6aS1nV+eRO+LSkeG6AwLcMCl6CkM5Q62IkZ+STh621AwnUv9MYyD/AIeE3lN8yWHGHENUUkYENB1bHhW3FIL4D/bm0CwXPvxBhNnZ5Jr/u2gSfPKVWENVhDyKy8viycU+jU8zNlQbzmedSikAk4f9EBculM8Q4M91M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(356005)(70206006)(1076003)(316002)(54906003)(81166007)(41300700001)(8676002)(70586007)(36756003)(6916009)(40460700003)(8936002)(5660300002)(86362001)(44832011)(4326008)(40480700001)(2906002)(36860700001)(82740400003)(26005)(478600001)(186003)(426003)(83380400001)(47076005)(82310400005)(2616005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 10:53:09.5340 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f442ec2-aa8c-49f8-bfa7-08db0054adcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E63F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWEuriLwEslUwMJQO3UWeAXRZIf9iB0ry4FR9a1NWU0=;
 b=nBlXdosJ7IAglGYEq59nQvESu7M1keVvFk2zWDreGkSi+/Bz0rKKDX31DFvqSITulJc3ggZBMEiVUL6b1YL8IvWNYXZp1P7OGAwcRWnODQCMxA75D2VhMYU2ADueRtA+W1zr7DUCLoyPBz6xliF5lExSb8NqRS0JWm/LHxnr/j0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nBlXdosJ
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: use
 Xilinx github for versal-firmware
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate versal-firmware package from nealfrager github to Xilinx github.
The images are identical, so this patch has zero impact on functionality.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig            | 2 +-
 package/versal-firmware/Config.in          | 2 +-
 package/versal-firmware/versal-firmware.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index fcda6eb431..2808fa522b 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.2"
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="2022.2_br_1"
 BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
index 8d13816149..b4b63282d8 100644
--- a/package/versal-firmware/Config.in
+++ b/package/versal-firmware/Config.in
@@ -10,7 +10,7 @@ if BR2_PACKAGE_VERSAL_FIRMWARE
 
 config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
 	string "firmware version"
-	default "v2022.2"
+	default "2022.2_br_1"
 	help
 	  Release version of Versal firmware.
 
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
index 3e4b9e558d..0bc5a00bc6 100644
--- a/package/versal-firmware/versal-firmware.mk
+++ b/package/versal-firmware/versal-firmware.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(call github,Xilinx,ubuntu-firmware,$(VERSAL_FIRMWARE_VERSION))
 VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only
 VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
 VERSAL_FIRMWARE_INSTALL_TARGET = NO
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
