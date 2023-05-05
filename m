Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4439DC77B7C
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 00:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B788415E;
	Fri,  5 May 2023 00:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97B788415E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bh6aBAVxaNVm; Fri,  5 May 2023 00:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CABDF84159;
	Fri,  5 May 2023 00:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CABDF84159
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3D61BF3A6
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 00:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E13B8611E6
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 00:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E13B8611E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J__N_Dbqm_YF for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 00:45:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE62F60B05
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7005::707])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE62F60B05
 for <buildroot@buildroot.org>; Fri,  5 May 2023 00:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FitMVI/Fpd0v60Augrsg+UxiHqY6m8lknHeTKCVZoTEtE08lhfpHfXwte7KirdEE+apsqdJ00f6F0daFSEZgN4eJMZyDByADNXkMrybxQAaV4uZOu9T1Q+jAsQS1V/e+EfRYeiaT8PX/4+LhjvkG28PudgImDZfuaVBR4M5iGctlGDuzccKJA4Xgp6x7+ZSIkfikS6OEMMn/LG8ZHOMSfafp2C4yfK2iF7S51s9ewk8sKfUNWhqZSYGsIQdWcG9YmJqM7A+QJmj7PymB6gNzRlJ2HhugzulsmML+oyjhfdHIvZawiyueSauQyB1/yOj5BT797mw8arYDMFsThNX05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ke84drVjDFE9cRumIqfieeUHC0KQUXZLabdDCMlGoMg=;
 b=BosLSQnSIqMz0Aep52vfSS/6+pO+JtC8Z8yVo6n3cNbiYBUeJYnk7ITXlh+H+kAAr7eVf8BizvshhQpGrpMC31m4hS0VNCWWY9hPPVrYJuUXmmAgV4S849u5gftrcKsEEKEViV1Y/sOGDnRn7e/xKyn6PFA4f75KwkkFDye5KBb5HppISXEKe7Y3s3KiPeZ+X05nZpEdir9N+QEpk3HDf2grcMSb4CVuYP6tBme/oyx4/B3jdVf1Y0JIzWEEgU3JAteg19CMrnBz1qJqXqK44eNu3D/u7OhltRF3brN40gEIav2a1fGPeGTDvvovFD7ui3vnTvIE6Njh+PZsDMZ3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 ME3PR01MB5926.ausprd01.prod.outlook.com (2603:10c6:220:e4::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.27; Fri, 5 May 2023 00:45:16 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::a06b:8ebb:deb3:132e]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::a06b:8ebb:deb3:132e%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 00:45:16 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: How I can provide options for dependant packages?
