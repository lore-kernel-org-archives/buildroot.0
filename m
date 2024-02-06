Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550FAC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 04:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19B960F4B;
	Tue,  6 Feb 2024 04:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19B960F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3t8ls8Fiemwh; Tue,  6 Feb 2024 04:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4A260F16;
	Tue,  6 Feb 2024 04:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4A260F16
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 769461BF35F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 04:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E03160F16
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 04:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E03160F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtYIHKxBTXfv for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 04:14:53 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c0a::800])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2619060ED6
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 04:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2619060ED6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/JVSKEOajmPpJ7Uhv6sMjS3ky9xtkg+bTqeZ5L1Z/Ztjem5gPOXrJa1+kJ5rJCqOu2PbSBKEtU1y25b6F5Dta3JGf2tn41RFvyEnIxdejj4iPi4bY1lSeV1d7Tc1AhAW5jnhqh9W34m/LKORb735/0IvZTNXqksNXJq6eDANJalUNBmaV2aEULcjbx9sfQjuqNs4owAAaR14e4wFnW2DooyDMiePMv6EffEB9SuxDO3wdwDNgfOrOON+dJEEGeE6tjly3ODORLS+E2uZ3GvfdkRSIchfv0X21uYsOS8VkMlXXHwmfW2hQtTOMRyUw+oUb7TDqzV3I4zonnIG8h4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/+eh28mlx1G3r7wtCeJhehsyPiKObxkaEhc7W0udoY=;
 b=VKxFmYwDBfmAwdq423KCFiCM0na0WmzbxYrJkb0y4msaLRkD5N8yCfbUasuRTb3DEz5SqDKVgBZAm0ezg0wYi5/6Q3Vg33TsFeqyjOZh+QB4+rmzpohJ7e9EA7/nZzKCX0rKtpQe6Mj6FBhLY0M6s3/0DHMTOTi/dCDaXM7rUfgUhFcBVb+obLmMNx/exs7fFrg0jABsd+/kJtif+uzHu1k7Ek2246llNsa6o9sWu8gdWEQk53erev7ye8TXE9IOKeEOqC2whMfTqG/gqpx8LfpDVtNEoc79CtxxyXIsdUGv5c2KS4lqSufqexgCRLa5kOdp3a5NZWtj6g7t2b0HCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH0PR19MB5409.namprd19.prod.outlook.com (2603:10b6:510:f9::21)
 by DS0PR19MB6455.namprd19.prod.outlook.com (2603:10b6:8:cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Tue, 6 Feb
 2024 04:14:50 +0000
Received: from PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::fd93:9a21:97c9:807]) by PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::fd93:9a21:97c9:807%6]) with mapi id 15.20.7249.027; Tue, 6 Feb 2024
 04:14:50 +0000
