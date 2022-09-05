Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A0AECAAD3
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 21:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F1716100A;
	Mon,  5 Sep 2022 21:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F1716100A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3U-i2UnHOFqp; Mon,  5 Sep 2022 21:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2201B60FD8;
	Mon,  5 Sep 2022 21:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2201B60FD8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 776E21BF3DC
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 21:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51EBB4016A
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 21:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51EBB4016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zyhtC-c37KI for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 21:44:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CB7A40123
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2017.outbound.protection.outlook.com [40.92.23.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CB7A40123
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 21:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCDKwKtDKpw7PLiLxJP8k/PF/uosvjrgd0/89LCVmMO0YUxuBnqnIBipdZBQQlXyKE+/lymqBsycQ7JDsvorpUE7SVUz3oK6k9xF3AYtvSaXCcBkbd562GSa41l6VjigqszWFNBUrZKKizAoCr6kTG0RiWJaVh4SGHonfsERHEnZ4DU/nUCy/vUvR8T44BCGd8Q7hiVvm5jScSwcTguylJA6xmhsstX8cCkbia46AkQzP2V4CzZpCw0tIjQMHGZ5fejAEpT7dLokzcEV99mOERq2cRJdoGVY7Y1w+51e96oKwMJsqggE0pCMsTJqPyLkAqaRxKmZ/IlOCxv7JjIyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wQe0GQzYqkZWd4qOSPbf2PEtS4d9zJHGkUo9vw/Mgc=;
 b=THB7yqE5Levsy+OzEBTXQcW3lxTLtukyAXVAd1ONQKnxh07OvVEhka8UXuq6Ttzjl4YhYhg9nwPZ3bt3D+Q95O87DLDQflrY1BTxDWMgwy7lfBl5Tk3ZK+SVL/sG7BfrSH9ypwx/AsXEGbBrYaa7UuM0mJAur+R0uxaAXwLGgtWGen+u4M8SqNodJ2UyFHIE0AIzWYdoIl8+YcLb6QWSPgvGTHa4UdzeNq8hN+lmtNrMSlSCavDb1HzmU2zO/1J7l84bRYM4wvfStPwxcHoRs1/McN14ZyoUika82mnR7d38VBVhVi/ze5FQnbr+UIHBE6IelQQc9EfGbrr/4EhTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CH2PR22MB1879.namprd22.prod.outlook.com (2603:10b6:610:85::16)
 by MW3PR22MB2202.namprd22.prod.outlook.com (2603:10b6:303:4e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 21:43:57 +0000
Received: from CH2PR22MB1879.namprd22.prod.outlook.com
 ([fe80::696c:1326:cf7f:f236]) by CH2PR22MB1879.namprd22.prod.outlook.com
 ([fe80::696c:1326:cf7f:f236%6]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 21:43:57 +0000
From: Alex Roberts <alex.roberts109@outlook.com>
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Thread-Topic: Re: [Buildroot] [PATCH 1/1] package/octave: add config support
 for ulibc-ng and musl
Thread-Index: AdjBcHslPbfLcfhJRZCppasergiFXA==
Date: Mon, 5 Sep 2022 21:43:57 +0000
Message-ID: <CH2PR22MB1879740D1E80A3F2A979BB2CB57F9@CH2PR22MB1879.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [wtR4lemD2T3/YmU1SIe6p56vpgjSAhyd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0317e325-cd24-4e76-e39d-08da8f87bca1
x-ms-exchange-slblob-mailprops: V85gaVfRD4/HYa7v7levS+Ou31snUkrXFuujaSQLzKxZWQJkyq1YmRw1gJHvIg09knRUkJo0I9T0CBrAo/H74V8zJ8ajlrUPHVYqbLBI0oHR3ml/O/CFUaWNpXVlDC1Bln6mv6OMKgDG2YVIF8Ds1rdM3RBJhCGrTbZSvTfRBW0js/HEFx3sZU6usTPK+/Bt6RaTEjDiNmQzdkgQtUWBFFgAuajxJ0SoLAg2c0xTDkysSzOTryWDs3ZWoYN2UE/Sla/6PkNLFvUEWuJdRpMBXU7WqJCs48CNrgjNgAOuU0xBe57wAYr7nrx3xGUPMcxlJ5so9eQU5iMC7ZWPCvpF6axOEFszJZhunCrAilnzIACBCayd/toMlRc/xaBrPVqARzVuyr3AeyKTWcI4UinKJDjGG7hotY5wqhkFMjlFCrQn8yADCoctaQWRfJcNRtNxLzOm0YU8pyI0zJxnVcCrl6MW5nt+KZdPQ06Uf8IEwblOl4/UqcP7AsbB19MjNB3EkpPJhYm60S5Qx2QtJgeDwOrT+MexX8vqoUsqWG/iNsBZEGNi9C7W9vmZ2H8Ula+bQm5pZLAKVDyrN0KcPnvhb0ofmbM8Suj8LmnsA7exY7VVm2Myeyycg/ggaBOcrchj4v2hYrfCSePxdd8SsF9h7E2nRSgF2vdP/1hgU3xuy3GkVfjhjhvh/fhyASYe1ELcw1shMVtdpcAjyFrSCOWySSazovab5hzt0YC534xq4jLvXV+uJnFydhSleZvvU1ExWNRbuixOdZqqXazQ1UJ+fernCUZVTSt6iTnxp30fYajb4OdfMYihekhJ56mraoV+Zgua0facy6A9v1oOMxd87A==
x-ms-traffictypediagnostic: MW3PR22MB2202:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t9s6NWtP26fGwzSwz/FSvIbaQ2g6JeSaaWGKYhrCmnBQX7tS4pVxYDYh3fHE3JUMNpVIgrx468JI5APynypaFy0cSaL2A6okq2kodyX73K/vY3k/yM2mRoRh4lPYxA2br/InPIMQj1KhcNvaCJpmFOO6dC1O/OvGq3yK3o+TwefEu5Ej4DyMAPELavaIqNzl+4KX1yRUNO+S5Rg8mkLAFUx4U0cmvcQK/S1PGLJRO2FK3Ukn+DHzdrM1rV3QAyhDtb/3UsUIqj6Td8FNU2QAxUjWJVthcUDRftyPQNPXe/s8Ee8Q/D2bNjBo35hpG0FHcgXhslGMOHwjlcEXNk8sabWQjZs9G/FXSqSdX3iTMpB76z4Zx/OH0auTrKWqBfeEGKtJXs7Y1g5LTgiCVToHZK9mgOcgVw6qh2hT3hIbSIMBBsduWP+PosThUgBWjjCA/0IyCpiI9qLdl7N3iOUOWSm+ZYSfP6/szY5RCdoez0SCWy7JpcwFxBO8fLnQ85ssk9mi7gC99IhVV8BfnCmf/amSqbhAvBogiwKWVHJBSLkJ69FYXNWr+kkM1jcebwtAxDpygvhEnb34tvXY1sUXkOcRdNrIegQNJ9iHErsxsOCaGjLZpET3E8kaz1t4y2GIqs4vZKbuYRTl4MXocAZywCCIHEOAvTwE+qm2Kx0P2PeePQKSzvoBMwu66rnlBcdZ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Etm7hiMeEyy4gokiPQcjg/zfAFMl24w9I9Aag+drxMc8ekhhdQVqEqY4N6C1?=
 =?us-ascii?Q?kex+6q45EN7oL6oLZyiWgPlkjc+XX8OLmIuCl/23MVavNykLdZSQp1Ak/0he?=
 =?us-ascii?Q?BShRLaecWo+0OazCVyKSE9nMFcZdlqHQlb1nD/Tk4f0aNXxs82oliN0lFGiU?=
 =?us-ascii?Q?99Qm50CkUqjNS4W2t1NSyVw1Ls4JkoiH8xY4P65Bx6pyrap0PRoTCA4v1L2J?=
 =?us-ascii?Q?IrYOwVB0atb34w459twOztB6aMKzNanpSsoajevN6/5YuVWr8UhqVcLEh2ya?=
 =?us-ascii?Q?hqM6O6P8T8gpKSwBCqvqJ5AjfXT5kq7bbQKpUeiDXI4sfbQ9fi+za9ByxdYC?=
 =?us-ascii?Q?Ci6MB8D+hhN+b0xYLuEB7CiDflbD1cvcZ6CG4wLrman8JwBt3SvDUvDJCtMN?=
 =?us-ascii?Q?Z1PvGDd8mQ945pSv9TItl/nzrrPZeHg2dVm+WrKpYiHLoi8J+xVUy4WzkrgP?=
 =?us-ascii?Q?CJaGYRWhAq7HpFr/7n1QSLq5WfrEr3dMlhlJ9vru2hh1hR1tCkWzG/v7UzGm?=
 =?us-ascii?Q?RnUy0nQgCluiYlm6PRTAzfFQXQIrjW7E3+eg3XOf2dmRUMx5tay9TeThKaPh?=
 =?us-ascii?Q?Wqrqla59z5u5ziTop6gMGycQye/TksUSpyMOjXnk3mhCX66VULvfW1jhzvbk?=
 =?us-ascii?Q?vTkFfB/X+vwHVneUhqIIhDCNEKUPmG0q9QaTT3GYrW/gjPKGrOL8PK6Xgywn?=
 =?us-ascii?Q?LF5uTJsUc+oN+b/MQ/HEUqqNwvXp+O53X+I7h+I5S0BaWmKFq0mFR8hycGav?=
 =?us-ascii?Q?4/nLeZl862bYLi/khUEG8jD83Ay2WaGg1uyL4IJBqAE0lzIjbdz2lOvNGXW3?=
 =?us-ascii?Q?mSIl7k6EzyfqouyTgJhnk5vykbses41s/ars7EofZJbNk8TskyQtl4GX/FDf?=
 =?us-ascii?Q?YFIfTRM2Kha1AIZKH8vrQ+24YIX6uHMLaN3+LHkCYQdi7bQAoZ6DJf4RBvJA?=
 =?us-ascii?Q?v46Si9iMSOr2+CFGsK+nID0uQ23niNJ4M/egqN/+bNGiViH2N7TrsKOvCKbS?=
 =?us-ascii?Q?MT27IK6BXZ/tfxfCjyqzPPVOtE8XDK3K3pCS2X1pOiuechA2M+mwhP7mH0TN?=
 =?us-ascii?Q?v4mAkdKndBzYZOZxHrFlrvK03PplWTGur7auCNkx9kTLgrGS+te7Crborqfc?=
 =?us-ascii?Q?qOqAtSTru7F0Rj02d0I7QNI9AVJxhAMBHEO3z1FDMJa5Ss093rW34opXdDoj?=
 =?us-ascii?Q?d0e9iq3j2I3HyXZXlwtwgmRacm7nlhLRHhjskvDo1ARIAjA5aReS5GFPa5A4?=
 =?us-ascii?Q?fAb7477z6/PgqSEOdGuwZRI7iMAx54wN69o0nXdo6w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR22MB1879.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0317e325-cd24-4e76-e39d-08da8f87bca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 21:43:57.3961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR22MB2202
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wQe0GQzYqkZWd4qOSPbf2PEtS4d9zJHGkUo9vw/Mgc=;
 b=gPvP5URdrXXqCk98ogZD0S7RiUsCImHp7KPSQymXrQ99QH+Uj0p4BB3XmLw0bGWPZHd1OCj7jvA3Fcpjl4a7Jl8OeYp3cvfwWnipvUYV9gnDViO8LCL5frJhuLLlFX9Th3qNihVPZ3e9gFDQz6GLS3C4cmoNeWapLexmLs50Vct23JQfAitsllXFJEvY0n7I3ILk966elrtHdZ9PjXKua6LrmGdpZMLc960nqEGIavGWbcWsG+UJUOfnsb3iSu4HJxlOJ9wZcW+CNeaRx2pdyNK17h+C21yPTg97oSjQJzkUfsMVLhkjtbnZWEro/OHvwx21c8Fp3qUCmMjYWmxDYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=gPvP5URd
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add config support for
 ulibc-ng and musl
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
Cc: Alex Roberts <alex.roberts109@outlook.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

>This is weird that your mail contains the git metadata. Normally, this is not present when sent with "git send-email".
Sorry about that.. first time trying to use git send-email. IMAP and SMTP settings weren't working with MS365/Outlook so I just copied/pasted the output of git patch-format directly into Outlook. First time trying to contribute as well so forgive my other mistakes. 

> Also, your commit title states 'for ulibc-ng and musl', but all the explanations seems to indicate that only uClibc-NG is concerned (since locales are always available with musl).
I tested configurations with uclibc-ng with locale support as part of the toolchain and without, but with libiconv instead. 

For musl, as you said locales are always available, but BR2_TOOLCHAIN_HAS_FORTRAN, BR2_TOOLCHAIN_HAS_OPENMP and BR2_TOOLCHAIN_BUILDROOT_CXX are not active by default with qemu_arm_versatile_defconfig and aarch64_virt_defconfig.
These configurations must be enabled for both musl and ublic-ng toolchains. 

>Sorry, I don't understand... If "uClibc-ng has issues on aarch64 and segfaults on program termination", then how can you conclude that "All tests passed"?
Calling "octave --eval 'oruntests general' " fails on aarch64/uclibc-ng as it segfaults when octave detects there is no display in the qemu environment, just after "src/main.in.cc:456: std::cerr << "octave: " << display_check_err_msg << std::endl"
# octave --eval 'oruntests general'
octave: Segmentation fault

Calling "octave-cli --eval 'oruntests general' works, and all the test pass - just ran again to confirm and I correct myself this does not segfault at completion.

I've been sitting on this patch for a while because of the segfault with aarch64/uclibc-ng trying to figure it out, it wasn't 
until I saw https://marc.info/?l=buildroot&m=166021556008040&w=2  that it made me think it's a problem with ulibc-ng/aarch64 hence why I also tested uclibc-ng/arm32.
Indeed, a simple helloworld will segfault, https://stackoverflow.com/questions/73393107/segfault-when-writing-to-cerr-iostream-uclibc-ng-unhandled-exception (my post)

>How is OpenMP related to the locale issue you explained in the commit log? If OpenMP really is needed unconditionally, then this needs to be changed in a separate patch.
>There is --disable-openmp, so I guess this is actually not re quired, in fact. But having it explicitly set would be nice (as a separate patch; of course):

I was not aware of this configuration option. I can make this a separate patch.

> We have quite some packages that do:

	>select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

I will change it to follow suit.

>> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BOOTLIN || !BR2_x86_64
>> +	depends on !BR2_x86_64
>Why did you drop the dependency on the Bootlin toolchains? If the issue is no longer present, then the comment above would no longer be applicable, so that would have to be modified.
>Also, this mens that octave is no longer available for x86_64 at all, even when using toolchains other than the Bootlin ones. Previously, it was possible to use an internal toolchain, or any custom external toolchain.

The intent was to enable internal toolchains. I misunderstood the behavior of that depends. I will correct that.

>> +comment "octave needs locale support via toolchain or libiconv">
> +	depends on !(BR2_ENABLE_LOCALE || BR2_PACKAGE_LIBICONV)

>If you use the select as I suggested above, this coment is no longer needed.

>> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
>> +OCTAVE_DEPENDENCIES += libiconv

>Don't we also need to pass --with-libiconv-prefix?
>And since there is --without-libiconv-prefix, can't we use that to disable use of libiconv?
--with-libiconv-prefix doesn't seem to be necessary but I'd prefer to be explicit and like the idea of selectively enabling/disabling based on configuration.

Likewise there are other options like --without-curl and  --without-fftw3 that I plan to introduce with a separate patch. 

Is a patch for each option e.g, , --without-libiconv-prefix, --disable-openmp, --without-curl and  --without-fftw3 preferred so that patch is only changing one thing?

v/r
Alex Roberts
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
