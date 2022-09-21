Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F72ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 17:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D71BB40DC2;
	Wed, 21 Sep 2022 17:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D71BB40DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhRAPrGWy381; Wed, 21 Sep 2022 17:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D83AD40526;
	Wed, 21 Sep 2022 17:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D83AD40526
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 960281BF4D7
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E4F8408B3
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 17:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E4F8408B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcTz31VBtv4v for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 17:10:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06E6F408A6
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (mail-lo2gbr01olkn0161.outbound.protection.outlook.com [104.47.21.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06E6F408A6
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 17:10:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjSimGHrUszMVsmCd4O6jlFhAs7JyLRGL4rEeC/9wxxvIk6HsavaJErZfOQ6EQN+0MR6ffQ9omPe4WgQzvVHJyLwTeeFj736PP7xq1mG6QwK/gqRRzCWYgOw3P8Y70mftH9Q1BOXLqtnAWvkU+VB2RVqZTJIn+1PQwurmcKyC88MPHJx16LCt0qzqsrttsgajkGqvgsBTlk6yGhZcHwganbmCr3QXyTiGMOte3RM6b4vl8UxDxl//E3PAxUa7SEtiHFLCFCxnSs+vZfQHotNTNso268kZ3dNYkVjZhklHsKUD8dILhIGD6J391IRo8S7+ZXNbjMDWuvI8Opy15oy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+50kQKlBt6SAZsHKclYkbPp8v3KQr8DLK5/qlV6cZI=;
 b=YUI74nsYDTLCchv3noCsbUbGX4k+EJ01yY5HwsNggxSwoQx8Eb7847D07zjbPFKRxnxQnNPzTZ4bP1GmlZdStBKshI8pQJbLeJ5d6G4ecBNSW/ePAE4msg0Bzk0xPDANFYROzJnCAPfrZOxEH3AGmuXuZgneJ8q0jIoNt9CbQl/AhMVOieivTDyXdhs25RT95WpGzcgP66hZyYlxRDeVkWDXO548M2wNkduaRMJixFJWhtoGKlqJrWusGgHp+1LgwTWauCAXwjby59jICTNLREw2zEoxdqod8dw1iUVOuogVB8teUuQ22RW404tBgW1lP5CDB8thW8MDFklDNPcT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:15::21)
 by CWLP265MB1795.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 17:10:53 +0000
Received: from CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f037:b1c7:82d8:fd1f]) by CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f037:b1c7:82d8:fd1f%4]) with mapi id 15.20.5632.021; Wed, 21 Sep 2022
 17:10:53 +0000
From: Jiwen Qi <Jiwen.Qi@outlook.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Does Buildroot provide a mechanism to patch the files of a
 package in the package directory?
