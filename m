Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BADC7EE2D
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 17:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8196E40467;
	Wed, 24 May 2023 17:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8196E40467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-dLFTghoomP; Wed, 24 May 2023 17:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 486CB4029B;
	Wed, 24 May 2023 17:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 486CB4029B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33F111BF301
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 17:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C0F83F27
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 17:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C0F83F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1rDXsz3qdRF for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 17:50:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF0C83F12
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::703])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFF0C83F12
 for <buildroot@buildroot.org>; Wed, 24 May 2023 17:50:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC9yNyyB2vguZKfV+jzaKHjfuoNUR31zgLRJS5Shax9A5GOJ7EYZQu/7EKZXa3ihwVas2xBO2PG5hkcFczBi+mtqGAgWtARdL3tsKdAr6G107ARHlWpmdG+GjntsZ2dgti47tmr86DH7Qntpvr9eDwHBvjG3rNPofUmipL8WGLASwy1L7ToG1b+5qDxX6OJnzXQVwlsGycPbnpthmmDlqD6XVAzns3yM4CaXJIG1fu8MIJbp5F/Ba+o1luulMiP5jjS/NsUoyAtEeOKBHWRxV3+MgMYix0Hwhn4+vf1UMAt32HwYiGWqy2JqYEbjK93cDRYvf4uYfCx6f18+TJUgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tddXKVflfOi9tTt5ma7A1A5CoahLODoYpTcJxLYVpuA=;
 b=QmI95jJuPKE8zRuo/o/QSlReU52uSS8Mr2i4qA24qjk+DDxcR5VisSNlN+uLJZf6GQrM4PHOVRo61GJHA7PERuUJtGZx/iooVvkJjutHBWVx1dSpVDKt6f6KPL0cHuJrroBxUMA942rwXKaDTCIRvobPmaDKtTdUnuAuWVtRbK7dBWQdl3R8B5MwO72hC/J05SQa8zk4k2SHa4Wh314GHhPFB0hd2flbAZLRKKCXLAxnPHYRZwxHWOco/153o3JGD5Ju+AxseFDcIrJxr0Hx3pttHpi2kvfA5eAD2o6MoGzG9I80fAe8TLpVJZFLRvRG4a60potZhv2+2y4RBAr8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by BN0PR10MB4949.namprd10.prod.outlook.com
 (2603:10b6:408:12b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 17:49:54 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:49:54 +0000
Date: Wed, 24 May 2023 10:49:49 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZG5OPViLTB8XodO/@colin-ia-desktop>
References: <20230523172120.1948573-1-colin.foster@in-advantage.com>
 <20230523172120.1948573-2-colin.foster@in-advantage.com>
 <20230523204335.GK621937@scaer>
Content-Disposition: inline
In-Reply-To: <20230523204335.GK621937@scaer>
X-ClientProxiedBy: MW4PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:303:8f::15) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|BN0PR10MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c0d174-e5a1-4f5f-cbac-08db5c7f47d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UPUdDy94qaeKwoaAwq9CpinfjLIWp44ecJ93EvqsWGLZVF+e8gmZohRCgXPVR3xaIG9/sDtPz4kAMrLJTj2949a8Vg33LBBFwDttyw3NcaXqMEIBfG61H8tPb4ZRPjN9aciamAySs0oFfzm01i4l6atKCUJF72ZPFt2wYiANEJM7/kdqNHe7O1T8sKffoQaJSpHR9SujHvBTdylZpCkLoPZd6CToUaB1U81tUFhH3ORG5r1foO6ZSzNO5/FAz3/F8V8k59eSOypD6Zo/86C0dbD9L8BIKCtpHrrfqxHETJzoYm27eXmlp9LwTsZ1Rw74499qEOYp7TlQqHBsno3mgbfmId0Iobw3y130q7qH3s9Dfpp4LFSJlf6TgzAwGTFjyNZkEA6+iRJn+CfG9UEpYwSFpbJV/8HwR8gbopj8z1h4sk/WFqVmJfGuiYbQguMdgilLitkNxYf43OZaCwkOVVDcRqLtlnNDiAWPeK9+cX5ojjNgQHAeM90RBnugvvQC25H0q2BiNtdolErudkvS5xl/EmK4msNnlIDPMzEoew4bEde1+9iI7tTik6OQ0LgsyjL59Zf4G9BUCFlh8s6Oy4ICn7aoLHiwBVcMKWzv30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(376002)(366004)(396003)(39840400004)(451199021)(6666004)(66946007)(66556008)(6916009)(4326008)(38100700002)(33716001)(66476007)(478600001)(316002)(41300700001)(6486002)(86362001)(966005)(5660300002)(8936002)(8676002)(44832011)(26005)(6512007)(6506007)(9686003)(2906002)(186003)(83380400001)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?opNff6I1aUak3ywwV5G/ze/ZKbO+ZLTG0AGe1apVJzD1BN2MZTCnUV4OJuWq?=
 =?us-ascii?Q?aXBM1OyiGR7Z18b9FzS1EEggA2Kjalee+QFQFBUan3DrjK8HPRNSz7a4LBps?=
 =?us-ascii?Q?i3A+wQWq3OY2K4VjOBzj8xbwj/cRgupWmL1VBBVjiUYnVnoL01ehCyU2g5U0?=
 =?us-ascii?Q?mmImxZGxB6IQVhkBqIl99nLKR1Kf5kvPLQScUbmjnzf/H4CaOrY5A/H1KdYL?=
 =?us-ascii?Q?M+IH2ZRhhY8ceD13c04DHZeiHmpaTgmhRabeyzeqmFr37Hat4LVRV5kQE8jP?=
 =?us-ascii?Q?vbNMSIaGFSxb4hmnqn3kH1gVFYf7U0CT4OAu8tqxoTjvojwE/qBvzwXuFmdN?=
 =?us-ascii?Q?U1MFFXNi+coe8tanHOUwhlTJs9MnkDnPuerP8WyMQoVy3Hw+lUiiYSN3VJZY?=
 =?us-ascii?Q?k2gTljwz3ru/+SX1Iw3QqVKRxeY2Pysz4zawhnCObGtSxlC8aHH4cSllz9VW?=
 =?us-ascii?Q?1H2idwd0Xq672hpYIFUfuXC6t6h4p8ZgdN85Ua1t+pLbV9Ui3X6NvrlUqK8i?=
 =?us-ascii?Q?fNSZ7aGdUQOaO8yO5CUtNSgT9/6Os2wEPjWeVonbyTVf9jld2am4/tb45TjF?=
 =?us-ascii?Q?irDEma9yHzzCDwbwGUMxrXLcrBe3Tsfo8JePqLIxsLQr8sm3Tqc1Wh5dkQqz?=
 =?us-ascii?Q?ImDI2fkthTWlnV+ZQM0LQBWPlBqGH3Xk+hVS2W94Aj4XYc1FYt1Cx2sDuc38?=
 =?us-ascii?Q?l5jxe0bq021rH7ZQLflwt3z/n/enivChN2y80uVuy2UHFwjFkcKLc1Rf3cTR?=
 =?us-ascii?Q?2JF8+ynBmifoMCzdfUW+V9ND1LXY3LJbSRhk9Xdpd7k4sk6PNPlsggPxWmd2?=
 =?us-ascii?Q?Nf83g+q0PAGBqepV35cOurHGHjJA47n37CL9t2EhVbM6k3X+X/iOeqg/FeCQ?=
 =?us-ascii?Q?cOVPn5wQqUylkZWpMSWQn4/94vwOqEl/+z1aWo/fuEcgVifsUxnz8bUfZPme?=
 =?us-ascii?Q?zl1HnxJyWr2v6obui0dZ5PKSc1NO7tKjUMWL5fCYT2d0N8zk0TqTyUVPKmEc?=
 =?us-ascii?Q?wQkQZjwMn+ed1b4dXnyMdvqU62fIi+bSkzokbHc/l6XNZH1RNNnrAk3TkJ55?=
 =?us-ascii?Q?/Pbu/A6eejDvymSQlb9Rr7IPHWEDJhx3HLqlkDfpza9AjnLyzd9lRDRXULW5?=
 =?us-ascii?Q?tLUKRPm58PJa/+d2p2wmfjvqrp0cF/4J8Vo5G6C0XIZbIlJnt8LXS3P3AXnx?=
 =?us-ascii?Q?mOraiYnzN75JdXTjkWFTiRgpmcjCKp8y22caDZfzr5XZk7LZS8IOi6jF7Sl9?=
 =?us-ascii?Q?2Hpq8LTXMcriJJaf+3hER/Bp1CruFbcxDnWvp53TKeFBCdESLKj16MD0ieMU?=
 =?us-ascii?Q?wanmHCsEAOCpFMRMnOdYRfm1Imo25p8u6iy+MQGM0ouYDbf+BBM6cy6eDhTm?=
 =?us-ascii?Q?pyS9doIhP1euAz9agIrcjLZOcZ6xIku956w70joMx+iwLMIz9a9qvQg3r4WC?=
 =?us-ascii?Q?RYFvemZM/H0r9na8u6HBeydpOuqQUgfMH6+gMA8dn+KNymGAayiNgNC2kBL+?=
 =?us-ascii?Q?ptpDOHCeLV1J6+p1MEdMmyt1bHwlERv25MOX2VPs98ir5x/f+1CPiwLNYhfG?=
 =?us-ascii?Q?Kv+QsmXQU/SCCwe3QT0Mjs0uSd61B1Z82qEWMr+zWs/BpIAjOTUqHFPnzxoj?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c0d174-e5a1-4f5f-cbac-08db5c7f47d8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:49:54.1942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYGfBdGdJ36XCMYK5dpk2l/zpkbjzi23wl1HZksMseqCOT0ClmXpnzfgQbCs0hPmgOGXZMiz2nj+8F0avkGO6X01Xooxsyc7qYwsMAPsyYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tddXKVflfOi9tTt5ma7A1A5CoahLODoYpTcJxLYVpuA=;
 b=ztLjnnSsW8NsTJd8F09sEh7PneQKsZuOorO10gyjKa6tkpPAuDDkNAvjx3wRFfGPtmNarjbrh7Lhv/fe/ho8024m5SUWgHeoHGUo/ON2jdA49N7udgZV/mr3UqWXwsjC2ou3WuFjVlyW5sPy7bfNcst7+Ck/J5eceIJaNd6a+JE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=ztLjnnSs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [v1 1/2] package/bootpc: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Tue, May 23, 2023 at 10:43:35PM +0200, Yann E. MORIN wrote:
