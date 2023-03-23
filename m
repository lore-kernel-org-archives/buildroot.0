Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DEEC6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 14:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D13661593;
	Thu, 23 Mar 2023 14:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D13661593
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtG5tbrTwCWr; Thu, 23 Mar 2023 14:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9976F615A2;
	Thu, 23 Mar 2023 14:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9976F615A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 644BB1BF2A9
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 14:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B90283F4A
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 14:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B90283F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1Rb1LTee-49 for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 14:13:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B00A821A4
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com
 [148.163.155.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B00A821A4
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 14:13:55 +0000 (UTC)
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NBHaIE007664; Thu, 23 Mar 2023 07:13:54 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3pdbdm4qec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 07:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdIoPKkFDfK608bjuHP5UckR5QTpRX3+0DpUp/B9rvmrT7snR09EcgwwkpNdvzOxz3OHDgn7G3x2GCN+glir87jy7l6uqXJxngRms9aVmnR/rvrw8IccHFgdG/0rCWenjckVmzQo8xo9ieJGGRbwiE0+gU33t9fwEXQBpkbzkj4TuJyd8qYR0qbH6hP/qFTVL7B/QanZoZng7+wPzFs6OqZF4ElOsZv34DGhLx9fuyC8KG/P/nlNN6NpnLDxfGqMM9AseRogf+1tHLCj7EvmcCVnTohr5y6lkol59b7lGpMsGMLZPHmyx+0K0GGY0ZlmjKEYyWINvYNyfX5CSI9UIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85SMbT0Rk+wB3r5zE/5cZcWcscD89+8pte2qoO3pHP4=;
 b=N+cdj+FMkMWM8NNjy4pjhL+DVLpp5wvPmd4Bx3qGy6STKkHC084NCiIj9Hwv90eepgPzd+NU11as2hXsIxvnQFB/Ej+nLWL11G18L8Nqogp5gW73l6E5Y6U2C05n/0Wl2DZAVObO1w9LTY8P9LueB7I2Aqaj3PGwm1MObcS32QjNLlHictuINxUoTWdgiSvV7fi8e7M6alrcNpeBCJaNb4WaPwM3PW2jcyv/cUBEJ5X5X0QTPZeeQ75NPCY91KtE69gP838XgEn0OhpgP7qumtuVaaIEx1O0pfuefN7mG33KAsoBe3NZD+eBxlAgCcMzKkfDDLpqnRYZ/IZ1OIMuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8121.namprd02.prod.outlook.com (2603:10b6:8:1a::12) by
 CH2PR02MB6508.namprd02.prod.outlook.com (2603:10b6:610:36::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.38; Thu, 23 Mar 2023 14:13:52 +0000
Received: from DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3]) by DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 14:13:52 +0000
From: Simon Rowe <simon.rowe@nutanix.com>
To: buildroot@buildroot.org
Date: Thu, 23 Mar 2023 14:13:27 +0000
Message-Id: <20230323141327.18684-2-simon.rowe@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230323141327.18684-1-simon.rowe@nutanix.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
 <20230323141327.18684-1-simon.rowe@nutanix.com>
