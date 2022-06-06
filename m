Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD08C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 14:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0F9B60BAC;
	Mon,  6 Jun 2022 14:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xu9HkIHl12r3; Mon,  6 Jun 2022 14:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB1C60A72;
	Mon,  6 Jun 2022 14:57:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0B61BF2C3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 14:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19EDC4013B
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 14:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=einfochips.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8JbA43LAt-H for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 14:57:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::711])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 234AD400E3
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 14:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMd1sX5eSaENgw29Sw0b3YmdO1qoT941EILyW/jrQnXe/GX/gkvH87o/lzwwSk/OAHagp0dJbEau0T1jO6+d+3HyBXpA85k6pWa30E3DcEX4Ez/T3ZFBHJaR/IgEIZoNtcfLolqUXu2svvC+2DXET8OwsCc+u/g8GHcy+Hg/ffPebn7/pLeORV3XzXgehgiYOq9N4f5Ve/SqLNWx9Nrp/wNigu+aEtFbhi5knOTLIkRhsqvuTxeeOsqUzpeArDydLNF4uAylLtEMER3HYEWq4aLMMIemoRZRkEcFR6gwQI66jSDZXpCxrjnW9jsVqZoBhxGziiiD8OaCV6BgQk7fXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHQCFkuobopM8fdGUAMwXSH0bDwvGzEPXtFdfSDFuzo=;
 b=Dd9CKeyq3yBjru22cx9yE2vRZwyD33jgVX9AJ0r5CVpbC+JrfxZI9K+1tWUDM1ngkGgDeffWVy1mvZFsCL4205piG8farUD0H4S7zX0Wo2J98fTn6SDGcZqs8ZUD7GZ6Mzml+8sn7d663ohAqZvRTEhcydWNaF5JpLuvoDmLdFzQAFXm1dRBkCLFbm4Z1+OOkDPMRUzdqYJ54HncgNamifhzTtW9rNV9ub6GAyzT17P5MpDKQd7SvQ7QsRKTwujAoNnrYzBQslDBg83nA6LbO1184NbL53C//Dz9xZyzph+ygREh2gbjG3RFHzEyvpo32Wct50H8iioGLLHAXmMvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHQCFkuobopM8fdGUAMwXSH0bDwvGzEPXtFdfSDFuzo=;
 b=i1J+/cQ3HJlKcTUw3WBSQBcb8LFVN2WWx/hbysv7yJK87DEb1RPCFBI5a03JySeijCfpPg5uRpGS2H7XJtIQz1dT1hOo3ddGahDqedbRigZ2+U2AmjkYOePopByFL2v5LJ1q1DnLKGcfYml4oybJryRo0VDPldNNwl0dqMvclvg=
