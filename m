Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF7AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 561A640BB8;
	Thu, 31 Mar 2022 06:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJsko67ywC7c; Thu, 31 Mar 2022 06:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C019405A4;
	Thu, 31 Mar 2022 06:19:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B05DC1BF321
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E71483386
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jackodemononcascadec.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqLcc01poXAk for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:19:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::606])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03DAE83380
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:19:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0oQWYAWErfsWuNfInu99rkgEjf7CldlRkQ+pF4+fxemx8AsrRwQ96i8p2PyL/cIq4/QuZ9ZR9u0Qa9LnsJpnym/KZZCXqQUoogW1o0wPV0l0uyXCNlpG3tyzqoNh51WOQqMwFoPaZCA4b4A1yMFmU01cFDD/s3TUCfUFp+3l0MS8pyylGN3UVWmboAhpkXL+DX+maeqXijQRFZ6VUOgRM3qcHDMfl2zN7hr0F4vWrK4x2ygYkQ324eshJYCw3uBSVy9bDVnmokdbJ9bYzOQItsD4SrfJ2tgxiTpz6k18SXQIWi8ys72weLQmRJrLSyAl6pA0oPoBGNY5srY+4hXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V6B4pGio8RKvLZdtLL+zR/MphWCX4MyKXaLzTrqmqk=;
 b=S2Mrz6C29hBMJ66puYD0Az/lqhlopmd/e9TqrUFNv0lM4RxAAoaCz/s28GwRdrbFJFDy7zRq7jFrZHiYXfEEPvAdnu2NhoPB2TQuRMNifAK9rNu93VylJ9V/vfIuinsXRbwu35GlNbIi1iGer7kry5ubDda+kCq6tHlDNpUHXF46kudcUgMm52DwYBlMi6KXQlJHuY/WtYZkZADFG9LYB8l1reWSeWG88nzw3j8cwVhE2zYGwEdBKZVA+9+AaEHUA9qmj9KFgOKwbNI0RI4VdzSAxm4x5x8qJZpZrQgbrPBcaTIGLur19FmR4+UoMymTFBpzbTBx2MoUTlfWu0kJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thejacksons.uk; dmarc=pass action=none
 header.from=thejacksons.uk; dkim=pass header.d=thejacksons.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8V6B4pGio8RKvLZdtLL+zR/MphWCX4MyKXaLzTrqmqk=;
 b=QPgHqWP7DxoNhMFbkWppnEvaaYaMLmYcSWO1x8x9+aJQvE/Ib17maDBKflQljhvuqCWZbdXWJow0G9JcELVQImDI5tM4HINkl0O+aVmLSONelbrbfBhysefpLS+DAn/kX93nHCGrOXgZ+LW5lHEkw3pgXYiP1UeAyZugZUW0714=
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com (2603:10a6:20b:32::21)
 by PR3PR02MB5995.eurprd02.prod.outlook.com (2603:10a6:102:67::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 06:19:37 +0000
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528]) by AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528%7]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 06:19:37 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: Andreas Ziegler <br015@umbiko.net>
Thread-Topic: Adding USB support to existing device on 2.6.39.3 kernel -
 possible?
Thread-Index: AQHYQ1EGpCcDGFOvN0u2NbHmcspfi6zWS9xggAAspgCAAAxesIAAH+8AgAAVopCAAMpAAIAAx3eQgAC1woCAAAMzEA==
Date: Thu, 31 Mar 2022 06:19:37 +0000
Message-ID: <AM6PR02MB4884198D3063202A4B1EA90EDAE19@AM6PR02MB4884.eurprd02.prod.outlook.com>
References: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
 <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
 <AM6PR02MB48848F8B3F5238DF24891A59DA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <0b1ebd93c431e1c06678303eaffd8a79@umbiko.net>
 <AM6PR02MB488490D703CC6DAD1FF356CFDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <54f87d03a99935fb452424992a81409c@umbiko.net>
 <AM6PR02MB4884A6522909A9322C4C9E2EDA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <35c2351b33bcb44d81333adfa848d221@umbiko.net>
 <AM6PR02MB48840C01AEE7E7DFEBF4FA84DA1F9@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <7a56c449ef38559922b9858eee8d1799@umbiko.net>
