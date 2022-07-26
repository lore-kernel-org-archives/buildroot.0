Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF29C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADD883E4B;
	Mon, 25 Jul 2022 22:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DADD883E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNiYPi7gW7nH; Mon, 25 Jul 2022 22:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B76B83E46;
	Mon, 25 Jul 2022 22:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B76B83E46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D15491BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8A6A837C9
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A6A837C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWTmgZsSEFNP for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:30:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431F183300
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2139.outbound.protection.outlook.com [40.107.92.139])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 431F183300
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:30:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDKOLnz8NSEbBfXmnR6wwVFsB80MHg6t8vV7sD6MxJMBnMmTzHDwW4WTwsCaoe9w8IxrAK+CNhv8Mua0Hz3yeEUgVBS/hxjVdNgczAXIaEmE4+uNrjxmnT0HINuAlZ9wtx2kitgkkqC1udjd+4iBSVpeQP7uvAA+n4dgNgazDSy/NLrW+jFvdvkSMrFJAdtkunks8Vr8EAJzYVi6n1Izy6/bwak543j1GcSnqaIU2mI/ApF6S4lorXWcHreZXPCxV18Y+exQVBTRTNbwPvsUmfGrTp5uPZD7MgctqY5Rcev5iZcSUNdr5dFx5JEu7T99Xq7SRRjwIEMVAMdnURYfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXFMXxjWVDqwVgMQAgEZyHgovNBI8yWuVv5CIHd8sko=;
 b=ILVmPRkCnVXpvGFC8KS5TG0bQsZ07uPGQ3RHjnhwIbWy9SIzknwIQg29LQ7Ds3NUigFMuJArlSKuC1vMMvD5C0f6947p+rmT5ZLoTSanD3jHQEvCNfmN6wgT2RySAJE4G4Dpfxqbe+6Wo4s8ePFyTG0TRdQW5P/eXLdUGDvj/+crF+57kcuPh9ZVNoZr8PYwMqkSG9DljQqtTiiTauxdmM2X+dfucVLz5xxZcsZtqO7nEqL5TGfqj/qIFX1b6YIF3akAOd/XOAnJnsWT6H2kW6FFjJpoQak5K7eh7l17V3N2Z/gducW3BKkBHc8R+wZQjt1yqlvFOUU5Qbcs+RaGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by BL0PR10MB2817.namprd10.prod.outlook.com
 (2603:10b6:208:77::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 22:30:21 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::7451:2903:45de:3912]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::7451:2903:45de:3912%7]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 22:30:21 +0000
Date: Mon, 25 Jul 2022 22:30:09 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Yt974a8KLSLnCTt+@COLIN-DESKTOP1.localdomain>
References: <20220720171125.2914642-1-colin.foster@in-advantage.com>
 <0f201981-84b3-db70-6fa1-091c3ae61882@mind.be>
