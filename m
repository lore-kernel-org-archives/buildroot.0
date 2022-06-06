Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A48C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 15:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 329124154D;
	Mon,  6 Jun 2022 15:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnFFA_2rS3NI; Mon,  6 Jun 2022 15:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C38A5410A0;
	Mon,  6 Jun 2022 15:00:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89B961BF2C3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 15:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85D0E40127
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 15:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=einfochips.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBcxPZmyg_ZD for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 15:00:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::71d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46A9E400E3
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 15:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnXAkzZDSeU6eOafL7dbvctuIGLLIJsZhXHYllpjgJ/YpMGeKOpaGq3MCr2lP1QAD6UjwpSPboGWvojhaaxQA/4vrqHEL32VV16CjKrDGufTS6PvIrSZLxBPh3/smwYUOVrS3Sqk19hRmmUixfsBuUmG2d9PCYw+AU2kQO/Ns8aAbCT1t2V2MehDEM/Yd3lARJVO2ZpVjTlzG6hkHTN4qB9kfb5gmP8TcKe6VVTrFtc9wuo4eDEEebvYp/5x2hC6Uc6uI+etJxCPxzJdM8mpaZlmANXTSkgdIijKJ0jhoRlELJI3rSyUDB9tLRqndF1RQxstIeeipp25YHUE8ckOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnajuFuqB1cNuon3ZF7ee3H1tQi5WJ8VTG0cnlgq+ao=;
 b=oV9iK10MYsMo4dZ7NCgOAkCGgaJ9pFhef26ARagU+3blWcQU346DVSthQjHZxIPwGIDZtCG9qsVohpA05m4dwxrC8Ytf/lnVHumCA8xazRqvr7e7cC+G5YulNBqDwYQ63sg/OsE65qict7708dPq4ztu6gunk7IsiHPsf6jlJ1MGzE9WG1Py/ntV44yDK27K1s9uoA0slSwFgPF78pTXz0ehOylMqo4h3+evjVZEu+kHs0ohiz9FhCPS2xudsuhnfETqaVpzUwggWsoFhpL6nXIZjjX3YSQHhsYAQCSDGt4AwSNi8EUOpGlXwfCKEvSaQF4kDSMsb3XjWGjQYK7y9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnajuFuqB1cNuon3ZF7ee3H1tQi5WJ8VTG0cnlgq+ao=;
 b=Z8Rdgqeb9vCyCR4MmVqn0gg/YnPWb2cutOHTzjAJP2L+ZVvEU1CzRdIwz5Gi9DI3pOlMGrGfM9KKJFAh968jV8sBAb/Qv2CGf3VMboBcUbHrySyh8NyhQ0oOCAsH2LM1UbREmE5gC5VB9Q0r5cCk7CSEzS7NFvdnWpH54LnpG3U=