In-Reply-To: <7a56c449ef38559922b9858eee8d1799@umbiko.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d549479-95f2-45a6-29d0-08da12de6ec8
x-ms-traffictypediagnostic: PR3PR02MB5995:EE_
x-microsoft-antispam-prvs: <PR3PR02MB5995802F7472FB7F3055409BDAE19@PR3PR02MB5995.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B3DjmSCggoia3i2En2yVii+qzhdrK9Pk6/VLg2gqakHqHx5FUoxhxJ91rILrEAM58zkmX1yX3o6URsaDGz0f1kJRE/sgf9Ho45VfrFlqTQAEtKnktOQZiTYLXVL1Y9TzcjD+EfHLsNrlxR5fo27+0NPFXnRGcYPbnipRcr2Gqv3ycD2DLYwbSLwFKL2mhmqndshth0YadmwwD72N1RLT4lY6L5E2+sOoKzXiG4mEiAe9nQpPlthBFKZbwyK1MS2q4OEIlycQtIZo/Ddnc8w0AHe3L7quuE2scVSHJ3x/RSIHJ2e2g5DtP8XnFx2+CYGWCEOWvaXVPKOB/L2EiGriRLm8/44wS3glbih2gGHEFqOxf25/qnOlAWBRm7Ft/CXobEzJ1rI7nbgDJsk0zo85juISebdP3BbrEmE2+rJ5vypbbhSmuTi+w1MSRTUQcV+g/4ARx7rs9skW7satWnc4gx+lvf2Gjme83W6bCdbgwlHrwRiL7FHMAHP5vXLj22RCRMecPdjeEjLqpyhFqpQUr6MEuPvY1L7j1To/9ixj8IODg6gg7GQzdO4T+6BJIovSKd3k37WcGtZuGty9CA8iTMGyaBbB2FqpQ9SBaA1dU2KuSPssg/lCbZCYStajTHKxvZSFxyGEl2SB7UbbHUCWiprJp8jx7C8v7rnY28SOlPHd5g6VL9tZoNJn7PKp/fOxxJhnoMC+N1up0k7t1fNrVw8wVSZ8wf4nq21o4xDhRqx1vuutujhSQgiUkATYWIoB823eOuBwSxpHaJofzn5Pa7jGWU3B2U9IwROH+X0Q8sYBFguojQXfma66amhDQuoH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB4884.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(136003)(346002)(39830400003)(396003)(366004)(66476007)(66446008)(64756008)(4326008)(8676002)(53546011)(7696005)(6506007)(66946007)(76116006)(508600001)(33656002)(71200400001)(26005)(966005)(55016003)(66556008)(186003)(122000001)(38070700005)(38100700002)(6916009)(83380400001)(5660300002)(316002)(52536014)(2906002)(8936002)(86362001)(9686003)(10126625002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TbGSQioFwMIC2ROxrVTaFjAx0HvHjDZ2qFg0QVNg8ARuSpclBRjMI/LuvMsT?=
 =?us-ascii?Q?pOL1uABbB6XU6AfNAQ0B9kn0cc69jxF9Gnzd7G7xxngq8L7O9vR+vrPlrmeL?=
 =?us-ascii?Q?fnkFA/EONLuB5q4H/hRWPs4ILe3AsVZdMoGx5XMAZUV+AjBkNBSqJ9qHaikQ?=
 =?us-ascii?Q?MAevT83EeBP/WKnIhun69LBE5hr6brpVXIZdVj7owtyhHPnt8GB5MpT/RnRp?=
 =?us-ascii?Q?zm8L9QxcN9vI45pmjbJ2r03rAqyMIcMMeccTaGnxdCVnf4vmnHf+RsztVF5g?=
 =?us-ascii?Q?kTtQ+iYNUpRIvBYfJ0eD3i9WRo5UJXR41UydOa7kDJULUktFoiiQriWJTP25?=
 =?us-ascii?Q?oplkF/vXGgjuYK1/4sSglt+Zo0wW8ZOZ5bfrSPTGIYERn4hooYkY4he5RtyL?=
 =?us-ascii?Q?cxC+w9np3qVk4INGhzhk3F8jp9L+Om1USjn3zx1hCFRVFtNCRYSvwd46+xMr?=
 =?us-ascii?Q?wZ8GGPbvzgpXf1nWzkDT7XwZsaFW529WcYpHMLHZlSBLW3t9waVfX/QHHfGo?=
 =?us-ascii?Q?GLL9IEZpVJpeMczMkfWASexSUBzG/6jt28mc2KPe9G1lzER4WtPEtLkQtxYQ?=
 =?us-ascii?Q?pD4pUVA/cIwEoNUFNoTOvYdjZeMM5Wi1wPjdLWoKfXWVetnFqXe8Ovp8WUER?=
 =?us-ascii?Q?OKDg6kV4TEZ4CQyvnoHR05Gm4E26hgndtj45lkEMRuzkDAxLYkHRAqCVX4fK?=
 =?us-ascii?Q?gj+7mhAo6dRWja3BwEu1z9Yb4IdWMAqJgeVuQgFFpfMP2y4DOgGyDngEh2dQ?=
 =?us-ascii?Q?+Ybaw2VeEiaj31f4g1F4rrY/uGUOsm7N4Itx/GQ7RKK5ZvEoRrvc9Ya481oN?=
 =?us-ascii?Q?dj1587XJfj5uLYWDofip9AY+1l0sPDGa74HyLOuhEnNpOfAkkUgJzgTHYhG9?=
 =?us-ascii?Q?bhSoFbzGR/Is2aT/6kr9bdBY3tKhg1T4kuwta/SkGeP2QYfW8rMUGiQY+AF9?=
 =?us-ascii?Q?+elB628SZN02ldCWIA1x04eCRcJR1OZHp6oDNXM7YKNVNT6YpM0j25BHkLLG?=
 =?us-ascii?Q?chY6ThICFfVXlKlNCfZre/yZo+ML4ZvrlJMO1sD2JWLAOemKszfFed3QZqkP?=
 =?us-ascii?Q?rC7jcer+0lGr0hrYlYTCruLeTuicRk8E0jyhOAhL+BfMn3jUuAaDipKVC0CW?=
 =?us-ascii?Q?/HhHTDxvHGyiRXCqzhxu9ZVQsGZHa+ZjUbc26YqQ6Dt/WtjDD5z9Zq57phHH?=
 =?us-ascii?Q?54HHyOafqhdDo0OQFqewQV1jPj7vmip3Tnres51pvYwe+tPLLrRoio7q0gcd?=
 =?us-ascii?Q?xRxwO9MHEFcUk/a4BNkJ8EiuKjynM7kpRNA6qavZhj04Xx3zAWA6uk4tfaB/?=
 =?us-ascii?Q?tlqgMekFYSowFG1NoUeTwxdD7ekZ6yRZeRQdVuTL8reowrVz5Wrl1KhWqnBA?=
 =?us-ascii?Q?YROOk9EIm8r9389acZAvfEjLbLGkC8AFg3GDFLfm0AEA++yLxxEhRhWW9kXm?=
 =?us-ascii?Q?LNyB1g8WADI4k0UBhe9wkYxzh0bF24OC938RvtOcs3NB3JTuPqJiW2tEghuZ?=
 =?us-ascii?Q?0Jy0bd5F7oenvECdzZtXjB3EiI2tl8aUB/OJHV//qorN+3hJwFAVr3eI8b9V?=
 =?us-ascii?Q?IoBE1+eFs1TTFjuOxjf6hUWv3vo4WdqIoYpjubIBxW9LQ8TZXymwiphq+60V?=
 =?us-ascii?Q?hGTcqngv+mYKGlViD+8gu/PMsLZ+UPUutUJVxNUZWk7SPkFTMPelQwNpIlie?=
 =?us-ascii?Q?tv4Oz4G8sdKPT227Q+0Wh8oRxymcaASo9kdKfPMa2Edp5vHzabPujnMEn/o8?=
 =?us-ascii?Q?NhldkW5B4A=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR02MB4884.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d549479-95f2-45a6-29d0-08da12de6ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 06:19:37.6216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYG1b9fxp9Gw62mG+QDhILW1R0myPbmQqItuT/W0lsnL7K64y5r5m46qkBHGhBfx8+tQ8S1DGf62ezbF9evMKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB5995
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
> Sent: 31 March 2022 06:58
> To: Dan Jackson <dan@thejacksons.uk>
> Cc: buildroot@buildroot.org
> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel -
> possible?
> 
> On 2022-03-30 19:18, Dan Jackson wrote:
> >> -----Original Message-----
> >> From: Andreas Ziegler <br015@umbiko.net>
> >> Sent: 30 March 2022 08:14
> >> To: Dan Jackson <dan@thejacksons.uk>
> >> Cc: buildroot@buildroot.org
> >> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel
> >> -
> >> possible?
> >>
> >> Hi Dan,
> >>
> >> cutting some old content.
> >>
> >> On 2022-03-29 19:19, Dan Jackson wrote:
> >>
> >> <cut>
> >>
> >> >> > However, now I have a new missing file error, and I can't seem
> >> >> > to locate a suitable candidate:
> >> >> >
> >> >> > In file included from
> >> >> > /home/danj/buildroot-2022.02/output/build/linux-
> >> >> custom/arch/arm/include/asm/system.h:165,
> >> >> >                  from
> >> >> > /home/danj/buildroot-2022.02/output/build/linux-
> >> >> custom/arch/arm/include/asm/bitops.h:27,
> >> >> >                  from include/linux/bitops.h:22,
> >> >> >                  from include/linux/kernel.h:17,
> >> >> >                  from include/linux/sched.h:55,
> >> >> >                  from arch/arm/kernel/asm-offsets.c:13:
> >> >> > /home/danj/buildroot-2022.02/output/build/linux-
> >> >> custom/arch/arm/include/asm/memory.h:19:10:
> >> >> > fatal error: mach/memory.h: No such file or directory
> >> >> >    19 | #include <mach/memory.h>
> >> >> >       |          ^~~~~~~~~~~~~~~
> >> >> > compilation terminated.
> >> >> > /home/danj/buildroot-2022.02/output/build/linux-
> custom/./Kbuild:81:
> >> >> > recipe for target 'arch/arm/kernel/asm-offsets.s' failed
> >> >> > make[3]: *** [arch/arm/kernel/asm-offsets.s] Error 1
> >> >> > Makefile:1009: recipe for target 'prepare0' failed
> >> >> > make[2]: *** [prepare0] Error 2
> >> >> > make[2]: *** Waiting for unfinished jobs....
> >> >> >   HOSTCC  scripts/mod/modpost.o
> >> >> >   HOSTCC  scripts/mod/sumversion.o
> >> >> >   HOSTLD  scripts/mod/modpost
> >> >> > make[2]: *** wait: No child processes. Stop.
> >> >> > package/pkg-generic.mk:289: recipe for target
> >> >> > '/home/danj/buildroot-2022.02/output/build/linux-
> >> custom/.stamp_built'
> >> >> > failed
> >> >> > make[1]: ***
> >> >> > [/home/danj/buildroot-2022.02/output/build/linux-
> custom/.stamp_b
> >> >> > uil
> >> >> > t]
> >> >> > Error 2
> >> >> > Makefile:84: recipe for target '_all' failed
> >> >> > make: *** [_all] Error 2
> >> >>
> >> >> This seems not to be the defconfig from above? It now uses
> >> >> linux-custom ...
> >> >> The failure may be due to the default kernel configuration. Try to
> >> >> configure the correct one and see if you get further.
> >> >>
> >> >> > I think maybe I am still doing something wrong because it sure
> >> >> > seems to be compiling a lot of stuff instead of letting me
> >> >> > configure
> >> things.
> >> >>
> >> >> It gets better once everything necessary is built.
> >> >
> >> > Still no luck I'm afraid. Same error with mach/memory.h as above.
> >> >
> >> > Buildroot defconfig now looks like this:
> >> >
> >> > BR2_armeb=y
> >> > BR2_STATIC_LIBS=y
> >> > BR2_KERNEL_HEADERS_VERSION=y
> >> > BR2_DEFAULT_KERNEL_VERSION="2.6.39.3"
> >> > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y
> >> > BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> >> > BR2_PTHREAD_DEBUG=y
> >> > BR2_BINUTILS_VERSION_2_37_X=y
> >> > BR2_GCC_VERSION_9_X=y
> >> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> >> > BR2_PACKAGE_HOST_GDB=y
> >> > BR2_GDB_VERSION_9_2=y
> >> > BR2_LINUX_KERNEL=y
> >> > BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> >> > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.3"
> >> > BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> >> >
> >>
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/danj/DG3270_9.1.103
> >> FB/sourcecode/ti_linux/linux-2.6.39.3/src/.config"
> >> > BR2_PACKAGE_DROPBEAR=y
> >> >
> >>
> BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE="/home/danj/localoptions
> >> .h"
> >> > BR2_PACKAGE_JOE=y
> >> >
> >> > I forgot to mention this before but the buildroot manual page you
> >> > mentioned said to create a local.mk file in order to use external
> >> > source, this looks like this:
> >> >
> >> > LINUX_OVERRIDE_SRCDIR =
> >> > /home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/linux-2.6.39.3/src/
> >> >
> >> > For the kernel configuration I entered the kernel source dir and
> >> > did "make menuconfig", I left everything at the defaults except for
> >> > enabling the USB related items.
> >> >
> >> > The resulting configuration file is attached as a text file.
> >> > Unfortunately it's been literally decades since I last actually
> >> > compiled a kernel, so I'm afraid I have no idea what bits would be
> >> > suitable to disable/remove to get the results I want (I'm guessing
> >> > this will be the most likely way to eliminate the error I'm
> >> > getting?)
> >>
> >> I did a compile test this morning, the Buildroot version was some
> >> early
> >> 2022.02 version, not up-to-date.
> >>
> >> You have a potential header mismatch, Select Toolchain -> Kernel
> >> Headers
> >> -> Same as kernel being built to use the vendor source also for the
> >> headers.
> >>
> >> I could configure Linux with make menuconfig, did not encounter the
> >> missing memory.h error above, but the build stops during Linux kernel
> >> compilation with this error:
> >>
> >> /tmp/ccSO8f6S.s: Assembler messages:
> >> /tmp/ccSO8f6S.s:950: Error: .err encountered
> >> make[3]: *** [scripts/Makefile.build:284:
> >> arch/arm/kernel/sys_oabi-compat.o] Error 1
> >> make[2]: *** [Makefile:969: arch/arm/kernel] Error 2
> >> make[1]: *** [package/pkg-generic.mk:292:
> >> /home/data/test/buildroot/output/build/linux-custom/.stamp_built]
> >> Error
> >> 2
> >> make: *** [Makefile:84: _all] Error 2
> >>
> >> Full error log is here: https://pastebin.com/VrXqSVsD
> >
> > Looking at the error log, it seems like vfp has been selected? But my
> > target device only has Features: swp half thumb fastmult edsp java.
> 
> This is just a warning, I would ignore it at this point in time.
> Compiler syntax checks tend to get more strict over time ...
> 
> > Also, OABI does not seem like it is the correct ABI. For example, if I
> > run "file" against the busybox binary the device comes with, I get:
> >
> > busybox: ELF 32-bit MSB executable, ARM, EABI5 version 1 (SYSV),
> > dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
> 
> It seems to be a compatibility layer for legacy software; disabling
> OABI_COMPAT is an option, because you probably will never need it.
> 
> I used the source tree and unmodified .config contained in the Touchstone
> DG3270 Cable Gateway project on SourceForge for the test.
> 
> The original build instructions seem to indicate that more software is needed
> to build the device firmware. This might be the reason for missing files ...
> 
> Also, take a look at psp_drivers.Kconfig for the options necessary to enable
> USB support.

It's starting to seem like it might be a better option to try to get the original software development kit to work instead of trying to use its components with modern buildroot.

Ironically the SDK is itself based on ancient buildroot - in /proc/version on the target device I can see:

(gcc version 4.7.3 (Buildroot 2013.08.1) )

> 
> >>
> >> You might now do some research:
> >>
> >> https://stackoverflow.com/questions/61235299/gcc-8-3-arm-assembly-
> >> error-when-building-linux-kernel-3-14-17-in-buildroot-2020
> >> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85745
> >>
> >> or try to switch to an older compiler ...
> >>
> >> --
> >> Andreas
> >>
> >> <cut>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
