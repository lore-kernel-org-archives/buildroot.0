Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28559C38145
	for <buildroot@archiver.kernel.org>; Fri,  2 Sep 2022 14:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84F4360E07;
	Fri,  2 Sep 2022 14:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84F4360E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVBPZOqTFflF; Fri,  2 Sep 2022 14:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E6CF60B3B;
	Fri,  2 Sep 2022 14:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6CF60B3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 415101BF2B8
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 14:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 233B08132E
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 14:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233B08132E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F34bgYHFx-zP for <buildroot@lists.busybox.net>;
 Fri,  2 Sep 2022 14:21:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F125381279
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04olkn2065.outbound.protection.outlook.com [40.92.47.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F125381279
 for <buildroot@buildroot.org>; Fri,  2 Sep 2022 14:21:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsB8ugo1JQWlpZcpRVQBGwbkjO4xjGULbyNSJviS9VCVwhe9EDDrZmU2xmane8/Ysr9fuHIVvLmQLa+R8qu7RB6+25jRX0mWxLLwpWyOO9JPBhII5axMi4ajsEfrbccSrgAzLZl0zN+tKb9VvlbFdVlqLEzq3AU2KzHzC9j7IOva7Ba2Qe7G65SgjawCg7ZMhOqpyiZD2PsCzSj+Nrwse223jCLt9PP4v9ZP6hvbnz1iHIF5P6VAQFf+fxphW8XPdlcbrWyQ6k2C+x9GQW/wZEujgaVJNzmaeO7KIiLMdYLDMGNeWOZBlcqrpke6kTh1MwXIDr8el42GnieIwkLXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqocVDV4nh/ZpGDEcOYFRJmDwYFuxaCViqlMi+5s9DM=;
 b=Sv9O+rESfWLhEJCVZ/cWL6ULpQcT0OBR9QuTtzBTG/+bwjpGhqI1RcW+8+kBKGlLjLGR0f+LgXaSyS5obglB4Hmpk+k8JGpQ2+odlDxHGcaXQbjpbdeDMR+Feo8DUygVphvJ8RXCLA1/KzM9FBIJnI7OFz9NR5n8fBMQsskVFStGh2o2Nnu4EQ3CSV6t9R74Rp47JuTjwKTsvS3d/2Ptu/4bGfS0ZoZ5DTikXoQpjVsCPYeXM/lW4+LOv1+HsDkTDASJzqdaW8ODzGNb4WbknnKOqwULOL5AbeHAcVC8THXA2i99CWWvPI6Obd3haPMPvsnx17zpOrH/QFnSs/w4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CH2PR22MB1879.namprd22.prod.outlook.com (2603:10b6:610:85::16)
 by CH2PR22MB1813.namprd22.prod.outlook.com (2603:10b6:610:87::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 14:21:45 +0000
Received: from CH2PR22MB1879.namprd22.prod.outlook.com
 ([fe80::696c:1326:cf7f:f236]) by CH2PR22MB1879.namprd22.prod.outlook.com
 ([fe80::696c:1326:cf7f:f236%6]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 14:21:45 +0000
From: Alex Roberts <alex.roberts109@outlook.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Re: [Buildroot] [Aarch64] libstdc++ segfault at end of execution
Thread-Index: Adi+1yNFqR/48+RCSPqaUTRVhMbsGQ==
Date: Fri, 2 Sep 2022 14:21:44 +0000
Message-ID: <CH2PR22MB18791E063C503AAD163BBD06B57A9@CH2PR22MB1879.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [zG+t90qoR+AM5mw/TUgtU2yd3D0RwAJU]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 403c5d64-26dc-4a70-b417-08da8cee76dc
x-ms-traffictypediagnostic: CH2PR22MB1813:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bD8o2bmWa1NemoY8b6CB3rSPKsoxE2UiPjHI7qfRP1o9n+2+wO1lESBOvbwhD6IUNAlqSdjIwQ7mz8rBmkRH5S6/Q2rrxOyDgoJyjKbWDaIh+HP8uJNd5vbshpe6wuYkY6DDpo+kUaqKSOfJkK/1dqSWE0j0xsv7yJzAZzRkBIMfZbyn5AMPMkeTK2z1Q51vIIrvbzL0HlGADU9a/bTEAeTRtOXj2a0rUDRWFgpW0dSgcuoHw2wBib5Ol+9/Y/bPaDR/GZ7+SDhRiYvdMVm/MjZI9+HOOt1xaA62kSGqbqpSAjlvVr/35/xNx9sF8wnwk//YbcYmLuFJNRGc/6vXLGYnOhiRrc+XPLWJJdpexqZI/flrGANTFIx1oIUXXRpBWhpJC/DYrQOO4ieRfWgDq8AIGw+FFx2QQlOHcFP9naOW2SDdzKute2dCxn4z0GbOvDRVYd5tuy4e6ufhsaDSONNxyz1z5eLDUOr2/8rvc6GHKQFBVIIFH+Luvsr3dFTZ/pm2pQPjc1ZtYEyU/E0sUV8qqiOT8n/EOqPjZgNshuetxt9i4EMX24DF52RzNckTqs3DxOUCnO3uQmWkNiCfq3VRGk+eoKOzeZ+9Q+PMsNuBmMugMSX5Vb4cMeBeX77hB0T2B8Pn+wToKmyn/QChszIrDzJXR++atbIUhCwgHLiEI5bjtWdEJ+3yBKO+Gt3E
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tzib6hBNY1UUv0doWlYips64SJCqOUwgoGmC3P2Cp4+hsvaWs54gNkFHtArO?=
 =?us-ascii?Q?dKS4u3I0roxznSewuLtCHsPn5FAMuQEkOyYq0GuGN6sJENiPtZCEZ2svycxT?=
 =?us-ascii?Q?5dXIEfKvRhA/ZzNvBBxtCTBUR0rIX/5dtS2c1t6Hx9SYLBXvjLedWLQ6Wuku?=
 =?us-ascii?Q?TO4OHl8PqDGE5HOAsK5KVGqUt2BhR8nRUQCOLhXQlTfNmgTFY6x5doEDUxLZ?=
 =?us-ascii?Q?3meYnQMqr8QeWp3izh2QrKlVfCnYgCtQjNWT2cgxgHcn6gUGRCZxcZde/met?=
 =?us-ascii?Q?ePms5psEHzXfuQqFF8wS8ughg1gKTz7R0c+HPk1IjW5Yi9PQ1z21xGRomhoE?=
 =?us-ascii?Q?acx4E/8BzUkPrWdCGCbWSwt+h6abVWKchWxw4dSjq+aqWBoENoDVrGappTiN?=
 =?us-ascii?Q?e75v8nxu7V7371nrDW4KY/qdQ/DoLzWYHHU1ikUoy6NbD6nc7Q5P5aV+IGxw?=
 =?us-ascii?Q?mt05B6u8qTgIYPrP3wBWbNCYGq7woKyb5UCaRMmAJm8fALGrJEDCySMfe3AA?=
 =?us-ascii?Q?Xrtqp5AAZnval01V2Aj5laupRVVMd5gDX9Uv6KoCq9do3n6HLxHAnujjbTVX?=
 =?us-ascii?Q?vIqROamaiZiQRIYdCFINUeexG4MA6oqIRjhhVZUtug1boj8BJnlvmg1O+tTh?=
 =?us-ascii?Q?WHBISMtTxnEdRIVY5k/iInbJayplkxfNeViQdbBAI2PjkKL3cguwkeT8vE+c?=
 =?us-ascii?Q?7GqGxK6VTRzBc3bIsLXY3EYz279Vzrr0hTVEPwWtWCwbuY8Hau7OPczoJx12?=
 =?us-ascii?Q?zrUapqbT+MmTzRdWoHfde0xpzyCDeSVqfspmj5M5gJvVFbJoxjGqyYMtDLE0?=
 =?us-ascii?Q?rXC3a3u2oL8S+5bJlntq6ZdbmUY2XriorFi7NnTDTV0uL+AXV16EYbRRdLIf?=
 =?us-ascii?Q?BvSh1QqIkWUxYIvr1YfWpfRkTWD5hoAGiiJJPZ87zyqb5lZWzaPV6tBBDUUC?=
 =?us-ascii?Q?9V0E7o0J7hf45oeNJdUTmkzwwVDu/UDXd+OYXAeSyYIqTr8AdH6cOBHghnum?=
 =?us-ascii?Q?RBtzroxjh1OPDLV2f8hWR8JszhhX6Yjis9VF6FFQM/+Q1KUSm8ly2D32u5op?=
 =?us-ascii?Q?OWh8MoQNQcvOtoeD4l2YKCu9qcFmYJ8/5V3b4kHJYyGi8MjyYoXi/23jDXez?=
 =?us-ascii?Q?xuzHza7rCutMIa8Rad+zy8EbkXYafaRyxF6bRrGFoLqh/JTcTqI3XU0hJdAn?=
 =?us-ascii?Q?iEd42cyT6pdp9kYCwTMKOvKYmjERUVdRKEnHIY/ijGi+UlR1pMBhH302lGr7?=
 =?us-ascii?Q?yOxiZrnfMZO9jAEeCy8fgp15oDQ6QflK78MOQnIQWg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR22MB1879.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 403c5d64-26dc-4a70-b417-08da8cee76dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 14:21:45.0002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR22MB1813
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqocVDV4nh/ZpGDEcOYFRJmDwYFuxaCViqlMi+5s9DM=;
 b=D/6KSKpYoZKV+IxbqrhPIs53UMpsOzKsaYmhZDlAF3m4R2jCeY195XBveMzbRFo1kXuiHUUfBDMPeUt5KLbbFZb9DNe8yW6t7fvRDwnehPG1febdPLna+Jyma6PgtoJ+HHug2FmGgofVwTrvSTFnOI8coI1VqVXEsGDHRPcXV5Hu6qkIuCx5oNv3JlY56fVQ0c4YufIOI+GMneILcDj6+CcKhQQS2PpoYmx3YWk6a9d5jG4lG6RRuN37pz/DWlmKw0FfNxKYMoZCbLfc0li0g69oJlgj5VJ35uyN2mmOUk2NhKHlGvw2bwKh4tA9NE8JlsTP77//P19QWoAOEqiQAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=D/6KSKpY
Subject: Re: [Buildroot] [Aarch64] libstdc++ segfault at end of execution
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
Content-Type: multipart/mixed; boundary="===============8385096140215502100=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8385096140215502100==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH2PR22MB18791E063C503AAD163BBD06B57A9CH2PR22MB1879namp_"

--_000_CH2PR22MB18791E063C503AAD163BBD06B57A9CH2PR22MB1879namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Lance,

> I'm having segfaulting issues with c++ on aarch64 using uclibc-ng.
> Anyone else using aarch64 with uclibc-ng?
> I submitted a bug to gcc so am linking that here for this description.
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106581

I have been struggling to understand why I kept getting segfaults with a si=
mple helloworld test until I found your bugzilla link. I recently created a=
 stackoverflow post after a couple months or so of web searching and frustr=
ation.

https://stackoverflow.com/questions/73393107/segfault-when-writing-to-cerr-=
iostream-uclibc-ng-unhandled-exception

Linking against -static-libstdc++ worked as a work-around.

Buildroot 2022.05-rc2
GCC 11.3.0
uClibc 1.0.41


--_000_CH2PR22MB18791E063C503AAD163BBD06B57A9CH2PR22MB1879namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#222222;background:white">Hi Lance,</span><span =
style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#2=
22222"><br>
<br>
<span style=3D"background:white">&gt; I'm having segfaulting issues with c+=
+ on aarch64 using uclibc-ng.</span><br>
<span style=3D"background:white">&gt; Anyone else using aarch64 with uclibc=
-ng?</span><br>
<span style=3D"background:white">&gt; I submitted a bug to gcc so am linkin=
g that here for this description.</span><br>
<span style=3D"background:white">&gt;&nbsp;</span></span><a href=3D"https:/=
/gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106581" target=3D"_blank"><span sty=
le=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155=
CC;background:white">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106581<=
/span></a><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,san=
s-serif;color:#222222"><br>
<br>
<span style=3D"background:white">I have been struggling to understand why I=
 kept getting segfaults with a simple helloworld test until I found your bu=
gzilla link. I recently created a stackoverflow post after a couple months =
or so of web searching and frustration.</span></span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#222222"><br>
<a href=3D"https://stackoverflow.com/questions/73393107/segfault-when-writi=
ng-to-cerr-iostream-uclibc-ng-unhandled-exception" target=3D"_blank"><span =
style=3D"color:#1155CC">https://stackoverflow.com/questions/73393107/segfau=
lt-when-writing-to-cerr-iostream-uclibc-ng-unhandled-exception</span></a><b=
r>
<br>
Linking against -static-libstdc++ worked as a work-around.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#222222"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#222222">Buildroot&nb=
sp;2022.05-rc2<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#222222">GCC 11.3.0<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#222222">uClibc 1.0.4=
1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CH2PR22MB18791E063C503AAD163BBD06B57A9CH2PR22MB1879namp_--

--===============8385096140215502100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8385096140215502100==--
