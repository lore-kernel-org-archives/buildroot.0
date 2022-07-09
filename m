Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9138C43334
	for <buildroot@archiver.kernel.org>; Sat,  9 Jul 2022 19:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A13642174;
	Sat,  9 Jul 2022 19:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A13642174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQiGnSOdBmr8; Sat,  9 Jul 2022 19:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDFE74216C;
	Sat,  9 Jul 2022 19:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDFE74216C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2201BF2CF
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 19:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66F30845BF
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 19:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66F30845BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wfjasKpfg7o for <buildroot@lists.busybox.net>;
 Sat,  9 Jul 2022 19:15:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4398458F
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2101.outbound.protection.outlook.com [40.107.244.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F4398458F
 for <buildroot@busybox.net>; Sat,  9 Jul 2022 19:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny1Vyi/lIt14ZPMhlbsVLFVnxFexDjMD+90MgnmKKg8vkh6ywzSzFMprJrM+FsqfKGlF7cPvYmw1pbQA47pPcqyO8gKo/xAo89OZIEFcqiOWGAq5YvSLKb9t3Mxo4cXLEVp63Tyu12ak8uvbmaxG8f6tVuxLUVbxtuYpPQ9ds7T+QJ62O7BFaYawpWEP+ge3s9tyTp/VVdxreJfwwO5EdWS+U6OTcWK0gxSUJk0tmIAz+GZEchijR+X4h8kLwPR72yiOy2KdfZ6gHw1qJSVJ8fDulIqDlv9CaT+qLkNXe4B6drHFdPngP0wRfAXgihPYN5Gr8tudsaSyB3dwMAxfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xdzk1bhKJveDzrSkkSzle7APR7Txg1vhgqfdFsg4LaU=;
 b=KtgjidjPAkUwkmJeu2tSogO7yU50UYER6TIW+f9bOn0MurThwNNysdRUxbpKTmJagIi8GQglfCwFw8YvhQVH7DH8epafYPcFMPHa682p+TyFNYyKPaEIibmYRDIkGW3IBIV2xKPugdYd153o9xq3dlqWVWtMlbYbsGS+PAsLCruoDV0ABqaI9V3B4q3Ya/WZWLu+Sd6ILC0IAAe/QM/EtOBG/Jdd5AFCMcuu1FsH6OxfYNinORzkzBzKe+A/ngs/OobpuZ7e7zdIE2PcNyx0o+zLGsnjfZvTZZJKr0YbqhumFJwh6Iz16xOJDniqlw68k6/f9L3nidHF+0bxPauGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MN2PR10MB3918.namprd10.prod.outlook.com
 (2603:10b6:208:1bd::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Sat, 9 Jul
 2022 19:14:57 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::712f:6916:3431:e74e]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::712f:6916:3431:e74e%6]) with mapi id 15.20.5395.020; Sat, 9 Jul 2022
 19:14:57 +0000
