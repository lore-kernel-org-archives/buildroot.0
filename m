Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACECC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 13:53:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC6261157
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 13:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CC6261157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unilogic.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EED283AB4;
	Thu,  5 Aug 2021 13:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djFlTNbn9wTC; Thu,  5 Aug 2021 13:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E1D83AC6;
	Thu,  5 Aug 2021 13:53:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF6D41BF41A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 13:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBE63404DE
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 13:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=unilogic.nl
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6wUmC9GCAZt for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 13:53:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB579404ED
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 13:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+0iyzUlaN316k1xU5B7FVmfcwaG1zkbD5s0lj9k6VDdsA/qGn+fUFA39bEy1TGdTxZFBPRK4wj+kwGkZteILyIWNvv9/UkQ6zQd8djH33Xg1B/zMlvxiWGlSBbLTs6OevH7A2562Ij68kSS/rGLOdv4B4b+2S4dakCOvpX+FkY7F8C6horKNn/A05TKGw1AQYhnoiwvguNG8JlHhcmY0Bjp8UL00M1op7khmx1RkdlRpaAgjBLWTBsj/dfS09c8m5Udgp9Mvfe2NKZ37ASGmMCKD6i5YIhZ7NPo6v+4daMVm4Z0ZcHRy+uZaqdodi+KsU2lKRNpoEvkfTRlNyFKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msMWC23hAGng94Q2N8KudAS7I4oUAWN+7t10zi6P0cg=;
 b=M/Xw5DZiBPW8oLn1K1xa23RFl6TJjQ25xtVj5n7hnPKnnXeRmWD1PQ8+9u9ikkLdEGjtXRHw6sfL8aXYr4cCZtjAExMOZX+ouEcxVeR8t7Yl97RPRcV1v6iSpCIX3WHdkOXGva7L1gFmONspPIeMX09bV+7QL4qRQQ0MXqCkGhEJMqVu6E7LG+EdZ9K4MhS0iOKYdjxLDBslFt6KJhma7VIWFT08J5znqYUruUxS89KZXCVxC2NhXAf9D/37ReMpwiw91c91pCEkQxUVcUh6COmcwhBheWmRLZ5sIed2qWOjQL9YlsAjpNU8zjjE8MY+z+yt1FnXFj2/AKgYI1V/ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unilogic.nl; dmarc=pass action=none header.from=unilogic.nl;
 dkim=pass header.d=unilogic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unilogic.nl;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msMWC23hAGng94Q2N8KudAS7I4oUAWN+7t10zi6P0cg=;
 b=VsCWh9hd6Z0EW9bhoUjLk8yk/luhDdnurD0c9TEuyUJqazpvF69pDP+wZXA3zbMa2mXfPghQXmg7j/uHkHS2a9iz1xenILTgdFSkVDB/ELcJQaOs5+2s9M9v5Ml+mPNjShhUDXJthG6JRimBqb0/0yKaSS1fpPJRKmMu21MGhdc=
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com (2603:10a6:208:46::31)
 by AM0PR07MB5234.eurprd07.prod.outlook.com (2603:10a6:208:f6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.14; Thu, 5 Aug
 2021 13:53:21 +0000
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6]) by AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6%6]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 13:53:21 +0000
From: Pascal de Bruijn <p.debruijn@unilogic.nl>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
Thread-Index: AQHXidd1p9VJHRrPy0+wuCBstyKOS6tk6M2AgAAAmTs=
Date: Thu, 5 Aug 2021 13:53:21 +0000
Message-ID: <AM0PR07MB39874E7C25C042D0F51C8BC09DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
 <20210805085353.3457-3-p.debruijn@unilogic.nl>,
 <20210805153149.3b72eb3f@windsurf>
