Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA66C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 06:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C3CF40280;
	Sun, 21 Jan 2024 06:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3CF40280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGq6uWUkBcSE; Sun, 21 Jan 2024 06:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64561403D6;
	Sun, 21 Jan 2024 06:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64561403D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1380F1BF860
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 06:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E207383BE4
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 06:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E207383BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJLTTdnPp4Vv for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 06:48:07 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c18::801])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BBBB83BBB
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 06:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBBB83BBB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbaQ5LaeY7aBaQEQTNie6HMCQt0HU4A+rvw8/ZXi79GOY5yKx0FxkBMmxa/D7iWToqC2a0uk8ABPDlfbrZF77D+IMeAJk+bAfCN34Q7IXyV5csC7nc5e8okh02XCEsV+H11MwMKoosyjuVVIFoeQKj2x2xWNnh0et8NMHoQzQpu53KHJ7dg2N57oH0Nh873w8Prvep8IlZKoZcQm1zLWv9WxARR8hz61vymMeOFA24OPgzEk0g03I3lTNBS6o5ooBtu472BFzFipC9H1jRIxrYcAoyHESvUDqaQS7Lv7xb34+JBXfmfO0bQTVotMzEVytL8qI7vHCKqu5BC9uM0fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwxY0x+EAqlISMrJ/+LwFNBpT/kK5rffqu9xmuxbDPE=;
 b=Q1cwDtAlxXyL45TVoNsDlHwNjmEBTgnS5Xer6nhdp1oTvgJXXeMO5wyFiWPS20I/qUPGrzyYDj9FAxZBBB0FZQ7yaTFM7LNIaZe5x6wp/7sdJ0XW9jwKiZEeUakyutl+H7ChNG4nXPPG4r6vm304YybdMHgTe2jETCQzFKiG2p0+b/GVwavOVzMMYwV4Ls7OlKPQEBF9M60yKYnr1TbrGvihlqHkLCi2Iy4ggeP9bWjIWMcrwEOC35mJuZN0bUUfsXU1vZo8t7O460w1M8YWlWDTmPseFN003czpJiF0S7K3MUQmoghWpOWfNCoWnGF2r4C6cGLVRgxFXO+lSLOILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH0PR19MB5409.namprd19.prod.outlook.com (2603:10b6:510:f9::21)
 by CH2PR19MB4087.namprd19.prod.outlook.com (2603:10b6:610:a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Sun, 21 Jan
 2024 06:48:03 +0000
Received: from PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::fd93:9a21:97c9:807]) by PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::fd93:9a21:97c9:807%6]) with mapi id 15.20.7202.026; Sun, 21 Jan 2024
 06:48:03 +0000