X-ClientProxiedBy: PH7PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:510:23d::9) To DM8PR02MB8121.namprd02.prod.outlook.com
 (2603:10b6:8:1a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR02MB8121:EE_|CH2PR02MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f5b527-8f0c-40f0-43a5-08db2ba8d475
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q3LyjmhpTKvcNXfbXWCUiGvRwMtlmTIzYWhoag7371wgjYrCtpI7Pk49VGGJ8pQe3NZshTcKcEcKhjw1TkelTWsTnpw5OWxDdGv/jkn6bvDcwTVxswvxDtrpgqR68eQZAcz8w5vn3bl3zN8moAnEt0QDi4C/xtNWachVR/4lIhiCiR0DdC7rwelJ2jHb6cQ4dyjaSWj+58EnIttgfvQOUv+ngvoxea8K1DNOgBb/UUUFDIZGANjZwRq8yTHY1fBIRW1m3d5VsyJajVv68IRojgUAjH2CEiDio70YjBs5sUPP6o6iAJAIK0pVWLu6fyjxVtEran1DOU8dlNaGrXiyJoRRfWF9fisNkB7dofrQpE7mKCmPlETjPf2LtgQyZjLtYoX5batoByUsPKu8uJvio21UxAdOMQoC8ZQS/n83VDiXNnanrPeTJuPIqPpChPH3MhUVxEvps6cDvuo0slfOtc0wx64iEoOiw84/wn7iz6xYWInKQWAgZEUCm0EIMTy2dsQZKhGbmfnBI0hkboLe55/WWHe5fT0ETr2An3FU7x8FXsIRhgqdDve3aAS/IvgoRgTcQ5xN6XbSryO3BxhN42/FOwII0NKqjn80pdpnwBpTW+ji7Se2Wq7TEd4ZL3rDXR8SpnSw2f5pMT+mxzhBpEmoKIRY2ZvCtE9kvQpitGtxfyLYTi0pksN0y7fmBYUJO4f/ie6Wey4dDA5wtjdLaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8121.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199018)(36756003)(86362001)(6916009)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(41300700001)(6486002)(478600001)(52116002)(316002)(54906003)(44832011)(2906002)(5660300002)(38350700002)(38100700002)(6512007)(6506007)(1076003)(26005)(186003)(107886003)(6666004)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0IFMWOdfhTBlw1t6Mg9cmOZxvwilUTYx5kTBb91YjbrP0FF9KvMRglIkypIH?=
 =?us-ascii?Q?8pSFxeDjV1Mkr/ga3C/A2SiLprricANYbC5sHWSqUGPMA2y6V2L+IJZ4pQNM?=
 =?us-ascii?Q?z7JoeKxHxneRVbJyR3hlisfqVYAiFOpCJEPwYlRzvdRnMSQ4E977byGzGEZ8?=
 =?us-ascii?Q?Ht6gER4sMiRbWI8E6AC/itXJATTC+qmKzSmJ1WJXOdCNUuv7Nd2uae3WjHho?=
 =?us-ascii?Q?/otRref2vVHjQCW06X2mztiuZ8pZ02oQjZnfI1M0vgGf4xByFMaxH63VkV78?=
 =?us-ascii?Q?XfF5MfMjlOhXLjAe7jjL0tgNMTe6Q1jy1/Y+0mSgKlYwpB7Lj6c5okz7iKhX?=
 =?us-ascii?Q?qEFqpLKFY5vQ6dZz9oZJK2E6SR/6f/8cB/7TMtwBejMIlXUCZUtYKiyPuU9E?=
 =?us-ascii?Q?JXv58gcsV9pQPFJBi+jNEeGyBbhi/+eF+MZMVK+gi6PQf4mTuUeolfb9hAgC?=
 =?us-ascii?Q?xTC21XcWWAKTVRZ9y3GUi/UqUOD9eJrLSQFDV3ecK7n30lJ36fO7uBgssYdc?=
 =?us-ascii?Q?wFKbu3/ZJ847qMy8T51gp0kcUpaHK6XVXbg80gxKTcw929Y8GO7Ufpt60HbY?=
 =?us-ascii?Q?2PMm8FQce6EGq6u6A2gcPVgwC4SsjOYQeeQUlJAjAO51ko5shy584ep59Ny8?=
 =?us-ascii?Q?kfB7Cr7C0YdH/Hxq8dKRvd5/fgi1a9Tvk+qXXgXsRgwbe91FYKcRX+YcDnLo?=
 =?us-ascii?Q?F00QHyHIxX5UK1ypBYFy3sZiCiQsC1FkbX4nAueDZRkwtAKkL4CFFRelNYHo?=
 =?us-ascii?Q?Wla+i93e4bGz6Tf9LPdYIk28Q/O8zwIQYgmSjNnRgAJnZV2s2Rm93KEP9tOK?=
 =?us-ascii?Q?faTgk7AhynCSzTGiiSvVunBv1JNHXCCByMGKnFYuuB4YFXLd0qhoGbAKfoYu?=
 =?us-ascii?Q?9RmI3QeirxiDwPJMyXcrFQYkNsQ5IKTW6wDCpE3AvpJr2Y7BITMaBUZtoB+P?=
 =?us-ascii?Q?A8G+6gcmJ01Rxp6kYnTqcbMzcL0mwOfndzoM48xPKx/xeOlIUJZ6VAkOejOx?=
 =?us-ascii?Q?2dUwzlOKGzFAyrB4tNEV7kj+VJ88Vuxu5y2Ht75RB+PdVVJGR128smgZ3MV6?=
 =?us-ascii?Q?59/LqYbwR5DdpzCO23eI4nDqWlHc8T1aoTjGoIAP8lwUD6B/vFHYax9K98Kb?=
 =?us-ascii?Q?Ve7CVMyDCBL17FU7f/48Zky4tYpnLiSkQGeP55nwxZ1SQtuwXPId9VUoSL5i?=
 =?us-ascii?Q?ANsmX1if/gw14Vily179gtwNZzbSm82ky/CDd6srVMvC+9MJgtFlAhfLfuVc?=
 =?us-ascii?Q?rUQFHtG+7TtNii0kJCLkWeVxXN/utFlXLQ6XcU2YF52swkJYXuIcfJIv5sH8?=
 =?us-ascii?Q?vrfWvQ3M3oNhDQkkiTs5aRIj3Z7U4f+c7lw0fs6v0fNx/kazuY7qdryr1KHE?=
 =?us-ascii?Q?Ex2UHoNGcNHI5pIfNiD7/65JwKrgQFWyHqoIE9YEyrJDvnP67LovOE55Ze+F?=
 =?us-ascii?Q?fNDwwr/pQt6PleOCM5zirqava5TufPwFwQMbUH0mt7cl1FPazzHwdp/5mYi4?=
 =?us-ascii?Q?VuOsVFA2BEkeqTA+IKofMAgNEDlk98K6A+ZJgsI2kwZVMVhx/JfBdxZr7Xbk?=
 =?us-ascii?Q?R0aXp3IxnrGzIgVCtCOt6StJWaBQgEhH3wwcbxHLEPDYOUQVxdhBZKf/YTs3?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f5b527-8f0c-40f0-43a5-08db2ba8d475
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8121.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 14:13:52.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcUn982Ir7Rw3qOYNpg+3m9Zos4jpwrBnCptki9BLn2DaW3lBTph4Uuu5l6l1mSE3YWG+wdyy+NCq236T+kB1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6508
X-Proofpoint-GUID: frqYQYGR35Bm05ksxSbYLbHdYwhJYQHc
X-Proofpoint-ORIG-GUID: frqYQYGR35Bm05ksxSbYLbHdYwhJYQHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=85SMbT0Rk+wB3r5zE/5cZcWcscD89+8pte2qoO3pHP4=;
 b=PbE5BPgebaamVC1J+JrxaDuWuONGbmbJgZouZiHVUak81xlcYYHaC/Iw1h8iDe5EhROJ
 mRBWEtSIoEsBw9AQ9acZr5oEB34LIu+4H2LaYDe20FoyEMzUcHA2F/9Kc0budEIw/yTq
 LDNLhIu0n2kP1Lcs5Fsv9dvyo8bV34+p79bnFAn4JHjWOJawOcjgmfB3v9oRUEQr2aNZ
 BwxlFDw8DpAEf/6ptUr2aqy3q95XYy1AcVqSn22ZsUveu0REYCzGiBvjy8tJcaXRtCGQ
 ZCtrHO5KGpflSH7o98Zt4FJUzoFWumyZbsz3uzSfwHiP78U/AihKqIOllhZE0XQIYqfc 5Q== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85SMbT0Rk+wB3r5zE/5cZcWcscD89+8pte2qoO3pHP4=;
 b=laG3JUh9tQ5xiH5nLwqopWJ57zgtos3p2Lx/U1L8uCv1IKba2s7TXVAoQFOEjRF+My8sFIiR6XRuyb+rKQ4gs3z6SY8BtsV9CqHtGvmNoB5JQoaeOEVpXKsWkH/DXYquOmWWHsCjD+wPCtuf/5YamwYIo0pYwNyvgD5Cyp4U52aRKbPZWKfPyCi9Umj8yE/P2h4FRJzfKYzhy0YioRbJfv6K7Dj9FWzgi/WHdmrfXRtxCHEYJ9NLBfg2vZ8ZbRdd4ygWqtwfklrXtfW9XsyYrDMGTPGP8vaHZ74aKX6uD6mV7Tu3Yg/R90jrz1FmmlJU3WkyKPQcKqbntmysxr4iVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com
 header.a=rsa-sha256 header.s=proofpoint20171006 header.b=PbE5BPge; 
 dkim=pass (2048-bit key,
 unprotected) header.d=nutanix.com header.i=@nutanix.com header.a=rsa-sha256
 header.s=selector1 header.b=laG3JUh9
Subject: [Buildroot] [PATCH v2 2/2] package/multipath-tools: enable with musl
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
Cc: Simon Rowe <simon.rowe@nutanix.com>,
 Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now LVM2 can be built using musl drop the toolchain config
restriction.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
---
 package/multipath-tools/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
index fc4b01b2ac..222f78b86c 100644
--- a/package/multipath-tools/Config.in
+++ b/package/multipath-tools/Config.in
@@ -1,14 +1,12 @@
-comment "multipath-tools needs udev and a uClibc or glibc toolchain w/ threads, dynamic library"
+comment "multipath-tools needs udev and a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_MULTIPATH_TOOLS
 	bool "multipath-tools"
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.22.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
