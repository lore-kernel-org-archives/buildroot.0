Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C59C47258
	for <buildroot@archiver.kernel.org>; Thu, 25 Jan 2024 21:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F054EB7A;
	Thu, 25 Jan 2024 21:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F054EB7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bs5050Rw6d6N; Thu, 25 Jan 2024 21:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D28CD4ED72;
	Thu, 25 Jan 2024 21:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D28CD4ED72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEABC1BF5DA
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 21:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08BE683FC7
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 21:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08BE683FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O67YDRUglemn for <buildroot@lists.busybox.net>;
 Thu, 25 Jan 2024 21:35:48 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c08::800])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52C0784F50
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 21:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C0784F50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7mgRZC4spb9wcgSY95yakh3qlt9KlRC1RgGMZECkqU/mGM/zJKxKNw9SJ3H5Fb3cUl+rAFqNvyIwEsMz0UKoD6GSHPJlWIvAJeAbFDs3R6wqHAb7h9CmXXvN619m8EA8HrL4OMPJ0ObM/31Xj/7meW95voZfHjyLo7wFEexnDrnaUi5ZE8Rlsdd1mA/xtHduUutvnbuleoC7YUCxJZDq7Bc8wrEasd9XiAGUjswDhlTVUbIotKJQx1lhnwYpvXCGXgOrzG1Vej8BAgwZ5eOcwDfmZmTWLr4qxCPiTrKF5YMPjcK+WjsJCa4Ri2EOWIdyaGjHXTJQuCtS5GPh921XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO8lhtFmqQVQ/y85+00iNxNlo8WkNTnfrtKstS9pqsI=;
 b=d5pesslmswbhASodRU5YG0eZHOKiGU3UjEj1PF7u1yX61YbsibNtNdXuiqsLo4Buh43tPl/T30U73SbPIdPrWc//oezvTxtKrQA+5Qu5IHoT7n2Ml9W/DcKnRABj+klNMh/zaXofJSquVrsuUCLY8b5BlnDbg7XT6AmuyrPv3j0ILrPYO+jVzRHss01RDFiGcEMP+gok0s4PA0cPem5ZyMOrR8PAh2cx/QDvTvxTRZNNDAkEB/Cz43V7/LdGIdjXWqkETew/xifQeIKapap++IGTAqOpN0exOssrgkV5sEoiRv1UtDBZ3yI3wUK1RMbC/r4AvS6q0djd5qnZJ17qwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH0PR19MB5409.namprd19.prod.outlook.com (2603:10b6:510:f9::21)
 by LV2PR19MB6128.namprd19.prod.outlook.com (2603:10b6:408:14c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 21:35:45 +0000
Received: from PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::fd93:9a21:97c9:807]) by PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::fd93:9a21:97c9:807%6]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 21:35:43 +0000
From: franco ariel <fran.millocs@live.com.ar>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [help] Run flutter app on buildroot 
Thread-Index: AQHaT9SeZ6KpvLlmCEOX0aKf8GDIew==
Date: Thu, 25 Jan 2024 21:35:43 +0000
Message-ID: <PH0PR19MB5409AC2F905D67341DDACED2D07A2@PH0PR19MB5409.namprd19.prod.outlook.com>
Accept-Language: es-AR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [hSHK/PDGYgUtFxczN8P4mnGlth1waB1b2DiX9hmZBIvlIOPfG0rQU+Uj6ddRJJ1N]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR19MB5409:EE_|LV2PR19MB6128:EE_
x-ms-office365-filtering-correlation-id: ff6cd2fa-f691-49d4-cec6-08dc1ded95d1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lKCH6iJedHuDhPULShJWBbc7bSUsBhPEAiFHHcs4Z7HhcE86tBAL1thFbPn1EPMD/HczK+Y+UgW2CSIHe4ZZytLzvLWlFigGqsFTid0hNr8NjVYCQwyzif5jHqViD3eP7YGprU1xtzFnWEKgkm1vYAtR+YHe+OmS+MBM4DwPd/u/WEImbPXO1kVY9dy5HnxnspD+ORlcKbo/6t1j39SGYGrdQCAFtxdOlFwFAA52Z50RJTHswqLNfVG3mMGoerkR0Imk6FPQShOSyV8bc5/wN0HIEi/qWa+g13rsZKRbtgfaIZKKYfyoRJ59TrieVBuBf7rLuNsacWKpCOb7o1tdpSdKTKMPfPxno+TQ2yfyAxLX9BjXYXGAvyCQ8/GYqatRZinIgoak4x5PxicHgQLnu1LPIT+HC32X/nJ2/w0CLVx5Upk0zxyEPzGajz4lKfXnVQdiFnUiBKBskeYcCLEDUjavCqrDeMkFs00MM+e6CE4jFVZwInJZElNwdf3i41idMRYdVO7yf4AfI3mKG9IGS9SgR47+5YLwTmxnvRTcO4VKC9TnaXqtz0KOlnPC0pDA
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KlAFRrYcjT2TYz00Ktl77Ncz6AbK13FhHJGUaDlKOxN+DaQm78X5Ki4RdCKm?=
 =?us-ascii?Q?FPEs4Lt138+vBO+0cRu/ZoUPxaUGfdcnfZjygeClR1kcpdRGNILeXKxAVXh/?=
 =?us-ascii?Q?5SPWSFPRDBFF5i2NQxAGRQL2fo125tz5IKF/R+W29LFEJwsbB9kJxcraTie1?=
 =?us-ascii?Q?2GfVgmEj8JU5t2fLck4VTr27cHOlyfu1HvaXmMez+mnxcPpvhYRvCN03P2rX?=
 =?us-ascii?Q?znZDUnbtiq2NvaIn1bJ/MG/Qvmy9tKROGp5MjZ73/GNk2RxuYH8Y2CVa97KN?=
 =?us-ascii?Q?thGBuZT/tdPzV4b1CNVR+3n3UQ+Ne/Ad6UgqBxf6R499idDR9FXBqDzZcLxK?=
 =?us-ascii?Q?TwPHi196j268P0NI7ZYhnM3nux/jV5374IOK5Cob1Oai2efFhWZXvk/wEXNl?=
 =?us-ascii?Q?l83DdyENCGALrnhT94XqL5T4rUu6d7iq/d6mdAhIvA2EmNFHBqDBSNmmoyhV?=
 =?us-ascii?Q?RBX0QsIkD/1nDjx8+EBH4aKYOK26zzww7Zv6vIo4u3UHhWpwPxCW4vUBUjTE?=
 =?us-ascii?Q?TOiCWBR/dqSbHmbhRU32Mm5VSoI1XL/HQHSV6jlZw/i4BvTi3vUzGCOT7C/L?=
 =?us-ascii?Q?+AOBNszLqhA2vAjBgR1qaqYjf2CWt46inYcLB8pACT97E1DRmICpDxxfH9IM?=
 =?us-ascii?Q?mEnjxxnUYV6W5A9QE5ozoFJuUfa6wVSo+iF0HC7lE/pBMiOE2SadwUc911KV?=
 =?us-ascii?Q?KVeZbKMY4WcfvrDO3hHFW4Lx+PZPSapL7CCTCZpV2EBJrnQMKc8INwMLaa12?=
 =?us-ascii?Q?1EzawE5TOLATrg9+I03fBewKLe2db6bYRo5SipSrjDNnXnwRixSyzjm0YZrj?=
 =?us-ascii?Q?AIFY6iShI+oN61cbbC3sQQNaruNdBqD67ikodW+H/Ss6Ug8mHiwMNLZB104Y?=
 =?us-ascii?Q?D6meIvE6vha41SdLRvnFGtsAMVUBvEIPzV1m7L1DiPLIZAhQTbVFsvdewnwy?=
 =?us-ascii?Q?BhtzKpD+OUHOHJDPrL8tU414QRFe5eD+x25KP7YTgcz0s0NybK6c7m+JMCGx?=
 =?us-ascii?Q?AJhNrBRwu1ftUeh8AIFAtBaBdelOaZvZzvYvTZER3ApQ9Ur5/o7xYZjh3ts9?=
 =?us-ascii?Q?6g9ujfw11IcRYdEyyGsxPYboTXnomsgLzzndmWD8c7S1Xen6UQe1JFGFdER4?=
 =?us-ascii?Q?FfsNGQaXC2Nbh7U0nrOKKo5Uxc4kUmp+Zh5jRwbVdNE7QHKkPgEcizodVHzo?=
 =?us-ascii?Q?w0Q+yMZxEDtt0ZQ7fr+CLBnfxZB5tT7aqZF8PW8WuYJYLVz5MXy95xWTwdOI?=
 =?us-ascii?Q?mO0u/8w9Jc1TKPhZaB6D5q79EfrVIwnl/fvxe2NWgS17ChZRT9AgJ1MMrnZZ?=
 =?us-ascii?Q?FZE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e7757.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5409.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6cd2fa-f691-49d4-cec6-08dc1ded95d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 21:35:43.7659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6128
