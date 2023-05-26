Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B82C77B73
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18BD442EF4;
	Fri, 26 May 2023 17:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18BD442EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pONIgagSFN01; Fri, 26 May 2023 17:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06DE140B6B;
	Fri, 26 May 2023 17:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06DE140B6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 151A41BF29A
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 17:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E10AF4281B
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 17:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E10AF4281B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41mlL5wPK92x for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 17:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DD6D4281A
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::700])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DD6D4281A
 for <buildroot@buildroot.org>; Fri, 26 May 2023 17:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mApwTo5+WMWeFA3gF3+5ZE9zBdenndaviHUjxctDscycQv0xwFDFuRI7IlDVTB9Hi8lNx8dGTvpkk2vsDRMGjXQ/NyHppyFobpC/E9bjtUF6Y0A4nGccTk+Dx2EQn/RFVOC5NZz8sVhpfJ3W/W3ATX1yyNLw5pgqF/qrZHK9eV6pXZc894vopeBjIR11/XNAxinYcNvjnhBODbhRG74u3u1YF7edAX2EiqKfpfYJohp8/Qk1vnxEdZ0ccrnRCjxqHGX73COZGv4rpC2ZeaLFnKzYMfirTEuX5tTnHDXNrzuGjhnQOG7HZNks6FsyE06Bp8th/mjF6BOiYZqJ0T1iyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zcg56w5COkUhUtG9MdNNp0sS9fDCtnbtzKPv17/txh0=;
 b=lEEy9SikxftMad8JG40vUkYiGNnT5mxXFiX0N+xWLL/km7seXhsMF6uTXaJpHL9dr4zVq7zi8+mI0Nn3u5EgQmtivgGnzlPO0EgRNY9IDV8z93p7vtVRsGr1ZHiSCmPT+wU8A2d1AxMovNngZqadsQOTu83SHNi2R3GtTGbj8xseOJo58ZC35+BevFeMsnksB+gJqlVtaXo9Tzp91ekyZwb1gBD9hF6uQ3v+9DPO8vEK80mc9hjNCYpcjmuf4EJ3tbH/Jh8l+m/NT9tLoWgkTyLkxPA0D5VdpL9g2oULGDiBPgEwhSKUSPAYgJ7FPsmOIZmAdUDEP6j3BdlLm6NtOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MN6PR10MB7421.namprd10.prod.outlook.com
 (2603:10b6:208:46e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 17:55:23 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 17:55:23 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Fri, 26 May 2023 10:55:06 -0700
Message-Id: <20230526175506.1071354-3-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526175506.1071354-1-colin.foster@in-advantage.com>
References: <20230526175506.1071354-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: MW4PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:303:b5::9) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 240cc131-38d6-4a14-11ca-08db5e1260ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 121P26H3Y4q7O6B+fqtwQDRELTJZwt4gO3M9QlOONavqdVNMW8G4Pt90bnrVWFZwPMpxJevH5HXOr2kM7uqBcnaR9V4Gta/rCLIdNfCt7biTxjwHZMgi3gaiOVrd8/2OVijZpCk7+kYAI2EC4F8CQO+T0JIn7f3KOEEo3FLsdtWvQwawXpTlTvAnjsnfLCmgQxlF0z3tcR/3jpFTstUg2NucBeDp3vD1CmWg6qHchyAH3QzaOhgEMj0dgdzVSgPhqjf1tS1ic0w4bfy+M8KMqfmLiN8pJkZ6ZIV7uh6bbVWge/tORc2YUG42BCl/zHEOK1A+UiRt8VUgLNeFqhWNrfSCjXyePPIT66XWGJzezjK1dmJOCtMqVNPO68kGaQCIhmxb92wgwrURYz03Yh+B5deO2e9cIx4ona7LKPcBcgibI77oIcJwsMO7QnrDCUY4caTNV/M+vh1Vb1iT2eTa5tmmqgN5PyqwAynyUZJfRztDBY3R3r6WWU8cPN/Xbu1MlH+HbDsxQI5/oWd2bF45jspZKK6rS/ljUUvRFzXZFvTompnXsLDCuKEE6Y7sFgaSLA2+TIJshJymAVEI4HUkSEvKDS5IoEPGEQ6TD90A01NPunRNt1/JaBKxxNDZJzBRxMK440cv5ZKLZyFPP7UgCmIBUx9ycWQIw2av6y74IZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(39830400003)(346002)(366004)(451199021)(186003)(6506007)(2616005)(6512007)(41300700001)(8936002)(44832011)(1076003)(26005)(8676002)(86362001)(4326008)(38100700002)(36756003)(2906002)(52116002)(966005)(66476007)(66556008)(6916009)(478600001)(5660300002)(66946007)(83380400001)(316002)(54906003)(38350700002)(6666004)(6486002)(2004002)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7MllZkLE3vTD1KyOvQ4t8aEFbfzP5uGXx1clGcNnho7T+H+H/Twe8rmwR1Zf?=
 =?us-ascii?Q?535tuykDDsrAjXif9c/t2WN42RXCY/q9lU3WBYdiYs0oVPuh5z/Kt+eWfOI0?=
 =?us-ascii?Q?HB0rXgu++FqodXc0TgfDJZzgNF2k42ePAai4keqxHKOAdvl4R0kpgw6pCi7N?=
 =?us-ascii?Q?G8Rzjcz7JOsUhTkO0w6QlBg93rtfwUFnDhxYmFErTGd67zAoIKsqyFw9tvZH?=
 =?us-ascii?Q?He7L2IFul8lM1OtRwLLLBE9qbfW7HrVDOiRd8Vi1bgaqUdJWAQ4ksJbLAZXl?=
 =?us-ascii?Q?/CT2/ba+RsB+dxOihJJJq0x6VFjPXzJBkpWJT0ZbVTWi5HG7usjEfa7H9fHR?=
 =?us-ascii?Q?nGDGpwIeG2B91zNJbX4Yr1HZrlACd+6TB12unxxClcjMayqWtoEkVGxIgr4t?=
 =?us-ascii?Q?CXVc/eS/frsbhNFFgCAihyqqRj32+AvTgPUcxzJZu3hRZmTrLMvFtZkypOXp?=
 =?us-ascii?Q?Gb+lRbdx0Dmbyi8y0uEOVCh7IgQGC1R4PTb/4UBTV/xMo4uPaixTSwpPqRDK?=
 =?us-ascii?Q?hsWU+WDhQcbxP5kjhT1dCbYXJssOVSq8m0zRGZff29tkKmZl6rpmCk/dhDzy?=
 =?us-ascii?Q?suqRETMm+zq9rXtS2i8XyGVmtik0E4/oS6126ns6r3fV457VzJWWzdH/ACL3?=
 =?us-ascii?Q?az0hLDY7U0RqzUoJabgCADgzmhaonbdsK0omCfBS3YnDJtblNvBhLphYfah8?=
 =?us-ascii?Q?5hmeYpJQDt8lU2GVS7bPz3gWRXGTDW6M5mbkAgoxXPiskinV/7xv3xf1JeaB?=
 =?us-ascii?Q?ksXki2Kw+hV9q98onFsvcnM52NBEG9KNGT9QETh8xmTUSK28zTi95cX1kFKm?=
 =?us-ascii?Q?w3xs/hUcIx65/JlYjo6wxmrfaJOQWmNDRfJxcLNly08qfUxo2WMQ/HHeAiTC?=
 =?us-ascii?Q?BDDNvy2YBYK16oLFbRkz25+FqWpBQQG3ykwzi73frRMDv4oCXqTm4KebrCiX?=
 =?us-ascii?Q?9ld8xB9NRRinLUFSrr+Fk7cq1lPn4dCi7UiBhWCTIR9griybvmBj1HFF3JdG?=
 =?us-ascii?Q?CmfdIBqkjVGpbYOEtUp+IQnNUHNU/Wi3SxcDs7ij52qk447qOXuMIAQEcJ4b?=
 =?us-ascii?Q?SL7+aJ9JSMqw338hAx/UoAjxPYw8+vaOXyznL1t9ZqbapISBckww/nfZobSl?=
 =?us-ascii?Q?ho7S5OW4n76o0TjH/mXyVqhehOUv3up0TSsy0vy/dt/Nh+5bCnz6Z0lNPEZC?=
 =?us-ascii?Q?qyQjXdjEh0MYyP6uNtDTUuiFFm8pW2zc97Pqi+DR2pgzvERikrf7NbV7eXbw?=
 =?us-ascii?Q?g38OiYMQlCQ71YKFfLzVaRHzIBHv/6pSe3JXfbT9FgT1PhAOcFlgvPP8ipG1?=
 =?us-ascii?Q?tmON7dB2CMo31XoITzvN9SpauYeDrybnQYehpr4OR4aTdIECrftcmmPfydia?=
 =?us-ascii?Q?Rd3djNm8AQgQiqc3BVeN7MDrM2a+CzDzs7oJ8lNb3wBszommydniIu3FSca2?=
 =?us-ascii?Q?oukvjIZCluOFuIyX1EyEvt7YndYUKts0NH4VgopULbTPYbflF89yR1hhZ35b?=
 =?us-ascii?Q?DxK5xtQNEMhSYXuBkEM6iVvaTIIh+Q/4HEGQAaXuMDmDzYpAOJkaf4Ib7L5F?=
 =?us-ascii?Q?2BngGb05E3t685X8yCITdW5PO7VAbetiyEQilGdRmulAsAAIepExzQBcxNNS?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240cc131-38d6-4a14-11ca-08db5e1260ac
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 17:55:22.9449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpJA2jKVIKlLEMdfHHpd3rhpvpHBTgbwINZ9ytHG0RUg/LUkG5wokfpgb2EeqRrdHb+TXwGi0oXBIa80wknu13P/EXz6jO1569MvPdP9hFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zcg56w5COkUhUtG9MdNNp0sS9fDCtnbtzKPv17/txh0=;
 b=WyKDzPGknFoJIYw4bCfeNLVqpG6MMNoH9C7Rd6e6Zq0hHdxg8crEZOdXOeoPIqXkdBSnMZNFWJHdPFNA9gP1CrdurWgl4GrWt1di9zPR5pedhq+Jx3x04EMxhRnF31dQJ+9vvIdlRDmdYm2pyrbFA25BI7TEdbUPoP0fx+of92Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=WyKDzPGk
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [v2 2/2] bootpc: add dhcp-like configuration ability
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bootpc only works on interfaces that are up. If BOOTP is desired to get
an IP address to a running kernel, bootpc won't work.