From: franco ariel <fran.millocs@live.com.ar>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Help] Run Chocolate-doom 
Thread-Index: AQHaTDVIv27cYA/Ii0q2WkcWi5cX9Q==
Date: Sun, 21 Jan 2024 06:48:03 +0000
Message-ID: <PH0PR19MB540925F1A9987E1D7F58BB0DD0762@PH0PR19MB5409.namprd19.prod.outlook.com>
Accept-Language: es-AR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [vA3stWrppN/gOCJC3qUvIVu7928l3Pn2Wjuh6yh1yLI509PxG3ihF20lgNdpYTu6]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR19MB5409:EE_|CH2PR19MB4087:EE_
x-ms-office365-filtering-correlation-id: 837f8128-1cc7-4e2c-1641-08dc1a4cea71
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9WD3EwXoAjAt0M+CMJtSaPx8o5chmHP4S/IzzeH82p7mviftJyoVhCxN6Q3Z2whNeP+XBaS7XC5HMR23DxwODJD4vp43QhmFTiQ8ZPmgYdgeIY7Jz5nJ06GsI4oBQC6YDCvP003YVjHHV28rXqRgxl65J6YfNhSNVrnvnq5XRpsIc38PeRhX91j+b+08oYB9icaKezZKVwv61JxuiXUeHZQVN9tkmZv3teE6shRYZ9I8aN8DTfnxTEE+JPbaXFMhM3D0kWFCG7h6sIQcF8Kmh2/jHWRjOgjtEltSebNdBfJZQWLv/vOrLZmtUTWx9FvtaX8mJcBFaIIT7BOlz6Zhooi5W1gNglgPtCbRIbP0Mlrw8afgFn+0xAfI/zS77+22WYtZJC76eO7zqsAiM570y4gRWcccTHJe0SZUedwL4/06jRinZ1oplqpAKt0Z4Dlzl5oR+FSjMY6ZaIrHUdzmSOEqZeTDWdBgJghWSoW+p3X9dDTriQ/OewEwwvGin38D5Ch/bzZbfYAR4R7pj1XoUxJqrMkFlZgNtNHXGghSCzLGCPH7z96meCS1hlBsZ4gE
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LcgaGg2WIKMizYa2s8rV6AkaKGwjLJ3X7DjWvbpNmcREopEDJOfZFlc2GMJL?=
 =?us-ascii?Q?862nrFhSDeb2+sFVBcw9QxsMrZdnC62DbG2dD2+Bv1wJeKwCpdmtkjeKJWJQ?=
 =?us-ascii?Q?1LuHCKsj80udyhTJL3OvLr4WwjdKrtMblWSZeVtgJqHJouSpJRbxggd+Di+O?=
 =?us-ascii?Q?6DRrLSUYTskyxWEO9jOvxEostDthZUbTRigu3MClwQ+wuDyYg09+Ot6oWqow?=
 =?us-ascii?Q?y+ZYgwmE49wL9XrPE5oX8B3YPzdpSgIlj9g6LV0pUra3VHvxRSk4up9asmHD?=
 =?us-ascii?Q?EpJUJIA5t7GRVIgzJwI0qzCKSqVRe8hpgkKcRicQfqMyp1PsU8Eh7rWTiWet?=
 =?us-ascii?Q?F+v4OCU+GkoK+XTuXyZb6Pw+7zYhb3cThn8+w/9UKogYVeuQzlckeb+tqcDb?=
 =?us-ascii?Q?XxRHL7JMoXGbqkbh4v4yRFhMiVreSE59WGGZMNJsgYXJgzPlRHlrQ7L3NSmg?=
 =?us-ascii?Q?RLOJkrHpM9LiNU8sowm5lyk6wKrA4tVAracfKZUtF9MRguHlNt7uIdCpsH4L?=
 =?us-ascii?Q?7Yb4PeAXerlkRJKVL66c77qeGh1/TZ5PWl5X2Zl8osiESfwai3FHIhR5wJ/R?=
 =?us-ascii?Q?izw+Ck/cnRUk9ZwZR7NSXItUJ6HgVHBBnWyC1XlwVsTjB6HAMQfdH55Sd2XH?=
 =?us-ascii?Q?8/9QESGJCtfpZjpoa+CSUBKyhZ9AsQr4BzI0+UpQtYjcJvPd9LciQVc2H9uZ?=
 =?us-ascii?Q?EGmqNOelb6JNLsrpdIPHTMkrep0Guwmjbz3opyweIMMf5SibZVbJg9SEgnj/?=
 =?us-ascii?Q?uEcjJzJWqY5abhMlNygy19t5dTV7da+7yx8CjBe2pYFn963hUjO5hs7j23i5?=
 =?us-ascii?Q?lnvTvUqugmcCSkRgNpHoar5FGjrvz8nMJn5u/gkwSkmsCr+SY7uvUd1LPQUn?=
 =?us-ascii?Q?RW6+KN8C9SV+Uxzi9KiUHiXw+rO3xysUAUr6dk3jG+jMq5t7cUXn/bWAMIFv?=
 =?us-ascii?Q?e7fCpkekR4qQmFXycSOx+ljvVDUubzGo0lvgJVPqac5cOYwiRNoAmGdEf6Lq?=
 =?us-ascii?Q?RtBVO0n2CiWdgYOck05qLjBY2YFnKzKgFBPw2FQogQIeTU864s4MlIot6wmE?=
 =?us-ascii?Q?yaR3cUfc2ecO+zhMkEYmra9dJWYlVbFcU26DSPuahkij38XDFoONNY0Jq5nM?=
 =?us-ascii?Q?2yrqe611yrzM81USp9TgVfM0lMoNX4SHkFyELNJFthJ54QBoRvuSUdPHqIFg?=
 =?us-ascii?Q?QhWZSVvfeukffUN4qZN/Tw2lxsIGmABOZJhFH+uxO7z5BSpEfiDEi1TzNe76?=
 =?us-ascii?Q?JG7GEHgjhKkueKhJEg9Cs2e/j8gmKg+ivWVsGt7ttsfwkXkU0qOn18ygbHDH?=
 =?us-ascii?Q?FeY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e7757.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5409.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 837f8128-1cc7-4e2c-1641-08dc1a4cea71
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2024 06:48:03.2468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4087
Subject: [Buildroot] [Help] Run Chocolate-doom
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
Content-Type: multipart/mixed; boundary="===============3501926285026827619=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3501926285026827619==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PH0PR19MB540925F1A9987E1D7F58BB0DD0762PH0PR19MB5409namp_"

--_000_PH0PR19MB540925F1A9987E1D7F58BB0DD0762PH0PR19MB5409namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
I'm trying to take my first steps on buildroot using my Raspberry pi 4 and =
I'm just trying to figure out how to run the Chocolate-Doom, I already inst=
alled and when I try to run it, it throws the following error:
Failed to initialize video: No available video device.

I already installed all the Graphics libraries, SDL2, directfb, etc.
Maybe I am missing something.

Thank you,
Franco.


--_000_PH0PR19MB540925F1A9987E1D7F58BB0DD0762PH0PR19MB5409namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div dir=3D"ltr">Hello,</div>
<div dir=3D"ltr">I'm trying to take my first steps on buildroot using my Ra=
spberry pi 4 and I'm just try<span>ing to figure out how to run the Chocola=
te-Doom, I already instal<span>led and when I try to run it, it throws the =
follow<span>ing error:</span></span></span><span></span></div>
<div dir=3D"ltr"><span><span><span>Failed to initialize video: No avai<span=
>lable video device.</span></span></span></span></div>
<div dir=3D"ltr"><span><span><span><span><br>
</span></span></span></span></div>
<div dir=3D"ltr">I already installed all the Graphics libraries, SDL2, dire=
ctfb, etc.</div>
<div dir=3D"ltr">Maybe I am<span> missing something.</span></div>
<div dir=3D"ltr"><span><br>
</span></div>
<div dir=3D"ltr"><span>Thank you,</span></div>
<div dir=3D"ltr"><span>Franco.&nbsp;</span></div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr">
<div dir=3D"ltr"><br>
</div>
</div>
</div>
</body>
</html>

--_000_PH0PR19MB540925F1A9987E1D7F58BB0DD0762PH0PR19MB5409namp_--

--===============3501926285026827619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3501926285026827619==--
