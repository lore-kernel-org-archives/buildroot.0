Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9E5C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 12:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E3781423;
	Tue, 29 Aug 2023 12:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6E3781423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0osyhsy9Pvs9; Tue, 29 Aug 2023 12:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03DB681495;
	Tue, 29 Aug 2023 12:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03DB681495
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2A1D1BF4E7
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 12:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A64844081F
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 12:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A64844081F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVE5pv8xj4sc for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 12:44:28 +0000 (UTC)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::717])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51459404D1
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 12:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51459404D1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVIvxkpN5FqmLUKRI5L0+1zmpwxv1C5jowPmSyqfG+PvE+BbzFB9xFNjC4WkOX2ZR166T9e3GKu8GdC3rjzaJ6ZAgpX2AjT8SBhTpA/dMRH7oVB7RBLAORf5ktMv/EPQN628gKJXm+VxyiDIlL0uyUn3kJAKBwvANEOko44wwATWrqgfJFhyUWlIUlb+fTg2g+Zp5grIPWBwNzh+d1J6n+ZNxYzFdhJjw7EX6CmGRKsPZZJJBWKhvd+4Ze7rcQwRKb/kMOkP2jbjRIBFf04ZbeYvDAcEGp294Kfx+pbCI3jl7dQ0X/Ck1B+xlQ4eSiOOwXI2bVxEiei8h9qoWjH8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDv2PENtEwTltefdrWeXIk4RhlIHeKOZCKf6D8qN6fo=;
 b=D5wBJVi9LEDX3eh2XePVrkYtiTsj5sTonEMzS8R04Nfz4dhzgzh3170JD0dzfeMIbZl+cHXfOSQpgI8vCQKMk9C7ZxxH7S3b1Q+8NV7GfK4lzzRMa2qro4180edMnDuiM0c4E6Xc8y34WcgARnJPKlsrSUaGUJIW2zW8KZert/NUpQsQ8pivzgsKHwGx/tf8qMkAf5Wb2yKf6Kunk/mMjRY6Kv8Nq4rhJtSOcOcPPK0//BnLgTAErC/NV/wr1udYaDHZREYA4BIcGwVBmIL2BXROu9Xnk0fDCpkJRaZPk083Cd/nfHXFA6IIN8vCPYoYro00UQtgsaEbC/vlKPo1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=borea-dental.com; dmarc=pass action=none
 header.from=borea-dental.com; dkim=pass header.d=borea-dental.com; arc=none
Received: from PAYP264MB4285.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11b::5)
 by PR0P264MB3174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 12:44:22 +0000
