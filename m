Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678A2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 19:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB1C41CCD;
	Wed, 30 Mar 2022 19:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SH3uJWtnFUR; Wed, 30 Mar 2022 19:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572A841C95;
	Wed, 30 Mar 2022 19:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C72D1BF40D
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 19:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28BB2848FB
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 19:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jackodemononcascadec.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2bL6z7ho2X4 for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 19:18:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCAED848F6
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 19:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg94YyLtgfFmywLiBAoaIoU7L1nH9QhQKqbq8aSDJiqp6QqKfqqbMYx1zAjZ+VTy2YIgPyRRLBp+rWVMNPF0WMyPS2eKp+p3wSqKY/DGgF0x37bJqwrpgDaY8pEbaQ22wxBnLNOy92w/Q4pu0X+8MubRJAWa5RzjBvOsWSXXLFtfcf4V8N7ly+aFfBkILLdbgdpuL+doUGkJ6Vn4thIVbbFa3ciuY2BmAOu3g2Rw/W99kFhBPa4xxZDBDIY+guyFPq2j9R2/Z74HQr/sYk7GuWGRKJJGGUCrmZjmdth/1u0K+JbnwGBe1/yMYRG5afiOpcypK59xhAqmemUYhq6ZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvmLSjjy96HKZ6P1XGisTjVBF69I0NyUJAwVSfMVHCY=;
 b=G+iWYNmItYDEnbeljX3p0sxvuVX6jqHZzRYGAiyLzg6j3iPFv5EUHbQ8XGYhSVkFDUcS7FRgAMb5nE6izAQxB07stgybLL0X00c7z7utwqa2R+UFl86a6w8ORD9xAcEZw0SQ9n3TSNPAJiHswMkiQAcvfYEdx7z8p2S/OX+b/aG83/IiTPSIGcgRuwuctWEt1nfd7Ie8DOHQMDRgpLsHuBc4ibS1fgSTY7oOYXbuynmGSk/R3sY8lUoMIEw92vIklbOcPvMcFfyDOUNizHssXaMnq2/hTGdwqWmWI2+7uf+nigfWFaKxZjzkUUeog7G9ByUQUnqao3PiqnV1SZfx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thejacksons.uk; dmarc=pass action=none
 header.from=thejacksons.uk; dkim=pass header.d=thejacksons.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvmLSjjy96HKZ6P1XGisTjVBF69I0NyUJAwVSfMVHCY=;
 b=WbAcEGjTe2C5AxU7L7WyzqNa4RdIoVtpodkJzShaanFtKh8YEZcVqSE73/7n7CBlxYvl883g7eCzCe8nc3kcZnKUDP7Nb/PwlyjCCxe+EkRr+4VlxSAnt/o391t3SDKgC2fD2Lt0LaZY09oRDrthrjhdFhUDWB3Iwj1b8jAvmNM=
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com (2603:10a6:20b:32::21)
 by VI1PR02MB5166.eurprd02.prod.outlook.com (2603:10a6:803:be::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 19:18:10 +0000
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528]) by AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 19:18:10 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: Andreas Ziegler <br015@umbiko.net>
Thread-Topic: Adding USB support to existing device on 2.6.39.3 kernel -
 possible?
Thread-Index: AQHYQ1EGpCcDGFOvN0u2NbHmcspfi6zWS9xggAAspgCAAAxesIAAH+8AgAAVopCAAMpAAIAAx3eQ
Date: Wed, 30 Mar 2022 19:18:10 +0000
Message-ID: <AM6PR02MB48840C01AEE7E7DFEBF4FA84DA1F9@AM6PR02MB4884.eurprd02.prod.outlook.com>
References: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
 <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
 <AM6PR02MB48848F8B3F5238DF24891A59DA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <0b1ebd93c431e1c06678303eaffd8a79@umbiko.net>
 <AM6PR02MB488490D703CC6DAD1FF356CFDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <54f87d03a99935fb452424992a81409c@umbiko.net>
 <AM6PR02MB4884A6522909A9322C4C9E2EDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <35c2351b33bcb44d81333adfa848d221@umbiko.net>
