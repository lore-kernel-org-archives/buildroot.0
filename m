Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815C6C6FD1C
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 14:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C928360BBF;
	Thu, 23 Mar 2023 14:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C928360BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nTYtCbRTZS3; Thu, 23 Mar 2023 14:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF93661576;
	Thu, 23 Mar 2023 14:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF93661576
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B04AD1BF2A9
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 14:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 899CC81A9C
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 14:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 899CC81A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYUe2mvT0xtO for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 14:13:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB1A8198A
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com
 [148.163.155.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBB1A8198A
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 14:13:52 +0000 (UTC)
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NBKGFP011565; Thu, 23 Mar 2023 07:13:51 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3pdaucmr6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 07:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo53x3VEcSR9Muh9Lmw7AhJrpkw91/GqVSDIJ0iIiuRldGkEo2V1XMet6s0Vzl9MIBXJMYbO0P4WqcIUBTJ8i4T+e2GNdE5XhBO+aYP78COwrncW89Q6IbXl8LnEHGwg5iG/ClCB5+1mM+5Sv61D+xhBNl/bWoKrBJoeF5Qrf/qycuynMSbh01RFs8tFWU+2OmwWthWAJahrR0WVzAk1cKPUDerUYJtNcxXdebp2GnjSAcVwBYmkGYx2gfucvV4eiRwmZfODC2CfMaEu4C5Pc3YexQLz0b4IXaYZZdz7nrQd4I7U9MrQIx9QwMo0XauS2Bquyft0qDmqFxywqqr4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZp14KOIWxzHU52zWnopIlB4Jq12zaVwKI80v2xuhek=;
 b=mAe7XmjoOfAK0vXtqyJPbDtxToWqa+ca7wkP8oDRoi9CCsavkZAnVipaUj31gL4V1BuMh1p/vPyQcZf6Nao/fUopHQRjyrr+utVAX0qDZSff+mo/SQtJnh3DOyCAEPjXz5v33IeR0iwmnm2xXppS1Z/ACm/onmWrfq9cW0a4khtv1vIChHTiR5lK17kW1dIaYST4LNFvMAiFHY/g2Wx9HGKjt2WM5mDNH5HUlYlXC1lF48+giLeyMosyxZ5S1dqDGmGhsLEkg/00TA434R6US3LUd+34bP5voQspSHftIy4KU/ukWBB2FwKHOEcIyxm4rEAxw44XTtZu4qdnmXzqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8121.namprd02.prod.outlook.com (2603:10b6:8:1a::12) by
 CH2PR02MB6508.namprd02.prod.outlook.com (2603:10b6:610:36::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.38; Thu, 23 Mar 2023 14:13:48 +0000
Received: from DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3]) by DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 14:13:48 +0000
From: Simon Rowe <simon.rowe@nutanix.com>
To: buildroot@buildroot.org
Date: Thu, 23 Mar 2023 14:13:26 +0000
Message-Id: <20230323141327.18684-1-simon.rowe@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230316113615.138847-1-simon.rowe@nutanix.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
X-ClientProxiedBy: PH7PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:510:23d::9) To DM8PR02MB8121.namprd02.prod.outlook.com
 (2603:10b6:8:1a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR02MB8121:EE_|CH2PR02MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e84c81-4853-4ece-7479-08db2ba8d1d2
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ec1rwQ4HwYoAHZ50HjrT23B1boV9m556cPX3gY0CSn3pP80o5tL+qMwEbgfxfwjRCBc52TcNjuSGOBMboqi2DwF5W5J1xykGzR4QEPVYBra4Kgi1Fvwsk/91gG74DZD7fRHy/KZVmfCBuI/YwgH7xJtfxEs9kDkdRHtOUb83F3w0xgSDf/PTu8GOPDYWvkZz774MSVUK9vOQGx03GiCujlptXlP4fk302QPcb3d33lPaFO0FFxdjW9g9TLN+Fb8XI5L7Mb3vkeOTU2ZcxepeqARQxJjQCa/O9DHLExvfNVlS4Y2tkDI6LckIwNEJ/jPn3f1N2WS2LM8OIjEEH27n1EqLSdRF15yW78SpeRugw3O1wKLwLL4iOsXznEG5ZdOaqgPZGy/6wIRIlc2Et3aX9PCbaiXS+usIl46u9yZ5MORDCi4wEoDQJuWZqNhhOIXr0eszw4HW1J3KPxtZF9CkkTnLzU5MzWFq8p3+pnsdgUoAYaSqHbMUuXAcxwsCkQpKF2xk9Bt/vQnMFzrASNarjoV8ON+Z37AvXOnSmFNVB9jiPMoLc5rFSdALL5nefDoADkV5Ug0W28yFw/AaogDhbyH/akNgjUPbpgKnrtyzV5bjC80gCvmjCjhn1YBsiakV+poAcb2icXtKQat/RMVHiqGsSrm/XS7ceB1Tid8/slmjd/DduSAZh0+XInc2xDNwgvO5+x78cglEXeooMAusjLlI1l1Umue3OKMEzwUqu3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8121.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199018)(36756003)(86362001)(6916009)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(41300700001)(6486002)(966005)(478600001)(52116002)(316002)(54906003)(44832011)(2906002)(5660300002)(38350700002)(38100700002)(6512007)(6506007)(1076003)(26005)(186003)(107886003)(6666004)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pmpcyj8TRByEB3oUO0VQzh7+H8td9eyJshu8tL9nZfydGmAAh//O6/NHARBr?=
 =?us-ascii?Q?mmNSSgazoWsYKFAKxXf/QCr6SLlTT8/xbMJH8EmT9cJuaFxBFUoj8nIA088s?=
 =?us-ascii?Q?O0WlSUrGCOOMUZta9vbE5tb0pE68t6UdiTktn4oYKdzaXJ386RjDAwJA5zZi?=
 =?us-ascii?Q?jQUSeeM01jlFzjDlkcdsHCbYbOb/rBcQI9JT4IMK/oehUdyWzUCcS5IaR0rY?=
 =?us-ascii?Q?4eVu5xjcrKptKWjrRwHyhRNsBKNAJDjXT3swOUvmH5qs1ZrZV4icM0/sGwn1?=
 =?us-ascii?Q?2pFetckJ2v5K7gidTPyVXP/CB7b/KhojIAquItKdohrUpyk7lTy3R4yU/13h?=
 =?us-ascii?Q?zraqo9RMMcUDeC4lcCNfNAt3+rpLSZsY0qOB0aBWJYxsRIBPZ+8ee7sgdT3e?=
 =?us-ascii?Q?cqa6J23X/SWI93GoYTi1MizZCE8iGDWUl+o5J8BrHuox9Ceupek8oXeuyLrK?=
 =?us-ascii?Q?mtS/ra05uq75g47pQX6OXzNUw+cswOaKJ76LWNMxLducBFXzVhDDgfa3us4f?=
 =?us-ascii?Q?xL6LiK1kOX/byerRpY+OxNrw9eCPV7JvPnL/BcLge5ys+Ge0NpN+QES71ptG?=
 =?us-ascii?Q?SVV40fUmguHpAGI04cTJbH9xjR5InXVpkn582b1g4683TkKPUPnhYxQ0iJF5?=
 =?us-ascii?Q?6nbqwIKF27/WNXdAWlYslrjxVJLRfvxHs4Hrew+fBx0Ubp/hTfLhHbWHFo8U?=
 =?us-ascii?Q?arxiG7W/39apK6Lp9roX7DWOnkEyQadtGJ0E7LeiAURNYg9d4kcSJ48xCaM8?=
 =?us-ascii?Q?+8+lTlxJKRaWIGPIHrDpxEFcwSMubnm+p47rs7F8ZncCTCyr5MWxSzQOkij8?=
 =?us-ascii?Q?XWyAXyHMsKdpVbPcpqNJVKzoocPK9Y75gC1yOZl+UB67kOk6Y6tBUjvilP/U?=
 =?us-ascii?Q?ybvZKFbjTHhMuKrwlBCj6M6GzSkmVZEmVWqlNsEzWjnmhgP154bvJElmp8zt?=
 =?us-ascii?Q?h9Nf38moQxMCf69p8nLhfrUahPr7D2mQ8Vmfd/JZY1KnvwPbMAQJcvNfdL4E?=
 =?us-ascii?Q?BNabqAi44/y6nRumsQvidZ7v0fy+/EQ8RRNlhnWn0GhesQfFkiyI1dCs9o5z?=
 =?us-ascii?Q?jU57nvyZ/aIx9kckBu+hr3y5gsnEIVZOYKR/o5469OSy+GKPXYFzxdLUY9jV?=
 =?us-ascii?Q?w7psl9l2K/LDaWs/jxEjxGjUEg7K+Z0aw3IC33vqg1XzEXwl1cFdfn7eQMRy?=
 =?us-ascii?Q?t1UDacBdmUWLpqex/S3IZK887Bhhlg2EWjKEykI1+fWaIoofOa8j7SfByugb?=
 =?us-ascii?Q?qmpRurPrC8LmUfgUuoTOuJV+qYanoMaTt/W3wItb2lKkkiqY23ldAYZVEo5f?=
 =?us-ascii?Q?DoNyVCYsS/kwqbQqZqofPOEJd/krvZZSi+rkeI5jVI9wzJIJ3U81OrFGyMsI?=
 =?us-ascii?Q?OjjEu660WKrycU8Q2FusG4jzym+6updrQTj0mmAUdRWY5AQ9Db2BUkq0wQ1A?=
 =?us-ascii?Q?SPJspYsN5r4pnsiy7/8cSyDXA1Go8dmCyIfHzqAl1orVg22fV9y76uCLch58?=
 =?us-ascii?Q?yGUqi/WQU1oTNGwDqJLEYr+wKwBQ9w9aE6ooh5qxVnkNOJRNZTD/eVa5NrLp?=
 =?us-ascii?Q?D86+bUbzKsB97KOgVKxucW0g+a56isSWh22kPcmfFAKewRQ3nW5i4RwsIjW8?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e84c81-4853-4ece-7479-08db2ba8d1d2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8121.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 14:13:47.9349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUAf4MSEVS3NNuQmVNgq+Bfa8JJ6A14DhA+bGOijK5omSGFncwPntXsG3hfwLDTr++wmBcrYJsPF03QCa0PLYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6508
