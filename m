Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3F9C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 18:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DD07402F2;
	Wed,  8 Feb 2023 18:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DD07402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aAblqljRGen; Wed,  8 Feb 2023 18:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68E3C40272;
	Wed,  8 Feb 2023 18:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68E3C40272
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 683A41BF5E6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40FA2416D4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40FA2416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qzsMfutej7NW for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 18:55:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A81A7416D1
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::720])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A81A7416D1
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 18:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2jE4OsBtI/GygAsMe/CCCh5iU0PhE9dhFjEPHPRzRGnz/PhSUveffYIswfKWw9aiVtQ7gd1wvoIeZdyviPfjKK0WzqP1BMqI6kGP9Z3MJNl+hQI299YsRedYZtPlsvJMCC9DMpC/cyq/hLAX8W6xjIQh5tWzOIpj16NRCp6rLEQhsgFVHHXb3noA447XpfNvjhrgZh9/wWEzEi/Ewa9eoatLPg4OxmGfmdH4s2BpmDvJ8XgBNH13qybFvOMSPYUI4R4WBTi7yywQrNt3smk+jqdEFDmwVBOmfmGlTKKxknEMaePR8+0QKYFcIIhcbK44bCY4AFPix/f1GDXHn43hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGdrS5srJnlU1VeptAAZbTxYGfnjjiVFegseVtZ55T4=;
 b=m4jhIQPL3wLGUD3Xa7PLYNNSnxq8SQ/rN2gYeYHIOIujrLeHEp5pcLoxw2pqL4uDGzp82yQQvBI2up3ao8YpE5xPRst0JKGpUPS/wEGM3okB00TOrGQJWxdeXgVxqDauVYzakufg88TnFnorATPK2Riq7cfUeBrCdw3Ty3AgjtkLH5KGoMpRAZ4RLzFQajby6IvSmtAPGiqgVwk+/oE0qIvW24O79WHhdphCRWl4hfvixVbF/8gRhGniGNUzbOHSHCZQgX4SvS07NXHYgfPNNvUd9A0oGqBPF6/WI1hAo94ACqWqHwlXFBXWKg/uZ796gbZSJ/kKUJUF8BAWSh+MpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 18:55:28 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::1897:6663:87ba:c8fa]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::1897:6663:87ba:c8fa%4]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 18:55:27 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 10:55:16 -0800