Thread-Index: Adl+6kHXhHAUIUYOSAq+32uN+A05Mw==
Date: Fri, 5 May 2023 00:45:16 +0000
Message-ID: <SY2PR01MB277816FD86D5D6B02F3E7F9094729@SY2PR01MB2778.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|ME3PR01MB5926:EE_
x-ms-office365-filtering-correlation-id: 7367c367-f69d-498e-0960-08db4d01feb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RLpJryVTgO1fNz0afhFdlAG72SZO1FMO0IoMgNC1oeCqBM5zaTxzm64mXA/nJJYD4UATEufwDCBMR257juQzpbgoI6rjeBmQE8atCrVq/RukqpRqFgrc5YHAN0/5guGjBr1Wb8qhV3sSsY4Jsoid92Ltn8IZzJ+78AZ728OAQrMYOEOouWkvA/ISVNuIbocxnUK2o7UR3rNmJtAuv3mkUX8OHyWhvOQe//f4HNs8AHVncJQchIeZGhC32ThylV1VTGiSHX9gzUIk/iiVHgexBruy8fGG/2S6wh0kI8mAy9PRx/4XBKKsoDIFe3rADkJcjE3SeXjtsNsKa60PazYsRp9EVTLgZDyvVqTK8hXP7ermzzN/EgBC9KDWWAYiIEvL2c6RS9/zAXjL6T16rLVMu0Zh/OOgIIYA1sASCb/YjYQJ2xFulXjXUORhlzYTiEq6ub53v8fKoNJhtAeU6uRy1GKcRVNsDUHpbS8MzrEKMoeFCnXwUyvm8m+cbMmz2Wza4s3ms+R9Odh0tXAzRfJf/RCq2dRWmy+gtprOYT2G+8Al1gOxznLsWgx+AtXBEHFY7O6qvRKejLerlewUofzZBmMZNIF83EtVhkEPYaC3iWWonOyA5KII9O3v69bXaMcK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(83380400001)(6916009)(122000001)(41300700001)(38100700002)(8936002)(33656002)(38070700005)(9326002)(316002)(26005)(7696005)(6506007)(55016003)(478600001)(66476007)(66946007)(76116006)(66556008)(66446008)(64756008)(52536014)(5660300002)(8676002)(9686003)(86362001)(186003)(71200400001)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TPRmAZJtHjaV3rBpicRaXmHNPwUS1MTsVZhItLsjawhegzUxfr0PukMl2o9y?=
 =?us-ascii?Q?t/qa9eYHJfcTsns8E0muvB/J+fo0gOXvM9VL9cYuKpIosCasyrjsQQRUAdU/?=
 =?us-ascii?Q?pCeQF/9a/ec/hxjdhsgrk/GXzl3vjUcYZ+JU4Kdr5Q5vKaleav7Z6P5mocMG?=
 =?us-ascii?Q?93ejtNdxo/6aoG0Ejsjh7obaOMfpvIOyF2b7qTQFLJ05j0hWQl6Kkrwp70pq?=
 =?us-ascii?Q?Ja3vodlSGja4AL2LQU+YiHCUaz6wY63bhYDdlDxxVib5iqPAYJU+zb8APsYh?=
 =?us-ascii?Q?9PUtAYq4gchM+KE2QiPO6mxZcIKSMB5d64zoGDwMVbf1E1YTE+eUmT6Lmxy/?=
 =?us-ascii?Q?JLk6QKMiR7g0rbk6vTWTbG7ll8pZ+nAdSFB/UFkRLAVnfkaibvlJ9Y4PnQx2?=
 =?us-ascii?Q?FO1fzdpR0d3XG7BmA8rqp2Lf/AHCzl1ntjyS3stKP8RqrRqF6Y9MnfAwa9Ql?=
 =?us-ascii?Q?PJLAecDSewciAW9TLBnfhddDfP5IUB3cHpxM5fuK20pLRSpY7ULKSE940Ufz?=
 =?us-ascii?Q?7f6b1SNKZ42pqIjcVYs64ldCCferM6xKu8J8ZUq8gEpQoH6QYJAexTtRA0q+?=
 =?us-ascii?Q?rMN7orD4RRdzzZDBd5G/ZqkQ3mPJxCaB3KNPl5+qa0NxrenunRra1Y/fCmil?=
 =?us-ascii?Q?NZ1qYAVkZiF3dqxTtiYF8tQdW3RMp8oqLQuun/mL04qW3PuwdW6e7qYvqGTK?=
 =?us-ascii?Q?qchT9QxCFP4KpHU9IfDajOuTbT+KnTjQ6jAt+SxSyctWun2cxRpjYX2b0bxj?=
 =?us-ascii?Q?reU50BAKbE21oWPLHwp6wgfVy97FrvUffEMEu4NB1+cn3uKVfE0sIz74rb9a?=
 =?us-ascii?Q?o4WtYx+m63e3S1b7Ew1ORHF7ySpKlhEYziaRde1NNHKiYE+Qhei123rd7Bey?=
 =?us-ascii?Q?4E9Uzt01+oGHXZDjg+zJwFlgm0y14c5woeHNa9U6alu9jQp31adb5HfzXBuE?=
 =?us-ascii?Q?tYyTH4a19114IcDlMwNATJYF6oHhdx/vxEPjy4cy+L1I/yQQlQ4P10s5ZsP7?=
 =?us-ascii?Q?l8YlXhB6Yaw9FSOUta8y6l5Zbgi0IbrpUKinPHonhXmC0qqD0pMWz13grzeb?=
 =?us-ascii?Q?eh6HU38qQUyFc4mKa/zOdjX7rzGZQxLCIWHD1KpWjkdLXp7rZPMnJOosYjhv?=
 =?us-ascii?Q?Kq4vaCmGCBC6SgFY7zx8fmTWbEt9zdhFPikjVM2j4cTQAXZF9+jSOPiILXBs?=
 =?us-ascii?Q?gmPUztOT4v4OzAR7lTfyKAHQ/kSXPusnSBWFpwGppQiHJJhNbD/XoMnciEeX?=
 =?us-ascii?Q?7//WXz7aeeBBOlcqln7WfZHbwt7uGJguExKOlx0b1r6Jh/EcONfbNeE3X4Kp?=
 =?us-ascii?Q?DTv5bNmT00dKDUequRbBUc2o0LTrhUUT4eEY8FN/bSLjH/qte3EkVaCN4XR/?=
 =?us-ascii?Q?u1gEWon+CR5/vHOR8etNFln0kSB893pzDWueSa02Y+BvG39pIcmLhfMloU2N?=
 =?us-ascii?Q?hbgi2sbUC5WUCtyx90Opcgc+EQhULnuii+BdLHzT5O9JilBAhzJPw143tcx/?=
 =?us-ascii?Q?GbUWmQxK86EuOeixTtQ2HqDxLAFfaMrEa2Zc3GZmTYZroWRjH/yHnbHc0iFq?=
 =?us-ascii?Q?GbpeKygVSQFxz7hJqUK+bGTWt7UPsNjHCN3+Znha?=
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY2PR01MB2778.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7367c367-f69d-498e-0960-08db4d01feb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 00:45:16.6066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 526xP4ZXUHcVvlGYgZ3nmpRiIoBHdhQiOhmlTREv4QCOCZAmOF7zZ3ISUdookSwCXIwkCzy3vn4mK6FXf98FObPP5lpIddwYiuXhqm1NAnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB5926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ke84drVjDFE9cRumIqfieeUHC0KQUXZLabdDCMlGoMg=;
 b=A1ApRkz5CUKAj1XFNgwGBbP0fhmBymUlyBYsMTE+q3H1g3idaDOrr43VUDEfZZyNQb6Rnc63uNBp0raEX++ptEM2sgePeP0sgQCZNUYdLxQVl3HBQxft9BZ+H/GtXb18NvkY3nIwgLYJvnpkRvgkFDhSWZh3I0N8AsiaFRXEjvQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector1 header.b=A1ApRkz5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
