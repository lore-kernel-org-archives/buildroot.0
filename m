Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D081FC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 10:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39F4E408F1;
	Tue,  6 Dec 2022 10:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39F4E408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zo9tEdrdYM55; Tue,  6 Dec 2022 10:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6011F408EB;
	Tue,  6 Dec 2022 10:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6011F408EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6BFC1BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 10:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 226C5408ED
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 10:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 226C5408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrl3Pq5YWPZC for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 10:41:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12632408EB
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::617])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12632408EB
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 10:41:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIC9cVXAjvyZiJG9y1iqEJCiPmKRP2GnHikI+I1pnJl9g9Oyn80Jw3dN0kzDreEOFHMjWQ3BVxmxoVr1S7OA7PhW7NpMtEby4tHNlSu63O+bEUZxZhzHppBXk2A2U5Gfm94qhtla3XOQJFFn9QmWW/6XIh5I4KeY9bvR7dbwBKZflkrSEuTcWLnz5r7w3qixrYh8e2ah2qcXZyvZqe5jnuou7Oj6eaFQZudDQp8QUrVKYLkdhpSmAUvwJdXuw5JjHBKs6XbLyHn2quQAWZ21OMXMM1K6q5eD6LcolwpxZwmmorjbhzSFZFRAf0ldrnnRzU7HucqBtlKDkH0qtxDXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sep4Z7Z+mIx0wMvFdBj5AS5GmU8YbYnT6q36kgn1J8Q=;
 b=OBugusvYwqOIvFOxCoMcz5KYseVbjUX+oZMEf8MKNeoYPdTNvXvVYF6u7HbDVr02AFlYqc58UXNpxNqfaLhvOlzGniiBrRorRXmCvRRux/Z01qibubhLtQyqxuGiH+f3+BnLpI69KqTFoths+YGG275pd1CaAWS8/W9CJjOx7JzvUSPx/O8mlMpLHhJIE8dN4X9fvuILVGbwOT1zQQ6c0u18kZU+emzy8rrFx+ypmUWQ7vCPufhaXgGHCayHPrdM+mgwipzy0mkBhZoKgsOwSTdN+Rxbuq2Qaw4nAj/p1Sh0Cg4gOSSXIJXw5RsImBrovhkpstibGKXfOJeSRygFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by AS8PR08MB9479.eurprd08.prod.outlook.com (2603:10a6:20b:5ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 10:41:53 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9%9]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 10:41:53 +0000
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 11:41:22 +0100
Message-Id: <1670323283-5697-1-git-send-email-luca.pesce@vimar.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: MR1P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::8) To AS8PR08MB6870.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:EE_|AS8PR08MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: c0117efd-90ed-45ff-12ca-08dad7767d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57gds78q0fdu0f9c4jH5KkgVd+nq7pocKpNRFrGuNX898eTknL64IMWHh2PRk0w+FxExVel1aiF9G7n8VaVHJGGp9nwuXHuIR8fOHlUqEGOsmPn86bL3OAAGiQSxMx1Umra1BGVqYAigP58H/InThsSeceChUj68Pohh4zBotgLVmN1MCbPJLCqRVvdzbzHJi2ytQdI/sm2yWoauQtDjh0D2Y+slhTZxoyA1oyAa35TNzAkbGBJcHFPnNMC5hNJQbRq96hCv5HcaKqrNoFG89rq3tOEVkYPsE6HEkuoHgeD2in6zEWSAGUkPyEvizH3P5PKlfSaAao7oKCAILwmpej9Xi4CMOZaOA6+X3P8UclpRdMn/fNEM6tPnihQC9l1y71tuVtso2L94Gpaem+v3AtegvniAXTgfJEXmViCWqkunTxbtotPvsCLxrhRna0NZ+HgFdUlg+Vx2eS+piOFZd0zCEFy7Kzdw6igXSvkHqW6/5AF5BSvN8zXQpQX7a+Q2PNtb97gGJIoyNPHh0QbncUo5d2YxHjrfp/zmuXGwhIfLrXoJ+L0LgO6sOvsv/8/LpgnevjFBp0cTsMi2YjlY412xf0WNceBovxCbClmWxSTVW7VjiGFUFyatbELMuIhB940AJQip9kg/pNNwOKAcyvbK3mLzva83a9azgT27/usabpzcVvSMd255X42aciwKJ/wGSgfAbYGMaNh9llc5C9zCX5vs2itr24smf8Lif61OK6yxMISBtGkrfZRbCdDP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(376002)(346002)(136003)(396003)(366004)(451199015)(41300700001)(6666004)(26005)(6506007)(107886003)(6512007)(52116002)(5660300002)(54906003)(316002)(6916009)(86362001)(66476007)(44832011)(8676002)(4326008)(8936002)(66556008)(2906002)(4744005)(66946007)(966005)(36756003)(6486002)(83380400001)(478600001)(38100700002)(38350700002)(186003)(2616005)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZWVtZh9fr27egKhrORiYkddKAkuLqbBKtenlZ5LL6N/uomhk5a5n8eqhiTIp?=
 =?us-ascii?Q?SDklmNk+ITNYDiu7QFir9tG3+1R+XyamQmT4EWt4Qkf2t2RfVbp2z9Z1eWvA?=
 =?us-ascii?Q?+gSIfxkrpeLswQfi+G/TdqxJ/KyA4ufEZ5D3evYg8JVFcyXQdWZWLnWgTdvK?=
 =?us-ascii?Q?M59CKSCqJc01i2I+wbxMAnqr+MA5tzu0Hp5xV2Amn/iZtYq0Bcg8ABoAW1WM?=
 =?us-ascii?Q?qIi4P7c1zbbKWnnflIvmTMqVsANx6ta4Dxxw49q1OvYb0UgqNJmHR7UMRDix?=
 =?us-ascii?Q?G/8jm1ktaHG3FQfCyas3SufgisRrj7ad1Anropw94meVoeGFlfoSdO+Ody2/?=
 =?us-ascii?Q?NCJJ0tN4uKXoY8RuQ0Q+u564+KD3sY2AoccnI2Gc7wd6hX6I6Bcgqwgu7P2W?=
 =?us-ascii?Q?+NzirH/N3GW1SCOaddaB4ICZlgT6D1uUWF/2fllxb0g5s7+cb/ohVZNvu3Lb?=
 =?us-ascii?Q?5Y6gaBHJfhQYPoD7sIfdLxWNdgYAJ6RjWYFBpQbpqyUtT2jLSK9vR5BnfTUW?=
 =?us-ascii?Q?mWhd4lok9dvzzRijTP2ujM1j98sclu2PdZp7CEbUp/1PSCjAd3s5tPMgMN2d?=
 =?us-ascii?Q?gq8Sh7xGQJD0xsDDedj7lHaiD0CA4ER31C4TtNcogxg9DCoHlEQ0PW9iE7vi?=
 =?us-ascii?Q?BWAUx2AgJnaW+B+kGSSfav2XqWOemMDnFgbgar9wrsT+RH9+njsyvVDfI/CA?=
 =?us-ascii?Q?V1HygHHKqFrtL+BscPM3eM7J381/foSjdo9iKcU02soIAXubQlCpCsIuIesB?=
 =?us-ascii?Q?0n9JzNf70ZvDxaGG1W5lKJJqXtne6pKfv3kqoST6Hf/zqaxYEQny/C0zVpyj?=
 =?us-ascii?Q?s8nyNPBi1B3ecWr9dtUuO/xcnadSgUuoPGsYrl5Fq6qSpggI6zeERR2pHNm/?=
 =?us-ascii?Q?lO4VHuq0w95vhb/zfyLQvwmm6MlvuGFgV5C5PLuJWYXPByiHPVfZmhC//34i?=
 =?us-ascii?Q?VGDs3bbtty75aVINQogs7QluIqBp2mscCtzW+DVBm3ync+ApCl0POHRe0lwk?=
 =?us-ascii?Q?PN3xvYjGPIN/6Rj2Sax3nh3rqJPJYbJjNpLJk9fINV+nzA+eScu7Gr/BYq+a?=
 =?us-ascii?Q?4ZG7l+NsMra/R+bWniYtdxTlSTMhLLLNb9gyTWbFboEp+kgT2suC+wsbsshu?=
 =?us-ascii?Q?eTywNRsvKhLSTb0xEavH5eD7G7JG40Xjwt81ooiAP+zzAl0Vix3eguB/M5pN?=
 =?us-ascii?Q?Smer+TA2rFqTSfCD+cXPgeKeyMkAHBRM4Un7YrDV5PIh86SD5XPf9fXD2TyF?=
 =?us-ascii?Q?wMq/oENEfYOPhpomwO669oivCuXewCFF9sAfDKvtvoVNp7MsF3OeRitnqlxo?=
 =?us-ascii?Q?+hpHp+5LA6t7aBvDVTr5TPXRjqJz3J1f3QK2NV5P300ukoP1+Kc3Op5AXiga?=
 =?us-ascii?Q?uDITgnwILPgZUT1RwcCeUBKX6Op3cN8apv6TnT+wed+1kE298S4pcvO0uwGN?=
 =?us-ascii?Q?sXPXee24l/vPvSjZQ023ded3OYpgg1MyfOdWxwLl+tRvvJZRmtZYIY7oExc7?=
 =?us-ascii?Q?9ATpKbgz0Zy6bkAkeNXx7OMp+jt3phxBOE0/tUYKjXtx1PW7t6dB9RRC9RWI?=
 =?us-ascii?Q?rsSm3NucB2GGWs+CDDl7rin+A/b1kBcbMDHiZT6z?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0117efd-90ed-45ff-12ca-08dad7767d44
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 10:41:53.5947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7EZL6W4OO9Z9ujgJghpqp8/4iw1ThGoS/VzzBEg4pm+7LJNVLEBfJ9jequsFCmsZoWXY0vcwZJGQcLwPJYmuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9479
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sep4Z7Z+mIx0wMvFdBj5AS5GmU8YbYnT6q36kgn1J8Q=;
 b=D3e94wnu1tLUJgVhX8T8GAD8T+gw+BZZeRiqMYfyms30BFzoXc8h6Fdrcf5XVjyZ9QlcTRR+39+dDV2jKaDbBgTZr5YpkKNwFTmwDXiyoy1MY+nWFNc3Mn0psqX+GHylOxLw/Mj4waK+bMmd1iKQqfgqzJep/FdSCg46LpFZZCE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=D3e94wnu
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] [PATCH 0/1] package/pkg-download: restore user's
 original umask for the whole download process
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
From: Luca Pesce via buildroot <buildroot@buildroot.org>
Reply-To: Luca Pesce <luca.pesce@vimar.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Luca Pesce <luca.pesce@vimar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, all,
   this is the revised patch based on Yann's suggestion from this thread:
https://lists.buildroot.org/pipermail/buildroot/2022-December/656833.html

There is one more thing to it, though: the original user's umask is saved only
if it is more permissive than BR minimum requirement (0022). This is to
guarantee that the download process can always create files/dirs just as before.
The logic of this check is a bit tricky, and requires bitwise operations
on octal numbers... I had to do it in shell :(

Regards,
Luca

Luca Pesce (1):
  package/pkg-download: restore user's original umask for the whole
    download process

 Makefile                | 17 ++++++++++++++++-
 package/pkg-download.mk |  6 ++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
