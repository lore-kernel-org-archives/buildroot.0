Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCF7C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 13:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4A7A41922;
	Tue, 14 Mar 2023 13:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A7A41922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pnjcU7n4g6Hm; Tue, 14 Mar 2023 13:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54909419B9;
	Tue, 14 Mar 2023 13:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54909419B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0221BF3D4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 13:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C85540A8F
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 13:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C85540A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edZ-75RjiQbc for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 13:03:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F4E400A6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::718])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2F4E400A6
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 13:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nj+0Igm8rJOc1cxyghYKaiZkJNSVfR4xbSs764BS5+O6pfDNtVSZWUcpcVMoXMfnqcBvqpt8GSputkoizyzuTg6oAwIgqQuVeqA05BABmcOMiuK7cO7UGOLrahKiPM5kp8tYI62fuYhw5jVrhEO+VvPayi+A76xDxZDrYOGTcY+F4h6KqVRxyU2AObe3cxlJ8ufuSuqWC0xobLJPoJNLoq9zqhTjFMzL5448XLufxJgFkLZmP/M+KIFI+ot85LzO1a7cs9XAXxX4y8bAoCwO05ayNmfYdfZkG3tbx9Fa5jGOgcjbkeA//FGJZV2MS7AGicTXqGNc9ykaA6Ehgktbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9USkxZXsdeGTZvtJsCkj2VAeq6UcfWMbIM1Xsls5hY=;
 b=jXhzgOboUuOUGGITNxbszkyVzcRw4zz3JNOVvTX6hbtN+KwJRZvRJ6Dt+Ffk+rZuHSrsmXutp/S7wZfxNxkx5hx4db4/YIcMpx/dgm23jYllWtU2lcQgoSWvzBAaS+zvnnSHes3QSE9WgPw9lR5/Bs48Tdu5N74OTPtSa6mbwS/KekWB8dJgwEzobl33t6dyyREp0f3w5Xtakw3H16FyaFWjLgDs7Da3yaZVR+LlCg5zjIzCeVLJZP/Kp+5xKpL1Dqqyu4a+W52BncK7SNV5YtuQlgH3DxkwjtAvuv8x7V4GF3Q313+5l+mZsmt5VH6RTRW1/vcMUjuYd1a9xk1uwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=circontrol.com; dmarc=pass action=none
 header.from=circontrol.com; dkim=pass header.d=circontrol.com; arc=none
