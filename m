Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D53C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 16:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4263640AED;
	Sun, 15 May 2022 16:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eySBr2f2TCLx; Sun, 15 May 2022 16:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3149D403E0;
	Sun, 15 May 2022 16:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36AEB1BF282
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 16:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25D1481A6A
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 16:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jackodemononcascadec.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0ZVIqzxFirB for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 16:45:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::617])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E39BF817FF
 for <buildroot@buildroot.org>; Sun, 15 May 2022 16:44:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cow4ZMed5DRkBmGbiBCkC2mEAAtmTLf3A1LRkzH0xMtB2xFUmEsRMPpr4HLLLX946jUNWxZaVp2b7sueq+D9IT29rcaJ1+X5JylHslqdNkQjbN4ehbxIWK6+21x8h1YkyCqjmi9Ig2n9+57UBdZ8Xruto+qvZxPj7LPemndgdKhZZes/rTr0mLxPXIMfIppNuf8FnZacTg6EJqLmbDS+QmHhrqGSC4wituji+vvSmlQyhewyI3id161JPEwSrVdeKDYdeHCH60Ij+3wU5MFrU7MXcz3W3vLM/bIcUOzOj9ylYTtc+iObgt1REWyMtdqDrAX1bAtqw5R8FJ3VoishaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXbpstSU+hGgjnQ4BoGcLRYTQcJWJ5QVgtQ3NJ65M9E=;
 b=lPRvYNnQlz7v3pz1aODh7cjyq3npsu/0D+E8TyZPyAqovYGSx8Hry2lhWOd7KMa3UN4LKIuAl/45eR3YlLr9VoWwQ5PMl6vRvF0n51hlGkXRDb087vT+gtYoCH7CMDrSe9871WF5Y7XSs44ML7E98zbUeo3zoVSYhUprNkj8sp9sn/nOz7QG97U+fhx2scs+yryMCxq0b0vLXuKQ/lVOwvhzLGtqpr6AfovZCqi4lLHwIH4iyrIakKvCuEdgSyR+2zz9+lRVOSEj2LUaAuDCs/1keCVsQbp2wVRwTp3coTWH0NMnKvC7bVtGrbmONEikA1qEhMK9fPkmQsGxiY4czg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thejacksons.uk; dmarc=pass action=none
 header.from=thejacksons.uk; dkim=pass header.d=thejacksons.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXbpstSU+hGgjnQ4BoGcLRYTQcJWJ5QVgtQ3NJ65M9E=;
 b=s0vNxyzV0E200B/oWbjs7M7BpdtGdu7wwwkcUuMkydeTuewREauVMOoSGUoM/JtkyM5qICjtOLsh3UB9WrO8gjQwpONMpsDm6gRUHzjO4QRd1GEKMzQJAxQFA+oAXKhhmqzJ4BmDWgxhQuzljrbZgN4bTVh47pK29gLn4EcTPXI=
