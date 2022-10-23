Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E5AECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 08:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75C80410C2;
	Sun, 23 Oct 2022 08:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C80410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCcYrdmH7Yml; Sun, 23 Oct 2022 08:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92018410BE;
	Sun, 23 Oct 2022 08:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92018410BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C28581BF356
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 08:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AC5C60AF4
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 08:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AC5C60AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-0mH7sccx0S for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 08:04:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF28160864
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01olkn2180.outbound.protection.outlook.com [40.92.62.180])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF28160864
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 08:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nzh/8d4rwzGPTaaTmV8c8zM/qjrKzabUNcbiAViNAskhTfEd8HBPOEUQPU8EP7g4T5Q5LH1oG00CPykqwcLjIxWcHsTOpUBBEOfDS48Qf5B+teMQoC0MLJmuDxMmZCyB0P55ZJSHR84nseOGpWaedIb+Mss3t+/55ChWWoUPeFeJXR2nLK6vYis9aMVXVR+PXG1eCkeIzK4fCePnMjNG5qooG58fmu4Ano1s+71evK3t6EfOWT1AnB6+fRJutp6blwezSOA7FSNNDbTLCi/9feqVCmKIs5u/YPGSSTludtIBnTbRyPcgVfaM59/9hwVEA8J59WPJsue1u7fG4r/RMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gac4dvmonRFEzI+jfn6qrWKA1J2X5+OC2sno+4XSSo=;
 b=bNxrHnEQwfXLmJvGVp2HkSY1JNXIz5f64AIaqXCwoN45ublCKndCaxcaOC5mUt5lyXS8rX2hzanRKUU2BxniseB8NwAvxoRieEsI9yP1Nhq2wJp7+v36Nm68Hdr5+al5xnHD/eqUV3imM2lw+YR8CdIVfQ/Lm0WD1dobl4VpY91rVSrHdYGYErcNYQ8rjymr/tw56B0E4TmptAgaXKme3XtZ/z0VgTNQSH8u/HcLVS2cR+H24J58jzz09oy8PkORaUBIgXFarx4J9acPRPFiDDnF7kYpaE0SI4IIE8daaMTIEtUaLtDe+u0YH9119qF2Q7riE7qBw+9v9tuzG8Tvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:161::6) by
 SY4P282MB2507.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:125::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.22; Sun, 23 Oct 2022 08:04:01 +0000
Received: from SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
 ([fe80::e2f7:fbb1:e3a0:f1af]) by SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
 ([fe80::e2f7:fbb1:e3a0:f1af%9]) with mapi id 15.20.5746.023; Sun, 23 Oct 2022
 08:04:01 +0000
