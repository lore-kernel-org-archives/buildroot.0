Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37603C001B0
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 23:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26C5183BEF;
	Wed, 12 Jul 2023 23:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C5183BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjOfgv_xc6fc; Wed, 12 Jul 2023 23:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C46B83BFA;
	Wed, 12 Jul 2023 23:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C46B83BFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6DA1BF48B
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 23:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 250AF41C48
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 23:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 250AF41C48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKofpJsgju-4 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 23:01:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A457F41C2D
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7004::720])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A457F41C2D
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 23:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQveGI57lIoQn4/CZiOJ7aiArIdTvHurhL3uqufspf98Exne7GJKasvu+2vA+wMq5BTYP/Dt3eq3mnUxUSo2vW1Y6J9DR7mHjRYwhRp7QZ+EafLLnM48F8PKX0jQQOGRGCav7i54MUmWDO4dCRgFRCsFLOqiYE1N+kBeUgiAkwEEyTNk+H8GHwChd6L5uFv7WPGkC0Ss5QfrWTcOICvz3TOjVXDvRWYpI+p1ZUWLNy/S6FyEzBld3BbV5vxuGN047sRH5Sj+CZwaK/HlavHGsaxMC5m6QymX7rIH1tL/KLbQimcVWyrdzRvZLBOeUznbAC/cH98KDjiqZMiagj95eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7T28rUqYf15OfEZSfom8JCsDGrGewYKCiHAm1giVjj4=;
 b=FxMo2q5EtWCRm7fvakCWlS3eT+LT/RS6CNYkGDLw9q7O4Pfk4ujyqiTUuoaVzgl4gOAG7+H+i+tPiPycf8bryvO2+UCxuHXRtIc1KguRWzK1/v5/Y8NaaWIoltmeP9/fX1bLddYvHhZWtt5vSF6AvAauwQ3zKTapx4DtZB6MKMfAEbFtGOz2EKuj4albPeePT1TdahQVjFSRvHpAg6c3v5qCESfqfCrVqqTTLx0I3qffticpuU9l87fgVLmgb1dfHHLPPngCqdXyrVD+GR96S65+AbSZ5/hRXqyl/puMrfkfXxH8pWQh3mBpFwDAvxDnDzD45c6u1lZ7doW2/+9TtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 SYBPR01MB5487.ausprd01.prod.outlook.com (2603:10c6:10:e3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22; Wed, 12 Jul 2023 23:00:52 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::de9c:f573:4958:5355]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::de9c:f573:4958:5355%4]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 23:00:52 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Accessing environment variables in Config.in