Received: from AS8PR02MB8662.eurprd02.prod.outlook.com (2603:10a6:20b:54f::18)
 by PAXPR02MB7936.eurprd02.prod.outlook.com (2603:10a6:102:28f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Sun, 15 May
 2022 16:44:55 +0000
Received: from AS8PR02MB8662.eurprd02.prod.outlook.com
 ([fe80::1cef:2aa7:fa3d:c406]) by AS8PR02MB8662.eurprd02.prod.outlook.com
 ([fe80::1cef:2aa7:fa3d:c406%5]) with mapi id 15.20.5250.018; Sun, 15 May 2022
 16:44:55 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Any way to configure "nano" to use fallbacks instead of
 terminfo/termcap?
Thread-Index: Adhoem+ZaFqgEqGnTxCQZl8tQvfcKg==
Date: Sun, 15 May 2022 16:44:54 +0000
Message-ID: <AS8PR02MB8662F8E3B170B5ED877B6709DACC9@AS8PR02MB8662.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 181ab137-18d9-4ff6-df52-08da36923d5b
x-ms-traffictypediagnostic: PAXPR02MB7936:EE_
x-microsoft-antispam-prvs: <PAXPR02MB793695BCC172539D82D49A94DACC9@PAXPR02MB7936.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dlv0DiSewwv0xRuSihQYwWEUU0hEynGCDCIZ3NnaNqXRDxVpRSg30pD7LeQUqz7MzRaP1571d3CfWeK/41YbGpNii6lqSmC7oqggWYK9qOmacOdy8E8pb8b58w4ipgfEneeS4Qkh2YuijVQIWA7VzBuOYzZemsnddt/JxDsJ4EQzaijRXYeU9tCNMJ79nLQDgXGtdSDLLW00ZjZGoQ4DqF1kq2wAg9BFxT0b5reodjq1j05Chd7fHcsIUMM5DWbyxyRUntntmWkhOld0c+OmdZPszCVPyDcrZHOCOlrAiY5PGNL/JXhEtWhYbv4NL76C5FdioJIX523VwueSd6gSp2vibeN4Z5PJHdxiUZDktQnKrX5F+clRhGXS07gVfndrjPEajdLXsN/+oOO+VjxXSoT1xiQQYaZ3hEIU3/nUPIkAzYskXlqL8rS9KVkNa/49mMN+6X0FiFKOmdNYjm042J1lJZNza6Q2wPKBvPqAFqYYAE+JipoaVVTs6ny8e7KXFS0XQ/l7yJXr5p2sxtxTy/eYz7uQnSbrhydWSa7WcxVHK/Xs7DDntsEVfu2kkt4sELQx01ntqpdZIXw5YMF/R0FYPI8dh9T8w3GqCoUalI24vTNytDh9dV8kJ4arCZeI4XSaEnXLHyCMxCK/UFrnWkpvZEGiXj2p99nTI/NMhk/gd3RgjtqMNxVfeRWWFsy2n6VAglgAD0mE2CgxcwYRuHpDakY/QdDsjXSoPJgNYOxtHPHApaMtqnwmNFyYn7B+AuDhHmYPcgjycY1nVuJ8YTCqvovCcqEs1w9OJvOYwTehiP9be/t3JOO7w30gS05M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR02MB8662.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(136003)(346002)(396003)(376002)(366004)(5660300002)(33656002)(4744005)(86362001)(55016003)(71200400001)(52536014)(26005)(66476007)(66946007)(66556008)(38070700005)(8676002)(41300700001)(64756008)(8936002)(166002)(122000001)(76116006)(6506007)(9686003)(7696005)(66446008)(6916009)(508600001)(66574015)(186003)(38100700002)(316002)(2906002)(83380400001)(43043002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sbnm3ysedRkZnQxB5QbpNxlZkKedMn73Bl0cuJiKVEuYegu1Hwz+EtSKODLv?=
 =?us-ascii?Q?AQZdtf+bNBcVpFEZ27+JIwusj68u5mZwajFG7oSj8lZyGrOSosz7WzwAhZ+D?=
 =?us-ascii?Q?/CM0hstaoLNTBIqhHAAQfiAofyN+BjnV8dd6vJ4h4t5YsUoRzI5ZKyYcGw6C?=
 =?us-ascii?Q?53smDq4G4ggT8UmhTm/hciP1KEXEyIeYKv3GnJnAWCXNZTEOBSbetY5Tw+NW?=
 =?us-ascii?Q?pW/7hVSYChXlHBFBORIiYaTs2njNdtw6jkh/erf8LlysSISW5P66MSq8kGIK?=
 =?us-ascii?Q?PNAthuzKAWq4gOPA4I6N8jv8BEntGNdXyOvSzVoDZekogE/lJu5LZ9/dTWb4?=
 =?us-ascii?Q?QTCj4hrkWE8yEC0go9VDeiNbAaLBxn72mp/JkTRosis5/XCOLB9GSu5f4l6O?=
 =?us-ascii?Q?TexF/ISH7o5/1qkmCjnPaZBH8a7ROsC6op1+9TglVLRSMHd9Fq20f5eUJUBH?=
 =?us-ascii?Q?n1ksd5AgbkvDgRNOTAbEuse/xrGycxTBYKgjImdc/11Eb16irYDobRQkUkzU?=
 =?us-ascii?Q?4uKUGIksmRhhcSGgloQoCurO0DqbZY0xlI0mWohd8wAAU3/mpFggkyehwKa+?=
 =?us-ascii?Q?Uq1Ypu65gUTIlFkTgKlukh/4lRgvoNhQrAlO++oz8xcaw6LimjwzEFpG63L2?=
 =?us-ascii?Q?Fv/LZXwcI8uj9KLodqPRmi2Rc1WcaHs0PL1IWhsfbBeLn7xAn4eFvJkO79ag?=
 =?us-ascii?Q?I+5Yqn6POcFx3cu/mdeWas91H6ZUjeouWbH5uHk63ymQqauzYsLvOkS6THs9?=
 =?us-ascii?Q?ImdNi8yttCD8D3nmVvLsp3XCCNcIxloIz2BPqtra4qqtBkvlJzCNJIYjT1kr?=
 =?us-ascii?Q?4SveaybJGg5alpaYYLtrkFL/yH3a8aAZiJZKebYCAq+2dfVOOiZJo8r23B6p?=
 =?us-ascii?Q?CTMZYfFASGsbkg4SmFeScM6fIRy87dKjsyK9TD6++zoSq8AUOVmHIahpFOJf?=
 =?us-ascii?Q?L2u+qB5q90Q4gjozcUk6GhWQXTOLGC0Nls/AFGKofCCaO7oXsdAX357HcuYJ?=
 =?us-ascii?Q?zAReyyVaSBkDET2yBTeQP5jOxkkT60uBVPQSB1Axytf8HRMdpnrsppPgvuxu?=
 =?us-ascii?Q?DtUN0/J0SFj+Xuag8oXlpc+Hr1PdkSXNRclvti48dgJANqcUoJTlWaWw/3v3?=
 =?us-ascii?Q?KzKFwZXqh0KI3YPVmRc/BmNBJX2aGukkzlORggyC37w2IhVlwg+WFQUkom4M?=
 =?us-ascii?Q?eBD+Qd6LVLgJ5Dj7Flh87OyNOQjnqTBBvQCxBYh8/hbt05dmHTW/1pgWrHw7?=
 =?us-ascii?Q?DFVsK7aHzSiyWg7EMhjsA/yEs9lIsHipp+iC8SBmhzi8PM+hTaIynFE/lYO+?=
 =?us-ascii?Q?86Bpz4Ou2YmumhiP2nxzVCoRQG9MwY3tfe4/reoZOZNyfooubtkK2QAlq/oc?=
 =?us-ascii?Q?9ds9pe7Ttr8fHKLe3ZfTfrDnp5afkEdZiXK9VOnzT/KuYZnudRR8vd1JDSRk?=
 =?us-ascii?Q?b1DoaBjDb/5cdh6A44Ah6H+mMWMDN2xnR9neYK/FUQZTJXrkm4LcHKfhR/WM?=
 =?us-ascii?Q?eDLuYedI41YMXNF4eVz2nq6f08d5c2s1bA/y5UJ2KvrMIhp/kD2ci9DYZ+MT?=
 =?us-ascii?Q?3bfv0PkuNlCb6PkHXCdccDvV1j1bT7IoV7/3i+9QOJM2GgfGAaoOG/AF2OI+?=
 =?us-ascii?Q?FNlaN4A/neyEhlaR9IiECWcIhePf8k+66ErC5eXvj37JJ8Cz7SXNG5IT4F1f?=
 =?us-ascii?Q?famisQpM9m6xxRRxw0I166JO/lHD0YZQP0bwKUGL/WSNXRWd?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB8662.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181ab137-18d9-4ff6-df52-08da36923d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2022 16:44:54.8277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cl/p/Dg1RZP3s/TfN2ELZUUatWPhVSCaRqTijJJhlRCGOvClwxq7fmk6N8aeqqaiAl4PFJLJeGI00Xqh/cyIiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7936
Subject: [Buildroot] Any way to configure "nano" to use fallbacks instead of
 terminfo/termcap?
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
Content-Type: multipart/mixed; boundary="===============3601739544940799753=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3601739544940799753==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8PR02MB8662F8E3B170B5ED877B6709DACC9AS8PR02MB8662eurp_"

--_000_AS8PR02MB8662F8E3B170B5ED877B6709DACC9AS8PR02MB8662eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there a way to enable the configuration options "--disable-database" and=
 "--with-fallbacks" for the "nano" package?

I built a "nano" binary using buildroot to make my exploration of my intern=
et router a little easier, however when trying to use it I get an "Error op=
ening terminal" message. I found a Stackoverflow post (https://stackoverflo=
w.com/questions/53320009/error-opening-terminal-vt100-while-running-a-binar=
y-with-ncurses-on-arm) that suggests I need to build "nano" using the above=
-mentioned options so that terminal information is baked-in to the nano bin=
ary instead of it trying to read that from disk.

However I don't see an obvious way to do this from buildroot's menuconfig?

Thanks,
Dan Jackson.

--_000_AS8PR02MB8662F8E3B170B5ED877B6709DACC9AS8PR02MB8662eurp_
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
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Is there a way to enable the configuration options &=
#8220;--disable-database&#8221; and &#8220;--with-fallbacks&#8221; for the =
&#8220;nano&#8221; package?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I built a &#8220;nano&#8221; binary using buildroot =
to make my exploration of my internet router a little easier, however when =
trying to use it I get an &#8220;Error opening terminal&#8221; message. I f=
ound a Stackoverflow post (<a href=3D"https://stackoverflow.com/questions/5=
3320009/error-opening-terminal-vt100-while-running-a-binary-with-ncurses-on=
-arm">https://stackoverflow.com/questions/53320009/error-opening-terminal-v=
t100-while-running-a-binary-with-ncurses-on-arm</a>)
 that suggests I need to build &#8220;nano&#8221; using the above-mentioned=
 options so that terminal information is baked-in to the nano binary instea=
d of it trying to read that from disk.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However I don&#8217;t see an obvious way to do this =
from buildroot&#8217;s menuconfig?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Dan Jackson.<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS8PR02MB8662F8E3B170B5ED877B6709DACC9AS8PR02MB8662eurp_--

--===============3601739544940799753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3601739544940799753==--