From: Bassem Fahmy <t_fahmy_bassem@hotmail.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: defconfig fragments
Thread-Index: AQHY5rVyhVjCy2lYZk2IZpVikJ29cQ==
Date: Sun, 23 Oct 2022 08:04:01 +0000
Message-ID: <SY4P282MB30149AA46B4BC3EF0C01C47FCB2F9@SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [/OCDm84RJP1RFkgbjCde89f6762uAm/kXZxj4XGoFRfPwL1QfZwekozQc7x60DXL4wK7kRKKvec=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY4P282MB3014:EE_|SY4P282MB2507:EE_
x-ms-office365-filtering-correlation-id: ee6843d3-9732-4205-ba03-08dab4cd257e
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 34fyDn2SkRN0HNnMr9D+d2wgLyzUhI90WdsLpsVJFPB0qYZ5DaV7cF6HAtqieMxEYiMtmpXQZJzsaeNv+2aPziBM4Hsm/2LVeSYNNZbEAR2mVo2gkkMnrDmCu+FUiUKfRpndTYbhKqzwDecB5IfVHXwRvifPKD9R9pPJ0zq99nGx4pXR/Fr5bkUbESOqVURwyKHjg6X8gH5F8p7GtvDroMfXa5Hf6BnVvBCDL8t+1ArD/0Fz410rlpq+t6K9O1l5yUrXPYqQ2pkxFzosivh3FRRsOlam/2GHWca77NPLe90nKFofSBu5mWYrCBCpr7Y1tI9BatJJIN16Dtra8g6sx4jBKR7NI1VwQ291YIukZ08KHL10i6UMSyQPJE7HQBMyIuuQ8TeFO1ZQ0arkxTc1PUDpCipUzXV6u0HsU069lb/uB4PD5r2RCmMlQOQK3TyfZplRDvK9Kg0a4mjeJ/jPwQmsCp61v4jxlS2s8gkGRbEi73GQwcZRSUlMxZRPtbQ5imQfeVoSJNx7ds8V4FKAnZgCKnUeImcllOqUS8WH0SCkt0cY+tGbbISgp3QzGEZwo5SgpNUcEnfsGNnztXVx8WeJGXDwn8/t9+U6uQh6J9XuJeQzMND43w0/kH60+hMiwQGY6mn4D2Ze5OTjKxBCsQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?c/dm2HZm+sYbTElV1kGqDk074yfGJ8bY9+hW6luMH6GAbWHg3ejsz25+7o?=
 =?iso-8859-1?Q?s5OOf/Uw5BYAuen1yIkTkdx6+bUNx3ox4LJz6n2V0/2R7u5sHq3GVD5wUK?=
 =?iso-8859-1?Q?FgbT1QX4A8G2fcDAfRjZ0/5kNyg23FnXIxkWsqAeG6IBbzwDAbM15SoZGT?=
 =?iso-8859-1?Q?/BrvN3Oo+AkaBOwfoBuIpI3WlZwvqXmyGa/VuBJdvvo2u1rxMaOq+y3j29?=
 =?iso-8859-1?Q?p4eIZR9rprFjPlRI3MR2VocS9nNTmlwBlC2Qw2yjbqKK2NsiZO6awjHUkn?=
 =?iso-8859-1?Q?Xk0Ha+VVyFqu6DlA5npR0nSobPY7unAEJiHL88Q5zSawE9xOSLrAbc8JYb?=
 =?iso-8859-1?Q?jvbCXItG4ONe1WRxQhQWRXNaN7if+kp+RmZ7cTTcCe7A8/EbByJbfhug/V?=
 =?iso-8859-1?Q?DUhFwQ0RQByN5Epl0gSQigZB9XzO303nQ9pDXG0ki9SYJBzLrSyJH44Lfu?=
 =?iso-8859-1?Q?xM+9NzRHuk+eqgJg7WbEp9qO5cfGOBpOBxOZrSwvRUaYW3UQJFCMb44m/Z?=
 =?iso-8859-1?Q?TC5oNLyDMzry4QZWrVDiCMqpgBSUXZ3HsQ+ZP8zoBtvLRZORoLtmTMMGY7?=
 =?iso-8859-1?Q?SnwMDmkVjTLU6M0AhyKYpnghP6WRsqp0g6PYsaef58y3Og0P0HAr2omGeV?=
 =?iso-8859-1?Q?SbA/iqe7w7FPkvrv+IY708c5dejxi1vqfL+GAoZOhfQvLH/AhdbLqi4Gtv?=
 =?iso-8859-1?Q?6r4ZWwqv4GD/DNKGZt9NQt69VFqxITUGd0/fxYWW2r0qA4vzug1LM7qVkw?=
 =?iso-8859-1?Q?M/VpjvBiBKBBVMUxT8Gxed/aREhqH/rZ8mDPfGErPZZxi3xD4XdMVR6GIZ?=
 =?iso-8859-1?Q?ysTPZMu8i//9FQzPTuIwlFhIbmQrYPWm3XHXMWcCiyd/yzv9nA6JrIM2Bg?=
 =?iso-8859-1?Q?B2lZ09IB+dZIaPvJr2fR+0BmWP9ziKulQZxGgaY3PlZMCvWzShB/YZUT5x?=
 =?iso-8859-1?Q?b+ES4sJTbnsZhNvHAzJSIpe2d9r/jrzLwtZid3jKyFKSb6qY9HR1rWwG2Z?=
 =?iso-8859-1?Q?jNyN8frUphvV3NDe9a2HGN6Rnp8xGdCFRT0bR2x/MKWK3fmag3Pk9RrGFS?=
 =?iso-8859-1?Q?FIxM/DuwL8/nFB9chejUJwMhchemeGcLWiBvbFeIGCzPEEg/rMHhfKjzjg?=
 =?iso-8859-1?Q?BfCXul1nOtwGe/tNvbpcDYZ/UndvXEaQBbShNqElRkM+cbpptEKFJ3lb+0?=
 =?iso-8859-1?Q?Xaqw7FwK0VrlFpev00kCrY8pkgnZ7LAo1nXIjOpBL3St33t9WhWMJ5aQYa?=
 =?iso-8859-1?Q?IuLxU//SYxY0LvopL4od/PW/06+vfpXVfb3RMHkwVp89a6EfTp/f5CRCie?=
 =?iso-8859-1?Q?AGPmjq1+Y+O4DQRx5NonhsmRXUBz/DMpUlDsHpKkqJrEuaWnHuj3EzQQ14?=
 =?iso-8859-1?Q?5K1R0mRnf7lNVnEedgpiedc1OeXZnp1A=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6843d3-9732-4205-ba03-08dab4cd257e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2022 08:04:01.6390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB2507
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gac4dvmonRFEzI+jfn6qrWKA1J2X5+OC2sno+4XSSo=;
 b=ImQSuVFSFrTuc3JQZC/mh9+5OdYB7HxFHL3RACg/HdBKQM1afgIA0K5Aplo3M+hPBKaYJ3YUc2MHq7DaXoGgYDu5qXQK36ZEU/Gn4vdD/obiDp3MkkM89qh3eqEkoSQfBOt9Wfb4Vv6Gs1gHL02Z8RoeTdSwv+gJekHLRZFHJRSos7Zq/BvMURRxiO8x1KLk6dc9DZjeowyhAYJVpyFQj6AR9rVWzpYkvmMGkugLc3egBVHL0ammBUREoQBiRT51QML6FGOpnHtIJtfqahqbxitOOY8gM7/k/yCaaieq5zQnTAdpnlfqKFqPwLKL0ZBq+f0PkVm8Q9ZIErv85KvybA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=ImQSuVFS
Subject: [Buildroot] defconfig fragments
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hello,

I understand that buildroot supports config fragments for packages (that su=
pport defconfig).

But to patch the buildroot defconfig itself, the only way I could do it, is=
 by calling =

> support/kconfig/merge_config.h xxxx_defconfig xxxx.config

Is this the correct way? Is there a more standard way to patch a buildroot =
defconfig?

Regards,
Bassem=A0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
