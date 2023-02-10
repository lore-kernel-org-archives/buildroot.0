Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3ACDC636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14FEE60F66;
	Fri, 10 Feb 2023 11:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14FEE60F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgsyL2Z5OFVu; Fri, 10 Feb 2023 11:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24DA760ABE;
	Fri, 10 Feb 2023 11:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24DA760ABE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 030B61BF2AA
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 11:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEF8C4195C
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 11:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEF8C4195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e2y_woZ9F3L for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 11:15:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49C241955
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::711])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D49C241955
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 11:15:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgzM0FhKhoLuiuW2JWTaRdkCONj9hngDURr3ckuTnonPLz9LJI62ta5guVof7JJXBlrTyUYnGRXTSNPNKLbQrvIw1yXzyv/QiUHRtRe3sgt0ul75Pj5HwEwJ0Jbd1e92vPbUuZqAfFVJ3U0Veo6eX2eMdePcpuvJWfr7K0+MQoyfvMBasxCqbQ2GgI2wCe7LJ7tIezqKrpylq2P/8bQehcqHEAhpUr9PfSVUl7e5lNgHLpvfg7qrHKGj2bz/TCQC/3ZfEumMvr/Qo6d14D13zK+k0ab1QTWnnpppE0982BEE5bjWMehqsyaSX7KYBSZlXNKnhY3Dcqt0LUuU7iejIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyaIaozVpDFcEq2PjWzYTyPede7aJ6PlDOOU/HdLc6g=;
 b=nQtctvFktMbEpzNrfJt67S3ENbcWLZvj6duTUYhP7yVj9p+pdNHFz50W8QczfzkIFEEnSgPkNSDm0E5c7lTF29dlvVTDs9jAyNmi6A5EnvjBS0iDSJT9jUkXB8fbmiMWTCWzK4qkCNtR5bobWMcFTj7OXdq6TNxrmPE+anPU2o/J723KCzerBrd0PsuCYvVK/OxgEoflcfLLmjvdV+THLoko5zeBJGKF26dyolZyP8IDRVdjnGtOchkacMneo7FJ8YHk2GW4entqTxLlhuB6WYM3i9avXSVRsjVd1k24MdmLU8HeCnGFhFVN8R6QQ12+64h1qsMkgCuwmDUMgMmrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebo-enterprises.com; dmarc=pass action=none
 header.from=ebo-enterprises.com; dkim=pass header.d=ebo-enterprises.com;
 arc=none