X-Proofpoint-ORIG-GUID: Lh5659Z6Pbn5rXc1A9XL58DBon3zM9lq
X-Proofpoint-GUID: Lh5659Z6Pbn5rXc1A9XL58DBon3zM9lq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=JZp14KOIWxzHU52zWnopIlB4Jq12zaVwKI80v2xuhek=;
 b=uaaa6YJ/fW7E2Ane+CTy04lu9lNZWDTWLlOHLNi+F952mKbLc7GpQxEuk+mt7Up/hh/H
 /cEbrPRVWVL0AJGSG74EIshCxvn8hbU2EvWEnGiqDS9B2Pfo1NXtO0xXz3iV+AOfVyEO
 arSwRP5NjkXuGoNuNgyPza/IILp/jSoyfs6IXGfJW5Pot6Hi97y51qMaIMEQXu2G7Mvw
 WxrDqSnyBJ4w1UYtTdkXxtZBQKmVZt523VMtkz/drc6eYDiHRCLjm/sdzzLS1CnnPny5
 HYXkpcCVYZZwECKbwpQLdGsshYzGI92LiwpyOSJXqBJxfr0TGTrtlS9LW58sdr4fiKFh OA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZp14KOIWxzHU52zWnopIlB4Jq12zaVwKI80v2xuhek=;
 b=T/x/G56gS6+z91FQTqMKovT04UuB0Ee8AtHXJI4eD0/aCVGN713oCy1hjbyCQowwIcCymHqSJZ8k4utZ2WkLQMLANUy0Snqi53rqYLQx1arTytb/FVeSE27+AJfltoZ7l20HwMElKjBaIGTQEKqnWsBjmkPBoiBS+qqe5YxJinEbm8kvh7WgY7mMuL7001Y/cRXBvD2xrYZPpKpIsnF7bF1AvMsBrdt9cVP++fIbI3nTnwmqm8eQ3z1IcD6+FlEJXsAYraJTG6mTKOha3OBrSjtF1u4NKbnh6Jz8HMPUA2ef3XTHzcrfXwD+74mG9GXdcKXh/zDPQLwtFS+ViArAqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com
 header.a=rsa-sha256 header.s=proofpoint20171006 header.b=uaaa6YJ/; 
 dkim=pass (2048-bit key,
 unprotected) header.d=nutanix.com header.i=@nutanix.com header.a=rsa-sha256
 header.s=selector1 header.b=T/x/G56g
