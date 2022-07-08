Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35984CCA47F
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 19:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7963A61448;
	Fri,  8 Jul 2022 19:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7963A61448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ijsak0Zgt54; Fri,  8 Jul 2022 19:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F256144A;
	Fri,  8 Jul 2022 19:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F256144A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA9531BF38D
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 19:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B382F613D4
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 19:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B382F613D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6aXly7hCp7jU for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 19:26:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42AE60B28
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2101.outbound.protection.outlook.com [40.107.93.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C42AE60B28
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 19:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9CDPG+KcfCp8uYBh9Lt91Dp/Asrr5R1ur30upnZoU6vU5gIky6urzgZTUnQC0c/jBMQevBntp4qoiHV9p5ZH68PQLXFDRzQFabyDWEpGyMj/ix2gPzj8P3QmbhdrjFtRMNoPWQ3ujMpM0vHad2cQbpmyGTOv1k7wSkNBvZhfyaAwEmfCLWjMXlgGP7yJ4jQ++ad5iupYFlz2iAJvNQ/rTAfrBJ7O6fN4cSaWTrNxCO+tOma0mGtzN8jTEj9RO2mLNWP4LqWDe9g55MjX3BY/YuIqBZ5isK1/SdgxQekagd0zb/A3Wl7szP7rLrBIZPrL0UlCCuD5MPW/LacS12AHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C63neV78lBAnymVD6ylYawO9Nria5a5gWy/wQKPQDlo=;
 b=flDL/Sni0ULD8VFQW/NgEQzwUF0+3FLZ0ceDJ9gy6tN/8R5OsYZ2UoPU2uH1mF4wAIxcc8u4NZN5wL88vuziS67wB9IW/iccXGgUjouiKecKk0O4fCAPlfKGKFzFlKrmFYizarunEpy3B9X8bGo568+yYhG57dPoqbqKbSNi0+NyUJWv3J8tFo76Tdzy+S9CxxyydA/zYi52NoDvUQ3wxM9ZYNGTvKzFyJ3UtWJ695Hewi/EbiF1x0L01ZETW75Jymf++a21VyW0qTuVR0AfIz0uQ7zjJ61NZb9cMHfU8Qp7p0+WnzrEh6Q+enB9XPkeGRC7n6ecPSkh9UWN+/d+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by BN6PR10MB1891.namprd10.prod.outlook.com
 (2603:10b6:404:100::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 19:26:06 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::712f:6916:3431:e74e]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::712f:6916:3431:e74e%6]) with mapi id 15.20.5395.020; Fri, 8 Jul 2022
 19:26:06 +0000