Thread-Index: AQHYzdQZYejZ04OK70K0HzX7qvF+wK3qHm4S
Date: Wed, 21 Sep 2022 17:10:53 +0000
Message-ID: <CWLP265MB073949084186060254912CF0954F9@CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM>
References: <CWLP265MB07397A088F5452EE7C444892954F9@CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <CWLP265MB07397A088F5452EE7C444892954F9@CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [dhN48uD40lG7GZxAferVObcmCWPpyLwl]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB0739:EE_|CWLP265MB1795:EE_
x-ms-office365-filtering-correlation-id: 7261f5d6-413e-49b2-2ad6-08da9bf43d66
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lGmKDip5apX4IiQdRthY7T7UgnSk7j21qi+jJGrvNr7R2VKyDLujyODOaRsG31JCfCJJ5WDSLbP5Kqw4cFTQEaZ/k9bpEGncWLVe96ArJBduuWMAzJ9R0xZJi723m3t7ROk0Tpo/qjMhdO/e4PdLxONfEkU3oDAU+hXzrvadDofPWieGk7zqnrFTaIqpnS/ihhkWHMtQz1Sh7P1iamlg8e5EHR9C8e1INBZxnD9qvAFfXzEf3MJQ1kkgV2yCreQ7JDsI5m53ujDqV4xYPBdxwUkvvEagy1gD+m3PQ7ACItufE0IThE6hfIxshIRAWsPNYajHGfG2QpHAU41uJACYg98g5Zx+RIKsMrfNSmZIaB4NhP1rj3WD1HGg2iiCucurexsEi16qCtT9i6Un+jF9uY1oAfohBjm5c8orlnwrXLcQ5IpKMAcov+U7drtpjBMOYFIIlUpR7qJBj7VpDhiclwTpyVlhIdhHIigI+KARC2UzuO0xMifSfNt8zA9fGRq8VNJLAq2GHjg5eV7iYPLETQ6ie0Y4tv1g1GMuqIWz4ghBeupzOAKijQfEuIidPbEwu3XUfuZJRmjgVloGf6SNrDyyM5FefQkmpg716C3RWWwhkai/SeuZvCLhGHgJv/52fzewFZS/Z5UhmdknP8HxRQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vKac/N5Dint66OHMt2umIKhlLmwisgPOweO8NHS2Ks+P6lk91WSvQmpRsX?=
 =?iso-8859-1?Q?D/Iqd5RLQ8lk67hsfKVGldYu1iOo6ry6HYl8vEUnXVJ2C01QiWbRPHLBrc?=
 =?iso-8859-1?Q?GnMFQKb20YNG1hrx5d8KfgSnw588kpkgR2vj3dwapN2z3otYJtyaciQKDE?=
 =?iso-8859-1?Q?B7ZdL+28IwMjrxHgh4z4sIlUpwqiDFhEvRk674zekihUOqcevxH5DMalIE?=
 =?iso-8859-1?Q?u1cQgQ9gMIzYaTXeoFviQ4ReW9BPmafIlytiA/7KwQknUZ5i+/76b18BCm?=
 =?iso-8859-1?Q?eqfz8nj+Xh4XiJjxzo9TeJHHTXGmQLnStT1J5QZUTkgNwxQ0pJHXEMmI7s?=
 =?iso-8859-1?Q?qMI4lFoNsLWY18TCCacUHXD2oj8WqxYOmAxI2c07CXC3XC+FWpyB+K65pC?=
 =?iso-8859-1?Q?6WYu94nxtMsOPbyOFVuNfk93pfASiy3gtM4HpeOKQXDLnyDaJGcf6aNlKF?=
 =?iso-8859-1?Q?LHqgehEAG9vs+HmiCYN49Sl4O+EacjcgcxCg7PnP/QBkL28wwUlB6FpqfG?=
 =?iso-8859-1?Q?NAHkHK8GpCopGFi/h2/EOlAqGYHvKTu1v8kmdElvUyhOFYZIDrBkds9j2x?=
 =?iso-8859-1?Q?JH46djSpjLNFpOW7YUvWO6+tyIgaQ3hjadLysK24XrrPRK8X8zw40zc6pZ?=
 =?iso-8859-1?Q?cMpW5rhiIk9l86hrTkQ8e8mT6rCErzmM7sT2Sd95ji/ufak8I+k7LnQWOR?=
 =?iso-8859-1?Q?FSaRLt1NGG1lXMr4KwiiO+aA7koM7ac0LKBdjNKYhsGLyBhcAKOF8K3iG6?=
 =?iso-8859-1?Q?WaikVKWR0Jlwn8TBnWum8SOmxbxZVkCVTBngUr8n+/5CBJOMl8ppcitMDd?=
 =?iso-8859-1?Q?26Z4KPN21iclUAxyI+YQlWTKq5D1GM4e7rhV3dH+hYT/uKJnU/oC+8ZR3f?=
 =?iso-8859-1?Q?kuokvlctggrFXXpvJvPHCrqFR4lNLtYrSMHgw3cGTjxqsTkixfZxkXo1XG?=
 =?iso-8859-1?Q?BxpDj9q5PnM1+mDG9euYG7RsiNLIv+hzZ6iZ/1p/xz18rYvU1ngndd0MBb?=
 =?iso-8859-1?Q?RXBzoZvAF23Tj8CKvELM98AY7LfagqTtBXCqNkf9w+3AKj67Q417TuH0fn?=
 =?iso-8859-1?Q?zwQiTnhZZtUhT6FKzc470zDMn6ELDIU5tlgmgvBqP/a2JPwkJFhkJEqBwG?=
 =?iso-8859-1?Q?JUaeC56PuUkq+u7gzX5EAjX2zf+N9XSAnVrCkw3DO2WtDqqvdDiBHL50G5?=
 =?iso-8859-1?Q?1qQsY8QHJRiyJsDQ+8UFru55TQ90Rcs8beE4Q9wOdOTX7UtKu+AEtjNkOP?=
 =?iso-8859-1?Q?QwxLhYK/cSjsd/ohDi1a8uvGdBaIhS7E/FEwGH86hfL0NojWq88lh370sk?=
 =?iso-8859-1?Q?Ne0m?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7261f5d6-413e-49b2-2ad6-08da9bf43d66
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 17:10:53.0465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+50kQKlBt6SAZsHKclYkbPp8v3KQr8DLK5/qlV6cZI=;
 b=P1P0hDNKnY7vOom28BNwckr6uIeoL1HRRynrGQic1rCR2n0U00JVHhvXV2yFybL0WLqdmoQXLs4eeOnagfIY+sblcfUOVKlsc8yrcmrv0ckFJOBB1hBghadgCmAkVKKxZL4UGg9HB9b2fWuH13cIYMb3QmhCrlEurPwTLJ4ASCecEfYAVG5Pg0LXnejG0+8lHDJ30yWikkRgIezofRLtvl3KtPymkUbtVq364lXD+rJY5QurtpAs9xVEdD+wM10NTyAgEu0NdxZ8++hUDuDT8gdyGBPOmXs7Lj99c+4QFyDhYZU+7ozPg6PFFnm7HMziRjv51Cdf+gmLubKKl9NQZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=P1P0hDNK
