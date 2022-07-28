Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4473BC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 23:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D623060E94;
	Thu, 28 Jul 2022 23:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D623060E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugB-ZvFi_Mjj; Thu, 28 Jul 2022 23:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 061F760E43;
	Thu, 28 Jul 2022 23:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 061F760E43
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 125991C1190
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 23:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDD2060D5C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 23:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD2060D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-sk11fe09iy for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 23:24:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E04960B47
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E04960B47
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 23:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KX5g8x5F2u5z0CYwLin+YdESA62xolJm+0YBTq0lpGZMKkOLwc7r9bCnxYJJ5TZ0BJs0aIOYB7YxI0IX61MyneQe1n18p59hk4xM75dRNM6uAh90LnptW5As9V1tDDfqvfvRxm3waorSTpV2EG5YM4ok7a36FuZfTHe0MBaeihdwbAu26bSL/l6MBrji9kOjBCw9L41tEQoO2it16NUU8JLgajGPeLza/CB0QaYwOso6rWjwiReuGK8vjECJVR6GyA1gaah4lEh5AXoK2NrlBpo/twSbKSA7M57Z1SmGsDeWdFZBispb9CeoaaSqeZRQiHv8atJz4WlAa5zG1jUrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScMZNxmmBGVnqwtSKFLuWVmDFmjm1vGeSbJSyFg424A=;
 b=oSvyUIYbRDMvaaNkiztsv65Jj2ir/cuPYCYGA9oG3dlbSZYkKIp7noM6Jnt5qlMxw/0mdeXbVNgJRAfKfD+o1RgHUJp7rrtWI3w4gjMUXTXFSdsb+t+ImmugPWc7Rl0m5dZyiaFjD+VoTWaJ/sici5hrc06rUJcqnHQoXWNNRNMHodrj2jpt7eNTsR1hF2Dv5lMF2pxMNCSpXXu1dzJmdM/77ScW6hcIIiAwKS2e7ogYin3Pr3jvkS5RxJpSRFX4FYp9+RkifBxlkTIWvZLxTgHUgTTjyBKUry2FiPMN0nUbLI4TWy4QRHRvrg0mZYX4ksm1wT3odcuocaeLdktHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by PH0PR17MB4688.namprd17.prod.outlook.com (2603:10b6:510:86::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 23:24:25 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 23:24:25 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 18:23:56 -0500
Message-Id: <20220728232357.270130-2-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728232357.270130-1-sen@phobosdpl.com>
References: <20220728232357.270130-1-sen@phobosdpl.com>
X-ClientProxiedBy: SN6PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:805:f2::22) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 249e354e-d9e5-41cf-e992-08da70f04ed8
X-MS-TrafficTypeDiagnostic: PH0PR17MB4688:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 83gFGCXS86AM7QvUmdB+dleT6nNODhhvmgF0xAZGnC9fb4IoWx4sLCXxhoXUU/PB++bS6BcykF8PiAcbsJfdECqD9FoJBsmSZYsulbMuOz4AdZb5fG9sK1p1plg3J2R2KosQ4ErKb4t9w781zj388kAluCXcw+xvhT8kkfLUKe5jnCCZ9pxRvPod+Ra7WzGB7k905utvs77K4eHcanGxvP7/Qk8qoqHPzomZwUPQfU5BTuMkF6EJh1Mwx/qSud/QlMgKYUa16k1804mPa+GwPXB5DdfN5GzTgrtJnLLJzZ64zPWvJZZKR1Twe2/3RME/NBFNVZXX1fJ/HUmG+op9Db0XCuf+92MAP/iSN50MDf/siZ1CW0mtv7f3amJIwnGYXiSGwZwSYe+ImiAwyXLQSgDJNWjU1TvRq886Itcp6/TkQfT597n31cZBCKF3X1BJ21MW6Akw9E5FrslWdeVNLCN3634gtGtweE8gpCiiS5i/GZaiIHtwtM3l4hDKt4smQrSRofNaFhftvs4zlroVm6+WnDAnvQFY5wEEJHR2lCRzlkOZPzqvP2ZMhTA5lmWaVFKBPgkfwYK/RTSK0bpiljRiUui68qyGSa6w1Fd2YaZNUJlQhDULlCS8V99lR2lJK/ONPxlA3b5VeHdDNW18ElH5XprZmXYfilg7J+zSvh2k2u3vRa+WUL2SZZTH5qM5Dy7zgu41ajQzq4pwfX/w9ei1dtFhtwqayK7oMIxuZBU1pbxCt+x8lkEW6dNLfPbWwgja+kG1MAdH7Fj0trtZARMHc/JSmv6C3e2Hb2lJOWKreQljRp/AOPNoKqMZw1Pxigh1yEwKMTfMBS2KPtNTUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(376002)(366004)(39830400003)(136003)(66476007)(8676002)(66556008)(66946007)(4326008)(316002)(6916009)(26005)(6512007)(52116002)(478600001)(6486002)(966005)(36756003)(1076003)(2616005)(186003)(107886003)(83380400001)(8936002)(86362001)(5660300002)(4744005)(6506007)(6666004)(41300700001)(38350700002)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OGGcJw54hdmd9EJdRl/m748DecbnZmRGebIYXnV82UQStDgvsvBBP6VKT7Bt?=
 =?us-ascii?Q?xzEng64WvJHttrkStjKcAJxtrxw03/iDxTDqv23+4fSEGiTk/sNWn7vmcprG?=
 =?us-ascii?Q?gq/ZVWBs8UeI4DxupnZbU1KmYsDd2/w/hCJmejV/OABevApXAOsCWa0abJoN?=
 =?us-ascii?Q?q+GSv8CpzuvZmNQ3KMKnQFYXDg5tLcNGj+mCz7WnuCrbmKrfM0WJEbC/zNBs?=
 =?us-ascii?Q?4wyzzF8k9vEeE98NcD30hc5COnOblx5X6bRTDz3SdpHNZGDfgSvivaMpdzH0?=
 =?us-ascii?Q?NPqvRfple/lbBAVl9JXUdi1II88rTW4+58RcamVtc7KCK1o3CY9hvxqEvxpf?=
 =?us-ascii?Q?XFqctx5+uOXgTpTFHefgt7DGPCtejgb/RvH5Zv9VcK0shVAjoacMAHtx8c4m?=
 =?us-ascii?Q?IdCU8FH7JzzzPaDy33bSxIyJOFChcbeVGWiiLHGt+H6vCI1z4c1LXYLT9CyK?=
 =?us-ascii?Q?Wf3yvebgbkSq3ycFsG4rObgoKrGSohS6SztmuFxTXgizkM1PaSz8A+2gQeax?=
 =?us-ascii?Q?rmdMLRGIRlUaNVjrOcZu8/86eDj2wkfcX1KCw9f5A9dX5NwcDv1L5/gvLzYS?=
 =?us-ascii?Q?m6PiHmVkhtwUdbjLZS0EAtRdTaSanabNoTUsS/RtZMtj4NHWqDjeJRO8X1GD?=
 =?us-ascii?Q?/dujwSIX9K9601tX0LpCo/K9C/HL2SGH7AXNrUbzOgJdElki/TuUno1yg+Y0?=
 =?us-ascii?Q?BGcVyPPiQY6I52QLMm70P5oYpcuJK38goYoOAxV8JjoV/rQuTKN3rCF6hIUV?=
 =?us-ascii?Q?hY+l+sRUgpEsmZuo3tiLoPlkMcjHfyQBcW75s+IcRzSURIBwu3w1ao1qlp39?=
 =?us-ascii?Q?KA2yVyld8AkAkSUYCI7TgGDiEbL/NIcoSDfJgIP/9Xt4rcmWxZlR5mN4AcCF?=
 =?us-ascii?Q?ia39pk7dZKVB0F8/EW46P8hj9W9vVlFqgTLlu3YbNuBAnUcLSGBF1y0pMZyP?=
 =?us-ascii?Q?RpQn1pTDpkGRJurWzVszeRinGa84Ltp8DLuMTE6+5VdZAU5iEdFpCJuS6prd?=
 =?us-ascii?Q?U5LLo9Uays3fql3ut/wLQ6LF0DgQQzgmFA7OSjo00ckFYvG14JgJCdt1WpVK?=
 =?us-ascii?Q?Jn3X6Qkcj3O+ZVVmNUFu3qQ6dpnQnz39tJId7L6wA/DkZ82YSwxNg5lMaID3?=
 =?us-ascii?Q?lq9sfiZj35FbyYG0gwBqwIWCngYHHKsXZDbs4/1Doai8ufwUXjfdiwEW1fCP?=
 =?us-ascii?Q?lIC0mE6WrFnABqfIilaOEe/U3a8NGOp41mCZUZXaE1kzV0bgpxitBi/kB/Si?=
 =?us-ascii?Q?b9DDkXD4Hz50pIi6XszsvUvRb/dH6ksXOKKPRc5cAi+8ozLEc1Q7fgkT6ZwY?=
 =?us-ascii?Q?+sw47T+Vse1yQJpc/YBR6U3/BruifgpPyLe1MK0xLg5Oa/i5DkLcgyh2fa3M?=
 =?us-ascii?Q?iLIVDWZdDLZUHqWCziHKVAyY8IsbEFFPNeXl2RcIVAy4hb8tSPsEj+aJmO2x?=
 =?us-ascii?Q?YR7Pz1Z37ywsO4THiFGapJoLF7j2X5vsAQMfFrdeRHrMQ21NFk9o000o2+14?=
 =?us-ascii?Q?t3vos0jfXm8QadLlI9qQzZ55VhxRFGI5z4xBpj1WOKBzO3Sq0Y8JqBTXQgSr?=
 =?us-ascii?Q?6ETgK0WuS5FtyOufjjkD9QT1o57nM6XbGkLoPSTL?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249e354e-d9e5-41cf-e992-08da70f04ed8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 23:24:24.5209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4ObErl84DSP2fzcRZUO45k6xmL6XtabFkzNx+6rIA22AbOSsQHaMa1V8KFGzNwcQ2ATGEEN0oz/srdYVlVGpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB4688
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScMZNxmmBGVnqwtSKFLuWVmDFmjm1vGeSbJSyFg424A=;
 b=jkaEglxbJjnbC6kRtsiRWHw5MZ710TbypiOnj/48ZoBA1gKurQBouqygdhaNS2ZKb9nJ9FXLAnrInjTiqXw9gnP7PY8kcb6cWrEpFJ+HQo9TJWikvFmn9Xz8Yd4iBaRbLYEc9Vx7LU15P27lzzXl8uF136lcU+TnzeuBiUih2yc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=jkaEglxb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: adjust column
 widths
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
Cc: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adjusts the column widths, mostly for asthetics/legibility.

It is primarily for chrome based browsers, which like to
linebreak on explicit hyphens, meaning every CVE takes multiple lines.

see: https://github.com/w3c/csswg-drafts/issues/3434

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8ce4e3f260..4b396d3217 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -853,7 +853,7 @@ function expandField(fieldId){
 #package-grid, #results-grid {
   display: grid;
   grid-gap: 2px;
-  grid-template-columns: 1fr repeat(12, min-content);
+  grid-template-columns: max-content repeat(5, min-content) 20ch repeat(3, max-content) repeat(2, 20ch) auto;
 }
 #results-grid {
   grid-template-columns: 3fr 1fr;
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