Received: from DB7PR03MB4841.eurprd03.prod.outlook.com (2603:10a6:10:7f::21)
 by DU0PR03MB8622.eurprd03.prod.outlook.com (2603:10a6:10:3e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Fri, 10 Feb
 2023 11:15:12 +0000
Received: from DB7PR03MB4841.eurprd03.prod.outlook.com
 ([fe80::abdb:7f11:3bb6:9440]) by DB7PR03MB4841.eurprd03.prod.outlook.com
 ([fe80::abdb:7f11:3bb6:9440%7]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 11:15:12 +0000
From: Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Dependency problem for gtkmm3
Thread-Index: AQHZPTdXcLyahG8d7kCzj6de5lQ1LA==
Date: Fri, 10 Feb 2023 11:15:12 +0000
Message-ID: <DB7PR03MB4841CE1D746B328873113D87B5DE9@DB7PR03MB4841.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4841:EE_|DU0PR03MB8622:EE_
x-ms-office365-filtering-correlation-id: a49916cb-1981-4232-bccb-08db0b5813fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yrca+W3Ybig4Lfc/NLaXhfejw9EWzOPgabrSwT9ptQEp9s/693CNxrMO7z1F8167l+zJuW/WsHx8Rcs7J5vTTxgxrU4r6GfNL0IsZIHqrWcxFD2XBvDv2tKdbAhxGaQANOvGmR6LqoSbsL/9/QLzNmNLt3xUstv/GUbDHtk/m8MGNiHi+ZTnR9ooKXIeEThDKoX84+C26OjGSoZTW/E7sD/dxWtT3ZF/RGI4x82zHVJOL3UEs9Fy3VsHI7a1ijJbOOQEEvC/77XTKEYgVu/ZJbxC5mciOKh9ddaJo3LmbbroWIMtY5xz4qy4ChfUGY3JLCBkL43qgE0K90WsV4HSdCUHfGBwZ1GtcuWF7DVKxwJwPXNOphd6uBDQVqslr9LCPrNGZrO/ww+DQM7cvtYVjF5csLXPH4xS29sA+qr+ugnIq6+mni9tPdR4oO301zBGU9/y4dK4bFKwdgNcMEvbtLk1doEE56zMt8WPhcF0EygOwykhr33SZNp863TXxLQR43abthC84sU9C11Zll6jco8I6RYtVzlHG/lqIwX2nom75/kGMOEI7DuvKdL/W1oFKdLMbAN52Vgbgn/zbdy4DIR4f8mXwenSGAyQ/bYwCD9xi//CADkzEKuFu65mbB4rUvT9PzyA72qLQ/zJznUBtwoAjAE6SVKx+mnUshkCvi6S9+1OQOokkKXHPCuxbwJymU/KQNAB+QCq2U/rzFUTCmYY5a7vCBHgPdMiEa7A3/1ln1QxwhfV6yDzFHavE7MO5MkTmzqWJaqWrimt2sd/8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR03MB4841.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199018)(1690799011)(52536014)(66556008)(4326008)(76116006)(66476007)(6916009)(64756008)(66946007)(41300700001)(6506007)(186003)(8676002)(166002)(91956017)(33656002)(8936002)(66446008)(107886003)(316002)(86362001)(478600001)(2906002)(7696005)(71200400001)(9686003)(5660300002)(55016003)(99936003)(19627405001)(38070700005)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hzJgaT0KflFUuTzedwYIa5BTWpIxJl7JNdRnTh25J71m7NaT+wJ3yux1mF?=
 =?iso-8859-1?Q?y+je/nvS/z1XiYHnOo/hJHMsZXa9eh2qoTUrFfs+DHqirn8JQYWV0ui2Ud?=
 =?iso-8859-1?Q?5vQq4P6da8oPzb1Fr9KlCa5/21rqHkCZMik4OPm6n4HXCKFYBjZGdOIrNO?=
 =?iso-8859-1?Q?b9XSI7lCIUWN9AzUoGBFJMbBPuinezUH66r/SpEyZb+vwemV0znLGf5fcX?=
 =?iso-8859-1?Q?UCxrIm/PmUEN3i/id1SXbPMYF5pCMcW6K0zxA+hw2CxfxSoEI8TMFqL3p0?=
 =?iso-8859-1?Q?2eC/S4hf5Cva9ocweonaCB9sIUp8qx+OhCCuPAC8AfOwKAzxCvMRcIPcES?=
 =?iso-8859-1?Q?koPis7Wiq3N76uw4eoKuN6pGWqyhbtY2Q+4gOHigDEckEORuUVWCy3ALVG?=
 =?iso-8859-1?Q?hHRoBLEV9SAjUXfpeBdNq/eZSojz4J8McOKpc9bbmrVbsunx5TM0St+mSl?=
 =?iso-8859-1?Q?pyTw+YzrKV0iWCJACyi3dLMTHErIKjNeEHtSg5Ni8JM+4kF8kfX+87OzQ7?=
 =?iso-8859-1?Q?gW66mCXxTsNUgcqMy2dni2McSji38g8tf6MHS4ocjePT8MUpD+/pF7IsM1?=
 =?iso-8859-1?Q?bYEydX4kpWdS2imM8U5OZOTp6UwgKK2iCWtP8BUw3zL61GIfu0oUqGbvn+?=
 =?iso-8859-1?Q?C4YsPWGzwX891z77/fZTB6Wmh8UVBAgS4MqxqqggWR5iiWf++xM3Hgb6gM?=
 =?iso-8859-1?Q?MS1yt1NrnFrnaJcUnvMisKAHuqob/0iaYpZszbs1t/nqgiWoU3Kc2UFDPk?=
 =?iso-8859-1?Q?3ArYhq7wvIIFkF6AYRAHATLJp2D/g6pz9fuPPGI9JKhXd++iU/ZoEPASVM?=
 =?iso-8859-1?Q?bCIxfOFtwtaW7T6HPsM+HwAXfJTMNaVGSSjoqBOn6Snhr3ri3g3tWCujcT?=
 =?iso-8859-1?Q?enDgceJBknIWInC+wzCD3PXF1nzELAJzdb6dM0XDz2EgszW/A2vwMfspuD?=
 =?iso-8859-1?Q?YgI/LXOP33xzshnXk17mEdrorm4SMoHarZuF/wzZPguJN9HRjuGt3fYRgH?=
 =?iso-8859-1?Q?MGCN6jMeRsLgaj1BiTYfc03Yf8Toh1YjjEFE97zxwor7L8EXV0OSUIqa/w?=
 =?iso-8859-1?Q?0GaCRPzwnTKRuq6J0Z37EZLkRrBPRFTzvhknGiul7UIs8TISrDgY5h3Hnq?=
 =?iso-8859-1?Q?ydJAQs6/M/qc7ACjJekK+1XvYbnKipfDW/0DrDDCDehOf/bP0+LLi2N+Mw?=
 =?iso-8859-1?Q?EofoAvtNn4dr0q9Hv6bsydFJv6pfIn50t8ghAOAFxokFqPs/gCscXdkROE?=
 =?iso-8859-1?Q?cEcrXCUh4M0l5lLCyUFmxwXy6PTykdOnvpHLtNjBKSsPt1xWpSimMZV9u8?=
 =?iso-8859-1?Q?SJnkGp5UKCOGVlFEm8+MV31nZC5wyVMrNOFyRtsgyayWwHwzVqT2tOexrO?=
 =?iso-8859-1?Q?NZxQfwVbSFT2eIe0G2oB9Ps9ymiHb0zB8KfqJYICrnDbBO2MVvWHZNM35u?=
 =?iso-8859-1?Q?PuCg7UZ16qay0i5f7gvbeUwjNeDmt+oQwDn69E2gJnLGyMaK2+zEbZxlM3?=
 =?iso-8859-1?Q?FM76fsmbbp/lA5v9udnTtHGc1EpPV3Of6yBo1utVT2q4g2mr5aF1q+Dkqw?=
 =?iso-8859-1?Q?JkcVqMzBaafzS7KVQS/L2nCcbzPK9yIP6i2/67WBvCbkx9wpg9LXxsuPj8?=
 =?iso-8859-1?Q?v8Y03VZhbdRBiYzbV2H0xDnAL2Op/yeYb2mYUF96+f4g8vj7tC+J9ONcMu?=
 =?iso-8859-1?Q?Dfm0pbikhZSPZWZbvOB3ESRILyj2qE/qabyomUps/iPh1BggyY1Ts1/+Vv?=
 =?iso-8859-1?Q?VcTQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: ebo-enterprises.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4841.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49916cb-1981-4232-bccb-08db0b5813fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 11:15:12.2659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 24133f96-2b38-4360-9546-979fc3caa9d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XDrXSxT8hyid3UpzVDIC1YdlzMwjcbYBc17ENpl17tmHFVt25lm72xzZe10CLmWWp/TFF7IpXlJm269768ikDZZVMmTz8CTgda6orbkRaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8622
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ebo-enterprises.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyaIaozVpDFcEq2PjWzYTyPede7aJ6PlDOOU/HdLc6g=;
 b=PPhicUqSRvEXz1atCka8p9D+IzRxJTPN2dbzijKHdPKTjj7RXUt+8iRXTjNLXj0pmPTycQMLbqN5Xbn5yeMkiWqwEGAPAXGmRGtig1E/77dHn0TcXXHDIpoKWhPmqqn0KsEahFeYS6sBuCa46MHBsfB/SYopRzQaU8wpT2cHpTcO7Xmv/i2NDI7A4DiBi2+FMcSA2/5GumPnjYQo5vHy0IPJcY7L79UNFt8ppL6DsKreV/xPdxHHUiFQoIvOcg5n1k8pf76uu2mB6vvY5RVLEG3yf00csHX6NrkBkzsquecC+mBPjm4te4ZfGK+vPxNXND7OlBoinpXqrUbPDsMI9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=ebo-enterprises.com header.i=@ebo-enterprises.com
 header.a=rsa-sha256 header.s=selector2 header.b=PPhicUqS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebo-enterprises.com;
Subject: [Buildroot] Dependency problem for gtkmm3
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
Cc: Steven Boucque <steven.boucque@ebo-enterprises.com>
Content-Type: multipart/mixed; boundary="===============3156140689634126866=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3156140689634126866==
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_DB7PR03MB4841CE1D746B328873113D87B5DE9DB7PR03MB4841eurp_";
	type="multipart/alternative"

--_004_DB7PR03MB4841CE1D746B328873113D87B5DE9DB7PR03MB4841eurp_
Content-Type: multipart/alternative;
	boundary="_000_DB7PR03MB4841CE1D746B328873113D87B5DE9DB7PR03MB4841eurp_"

--_000_DB7PR03MB4841CE1D746B328873113D87B5DE9DB7PR03MB4841eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to make a buildroot containing libgtkmm3, but I run into proble=
ms.
I did the following steps:
Checkout master from git://git.buildroot.net/buildroot
Select the following things:

  *   BR2_x86_64
  *   BR2_TOOLCHAIN_BUILDROOT_CXX
  *   BR2_PACKAGE_MESA3D
  *   BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
  *   BR2_PACKAGE_MESA3D_OPENGL_EGL
  *   BR2_PACKAGE_LIBGTK3
  *   BR2_PACKAGE_GTKMM3

I get the following error in the output of the build attempt for gtkmm3-3.2=
2.0:
configure: error: Package requirements (giomm-2.4 >=3D 2.49.1 pangomm-1.4 >=
=3D 2.38.2 gtk+-3.0 >=3D 3.22.0 cairomm-1.0 >=3D 1.12.0 gdk-pixbuf-2.0 >=3D=
 2.35.5) were not met:

Package 'giomm-2.4', required by 'virtual:world', not found
Package 'pangomm-1.4', required by 'virtual:world', not found
Package 'cairomm-1.0', required by 'virtual:world', not found

It seems that gtkmm3 is dependent on versions of some libraries that are no=
t available.

The following packages were built, but these do not provide the correct ver=
sions of these packages, according to pkg-config:

  *   glibmm-2.68.2
  *   pangomm-2.48.2
  *   cairomm-1.16.1

Met vriendelijke groeten, Cordialement, Kind Regards,
[https://www.ebo-enterprises.com/static/emailsignatures/img/ebo_logo-transp=
arant.png]<https://www.ebo-enterprises.com>
Dirk De Becker <callto:dirk.debecker@ebo-enterprises.com>
Squad Leader e-Vision Embedded

dirk.debecker@ebo-enterprises.com<mailto:dirk.debecker@ebo-enterprises.com>
+32 498 51 19 86 . +32 57 23 02 70 .  [https://www.ebo-enterprises.com/stat=
ic/emailsignatures/img/microsoft_teams_icon.png] <callto:dirk.debecker@ebo-=
enterprises.com>
Ter Waarde 60 . 8900 Ypres . Belgium
Wetenschapspark 2 . 8400 Ostend . Belgium
[https://www.ebo-enterprises.com/static/emailsignatures/img/website_icon.pn=
g]<https://www.ebo-enterprises.com/> [https://www.ebo-enterprises.com/stati=
c/emailsignatures/img/twitter_icon.png] <https://twitter.com/eboenterprises=
>  [https://www.ebo-enterprises.com/static/emailsignatures/img/facebook_ico=
n.png] <https://www.facebook.com/eboenterprises>  [https://www.ebo-enterpri=
ses.com/static/emailsignatures/img/instagram_icon.png] <https://www.instagr=
am.com/eboenterprises/>  [https://www.ebo-enterprises.com/static/emailsigna=
tures/img/linkedin_icon.png] <https://www.linkedin.com/company/e-bo-enterpr=
ises/>
[MicrosoftTeams-image.png]