Received: from DM6PR04MB7132.namprd04.prod.outlook.com (2603:10b6:5:247::7) by
 BYAPR04MB4967.namprd04.prod.outlook.com (2603:10b6:a03:4f::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.15; Mon, 6 Jun 2022 14:57:52 +0000
Received: from DM6PR04MB7132.namprd04.prod.outlook.com
 ([fe80::846e:2280:ddb9:c59e]) by DM6PR04MB7132.namprd04.prod.outlook.com
 ([fe80::846e:2280:ddb9:c59e%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 14:57:51 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [ buildroot2022.02.1 ] package qt-webkit-kiosk issue 
Thread-Index: AQHYebHyWGoq7VUpdEiYtVD12OAEVw==
Date: Mon, 6 Jun 2022 14:57:51 +0000
Message-ID: <DM6PR04MB7132613161E6D1CBF58FAB8191A29@DM6PR04MB7132.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2022-06-06T14:57:51.995Z;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=Public;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard; 
suggested_attachment_session_id: c24e837a-3aaf-4f15-6bc0-3e1ecc8ad151
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11e34838-6871-4981-4500-08da47ccee0c
x-ms-traffictypediagnostic: BYAPR04MB4967:EE_
x-microsoft-antispam-prvs: <BYAPR04MB49670383C517C41451D9BF5291A29@BYAPR04MB4967.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3YsNIncLc1ka9u8lMsVIe4PrC/SqEIiez+ihBD3avqagZqydotUK1iAEo762yGwXuL+MTR1QedeFgEC3NrExJx7xvkuPthSljMD1kB/WvY3Gt5xRcdMGoIzF1gw+r0ZULyFD8/fGs/KVkEMtTUtUv7lGPPXg5SI780gWZiFjjJWcZIylaksK3b/t+AR/+cVi6pKy5SLN1YX6wUlXob3om2kKM+jI+wQAkmK+QmKPUzkplyjjUdgCMAAnAFnk4l0AJ43OKaUbpfEyYXsIlC1Jz2Mo4CsX1E58q3rCjYurr+UE3ikq5MquYgGsIplmcQngdy6PO80DLkPdiujcBW39axeGaLVThP6NXT3gcyNeJ6PC2R0/rGeWaTaXBG39uBHlCRkPFCjYph5uKD9RsY9apz7iUQYt5hP+Bag8Z6uyYam/5OtnV058g+pImA4K2X3QzEEFsx+zgzZY9k5ytyY7xmEzZYlaE7t/pt/7EyjSFoyIjKvyuCo4BszurKKUy8MOv/AVraMlB3TM/49pWNUspuYQeD15/l2mvH+PNn0svI29CrAFK/xcn+wiI0rm7H4OKeYWuUcyewM4jYNEunuQPQAnQv0zkpftXA6o+Zz7nMcpJdO03aKJDzTx0plu/IgeMwQZEOUVjTxUWaPMLodw7jEA2UFBhQXL4JW/40hlrq7o8xUol20O8qxAGuiVIi4BYrsYtzxAaMZvwQqlU0k9o31UuxZOYpKTbkTzE1ODmQ5+3RRYMRp+gpywy3rQ9tjYFsW8LzbXEu0YNtgdmqrdWmUyN0ZwkIZkWmpRT8BrptMFN47WJi4f9Ru8txWRC+QX9Fqr750/gKev1OmhJZu/BA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7132.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(66476007)(82950400001)(82960400001)(6916009)(76116006)(54906003)(8936002)(38100700002)(64756008)(107886003)(71200400001)(91956017)(316002)(66946007)(5660300002)(26005)(38070700005)(122000001)(9686003)(55016003)(4743002)(19627405001)(8676002)(4326008)(52536014)(7696005)(44832011)(6506007)(83380400001)(55236004)(66556008)(166002)(33656002)(508600001)(4744005)(966005)(186003)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/v5+JEjByqxILo1z+0zJcQIzUQkgnHQ7sjDC776yg7cJKVt0dbs60Fn3XH?=
 =?iso-8859-1?Q?VHeeiQ+nP8UD+NW2FbGpr994lAPJ9HO/2NLtM5lLYOJ7iFxNcP6C2o8L5y?=
 =?iso-8859-1?Q?nZKxl42q3Rdbr6FMnfllo5/VoqijVDkersJTSb/KyNe6pR2KSuxGSJoCdH?=
 =?iso-8859-1?Q?BtNqO+qJVD/nvaVFVywweS2+0Vu0C4wj9GlrtXA8W51FOKdb9VO1KPmgw9?=
 =?iso-8859-1?Q?7I9TC/mtwJur3Ul0jbr5/7VbqblNmG2ug++QcYunnApQ/qRL6giALEDdyo?=
 =?iso-8859-1?Q?XBicSsvMvkVFO4SN+rsjqltgT56LxhBmvcimH+5hDKyy85xvQgEDpxiCNJ?=
 =?iso-8859-1?Q?FLPduOxq0m+K1/6mhP66EJlP1/Bez8gXrW2UNu5Tjlasq/nZJwpgiGnIiS?=
 =?iso-8859-1?Q?46sCNzhjHHQpGac409aWv/DGwux+IB073xNVINPUvCNngbI182ahf80E/s?=
 =?iso-8859-1?Q?Pr7yu9pgfFbbeBNChjs3o4q/JMH8SZ0CS9O6RVE5/ktsCO5B6JE5AWFPSz?=
 =?iso-8859-1?Q?qUOKrdM4mLJUW6ABRKeyoMNLIX80hkUAFj3bCzkcy67WbQNbYkfDfdrwcQ?=
 =?iso-8859-1?Q?DFzF4yYz+iPpdRkFHkrDFA/0ktmwiTWmHBDreVzdIIxjucmsqpGCKGbkxb?=
 =?iso-8859-1?Q?tS65vBvkuayQ2fT/313SpyVrR2x+0hM23IFYOo33hlAHvpMM3AFwQQw+EP?=
 =?iso-8859-1?Q?SbUTKjeEPliXgwAPBA1UmrvDCxFQ2LY3YksoM/5wEhaaBG2xjeSDc6iiCN?=
 =?iso-8859-1?Q?nDejLCqTadiWF1fSe24cSGyiZPlTyMAGiHcjB1j0P7+NV1CKYaTZiHE4V3?=
 =?iso-8859-1?Q?Y+uqyJfTv6AGCtP9bp/g37SDGA0bH7qRhmOu6B3ts9HeowXRLXhhSrkcra?=
 =?iso-8859-1?Q?EHrWM9LzAh+VPFEHRbVDqWDiryidZ5CEokuOu9pKFn1TXjNH2sad2HFOj0?=
 =?iso-8859-1?Q?JfOr3tNCNcoynWNBCmds4onEzMYTMaNbEX8VlWScV1F7RuMUhuT4ODTU+9?=
 =?iso-8859-1?Q?s98QL8PyhqTCzdONDTXAxGoreMp4M9oWQStgrln6HVxRSqAElOMCAF7/U3?=
 =?iso-8859-1?Q?FMDB14ZFf/wqS5xKboUeYDB0DD4Q08mMbFlMt54vYUE6f+vcm968FfdO/7?=
 =?iso-8859-1?Q?Qyluk08UWy2zXA/dEJh4hoZdAk50Szfdko9Y8wu3gI7PloSMdnmqinzcCx?=
 =?iso-8859-1?Q?xPVtLoTgZVG9pE5v+frH8O3UnxKwCozxgszcBp/u8UIOlYHruoev2E3XC5?=
 =?iso-8859-1?Q?QhjEFwgnh6bXjpywGjJr8AZ5gVNo4m5NM8YxVa30rlODAu1QHO40mkBo1N?=
 =?iso-8859-1?Q?oFNggdJe6C5TZPeT8icB4rtt4GAOVONTG8qmJoxiQhKY8v/Fmv1zCN2oHG?=
 =?iso-8859-1?Q?Ey0U8OJcKpIQlg2vUhBDG/7ys4qWxc8qtpqSnPT/f7nf2NV/8oweQFday4?=
 =?iso-8859-1?Q?KMAhcain7K1D7gCCKzuJDl5MKIV3RDgvpLpb7lS7hFjjB0zWHrhC54HiDN?=
 =?iso-8859-1?Q?IPZfs/bTuYVtSsmTg3j4fGqz7kZn957uSq4PMj3oynUvwbKJxuWUtz+z82?=
 =?iso-8859-1?Q?jiXWVIVHfLsvXACdWZBxArV/2b42BIh9OzlLxHamY9ImVWus/5ZHJmAwJu?=
 =?iso-8859-1?Q?5Lb6/XYXI4PgngHzvjifGiLgRpoTjcfHF+GNVtecM5B1ov+tYYTsBIVuf5?=
 =?iso-8859-1?Q?D5W/g5ElyZ91UW6RjtByB0LyT7oW1RffWt9xMLgCV+WfWegG0ildmJ+jWt?=
 =?iso-8859-1?Q?dYOJBb8yWGY9utBYwFiu4owgMtYR7AfBvfOYy1maHLr3jH4lcgPfpu2w3l?=
 =?iso-8859-1?Q?EoB2tSyJ21+25uA8GHZMCcowzEnZnHc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7132.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e34838-6871-4981-4500-08da47ccee0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 14:57:51.8403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5AdU1+tSWGH6YStvoE8Qf/PboY+TB0SYSmPhxaD2Nmyk3ryx58Y9USIfhhkhz3ra/TI0cmrGGC1DZELES1NA1iqybbQlgQfDbSJCKrognMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4967
Subject: [Buildroot] [ buildroot2022.02.1 ] package qt-webkit-kiosk issue
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
From: Ankit Panchal via buildroot <buildroot@buildroot.org>
Reply-To: Ankit Panchal <ankit.panchal@einfochips.com>
Cc: Naman Thaker <Naman.Thaker@einfochips.com>,
 "erome.oufella@savoirfairelinux.com" <erome.oufella@savoirfairelinux.com>,
 "gael.portay@collabora.com" <gael.portay@collabora.com>,
 ROHIT KUMAR <ROHIT.KUMAR1@einfochips.com>
Content-Type: multipart/mixed; boundary="===============4225830556047452383=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4225830556047452383==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR04MB7132613161E6D1CBF58FAB8191A29DM6PR04MB7132namp_"

--_000_DM6PR04MB7132613161E6D1CBF58FAB8191A29DM6PR04MB7132namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

Greetings of the day!

This is regarding a bug we found while working with buildroot-2022.02.1. We=
 were using Buildroot-2022.02.1 enabling qt-webkit-kiosk with the following=
 default configurations:

[ qt-webkit-kiosk ]

QT_WEBKIT_KIOSK_VERSION =3D a7720e50f2bd70aad99e0b465f5c4a57aca48127

QT_WEBKIT_KIOSK_SITE =3D https://github.com/sergey-dryabzhinsky/qt-webkit-k=
iosk.git


[ qt5webkit ]

QT5WEBKIT_VERSION =3D 5.212.0-alpha4

QT5WEBKIT_SITE =3D https://github.com/qtwebkit/qtwebkit/releases/download/q=
twebkit-$(QT5WEBKIT_VERSION)


However, the compilation of qt-webkit-kiosk gives the following error:

Unknown module(s) in QT: webkit webkitwidgets


A similar bug has been reported at https://bugs.buildroot.org/show_bug.cgi?=
id=3D14606 .

We like to get this error in your notice for future updates. Also, we would=
 highly appreciate any help from your side to solve this issue.


Thanks,
Ankit Panchal

--_000_DM6PR04MB7132613161E6D1CBF58FAB8191A29DM6PR04MB7132namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Greetings of the day!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">This is regarding a bug we found while worki=
ng with buildroot-2022.02.1. We were using Buildroot-2022.02.1 enabling qt-=
webkit-kiosk with the following default
 configurations:</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0);">[&nbsp;<=
/span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0);">qt=
-webkit-kiosk&nbsp;</span><span style=3D"color: rgb(0, 0, 0); font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; background-color: r=
gba(0, 0, 0, 0);">]</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">QT_WEB=
KIT_KIOSK_VERSION =3D a7720e50f2bd70aad99e0b465f5c4a57aca48127</span><br st=
yle=3D"box-sizing:border-box">
</p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">QT_WEB=
KIT_KIOSK_SITE =3D</span><span style=3D"font-family: Calibri, Arial, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rg=
b(255, 255, 255);">&nbsp;</span><a title=3D"https://github.com/sergey-dryab=
zhinsky/qt-webkit-kiosk.git" href=3D"https://github.com/sergey-dryabzhinsky=
/qt-webkit-kiosk.git" rel=3D"noopener noreferrer" target=3D"_blank" tabinde=
x=3D"-1" style=3D"box-sizing: border-box; color: rgb(79, 82, 178);"><span s=
tyle=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">https://githu=
b.com/sergey-dryabzhinsky/qt-webkit-kiosk.git</span></a></p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<br style=3D"box-sizing:border-box">
</p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[ qt5w=
ebkit ]</span></p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">QT5WEB=
KIT_VERSION =3D 5.212.0-alpha4</span><br style=3D"box-sizing:border-box">
</p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">QT5WEB=
KIT_SITE =3D</span><span style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,=
 255, 255);">&nbsp;</span><a title=3D"https://github.com/qtwebkit/qtwebkit/=