In-Reply-To: <20210805153149.3b72eb3f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=unilogic.nl;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 157a9987-92de-4868-a85c-08d958186329
x-ms-traffictypediagnostic: AM0PR07MB5234:
x-microsoft-antispam-prvs: <AM0PR07MB52346A325C68980F7DEA6ADF9DF29@AM0PR07MB5234.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AdXdeSA4KaYS638nseiMZw1m9laC6WqWFSKZJie+qAGqptrasmo+useQRCSg2KR5dJHqv2knz8tc/vYJviMElC5d5ps9wDDQVNd3AuJTa7RzO4Z+/4mzjHb755OeYD/CfDXRg2hWcjMS5856irvsojhdu1QbwWkLB/ainaKzbd+KcItCQBrTyB3D+ijIjrUkLwI3DcTCiipXvnqvcsQYvv/nVADSml4yb4TNK/3cOvzrZRrt/Wr7kVwRheJ2mV34E6wpHslq6RV1y4kxRTRAhp+IxoQT91LWkePZyIkY7xfdsx02JaVv+BpYZ5cPRpBSpqCWmTrn3oxAFlHT3FCr6QA+YGRC3E9DSLvQzV1eRODHuPkkoPM/Urko+nYFYco1x1T/pVo/gZFxDAd42sZHphPsM5mkVikcraXdHs+u1VzS8KSxk1Au3jjxVi9iqFW09q/XGcxpIiJvZn8q4K/AKNO+8SF2x7yLkpWJRsDKtFAyDHxIgQdC66vAtsW7lC/w2g/lY2GmO770sxOXM31+j4KJQYfNJEtHjXuGViV0qjfBf3WP6usEnqT6vE/apcxMu0JRPKplwDtlMsYnwfkXu1GUdCn3A4lM7lCizXpTSbp8/kHaA6cM9oYqxcQpaUNi0PeXo00zrNVRLFV0ySghtFPFjq+ANg9xsaCO4GiJuTGzQSiie8pSrC7Fasgl/GfiI/NLeXVi+iM46v1uq5lx4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3987.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(136003)(396003)(346002)(376002)(366004)(316002)(54906003)(71200400001)(2906002)(478600001)(33656002)(66446008)(83380400001)(86362001)(38100700002)(19627405001)(9686003)(8676002)(38070700005)(76116006)(122000001)(4326008)(66946007)(26005)(5660300002)(186003)(64756008)(52536014)(7696005)(6916009)(66476007)(66556008)(8936002)(6506007)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+Pc+3hbQb4fSjS3PKUMJklegLGqgCy72Gjp60fjt+HHhhst5O6713hZ65+?=
 =?iso-8859-1?Q?dTMG8EgdjCymHAXCSW+gAOokHaavUjVqRl7NQXnWg2agS6GEfB3RezufX8?=
 =?iso-8859-1?Q?BqiFsMZipu6tFIwGtVZWb2uSyxR9htO7yvXeELvbRztajFdaMB9HueGBs/?=
 =?iso-8859-1?Q?2nmceEm9cThRPHiO36bog3o4guLQdXtnAHWA3Rma5Hjc1JDf3+tWVzpZOq?=
 =?iso-8859-1?Q?EercBFG6k4TuIaWbAMJi+lseNx5TdEXQd8BfN7ggJ0hEPtGmPo3gvMg2Uh?=
 =?iso-8859-1?Q?u6l5+Z9pafpwuuF8Qsen8+RRK80tU2MkcLMNt02TUP+YXwIFytuZRhhXKv?=
 =?iso-8859-1?Q?4eJNMF5X+TvhgGesv1ySslqFz8prkH3Xv/bCzQZBtUWU+8Jqr0F19HztwW?=
 =?iso-8859-1?Q?r0cI42skn3BmcmbTZnLc3U6t53c0EJBpQKrWXFSkIywN2zEy8Pky29/0KR?=
 =?iso-8859-1?Q?kXVRGZYnj0dskA3ZkGs67n3vbheWcsjfM//SWaJe8E3qCD7RvIAtC/yX7K?=
 =?iso-8859-1?Q?bViTojPzWShXIJS6h6szC2kwJ41uY7v6FSDWh+Jb47oEQmDlVDbjqphEhs?=
 =?iso-8859-1?Q?0AThyiJswOuqEbC+Cj9KHaUcYPjniDYxOeIGiCELiJ3KAGFFvPA5hoiRfV?=
 =?iso-8859-1?Q?qPR8c0xrycaFuLYZhag7tpNLeXqc0gP7T4WJg0uhLJY0N3bEuFlyfafVRd?=
 =?iso-8859-1?Q?BCVLPSqMjbSdAzUqkl0IwW46v56Jo4oaIq2KQAm7Ikk8tQNNL4Xo5gJU2Q?=
 =?iso-8859-1?Q?deBEHxwiXkLdnQLrKuaAfUB3dbKkne7/32lwmtjXjXkKu5clmMIwZuEB7n?=
 =?iso-8859-1?Q?zXbPHiMqlnvd3pe+/4bR2v/G6qJsUP0JWURvl8hELZWL1gcNY6U2vckwaW?=
 =?iso-8859-1?Q?3jebRQHqgTCauUkSTYjELSxaDlWCaiYgFxlJAajei0Knb1sAwgQQhgfOmi?=
 =?iso-8859-1?Q?1nvM9hTrNroR5sLb0lyJNx5DxzWpN62LEGbb42mBntLbczP3oyWsR4h1a3?=
 =?iso-8859-1?Q?OvcPBmIfL06qrAGbY8IqkWeNv/XVnvxN0vRW4zsd08ZUahHwZR6180fvhk?=
 =?iso-8859-1?Q?ESPgSVRvTqAd13zxGImFNdR93t2cIimzA7WKAk3oSzNI7p8waVD+I+HI9x?=
 =?iso-8859-1?Q?XqGiVy4igUVENIbE+QsEiWN4WlD+Ff63+F+nWWUiFbbXMyd1eYFmwRkBJA?=
 =?iso-8859-1?Q?V63enPBPgEoOFpO5H3ghc+hPuzElYP7dWRMMUqjAK9bqYbZnu6dtRej2bi?=
 =?iso-8859-1?Q?w1Z5T/KFYGiT5VRCLW7IhLLmqxRvmil28iViKEOjQP4jXAKXQ7n9YQi6x5?=
 =?iso-8859-1?Q?I16RqaT+vKWLepw2aPN8P6FbPu9VeR06hhLuKnXPvAas780=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: unilogic.nl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB3987.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157a9987-92de-4868-a85c-08d958186329
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 13:53:21.4860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 80e1d02e-cf3d-42a6-8024-091a212ef6af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nz/Lg5IKweoWNPJiRWiHPW/I9B7r9INwD4jMA4zQRjlPr8jlrjUryGbmaEX70+ys4FxTOy+mx78CXh6P4zzMAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB5234
Subject: Re: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "aduskett@gmail.com" <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6020668168529534698=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6020668168529534698==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR07MB39874E7C25C042D0F51C8BC09DF29AM0PR07MB3987eurp_"