Received: from DM6PR04MB7132.namprd04.prod.outlook.com (2603:10b6:5:247::7) by
 BN7PR04MB3972.namprd04.prod.outlook.com (2603:10b6:406:c4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Mon, 6 Jun 2022 15:00:24 +0000
Received: from DM6PR04MB7132.namprd04.prod.outlook.com
 ([fe80::846e:2280:ddb9:c59e]) by DM6PR04MB7132.namprd04.prod.outlook.com
 ([fe80::846e:2280:ddb9:c59e%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 15:00:24 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [ buildroot2022.02.1 ] package qt-webkit-kiosk issue 
Thread-Index: AQHYebHyWGoq7VUpdEiYtVD12OAEV61CeIQ1
Date: Mon, 6 Jun 2022 15:00:24 +0000
Message-ID: <DM6PR04MB71324EBB08046E1085EEF62391A29@DM6PR04MB7132.namprd04.prod.outlook.com>
References: <DM6PR04MB7132613161E6D1CBF58FAB8191A29@DM6PR04MB7132.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB7132613161E6D1CBF58FAB8191A29@DM6PR04MB7132.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2022-06-06T15:00:24.048Z;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=Public;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard; 
suggested_attachment_session_id: cd23a721-c2b5-d153-474e-81f1cd489e3d
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d8f38b7-cc58-4048-8888-08da47cd48fe
x-ms-traffictypediagnostic: BN7PR04MB3972:EE_
x-microsoft-antispam-prvs: <BN7PR04MB397271A2AB0B80685B980F8591A29@BN7PR04MB3972.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KjyxYfwzgrRkfq3mnuxofPGd0tSUz3DfQoPXMwY00//1U27XG8ZQuJJEVhvhY8FDxiNuDdP4L+EZQ9+G8QTxxCsJ1lC7oHGgZY8GYZmV79Er9bGh3TsQqBT/ZTWjtW4nNKN3THr9DKuP4ZpUbs9XUrGFY5aMsoLgNeXO4Xg10RCWAM/1BWSmQUDd/OiJCZOPeoArdlM7q8tAETIvEqLPEv8wzm5RplKOcAKojDtPezn4uWOWtv0AmrnD98/hC63mHesx29W1/Lq4/jE/4sDVp084JuO52bp8NqfmwR9i8XK86xrxRDtfCfLXUkpAqbl2SPEsc3aaoBAoLTRQjVhpaCA+eTgBKhvi9YWNhB2jcQ/qsaOihNLFh+5vwBXJISW/f57emp/nzmLBj/Qwb4UeCpqZt+kQt1OV1XoVTs63E3FuG7szh+7ELZSqvHr+3Z6CoeiJBtBbXMNy5EBxfJqHAig6rbAhO5ZXgHnTGY75boYu/lojRCLQRpqgq5Yor9MilsznFXJyCkxtl8LfacKX2ve19E0Hzjk/zw8sSrjiLfKJrKVMrwJmp/FVqO+X1WARpPKuHz6SK+Yx7j8sYLBXB/uMm6tTH7uMZguo39B2usbMzYlQpeumqnGFjJjV/eryJVyWzym5MIyjbWJkWABwl4TsJJ7/TsBNyX4hOh7wP0TZIHJdwujICP2trCdyMLGhpACasFlvE6+qb7eDlrRiRwCVOvLuM4Gmcq0lYRnRYXyaQumtNAtlDNaylvKP7hwMI0k08emVnpzLzBGwh4McXlWdjR2C78z4ngTeDepby+zLjyxY7fFcQc+RE5djwiqf1arqdVWLUofTC0eyQ6rcqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7132.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(9686003)(55236004)(2906002)(6916009)(6506007)(83380400001)(91956017)(38070700005)(186003)(66574015)(82950400001)(86362001)(82960400001)(4743002)(122000001)(76116006)(2940100002)(4326008)(316002)(8676002)(54906003)(66946007)(508600001)(64756008)(66476007)(66446008)(66556008)(44832011)(966005)(71200400001)(55016003)(8936002)(5660300002)(52536014)(33656002)(7696005)(166002)(38100700002)(19627405001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?89MnjqeXCn/p88nKgan5awFP8qVy/fIgye1E7aBJQ7IWU3qXa8gsRgqhUf?=
 =?iso-8859-1?Q?ECGLqFlabguQNIqGcxdf8WWsFFerRsu/t6O9lLGw5pm8jLazGkPOcqX54B?=
 =?iso-8859-1?Q?GmLpElc6oO+YCu6mfq5pA7GZjKcOe9ohB7Gc/naTfoWAKhpXwa6YAEn07X?=
 =?iso-8859-1?Q?TKbaHyjdQuxWSHRTiMVnPpqQf9clIWsoKI+iYrqD4bkJHnqH6wVm5aqlQ2?=
 =?iso-8859-1?Q?SGmQZvXMliy9EyWRZYPIy70XaFIS0kTXZVyLW+uwwVTEkjB9jmpJKooqyK?=
 =?iso-8859-1?Q?1/jNeLYS74ezwyuBgVKnoomNnScUxif0XNAFodvPe6hgCNnS2GnM3WkiNf?=
 =?iso-8859-1?Q?05ZQaSW35utVZNg7NXiNagRG5SWc9/A/PyNhmwrexz4GSM+06T/EcV99as?=
 =?iso-8859-1?Q?H++Ysspa36sq7yVm6G4erbIXo9WUrZ0ThefJcfZrpMw8M8A91hhPsz/OsL?=
 =?iso-8859-1?Q?bH4onlCzBl6tHPUC/Hamf7LBKa60KNhjsnFUoe92cwALHBF/2fPGd617uH?=
 =?iso-8859-1?Q?kOI+msrDeYraTEySRaB6LmdziPED02qTukMRj2wDEhP8U9uBHoS/9vjPDW?=
 =?iso-8859-1?Q?yhUV5h5eMJoGqqfLfTX0R49dpeePDzN285QxulwI1GcjengGhPF99fabeD?=
 =?iso-8859-1?Q?87hJumAJ1lU7F1CHOlkxqWXZxcAyTMc/ARhQ4LXJjxfIPO2Jo3Y/y96zvO?=
 =?iso-8859-1?Q?pnizIrWa2PRAyh0sp4pP2coIlSMcZixQi3QP7i3Zkqh+Iguj3xPirGML+e?=
 =?iso-8859-1?Q?MyiSNhVX/ZLrCAueA6SuvPduMb/oLfyrx4tWXnC69awNm1TO5DE9HINJko?=
 =?iso-8859-1?Q?Cb/6rypxsAD/M39DciezF5+GyAR5AfL7uZz1xtLed8+5tppjYnpmjpWWQ6?=
 =?iso-8859-1?Q?DzXLn360QyiWt9azqfrxCR1HamoJ67C/DB+5J2yZEcywyu8qXzpOxJhbOL?=
 =?iso-8859-1?Q?uEGguFtMEHDfIL7elKHFowWCqq4bZ/xVwyGfslngALvGz/lfcK+tut2wDS?=
 =?iso-8859-1?Q?PgsgxlB12ZzPWw1acS6xRjF/ScxiEnQyDm0HSPjTbJAa+iWknJ04FDBKnd?=
 =?iso-8859-1?Q?nesTSMkzdX97R+jtA8AT0n5wpCWNSbTOqQ43ayYf6rBzr9JIi0ozkVXnVo?=
 =?iso-8859-1?Q?EWNe4+d+/UqzeWhroczmzzGRMhjSF3h+tf9yts8F6Umkp4FUEwWuyvkQTX?=
 =?iso-8859-1?Q?QLv31bXfn984I8zAnBkIgGWJgFz1rJw0RYKAMtAimoi4UhaljRtE/UFRhL?=
 =?iso-8859-1?Q?+U0h+xuPHHXldAa1CZM9y/zOvTa/+2IyNrsZNYtbfkW6FrTOsQkUXoryZE?=
 =?iso-8859-1?Q?b1cOrP3rB9b5mfj6CX93SPEeCg0iF4oB3YcST5QW+htTaPeW3jznI1h+rC?=
 =?iso-8859-1?Q?l1GsmGuwWYBLitvtehAzllklsrMPoBeYxxE5USI1sg0rF7d//rvb7+ngYB?=
 =?iso-8859-1?Q?QZ+I15H131uomgVM8ydKlIx0lqymKOheXW4wz3Dh1D8fezCD8OQdvBN/Hv?=
 =?iso-8859-1?Q?nWVuDoIpwGLUJ9SVskDKkOlf3uFXt4sVIIN1rmpcEwJC9PrRCHRJDMwnOl?=
 =?iso-8859-1?Q?iBFAI6+HqJMqSz8g7UVu1u01tUs8QooCX+NjJjeOV+ujWt9qjC9sfp7xHt?=
 =?iso-8859-1?Q?lOXyOc4OM1jD+08V5wkpoqtdL7q9X//AgMKxcI8ehD+Ueh2FPx4h6uFhhS?=
 =?iso-8859-1?Q?zJXxpg7YIGv75x20yHqVmz52/1y1xLMqwkzi3N071b8PxOiEXLhdI2ChmF?=
 =?iso-8859-1?Q?XPCJ3+kDI543qicGSdGpdx7YolLOi1pbA3/KvWY660+zqbOkBA/tP0wAE2?=
 =?iso-8859-1?Q?NvkqkA92ON3X4EGRbRTysIsp0W7GcJA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7132.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8f38b7-cc58-4048-8888-08da47cd48fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 15:00:24.4698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unqUFFjjTejzI0slAP9V7MpoBJw3KHFeuBZhO/nG8BmPLDib6kXU7XKcjk9DVwBx6E6trzMxE8v/w3Ln8UKfaJEyk9PPttmYV6lISlanouQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB3972
Subject: Re: [Buildroot] [ buildroot2022.02.1 ] package qt-webkit-kiosk issue
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
 "jerome.oufella@savoirfairelinux.com"
 <jerome.oufella@savoirfairelinux.com>,
 "gael.portay@collabora.com" <gael.portay@collabora.com>,
 ROHIT KUMAR <ROHIT.KUMAR1@einfochips.com>
Content-Type: multipart/mixed; boundary="===============4083756288118422023=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4083756288118422023==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR04MB71324EBB08046E1085EEF62391A29DM6PR04MB7132namp_"

--_000_DM6PR04MB71324EBB08046E1085EEF62391A29DM6PR04MB7132namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

++J=E9r=F4me Oufella

________________________________
From: Ankit Panchal
Sent: Monday, June 6, 2022 8:27 PM
To: buildroot@buildroot.org <buildroot@buildroot.org>
Cc: gael.portay@collabora.com <gael.portay@collabora.com>; erome.oufella@sa=
voirfairelinux.com <erome.oufella@savoirfairelinux.com>; Naman Thaker <Nama=
n.Thaker@einfochips.com>; ROHIT KUMAR <ROHIT.KUMAR1@einfochips.com>
Subject: [ buildroot2022.02.1 ] package qt-webkit-kiosk issue

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

--_000_DM6PR04MB71324EBB08046E1085EEF62391A29DM6PR04MB7132namp_
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
: 12pt; color: rgb(0, 0, 0);">
++J=E9r=F4me Oufella</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Ankit Panchal<br>
<b>Sent:</b> Monday, June 6, 2022 8:27 PM<br>
<b>To:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
<b>Cc:</b> gael.portay@collabora.com &lt;gael.portay@collabora.com&gt;; ero=
me.oufella@savoirfairelinux.com &lt;erome.oufella@savoirfairelinux.com&gt;;=
 Naman Thaker &lt;Naman.Thaker@einfochips.com&gt;; ROHIT KUMAR &lt;ROHIT.KU=
MAR1@einfochips.com&gt;<br>
<b>Subject:</b> [ buildroot2022.02.1 ] package qt-webkit-kiosk issue </font=
>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hello,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Greetings of the day!</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt">This is regarding a bug we found while working with b=
uildroot-2022.02.1. We were using Buildroot-2022.02.1 enabling qt-webkit-ki=
osk with the following default configurations:</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt"><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)">[&nbsp;</span><span s=
tyle=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:12pt; background-color:rgba(0,0,0,0)">qt-webkit-kiosk&nbsp;</span>=
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)">]</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">QT_WEBKIT_KIOSK_VE=
RSION =3D a7720e50f2bd70aad99e0b465f5c4a57aca48127</span><br style=3D"box-s=
izing:border-box">
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">QT_WEBKIT_KIOSK_SI=
TE =3D</span><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;=
 font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">&nbsp=
;</span><a href=3D"https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk.g=
it" data-auth=3D"NotApplicable" title=3D"https://github.com/sergey-dryabzhi=
nsky/qt-webkit-kiosk.git" tabindex=3D"-1" style=3D"box-sizing:border-box; c=
olor:rgb(79,82,178)"><span style=3D"font-family:Calibri,Arial,Helvetica,san=
s-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,255,255=
)">https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk.git</span></a></p=
>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<br style=3D"box-sizing:border-box">
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">[ qt5webkit ]</spa=
n></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">QT5WEBKIT_VERSION =
=3D 5.212.0-alpha4</span><br style=3D"box-sizing:border-box">
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">QT5WEBKIT_SITE =3D=
</span><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-=
size:12pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">&nbsp;</spa=
n><a href=3D"https://github.com/qtwebkit/qtwebkit/releases/download/qtwebki=
t-$(QT5WEBKIT_VERSION)" data-auth=3D"NotApplicable" title=3D"https://github=
.com/qtwebkit/qtwebkit/releases/download/qtwebkit-$(qt5webkit_version)" tab=
index=3D"-1" style=3D"box-sizing:border-box; color:rgb(79,82,178)"><span st=
yle=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0); background-color:rgb(255,255,255)">https://github.com/qtwebki=
t/qtwebkit/releases/download/qtwebkit-$(QT5WEBKIT_VERSION)</span></a></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<br style=3D"box-sizing:border-box">
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">However, the compi=
lation of&nbsp;<span style=3D"background-color:rgb(255,255,255); display:in=
line!important">qt-webkit-kiosk gives&nbsp;</span>the
 following error:</span><br style=3D"box-sizing:border-box">
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">Unknown module(s) =
in QT: webkit webkitwidgets</span></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<br style=3D"box-sizing:border-box">
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">A similar bug has =
been reported at</span><span style=3D"font-family:Calibri,Arial,Helvetica,s=
ans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,255,2=
55)">&nbsp;</span><a href=3D"https://bugs.buildroot.org/show_bug.cgi?id=3D1=
4606" data-auth=3D"NotApplicable" title=3D"https://bugs.buildroot.org/show_=
bug.cgi?id=3D14606" tabindex=3D"-1" style=3D"box-sizing:border-box; color:r=
gb(79,82,178)"><span style=3D"font-family:Calibri,Arial,Helvetica,sans-seri=
f; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">htt=
ps://bugs.buildroot.org/show_bug.cgi?id=3D14606</span></a><span style=3D"fo=
nt-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0=
,0); background-color:rgb(255,255,255)">&nbsp;</span><span style=3D"font-fa=
mily:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0); =
background-color:rgb(255,255,255)">.&nbsp;</span></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">We like to get thi=
s error in your notice for future updates. Also, we would highly appreciate=
 any help from your side to solve
 this issue.</span></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;box-sizing:border-box; marg=
in:0px; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<br>
</p>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Thanks,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Ankit Panchal</div>
</div>
</body>
</html>

--_000_DM6PR04MB71324EBB08046E1085EEF62391A29DM6PR04MB7132namp_--

--===============4083756288118422023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4083756288118422023==--