Subject: [Buildroot] Does Buildroot provide a mechanism to patch the files
 of a package in the package directory?
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
Content-Type: multipart/mixed; boundary="===============4052884300047080691=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4052884300047080691==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_CWLP265MB073949084186060254912CF0954F9CWLP265MB0739GBRP_"

--_000_CWLP265MB073949084186060254912CF0954F9CWLP265MB0739GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Let's take the DirectFB package as an example.
How can I patch the Config.in or directfb.mk file in buildroot-2018.08.4/pa=
ckage/directfb. The buildroot-2018.08.4 directory is the root directory of =
Buildroot.

I know Buildroot has mechanisms to patch the files in buildroot-2018.08.4/o=
utput/build/directfb-1.7.7.

Thanks and regards

Jiwen

--_000_CWLP265MB073949084186060254912CF0954F9CWLP265MB0739GBRP_
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
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Hi,</span><br>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Let's take the DirectFB package as an example.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
How can I patch the&nbsp;Config.in or&nbsp;directfb.mk file in buildroot-20=
18.08.4/package/directfb. The&nbsp;<span style=3D"background-color:rgb(255,=
255,255); display:inline!important">buildroot-2018.08.4 directory is the ro=
ot directory of Buildroot.</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
>I know Buildroot has mechanisms to patch the files in&nbsp;buildroot-2018.=
08.4/output/build/directfb-1.7.7.</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
>Thanks and regards</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
><br>
</span></div>
<div class=3D"x_elementToProof elementToProof" style=3D"font-family:Calibri=
,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
>Jiwen</span></div>
</div>
</body>
</html>

--_000_CWLP265MB073949084186060254912CF0954F9CWLP265MB0739GBRP_--

--===============4052884300047080691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4052884300047080691==--