Date: Sat, 9 Jul 2022 12:14:54 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <YsnTriEeceiippZr@euler>
References: <20220709155557.2907518-1-francois.perrad@gadz.org>
Content-Disposition: inline
In-Reply-To: <20220709155557.2907518-1-francois.perrad@gadz.org>
X-ClientProxiedBy: MWHPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:300:117::25) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12b93aa0-db5d-4e3a-b8f5-08da61df5023
X-MS-TrafficTypeDiagnostic: MN2PR10MB3918:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EotptAxKvYyV439tnQrhUqsTzj2FsA09ZfSMlkqd6V3I/pN8R3pd05v8Tg0Vx8bNEh5X3pQAzu6pulGU/KD7uDxgR6fXDzfIBwUI44FzvYnTOiond2UHOhPhZ+Ge6K1xVORVEoCkOKTyXuTKTHHZS+b52H/z9uRZ6+ZKn73XrmmsmmFy9khyOmF4VOwkzm9VJKbTbM/XKJ5sxJGPjFpcwUwTqjRlOqJdJEmoEnpDfcpaqungD8/SnTN6SS0nYiXjvcubdu0LO2yrhjWiEH+kvv7fhs06L/OpY9dnbq1lH7jp79zacnNgFWVqnptkz1GcSl3BL8fCJ508SVVwN6zhcufISG3T19Y1uAryoBhfraBiBS1Nd3UvORNcSmWUlEoCF9eZ1vpIHsNXH1r0nwduDvn5L/I+E7ieaxXQCBd8VGYerR8p1RCiZIaD1P0Yu03Xt6rLUSNXAMF1Iw35AfORLgS+ZLKWmxEKuBlMlwTq5KlEJoaK47rbhaC4MUeUN54tYyXKDhiCB41JTcA3q3x6TkqTFT/VSRaKPsg54yE/nwKwF0JELWiCor5IvlVvMydBwN7SGqdnDPQqUZhFxOMPDZCOLVdNQr5KiMb3DpH4PHI0mKNFOZaCcPnOKZQOq5nYbyjgV9Tbu5csuKzxFIitUjbwBB3ULrwjF46fbi4Xp47Jif0iUR5h2mfOYIlD7JnSjkAjJjOZKOPZW2OZ+9GqOlqq78HS4dtigrvrMXpDdEY6O3WZnYFczMrEuJIpAS/qxeiEAeYdgiVyV7jr2f4I/8xtPUfVgIMqUhobb/bkQiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(396003)(39830400003)(366004)(376002)(136003)(8936002)(2906002)(6486002)(86362001)(478600001)(966005)(6916009)(186003)(8676002)(66556008)(6666004)(83380400001)(41300700001)(4326008)(33716001)(316002)(66946007)(66476007)(6506007)(5660300002)(44832011)(26005)(6512007)(38100700002)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ESd95rMH3D3L0spJICze4MJysm6kBJFbNJUgkhXbVXThuL7GQzEyKWc2d26?=
 =?us-ascii?Q?fmf8rmvgWmNsJooYdremEiV5NCjGND1Ew9M3x0TIaoKcLxpM34WmI3XaiBM7?=
 =?us-ascii?Q?rpZTQ1Naox4iL22s+LH0EgvHQwOgP0EceaxNmdENpjlODQoAV7rAz186rvjn?=
 =?us-ascii?Q?31a6GHdtbUtK7gIHErhnMyIU6eDkpnt4OfOuWo0UUN6mBv/See4Mz5/q1Wku?=
 =?us-ascii?Q?1H+2SbY1rtUBxUKx6dB+e8dI9T54MYvusgNkerUShUOlCcylIhkPNtymij/o?=
 =?us-ascii?Q?eHXsmdVe+lzU1pszqYHnm4j9pRoJXC9wEOV/hPAK0fScqc4imkZcP50lBBSe?=
 =?us-ascii?Q?QUpvA3A2SYoqv9kCBrrVgw3Bb3KdwDnLgFbCQl8pT2Teh7qL2AsG6VcIwTf8?=
 =?us-ascii?Q?0vpTjqp+5euAyazTEUbxfmuNjCDaTR/R8hcnayB+E1az7jsTP4d0kRCyx9zs?=
 =?us-ascii?Q?tptUuQxxZfQHDw7Xg0G//fsDuTWiuOHNUVTpbV8tcFNBkcMDa+WuHZ3YDcEj?=
 =?us-ascii?Q?a5FeW7WQsbYb+OlOIvq+S+tiMzbIgHIK/6/6XgoyFVLVdBRWw6X4gFS7B2E2?=
 =?us-ascii?Q?mJEx3DWs5itsXT5bQkq7G02MHmjw0TpSMIZigYCNO/9XxPOPlcVzaSnoCrrs?=
 =?us-ascii?Q?dMQWuF3EZCiC8a7xDPIU8C02wJ2TKH6um2rWgR/WCO0rDB7rZIvEVGILCtpT?=
 =?us-ascii?Q?I9rpnFtwm3t5G4gdhtkQtt1OepG0oqK/vt3AcJryASAvcDXHYGIUPdwhb3sR?=
 =?us-ascii?Q?uBB/dPC0QXtPnLvVpqQxrtlEHQmrOK60nm6RwWZZSaNKy295+vIehFWI8hjS?=
 =?us-ascii?Q?9W41Zy40VrtbxJL6wPZdxx6nAtdWjEPpA57zWjh09ZnsbIIOfWLLlOp8kGQe?=
 =?us-ascii?Q?C5Q6TCWlxWstI+Fh6edQuZkidiePcu3Iak9qCLb844ig7WQKgos1F5T3eL0J?=
 =?us-ascii?Q?elZ+S8p8Q7eGJVPFCtickwZE6T11wX2P6eyVckEKUrVFaBfpr43laEHBZSRA?=
 =?us-ascii?Q?f3sNrspRK6ga5c8ymv0UZX5FZlOQER7BNAFZapH4ekc2DGiKO0bfUTcpPB+K?=
 =?us-ascii?Q?jAle5N9NmGKeXEbSz/iVyJlHn5BmJSf+fUG30dx3TwJrwTG0d6/fFF5gMZny?=
 =?us-ascii?Q?fH8YKZmzCauoZzPfFXYF/LXSrc4lPdyenBYXmanezf18ahsKOgT58mZofmDX?=
 =?us-ascii?Q?9XajDOLoA+iTqHV1ydn4HdsPEAVa2KFyTbzjPQsjJMzy0kQXOP7nB3IZQAoQ?=
 =?us-ascii?Q?lCcBdsvUsqOkbtN7FWF8FpElx5ONJLI6OYr/fVR30QRQvp1Lc8XBA90ZUgAI?=
 =?us-ascii?Q?oKoXbsIfRXAZyf54lWDlBq60bc7roQpJz6vCaa22DroiRmLEMsuJIwGJENuc?=
 =?us-ascii?Q?AmCQaIPMvkeUD+vvrrCWg9g/5adYEklWt90DLUuBgVLMuC3M+kXBajdIVfm3?=
 =?us-ascii?Q?d7znSPQcvIKlKgRIZamZJhTJq2s+ueMdcOWCz+hJGdpikep96jF6FUc5vI67?=
 =?us-ascii?Q?GA9eAU29dcZOKW/hMET3I4OCtAEdBSip2J0LfD1OirPg2h39yiKWnrf189Lr?=
 =?us-ascii?Q?FzlTRmwvSutxFO0rKgvjbnMdT0KNuNUFWhmB+SfYnFg60DNuRkeSWpYDyxi4?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b93aa0-db5d-4e3a-b8f5-08da61df5023
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2022 19:14:57.8028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ04LXWEoHiOsss4XlqvACnnqn1U6haMmSTAadJrwEWnNjxQ5J6LFv0svPrHaEdNrhWZcpBdmSbEdfc13jKhs5hTVQKfjPCLwvlhrKY+c6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3918
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xdzk1bhKJveDzrSkkSzle7APR7Txg1vhgqfdFsg4LaU=;
 b=BAZkLseR0EThAad/FrQvkjOSxxfJZT+of2w0cllOpCS9VK77yLDe3kiJawf1K4j/aD5lNIvMk9d66y/XxhOqNNo8MlyrV9eMB0NUcuvp6WgorOOojcGX4Qi8o5JJge7NauRe7WUNb7/eB3H+wXwayJljGEGNksHzD9T76CN0cd8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=BAZkLseR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH] package/mstpd: fix install path
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jul 09, 2022 at 05:55:57PM +0200, Francois Perrad wrote:
> note: the current configuration works only if BR2_ROOTFS_MERGED_USR is enabled
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

If you use these:

Tested-by: Colin Foster <colin.foster@in-advantage.com>

I'll fix up MSTPD as well, since it is currently incompatible with
busybox `pidof` and we'll be off to the races!

> ---
>  package/mstpd/mstpd.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
> index 907d09424..22c91a639 100644
> --- a/package/mstpd/mstpd.mk
> +++ b/package/mstpd/mstpd.mk
> @@ -10,4 +10,7 @@ MSTPD_AUTORECONF = YES
>  MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
>  MSTPD_LICENSE_FILES = LICENSE hmac_md5.c
>  
> +# mstpd requires that it is installed into /sbin, not /usr/sbin
> +MSTPD_CONF_OPTS = --sbindir=/sbin
> +
>  $(eval $(autotools-package))
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