Subject: [Buildroot] How I can provide options for dependant packages?
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
Content-Type: multipart/mixed; boundary="===============4041122374553585936=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4041122374553585936==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB277816FD86D5D6B02F3E7F9094729SY2PR01MB2778ausp_"

--_000_SY2PR01MB277816FD86D5D6B02F3E7F9094729SY2PR01MB2778ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

Let's assume that Package *B* is dependant on package *A*. Is it possible t=
hat package *A* define some options that will be inherently included for pa=
ckage *B*?
An example is when Package *A* installs its libraries in a non-default loca=
tion but wants to include that path in `PKG_CONFIG_PATH`, so other dependan=
t package could find that package when using pkg-config.

Best Regards
________________________________
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents in any way. The views expressed in thi=
s email may not be those of Gallagher Group Ltd or subsidiary companies the=
reof.
________________________________

--_000_SY2PR01MB277816FD86D5D6B02F3E7F9094729SY2PR01MB2778ausp_
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
<p class=3D"MsoNormal">Hi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Let&#8217;s assume that Package *<b>B</b>* is depend=
ant on package *<b>A</b>*. Is it possible that package *<b>A</b>* define so=
me options that will be inherently included for package *<b>B</b>*?<o:p></o=
:p></p>
<p class=3D"MsoNormal">An example is when Package *<b>A</b>* installs its l=
ibraries in a non-default location but wants to include that path in `PKG_C=
ONFIG_PATH`, so other dependant package could find that package when using =
pkg-config.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards<o:p></o:p></p>
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

--_000_SY2PR01MB277816FD86D5D6B02F3E7F9094729SY2PR01MB2778ausp_--

--===============4041122374553585936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4041122374553585936==--
