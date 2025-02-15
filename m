Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7F3C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 12:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE14342928;
	Sat, 15 Feb 2025 12:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQQMIJ7B_JeD; Sat, 15 Feb 2025 12:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9046E42918
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9046E42918;
	Sat, 15 Feb 2025 12:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACF2972
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A831784A91
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAbopHGX4yFd for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 12:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::630;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E56F084A87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E56F084A87
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E56F084A87
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIratQyT6dW9OjTkMMAoG3yw69kNWWowDyB8mJ4tKwFb4F9rlU5/OSt313dK5MJuyP2siKDrx51QXyIsQEFzbyh8zyykNhBAutq5mrlN4+dPndY/ncohnezuljfjzgiIPeKHuyv4o+vf9psb0CIOAk0CvfwnvGK2pMY0aPt7gB4WcaskEvAriTxO7Ld+W3D33tyQTiCnV7VBEUDUkhedAOTZbRJfkZ9UOKFBAYY3zBB4eS/Ro5SFFLJrq7Mu3i9pUH2lMxpOK9q/VYLiRMjVLIBCESK2S8IhntCEtOwgzAySmIw+T/F8pIDigFRE+Y/TnMtdjugNJn2Ace9uxz9kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPU6rl1PCYGnZ/xIkhKzvzXs775I0EHpOZ3/mvWaE78=;
 b=d1lPiF1zFHSfCBLx1JPbcSu/YN5syWl6yJnIDfpYeUeYZA3OLMfFTpAwmtGyC3bS7blF/f2Yx8JJ0GxfrBmK038wLn2WACrfadA/hYZWU8fcO7ckY0gpAJzdZNKbfhbPXICr7CgfvaE1HMOWPApzqmLLh63wGdMwiFJprx6HZ0ziwPfQpBv+dgygJxM0kzesIwjBXhKLB9m8VYtfMJa+Wv1TfYLeb19C97dgcmzru7I2+EvxMGmsIPQnnnslJwcvyok27XP0EG/GD8KCZf8ArGAUe+f1MjhM73DHu7LnBjnA7TBrNQuP3Hp3EE3Xnb4qXogJTo0NVJpZuag4+t+5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR15CA0059.namprd15.prod.outlook.com (2603:10b6:208:237::28)
 by CH3PR12MB9453.namprd12.prod.outlook.com (2603:10b6:610:1c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Sat, 15 Feb
 2025 12:57:41 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::6a) by MN2PR15CA0059.outlook.office365.com
 (2603:10b6:208:237::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Sat,
 15 Feb 2025 12:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Sat, 15 Feb 2025 12:57:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 15 Feb
 2025 06:57:39 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 15 Feb 2025 06:57:38 -0600
To: <buildroot@buildroot.org>
Date: Sat, 15 Feb 2025 12:57:30 +0000
Message-ID: <20250215125732.2965257-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250215125732.2965257-1-neal.frager@amd.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|CH3PR12MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: b52a9e52-ba92-4e01-4c48-08dd4dc05488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/vgzRUvWWE9kKa3bJe2zSChDgzS9LNWsm5XWO+QCMEbrvYp43c0lE1zWdc2Q?=
 =?us-ascii?Q?UJkyoZdN78bOk7QZQxmkV1O6ThTAs85gT6IwJphs44UJ6fioeEwI1F4SBj6n?=
 =?us-ascii?Q?g4xpJ7iat40f9KgbdMKbIiPvYhDtqGaPprkQefaT8tJfUGJ5NqDTdNxnZefb?=
 =?us-ascii?Q?Jo1so996jEofyCz2qkTA3kYHHtkIpwdJ7VbZjGxYxSQITzX5N717fx6dLxa7?=
 =?us-ascii?Q?WXpqrZZkXZSUR5q1ieGv8buMNHmU6tenEbWG/qA0eZpgLXrfcrDKWyt7xcpA?=
 =?us-ascii?Q?UOKmAff6CaHPqMqu8k501SGZ071aMsiCecGN5SfXS8HnKyFXlMw/HM8RhbsR?=
 =?us-ascii?Q?YEYBntViwC6C0RCjAuiG1DfFR6DM4ZET3fAZPO8m8MP9B4ZypRIdOnnW15Pn?=
 =?us-ascii?Q?shdWDLT4HkISuG2gt713LlOz4YEGEbezSZ6Wx6pVBjYMEHoMuVacNgSon+de?=
 =?us-ascii?Q?qVvgBIYkqZZn2tODnetZ5zVqmrFpD18AQFw9MacrxmwsFDYr4Q5QOHkK1mlj?=
 =?us-ascii?Q?/NBlwkDxHc5tkJcal5L2wFykPI6dUS90Fnm9N0TSjIPskDiFYnspwu4iEPzj?=
 =?us-ascii?Q?1n31CvEHvjwUeM93Dxmgp1bQGwaIdCXtJZVs22wV/35KeDEEHFDrZJu8x9Sb?=
 =?us-ascii?Q?IfB4SDlYg3r923Yi4WscXgSLezZojuv8OpLp4rUKBWp9C/sfrqt2Dsyx1ExD?=
 =?us-ascii?Q?7wENKYp0/ejGPcbYrQvuLhiD5sMkf6lKemg1xdr7Ms7/r4LhnRL8YWnOTRjc?=
 =?us-ascii?Q?d4463HDJMv3WT3OdMbfsvRW/YD7ITSuPV7/cJIN6XIruVrQkbuXXC3nkvqnK?=
 =?us-ascii?Q?XaIgx7ltwT1+6bWm8ZKvncfoU9pzD4fuuTttyR1IAPQf1B8Zf75mcwaCYiG8?=
 =?us-ascii?Q?0Evjid732uOIpPV68Kse6+y43DSoKCUPqxuiOt59VnFOsIcRwxwFKot+iRkU?=
 =?us-ascii?Q?pGITc19A1wxogI5SLqXvfAM65YKP/dxI+/3Ga86ADuR355u/O4GW8WGYeLY4?=
 =?us-ascii?Q?wegT0vqDCacAZj9JX+sieTMDfb1ACX2CgxHqMih+xawzTkZt/guG3PxYSwZx?=
 =?us-ascii?Q?0ixUzsD6RaLprVh+F+ZiRLNqJV4ffMHvI+6Bx21uB2vHrl/zwEngH89MQtLH?=
 =?us-ascii?Q?P75P1Mgm4bE5QYhSQUkfVBDMlFFw1OqDcNKyrXa16T3OXaAdt+cPAFicpS41?=
 =?us-ascii?Q?knQ6zGZW9sELuKML0+3UTJsJLifVCtl5ghv5fQbj/oqEETeHnIoZBnMVnnx5?=
 =?us-ascii?Q?SdVbyBO1WfwAwZB1zBOE+kDU38HvmPvorEdH7th+Zf5FGjSwR1tBkD5psevQ?=
 =?us-ascii?Q?AfyxZFnRksydc4y5OrGSSBBSWuC5MvLdr9eEmiA+FXpOgeycW1ZNOA5Mtz1h?=
 =?us-ascii?Q?9hT1ZV6YsqiJSRmEVXeP4BlY+2ADWJwxVcign1Xt/r3vJv8O+dcdJHxvlTpT?=
 =?us-ascii?Q?MO8sS6icD/sNJpX7dk924cNfFUxCYwYPIMJ6GjmUVy2bjBArPqpLNQgGopGD?=
 =?us-ascii?Q?4OC+uSTRr3qjmsLlmw/nsM2NDm1YVvkZXlY+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 12:57:40.3131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b52a9e52-ba92-4e01-4c48-08dd4dc05488
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9453
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPU6rl1PCYGnZ/xIkhKzvzXs775I0EHpOZ3/mvWaE78=;
 b=S1gh+YPi7oKdPFy7hT7GNKAprgmkP5SHgruUmadLGAqvn86bndDX9XtiB5o65w5QHntgOPodraC8Qbvu2mSAavaqbJqGpSQpDm3V+t0N8Bg6ZdeAM+UbTPBg9ENBCr8NK9l3+oW1MsdKhctQAcY0Pwoo1b2zLcYt2lvpeC4DXJk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S1gh+YPi
Subject: [Buildroot] [PATCH v3 3/5] package/newlib-bare-metal: add multiple
 tuple support
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support to newlib-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
V2->V3:
- removed unnecessary symlinks
- removed unnecessary semi-colons
---
 .../newlib-bare-metal/newlib-bare-metal.mk    | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index e28e7a717c..c0da38dca9 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -23,27 +23,37 @@ NEWLIB_BARE_METAL_INSTALL_TARGET = NO
 NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
 
 define NEWLIB_BARE_METAL_CONFIGURE_CMDS
-	(cd $(@D) && \
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
 		PATH=$(BR_PATH) \
-		./configure \
-			--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
+		$(@D)/configure \
+			--target=$(arch_tuple) \
 			--prefix=/usr \
 			--enable-newlib-io-c99-formats \
 			--enable-newlib-io-long-long \
 			--enable-newlib-io-float \
 			--enable-newlib-io-long-double \
 			--disable-multilib \
-			--with-tooldir=/usr \
+			--with-tooldir=/usr; \
 	)
 endef
 
 define NEWLIB_BARE_METAL_BUILD_CMDS
-	PATH=$(BR_PATH) $(MAKE1) $(NEWLIB_BARE_METAL_MAKE_OPTS) -C $(@D)
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
 endef
 
 define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
-	PATH=$(BR_PATH) $(MAKE1) -C $(@D) $(NEWLIB_BARE_METAL_MAKE_OPTS) \
-		DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple) \
+			DESTDIR=$(HOST_DIR)/$(arch_tuple)/sysroot install
+	)
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
