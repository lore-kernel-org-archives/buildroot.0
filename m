Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17C1C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 15:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F293D84A0B;
	Fri, 14 Feb 2025 15:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpHfIJLW4_1f; Fri, 14 Feb 2025 15:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F42E849F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F42E849F4;
	Fri, 14 Feb 2025 15:30:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0E6B1C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D519942528
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0fGordMxl4R for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 15:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::629;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 911614251D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 911614251D
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 911614251D
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpR1OLBN2AQlO6i2hB+rJO9WqtCuduXnjE4h2Wx9NikMC6Ui26xvCdlMGokv7O0JyrSsM+nfp68fhQgol+QTxZ67WklM8BhFCYUpwOp4GF2LOm9trpMM87l39oG9H8UheEacuqqE+ufAMpcEhnPSH/wTkPuUnV3GKuirCGox7sOQamjkjmhuzkboHhPIqsq3K6P5zc6UxIr584nHAYvh+c4BUCeXIyN6z1daVqK+xN2beiqSpQor3Mh87vze8SYR15GO8RwVQGsy/Y+NQotWL70O/d6RfWc7tVHaSr0gkXMk+wy/LZ7lMbvSSjrFCZTi/9VmwPIQp1oh7Xkx1LAZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCeqiP5gIOsP9/2fwcQ/HIZMEKyAmKhovUv+n4MU6AQ=;
 b=B8XYpYSTr5faay2Aoq+WnzrBOoEPqVYA/WVLTf/rOZFRjpIV5Kxh0/fCBZRZKFlUBomwf5lkIaFLK+DZej9U7qS1roaqeYgFpt60v9y81JTWQIwBHm/xLIqI3o9N9MQi3TYVnP9MND46U2xkonXN0JkKhyrzqjvAgl3S5kzdtXPL80Ig4PQSaBIHLuZburEOS2dI+/TRZtc1QnMWZu5UivI7xQag4Rzdx4xSX4GItV9jTN1tAk+FzR9B1foTOvQATyuzzWj2u0o6Ux8vJJ+LDVH0QupSEg+OCAm0cj746T1CqrOeZeFlCpEvq77yitOO+CMOhp0WbnVME50o3IKa/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:a03:505::21)
 by SJ0PR12MB8092.namprd12.prod.outlook.com (2603:10b6:a03:4ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 15:30:27 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::51) by SJ2PR07CA0019.outlook.office365.com
 (2603:10b6:a03:505::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.14 via Frontend Transport; Fri,
 14 Feb 2025 15:30:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Fri, 14 Feb 2025 15:30:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 09:30:26 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 09:30:26 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Feb 2025 09:30:25 -0600
To: <buildroot@buildroot.org>
Date: Fri, 14 Feb 2025 15:30:17 +0000
Message-ID: <20250214153018.762783-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214153018.762783-1-neal.frager@amd.com>
References: <20250214153018.762783-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|SJ0PR12MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: db493569-73f4-4619-7637-08dd4d0c8241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?re96a09laLNX6ikjSj7ceuEDIXSTgBnOFProxkWSSclr/PwttDZ26G9vDyrY?=
 =?us-ascii?Q?bHY0LAAA5jN3W+Uqx69vPTCU4Xo9/HSzRxZZezHExqzCg80NEsZ5+Ns4uysn?=
 =?us-ascii?Q?xeiiNFkEEqVGJDDnr+jpEbwiMnm11a9KuZHK/hdj9hNCd6bR7tj4Smrsvb6J?=
 =?us-ascii?Q?3r0OAPymM4ZWbmrY+KBol7TU60WLA3IJXVH2k9olQxsXpGvsO3UavIZi4AkY?=
 =?us-ascii?Q?Bix3qpvh3GYx5ccvU/+BLOzUNVKtLhq2yxOYoh2acy9LqFd3ojxSi+0tnjOf?=
 =?us-ascii?Q?2Pbx0V8Zz1hpUz58Fg2gIJDUTwvF+d4VQf3WOX2kqj3SW2eNCIq2QsfJPjZD?=
 =?us-ascii?Q?ZkD1ZGy1nbuqbNmb08Fy2N6PBHo6LjjLDF3ZxmJ7Bxtk3ecODuN8u1z0Cu+w?=
 =?us-ascii?Q?2gWMgrRSAh4l/PwHVgpSDBT+lO9pjEIX5VCG22mqE8San/+DUYT477fi7oGH?=
 =?us-ascii?Q?Z1kJNXH6lC7dpSwbvfBKedII3YbMcagdxtcKHrATleVuwpksmZcAGUOJ/jye?=
 =?us-ascii?Q?aXJLkaGpmv0SfaGEINCH8w59O2IeY/MnnAOjFEXNaLvjHbjS3t+lZl8w7Day?=
 =?us-ascii?Q?eywVidYxVB4reVqwKlrQ2WCnGMAaRN1KzIEFI5S5nXzBZk7nMYQ2Of3NsbiJ?=
 =?us-ascii?Q?ymGEaTjgsMq/FugJkVH6wUozHZzaDtU5pVaN6ZbJrqavMYIZQxiKaFNK4X8M?=
 =?us-ascii?Q?PQv65Q+wibnlKhP178Dqqgqj5YghYnlB8UFFtulD25a+TC9RheoCHaYE/Oxj?=
 =?us-ascii?Q?gTNdUXHPP9We1naOvElR8zKZAPOIsigF9sOoa1VQOlBoj8/qnIoVMjXDdNqA?=
 =?us-ascii?Q?BswHZOZt6vgDXjyvbtcE248JFtQcN78Gj+16ZWwoToRgE+nlkGXcq03FvrpO?=
 =?us-ascii?Q?FP3Y4BEJgoNNOIsxoC6XX/DyrY6fqFng77xGukV8Ocb8YcItciEvS+WAcSa9?=
 =?us-ascii?Q?M8h5CAE/eYyBzsdZ1ypzjCSBqKrqn04fhtHg8YdGUH9louTxW94N503mlW71?=
 =?us-ascii?Q?nseEd6Q7EehDSUAHMr9yIQyPGW4sdiCxI9JZsYvE7OFMDHfRoTeSue4Y35Z4?=
 =?us-ascii?Q?qXYy42Ld4OqFQ/MfzYEkiONA1W+in7g4JoI0iNCuIyIaZ3KofBtguNfJhXpN?=
 =?us-ascii?Q?nHNHtOJOmyHx3Ch93grGrJ4jhpLIlU+xSv8Tij/g8RjyplxYUJWpn4vPYAL8?=
 =?us-ascii?Q?ohLWDh/2PYdr0Upg0R66XDogEeHYoEKZ6tw0iwyjRQ6cZZxXhGIUTnkwVh9Z?=
 =?us-ascii?Q?e3vGi2F5L3m4x4fv+2Vn4ic0hNdQkI//ZLdlDtGGOuoYqHOxJ9x4tsjaHE3G?=
 =?us-ascii?Q?QjuvuaGquWYCl+lbY75k3CdCnoVlruMJd8gvzOxleW97NuKUjgHe2Tv92wxu?=
 =?us-ascii?Q?r+3ypb6uXTuJphyF73OEq/NKNvA7F7d+eegWS6qhBpy2as8nzp4HGiHF+3kP?=
 =?us-ascii?Q?dkCSwa1f4bUIgQ/0e9YsswHpTp3k0pBq8Qf5ntgG9RByknrhYLfryUmxM4kc?=
 =?us-ascii?Q?o99LTa460XcZwX+JoHJHXIEZl+5N0IgNXCIa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 15:30:27.5189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db493569-73f4-4619-7637-08dd4d0c8241
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8092
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCeqiP5gIOsP9/2fwcQ/HIZMEKyAmKhovUv+n4MU6AQ=;
 b=Pw+0x8VRPSmmYwjYhm3UEngkWscaSsV8H+IqDLbJ5rm4gZmLv8nQxg0byUgBdI44p1xM5prMC5KA0HFMlHwsXyUGniqkg/jVwXEeD/ajRzJh7NqYE0fbhnud6RQKk1ECTYkTEDLItU4M0JxIeE9FQUVh7HzLq+LcXSeKzQfSmsk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Pw+0x8VR
Subject: [Buildroot] [PATCH v1 3/4] package/newlib-bare-metal: add multiple
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
 .../newlib-bare-metal/newlib-bare-metal.mk    | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index e28e7a717c..4acc11deb2 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -22,28 +22,45 @@ NEWLIB_BARE_METAL_INSTALL_STAGING = YES
 NEWLIB_BARE_METAL_INSTALL_TARGET = NO
 NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
 
+# to build for multiple arch tuples, it is necesssary to build out of the
+# source tree, so that each arch tuple can have its own build location
+define NEWLIB_BARE_METAL_CONFIGURE_SYMLINKS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		ln -sf ../configure $(@D)/build-$(arch_tuple)/configure;)
+endef
+
+NEWLIB_BARE_METAL_PRE_CONFIGURE_HOOKS += NEWLIB_BARE_METAL_CONFIGURE_SYMLINKS
+
 define NEWLIB_BARE_METAL_CONFIGURE_CMDS
-	(cd $(@D) && \
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+	cd $(@D)/build-$(arch_tuple) && \
 		PATH=$(BR_PATH) \
 		./configure \
-			--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
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
+			-C $(@D)/build-$(arch_tuple);)
 endef
 
 define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
-	PATH=$(BR_PATH) $(MAKE1) -C $(@D) $(NEWLIB_BARE_METAL_MAKE_OPTS) \
-		DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple) \
+			DESTDIR=$(HOST_DIR)/$(arch_tuple)/sysroot install;)
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