--_000_AM0PR07MB39874E7C25C042D0F51C8BC09DF29AM0PR07MB3987eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey,
Do you have a justification as to why things have changed since commit
469c11c516959375f6caddde178adbdcdc5d9887, which disabled Opcache JIT
support ?
No not really... I've not found a case where JIT does not work (when proper=
ly enabled in php.ini), maybe @aduskett could elaborate...

Opcache (with or without JIT) was completely broken both in buildroot for b=
oth 7.4.x and 8.0.x due to the shm_unlink issue with librt. The main issue =
is that this fails at runtime, so you can have opcache compile just fine, b=
ut non-functional when enabled in php.ini...

I've tested the following with all three my patches:

    php 7.4.20 (2021.02.x branch without JIT) on amd64
    php 8.0.9 (master branch with JIT) on amd64
    php 8.0.9 (master branch without JIT) on arm

on non-x86 JIT is automatically disabled (even if built with --enable-opcac=
he-jit), as it seems to be supported on x86 exclusively for now, but that m=
ay change in future versions of PHP. PHP versions before 8, don't have the =
JIT at all.

Therefore I would recommend cherrypicking ed355dec (PATCH 2/3), to the 2021=
.02.x branch.

Regards,
Pascal de Bruijn


--_000_AM0PR07MB39874E7C25C042D0F51C8BC09DF29AM0PR07MB3987eurp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>Hey,<br>
</div>
<div>
<blockquote class=3D"userQuote" style=3D"border-left: 3px solid rgb(200, 20=
0, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(102, 102, 102);"=
 itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/QuotedText">
Do you have a justification as to why things have changed since commit<br>
469c11c516959375f6caddde178adbdcdc5d9887, which disabled Opcache JIT<br>
support ?</blockquote>
No not really... I've not found a case where JIT does not work (when proper=
ly enabled in php.ini), maybe @aduskett could elaborate...<br>
</div>
<div><br>
</div>
<div>Opcache (with or without JIT) was completely broken both in buildroot =
for both 7.4.x and 8.0.x due to the shm_unlink issue with librt. The main i=
ssue is that this fails at runtime, so you can have opcache compile just fi=
ne, but non-functional when enabled
 in php.ini...<br>
</div>
<div><br>
</div>
<div>I've tested the following with all three my patches:</div>
<div><br>
</div>
<div>&nbsp; &nbsp; php 7.4.20 (2021.02.x branch without JIT) on amd64</div>
<div>&nbsp; &nbsp; php 8.0.9 (master branch with JIT) on amd64</div>
<div>&nbsp; &nbsp; php 8.0.9 (master branch without JIT) on arm<br>
</div>
<div><br>
</div>
<div>on non-x86 JIT is automatically disabled (even if built with --enable-=
opcache-jit), as it seems to be supported on x86 exclusively for now, but t=
hat may change in future versions of PHP. PHP versions before 8, don't have=
 the JIT at all.<br>
</div>
<div><br>
</div>
<div>Therefore I would recommend cherrypicking ed355dec (PATCH 2/3), to the=
 2021.02.x branch.<br>
</div>
<div><br>
</div>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"PlainText" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Pascal de Bruijn</div>
<div class=3D"PlainText" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM0PR07MB39874E7C25C042D0F51C8BC09DF29AM0PR07MB3987eurp_--

--===============6020668168529534698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6020668168529534698==--
