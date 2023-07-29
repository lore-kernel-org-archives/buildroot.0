Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B55C00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 20:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB34D400C8;
	Sat, 29 Jul 2023 20:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB34D400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfMiqstenr3Q; Sat, 29 Jul 2023 20:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 563C04076E;
	Sat, 29 Jul 2023 20:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 563C04076E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6204C1BF576
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B0F3812C0
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0F3812C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJNzQ0Hc3ODi for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 20:43:31 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::715])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3C6980B74
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 20:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3C6980B74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrXXKZ7lVtmE3+DmYOu3cQpN7YZAJ9eE0MkfrlWnUZLmbnkqpIbMx8M+RPJ71V9+9K1fGdto/fluVkICIcoJTgpMBdEyNyyD3LUxgH5Qy1a266DNiQ9pObpT2Ws5uobzBuWjRc8Oo3T15DMs0o4lqT07+eVywxbFjb3uIxGZ5N47a1vEuY3W9QbAh/lVAlp0iTTNs7UvyAcTca/m7aoGkca2jiHMy8DdwHTPS0wdm3dPxBbjHMd1uuOXKQMTBJrxNyez3FExIvmyGX4tvj2pzRT7MfzTO/VT8IRWKTKZVJC/LCdMnsSZwjPsLIQiLsrKZY8LYIO8aZjaevIiv6KCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah1RAWrES3hAINZIXLM1RQF0v4bs606+wfD9os4xGKk=;
 b=Ww77BHjyNh8Fqs958E3RCkwoi8k29QHvsEMrgrQDccaI9YC7JA8K/M+bnurpvDANHvTKoJ4ppHjVqpHSvPkPl2pOr2fZ3t9dmer7qpGtptFJm34PGCGdrQVLz2hicwLvu60eEGOGZeP2l/vadIewv/3wlC13/WsmGvrqAg0CO0LOqaQVC5KcEYog6UPBhPPWxLW8fL/5fxMDUGsyJI9P+TGLqgKO0aJPvWavSnt3j0Ehtq1+xTNq6rmh9HDu9rLOv4foCDkR7A+k1pFWiaAy/AOE0SSNiPJUVyBzB/CGYVGtlvI+Nuu0GAJiNCG2x7ZA8tx+lHNEZcA0PetSJYSYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by DS0PR10MB6222.namprd10.prod.outlook.com
 (2603:10b6:8:c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Sat, 29 Jul
 2023 20:43:26 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::5ff7:e83d:39df:dacb]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::5ff7:e83d:39df:dacb%3]) with mapi id 15.20.6631.026; Sat, 29 Jul 2023
 20:43:26 +0000
Date: Sat, 29 Jul 2023 13:43:22 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZMV56j37ps7vOaLB@euler>
References: <20230728231839.4193379-1-colin.foster@in-advantage.com>
 <20230729094952.11722d87@windsurf>