--_000_DB7PR03MB4841CE1D746B328873113D87B5DE9DB7PR03MB4841eurp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I am trying to make a buildroot containing libgtkmm3, but I run into proble=
ms.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I did the following steps:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
Checkout master from&nbsp;git://git.buildroot.net/buildroot</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
Select the following things:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
<ul>
<li class=3D"elementToProof"><span>BR2_x86_64</span></li><li class=3D"eleme=
ntToProof"><span class=3D"ContentPasted2">BR2_TOOLCHAIN_BUILDROOT_CXX<br>
</span></li><li class=3D"elementToProof"><span class=3D"ContentPasted2 Cont=
entPasted3">BR2_PACKAGE_MESA3D<br>
</span></li><li class=3D"elementToProof"><span class=3D"ContentPasted2 Cont=
entPasted3 ContentPasted4">BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915<br>
</span></li><li class=3D"elementToProof"><span class=3D"ContentPasted2 Cont=
entPasted3 ContentPasted4 ContentPasted5">BR2_PACKAGE_MESA3D_OPENGL_EGL<br>
</span></li><li class=3D"elementToProof"><span class=3D"ContentPasted2 Cont=
entPasted3 ContentPasted4 ContentPasted5 ContentPasted6">BR2_PACKAGE_LIBGTK=
3<br>
</span></li><li class=3D"elementToProof"><span class=3D"ContentPasted2 Cont=
entPasted3 ContentPasted4 ContentPasted5 ContentPasted6 ContentPasted7">BR2=
_PACKAGE_GTKMM3<br>
</span></li></ul>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1">
I get the following error in the output of the build attempt for gtkmm3-3.2=
2.0:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1">
configure: error: Package requirements (giomm-2.4 &gt;=3D 2.49.1 pangomm-1.=
4 &gt;=3D 2.38.2 gtk+-3.0 &gt;=3D 3.22.0 cairomm-1.0 &gt;=3D 1.12.0 gdk-pix=
buf-2.0 &gt;=3D 2.35.5) were not met:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1 Conten=
tPasted8">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1 Conten=
tPasted8">
Package 'giomm-2.4', required by 'virtual:world', not found
<div class=3D"ContentPasted8">Package 'pangomm-1.4', required by 'virtual:w=
orld', not found</div>
<div class=3D"ContentPasted8 elementToProof">Package 'cairomm-1.0', require=
d by 'virtual:world', not found</div>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
It seems that gtkmm3 is dependent on versions of some libraries that are no=
t available.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The following packages were built, but these do not provide the correct ver=
sions of these packages, according to pkg-config:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<ul>
<li class=3D"elementToProof"><span class=3D"ContentPasted10">glibmm-2.68.2<=
br>
</span></li><li class=3D"elementToProof"><span>pangomm-2.48.2<br>
</span></li><li class=3D"elementToProof"><span class=3D"ContentPasted9">cai=
romm-1.16.1<br>
</span></li></ul>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"Signature">
<div>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" bgcolor=3D"#FFFFFF"=
 style=3D"background-color:rgb(255,255,255); border-collapse:collapse; bord=