> Colin, All,
> 
> On 2023-05-23 10:21 -0700, Colin Foster spake thusly:
> > Add the ability to select, build, and run bootpc - a client program for
> > BOOTP requests.
> 
> Thanks for this new package.
> 
> Here is a purely mechanical review:
> 
>     $ ./utils/docker-run make check-package
>     package/bootpc/0001-main-fix-build.patch:4: generate your patches with 'git format-patch -N'
>     package/bootpc/0001-main-fix-build.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
>     package/bootpc/0001-main-fix-build.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
>     package/bootpc/0002-Makefile-remove-strip-from-the-build.patch:4: generate your patches with 'git format-patch -N'
>     package/bootpc/0002-Makefile-remove-strip-from-the-build.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
>     package/bootpc/0002-Makefile-remove-strip-from-the-build.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
>     package/bootpc/Config.in:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/bootpc/Config.in:5: empty line at end of file

I didn't know about all these tools. I'll run them before v2, and thanks
for the feedback.

> 
> Also, see below for a few additional comments...
> 
> > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> > ---
> >  package/Config.in                             |  1 +
> >  package/bootpc/0001-main-fix-build.patch      | 37 +++++++++++++++++++
> >  ...Makefile-remove-strip-from-the-build.patch | 28 ++++++++++++++
> >  package/bootpc/Config.in                      |  5 +++
> >  package/bootpc/bootpc.mk                      | 19 ++++++++++
> >  5 files changed, 90 insertions(+)
> >  create mode 100644 package/bootpc/0001-main-fix-build.patch
> >  create mode 100644 package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
> >  create mode 100644 package/bootpc/Config.in
> >  create mode 100644 package/bootpc/bootpc.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index 420ebaa370..07de6500bf 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2273,6 +2273,7 @@ endif
> >  	source "package/bmon/Config.in"
> >  	source "package/bmx7/Config.in"
> >  	source "package/boinc/Config.in"
> > +    source "package/bootpc/Config.in"
> 
> Indentation with TAB, not spaces.
> 
> (not sure why this one did not get caught by check-package...)