Content-Disposition: inline
In-Reply-To: <20230729094952.11722d87@windsurf>
X-ClientProxiedBy: BYAPR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:a03:60::14) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|DS0PR10MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cd6472-5d45-4865-3440-08db9074753e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: suXjNBf/8q94fWw7HR2Gw+/jo23JeFjhjlP1ijTMcSdPjYYhj0a/LlwXPfYxWI3Jj8y74svQWH0EnoxDCvrzLI8Ado+Jk1T/nGta9ifxS3Pdm6wJA8sy2E2GIxf2ok7V/5014qVUVZgK5zRt4V8Re7BiizJfSQotZNB+jYHgq47X1gpAn+XGZrwHDYn5brYau7t+sE6EGlZTWSt/cazD+P6E+AC+VBkBCptM1cv+yIZ9qdsQf7NHAAYZ50/SIN0XriijLg85i4L8I5929Y2B1A6mZ4ZefG/iY3GVlOzefkmTXdwjXZQoYdVTWqf7CMMJ36eLfN3HbQLv73RApWxAz4HfYkhqLTTV9STT/udU3jGhknp/xsLL9iD/7rc9QaD+clpTMcxxmbtFmCrbg6dH6a5pClj268CW2eoC5DJFPqS82fkTLzbleMiUjr2ZVeeTFO7LnOmH3LdLk6QE0rBzVeTTGo/gu8it8KZkwSzt7lz8RyUsSZmzzekltFRG4yBoIEJ/rsHiQHSsq6NFxrheOKDF6AyzQMu5ygwnNNravW3p9/tSsdxx0HTeLsK1/28l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(366004)(396003)(39830400003)(136003)(451199021)(33716001)(38100700002)(86362001)(6512007)(9686003)(6666004)(478600001)(6486002)(186003)(26005)(6506007)(8936002)(8676002)(44832011)(5660300002)(66946007)(66556008)(66476007)(2906002)(41300700001)(6916009)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1z901yuTOuV4Nzsm4iYZ2RpvtdeeJJxM/MCo6smrFZ8hAWAhuuF4K0jAWuXX?=
 =?us-ascii?Q?7EQoXj7yYEc5lMUAUGbrU2KQIeBhKgqpI+svxnWERWOfjcmtb8k4w08KNzpK?=
 =?us-ascii?Q?n32o7DicxmITz64N5D6ec3WpWjqmujh5NwYnhv43WOPuZTxDyuN/CVv4zKJj?=
 =?us-ascii?Q?C5o/gW9m9tD2F2dlCapdj9eHjx1xHCSp371KwqJhh2YfFZBvAOAwSTyVQzon?=
 =?us-ascii?Q?zKDREil+i9JohSiu3vtDE85WMvySywyRv+S+qMbn+N05gcGrXeayYmEVv9BC?=
 =?us-ascii?Q?Aea/jdLFOK/pMaHaO+bhlk1993vtQIvEPnzYvVi5EiOeVS6ayFT8iWpOGjGG?=
 =?us-ascii?Q?T90g7ffQvoSYvkc83NlrkYCOZLm1e8xVd4whqULXFi+x5M5y0AOj8FFVX4DB?=
 =?us-ascii?Q?s4QnXpcCbVmVOYq7o9PkZN2omPjolDTM7KecBH8KdNkOPPUCbcm8hfaFBBmu?=
 =?us-ascii?Q?W30P9gXA2R0szUQ4a1H5ucgKur9olDxef/YJr2evEwfp5dWc9WDauCvFC/+t?=
 =?us-ascii?Q?fX71qhD4WSJROpgdg4ebRYLuzo/Aj6YAw+iozPF+8zTQyrEwvaxEhLSyQ4uw?=
 =?us-ascii?Q?f7Uj3o9jIZ+1YcmF9QlxTNLtmT/2UvkeMDvuWdIY1x040Vxn5lP9iXGxAUQ4?=
 =?us-ascii?Q?KJehb+ZffeU1E3NKQF2NLaeL4WqpS8oHl4WwnjZTa6bkkpbqzc1PRh2lXzKc?=
 =?us-ascii?Q?3Jm7WyKVt4ZlxYp+WVg4W3Z1Fx3DH5hDC1MjAk0rPNvV6Pwl8xXkdDdD0MwH?=
 =?us-ascii?Q?EV3W8nMnpGVZxciaY+W9Ia/VjifXbVJJq7sw1I5Mzlbg6LS4UHeM1A+DFSik?=
 =?us-ascii?Q?EEp9Xzc//j4HWFs/YADrp+bt8jQTvyf1EdNHW8Bv98cwKtoeso1D2cK7I9O1?=
 =?us-ascii?Q?VBzY8jc6hTSKkxnDiy/uRQwteUqh+tGqa6X34xMLlfBlPB8ZhjfLM1dwG1Xs?=
 =?us-ascii?Q?yq8rmSOs6waQWx2tJcZWNYgllIgWLy7wS2CgGaK23slaG9RvQ1ySp15Wu80X?=
 =?us-ascii?Q?uzRvzXJKcR4awsieNgB8q549Yww2JmJPaI1ac4eb5W7qHRjT2t7WSzKNmBCC?=
 =?us-ascii?Q?+vE0ky7ww3CKJsN3bbOfmk17yG9IKTQnls40nx3uaJB2E8jW/se6hFF4EyIw?=
 =?us-ascii?Q?gusB+O5UYA6qv88RbEXVWRVc3TxH3uhsi9nNzx3jtLewFhstvASxaG1ch17j?=
 =?us-ascii?Q?fP9QzZphO8LXKuJBNlXwX4aWnEUIVJdwCU+YXYRioR6Unajr958gqKbrZ48v?=
 =?us-ascii?Q?KyiLzhaeOiV7AmPrTR6GVXuNGowsvWFeEcXLNMBUUWLxXU/SpOrMXUB7bUnG?=
 =?us-ascii?Q?TrsbAqCmxBXOolXhlD6w/baEs2LcJrZBwmu6HtC1/cOfVytwFK+O+nHlFmeq?=
 =?us-ascii?Q?v0SdTo3ZUZFtbtJl053gYjhQqYRwiGXtR1+j0h6yWaeicnlu+G6dzq7t42JG?=
 =?us-ascii?Q?iQvlngGN6H4GrIY+Tc+MiKvVQB7VSQWrGPD8bmNfRgdCOqzPYVSZO+G6d+b1?=
 =?us-ascii?Q?36C2vD2vPFOZpZP3KgS39FneO1XwGcMpAm7y9fCMVn1JiQ8fQyI3gyYarhfv?=
 =?us-ascii?Q?Cx5Y9oP8TXOYJy53ykguVgdGhq4DnXg7XkYYYOJdTT0jNbrhCSG5lj0uBbpP?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cd6472-5d45-4865-3440-08db9074753e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2023 20:43:26.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAKMV2x1mzVNrD02+yF3XkLNIkyo/Vwq6wibO4ORzT56ZV6DM7iVaMbLtGLBwICF6OpRVuvadM0N59qOaXeJlSCWxCMj+SAHykb3gX1L+Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6222
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah1RAWrES3hAINZIXLM1RQF0v4bs606+wfD9os4xGKk=;
 b=ejEf4rQOuy9Vg0KYQ77DXoMs7cKvybuyVGgIVOKdXlIVl5uaiP/LDXCHK86tKpzR/ULGHTzx5K+iokOJliepxhVtz8QtEzB1B3clYRBZzF/eZir7p27sQzM/RHXSizDzmtNzsFlLnlRo4rrTjchzlAtQP8XlWEkFl6HTOyU1wa8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=ejEf4rQO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH V1] core: add kconfig option to archive an
 un-stripped filesystem
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