er:none; width:720px">
<tbody>
<tr>
<td valign=3D"top" colspan=3D"2" style=3D"width:1720px"><span style=3D"font=
-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif">Met vriendelijke =
groeten, Cordialement, Kind Regards,</span></td>
</tr>
<tr>
<td class=3D"" valign=3D"middle" colspan=3D"1" rowspan=3D"2" style=3D"borde=
r-collapse:collapse; font:24px /40px Verdana,sans-serif; text-align:center;=
 width:60px; padding:10px 0px 0px">
<a href=3D"https://www.ebo-enterprises.com" title=3D"e-BO Enterprises Websi=
te"><img width=3D"47" height=3D"54" style=3D"width:47px; height:54px" src=
=3D"https://www.ebo-enterprises.com/static/emailsignatures/img/ebo_logo-tra=
nsparant.png"></a><br>
</td>
<td valign=3D"top" rowspan=3D"1" colspan=3D"1" class=3D"" style=3D"width:66=
0px; font-size:24px; font-family:Verdana,sans-serif; padding:0px 0px 0px 10=
px">
<span style=3D"color:rgb(0,48,135); font-size:12pt">Dirk De Becker</span><s=
pan style=3D"color:rgb(0,48,135); font-size:16pt">&nbsp;</span><a class=3D"=
x_meetingLink" href=3D"callto:dirk.debecker@ebo-enterprises.com" style=3D"b=
ackground-color:rgb(255,255,255)"></a><span style=3D"color:rgb(0,48,135)">&=
nbsp;</span></td>
</tr>
<tr>
<td valign=3D"top" rowspan=3D"1" colspan=3D"1" class=3D"" style=3D"width:66=
0px; font-size:15px; font-family:Verdana,sans-serif; padding:0px 0px 0px 10=
px">
<span style=3D"color:rgb(0,48,135); font-size:12px">Squad Leader e-Vision E=
mbedded</span></td>
</tr>
<tr>
<td height=3D"25" class=3D"" colspan=3D"2" style=3D"width:720px"><br>
</td>
</tr>
<tr>
<td class=3D"" valign=3D"top" colspan=3D"2" style=3D"border-collapse:collap=
se; font:12px /24px Verdana,sans-serif; color:rgb(0,48,135); text-align:lef=
t; width:720px">
<a href=3D"mailto:dirk.debecker@ebo-enterprises.com" title=3D"" style=3D"bo=
rder-collapse:collapse; font:12px/24px 'Verdana',sans-serif; color:#003087;=
 text-decoration:none">dirk.debecker@ebo-enterprises.com</a>