releases/download/qtwebkit-$(qt5webkit_version)" href=3D"https://github.com=
/qtwebkit/qtwebkit/releases/download/qtwebkit-$(QT5WEBKIT_VERSION)" rel=3D"=
noopener noreferrer" target=3D"_blank" tabindex=3D"-1" style=3D"box-sizing:=
border-box;color:rgb(79, 82, 178)"><span style=3D"font-family: Calibri, Ari=
al, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background=
-color: rgb(255, 255, 255);">https://github.com/qtwebkit/qtwebkit/releases/=
download/qtwebkit-$(QT5WEBKIT_VERSION)</span></a></p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<br style=3D"box-sizing:border-box">
</p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Howeve=
r, the compilation of&nbsp;<span style=3D"background-color:rgb(255, 255, 25=
5);display:inline !important">qt-webkit-kiosk
 gives&nbsp;</span>the following error:</span><br style=3D"box-sizing:borde=
r-box">
</p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Unknow=
n module(s) in QT: webkit webkitwidgets</span></p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<br style=3D"box-sizing:border-box">
</p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">A simi=
lar bug has been reported at</span><span style=3D"font-family: Calibri, Ari=
al, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background=
-color: rgb(255, 255, 255);">&nbsp;</span><a title=3D"https://bugs.buildroo=
t.org/show_bug.cgi?id=3D14606" href=3D"https://bugs.buildroot.org/show_bug.=
cgi?id=3D14606" rel=3D"noopener noreferrer" target=3D"_blank" tabindex=3D"-=
1" style=3D"box-sizing: border-box; color: rgb(79, 82, 178);"><span style=
=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">https://bugs.buil=
droot.org/show_bug.cgi?id=3D14606</span></a><span style=3D"font-family: Cal=
ibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); b=
ackground-color: rgb(255, 255, 255);">&nbsp;</span><span style=3D"font-fami=
ly: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0); background-color: rgb(255, 255, 255);">.&nbsp;</span></p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">We lik=
e to get this error in your notice for future updates. Also, we would highl=
y appreciate any help from your side
 to solve this issue.</span></p>
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36, 36, 36);font-fam=
ily:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans=
-serif;font-size:14px;background-color:rgb(255, 255, 255)">
<br>
</p>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Ankit Panchal</div>
</body>
</html>

--_000_DM6PR04MB7132613161E6D1CBF58FAB8191A29DM6PR04MB7132namp_--

--===============4225830556047452383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4225830556047452383==--
