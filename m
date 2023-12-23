Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC39DC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 676E54168F;
	Sat, 23 Dec 2023 17:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 676E54168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTebueA83HIS; Sat, 23 Dec 2023 17:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC7B41583;
	Sat, 23 Dec 2023 17:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DC7B41583
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 538AF1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27DBD60669
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27DBD60669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhk7mzDE_Drb for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:18:15 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::701])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2F9060593
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2F9060593
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBf/gB1dE6Zai0XWt3oAIUNVqS9aJU5YbvE4vuEZvGWLMzV3rEiNJBVyy3iteMfFCQTImVp/VbhLV4LstNo1GYWAj6dV8q0E8gdEqsVKEj4SmT91CmzvDOZFc9yyjlkQdpew1o92gowkbkEqOUiK9oN5hbtp3MPpzlVczURCnyQrvTRBKuxTMjxMAQBocpf2CQW8CCi9zg1Y/2M5IvCdu39uB4BdoK2FXcmm4t/2q7hXmH7l92tqfq3l+n4L/vel9zLyvp8lzq0noNW4ddiPtIeA6uIMpUOUinofttQzjSmc8+bNUpud54cR0mf0e9zOe1MVI9Pa832yIU4RJ271fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnyKrgobWvfVYs0XwWyDQbju68mUF6bC6OjbOzxRGF0=;
 b=F75aoK+sJYKBSgPIvTtunT4PbSfC1gbVD3pgdCdf6g7UpOucvIC62JOZ7nvaTAM0Hpa7mZ37VPc/HFRQeWAhyA2JAvV7rGG9WtTfWUKMw76OePQE1Og66vlwfR+qo+np+jgHndLKB1k07RYnaHs0/u2phEz3Xgk+AX2pypfCzJhV+zKc5KgBFeWmrgunrOG1VL5BqqXeHJcg6uqvpDj1vHX6JpeGoFFG0glRBWvD3N4Q79CnogwF0ArJfQPnE2esa68FkNR8iIatA76rMw4UIAWQDlYsSU0iLCglNiSO7DtMjeSzQ+D/wwTSSRKeUqNLnzEE3q2CDgaU5FrrIgzp6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by DS7PR10MB5229.namprd10.prod.outlook.com (2603:10b6:5:3ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.24; Sat, 23 Dec
 2023 17:18:09 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616%3]) with mapi id 15.20.7113.023; Sat, 23 Dec 2023
 17:18:09 +0000
Date: Sat, 23 Dec 2023 11:18:07 -0600
From: Colin Foster <colin.foster@in-advantage.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZYcWT1FbdKi7UmFg@colin-ia-desktop>
References: <20231222232251.12786-1-colin.foster@in-advantage.com>
 <20231222232251.12786-2-colin.foster@in-advantage.com>
 <ZYbmjjPUjwx5b0qk@landeda>