Thanks. I'll fix this up as well. Boneheaded mistake on my part.

> 
> [--SNIP--]
> > diff --git a/package/bootpc/bootpc.mk b/package/bootpc/bootpc.mk
> > new file mode 100644
> > index 0000000000..d3c5ce5198
> > --- /dev/null
> > +++ b/package/bootpc/bootpc.mk
> > @@ -0,0 +1,19 @@
> > +################################################################################
> > +#
> > +# bootpc package
> > +#
> > +################################################################################
> > +
> > +BOOTPC_VERSION = 80c0811dc69f9f3923661be4f9f9c09a44313f62
> > +BOOTPC_SITE_METHOD = git
> > +BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git
> 
> Nit-picking, but we usually put _SITE and _SITE_METHOD in that order:
> 
>     BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git
>     BOOTPC_SITE_METHOD = git
> 
> You need to also provide the licening terms. It looks like:
> 
>     BOOTPC_LICENSE = GPL-2.0-or-later
>     BOOTPC_LICENSE_FILES = LICENSE NOTICE
> 
> Also, please provide a hash file with hashes for the source tarball [0]
> and for each license files; see:
>     https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

Ahh... I poked around readme, developers... I didn't even think to check
the manual. Apologies.

> 
> [0] source tarballs generated from a git checkout have been reproducible
> for quite some time now, so we can, and have to, check their hashes.
> 
> Also, the upstream README states:
> 
>     I'll repeat that.  set up /etc/host.conf or this bit won't work.
> 
> We do not provide such a file in Buildroot, so:
>  1. is the comment above still valide nowadays?
>  2. should the bootpc package install an /etc/host.conf file?

I fought bootpc for a while to get it to work. I don't think the comment
is valid, as I certainly don't have a host.conf file. It seemed like a
red herring. There might be some use cases that need it (comments
surrounding gethostbyaddr suggest that might be the case) but I don't
need it.

> 
> Regards,
> Yann E. MORIN.
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