In-Reply-To: <35c2351b33bcb44d81333adfa848d221@umbiko.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d94a179f-fd96-4818-0130-08da12820763
x-ms-traffictypediagnostic: VI1PR02MB5166:EE_
x-microsoft-antispam-prvs: <VI1PR02MB516668B0F93255E3B0A4BCDCDA1F9@VI1PR02MB5166.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0fU8MwSYEphVwvmTFnGBBDNeaHK4cqvkAh7fXhXhrv1OzWpWXnI1/T30aKXvRp2aocdaSiuW/uIG/fsM3l9hDY80SXMKpwo/TC9sQMukn/N1o49wgxQBaCW51W4mFUv2tEtrcEIzybnXcpqai6ZclpL3/zF87LUSCdBmjGJGSn7EOGDFRX4f3reWx0DoI3SIIw+sBFOXn+Tvvj7mi7MWtSEYRmy9mSWO0968p8UlEiGDHruhLhrEFSChZDxQti/lnBvGToyj9yCk+YbbDqeb7fdClEbmqArDIbpYCDxf5j7Ewea6VckFd0y+Zrsnzby+OPphpFBcoCdG8H/eQ4e00p6bYF+lzD1ZZGdXutrXg1VN4zD5qc3r03aP0NZ1b6BEEBGtm0xDOFUwSGJTBgSeo6uaR+00riL0d5UPnpMfquj+r8SgAYsEJe3ABXPiGdvQaWIhhwwIF1pXmdDkA49tXnHRFhi27waEAKOP9CXrxnp4PXbgKJzURt+tXW4jWAEqwxUoutalDfJ8jEY6I5uLmFNiJSTg6TXSmWNP21QMpvSXGDnMDM7O8fFBtvgKiopvoWvt5eqUEMOWqt3CWDTf0r1oQze9dHzl0fofMdFKyCIcVCMkAV9koc0j8qFL5CPXYWBRw/k0dQj7Xu/9DL06dq+CbLld/D2qDTlcnjjyscYaIVKxMrIh7uDjXHmicX5/Hx3zanlPrlMS8QIdmgkTajAfYsmqxVChn6w6b8ObzJSuE/T1/kBoGPGrrO9Gtqv0h5PlF8PuG+JbR2soPx/PvlXLI5do7gZ1DWhcrlNRj6p7u39ohDgheBVA+lDpRfWQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB4884.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(376002)(366004)(396003)(136003)(346002)(966005)(53546011)(9686003)(508600001)(83380400001)(76116006)(2906002)(7696005)(71200400001)(6506007)(66556008)(8676002)(6916009)(4326008)(33656002)(38100700002)(66946007)(52536014)(55016003)(186003)(26005)(122000001)(8936002)(64756008)(66446008)(316002)(38070700005)(86362001)(66476007)(5660300002)(10126625002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bRppikGrsSeNRHWQ+EXCXBc+5g9cCjmjCUqz/YMfcaH6EW+dwNCFo1FBU0cq?=
 =?us-ascii?Q?vGyfuIrhWxRLbH6kpYLKgkvXMKIrhkD4exKyDSNIPkAZWoWvnZeDER0aVGLN?=
 =?us-ascii?Q?O+vUyjBvwwPq4+M4nZ0h/aEqy5ktKAblSMB4PyoBf5qscD9neHIOjnkO9OQW?=
 =?us-ascii?Q?25JKszlrEur2sLjMNtvUEdDfgLPnFr/0pBNBr/C8aM6IyBr2CMtD4GubBt6v?=
 =?us-ascii?Q?NobsWsOe66MhPBpGuuVwsf4WXvf0tpXcBii5IuKyUSDm4rBEkZMX92SULj75?=
 =?us-ascii?Q?X3CzeZxzv9fR1TrU2+yOMPmiFlIJlDoZD29QMkFK9ctTwDij69a6Jfgof3rz?=
 =?us-ascii?Q?DjqXoNsl/m/U/rf3BoDYz5smOSY9HoV2cnYJmqFCgcRqAS9pgPIxc/WFET5k?=
 =?us-ascii?Q?NYvVO0/d+DLpaX8hMTA58X6XIFAEv6SUvY+Qzkdg1oxyyRuv2a2XkkxK9tBg?=
 =?us-ascii?Q?uNPZOcwBg35idlELzXijIMkd8eQYqZkiRq/pwqPbwjQH6B+5gornTCyCv6gv?=
 =?us-ascii?Q?iQxEt/NWdTIkHMjHeC/XIDcFB1P4G+rUDA2Lw2YAjmNxqhwPFJ8nl5uHHYTo?=
 =?us-ascii?Q?RBoW4NnBqXrcicinnPPst/wMDeqk7e5O8emZk5DYMnkCShauvMaBvY1RZIrn?=
 =?us-ascii?Q?TPOo6Bw/zB0NkQZlfQUWArLkw+Yat1vv0wxygysjBImkAdLRyFt8DUCe82YX?=
 =?us-ascii?Q?z5X7dApAw7gHIa9M5AYBPXe/dirH/ZsYDxdyeRs1EvHolF0vNsy0hFIgkmIl?=
 =?us-ascii?Q?tyRoqhpVCmm6Tmm1LkeLg10AISIxd8H6wHEI0VOtPwa2yZFCN/dBEufpVjP+?=
 =?us-ascii?Q?3NYesuDOpFukKnuGPZtHWhOgQzg2EKBZ6jt9GTGQq5zt0AOBYDq9YwzIDQ8H?=
 =?us-ascii?Q?txOcHIExmhEteTlHmx7tI/NsNoq7hY1iuxX9NLFDtkzkNPK13mQIeKHDaXhr?=
 =?us-ascii?Q?wg9nj6kuBAgHMZQSPU41i5Uz6pg8wTwQZzitILkkQY9NxskE8NpKX1Co2bOw?=
 =?us-ascii?Q?W9i/EUDdi/rJX5+JDfpEao2wgXampjPdF6bHWlH1z3JCeZxCtPduqiZH7TLS?=
 =?us-ascii?Q?lhIviYOj0bjDaPXWvBBVtGxB39i0D5fG6XrcZ2qg3YexzWjRMZhapRMjQiYM?=
 =?us-ascii?Q?Sc8RYHIJgEhapwv0PR0FYgUuH00hKzrSyqeGgSEpcpl6f+9yYwtVySkEIfqG?=
 =?us-ascii?Q?auDQuvxiJUkVKJAL2f+Z78be6Ct5Im4rh57+a+3raZLB5xatIfs3yVp2gHY0?=
 =?us-ascii?Q?ov2HbuSw/oolcBgiSkto4aUvFicUC07ukrudtJ/ExM6i59iQt94L7RDOEbNH?=
 =?us-ascii?Q?ScGCOKeAlWA82t2azTdcZEoh6FboZKwQwivhRhUD6PXCeALdnyL1ZievwZ0/?=
 =?us-ascii?Q?7geAcPzRwB5fxmAhf83adTyczej4iBVjmVtOOOaFa+YlBQuvoyFLtd88UhqF?=
 =?us-ascii?Q?o1kqjo2yshoxDPI17FY4N4bz8g4zt+UfTbALQNkxI2zQCKKj3GIA7mmMRW7I?=
 =?us-ascii?Q?KguM0eQ9KMgpoJFg2+LH94saPkKqTc7/6+hF9bJvPmV8R3qAd3JHGxuHQ4gh?=
 =?us-ascii?Q?9ZXzXddhpq9Pi7R4zpB8g3NvZzZjbKvriNfkw1QLiPir4CmB6ZyQyOAUznTQ?=
 =?us-ascii?Q?Ov/m04POo7sk8TZJip4is9bp+0G4V5fUd/ZhvrxgJ8zYTxPs06cZnfLdsdKi?=
 =?us-ascii?Q?+DZooFWEuGCE6Ji2zFbjd1T6pFQkUyUSSdDNWNcYbDGemxql0srJVj43w8WK?=
 =?us-ascii?Q?zuH05NSkMQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR02MB4884.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94a179f-fd96-4818-0130-08da12820763
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 19:18:10.3448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hY46YvUdm/REEMhMeePDnQPcTbODmxbQswWG9xM4kO71QwB7B6qNzksSqZW2ASuRwyIFUUkkFKayrbVYLZd0PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5166
Subject: Re: [Buildroot] Adding USB support to existing device on 2.6.39.3
 kernel - possible?
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Andreas Ziegler <br015@umbiko.net>
> Sent: 30 March 2022 08:14
> To: Dan Jackson <dan@thejacksons.uk>
> Cc: buildroot@buildroot.org
> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel -
> possible?
> 
> Hi Dan,
> 
> cutting some old content.
> 
> On 2022-03-29 19:19, Dan Jackson wrote:
> 
> <cut>
> 
> >> > However, now I have a new missing file error, and I can't seem to
> >> > locate a suitable candidate:
> >> >
> >> > In file included from
> >> > /home/danj/buildroot-2022.02/output/build/linux-
> >> custom/arch/arm/include/asm/system.h:165,
> >> >                  from
> >> > /home/danj/buildroot-2022.02/output/build/linux-
> >> custom/arch/arm/include/asm/bitops.h:27,
> >> >                  from include/linux/bitops.h:22,
> >> >                  from include/linux/kernel.h:17,
> >> >                  from include/linux/sched.h:55,
> >> >                  from arch/arm/kernel/asm-offsets.c:13:
> >> > /home/danj/buildroot-2022.02/output/build/linux-
> >> custom/arch/arm/include/asm/memory.h:19:10:
> >> > fatal error: mach/memory.h: No such file or directory
> >> >    19 | #include <mach/memory.h>
> >> >       |          ^~~~~~~~~~~~~~~
> >> > compilation terminated.
> >> > /home/danj/buildroot-2022.02/output/build/linux-custom/./Kbuild:81:
> >> > recipe for target 'arch/arm/kernel/asm-offsets.s' failed
> >> > make[3]: *** [arch/arm/kernel/asm-offsets.s] Error 1
> >> > Makefile:1009: recipe for target 'prepare0' failed
> >> > make[2]: *** [prepare0] Error 2
> >> > make[2]: *** Waiting for unfinished jobs....
> >> >   HOSTCC  scripts/mod/modpost.o
> >> >   HOSTCC  scripts/mod/sumversion.o
> >> >   HOSTLD  scripts/mod/modpost
> >> > make[2]: *** wait: No child processes. Stop.
> >> > package/pkg-generic.mk:289: recipe for target
> >> > '/home/danj/buildroot-2022.02/output/build/linux-
> custom/.stamp_built'
> >> > failed
> >> > make[1]: ***
> >> > [/home/danj/buildroot-2022.02/output/build/linux-custom/.stamp_buil
> >> > t]
> >> > Error 2
> >> > Makefile:84: recipe for target '_all' failed
> >> > make: *** [_all] Error 2
> >>
> >> This seems not to be the defconfig from above? It now uses
> >> linux-custom ...
> >> The failure may be due to the default kernel configuration. Try to
> >> configure the correct one and see if you get further.
> >>
> >> > I think maybe I am still doing something wrong because it sure
> >> > seems to be compiling a lot of stuff instead of letting me configure
> things.
> >>
> >> It gets better once everything necessary is built.
> >
> > Still no luck I'm afraid. Same error with mach/memory.h as above.
> >
> > Buildroot defconfig now looks like this:
> >
> > BR2_armeb=y
> > BR2_STATIC_LIBS=y
> > BR2_KERNEL_HEADERS_VERSION=y
> > BR2_DEFAULT_KERNEL_VERSION="2.6.39.3"
> > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y
> > BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> > BR2_PTHREAD_DEBUG=y
> > BR2_BINUTILS_VERSION_2_37_X=y
> > BR2_GCC_VERSION_9_X=y
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_PACKAGE_HOST_GDB=y
> > BR2_GDB_VERSION_9_2=y
> > BR2_LINUX_KERNEL=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.3"
> > BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/danj/DG3270_9.1.103
> FB/sourcecode/ti_linux/linux-2.6.39.3/src/.config"
> > BR2_PACKAGE_DROPBEAR=y
> >
> BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE="/home/danj/localoptions
> .h"
> > BR2_PACKAGE_JOE=y
> >
> > I forgot to mention this before but the buildroot manual page you
> > mentioned said to create a local.mk file in order to use external
> > source, this looks like this:
> >
> > LINUX_OVERRIDE_SRCDIR =
> > /home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/linux-2.6.39.3/src/
> >
> > For the kernel configuration I entered the kernel source dir and did
> > "make menuconfig", I left everything at the defaults except for
> > enabling the USB related items.
> >
> > The resulting configuration file is attached as a text file.
> > Unfortunately it's been literally decades since I last actually
> > compiled a kernel, so I'm afraid I have no idea what bits would be
> > suitable to disable/remove to get the results I want (I'm guessing
> > this will be the most likely way to eliminate the error I'm getting?)
> 
> I did a compile test this morning, the Buildroot version was some early
> 2022.02 version, not up-to-date.
> 
> You have a potential header mismatch, Select Toolchain -> Kernel Headers
> -> Same as kernel being built to use the vendor source also for the
> headers.
> 
> I could configure Linux with make menuconfig, did not encounter the
> missing memory.h error above, but the build stops during Linux kernel
> compilation with this error:
> 
> /tmp/ccSO8f6S.s: Assembler messages:
> /tmp/ccSO8f6S.s:950: Error: .err encountered
> make[3]: *** [scripts/Makefile.build:284:
> arch/arm/kernel/sys_oabi-compat.o] Error 1
> make[2]: *** [Makefile:969: arch/arm/kernel] Error 2
> make[1]: *** [package/pkg-generic.mk:292:
> /home/data/test/buildroot/output/build/linux-custom/.stamp_built] Error
> 2
> make: *** [Makefile:84: _all] Error 2
> 
> Full error log is here: https://pastebin.com/VrXqSVsD

Looking at the error log, it seems like vfp has been selected? But my target device only has Features: swp half thumb fastmult edsp java.

Also, OABI does not seem like it is the correct ABI. For example, if I run "file" against the busybox binary the device comes with, I get:

busybox: ELF 32-bit MSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped

> 
> You might now do some research:
> 
> https://stackoverflow.com/questions/61235299/gcc-8-3-arm-assembly-
> error-when-building-linux-kernel-3-14-17-in-buildroot-2020
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85745
> 
> or try to switch to an older compiler ...
> 
> --
> Andreas
> 
> <cut>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