Message-Id: <20230208185516.858096-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|BLAPR10MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: b70fa4a9-f693-4156-aeaf-08db0a060b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8CX9tvYyjDcM8s9OCN9jY/zT2TZIxWXkKH+28vM/iG9Jh95yOoWOenuni3ymHwjX1FA5g45nULa1ZIkWpkqYg2TNAhqcyL3Mb22j0BqF5Jm6gfBqvabmfQ1cpRqPCT+UEDBkNhhh7SWhOoz7a3fNazmCgJrS+5Rv/uHYXCkpdV32eA5fToP60FFy/7ub7yrXxt5Od8HwhzywO4DF2WvrkT5B574kBHYrXYQQy2FmvPq/4M2RIPKDlNoIy86QFDSB3Jy8X6DsO7CBsDhfJxcyDb2fIU3/a+yN1gzCPa4jnlJh0p9zBKzIfDXsp8+gkfLqLm7bNY+tBJxCC8hiewNTpMnLZLLnzt0SP3h2pL+3EAXZLpHVX2Ra9gMIbzIjVO3DGFHjLu16h5pHJU7wyVW4/EyJly1s2NmXE9eFU+OmRbkadB1dAcMyIJxf05ls1PhmM6PthclZnHgvsHtSG+u22EJiRxWAFvWRhvrLlbgD58D2XN0MudML2Ek+yCflr5f0G/v9gcyfhIZgA7DHwrsolVhFtp3zoXIezRkwzilgTWGhoNGwR0a+ELwC5hxqVLJEZfdowd0M9Z2o8/Mb1mNGMasPea8g9sztXYDTOxEQadBFEgNrCZVOr34nS3k9kLNYR7uPrHPhfQwUxpSFVOLbM96evQ9CB4sLl35L/B2BgS2GPZ90MRHmZcibaAdQ2E6Ub9oySZXJnCPNJyR+f9cRHuiCLmNY8/BOAoQUga4s0+1otU2S1OJPwJG3fvAlFkvgXy6czDTpMGoxfeefjopAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(346002)(136003)(376002)(39830400003)(451199018)(26005)(186003)(478600001)(6512007)(6666004)(52116002)(44832011)(966005)(6486002)(316002)(83380400001)(2616005)(1076003)(6506007)(66556008)(66946007)(6916009)(4326008)(41300700001)(5660300002)(38100700002)(8936002)(8676002)(66476007)(38350700002)(86362001)(2906002)(15650500001)(36756003)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lOObnIDWIv0z5XSburXMQ914lYN+N/CndTim6GRNPwKsL/6TtGe4ZfdbbfIc?=
 =?us-ascii?Q?lzAtj6rEycD0Q3mPuJKFMld9p+Xt2JaE/lqyH+A61YPx2D0inhs6QzfihAfg?=
 =?us-ascii?Q?cqvx2jmkdkLQ0UWXaQDM3mlTW2eOXhemCJO7cdQkKXElc4yXlhahBKOsTIhw?=
 =?us-ascii?Q?Uf4tfUEAtAo7CKn1XpfWsS+OagFqA8VZw/JcjosJYjOxZsmAt1T/w8TFx+uj?=
 =?us-ascii?Q?DIDUElmtV5SrT7YXnGXoLDG4StVwIgaRvtnGP1dtQQKyIu6uglc0mMsvJsXV?=
 =?us-ascii?Q?FXIuqGMvf3aUy/8Hi4zLQ7cvHIZGy+O/GbcMYsjLHcec+yAGyIaTQsgvgFuE?=
 =?us-ascii?Q?8AdBuzUNW68xUkyMH+9BwD2mve0g2TC7CqKONyLu/K4OgSZgED38jJHKr1ax?=
 =?us-ascii?Q?7ot98k5zyMGxzT3LvrlBTkWKr8wt7E9qTtpzLzK/nNC92ghkteRNdb39abpw?=
 =?us-ascii?Q?sMvi1B1IQY6XZFvngDZ/BdRXz8n1syuO/d4oD2NWj9jvDRIZ1FYr52HyMJra?=
 =?us-ascii?Q?VxOIfwp58sXwe/6lCc0MktxZeCSRhF85vA6buO2qvqBt8dvxJGvHK9KHZFBM?=
 =?us-ascii?Q?i9hZnEKYQNCTRXwHwjYHk+5nIPhY7kWbi9C6yz+OeV8O4p8bQb9Ikh11KcJL?=
 =?us-ascii?Q?VkTeB+0CnqaVZA8Zkb3iLVqgcekG1F9IViKOybf0V+fDPpqO+tI0oODMXVmJ?=
 =?us-ascii?Q?Y7lx2wamto3XDaprM3DFdZ3bjktSeSscc9kKaGter5sSXky1pQucssrjBxMr?=
 =?us-ascii?Q?CpUipdPGy7Sw5d6GpAgNZ75ulhEEzNSwDlU/h2R2R5sN9pc84AUt9aWS6YPh?=
 =?us-ascii?Q?ayXgGjUH6MTgA4IWR/RYexH4lF/aG+wNcx704R9c6BMqulK6tfCsrWf/pDoA?=
 =?us-ascii?Q?c1lthhz7xfo7atx9At5mUToVaKKxS6BLuk7x4Yekh/nW6Vffsv1i5TW8AOX5?=
 =?us-ascii?Q?Vtq8CmwAbWBnHVcAI4doQuzCilWa9T1qU2Cfr1Qx5uYA/YvvpokqhlJ96BcG?=
 =?us-ascii?Q?3MkrDbNXhAWSG+okYSiPunf9/TsPf5C55EsWW4VRPxI28Ewn4/hC97s7AGuD?=
 =?us-ascii?Q?3qVxxGvsgWppHK2hBt447QMKKd6Oh9DCEMO6CA3fTL6PcifHi6XmGFTUVPpr?=
 =?us-ascii?Q?9lmsLOsxKWfSmAtluVj2Yg9hdVH+2ArsXGkJzR/XTXxeq0d9C3h1YnIcXoFQ?=
 =?us-ascii?Q?1XLMAMq+I8HXvR7vqQi4QLUv5uxYYd3gOhigbYMYnOohkN/zsrpkD73Uin8W?=
 =?us-ascii?Q?53FSm4fUWYXRyHBmEsrxr/e48bLwDKQRZBT8y7x5YiawC65x5iEcJECPUq4R?=
 =?us-ascii?Q?5VAYPkc9yWkmSBp9ST9Un2NIQ4VXbprDGSvcQU4iC4BS2U/+Ny3S6zLEDgGO?=
 =?us-ascii?Q?+fT7AzsJc18rbWyeKcGLDh2hiqCaSVV4YEHWUYXRmYSpWTy0Zk5jKzAdo1Hu?=
 =?us-ascii?Q?nK0adAsL5asVOmoRmNE+wjTBhiEnOfSnGnEJJp5/uB1yiQutYU+PNFMydVj7?=
 =?us-ascii?Q?n7GhK+QzFsOyg1Lyv9Kf4TE7ud1r/8M4Sj9iu/u6vUqmzBzVSzA1MqTS1GnR?=
 =?us-ascii?Q?0hy3+OS7Wifxq3QNPcJ5HJZXcQLD2tvTu2llsKrTGbFA6RxXA3e6NJY4iNzj?=
 =?us-ascii?Q?KvmTSTNgaCvZmHjB3XqRWXM=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70fa4a9-f693-4156-aeaf-08db0a060b14
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 18:55:27.7230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtpyKYOPW7rmna9qrtjRhtA+r6tr01dptfm9kYuKBgHFnBEu09EuKDKgXQN5PgNU4aYb3sbPSGXUy3RWkBAOkdYG2pemz9341q60MUfr3Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5009
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGdrS5srJnlU1VeptAAZbTxYGfnjjiVFegseVtZ55T4=;
 b=espPBWmwUZeEMlcc/BboTRjQfi7sJZTHwjEYcRu34MY4EEvcE61XPYGnzo4NoMBnvXeDOYw/OMPQXSYoLk3wZPNjDFbTBZBiLYAwt3Y2vZcCXZUrGO2JS3Oa9NFXLlhT550S33TAhYfTJVksenyFu0Zr5BHKIRT1n/rzAkstXm4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=espPBWmw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [PATCH] package/rauc-hawkbit-updater: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add useful tool for bridging RAUC with the Hawkbit API.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 package/Config.in                                 |  1 +
 package/rauc-hawkbit-updater/Config.in            | 14 ++++++++++++++
 .../rauc-hawkbit-updater.hash                     |  3 +++
 .../rauc-hawkbit-updater/rauc-hawkbit-updater.mk  | 15 +++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/rauc-hawkbit-updater/Config.in
 create mode 100644 package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
 create mode 100644 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk

diff --git a/package/Config.in b/package/Config.in
index 511e691ed3..84e5efa856 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2677,6 +2677,7 @@ menu "System tools"
 	source "package/quota/Config.in"
 	source "package/quotatool/Config.in"
 	source "package/rauc/Config.in"
+	source "package/rauc-hawkbit-updater/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s390-tools/Config.in"
diff --git a/package/rauc-hawkbit-updater/Config.in b/package/rauc-hawkbit-updater/Config.in
new file mode 100644
index 0000000000..bd7b8d7cf5
--- /dev/null
+++ b/package/rauc-hawkbit-updater/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_RAUC_HAWKBIT_UPDATER
+    bool "rauc-hawkbit-updater"
+    depends on BR2_PACKAGE_RAUC
+    depends on BR2_PACKAGE_JSON_GLIB
+    help
+      rauc-hawkbit-updater is a link between Pengutronix
+      RAUC and the Eclipse Hawkbit API. Hawkbit can
+      communicate to remote update servers, and use the
+      d-bus interface to trigger updates from RAUC.
+
+      http://rauc.io/
+
+comment "rauc-hawkbit-updater needs rauc and json-glib"
+	depends on !BR2_PACKAGE_RAUC || !BR2_PACKAGE_JSON_GLIB
diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
new file mode 100644
index 0000000000..c65ead3784
--- /dev/null
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  42318e96a464e6c716edb45c48bd3ec3b874462973db902fbe099a395e4acb4b  rauc-hawkbit-updater-1.3.tar.xz
+sha256  041234c81fd6fe6c531ea1a886b9e740b9ee06759d1a910a14edbd06f4aa62c7  LICENSE
diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
new file mode 100644
index 0000000000..5a74181361
--- /dev/null
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -0,0 +1,15 @@
+###############################################################################
+#
+# rauc-hawkbit-updater
+#
+###############################################################################
+
+RAUC_HAWKBIT_UPDATER_VERSION = 1.3
+RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/releases/download/v$(RAUC_HAWKBIT_UPDATER_VERSION)
+RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
+RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
+RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
+RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR = pengutronix
+RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib
+
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