</td>
</tr>
<tr>
<td class=3D"" colspan=3D"2" style=3D"border-collapse:collapse; font:12px /=
24px Verdana,sans-serif; color:rgb(0,48,135); width:720px">
+32 498 51 19 86&nbsp;<span style=3D"color:#F07E26">.</span>&nbsp;+32 57 23=
 02 70&nbsp;<span style=3D"color:rgb(240,126,38)">.&nbsp;</span>&nbsp;<a cl=
ass=3D"x_meetingLink" href=3D"callto:dirk.debecker@ebo-enterprises.com"><im=
g class=3D"x_meetingLink" width=3D"20" height=3D"20" style=3D"width:20px; h=
eight:20px" src=3D"https://www.ebo-enterprises.com/static/emailsignatures/i=
mg/microsoft_teams_icon.png"></a>&nbsp;</td>
</tr>
<tr>
<td class=3D"" colspan=3D"2" style=3D"border-collapse:collapse; font:12px /=
24px Verdana,sans-serif; color:rgb(0,48,135); width:720px">
Ter Waarde 60 <span style=3D"color:#F07E26">.</span> 8900 Ypres <span style=
=3D"color:#F07E26">
.</span> Belgium </td>
</tr>
<tr>
<td colspan=3D"2" style=3D"border-collapse:collapse; font:12px /24px Verdan=
a,sans-serif; color:rgb(0,48,135); width:720px">
Wetenschapspark 2 <span style=3D"color:#F07E26">.</span> 8400 Ostend <span =
style=3D"color:#F07E26">
.</span> Belgium </td>
</tr>
<tr>
<td class=3D"" colspan=3D"2" style=3D"border-collapse:collapse; font:12px /=
24px Verdana,sans-serif; color:rgb(0,48,135); width:720px">
<a class=3D"x_socialLink" href=3D"https://www.ebo-enterprises.com/"><img cl=
ass=3D"x_socialLink" src=3D"https://www.ebo-enterprises.com/static/emailsig=
natures/img/website_icon.png"></a>&nbsp;<a class=3D"x_socialLink" href=3D"h=
ttps://twitter.com/eboenterprises"><img class=3D"x_socialLink" src=3D"https=
://www.ebo-enterprises.com/static/emailsignatures/img/twitter_icon.png"></a=
>&nbsp;<a class=3D"x_socialLink" href=3D"https://www.facebook.com/eboenterp=
rises"><img class=3D"x_socialLink" src=3D"https://www.ebo-enterprises.com/s=
tatic/emailsignatures/img/facebook_icon.png"></a>&nbsp;<a class=3D"x_social=
Link" href=3D"https://www.instagram.com/eboenterprises/"><img class=3D"x_so=
cialLink" src=3D"https://www.ebo-enterprises.com/static/emailsignatures/img=
/instagram_icon.png"></a>&nbsp;<a class=3D"x_socialLink" href=3D"https://ww=
w.linkedin.com/company/e-bo-enterprises/"><img class=3D"x_socialLink" src=
=3D"https://www.ebo-enterprises.com/static/emailsignatures/img/linkedin_ico=
n.png"></a></td>
</tr>
<tr>
<td width=3D"300" valign=3D"top" class=3D"" colspan=3D"2" style=3D"width:72=
0px; padding:0px 0px 10px">
<img border=3D"0" id=3D"x_0.s3x2l91z8a" alt=3D"MicrosoftTeams-image.png" wi=
dth=3D"242" height=3D"65" style=3D"width:242px; height:65px" data-outlook-t=
race=3D"F:1|T:1" src=3D"cid:4bac386a-b1b6-4866-b236-a449284fd644">
</td>
</tr>
</tbody>
</table>
<p><br>
</p>
</div>
</div>
</div>
</body>
</html>