Date: Fri, 8 Jul 2022 12:26:02 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Message-ID: <YsiEyscz0S5b9zj9@colin-ia-desktop>
Content-Disposition: inline
X-ClientProxiedBy: MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::7) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f572167c-03f6-43d1-b3b3-08da6117b447
X-MS-TrafficTypeDiagnostic: BN6PR10MB1891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LN3i7jHT4PkUFTIYX9OUFxSb+u1Tac3ISLbV85g1Aq4uv0evVu1C4xU++0SxIQhze3kQGL6RQU0bcXGOXJAgtGb60tmDyPcaIrs3DjZpuTNalnRSk7xfUZLyRPloL74+sJS/p36kg8+t6YtTbMK0MJeZ5dOoVq3l3gMUrq8iMqou7pJtRmysWer5lXVitSWNatH7anh5vGR0RRpfQPKn1QK+OCunPDgiJ3adiCieRJ8GtTWcu/gTwsevEylROIIUxzItg48b3JFhw1rDm1WE5/sEQfdOeS0n62QkpKwdCsS1FLcUJB3vw7UnsOQyzNo4XHKuWy1QFL9kjFLdHBfu5QzCJgOWAgrOkpCsfgt/URMjhjL8TECgHiNeNdNq3NBvxXB87/JT1sAPviy7WF/BJXYHi+N8WLcXN5/UJI2DaHpm5QabhLV90V41wXpHwfwZ8VCEQ7LT7Dbjscz7iWdn0xIwJhiVUEqioobwNUCPWFZQU+7Fl16fsqbOfgJ5jtlon1qdA/ofKR7Z/jhwUjkuIQD0knE3S9lAZgXakKd0fF1akf9baAUo4NgprsC4/w5vPgT9MLn1O1xzq7qyePfGAjE90uUVcD4U3fJCf4OcSYxfYmFhXtM2IHMKiwO1vDwnmQWU2a5jehwedzXfDTRtDdHdIv5VEbLUjX12/mI8HjYZ8wB3TeoojyK3vEASnC/Q1rjntZeB8jjoT9mCib2fU1z6baWQsXwLl07sT0kCJNe2bbfZ+KkRWgRhtGgo4riJ4SP9JDZPA9wV+z7x8kz6iVhbyluaQVsXsQqYAq4MX4Q4XPLEGbtmH44GuXpSLbsT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(396003)(346002)(136003)(376002)(39830400003)(6666004)(9686003)(6512007)(6506007)(6486002)(26005)(316002)(7116003)(86362001)(33716001)(6916009)(478600001)(38100700002)(83380400001)(186003)(3480700007)(4744005)(2906002)(41300700001)(5660300002)(8936002)(66946007)(44832011)(66476007)(66556008)(8676002)(133083001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9dEqVE1ppqa0l/9CoxdKuKQoplG+nn9YLZkjinS/O9VRF90lAyO4Wgs6ErRo?=
 =?us-ascii?Q?cpMYPobKewnG2u+XU5m4vgBWwmDt9qEpwvssaWxLDsOBzs8UfmBmL7C0SUpa?=
 =?us-ascii?Q?zAlrKcowfyVm3mmOM/+dKuDLN+qWx89IdukXzKfSSmyBCvPCfOc7KY98jrpv?=
 =?us-ascii?Q?MT6Yp6wjuXPjzLDoLMip4Qp5PmvqnG47Ha1QdZGVpNegzK7RJaOf6oVx8V2t?=
 =?us-ascii?Q?bfPQXfNC17Mhe/kA81fb5q7KNnb0+B3KXpH/sPODCg77QlRSTFGVJgr+NTx1?=
 =?us-ascii?Q?wdd6fikpY5QLey2lrRTyCTvUDB+ExKfZVekUAPGFr5r51Ub/SylT8kT20jUH?=
 =?us-ascii?Q?nI4txaUqW5XIdH4BbsxhVrgJ98ca+Vx1OHISGkAWAk2LAyHAiWmJGRqgNm9E?=
 =?us-ascii?Q?76edU+14K0ph19RXSai4lWMo8TMSJymACgjYhGhkxRCV99dipW/RsvH3tS6a?=
 =?us-ascii?Q?xPcaLKLgoAixcMG4cr2MJNpfAyS6BVNeQ0SBKng0vVeIGRN6lrTIJBqHodEX?=
 =?us-ascii?Q?OUjsRQF7hKniZGpSaHg56ZSdEmOia4lkW87jTkJAmkgCr+uwCdqveemAZGXr?=
 =?us-ascii?Q?bN6nCQQ/cZecYPOsKDbDxIsTIijhYrlP2xduLuqaAydRsR3QXoIfDaxMNgb7?=
 =?us-ascii?Q?mZ2EUamG+uEGxf9/dfqwWO1v2UoJ3lmGLY1hfGycu3WJVBOv4QUkJTwuL5c3?=
 =?us-ascii?Q?6tLYT0WBzqJ1EpuvRMfwVbTZfFSh/9Yv5Z5sWrW5TxxAxh+zIXHnH6D+fID0?=
 =?us-ascii?Q?cSlLYUXbHdP1CtVJIRLytctjxJ6hsg5ZuGWznbnKYD12Vp59mY4TY0tfnLHt?=
 =?us-ascii?Q?5bz24bYMFKl26xb5DDX5mg2IjGEPlumzdcvdWD17kHywuZ/WvkTwu6Qw2ZjN?=
 =?us-ascii?Q?mazvNWtavLUYIRqqU8ytBZN4YyI6Q5TS/aQRJ7AywsOb6UxxjKpj9uyv1WSZ?=
 =?us-ascii?Q?3IBFMyqZyV383rZpKeWj3VPkDM2Ryjcy7EvtP3GKQi79kdbiJrMrsFX2eya3?=
 =?us-ascii?Q?B+slUTGWAgFy/fsl74Tr5MOHBZiR3yrnEFS4DBc4MLzStuVJL1UckWdoWeTO?=
 =?us-ascii?Q?kqz93I+6mQ13uUcLyw+Bdzcpx/dK2XV2CknGDcwlO7YlvUiCVIezEV+hJnzB?=
 =?us-ascii?Q?nntZmsxvrCgFWJugPt2M/CpK/XpvEf0GZ1IYIVcp+WEtYZcDV5wwwb2SNgsv?=
 =?us-ascii?Q?bVDOuzfV2EpErb9WDinw9Gi8mXauoklxzL8bJdOKAWGdiiwbVXpVO3144oqN?=
 =?us-ascii?Q?mFpWsFiGOKLiDW3eaHX8sn6YTQH9ALWwMVs6PpfRLvQaCfrc68sR73QbIrjc?=
 =?us-ascii?Q?xSEA0DP3Vk15cZs0xjftAtb4x2YbWOuoWRi07deIzPV4aPoJvLyrRQL33KaS?=
 =?us-ascii?Q?zpLkFb1nHLizjlGbJl5BIa5ytPOW97Ai+eYWPPS8pURgTvj2M5pIreKDG5VJ?=
 =?us-ascii?Q?FGE+G4bMbWfLWJkR+WJAPo3CmQqDvHWyv8/arWhJl9Ek8P4ph5jrKcLouCc+?=
 =?us-ascii?Q?owA3vTLhrRiUdiP0zJUsRc7XtBqHiL7t3VQKzW5vtXRuqk5oOhaSVEJTDh8k?=
 =?us-ascii?Q?vmGsGGqRYHO7crFkW0IfKoELnEBjWxyUK7EmGf6cfTBwU4noFciXyht211IA?=
 =?us-ascii?Q?PW0uhMvGKDklUsPMmNM7o8U=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f572167c-03f6-43d1-b3b3-08da6117b447
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 19:26:06.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kd+BQ/7xrsfAPJ+v1OqCfqXSuFFrQ8HdcP/pgUtBYQGB34VaBfQY56N6vUSza3Cegeu5YoExGOSHgcBpfci7ZUv/24inog8UK3kX1Zm4GZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1891
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C63neV78lBAnymVD6ylYawO9Nria5a5gWy/wQKPQDlo=;
 b=J5ZdLN+xUeq1lnz/XMzmS1bogywt0gTt7F2kMi+LPL8seCWiMlyZPOIn+GNihrmO5UPvejB7gT7lIES0rlJXrT2wx+94ofs+QdtEQ4ejWH95CSEAnh3hBe10nqjxmu+dg4aP1A1DBybbVkzAlbkwkSYEcGzYUKWJtTIxjz/4rHQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=J5ZdLN+x
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] mstpd install location
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'm finally getting mstpd to start working in buildroot. I noticed two
blockers:

mstpd was running "pidof -c" while busybox doesn't support the -c
option. As a result, mstpd would fail entirely. I'm working with mstpd
to either remove the -c option if it isn't necessary, or detect
capabilities.

Also, the bridge-stp script gets called by the kernel, and needs to be
in /sbin. However, the install directory is /usr/sbin. I'm confused,
since Makefile.in seems to use $(DESTDIR)/sbin.

It seems there are two options:
1. Change the install directory of mstpd to /sbin, or
2. Add a post-install hook to soft link /sbin files to
/usr/sbin/{mstpd,mstpctl,bridge-stp}

I'm not familiar with autotools-package, so I'm not sure why option 1
isn't already happening. If option 1 couldn't, or shouldn't happen, I
can certainly look into implementing option 2.


Any feedback is appreciated.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