This scenario was brought up as a bug in Debian forums [1] in 2007. The
response was to run the attached script to bring up the network without
an IP address. Sure enough, it still works!

Implement this bootpc script to allow IP configuration by way of
"iface eth0 inet bootp" in /etc/network/interfaces.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=436443

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---

v2:
  * check-package fixups
  * Ignore shellcheck issues in the bootpc_dhcp_script
  * Fix max line lengths
  * Fix stale OVERLAY reference
  * Note: pre-up and post-up were suggested instead of doing things in
    the bootpc_dhcp_script. If the script could be removed entirely, I
    feel that'd be the best course, but it seemingly needs to be there
    to apply the settings. Keeping things in the script leads to less
    user configuration, so that was chosen.

---
 .checkpackageignore               |  1 +
 package/bootpc/Config.in          | 16 ++++++
 package/bootpc/bootpc.mk          | 22 +++++++-
 package/bootpc/bootpc_dhcp_script | 86 +++++++++++++++++++++++++++++++
 4 files changed, 123 insertions(+), 2 deletions(-)
 create mode 100644 package/bootpc/bootpc_dhcp_script

diff --git a/.checkpackageignore b/.checkpackageignore
index 947f4606aa..15cfc6868b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -243,6 +243,7 @@ package/bmx7/0002-Fix-linking-error.patch Upstream
 package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch Upstream
 package/boinc/S99boinc-client Indent Shellcheck Variables
 package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch Upstream