Subject: [Buildroot] [help] Run flutter app on buildroot
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
Content-Type: multipart/mixed; boundary="===============6517487118194578628=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6517487118194578628==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PH0PR19MB5409AC2F905D67341DDACED2D07A2PH0PR19MB5409namp_"

--_000_PH0PR19MB5409AC2F905D67341DDACED2D07A2PH0PR19MB5409namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello everyone.

I'm kinda new on buildroot, I been playing and working with it around for 1=
 week and now, I want to start building.

The last 3 days I was trying to run an AppImage Bundle of a very simple Flu=
tter app in my Rpi4, and I wasn't able to make it run, after adding depende=
ncies, libraries, etc.  I just get:
=3D>  gtk-warning ** cannot open display

So, How can I make it work? o I have to still trying to make it run in this=
 way or should I build the app with Make at the moment of buildroot compile=
?


Thank you,
Franco

--_000_PH0PR19MB5409AC2F905D67341DDACED2D07A2PH0PR19MB5409namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div dir=3D"ltr">Hello ever<span>yone.</span></div>
<div dir=3D"ltr"><span><br>
</span></div>
<div dir=3D"ltr">I'm kinda new on buildroot, I been playing and working wit=
h it around for 1 week and now, I want to start b<span>uilding.</span></div=
>
<div dir=3D"ltr"><span><br>
</span></div>
<div dir=3D"ltr"><span>The last 3 days I was trying to run an AppImage Bund=
le of a very simple Flutter app in my Rpi4, and I wasn't able to make it ru=
n, after adding depen<span>dencies, libraries, etc. &nbsp;I just get:</span=
></span></div>
<div dir=3D"ltr"><span><span>=3D&gt; &nbsp;gtk-warning ** cannot open displ=
ay</span></span></div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr"><span><span>So, How can I make it work? o I have to still =
trying to make it run in this way or should I build the app with Make at th=
e moment of buildroot compile?</span></span></div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr"><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr">Thank you,</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr">Franco</div>
</div>
</body>
</html>

--_000_PH0PR19MB5409AC2F905D67341DDACED2D07A2PH0PR19MB5409namp_--

--===============6517487118194578628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6517487118194578628==--