Content-Disposition: inline
In-Reply-To: <ZYbmjjPUjwx5b0qk@landeda>
X-ClientProxiedBy: CH2PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:610:50::12) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|DS7PR10MB5229:EE_
X-MS-Office365-Filtering-Correlation-Id: e862c7e5-4c0d-4092-9d6a-08dc03db2286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a4mCsIyWWvYxGUDl8wSIbRj+7FZ5/uiZOU6nAfxBvEB5qN5yoSPpaVmZpLpXq/xkLOo8AtpB/pm7fk0jbKUFtwA7jZHd/RI61Zm2WKSR0Pu+oI5FRPdHYzCCFPexGxEzwqQZfTsacguOPpirif6IU19/fQuc6/qKIWK/HuGqMiSBlN3BIjlZmsRQ65eDVbtfNpQnVW4Zor3Aep4KVkOVQ7mmibJKm5+XagIew6DvyWhpDqhuMK/4IHkZAjc1Bh+9oDvLLw5CwYHicTg5R3VkSw6JPIQuOzJrghP+jCpbj9V/Kq0N71f9HelP2CIgpVaV8NFb5wxo/NnPwPAcPKM9cmCJHqiBjeldbcvtwjnAohzUgD0/xz2pXZ/wPBJzDXBEgbIansRQxlq1NKeWOAHzcwzEM/lqXSo2W7kVjYyLqnED/B04K4GFgVz/eYm/evM/dpRuasdT/DMFqohbrnXbTZp+2cBmjont0XnHcVGNgnxFe+IE39mcDPheJUW9NPSPUuXwkiHmaT5yi+wOSmrOE2S3nh9ycYyFP6QeeetM2vFIi/44ajMwQZ52yqPFx6cpXYtHy/79xXty36BAk6NDyj99JrSEkuROV605m5FgAx4wahJ+AINhWqkTLNr1aCz1Qo9qRJ9LM69oTO1MF1Xoiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39830400003)(366004)(396003)(346002)(376002)(136003)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(64100799003)(1800799012)(6486002)(478600001)(2906002)(966005)(8936002)(44832011)(5660300002)(6916009)(66946007)(66556008)(66476007)(8676002)(4326008)(9686003)(6506007)(6512007)(316002)(83380400001)(86362001)(26005)(41300700001)(33716001)(38100700002)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZSx1nxvRJMFHfIpBo30RIuWhHbOfwjYVLSZwUEZiHxYgpXM43mZRtI3ee7k?=
 =?us-ascii?Q?66P/3hLPCTkiFCde6h63Nkc0ljzvtJJquhlgb0c7wue/hvpEcyHfZEmcgi7T?=
 =?us-ascii?Q?TxircB1OaDDB7YMgljQbQ1qtdXjwRQKlutQ+T0xL0Y2KJU28flaOwJpBE6kG?=
 =?us-ascii?Q?ID5Rkt7lGdm862u8ds0fq4wuEHCs9r8sJ8g546cMZbIS21YY9q/mH4Mj10oA?=
 =?us-ascii?Q?lwOV6fozpezS2PLL9CYWFYySTGK8J1uIXgXjOTGTB8lOpobijjVJ27VeKsBQ?=
 =?us-ascii?Q?NgF6fwYQqM9yIZYv99uoww5+S5m8dxV6dNyShyfMe/fD+cWg/CsVTrMWc6IM?=
 =?us-ascii?Q?24wtiHTiVRj08rG8UvN4gof0Wu+6swRzuGaQfBdLsifJ371r754ZJdNk3nVd?=
 =?us-ascii?Q?5ALsADrXARzxgDVJEDhktNY8CpT92xbAcrNptjz4XlHibP6+gc5U51RDWmn3?=
 =?us-ascii?Q?+AM/uCvjJoQTv7mTRQc/V4f1fruTt+lmoINqmCeSMzzEu0PM1o+97Fg5N7WX?=
 =?us-ascii?Q?IniuTFuJpsQFOQ46wMSzWLe1BzJgCQ/Wl+q1Vb725MEl/24bt+Ra78Pnoino?=
 =?us-ascii?Q?Hm4V0YWdxODf1PgIBHtYE6akSkrghu3PWeJJ/KW14Euue/x/3sNBTg5Y/X3Z?=
 =?us-ascii?Q?zoJcSSSzjocJhFLI/gVBlqff4dhp9knNIkdAg6+0KPoATuQVSX2pRuq0yJiR?=
 =?us-ascii?Q?X2kVKcWyWam/cN3eWMkgLbrHxnPM4Gvxse7hz/sqy8X9IZMWwYhBSlQHN5SY?=
 =?us-ascii?Q?bJHUjBrIISl8z334PH6JBNueJLTu/K2P4n3F0An4LPyOgwJHveL+j3DBKXjU?=
 =?us-ascii?Q?XFQQfVlQL5L98BeecWBKuLQWzsyAXBroTMqj5DpXGsth2UP2HVJOICHTiyZm?=
 =?us-ascii?Q?YH98qdQ4IhF5NLoLj+usBhNrl1fnc0VLXDF949B67t1L4aPh9cWSp8ZJwDJ3?=
 =?us-ascii?Q?CQAhTejML2xZBZpUuX6d31TTYF+VN5Jrby2tM7vxZcTm0LFcAnN0GccvFj2A?=
 =?us-ascii?Q?NHwujjAslipA9OuBoZ5ztzgLoo7TTAAx63WpxqwK4lPQkrYFaCI8PWs8U2u9?=
 =?us-ascii?Q?gu0STux+vge3NrnEeYgwcwJkORSyJiMrsXDF+xQQgfElNRK3OM0L+Y+nFss6?=
 =?us-ascii?Q?LC7F33G/QH4khpf3kGthhw8EyB5yC8b1tgE6lxvGvw+ZDD+wLWR4k70rFbn0?=
 =?us-ascii?Q?LwCS5jnwVn/s0C2GolTFKC3q/X7Ogg7IArO6RcNlwY5meUERwnEUACkl+7Jh?=
 =?us-ascii?Q?GlkRAOmz2OArGakeP1TDcUdCP3SseBrqB7etg7KaZTOLOVT4JYdZoO4zou8f?=
 =?us-ascii?Q?7j8ZR9yvXO3BAwQAsKzLM0M/EnLnaP6cfG0tvMTHtxhhdP/vEzu1+LgfK+Vh?=
 =?us-ascii?Q?2+52McqSWl6hu1a7x3VXzU8mr28ZRL+azESC2vX0K5JrkWRlVzKG4hh5LNUK?=
 =?us-ascii?Q?HL31Ve6DGYum12YR5fkU0p53cR0r+jcgIFmqJOhLxF7k1sMFjJM95LJzMJh2?=
 =?us-ascii?Q?0Fr5ISAWdatcjJ+o5JcLII+B8+5O5jrbfeiCwZGfwU56YLZN8dLyfmHsNjoh?=
 =?us-ascii?Q?8egnQDWxqItAgxKzCvjOmHVyrRFgpW6VNXDgtDQUKRDxZZeBL//ArdBnJe4Z?=
 =?us-ascii?Q?ARSsckQVej0NA4bwN5q6p3k=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e862c7e5-4c0d-4092-9d6a-08dc03db2286
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2023 17:18:09.3372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCMfoKjpyKS4BYJUQff8LoGwBirxzsv8OBoTbAeP8Ctk+BFAQSJY0v6jrNcnEJebm8lmvzKH1B3aXB6FGK7o/6QJsUdj8zLPAGtdR9+iPjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnyKrgobWvfVYs0XwWyDQbju68mUF6bC6OjbOzxRGF0=;
 b=QGanaN7pAkFk9kKP3wzJADz6WXYIwkS988C6+Bx1TFbLvyoknHa9LIdaGSDYPuF4WF6/7RrMBvzu6JqdmOArjxzHBcR8DssOgrnIXVLKdi7saQJBf7/EUFBTqYedY7BoMU6ie8ijAONR0EzkZpIfI8SjRzktNgJ3HsO29yWgWLE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=QGanaN7p
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [RFC v1 1/1] support/testing/run-tests: add ability
 to run tests from external
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Thanks for the feedback!