+package/bootpc/bootpc_dhcp_script Shellcheck
 package/botan/0001-Add-superh-alias-needed-by-Debian.patch Upstream
 package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch Upstream
 package/brickd/S70brickd Indent Shellcheck Variables
diff --git a/package/bootpc/Config.in b/package/bootpc/Config.in
index 59c6a6e739..1a77181c35 100644
--- a/package/bootpc/Config.in
+++ b/package/bootpc/Config.in
@@ -2,3 +2,19 @@ config BR2_PACKAGE_BOOTPC
 	bool "bootpc"
 	help
 	  Application to perform BOOTP
+
+if BR2_PACKAGE_BOOTPC
+
+config BR2_PACKAGE_BOOTPC_FULL_CONFIG
+	bool "bootpc interface configuration script"
+	help
+	  BOOTP can be used to fully configure a network interface in a
+	  similar manner to DHCP. bootpc requires the network interface
+	  to be configured before this can happen.
+
+	  Replace the bootpc binary with a script that allows an
+	  unconfigured network interface to work as a BOOTP client. The
+	  setting can be applied with "iface eth0 inet bootp" in
+	  /etc/network/interfaces.
+
+endif
diff --git a/package/bootpc/bootpc.mk b/package/bootpc/bootpc.mk
index 200ed24872..e3d41350d9 100644
--- a/package/bootpc/bootpc.mk
+++ b/package/bootpc/bootpc.mk
@@ -10,12 +10,30 @@ BOOTPC_SITE_METHOD = git
 BOOTPC_LICENSE = GPL-2.0-or-later
 BOOTPC_LICENSE_FILES = LICENSE NOTICE
 
