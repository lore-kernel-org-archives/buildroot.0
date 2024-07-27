Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CB1C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 08:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C7DE605F0;
	Sat, 27 Jul 2024 08:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_AduASloKhV; Sat, 27 Jul 2024 08:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6498860640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6498860640;
	Sat, 27 Jul 2024 08:05:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66C001BF855
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 08:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53C8F4029B
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 08:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSDyPIPfy-X3 for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 08:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2c16::801;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=fran.millocs@live.com.ar; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7EEC40274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7EEC40274
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c16::801])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7EEC40274
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 08:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGGfmC4j3D/7A7dGOVI9lP6GewTtlnjB3ClGT3o/ETjWLIlGK91BPw2x7XuYma2iTccutYL9ZncQKu3iDP7su+J1f5wl/5gYWuTjDNeqMNtmfzee9PzcWwzU2QEqKmcpXIbD0K2hrPErqk2/kWqIYAkcYEAzlo/8Rq5LhIZ51o4h3twFv88x1gA512RxU4koWF+KmTpRhBB96KBUzSyspXWsKHG3M8W/AcoOHaPRqO+Vx3m+0sRhpU+a8rAsF8XXoYQOfwiujQaXkSluo8s/4WAeoIHHw36A2kva7N+Kp8TOzBVSq7LknJDuVozM075v3HeLd9807t1PxC73bIeE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qN4+tleLpvp77b5tJL9RhUEM4ixJQI2XrECaigitYSk=;
 b=ISfot0M04EDlCktwbqqyBg21D0YSe473HdSzL0xvUgBlO49cAvure+LpWXKwYd2O/jMsqhqjiEizvN/uQNSfQTzZGe5DuXYVrgexJAsByZpWYoH/Mz7NIhCyD9ExvY6hX29snu0kRHfx1LmvyT6CB5KJ/SeBVTSs1E/uRTuH9XPOLJZpTpW6muOTrJWHVmrwGnqBGeK/LOvw9KbGrH+WgQNiFm2jlYUHO+QghJg6JkpzRJ4VemocG7j12x00PQCwyuhZ3pLE+T5cCAWgOSKJuDA/KgH9Zp29tQS7M2ngjarvfleS5kpzXfevtUlN9vbVnLiCizwN+qixD24popqs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR19MB5415.namprd19.prod.outlook.com (2603:10b6:a03:3e2::13)
 by LV3PR19MB8478.namprd19.prod.outlook.com (2603:10b6:408:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sat, 27 Jul
 2024 08:05:26 +0000
Received: from SJ0PR19MB5415.namprd19.prod.outlook.com
 ([fe80::18f5:fae2:13af:d724]) by SJ0PR19MB5415.namprd19.prod.outlook.com
 ([fe80::18f5:fae2:13af:d724%5]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 08:05:26 +0000
From: franco ariel <fran.millocs@live.com.ar>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Thread-Topic: [HELP] Needed with Downstream Kernel and U-Boot Compilation for
 Khadas VIM3
Thread-Index: AQHa3/ua2WCdElqOwEeVI5VgkMLezA==
Date: Sat, 27 Jul 2024 08:05:26 +0000
Message-ID: <SJ0PR19MB54157D4CF26D0AAB3D719D54D0B52@SJ0PR19MB5415.namprd19.prod.outlook.com>
Accept-Language: es-AR, en-US
Content-Language: es-AR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [58BDGUKS1W3rRUA5U+lfB9AHIsMEIv+x]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR19MB5415:EE_|LV3PR19MB8478:EE_
x-ms-office365-filtering-correlation-id: 46f4ea6d-1ba1-415f-a8bf-08dcae12df86
x-ms-exchange-slblob-mailprops: Cq7lScuPrnpXB0xcNeDVdJIgd0h0Wm5oHRIVjM5PMWVuligCxyFtw7vsHYiofWeiJB1eXhRfz6sk/mjbooLLPz7VGWkJW0t8kgG+b/LzKnDGrGVc+Q2j2d7gihsrwPP9+n3P4pzCee4ZYHvraLcu6KymWvBsmk/RnPRNCXOClLyX21NxegCE7nE7pzKjtRV4CYJ3DqK8K4r0xtttkE5FIBH45iyYEKYMcq6MNAzRzo5lNf9KC0pJfdiQU6nX2zipgZBMzcWNjBsrlAOQun2gwIFIg7lP0Q1/7pMEGrFKJRNSHOVtdabGhwbCCYoF+U5IgW+D8vzTY8EQ3Mfp5sXYBM8+q9njhoF67w0V+10jf/DFKCqkr/plSgcnQiGzZJcYQLJNNbRQQSdyI8cGWYYm4+ATI38vLwQewDm92I9nncH2vn3txcOG5cAlwbufdBN7MsXDVJ7WFGbkI5qJsjEaBa8w4Dh/RQvLSDFVdJej0GMRAvlnjtJobECTFO0xB7uno9QWN47MOw6tXcIe/LL0XYtFUvFR90MA1B0/mcJPqTFyXtnok6QD8rts8J9dwp0u/tJE2Q/WlEHtebMUYG5soCQ1q3rTAWhbU4rZle+OyoYS15oCC07RYqNb+OII5+WHJ9U2WEUU+U5mAtjyYFlhscw6nwHJXmXoormdkz0r/UIlXZA5COAheov70qFQdkQelg6ppJioWmwFUkVGeklLpBnVvdw3VYe55sYgLIPsXpXnODa4vPGzEbRFs3Bzh+iV9yKwN9daOr8=
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|9400799024|12050799009|15030799003|461199028|19110799003|1602099012|440099028|4302099013|3412199025|102099032;
x-microsoft-antispam-message-info: pjmjLM8H1vq9B+pViIZJ6HbmJ+sMtPUNnN+qf9+4u0LE1p02iehEcSB0uD12S0/vuqbnOnBmvaj8IsarylZIR1+1MoRBUdaX9Avh1y8aWfGS82Sy5NojasM4xoIzmdTQVh8gjzbfT0ZynHFdnpVzsnI9jBQdJ/CfQE419qL21jLP1u5oLr2CxY3C1kVC5t625sXjq9W9UrETM9OdeLWwyWpz3eL29o3bJHgaIEbLU8qUn+ZPkrRXlCrzTQwHkk+BR/zVV3rRFQBTVgKtdWpTRndjRmmfep0orLvseQE/4C1gwebIDcerywywAsRQgx4Q07/eOFfOLltVt0dX5z0+zc6ZbE9UtH29h7Ulyve5TRPxChiMSAge/8o4JwrUHTCYfaapANh+vXiRA8+bpFAtZ89YGcsaHttdY22TtN56Jg630hbkHjR3EL+F8tFMTSCbjiM2xcnLkwsRiDm483chak10qiACb0j8J1+T2bOZkQdoSEizay8fQIm7PqwE8oZm1I3Csh0lzteNtezuLnvKnjjFkFks5lR4FxkirhWe3amOaeKZf1r1uO4Veo30abDn2sLvjpH0/frD1+x942QniHtO+HZ3Lc82PxQzxalHUp2XXshduOTVoTV2X5BKejKW9DNTr98sDBdsgIdScIVnjaET7YV3qaSpImdiP6A/pibMfhbyZaZrleN0uVvPhSVwjKHSCwazP/n8Mq1x39dlHpwa90Cil4dhRA4jvCe5z/oSXsFOuXDwBsMh0hLgrhm09E/uJ6oCwzuA23mP8YTSlsnsNMFGk0qnxDdVHr+YSMlVFi9S6/mZ4epmljkzklepJ+4f1mJhnczUpx8Sa/g8mOmi2bHoZ7o1MkFU1spyJUw=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?y2uesTvd14y6NrLTdiyeHxG9KSbD7GS6vGFBspSa9TmfeQU0z8FGAoolwc?=
 =?iso-8859-1?Q?fpsZQap52ST7x9U+RO6TTWGJ99FjfTjuYI4UtOiQ8BK5SUk4JOO7aqLo3m?=
 =?iso-8859-1?Q?LTRWyNVwRVc5ajH+Wd02174O0dLz7RfPvdsRoxtUskbISd8NQh0H97ir6G?=
 =?iso-8859-1?Q?nmnwCRfbm6dpKv1eH01Wx1k5fRcCJRLKXu3w5lffhupENiQvUegDZhIDLI?=
 =?iso-8859-1?Q?+LTfY9CXOXudB9OJvV9eg3WUl8wnLXX7oZ6aHuT5I4v0Eu33T/hpfRGDTb?=
 =?iso-8859-1?Q?rQaPeEbL4kRoB41xASen9dd5KnP46tSbQ9vbblBPJSdbnPFza92zzWMjqw?=
 =?iso-8859-1?Q?wudy0gVhi0RJmlAHHLPCWxV76bTAJRQTSWuZs7lNsqxzp/UbS5DDVkU6gG?=
 =?iso-8859-1?Q?6vWiow0WLTmaamFmrFY8Y2ZMKGh2Ev472w5aSL67oK/RSFZuWXJSynKsqz?=
 =?iso-8859-1?Q?bJAYYF0FQkmzOiS4ZYwqnAiyfqqBCnp5drMg91vUWr28yL218ZoAB1tCRs?=
 =?iso-8859-1?Q?YtQo5WJEHr2N6qqXE7c6EXbKR67KRoRIyGrQjrqgCxGq34tJ0sl+WEFNtq?=
 =?iso-8859-1?Q?8g4eMvI7fROlLXygCBr7GZ4O7ZUnhzNG+euc8Ck8fcsIBw69JqzmDAQ0BY?=
 =?iso-8859-1?Q?1Ua+SZMVt+l+uMe7TbXSQZbDYku8HT6/oqA2tinrkWwyvSFbLSJnXVqaOZ?=
 =?iso-8859-1?Q?db9HfN9DlU7R56zM2pVgFFBDPjrfmZ42ALIIQX4Wnt3KY6d9esEObatC7M?=
 =?iso-8859-1?Q?vIA9POn3AxFJ//gHI4FWO8Rp3RWn+4GV0BO9Uy1T3I1kk1G7ezvhDW/YM9?=
 =?iso-8859-1?Q?BYwsVxRXYfhjULmn0PPi72dmOZYFwcCdG7QBJKyFH1QaDRsLrUFyDOpurt?=
 =?iso-8859-1?Q?2jSgCVeZeJaCNLimmVLU/dwQmET42HEgX0t5O1FPlfkhqDMtBThBqt0QzP?=
 =?iso-8859-1?Q?8Os/jmUkS0oY34TNvVLT3419MK52PXMoTOM8ubxi3plgBgBj+vAsXq8+ph?=
 =?iso-8859-1?Q?kr9UgXYIdKJocW2OHhmqxxOhGFXQDEGu4F+8oIfzyVtyQ30aY/rCvnE0yJ?=
 =?iso-8859-1?Q?EoJhqGP4cwqKHz/eboUMNsou5ch38XeybJc31szduDz/i2IM1TJZFfBNNl?=
 =?iso-8859-1?Q?WGj5xj/oAAsqOd3s7nxcvi3+hZnQ31yY61ZQZfVWaUO0T5J3q3x11i5/Mv?=
 =?iso-8859-1?Q?NEqAm5+DLxtBinu2dS8RuJEM89bVKBwe8IQyQecqua9yJ7YfJ21Pe9ukfG?=
 =?iso-8859-1?Q?Ne+lE+fUpe5kG7EV0Dcx/Kyb8T6g53XNaVf0tId1k=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7741-18-msonline-outlook-c907d.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB5415.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f4ea6d-1ba1-415f-a8bf-08dcae12df86
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2024 08:05:26.2536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8478
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LIVE.COM.AR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN4+tleLpvp77b5tJL9RhUEM4ixJQI2XrECaigitYSk=;
 b=ktch5+sOtQPqLCyFFtafHhjaKqVs1FYKPOCnMNnmSo6Eui7ehVUXx9mcgAislhrSfnmXCZRCwKAbLyXNFddc10w3z7WbyMYzq05n+xOI8W06QjCafxj83rBh998wBIws+BCPrtEqd9hOrdT118FHQVihIFs8UfhLNzmunRIHKsrWPUekZNDXYhZXqzW6nwcbXHIT6eIUjwTPIyaw08PDBkWstiicy3GVpsmEBbi9McVBEqtD+bbJtlL03wtCtN8Woxj8X/+ZkeUXZ3GjbWdeRXSsPBQ018jSp25DZ+p0drGXwx5jG+46RVGHt7GBnfcpzhUquQc+/kCUKbDjLHiX0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com.ar
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=LIVE.COM.AR header.i=@LIVE.COM.AR header.a=rsa-sha256
 header.s=selector1 header.b=ktch5+sO
Subject: [Buildroot] [HELP] Needed with Downstream Kernel and U-Boot
 Compilation for Khadas VIM3
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
Content-Type: multipart/mixed; boundary="===============2148697442829199092=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2148697442829199092==
Content-Language: es-AR
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR19MB54157D4CF26D0AAB3D719D54D0B52SJ0PR19MB5415namp_"

--_000_SJ0PR19MB54157D4CF26D0AAB3D719D54D0B52SJ0PR19MB5415namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone,
I am seeking help with building a downstream kernel and U-Boot for the Khad=
as VIM3. Specifically, I am attempting to compile the following repositorie=
s and branches:

  *   Kernel: (https://github.com/khadas/linux.git) khadas-vims-5.4.y<https=
://github.com/khadas/linux.git> branch
  *   U-Boot: (https://github.com/khadas/u-boot.git)  khadas-vims-v2015.01<=
https://github.com/khadas/u-boot.git> branch

The primary reason for this endeavor is the lack of support for suspend to =
RAM and resume in the mainline kernel. I have noticed that the Khadas kerne=
l includes the "AMLOGIC_GX_SUSPEND" option, which facilitates suspend compa=
tibility.
Any guidance or assistance on this matter would be greatly appreciated.
Thank you!


--_000_SJ0PR19MB54157D4CF26D0AAB3D719D54D0B52SJ0PR19MB5415namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
Hi everyone,</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I am seeking help with building a downstream kernel and U-Boot for the Khad=
as VIM3. Specifically, I am attempting to compile the following repositorie=
s and branches:</div>
<ul>
<li style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; =
color: rgb(0, 0, 0);">
Kernel: (<a href=3D"https://github.com/khadas/linux.git" id=3D"LPlnk" class=
=3D"OWAAutoLink">https://github.com/khadas/linux.git</a>)
<a href=3D"https://github.com/khadas/linux.git" target=3D"_new" id=3D"OWAfc=
4a354b-58bf-603f-f420-b19c10d862b8" class=3D"OWAAutoLink" rel=3D"noreferrer=
">
khadas-vims-5.4.y</a>&nbsp;branch</li><li style=3D"font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
U-Boot: (<a href=3D"https://github.com/khadas/u-boot.git" id=3D"LPlnk152763=
" class=3D"OWAAutoLink">https://github.com/khadas/u-boot.git</a>) &nbsp;<a =
href=3D"https://github.com/khadas/u-boot.git" target=3D"_new" id=3D"OWA360b=
10ca-2a08-47de-f4ef-949d9231247c" class=3D"OWAAutoLink" rel=3D"noreferrer">=
khadas-vims-v2015.01</a>&nbsp;branch</li></ul>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
The primary reason for this endeavor is the lack of support for suspend to =
RAM and resume in the mainline kernel. I have noticed that the Khadas kerne=
l includes the &quot;AMLOGIC_GX_SUSPEND&quot; option, which facilitates sus=
pend compatibility.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Any guidance or assistance on this matter would be greatly appreciated.</di=
v>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you!</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_SJ0PR19MB54157D4CF26D0AAB3D719D54D0B52SJ0PR19MB5415namp_--

--===============2148697442829199092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2148697442829199092==--