On Sat, Dec 23, 2023 at 02:54:22PM +0100, Yann E. MORIN wrote:
> Colin, All,
> 
> Thanks for this RFC patch! See below a few preliminary comments...
> 

...

> What I mean is that the runtime testing infra in Buildroot is meant as a
> way to validate that the package is, at the very least, properly
> integrated in Buildroot, e.g. that the runtime dependencies are
> accounted for; it is not meant as a generic runtime infrastructure,
> while what companies (those most likely to be using br2-external) want
> is actual testing, with full functionality and non-regression suites and
> what-have-you.

I definitely see your point. This doesn't replace runtime tests for
specific scenarios.

> Also, the rationale you provided, testing the tftpy package, is not
> appropriate here: tftpy is in Buildrooot, so its runtime test should
> also be there, so writing a runtime test in a br2-external does not
> make sense in this specific case.

This one I can describe. We have a Python package that relies on tftpy.
Buildroot doesn't want our own Python package, but probably could
benefit from having tftpy.

So I submitted a patch with tftpy a month or two ago, and Thomas
suggested I write a test, which he just applied. Thanks!

But now I'm in limbo. I plan to LTS-hop so there's a couple months where
my BR2_EXTERNAL will have tftpy (because I'm on 2023.02.8) and it might
be nice to develop / run tests in the meantime. It also would be nice to
be to develop tests regardless of whether the patch is accepted
upstream. I submitted a bootpc patch a while back, but there's no active
maintainer of that project so I wouldn't blame anyone for rejecting it.

> Of course, I said I was conflicted about this: I have no strong opinion
> against the feature itself; I just don't feel in favour either... Other
> maintainers will have to weight in.
> 
> However, there is a case for looking the code, so let's go there.
> 
> First, don't forget that BR2_EXTERNAL is a space-separated list of
> directories. Your current patch only considers a single directory will
> be used, which is generally not true.

Good point. Yes, this will need a revision.

> Second, and most importantly, I am not too happy about the need to do
> some copying around. It is very often that I hit Ctrl-C to quickly kill
> a set of runtime tests, and that would not be caught by the try-finally
> clause (the first Ctrl-C would, not the second). So that could leave
> quite a lot of directories around; for long-running machines like
> build-farm servers, this is going to be a problem...
> 
> Also, tempfile.TemporaryDirectory() uses the same rules as mkdtemp(),
> which uses the same rules as mkstemp(), to decide where to create the
> temporary directory. On many machine, that resorts to using on of the
> TMPDIR, TEMP or TMP environment variables, and it is not unusual for
> those to point to .tmp, which in turns is very often a tmpfs, so does
> not get a lot of space in there; even if only the infra scripts are
> copied, ad those are not so huge, it is still not very nice to leave
> around...
> 
> So, the question is: why do we need to copy?
> 
> I guess the reason is that nose2 can only have one starting directory
> where it looks for tests, right?

Exactly, yes. My first go at it was to just override the test directory.
Python dependencies stopped that dead in its tracks. I looked into nose2
sources as well to see if there was a flag or something that could be
added. Unfortunately I didn't find any way to do that.

> 
...
> Of particular note, I came up with using symlinks, so that the packages
> tests would be eventually discovered by nose2;
> 
>     https://gitlab.com/ymorin/buildroot/-/commit/1d9fc876483727c77ec93b4657cd5b4884e2adbb#a66a9b8b0912024dc207cec14b32e038e0c208eb
> 
> Basically, what that would do, is scan the package directory for files
> named 'PACKAGE_NAME.py' and create a symlink test_PACKAGE_NAME.py in the
> runtime test infra.
> 
> I wonder if that would not be a better solution...

I do like the idea of symlinking. I feel like that would break 'git
status' if those were done in the buildroot working directory. I'm not
opposed to this idea at all.

Maybe those symlinks could have a pattern that matches in .gitignore?

> 
> I have also not looked in details at the patch, because the change in
> indentation due to the try-finally, is difficult to follow. If we are to
> go with a solution similar to what you propose, then it would be nice to
> have the patch split in at least three patches:
>   - one to introduce the try-finally, without any other change
>   - one to do the copy of the infra unconditionally
>   - one to copy each of the br2-external trees' test suites

Good idea. If the full-copy method is acceptable it would be easier to
just always copy.

> 
> But please don't respin too fast, let the others look and chime with
> their opinions and reviews...

Will do. And forgive me if I don't respond / re-spin in a timely manner.
There's a family addition coming any day, so my schedule in January
might not allow me to jump into this right away.

> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