Subject: [Buildroot] [PATCH v2 1/2] package/lvm2: enable package with musl
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

LVM relies on the glibc-specific behaviour of assigning to the
standard streams (stdin etc). As a result the package is currently
disabled when using musl.

Apply patches based on those present in gentoo:

    https://github.com/gentoo/gentoo/pull/25883
    https://github.com/gentoo/gentoo/pull/26024

and drop the prohibition on musl in Config.in.

Also, backport a couple of compilation fixes needed build with musl.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
---
 ...sible-better-compilation-with-musl-c.patch | 30 +++++++++
 ...m-preallocate-memory-only-with-glibc.patch | 34 ++++++++++
 ...e-freopen-to-reopen-standard-streams.patch | 67 +++++++++++++++++++
 ...e-freopen-to-reopen-standard-streams.patch | 43 ++++++++++++
 package/lvm2/Config.in                        |  5 --
 5 files changed, 174 insertions(+), 5 deletions(-)
 create mode 100644 package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
 create mode 100644 package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
 create mode 100644 package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch
 create mode 100644 package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch

diff --git a/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch b/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
new file mode 100644
index 0000000000..b46e4c92d6
--- /dev/null
+++ b/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
@@ -0,0 +1,30 @@
+From bac596b3685520acaa404dc3ebd2131e6de96d47 Mon Sep 17 00:00:00 2001
+From: Zdenek Kabelac <zkabelac@redhat.com>
+Date: Wed, 16 Feb 2022 00:48:49 +0100
+Subject: [PATCH] clang: possible better compilation with musl c
+
+Try to help resolving reported compilation problem with
+clang & musl C.
+https://github.com/lvmteam/lvm2/issues/61
+
+Backported from: 4fd76de4b69f8e5e6d5afa03d54cb4b8986c4bcc
+Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+---
+ libdaemon/server/daemon-server.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
+index 88905a7dd..96cfc392e 100644
+--- a/libdaemon/server/daemon-server.c
++++ b/libdaemon/server/daemon-server.c
+@@ -18,6 +18,7 @@
+ 
+ #include <dlfcn.h>
+ #include <errno.h>
++#include <fcntl.h> /* help musl C */
+ #include <pthread.h>
+ #include <sys/file.h>
+ #include <sys/stat.h>
+-- 
+2.22.3
+
diff --git a/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch b/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
new file mode 100644
index 0000000000..d4dba07e84
--- /dev/null
+++ b/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
@@ -0,0 +1,34 @@
+From b668022f9b8aecf52109c9e0b7e5847054231361 Mon Sep 17 00:00:00 2001
+From: Zdenek Kabelac <zkabelac@redhat.com>
+Date: Fri, 19 Aug 2022 16:15:17 +0200
+Subject: [PATCH] mm: preallocate memory only with glibc
+
+Use mallinfo() only with glibc.
+
+Backported from: 8370d117d7ef8a472c95315a3cd085696c90b3be
+Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+---
+ lib/mm/memlock.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
+index 3d1a3927c..efcc6d91f 100644
+--- a/lib/mm/memlock.c
++++ b/lib/mm/memlock.c
+@@ -160,7 +160,12 @@ static void _touch_memory(void *mem, size_t size)
+ 
+ static void _allocate_memory(void)
+ {
+-#ifndef VALGRIND_POOL
++#if defined(__GLIBC__) && !defined(VALGRIND_POOL)
++	/* Memory allocation is currently only tested with glibc
++	 * for different C libraries, some other mechanisms might be needed
++	 * meanwhile let users use lvm2 code without memory preallocation.
++	 * Compilation for VALGRIND tracing also goes without preallocation.
++	 */
+ 	void *stack_mem;
+ 	struct rlimit limit;
+ 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
+-- 
+2.22.3
+
diff --git a/package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch
new file mode 100644
index 0000000000..6d57cc64f0
--- /dev/null
+++ b/package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch
@@ -0,0 +1,67 @@
+From 7c74ad9c349e381decc84c218112ea8e7bcc0b9c Mon Sep 17 00:00:00 2001
+From: Simon Rowe <simon.rowe@nutanix.com>
+Date: Thu, 23 Mar 2023 09:57:59 +0000
+Subject: [PATCH] cmdline: use freopen() to reopen standard streams
+
+In glibc stdin, stdout & stderr are variables that can be assigned to
+(https://www.gnu.org/software/libc/manual/html_node/Standard-Streams.html)
+however this not necessarily true of other C libraries.
+
+The gentoo musl porting notes
+(https://wiki.gentoo.org/wiki/Musl_porting_notes)
+recommend the substitution of
+
+    stdX = fopen(...)
+
+with
+
+    freopen(..., stdX)
+
+Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+---
+ tools/lvmcmdline.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
+index 1e12bedca..534368575 100644
+--- a/tools/lvmcmdline.c
++++ b/tools/lvmcmdline.c
+@@ -3384,7 +3384,11 @@ static int _check_standard_fds(void)
+ 	int err = is_valid_fd(STDERR_FILENO);
+ 
+ 	if (!is_valid_fd(STDIN_FILENO) &&
++#ifdef __GLIBC__
+ 	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
++#else
++	    !freopen(_PATH_DEVNULL, "r", stdin)) {
++#endif
+ 		if (err)
+ 			perror("stdin stream open");
+ 		else
+@@ -3394,7 +3398,11 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDOUT_FILENO) &&
++#ifdef __GLIBC__
+ 	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
++#else
++	    !freopen(_PATH_DEVNULL, "w", stdout)) {
++#endif
+ 		if (err)
+ 			perror("stdout stream open");
+ 		/* else no stdout */
+@@ -3402,7 +3410,11 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDERR_FILENO) &&
++#ifdef __GLIBC__
+ 	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
++#else
++	    !freopen(_PATH_DEVNULL, "w", stderr)) {
++#endif
+ 		printf("stderr stream open: %s\n",
+ 		       strerror(errno));
+ 		return 0;
+-- 
+2.22.3
+
diff --git a/package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch
new file mode 100644
index 0000000000..773bef2db0
--- /dev/null
+++ b/package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch
@@ -0,0 +1,43 @@
+From 6d6b953cf7d2b8d06e7b0363b1b06cb2e902aa0f Mon Sep 17 00:00:00 2001
+From: Simon Rowe <simon.rowe@nutanix.com>
+Date: Thu, 23 Mar 2023 10:07:02 +0000
+Subject: [PATCH] log: use freopen() to reopen standard streams
+
+In glibc stdin, stdout & stderr are variables that can be assigned to
+(https://www.gnu.org/software/libc/manual/html_node/Standard-Streams.html)
+however this not necessarily true of other C libraries.
+
+The gentoo musl porting notes
+(https://wiki.gentoo.org/wiki/Musl_porting_notes)
+recommend the substitution of
+
+    stdX = fopen(...)
+
+with
+
+    freopen(..., stdX)
+
+Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+---
+ lib/log/log.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/log/log.c b/lib/log/log.c
+index 7b4d537b3..5f62c048c 100644
+--- a/lib/log/log.c
++++ b/lib/log/log.c
+@@ -208,7 +208,11 @@ int reopen_standard_stream(FILE **stream, const char *mode)
+ 
+ 	_check_and_replace_standard_log_streams(old_stream, new_stream);
+ 
++#ifdef __GLIBC__
+ 	*stream = new_stream;
++#else
++	freopen(NULL, mode, *stream);
++#endif
+ 	return 1;
+ }
+ 
+-- 
+2.22.3
+
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index cc740dd40c..577a90656a 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -27,15 +27,10 @@ if BR2_PACKAGE_LVM2
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
 	default y
-	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
 
-comment "lvm2 standard install needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
-- 
2.22.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