Received: from PAYP264MB4285.FRAP264.PROD.OUTLOOK.COM
 ([fe80::bd35:885a:504:e0f0]) by PAYP264MB4285.FRAP264.PROD.OUTLOOK.COM
 ([fe80::bd35:885a:504:e0f0%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 12:44:22 +0000
From: Charlie LEGER <c.leger@borea-dental.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 14:43:51 +0200
Message-Id: <20230829124351.1405520-1-c.leger@borea-dental.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PR3P191CA0036.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::11) To PAYP264MB4285.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11b::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB4285:EE_|PR0P264MB3174:EE_
X-MS-Office365-Filtering-Correlation-Id: 263d8081-917e-4e54-f908-08dba88dab90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQs/mCtqY2ieEUrE9W9AfVMPLDMHV4QJpKPdRB7howoo33Tl8izDnLYbpgZUBcCsKJtev+k81+zH+G/TA9OmmtymAGeRoz8wK8MnCX4H/J3P76glVLV8nq8XB0vyxOvRx2LqL+ct+qADkN1Ku4Smw79Qvsi1OObn5ChZ1c+3CXO755/M8OmFFuJSFslfdVOjkOluBkIu/xuKkuBPj0Fl/3WwF52RHT8S5jhzbO3Vjme5xF4Fiu4744nXo7iHVkauy/mcNsjkr5wKGJBZVnarjGul6gE6RxNIsOr47riL5L4WxY8mkUg2vsrhwKNKoxp4u8aUGCUTvTC1AIsyhaCT7KNI82SIpxF/ZvXSASQ87xWvCiUEzagq8ZY4sQilzxarefXkfbr0qdxfqhdob2T7MURSyPTRi+x1EdgQq/AnC4s+c6UMUjdT+ua3HzMr78VWBkQxqViKu5d926hrZGwhHSYlDz9N8mggEbQn6ij8f5J2dPjKCXOcx50qgbkJN/T6AGOdHfIRSaAi5oMjBfPoE/VZG50RF+I4qU0Ws7GHjIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAYP264MB4285.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39830400003)(376002)(346002)(136003)(451199024)(186009)(1800799009)(6506007)(6666004)(6486002)(6512007)(86362001)(36756003)(38100700002)(2616005)(478600001)(107886003)(1076003)(2906002)(52116002)(83380400001)(966005)(66556008)(8936002)(66946007)(66476007)(4326008)(8676002)(5660300002)(41300700001)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a9kmGwzaS/E+fBUAf4Gc1D6qypYNb/0Cte1HsVjhNvuunsvq4i6uJx/4iPzi?=
 =?us-ascii?Q?qrt0lS010nQMmyVwN0CAg0IgPkWVK7m2mgeMU1tsPpBciJtLRDpkJ3ZFN12V?=
 =?us-ascii?Q?R07pikfpDw3J2nOq50EzM/qnRgsrifgduJeNKxTurS+SZpziFa58Mbz55B4q?=
 =?us-ascii?Q?EwZaDpvAqwCZMAU9EwsLeRwhauFM+aTtfUJ/oaLL8Zp+E9LF++r7HJecgkUC?=
 =?us-ascii?Q?RfreeaGFoR7vmd2XSvCh3kpyVU5+DMm5KeZ0GxW4zqta+hAPUpQEwQmcv8Hq?=
 =?us-ascii?Q?b17Fclat90SNaJSlYT9Lqys1v1Rq0xPUuevLl53rHOvWgxlgtOU0xl1A+kpR?=
 =?us-ascii?Q?YOxkscoRgglpMksh71kBP/K9MSmQQ8/+i5DmUu0gd7QB9a4vML3GTyvm6rk8?=
 =?us-ascii?Q?XNPIc65Hc8w87Lr1PN8azpQQFilpsRhT0hzFgQIQ50YePJL6sldchFPVK0XL?=
 =?us-ascii?Q?KDGwFA3i01FceAI+R1i756OrzMbfh2HwX7/bPsE2JlMn7wa7aQFhTg3QpjAm?=
 =?us-ascii?Q?Sad0tClkUJ4xv/yDccpRzIgJDC70729R9tsOEOURhinGTOL5LTPY+0+3F2DO?=
 =?us-ascii?Q?5VsvHz0SCmg/8B4m0Hvz/EN+6xvs4ZB5G3b1CYl3QiDmTUFqpteVOMBMvTQ6?=
 =?us-ascii?Q?QGXRBbhT5BmgbfHk0hMwmh1YNYS8WysTuwsQl8Je99x+BLgsXwcrMHDrt7uq?=
 =?us-ascii?Q?g4TL50v9HLSK0ntii2/baVeguh9tA7jjp9AsU3e7bkNXY9mI5nSPd6pVVAwI?=
 =?us-ascii?Q?eI6fXsP4+aU/l7+5Ezs1G0mB2pxXZaibv7ND95CG1+DCN+GMd4poRc2UqNGr?=
 =?us-ascii?Q?sS6M8wh9+7JU9ZuszUlx68OfFrHRTLP+BcLB7foMP1EqFRMYOSYfupVhtWoa?=
 =?us-ascii?Q?ogLHWvv0dpKqlPqMP/AChdoXveh+cow3DK0yMiNQr7g9EOB8IPPv9H6t2/Hg?=
 =?us-ascii?Q?eRXFDUthMr5/E/xyxWny5ZyFWi7f5UGozlCV7WfqT/nemRI8+bN39QviuBSC?=
 =?us-ascii?Q?daMoaVSR9BIwLFSBObpOSkyYHJKVUZaMDogPYr4tQE+eWTvio3KcWdq/tH58?=
 =?us-ascii?Q?83s0eWPDVz/US2J+DU6H3I1f0QQIVWGlqZIUOTrqONJANRkzjAXdOpjSN/1g?=
 =?us-ascii?Q?TqdWw9w7NUc8/wxWxHGL8mtibQqteYFEXVq8Qw8shBTsx3FTpVaLebJ//g0/?=
 =?us-ascii?Q?wE2lb/Rm74Eht4yvTAaq0TELMLHV44Hdo+nvlj3mv3PXgsmWW4L4zhxpUtRV?=
 =?us-ascii?Q?3kcJtUF4VEBkfkWuNP2JCQ0MD/UjpQGllBZHL4bf3EYP7Ui84cZdINrYngzT?=
 =?us-ascii?Q?au8y55ooG2pItvgaW3wbN8doq7Ge5vkphFvwb3A+m8ey57WxBFz3hD0pOURh?=
 =?us-ascii?Q?Hx1/Ys3ylgNieVUmoC6ANyGvsYLHv81UCDVMGrcxQYK55jncZOWkAoU3wwEA?=
 =?us-ascii?Q?5N9teYh/cpoOM4Fp0S8mY4gCXLeoQOtblOmshvJ1WPlR5y+CEO7o7lvRJnac?=
 =?us-ascii?Q?vwR2roE2iq7yOua0WsVJPhZLafYDMBDPGfRtJcOMifM4oFNW9x+yQKyJp5Y8?=
 =?us-ascii?Q?sdpA1YRkSsG7ag8qvp8Y013WAph2Z9y5+5fxyhZc71yh3K3O5ZtcQzz/ibWq?=
 =?us-ascii?Q?E18I9U4TukbS34ImbHkmad+0hU+AdHIlvrDP9sOKc3Y2ZuwBjo9E+uExQapu?=
 =?us-ascii?Q?huwMdw=3D=3D?=
