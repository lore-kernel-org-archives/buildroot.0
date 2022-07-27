Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CA4C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59A182768;
	Wed, 27 Jul 2022 15:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59A182768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0G8hA7-LAfFU; Wed, 27 Jul 2022 15:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 265BC82730;
	Wed, 27 Jul 2022 15:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 265BC82730
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F106F1BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3AC605AF
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3AC605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-0lFr5829-t for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:42:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B67F160034
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2109.outbound.protection.outlook.com [40.107.93.109])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B67F160034
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:42:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkfDAQd7om6M7tK8a5hLFHIiyqhIHUTMpodW5HKI0uUR2M3HLR38tqLfZwRopIDM9lMkERxfmK6lIfM3j/WleQHXJqgVCF1X47dPuZ0Pw4bnbPl2rizektJe78OoJo/sJ2MDNXMvQe8c2gp6REX0x0kEej830qWRHptstxPrvOc5Gc6ELKI/yC9FbMTwyUJuGd7qJe+/HrEGPc5N2Mk2IZrRK6Ge5xm2i9XQxEqfZ/Hjcr9yg6DqszX59DiQkajbQYcVoqu+FfQAcVMn/ty6/6LllPhBiPySA8BVnXkr9wiVFzJqFgrVrSk8qaZsR6N2ahLlPv8T3ZDygvf1xlRLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aduudRGyHBAWCmvb/NfMmazV3Xan4mDwyKGqOFtZPM=;
 b=bdHDLSCRSK4zxyEYMGs6HXvb0LZYYEwf6PTvEimHfAt1E2uJC+2+9czZlv8How5Hk0e4JKNTEiTjE2u/qHR5WJL3+CNwrJqRvV7yjvZuzN+m5242yjhw2qbVfykhLdyqkJaOJN70uE/CGqntLJBjEZXQgrXs1B82YHe3b9GVIgnWfu3YCdGSOi71I7laXUBwaILVzW4vlKLAHjGMAd/lDbZFFG8qHVi4nJYfruBZu8COq+J+BT9bS1T6N84Z3YA6dzPtp6UqqBzE3l6p+33V8uN2ZGGwNuJllBUDLMKlQTlgvJuiNUWcS5/GAYtYrOV5IZF6+FlLtE8RI8tZa9yP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BN8PR17MB2820.namprd17.prod.outlook.com (2603:10b6:408:52::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 15:42:23 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::74a0:ce3:5577:546f%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:42:23 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:41:11 -0500
Message-Id: <20220727154114.1378721-2-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727154114.1378721-1-sen@phobosdpl.com>
References: <20220727154114.1378721-1-sen@phobosdpl.com>
X-ClientProxiedBy: SN6PR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:805:66::18) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c76b27-63a3-4e5a-1365-08da6fe6994e
X-MS-TrafficTypeDiagnostic: BN8PR17MB2820:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N+H0ffZRK90xvHrlY2nW0d6hF/j9C7Jegc+7LxSwP7sGLqT90E9yeYZTaSQgbzNiEL3n79SQGJa6c3QExtmBmWNIrzM27X2KTe+ibAevCvGMw3QIsh9r8yUYebdxQyAO4JErqMT+3UM3oLZanuEzyB+W2WQytPKeSMKX2Iy7+LCmQI95K8cInGdmJ97QFmy+Kxjybqghkt784FKEZlUdf2AwWvgL+c8ME4t3AipqeobsELGX/S77ycuSSaX2EUTBkd94FctcxIsDpLJIzrfVN6zM0pHvWHtOAMrO1wvEd/M6kesRBqk1QMAjrXmNeV/Y0PhTv0oG9Snt2QkfY0nMHN8Q2+KgrXt1hW0CXcpm5sB3phOZoBQlPjJWhYV4IHfF65Zec/As+6c27iNTffOgpcmFOqXHAOxTD9NMoM2ExW/HXRKeYVYAAlbJzbxPpVjYfOlADOHGv4GnEKEZQUqRqlvuH7eIlX6h1jB6WFgP/8kYg4MIrHeoUS1JdRr3cFoD1Wot3CmCzDrF1Xo9YMkwsA5gNFwxjj+jStJIsIeiHAlQudUcg4P2yvYE7NiqPy2QKKQlgD6ivdfesnmTZIbB2/klJCarKqNm1+x4RiIdSUzZtoLCVsFEQwr26HWEnOtu06x0BAJvbN7UA2FtFNcqUUfEDevs7G71bVPy8T6aGxOeqEaN4uNjSQyAse+WfJpk/SlO3k+veE+9x+ioOPZNesFi5TmCPVAQ7duT3300OlMj1B2R2iVVargXx3uQsoR89LEN+TmzeKHSJyrbxC3adAxp2KEBOLKpigHWrWygmoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39830400003)(83380400001)(8936002)(5660300002)(107886003)(1076003)(38100700002)(38350700002)(186003)(6666004)(41300700001)(478600001)(52116002)(6506007)(6512007)(26005)(6486002)(6916009)(316002)(36756003)(2616005)(86362001)(66476007)(66556008)(4744005)(66946007)(8676002)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o/xBqNkPQgewHcbfEiM479Png/H0E491bGo8wcGK7lbXk9CEX2Zt8MwZzY2Z?=
 =?us-ascii?Q?jPWNzUozwZzgmg7CsyE2Oi5Lh67D425GdbObVyNU8Mc77Ho2Vyjlq+x+MA+j?=
 =?us-ascii?Q?JJWVdnzrsmQwS6qh51W6DcXJ0ZgZhH9vE9vPGOZASM8u/pX5UDZ4dc4m9x6v?=
 =?us-ascii?Q?NgUhvK6yv7zOyUptSmq84GXwLmMDF0Qzfhx4dj9xvU7qKvw4thCJQW7ijDqK?=
 =?us-ascii?Q?so/zC1nx2UkAMqRriwJGxVkFSrzbuo8xYWKEW2I5hkgkWmMwGMaS71Pl8OQa?=
 =?us-ascii?Q?yyFrnHzFLRWSDGAXl+QC2yXduv5cd/yREjRp+rPWr3P3k0SiaQR/nrfXV24m?=
 =?us-ascii?Q?IILj6KvSAL3DBTbFmrpEEz4Sryf8hyvkTyN4eT00HNgEOx1MPUu1Qd6PotQZ?=
 =?us-ascii?Q?4lEUm7MhU/0hnFl7MvdmenJtXVT9ACo8eqrr8ex8DDmPa7FTFezSO8LZIylT?=
 =?us-ascii?Q?3CeBkG6JUVj4OAPM7zVm4auKuc1D1DYGFlJyaBHcxxS4RlhIeqtAyrxynTkJ?=
 =?us-ascii?Q?FPFWNvqxD068dhzHAs6vzSfn7OyzNJTcyl4mkT1x3UbU9s+8ghETRoPr6ili?=
 =?us-ascii?Q?lcBzF3YnrrURJU9AkGc0ctEI1MTa5hD4niDHHdgj93cK/IT/K7QPlNlx0iF1?=
 =?us-ascii?Q?YHtzXurJaGn1kbFumTiAuGYZjwi8earT7UUOXPeu9U4gWikfsUWxvPk2RAxV?=
 =?us-ascii?Q?RNomMdjG7ifyu1eCOKdpwul3jxlODJWnA/U1KlqE+2SFnMsyKAooE8rgEhdD?=
 =?us-ascii?Q?tTjhDcjEuYGWgkfgmSvzHInsfkBUKN38WYLilHKfXmy43TTUe90JCEjx9ylo?=
 =?us-ascii?Q?8oAcz2Xs1BzVLrSflBUZ7DuETs5MF8b9YOPJH/5qFVLAOMgj9vFU03tNSLK7?=
 =?us-ascii?Q?wFzbn/QT9gBa3+2GRUkaAYbLcb7uVJTBwSAiwQXWBvnGOkOsK61Uq8gjZmsf?=
 =?us-ascii?Q?5lWkRZzgmHeTMZSiwtpFvdNOql/GqFte1eZYi2I6dm/eDSzUf1/xYuHkZKo7?=
 =?us-ascii?Q?DjyOWQCdYnibKZDGv+UwwJ9Vb+jLkvffhHKA/7TUkMuN7k2MrbIGzClMkIMq?=
 =?us-ascii?Q?UsDWF87JFqLsPbm8v2dsPnZS850zPBR34WbIIKQnv3RN7WlPmFbSuL+V4r4x?=
 =?us-ascii?Q?gzMbKkfU0Q2dScWQsPoL6vP8xbQEZ/6zV5BHyimkbaeIMb1UV5KG5on5Z3hY?=
 =?us-ascii?Q?nF8ltJpODGFohIDggSt5dNPUiih5Fk8dNidkRGs6Ib9gHC6KGgHoyy1IiUyR?=
 =?us-ascii?Q?WZHBxaTFyT7lL6A6jCYu1vY7yiQKjwDkyoNxmjmRIOF1fXv6KGLZFJre3s+3?=
 =?us-ascii?Q?jpORb8MvzfBnR7FX2VtmUZn0LJUNiq1wrRlnklkmwoiGG5aMuhKUQB1yNIxo?=
 =?us-ascii?Q?T5rv+U7k/hrqWYvzMsj/GWrlstGFHB12gGzfUqvKRrH2CaPaWeDw2Htwz3Dp?=
 =?us-ascii?Q?nAhrRqtScnp0Vhk5h/yi0bJLRyg3KLQddwZdr0eqmCf7k3xa0aM18OE6REXr?=
 =?us-ascii?Q?C2hqvxJ0/0VQ6UKr73K43XYwJrUKZx9zJVNxZfqD+zj7EmzYMA58ruLskQKg?=
 =?us-ascii?Q?8asPawUuEhPiyl9lfKSaLd8yXPa6zYWVUqBTj85T?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c76b27-63a3-4e5a-1365-08da6fe6994e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:42:23.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ja5zxgHNX481uz2VJc/WleIBAIMjIJPDudHHL5zZbl6F46acPYEfutoz5po7Q1o/ngEHBGV/OwgYvFDBCqoiuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR17MB2820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aduudRGyHBAWCmvb/NfMmazV3Xan4mDwyKGqOFtZPM=;
 b=ieUFapEdbx3ZgYVhdj3acH9h49S4TVQHv8tdsH3uix6EpuyN26JEnL2kt69+g3MLssANhRWj45++S0GHZv01wy/zEGr6qclieRNwWvjlzk0kfoI62WE8R05Buvju27oxlQRJn9Bgfg9czPXhQrQqbxWia67ikmvhK1VJ9i4wvc8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=ieUFapEd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 1/4] support/scripts/pkg-stats: fixed CSS cascade
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

This fixes the .version-needs-update class being overridden by .correct class.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 91a1a1622d..b2a8ddd446 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -818,12 +818,12 @@ function sortGrid(sortLabel){
 .centered {
   text-align: center;
 }
- .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
-   background: #ff9a69;
- }
  .correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
    background: #d2ffc4;
  }
+ .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
+   background: #ff9a69;
+ }
  .somepatches, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
    background: #ffd870;
  }
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