Content-Disposition: inline
In-Reply-To: <0f201981-84b3-db70-6fa1-091c3ae61882@mind.be>
X-ClientProxiedBy: MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::25) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9531eb2c-f161-43d8-9b97-08da6e8d3f8f
X-MS-TrafficTypeDiagnostic: BL0PR10MB2817:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zxI+Owsep/QITpGhaVFRNu8ytBGjJq0VinBD55ivdIZfkiOzlK29vYtVEHDRs6qCr0ejYPU7ZflDDmZ5eqNYfejmQ0x+BZt6oW43lcYgTs2oAjcOxdrDr4wNsvAWITzGe+yXfzonvjCb8kiWsPx0M8dHMVdQgqXumSBBzgzZY7yPKjRJ1F1cyANzGvmB5Cl3HtpEqjBbBkDc181jY3e8+eobOVLYzCQIGijFrG8z0Xo2Y7oSgHDlTBXz6ktXX0xBOrp0pw4DGYRTJZuotVxfMVHi1ovSXyFe+nDXiBb4UiMNHuygWv7/QDecrNA5s8OqjiCLOq3N1v1xwzDqCqJpN6yh7TsbmfCV6aE98+ZKV3yqxqMmHW/7GIiSm3nWprqQu4jgMqLlaKi5S7J8FMOSl91a8a0minOI6KpWc3idJyoneKvIblZXQN70hiNBq6Geg1N9hOLmXpneKnILTVZUzP6qg5AeqOAK+q/3IyyPNBzkZEqoP/yt6enSAeJ9juZjRDh2X3usuAslhe0eZQETy3Wl3JLcobxCuOcoF8KL59TUjsLJ+pCW3H76Y7SE+7bo+X/X5/I4rw7tDS0pA8OEEDiSHqi0QAIdG1FAcyvBhWk2IJJk4bBGWKP5QJffFobOpMOT1FuSvKLER3Rm7MUAQ0hXe+8aXnWxKe8MabCK4dOmBzHUTZIdIvncGIJUqcl0ZsStVJ+qRhW/lHxQiXV/2ysnYkE7UdiMM2IDtAVX+ZFAuwNz+JwCTk6VH2Rmvs2r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39830400003)(376002)(396003)(366004)(136003)(6916009)(83380400001)(86362001)(66556008)(4326008)(8676002)(316002)(66476007)(66946007)(2906002)(186003)(5660300002)(8936002)(44832011)(38100700002)(4744005)(6506007)(9686003)(6512007)(26005)(53546011)(41300700001)(6486002)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1UcZkeGPEtV8yi51BSi90CJazX4YRRs8UT2glw+fAmt0roAp/7Hvuc8LMBzo?=
 =?us-ascii?Q?lYIm7M6/Dwjog7fdDyWWe1hSpZ5Pk16ksKq740vqrUtLkpHzt0/Wf2SC3aEJ?=
 =?us-ascii?Q?I8ehIHML+k2Km+FiBgSYK2rrkm1s2SZvYkKeVWJd4qb5IzVhX1aCazJWhzqR?=
 =?us-ascii?Q?aCWAtnIAsJYmI+n43ZsiBarPQR9Jj1icm5ZVh4wf7xa9nXwLDNdaz0HEh6wi?=
 =?us-ascii?Q?2su++Axh4PmONWvfZzVCnTAT5dB4iB/FSpNjoraCc1VwYHW24VWtKv4Kf3xW?=
 =?us-ascii?Q?cExUEOoiKTWmOJQjia4AXS1Kpy6j3tiG5otLV95cMRNrnQ8qWtB93e9pGYHk?=
 =?us-ascii?Q?vBLsPSeC6AXGuWt1JHzet+s9cLEBFoQoRD/uJW5Ievu36X9YLTJgRY7O17Cm?=
 =?us-ascii?Q?4y3htzU80DGfiKzDyc3Fy9yDMtrehAPDuCJ/IUVJc9GWqcAfEQ8dr8PbgI2y?=
 =?us-ascii?Q?epUEhgjd/N/Z1cheImNeIFjpEtIlK8Em6KRgdZQRbse/F6GTxxWOY2AS2v3B?=
 =?us-ascii?Q?3hPpIWP3Tq22mXhnuuzpnNRJcFy0K7zZx5fdN8D+q4q9dbDMzI3psjY3Qaq6?=
 =?us-ascii?Q?b0wJQmZf9fsfXSOnQelHul01jwqNlDC1bv/hKQcmLp11XLqR6gxaqWs0m6HG?=
 =?us-ascii?Q?Cn4tA6g2amYdJ8ir+usAHKLKdChWs4uByNhyWqRNgb7UkvpWBkJfzU15Svtm?=
 =?us-ascii?Q?Bigl5MOanE/z1aS88JT2lVhTjcT4E7HuulVWaSCOZNuArVl1bTVSWwl/rgEx?=
 =?us-ascii?Q?7kExeplI+QAFPCCIwLo5GvQlMmqrxpw8Jvm13WiSO8ehlivhk8raWPNE5L4t?=
 =?us-ascii?Q?1cV0v86daXwks8nCSKABNPUp06zkhbkLB1ioLqQ16rt8MXt+BAQvo2yvhUet?=
 =?us-ascii?Q?HQf8ee/waoRxHcj5rU4ciq12gCoxiOw4PgL4O7aNNyH+r9og31akIyis134t?=
 =?us-ascii?Q?z2Rj0Lm4m9GlvhtKOi3maje72lgtzZCi/5gRduYPv/nfPMhQzLgCrX2uiOlE?=
 =?us-ascii?Q?nqG/rK8H0Ef/JphZeABr8cb7Hp5GNeGV1UtbqsOX3dlaDRW69tqLenQo/RAV?=
 =?us-ascii?Q?nfpd03U30KsWNsD7jkyWJEztGrkT7D06kfd4leuda6mPG9GekJhg86y6iC4U?=
 =?us-ascii?Q?u7NFICPP70ShCdlobXWS5FTpurTry2JM+3PisHPod25q/XrxWLR6WUV4s1Bn?=
 =?us-ascii?Q?3PnqYfUclFU1lPm44BFhi20B/HJgDFjRdGN2tczBlQ0f1RGhC/HpJYVTLYuA?=
 =?us-ascii?Q?Wvs2DVIGfKmOMUFeJTLeTMwZWf+IRR+KjVwRw8c5Hy3FSBd0NJ4MpBWv0Btv?=
 =?us-ascii?Q?SXZcm/YB0QQjzIQ0AZStcf7E974ORAGlDNNTHlW8xdKphRYH/CxghWHRPRub?=
 =?us-ascii?Q?kxcB1MD+JUo0Wu563J/TgdNhk3yEm4kqYWEL1tdUObPFS/0kfsPfeVEi69oQ?=
 =?us-ascii?Q?DVK/UZJzJLMdrYsbwHlTTV3G5euSvbbZfPNpa6zWLyUW1fymbe1FdrhCigtB?=
 =?us-ascii?Q?0+CVI2yRyXP2NEkkD7l8Pur0WxbHm7/oadCbWOP92J1jcL15vQBRxE8CatpD?=
 =?us-ascii?Q?cLmfoyyI7u6AdX9Zc/Nq390RxchDVXDwJIcsXovipGLAQbsfjfBfrWwmAmIr?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9531eb2c-f161-43d8-9b97-08da6e8d3f8f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 22:30:21.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAPGa9QVF4y1QxDaXmfHqrBsL1TRy99S7RR11XWE7mmXubs9xStsQlJN+DzDThLaWH0oeGxoBwb8rPm/3lOth/2f52Oxx1wcxdAWGBW6Z7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2817
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXFMXxjWVDqwVgMQAgEZyHgovNBI8yWuVv5CIHd8sko=;
 b=YojT8beFUqYUfqtT761ll6XSMrH1DOg2Uq4QbIIVo+yh+quirNG7HXwbA/EEI+ITiNgEYQBFo165IK9gLAQlx8HzT4MlcklExKh24rgyDVdoBASnPcn9YTvQa6wDJZV6KQUN9pgIbxlgH5VivcqS3+dLgMYRKfX8fNiGtVFJLdw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=YojT8beF
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH v1] package/mstpd: fix mstpd bridge-stp use
 of pidof
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jul 23, 2022 at 02:47:51PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 20/07/2022 19:11, Colin Foster wrote:
> > Through mstpd version 0.1.0, the bridge-stp script uses the '-c'
> > option to the pidof command. Busybox does not support this option, so
> > mstpd does not work.
> > 
> > This has been fixed in the main development branch of mstpd, but it is
> > unclear when the next release will be. In the meantime, apply the fix
> > here so that mstpd will be useable until the next version release.
> > 
> > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> 
>  Applied to master, thanks.
> 
>  Would it be useful to add a runtime test for mstpd to detect such issues?

That was my first fix attempt - run `pidof -c init` and see if it
succeeded. Fall back to just `pidof` otherwise.

We decided to just drop the -c argument entirely, since it probably
wasn't needed.

> 
>  Regards,
>  Arnout
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