Thread-Index: Adm1FJs2re7VV7JjRO6XX6qK+Vym4g==
Date: Wed, 12 Jul 2023 23:00:52 +0000
Message-ID: <SY2PR01MB27786466E6AB5D0D52F21CDB9436A@SY2PR01MB2778.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|SYBPR01MB5487:EE_
x-ms-office365-filtering-correlation-id: 921bbcc5-3dcd-497a-b278-08db832bd754
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y5CTvR8aHVqIUdr4uuJlRiv/NUdbhlYZVNmRQMKY++8ge18aMFqE7lCBeFL6F9Z5HvW5endAoIbdJHdvT1hKfxscvjq6VrJw31QBIWjgwSjJg88th+UEtQVRz2fP/PNQj6suWnKq/wp5OKMv8ibtFDmxFwPLffVp8rCFJmSPiH6XhJf5j13Oo/KE7SNKT5FkypVqBCY5y0z+jAiOhaykUJPYkbjJyIpDMRSIp2OLr+g2adWP1yqs05oLhOWODPI7WOlh6Z3y7rew8P5dwR6+d1iGldVal4fTEyMf7VtHcbJEbtjmeiMOFgliF5CM1znPSaCMMFmwnqxcSeqnSPxZ1g0kyh4kdx0NI85WVH2SJalNyCM3pS+TvrNgfFCNcaL8xyWtrMejkAQJ2x88S1yrOAlNkojpdOjMC3ckzwBEPG4d7UAc55LE3Qo9M/9MdPws8fXSBJNBQoEO+fZlxfTlP7lPpS+joBtSJfnOMkcdXP3RmY8kwEfXvp+jgVwR/m6Db9xY9w57UIddo5tBsRldKSaFYxJ9jWJAYdbCX9SgTi540hITknRUMQhoR7Z6UJlk+viqUhfB1ajS3V/CFspLT5Ty2n8qUn5UsKvfAdIx6SarypFoDpZidtlow55w0n4j
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(451199021)(4744005)(2906002)(41300700001)(83380400001)(55016003)(52536014)(5660300002)(9686003)(26005)(6506007)(186003)(8936002)(8676002)(122000001)(7696005)(66476007)(76116006)(66946007)(64756008)(66446008)(66556008)(6916009)(86362001)(71200400001)(478600001)(38070700005)(38100700002)(316002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HeEFZIrZz6ihslP2al9Pj1X2ijd075yNJz4vZgFXlViDWt4cFDGuA2wOZY2W?=
 =?us-ascii?Q?8rRyZDLSHSYallTiVKPG1BUcMzzBrr26Uq4OW9RsAudMw9XBaC9U/n1ehhmZ?=
 =?us-ascii?Q?8dfgui1zxfPGhZPUw7X1ywes52kxV16OwNH02f8IcLRV0yE9FZgPOjN2njWR?=
 =?us-ascii?Q?c71tHzgk/gyb350wbQhhN7Mh+G90sIhCEHLipCnPs6Q1DQC40gUDgda1WCKz?=
 =?us-ascii?Q?mrzvLRahzyNpq8k38cp0nvhewE2a/12S92tR5AjaejAJYR8SutrHcTOFyDFp?=
 =?us-ascii?Q?4yY8VPfz4P18jJ9Sl/CX9Ojf5uMPJlCiKDvOJas5yBeiTH5im0oqIQh6RS04?=
 =?us-ascii?Q?bng676ZplhDDpIVaHdxpCxgDidpxEPIUb2QD67uNc6enDnKcZ1ZvQtnJ0jPv?=
 =?us-ascii?Q?vIuTuxq2/0nntC7A1v2eGNWEXlJdFDdhsKs3FuLz3pXkPjrfYGkUVwhgKvKy?=
 =?us-ascii?Q?0YVJhrUKS5BWNs1NtzUlCNv7z8nMiuVLwA8T3VPIwnJOD7MP6DE17mVhiN9I?=
 =?us-ascii?Q?FCe25aVJ4WLUHiYWT6I3gHU8JvX+IVl8jfRWW/pS5z2OkHQJfUvid6QuZt8V?=
 =?us-ascii?Q?ykkhn6aADuUzsfQCUC6+Ew6rphGeFAwxR/a3779attj5os8J4hTK2m3gSRdS?=
 =?us-ascii?Q?/7Ri6bpd48OCuVq5IbyF3RRJ98+SLdxeOflmmXFT7Zu7VsA8H7v8XeM46v4x?=
 =?us-ascii?Q?8xiyNffFqxUkcI9uHF5cDV5LcVnRi7E1vecrz5Ai55usjY3338ujnR/LmAdw?=
 =?us-ascii?Q?o3PcgHpaXOsD/qznA395rXbRiNZz2h3yNavS8y2ZItB+bTmwYP0uzOjH1yr+?=
 =?us-ascii?Q?lSdvuzWp2xtYz7z5sc1Qv+dMA4a3tn6cvU2V5ZpAcjaoEl8zXSuO7slloI/K?=
 =?us-ascii?Q?fOTaasxavO5OAkjlip4F/Qv0EQRiuiApzzEv87lpXobVYk7lbVMsrqJ0M6DA?=
 =?us-ascii?Q?PXFm8itsJs9jtyAjMWhpBvFEUx2xfdK2ONZqXbrlG1uv7ffa3B+aUekMvYL3?=
 =?us-ascii?Q?X4tABVvGN2ZFiEQrnz68fhGllBnXr2Z7QCw9on4G3efriLjF6Wewik9lqMoZ?=
 =?us-ascii?Q?idymnKl7HGLsOhZ+4dwA2hGeAxofkapKLrTWa8QZvfds5PMQ+Mqt2CD9w8YC?=
 =?us-ascii?Q?tJzXo+jeHK66bGV1Vx8KcOyIYEe2Wje3uOaOIvymKFKvAyioWl0Hih/Mvuan?=
 =?us-ascii?Q?ucMfIpDKnVBfvSyFqpp19Fa+PuunbTigMQZVNxjQiAWxTaQeM4o2W5tTu/wY?=
 =?us-ascii?Q?knbs4Ss4zlWjy4gmfEhCyTm/aNcpqtUP9/dBOGlUT5oUknjnEEpW10G2eApZ?=
 =?us-ascii?Q?7wJPbiMhdXSFbrSNf+bB7oogn3AD9tnA7C0tmhPHLeIvWdNw+rAHpScJZxKZ?=
 =?us-ascii?Q?JokMBBfMwb8qKPXuQmlZNzMDaoXhuagh9sF4gjGQng2Bnh/0zF+0ep8nNK3X?=
 =?us-ascii?Q?qC7A5VeJftmNCJJNqcbxfDX83y4fFUX72C1/3r/9t2D4Plhk5NrixSBMbV6C?=
 =?us-ascii?Q?J/iDrGrPY2FlgZfB07Vs+OCuge8w8JUhl5EAghZZ8fs6h5pEknkOVlVWihkg?=
 =?us-ascii?Q?r0FGPsQDhnBUrkb3yRh78PfcdDzoZEHWLOp/XreQ?=
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY2PR01MB2778.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921bbcc5-3dcd-497a-b278-08db832bd754
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 23:00:52.2182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiEAZjBLmT5ZwdWexpqlpmRIQogoiE0LVrk099ccbfVJMTrL2PiF7gkVsHpTYMUwAzQh81K63QpcqzwQE0bd2CL7FvKMTg3mJtGUhHE8Q0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBPR01MB5487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T28rUqYf15OfEZSfom8JCsDGrGewYKCiHAm1giVjj4=;
 b=Y3R7nXTGDpvYfCbRL66tgiGCwUlFeQdTbHE0eBV4GspUcUotkqQutkoDS26HlQXOY1EXDODe0oLEf9KauU65RqQkpvRBsnRr5XGtHk7PgBuA2MReM6nJqstkiIUfGh1C3sRMJslmyDxQv7iCtVhUOd/yg5PsKdKVIvKgh6KrQNk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector1 header.b=Y3R7nXTG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
Subject: [Buildroot] Accessing environment variables in Config.in
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
Content-Type: multipart/mixed; boundary="===============1186326180740453220=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1186326180740453220==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB27786466E6AB5D0D52F21CDB9436ASY2PR01MB2778ausp_"

--_000_SY2PR01MB27786466E6AB5D0D52F21CDB9436ASY2PR01MB2778ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I wonder if I can access environment variables (or argument passed when run=
ning make) in buildroot .in files. For example, I like to have a Config.in =
file like this:

```
config BR2_PACKAGE_MY_PACKAGE
        bool "cxos_unit_test"
        select BR2_PACKAGE_XYZ if $(NEED_XYZ) =3D "y"
        select BR2_PACKAGE_GTEST
        help
          This is my package.
```
where NEED_XYZ is an environment variable (or make variable). Can I have su=
ch configuration file? If no, what do you suggest to achieve similar behavi=
our?
________________________________
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents in any way. The views expressed in thi=
s email may not be those of Gallagher Group Ltd or subsidiary companies the=
reof.
________________________________

--_000_SY2PR01MB27786466E6AB5D0D52F21CDB9436ASY2PR01MB2778ausp_
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
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
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
<body lang=3D"EN-NZ" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I wonder if I can access environment variables (or a=
rgument passed when running make) in buildroot .in files. For example, I li=
ke to have a Config.in file like this:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">config BR2_PACKAGE_MY_PACKAGE<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quo=
t;cxos_unit_test&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR=
2_PACKAGE_XYZ if $(NEED_XYZ) =3D &quot;y&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR=
2_PACKAGE_GTEST<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; This is my package.<o:p></o:p></p>
<p class=3D"MsoNormal">```<o:p></o:p></p>
<p class=3D"MsoNormal">where NEED_XYZ is an environment variable (or make v=
ariable). Can I have such configuration file? If no, what do you suggest to=
 achieve similar behaviour?<o:p></o:p></p>
</div>
<hr>
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents
 in any way. The views expressed in this email may not be those of Gallaghe=
r Group Ltd or subsidiary companies thereof.
<hr>
</body>
</html>

--_000_SY2PR01MB27786466E6AB5D0D52F21CDB9436ASY2PR01MB2778ausp_--

--===============1186326180740453220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1186326180740453220==--