--_000_DB7PR03MB4841CE1D746B328873113D87B5DE9DB7PR03MB4841eurp_--

--_004_DB7PR03MB4841CE1D746B328873113D87B5DE9DB7PR03MB4841eurp_
Content-Type: image/png;
	name="C2_signature_microsoftteams-image_b51463d7-6b52-402b-8e2d-555faff69bb4.png"
Content-Description:  C2_signature_microsoftteams-image_b51463d7-6b52-402b-8e2d-555faff69bb4.png
Content-Disposition: inline;
	filename="C2_signature_microsoftteams-image_b51463d7-6b52-402b-8e2d-555faff69bb4.png";
	size=8323; creation-date="Fri, 10 Feb 2023 10:06:28 GMT";
	modification-date="Fri, 10 Feb 2023 10:06:28 GMT"
Content-ID: <4bac386a-b1b6-4866-b236-a449284fd644>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAANEAAAA4CAYAAABjcR2lAAAABGdBTUEAALGPC/xhBQAAACBjSFJN
AAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAhGVYSWZNTQAqAAAACAAFARIA
AwAAAAEAAQAAARoABQAAAAEAAABKARsABQAAAAEAAABSASgAAwAAAAEAAgAAh2kABAAAAAEAAABa
AAAAAAAAAEgAAAABAAAASAAAAAEAA6ABAAMAAAABAAEAAKACAAQAAAABAAAA0aADAAQAAAABAAAA
OAAAAABWsh1rAAAACXBIWXMAAAsTAAALEwEAmpwYAAABWWlUWHRYTUw6Y29tLmFkb2JlLnhtcAAA
AAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUg
Ni4wLjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIv
MjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgog
ICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAg
ICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgIDwvcmRm
OkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgoZXuEHAAAeBElEQVR4Ae1d
CZAdxXnu7jnevfv21i5aSSutDrQISSAEEsKIshPHOAQqBmJXgm0cxyTlxAnYVBIHx7IdyqaMgys2
jp0YAyEuG6g4YAjmMGiNkSx0ALqQtFpJK2nv6+2735s3M53vn3foraRdHehaMb27Mz09Pd3T//TX
/9///3cvY25wKeBSwKWASwGXAi4FXAq4FHAp4FLApYBLAZcCLgVcCrgUcCngUuD8UICfn2rdWl0K
XDgUkFJyNrwnyPSAxky/yaqrE5xz+2Tf0AXRyVLKzXdRUiA7engRG9n9USu+Z5E0olWcew1eMetd
tWbpi2pdyyaAKX2ihrsgOhGF3PsXJQXAfYTVu/NPMnt+9A/G8GuXcXNMMC4YkybjSpCJyqXdWsun
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
gg==

--_004_DB7PR03MB4841CE1D746B328873113D87B5DE9DB7PR03MB4841eurp_--

--===============3156140689634126866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3156140689634126866==--