+ifeq ($(BR2_PACKAGE_BOOTPC_FULL_CONFIG),y)
+BOOTPC_TARGET_BIN_NAME = bootpc-bin
+else
+BOOTPC_TARGET_BIN_NAME = bootpc
+endif
+
 define BOOTPC_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D) \
+		PROG=$(BOOTPC_TARGET_BIN_NAME) \
+		all
+endef
+
+ifeq ($(BR2_PACKAGE_BOOTPC_FULL_CONFIG),y)
+define BOOTPC_INSTALL_CONFIG_SCRIPT
+	$(INSTALL) -m 0755 \
+		package/bootpc/bootpc_dhcp_script \
+		$(TARGET_DIR)/sbin/bootpc
 endef
+endif
 
 define BOOTPC_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bootpc $(TARGET_DIR)/sbin
+	$(INSTALL) -D -m 0755 $(@D)/$(BOOTPC_TARGET_BIN_NAME) $(TARGET_DIR)/sbin
+	$(BOOTPC_INSTALL_CONFIG_SCRIPT)
 endef
 
 $(eval $(generic-package))
diff --git a/package/bootpc/bootpc_dhcp_script b/package/bootpc/bootpc_dhcp_script
new file mode 100644
index 0000000000..239ef5ec03
--- /dev/null
+++ b/package/bootpc/bootpc_dhcp_script
@@ -0,0 +1,86 @@
+#!/bin/sh
+#
+# script to initialize a network interface using bootp
+#
+# Copyright (C) 2008 by Fuji Xerox Co., Ltd. All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# written by Kohei Tanaka <Kohei.Tanaka@fujixerox.co.jp>
+
+INTERFACE=eth0
+
+# load configuration file
+[ -f /etc/default/bootpc ] && . /etc/default/bootpc
+
+# to get the interface looping over arguments
+while [ $# -ne 0 ]
+do
+	case $1 in
+	--dev)	INTERFACE=$2
+		break;;
+	*)	shift
+		continue;;
+	esac
+done
+
+# up the interface for sending broadcast packet
+ifconfig $INTERFACE up 0.0.0.0
+route add default dev $INTERFACE
+
+TMPFILE=`mktemp /tmp/bootpc.XXXXXX`
+
+/sbin/bootpc-bin --dev $INTERFACE --returniffail --serverbcast > $TMPFILE
+RET=$?
+route del default
+ifconfig $INTERFACE down
+if [ $RET -ne 0 ]
+then
+	rm -rf $TMPFILE
+	exit 1
+fi
+
+. $TMPFILE
+rm -rf $TMPFILE
+
+[ -z "$IPADDR" ] && exit 1
+
+OPT_NETMASK=""
+OPT_BROADCAST=""
+if [ -n "$NETMASK" ]
+then
+	OPT_NETMASK="netmask $NETMASK"
+fi
+if [ -n "$BROADCAST" ]
+then
+	OPT_BROADCAST="broadcast $BROADCAST"
+fi
+ifconfig $INTERFACE $IPADDR $OPT_NETMASK $OPT_BROADCAST
+
+# already added a route to the network.  just add default gateway.
+for i in $GATEWAYS
+do
+	route add default gw $i
+done
+
+[ x"$SETDNS" == xno ] && exit 0
+if [ -n "$DOMAIN" ] || [ -n "$DNSSRVS" ]
+then
+	mv -f /etc/resolv.conf /etc/resolv.conf.old
+	if [ -n "$DOMAIN" ]
+	then
+		echo "search $DOMAIN" >> /etc/resolv.conf
+	fi
+	for i in $DNSSRVS
+	do
+		echo "nameserver $i" >> /etc/resolv.conf
+	done
+fi
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