Received: from DB4PR05MB10390.eurprd05.prod.outlook.com (2603:10a6:10:3f1::21)
 by AM8PR05MB7266.eurprd05.prod.outlook.com (2603:10a6:20b:1d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 13:03:01 +0000
Received: from DB4PR05MB10390.eurprd05.prod.outlook.com
 ([fe80::618b:8010:3d88:ab1d]) by DB4PR05MB10390.eurprd05.prod.outlook.com
 ([fe80::618b:8010:3d88:ab1d%3]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 13:03:01 +0000
From: Ivan Castell <icastell@circontrol.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Missing support of libsvg with qt6
Thread-Index: AQHZVnKaWWSn14BgnE2zOTV1WCBR1A==
Date: Tue, 14 Mar 2023 13:03:01 +0000
Message-ID: <DB4PR05MB103906C9B5FCFAEBE1B0FBF8CA3BE9@DB4PR05MB10390.eurprd05.prod.outlook.com>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR05MB10390:EE_|AM8PR05MB7266:EE_
x-ms-office365-filtering-correlation-id: 1964f80f-26fe-4b27-a898-08db248c7151
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PtkjOJiavULvWhlxiwRY+4Tlef0o827SLg5cslZnCwxa2/q1sZS2ldaD9W8besBIBq/ISStdlvDzmGFhBjTOnijVJDiyIK6QRSOftAhRl43a8B43Q2z0hmd6MvjQhNG3e/EPvhYcteKsJTeEEzBC/sv4vEY3L6qJeCxkzz+3M3XuUzlw+nF2/P5Ofk3g5qM9ntprREobUzSz4uxXeJeQTQVpc1Bj03mRLdlyFm/7ARWvtuV0oY2SVUj/C5qB8dza8CaxP6vIjlP6bf0u6B4vGgWMpxZdMKlTjhgkEHuG9G2QnN8Eh6lEVoZaQ3dJX0PdqyftKmINp+MUbuNpf5C00mmlJroE3WI2dgvPIN5yZBxgTylxgVW6NISK3ufD0qRADZtdeESoTK4BIV67iISx/JrqiHnk5qhfy0jtAIt2fieQikuZdecaAKEpRIs4z25OfZ4GcmfLzN6fVUYJbyJmrcHWzBd/oDL1dPwpShAg4wt/zk9gAIO2Q8cq7QtkoJQlYgzZFukO1mQBtrgu42F4C7gSbHztDpUTzBa629wKgT4m9EsXoJB6JBdujM9PZZrbm6gK+X8GAsan4IOEGTs8dlbDkSZELfgieDMOpQfOLLaorU9GrPEqoGgDHyvrQrjvLcqKnay+YdOKn/W90hTz5TZOELaqoLivrIIpyuu7kSOJwgcVh1uLhm8QRODj+MarXqlFT0P/KSH4QVQ4DoatgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB4PR05MB10390.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(366004)(136003)(39850400004)(376002)(451199018)(19627405001)(8936002)(52536014)(33656002)(91956017)(478600001)(316002)(66476007)(64756008)(66446008)(8676002)(66946007)(6916009)(66556008)(76116006)(41300700001)(2906002)(4744005)(5660300002)(38070700005)(86362001)(7696005)(55016003)(9686003)(6506007)(26005)(186003)(122000001)(71200400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hcO6BYBZjryLVx706RmhjwC71/WJlxbwGDjXesthg72H/W/nbylwk2VbO+?=
 =?iso-8859-1?Q?XjuQxp24CExCbJuCHKgUz1BRHL9S4cuIIkBPmaG8W7SaxFtBt+ID44RBV0?=
 =?iso-8859-1?Q?OBV5gSsS3VZhfZg+QPx2ULqfqCSK7xAnPaMXs/8LdEoayjaIHEgx04IGSW?=
 =?iso-8859-1?Q?987SdU5n4L+C5EoFAfGi9UE9FR5cQghxbqthBvdzw00LiqyhZa9cczBDjz?=
 =?iso-8859-1?Q?JHD/+4VRH24hIeM50AdIDdeyyrxboGg9kTalOeyADjY+PXQxwqWe7m5hue?=
 =?iso-8859-1?Q?7E8qtOvPEM+zpujp/dKSm4y0D3KWjJdE5jhYBafrbXmSz1RwWbp8CwAHRf?=
 =?iso-8859-1?Q?mguFdl57EYZiJWuD5wczh7jEU+jDOBKaEr+KLcAfoZDtrhHhOe00AIQ5LW?=
 =?iso-8859-1?Q?zgwks5f887bJThRNj6QI5U9ydqsochZdt9684XM2l2WQG/e/ZlKjiHDI0Q?=
 =?iso-8859-1?Q?VyMIcDMlsFXvLVoHQHoMUoSzzetvlagYA3zrligxq8vE6ramSnoRl/f9+l?=
 =?iso-8859-1?Q?8afpp28wdOgNBidcE4tFvIHtV1t5vCYPQAwjpYAQDonCA6/GKVFLaaYpTd?=
 =?iso-8859-1?Q?wAUlOZymel9fTAVnx3MXwJ4ct2inH4DYzTxRFIH+aSgEFesi3v1x5/wHNu?=
 =?iso-8859-1?Q?41MwQLTpfMVk12GAQrcQ4XN7p4M7sVilfdxXem7zf4nkF4cFhL6UcdRpH/?=
 =?iso-8859-1?Q?63UmyUWgiz/TRRKQYZthJ5X7LivFPHK/SYUzXJKLHks+eqnNEFI68GmrD5?=
 =?iso-8859-1?Q?nGtqxH2o8WKt14xHvQRdd2dxhXcE1fjkqc8FCHffO8FJggt4ibIaZD58u1?=
 =?iso-8859-1?Q?sWZlrz1sOS8NIgESKMwuiFI+oUXcRkUcGfYousqHTmRUDiszMhHZoNJxkn?=
 =?iso-8859-1?Q?ZIXaZHdJNGRE8YEpojUYwXyDs22yKdA0V2qFmZJ1sQ1+LfUYoPByXNtUG+?=
 =?iso-8859-1?Q?zR2ABv99h1L/NhH6VR0o2k1UGvHqe3u9wmpfjQLXXGzhn7Ac+idpkfd7fZ?=
 =?iso-8859-1?Q?XopgrOhvUQ9fHAfxm6S68UgjAF6EOxyGVMIBRA98YODybUp6CT5B4Q+THU?=
 =?iso-8859-1?Q?vuel68ECeJmjJcnThZSGjTZoduOpTRRmZ+wif2l+UBIDWw0My1Xr9HzU8c?=
 =?iso-8859-1?Q?eiFuZodcDTn4H9YgQ/9+Yme/f5tWQbmemEuU2zTRfqm4kCkVsA650Uu+V3?=
 =?iso-8859-1?Q?cWVWhM7xW/ZWwdTp8J9JtdfFFfm0rtdFH8eQDNSEzC/s6+p3jmVYTjsPMf?=
 =?iso-8859-1?Q?xQ8G7duCjuX7vNjpajQfRobkippea0wN+t7lEZWAWlaNEc3gFyqusCdVwt?=
 =?iso-8859-1?Q?Gl48YTj1hAzxQ71TK+/WbkZF1fbHoctfhvSmbPgR/Yz/uFkMyHU0PtWc9d?=
 =?iso-8859-1?Q?faUcQecDVnkkuAz01PNVdQlGFt8fJ4U6bkmzweVy5BDJ9UPPVWAEKWCK7p?=
 =?iso-8859-1?Q?vul9RcCiM80A66P4nDoWIUm6/yz1F2JmTO2qoHivpxlI/TaNHAyU1Y7KL1?=
 =?iso-8859-1?Q?y+SzTQPyaYl8I1BMvQrZJESgqiWHX/Z4nRZnbv2vOv6BN//eiql87Ib7G/?=
 =?iso-8859-1?Q?m8ellUJTOW9IFBslb4jQL0S5VhZDfazaO58UmNsDtj0Ns77y6Y4vNPWQGl?=
 =?iso-8859-1?Q?70yv4dKsYr5D4v6zi2di1xlpDeVdjpULXn?=
MIME-Version: 1.0
X-OriginatorOrg: circontrol.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR05MB10390.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1964f80f-26fe-4b27-a898-08db248c7151
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 13:03:01.7943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c673de90-55df-4102-975b-51c12c395a99
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vrNm3uY32lIqQvqNNLUVlKts1cAxSc3oJ5T1Uf5KVWVjlyOqs2YNzCfeH+HHkL5dSZz5ksPED5TVFggfBKNBbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR05MB7266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=circontrol.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9USkxZXsdeGTZvtJsCkj2VAeq6UcfWMbIM1Xsls5hY=;
 b=ydE4PBWJIs4hX9gejOd0ZjKUsrSXorGL3PoYar9XSAaIYzteFiGWa1JChO4xhqeRWyRtT1nsd2imheozg1k0LZUPgjkQDzlc+2pJD7pRWzTxdd80253a7iDPOST/4okGwp+unVdnhrWUZG8FCToUED8e5vqzmXfMFaghDKiXijw5d693Ar9Wgi2WfyvUf2knOWsGf6sqxEmJ1jqFVB8PcW1JSUBsvXShzc8YRHGTD50+j4ORP7YPmb6etDRbV/LmPZg1i7d/dwotD04fdbxOxleGi6St3bODwEiyiOGd83vLb0SZQbuBfjQ/IIniQzj2Mk/B4cNQteV2ExlvYp1WXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=circontrol.com header.i=@circontrol.com
 header.a=rsa-sha256 header.s=selector1 header.b=ydE4PBWJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=circontrol.com;
Subject: [Buildroot] Missing support of libsvg with qt6
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
Content-Type: multipart/mixed; boundary="===============1517689824386526240=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1517689824386526240==
Content-Language: es-ES
Content-Type: multipart/alternative;
	boundary="_000_DB4PR05MB103906C9B5FCFAEBE1B0FBF8CA3BE9DB4PR05MB10390eu_"

--_000_DB4PR05MB103906C9B5FCFAEBE1B0FBF8CA3BE9DB4PR05MB10390eu_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello there!

We are using buildroot-2022.11.1 to build a custom QT6 based project. We ha=
ve this option enabled in menuconfig:

BR2_PACKAGE_QT6=3Dy

But found this issue building our project:

Project ERROR: Unknown module(s) in QT: svgwidgets

It seems there is no way to enable SVG library support on QT6 (at least we =
don't found it). However, SVG library is completely ported and functional u=
sing Qt5.

BR2_PACKAGE_QT5SVG=3Dy

Does buildroot will support SVG library with QT6 in some future release? Is=
 this still a work in progress? We have checked buildroot-2023.02 and even =
in that recent version, is still not ready.

Thanks a lot in advance!.
  -- Ivan


--_000_DB4PR05MB103906C9B5FCFAEBE1B0FBF8CA3BE9DB4PR05MB10390eu_
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
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hello there!&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
We are using buildroot-2022.11.1 to build a custom QT6 based project. We ha=
ve this option enabled in menuconfig:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted3">
BR2_PACKAGE_QT6=3Dy<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;">But found this issue building our project:</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
Project ERROR: Unknown module(s) in QT: svgwidgets<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
It seems there is no way to enable SVG library support on QT6 (at least we =
don't found it). However, SVG library is completely ported and functional u=
sing Qt5.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted1">
BR2_PACKAGE_QT5SVG=3Dy<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;" class=3D"ContentPasted2">Does buildroot will support SVG library =
with QT6&nbsp;in some future release?&nbsp;Is this still a work in progress=
? We have checked buildroot-2023.02 and even in
 that recent version, is still not ready.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Thanks a lot in advance!.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
&nbsp; -- Ivan</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_DB4PR05MB103906C9B5FCFAEBE1B0FBF8CA3BE9DB4PR05MB10390eu_--

--===============1517689824386526240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1517689824386526240==--