Hi Thomas,

On Sat, Jul 29, 2023 at 09:49:52AM +0200, Thomas Petazzoni wrote:
> Hello Colin,
> 
> On Fri, 28 Jul 2023 16:18:39 -0700
> Colin Foster <colin.foster@in-advantage.com> wrote:
> 
> > It is reasonable to expect that deployed systems don't contain debugging
> > symbols. At the very least, it will bloat image size unnecessarily.
> > 
> > There might also be scenarios where a previously released image might
> > generate core dumps, or require attaching a debugger to a process
> > well after the filesystem image has been made.
> > 
> > These two goals contradict each other, and is addressed here.
> > 
> > Just before stripping target binaries, allow the option to tar the
> > target filesystem for archiving. This will create a single image -
> > rootfs_syms.tgz - with un-stripped target binaries, and allow post-build
> > debugging and core dump analysis. The final image will be unaffected.
> > 
> > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> 
> I understand the reasoning, and what you proposed is indeed a simple
> solution that can work today.
> 
> However, I think the "grand plan" to solve this issue was to install
> everything to $(STAGING_DIR), not only packages installing libraries.
> In $(STAGING_DIR), packages are installed unstripped, and with
> debugging symbols if BR2_ENABLE_DEBUG=y. One issue with this solution
> is that it requires a lot of effort to implement, so nobody ever
> tackled that.

Thanks for the quick response / review!

When I started thinking about "how could this be done" I was thinking it
would be quite difficult. That would likely be the $(STAGING_DIR)
implementation. But I stumbled upon this not-quite-perfect solution and
figured it was worth getting feedback.

> 
> Perhaps one concern with your proposal is that the tar you're
> generating is not exactly the same as the generated filesystem with
> binaries unstripped. Indeed, after the point where you generate this
> tarball, a number of other things will happen in the rootfs, most
> notably all what happens within fakeroot (permission/ownership tweaks,
> etc.). I understand these generally don't cause any issue for the
> specific use-case of having binaries with debugging symbols, but it
> shows that this option does not really provide a "rootfs with debugging
> symbols", but rather a "almost complete but not quite entirely rootfs
> with debugging symbols".

I fully agree. It could be misleading, and maybe any subtleties should
be clearly defined in the Kconfig help. I've also found the
"THIS_IS_NOT_YOUR_ROOT_FILESYSTEM" file to be very helpful :-)

> Let's see what others think. The advantage of your proposal is that it
> is actionable now. For now, what we tell people is that libraries with
> debugging symbols are in $(STAGING_DIR), and for packages that don't
> install to staging, the debugging symbols are in the build dir of the
> package: output/build/foo-1.0.0/foo.

That sounds good, and I look forward to any feedback / suggestions.

Something to consider is the file / directory sizes. From a quick
Beaglebone build, the output/build directory is 9GB, while the
rootfs_syms.tgz is 33MB (and it is 90MB uncompressed). I suppose I could
compress and drag around the build directory (which compressed down to
~2GB) for completeness. But realistically there's a lot of baggage there
that won't be needed.


Colin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
