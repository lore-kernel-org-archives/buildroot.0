Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA699C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FCC04150F;
	Wed, 27 Jul 2022 15:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FCC04150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rizkn6tL5LLu; Wed, 27 Jul 2022 15:42:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34F90410D0;
	Wed, 27 Jul 2022 15:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F90410D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9834A1BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 712C8410D0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 712C8410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qF27ebVNh1fp for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:41:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A5A410C9
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2100.outbound.protection.outlook.com [40.107.223.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17A5A410C9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:41:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwFh2dBIftA4Hrbyn5M+xltJ/Du79nsH31+cWzTt7oxiqSllQELhD9p8mOzthMiWZBTgb8UGg+kx53bqi0z9vlHWfBqXFZKVOAmjgTT4pRx3cjeM70HNtRWT1ucbDo8+0N1XS9VSVfzNYl/J3a9ML017tBu1G6CuQPo2jiSH804baiLMqPBVA1PjB9JJnbsU8YJ62pMUrgaVYDbxBjB3ofrJHubkA9PaybvhlGkGT1XYp486cHpOCQEB+pNgBibtakpw3KYT6EDl+ijj2SL2qnGgxehMSv7zW/7PxK1AmqcJ/sEUpj9XDsw4PNeesblWPQI7yMxwmdEDdVj/VhkiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJn0WS+3mbftKioOw6nHrrvGVxrS1+sXKAm8D7WIYqE=;
 b=oImRU0pmsFGH/NuVwGt4QNqR6l038wC25I+RHqh/56nZPaqNV0Q47pb9G5odBFNFey78FfKCXjSjQRplBQ2TCVIKRLprJ8qSQ1J75D9j3k0eKV/l7uE7BTlhoM4HVbuZ/l5xrhOj4W/YDPgHFDJ2209ugZYAcoU5afuff/e4rDwR1lT3Npe7o3cLLnYXJ4N3whJtrYGjjaGQ+Fi22BWTzvGWO894fl0bBsEhe8aSbq8I9QTabrWgKNnC/FvS12aejJ8sVRJ3qvjYAgij/rkaxqeen6kSbGPr0opKZ0E86L7FBh0EkcnI+lyOA4t644UQ5AJcLkcJg4SXhkCJ/1XPDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BN8PR17MB3010.namprd17.prod.outlook.com (2603:10b6:408:52::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 15:41:53 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:41:53 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:41:10 -0500
Message-Id: <20220727154114.1378721-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SN6PR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:805:66::18) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 263d446b-ae29-49b2-3f14-08da6fe68782
X-MS-TrafficTypeDiagnostic: BN8PR17MB3010:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6pBdy3hPbyCLZgiMmTUxmx+JEK+xdfDm4yB9YkMoi2OtnfzNU6fmOkhg5+vxKFN/JB7bB0Ec4KjZMy9pdLWrvMxDdcdCS0fSUMCjvzJchDXtqW0pxVGVg0u2qoFyuj7swLSK4nEJpvb6AJUabTXhZoP9LSxVySTczc2jWf9rKv2MUrGmPe0t0XJqiUa10oDKpH0JPDgYQBCrJanmKXfe9MCTUqHfbFiOgNooBkVU88LT/4fGlrHOg2bWvMVwP7fIzDM3IiVYR3GK3+u5vHat8E8zIEnVzmCxAYwF090p6FJGd7x6WNdmYCHDlTMlZyusufwiXnXo6mG4SsBalsnAp3/g9TKBcqdmDg7xd13M3l5SVSh8p9385mdrwNxRnn0+ms1v2xF0+LDJItfPKmSvk4bJBopHwszsB/qHmikY1GF5GveL0LlsjY2of3c9iz4ILj5SSPHA1VYi5xr+elvy0MeDuKwOU10Aq3JcdLlHzpXBqDT6fE2730lYziDsJeyn3Ahc2xpCDggmCtFA1HoWMxfnsFRyyZQDEnnfBE5yE8P5cfWljzt8T8FInwZ2hHteR+6cNwV+a/9IXCusEnyQY3L3YepJFiafPJJ7eJUHxYfh4AHo30Iu98lMUqhpIjVjbAHbFufDN2aXYXQuammN4P2nNr4yOy87ewSO9pJVIHaLmuvvecppX4kDUg0cjM86NL8adNKot1AqSNSqVcThpS7k8tOHh+URyDJ8P4HN435RtauuFax+nKDOPLD+Az2Sd2cd5TGDHcXIXH3Pff97xBQj7nvy/zXOh7GItlmd4tU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39830400003)(366004)(346002)(136003)(396003)(376002)(4744005)(4326008)(316002)(8676002)(2616005)(66556008)(66476007)(6916009)(2906002)(38350700002)(66946007)(478600001)(107886003)(186003)(6506007)(41300700001)(38100700002)(6486002)(26005)(83380400001)(6666004)(1076003)(5660300002)(8936002)(6512007)(36756003)(86362001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qPPBXKFhB6+W4Nn/YO9jKFeFaw36vnF66uoXjH2MOTCwEYq+77SxiOmmm771?=
 =?us-ascii?Q?4u704NzWLwuzavr4w7Ui7In+TdvZO7y42qroHB44PzojS6UpTeJ2qWGKpFdO?=
 =?us-ascii?Q?WpfytxPluWxLaKOsBP0xPS0nA/aH000jtQNKZcMl3xNaV8eg+rZwN06S3HDy?=
 =?us-ascii?Q?RcC4C/l1PbOi4XFTavfqaL9r9cZ/8wQZYsauFnwW40BZwikjn7OkZUEEtqL0?=
 =?us-ascii?Q?pR/pf6xCH1gH3MGIsH6sWQQvkb+JB0dSJQdT43K1hV/asa/foLebuhq3NbOO?=
 =?us-ascii?Q?wSwnBvnAcGok972WSmF9QaCjFK2rv8OCZpHGIY6+WoqcR94e9qjtdRwETS1G?=
 =?us-ascii?Q?PEyWMsH4meAvaffqYGTkDmc0ODMcWDjbi/dn8seXCGPwnJQGQd4EpwHCoFf5?=
 =?us-ascii?Q?//hpmDQW/FIzXY7ailgn+NPlWdnRlOllwVEo2sqz6qLON7qiZPGuTIQj5otJ?=
 =?us-ascii?Q?zcTmLqfxOi342CIsilBgb1NJJHeogAVCFhOXMrtpA7AQv4r5mOlCCQ0aw+UD?=
 =?us-ascii?Q?FpyVsRQVN/m+tIyk09mZhuelewAl9tEtrqLC/BvcV1VGXUkQ2gV1/alge/sv?=
 =?us-ascii?Q?3sSu7qEhrY8fLAkrUrOXH8rG0rS1f6K7dJe20kEaWoGh5JM8TI0EAdI1nFS/?=
 =?us-ascii?Q?+m1KFAgfiN/yPaPXWQr/qhIGHu21L0MfU/RFFppXomE9o6nVa4f8JIk7vooD?=
 =?us-ascii?Q?W7qhcjvO7w3MBoPla1ckMZx/DL+mqGHinCAYmJM8XlVn+x3oUHHY0PfNXhUZ?=
 =?us-ascii?Q?M5Yu4mhhoNMwAs1ZAoARCpVd8J/bZLQojhTKrpcP9Api3wgP2OG6EbdW8u4T?=
 =?us-ascii?Q?uq6tCzysF3GOeYNBwNoHYhbGQaaQp63VVZ5+xcYhlUH19JuNRmX/uX0uI5Px?=
 =?us-ascii?Q?BbvWEwZFPs6661CQhY//12zdi90Ny6ALSSTD9RHlaBSKff9sPIZJwnIKIGX9?=
 =?us-ascii?Q?Jm/uoRpO35qEoeLuszcnTPV8b9cucGq9JOCfLk/cpI3eRkZH0GvSP5JFay1P?=
 =?us-ascii?Q?WLBR1trZIN7TnQyX97hZBbcF1qnj4FaBxeRgFbhvLUwhxsP3OMPfSTE3E4Fo?=
 =?us-ascii?Q?8VaTcJoGo6Rr1OiornasYdR+DLWDgWpVBvTFN3q3bySQXvQGHtOw0jG/d9l0?=
 =?us-ascii?Q?u4Z2MKW0B3m+DL6AFBbnzbB7TuwBA4idgrzgYIs+J6rhxRzE/IOz+btCRfHj?=
 =?us-ascii?Q?sdhYYQNA1FbM370cbipvbhETEeA3JNrNKTvCp/vkqQi96JjK37P28G/z2/Qp?=
 =?us-ascii?Q?Zp8OVOSI42Kk6s8lyowpmt4HZQzRs97W0LKTErykYwBSjvGY3XP5H3jUqFby?=
 =?us-ascii?Q?aZNCIQXlC3UTaxIK9dUZebVUWtFIzvHPu++WS8jtFc00Dbt9389x+tD2VgV6?=
 =?us-ascii?Q?OaqwK7EdlEEJlqhzoUhmDV4WWwrz1JGYo8JT2gw7bxhiACmojNrnFQWFytdK?=
 =?us-ascii?Q?u4YT+zUJSXGNW2KKQAeZOkDb7rLcw4UxoZ34LGj8zM6hvSXAOLJPI7DBsg/X?=
 =?us-ascii?Q?/6Vqndo8TngIrdm8b8v7hU1+deUWWurzPYmOOZU+KPnayBliPcvcIJB1/USY?=
 =?us-ascii?Q?7sYQdNQjDH4HyJ66HiG44hVD8k2nMgiaE6k4EfyS?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263d446b-ae29-49b2-3f14-08da6fe68782
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:41:53.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cng94MHgD0bBy8/744blWOnR8QDaqKaIkoo8WhovQwd9T1JJKJb453kyk67PCOdTfjkRv+bKh6oiIRm9sbN4Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR17MB3010
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJn0WS+3mbftKioOw6nHrrvGVxrS1+sXKAm8D7WIYqE=;
 b=jKw786nXGYwXsrGoLLDnDVk80Se3MWzi+KJTs+lHR9iBx2JvR4FDIwp3SDDJveszzdglJj5iZpzbn+TyP/pHFo/Tk4XS2fkH5APnDEf3EJsQZbVmx2WUNEmMpjKdn3/KiGD4AHOYIVk5iFDh7WHWPxDScUKbddWov7NYljbqqEs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=jKw786nX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 0/4] support/scripts/pkg-stats: sortGrid() and
 CSS fixes
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

patch series to fix some perfromance issues as well as some styling with
pkg-stats.html

Sen Hastings (4):
  support/scripts/pkg-stats: fixed CSS cascade
  support/scripts/pkg-stats: fixed sortGrid() performance
  support/scripts/pkg-stats: fixed numeral in beginning of CSS class
  support/scripts/pkg-stats: updated copywright notice

 support/scripts/pkg-stats | 173 ++++++++++++++++++++------------------
 1 file changed, 93 insertions(+), 80 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