From: franco ariel <fran.millocs@live.com.ar>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Thread-Topic: Best board to fast boot 
Thread-Index: AQHaWKlG8tvJrfQHJUKLNdjjShuIxg==
Date: Tue, 6 Feb 2024 04:14:50 +0000
Message-ID: <PH0PR19MB5409C4B7C56D0550E15A83ABD0462@PH0PR19MB5409.namprd19.prod.outlook.com>
Accept-Language: es-AR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [WKHXc+Am9R1Jt5rRMhaWJ6DEcGUVV0WOsJ+ZxApWQejW64L6XHT1/0Bz9Wse/QVm]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR19MB5409:EE_|DS0PR19MB6455:EE_
x-ms-office365-filtering-correlation-id: 7486fadf-4ced-4b8f-286d-08dc26ca2979
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lJbJFRDfa/0O9aZyk50jQ8Z4X/i1qiBHwArh9ic7DxHrz57NuBzVZH/c1uLQcfppVZGtiP0i5PWLJibwv4LJtz9oMjIKxYXAPzxI0DCaXLF6gE0fUDNMM3t4VCS2pr0JMhNx6Hv7WR+h9nx5+Bpt0b11pgjrcA3KzrX6tFssXHd20YdvW0g7A75jsWLyBWMOE67yE4dSOkrrw0HZhRpwu1Q+ozOggLvXxH6EgWhy8txys+yO/Wq8EMJy+RJ1UjEDKZMoOom6yWxzR9rrYULgS+IqJaC6cucK61IaHN7dM3qfGzLV6heo7+/JknISpdjvIh5hZb+blKte/JKN9jE9NUoQq7BTJuf711qfrppLGy3HJcrehJD8fRhH4Ul0qD5d0ZZdBEySMaqwZicKS+/iYjwB7uoOFHCqB9KHLSk4yhflYT7CukcHgJ82UHwq5aq4TrSmi6Pc0SoNbrxfhHNwbZ3JIfiO4vsgssLvGH2IHPU4V5vLUjZivB5w9oGomqwHp2yUKJvC3prk+Tb91kevWMAcrcTIIbr+oTYIqSJevaqhRAipQ6z3TFqN1vWPvkqx
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/2Jk6h3uqucEGbnfbNPBnaeC0YuhgAhn51yyRtO68wLphmpnrJbjh6B5p1?=
 =?iso-8859-1?Q?UwzZalC+bN9S8lYYuhme/BukUlThtIfvaLFeEh8/4eZmFBN326nycVg3e3?=
 =?iso-8859-1?Q?lNgOJXYU9o3n3d+kiPADb1Uc8rJVit/OZRiNVjZu6vtvs0gs3yK7E4GqWs?=
 =?iso-8859-1?Q?b88FHMVEFr6zq6BAUZjPDOjPyBoxGeAXgva3t0cSgQU+rSymfXInTQBVjg?=
 =?iso-8859-1?Q?MhwStHkpmEiJluJlBjnOyGZsfjzv+D0QjMQ10YzDPVl5h/UtwlOOFJC5Ki?=
 =?iso-8859-1?Q?redFs2yxb5lSmuxv+k1d+qdiWGIInPJv+7J8aP7ZXDsuQvSW0fEh9RkYol?=
 =?iso-8859-1?Q?TFj+S/2hfMMyezxopJMyRsfvHDCVX2FpjdrtdNVWGGj5j+6/HVGvl4Qb7F?=
 =?iso-8859-1?Q?4yrfJbTEnvzn5JJ8l/Dakb7zv5399uMwcKRZQfJcCAFNSPw3fHBVLsN+YO?=
 =?iso-8859-1?Q?ozka18DUWdD7Tf14odrq9ccbUhzATqOiCZsgTpNOgXfCiVd9F03FGBoA3J?=
 =?iso-8859-1?Q?6vC1mzJ/EzyNyxI444VCylBOXjPmBoSduzfuRbJU9GBeC5VAQEOHY2NbhN?=
 =?iso-8859-1?Q?JCppEQkhHxR6vQTrqf13vc85UNgmPzP6unimP7KjjKJyCiEc+Dm9h1s7Pi?=
 =?iso-8859-1?Q?cqq5poZyYpKVjIcPCMecGBfm97OcVhpdNwn+sDn6F+3oid3PhPzFaNpVdN?=
 =?iso-8859-1?Q?4/0/ke92E6Lg6wYlmMNfUGCqhLehxMIiy+HEe4HHv1KTvm4r88+wdG7PoA?=
 =?iso-8859-1?Q?rAkXLbuR2TqtRTUeOfshvGVjSdgxSOsCA3n3YTLzfxiqTb3+t5oVzDKm4v?=
 =?iso-8859-1?Q?hmY+wludvaw8AykXojVsxeWoby31NuSwEvjliXUK+asqZppAShdy+lMAMH?=
 =?iso-8859-1?Q?wnE+2dZHeetGjh7JsIpOJcIrcxOTDQb0AcMwXa8BrUZCFc0KMhh0WKPJBi?=
 =?iso-8859-1?Q?OLXql90zxaWxxR2pjIUCSbAsWfFPc9IsXs4LoO8JtwO3QP/Y356yzCnEf3?=
 =?iso-8859-1?Q?QwCJW+44hO0/iXYYR9/Y7ZQB/bwNtdyJlPhNY+zVOJ70BysZPfxPxj2NbP?=
 =?iso-8859-1?Q?S7CDzKiyhstcQSwOeXcP9NvetoW66aZYozxGsMBAs1ecomIGkast1WHAO4?=
 =?iso-8859-1?Q?44a6am6mEJgCqjMjdDscw8Vt4Sp8IZsRvpiOWbVPr8JjhlXpWU/9FkJXx+?=
 =?iso-8859-1?Q?NhA6T6xMRweUvjrPR0TD+nNkUFRF2cneRSbNhkRSri8j7OL2KL0/wOj8Fy?=
 =?iso-8859-1?Q?HCYstdLLYOntNzGORO5w8/HHe02GifbkXubdbXN4C3DtblzX9mpfvY72NC?=
 =?iso-8859-1?Q?9lnANZaCXNlg1G+qzmTtcjWTHDJMira95AU6QC7oK4H1kvA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e7757.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5409.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7486fadf-4ced-4b8f-286d-08dc26ca2979
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 04:14:50.0350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB6455
Subject: [Buildroot] Best board to fast boot
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
Content-Type: multipart/mixed; boundary="===============1283683853948655458=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1283683853948655458==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PH0PR19MB5409C4B7C56D0550E15A83ABD0462PH0PR19MB5409namp_"

--_000_PH0PR19MB5409C4B7C56D0550E15A83ABD0462PH0PR19MB5409namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello guys!
I few weeks ago I started working with buildroot on rpi4, and it's look ama=
zing, thanks to the community I was able to run a flutter app on my rpi4. B=
ut now, I want to keep going forward with my project, so =BFWitch one are t=
he best board to achieve te best boot time to a Qt application? I was looki=
ng for the Rockpro64 from pine but I'm not sure, since there is not so much=
 information about this board.

What do you think it will be good for my project? On rpi4 I was able to get=
 10sec boot time until the qt app shows up. And I want to achieve less than=
 7s.

Thank you so much to all.
Franco


--_000_PH0PR19MB5409C4B7C56D0550E15A83ABD0462PH0PR19MB5409namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"ltr">
<div dir=3D"ltr">Hello guys!&nbsp;</div>
<div dir=3D"ltr">I few weeks ago I started working with buildroot on rpi4, =
and it's look amazing, thanks to the community I was able to run a flutter =
app on my rpi4. But now, I want to keep going forward with my project, so =
=BF<span style=3D"font-size: inherit;">Witch
 one are the best board to achieve te best boot time to a Qt application? I=
 was looking for the Rockpro64 from pine but I'm not sure, since there is n=
ot so much information about this board.</span></div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">What do you think it will be good for my project? On rpi4 =
I was able to get 10sec boot time until the qt app shows up. And I want to =
achieve less than 7s.&nbsp;</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Thank you so much to all.</div>
<div dir=3D"ltr">Franco&nbsp;</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr"><br>
</div>
</div>
</body>
</html>

--_000_PH0PR19MB5409C4B7C56D0550E15A83ABD0462PH0PR19MB5409namp_--

--===============1283683853948655458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1283683853948655458==--