X-OriginatorOrg: borea-dental.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263d8081-917e-4e54-f908-08dba88dab90
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB4285.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:44:22.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43aede4d-89da-4f78-a51f-69f6b16d8910
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZCNiZx/LZS0gFTC9x0ees5nm/Gvt70fzo3uIZSEuAMaRzTTXPpz7eMkNAd1zSda5QbQmY79IngD/yQMGNPVacktOLAhzhIwX+BRyAHtkd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3174
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=borea-dental.com;
Subject: [Buildroot] [PATCH 1/1] package/libzip: bump to version 1.10.1
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
Cc: Charlie LEGER <c.leger@borea-dental.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Release note libzip 1.10.1:
https://libzip.org/news/release-1.10.1.html
- Release note libzip 1.10.0:
https://libzip.org/news/release-1.10.0.html
- API changes between 1.9.x to 1.10.x:
https://github.com/nih-at/libzip/blob/v1.10.1/API-CHANGES.md

Signed-off-by: Charlie LEGER <c.leger@borea-dental.com>
---
 package/libzip/libzip.hash | 2 +-
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 26c038e4b6..93dcb49042 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c93e9852b7b2dc931197831438fee5295976ee0ba24f8524a8907be5c2ba5937  libzip-1.9.2.tar.xz
+sha256  dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318  libzip-1.10.1.tar.xz
 sha256  01c022eca6d566e2e8792fd0f091a28653b2a608319922bcd4de91c49d1438e1  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 0c9d66d877..cf85bfa8ce 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.9.2
+LIBZIP_VERSION = 1.10.1
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
