Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF56C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:05:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD5C60E97
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BD5C60E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unilogic.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE156058A;
	Thu,  5 Aug 2021 14:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SR3pnKR0DxLc; Thu,  5 Aug 2021 14:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE7B6060F;
	Thu,  5 Aug 2021 14:04:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 283A31BF44C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15A3C40339
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=unilogic.nl
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Hwjwrwaf2bC for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 14:04:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80042.outbound.protection.outlook.com [40.107.8.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EDDA402F0
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 14:04:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+fmCEEekrqpfI0zpejce+8KAs8QbLnPl1zB1kcrJ3fODEW15fdyvVjHieicAbS+8rdN3i5QtyQsk5sIwYDcIrU2ielqJT05GN6EoELx2TQCupFA1gQ9Ts2m/TSeXQA4LwJyvUIUtSdxaQPv2kM2nYauSp86iSn9a+aGnGwl08dmPMcYieAoQKM4AfKjV9fM+HDf0HR2lwx4hQFlbq6NEKgOdTUKJBQ1sOvBB3OFb8YOHntNe2QprRhTR5kQjuhvMUyfjou06krpjvaretN0gI2GwqqYeoJDO4QMIDKTwOeGHcKoxaVnSfKiPcPDyhRwxaKZDRplYJ0j4sRTjvM5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H+HL4thK+pIbse/npYgnbqYmrBryuGUoTdk66NRB/Y=;
 b=KDdnzHwVvzKgO//L/+w6Q7T5v2n/G6beT8HIB1q40ZYmiPkGLinFgltcHE+932kcOiWKYLja6X7rlSXhJmi9LAVGrKieUMroWGmvjG+0WBKOoDcQU8y489KiH9FHNCZOe0Dyb2zMoUoFRMn10V5SsKil+ur61J8GtB6yXVvN38vGX7p8/GO2SsgLoTWeB0C0XE89bCqxG36zcxdw9jsa1VDXTPK2cK+m/6eWK7Rir4iVF1oGcvwByj6UquMd9Z2pxe74BINCemlxPhGtLjF7ILMTmVt38jtO6N45ES9MPTMh8B9AbZzKJOqZchZKX6VMSJ/5wvfIvnYZEb+2r9HAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unilogic.nl; dmarc=pass action=none header.from=unilogic.nl;
 dkim=pass header.d=unilogic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unilogic.nl;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H+HL4thK+pIbse/npYgnbqYmrBryuGUoTdk66NRB/Y=;
 b=jj4nR+slhpcCmm5q1Nx7KwIFZpu0pSiAuLy1i/spyM2DfMx68giWRWEMb9rOuNBzggqv4RCEaHmtxUc+eHRXIKYV+vi82axrC9/goKqEumNd5ZI829AdISyFcRmrCcbl7zKKZ0cHlrD8I7C6wzmgJHM9eyYLjTUFmGJB8ZkUpxs=
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com (2603:10a6:208:46::31)
 by AM0PR0702MB3601.eurprd07.prod.outlook.com (2603:10a6:208:1b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.12; Thu, 5 Aug
 2021 14:04:49 +0000
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6]) by AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6%6]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 14:04:49 +0000
From: Pascal de Bruijn <p.debruijn@unilogic.nl>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
Thread-Index: AQHXidd1p9VJHRrPy0+wuCBstyKOS6tk6M2AgAAAmTuAAAe+AIAAAD41
Date: Thu, 5 Aug 2021 14:04:49 +0000
Message-ID: <AM0PR07MB39876E0E73FD0E7059D1D5CB9DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
 <20210805085353.3457-3-p.debruijn@unilogic.nl>
 <20210805153149.3b72eb3f@windsurf>
 <AM0PR07MB39874E7C25C042D0F51C8BC09DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>,
 <20210805160140.4fcc15ce@windsurf>
In-Reply-To: <20210805160140.4fcc15ce@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=unilogic.nl;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96b6ca74-b58f-4cfa-cb0f-08d95819fd0a
x-ms-traffictypediagnostic: AM0PR0702MB3601:
x-microsoft-antispam-prvs: <AM0PR0702MB360166B42E4792A82363B1C19DF29@AM0PR0702MB3601.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sL5eJ3mmS1eM1ofmpQ9c3mJzsEdrI7dgXrW0PAWpyX9BUKE0lomhgaJgmKIa/s0ChmLBgxHWLJRfX/eQ73OtDqDDBmxLOX2TkdGFaQWIslT2GM+2ByhxUMRlPW7KgiT2/KNj4NzTETmKb06tQ8OdUgK9Psg/Yu5gy0s0p/fAF/ddOMi2tWbz1XmxbvpqfCiRqGKtCkH5BcXd0RqvGCU1z6OmsL4NpbuvpG6MCz1aLUePD4QiYioHH8riDiEf1wOB2ynXUfjRM+Y46dSfd9P8gSVOhLbPzDmmI7OmhMaMWJJ+O688DbqhOK8LBPY+X9hA1LHTBkW8HpdEcFOhmuq9ZhdheYei41ZS31ckcOSheNFgk9758PIdXNwXX07TfuAiUfYLjeE1Prn7gHFNhKqpiG8vcyDl1eMwSNoJUtYjjnbVMYB1vf1eCvMgnDMw4IZuskDhGTOLW5EqaiYpP+IjJcyTU8uDfAVMsE/pso966MbBHHX6ZDz/7P/ciVrUuFnKSuSk7nphLe569uaJRVmFLxhFPPXRgOJo5rnE+Vv9LJWMGggNVJAtZCpSOs6aFg3MedmpUbVphYZqvZHlZVEpNnjwqwBpgV6XneTHzRxdyRHeEycNp1lMcC6fM4NxgNCxUK4Z80mABogcg7AouQ+77CZcWULa7AZqvaezUrEkq07CpFRBDW8Taix50ItAqEn/twapymEu5t/WVXRVtxU00rNT1dt0fM/kURH/O0Pkhgavo5ZB8WUeeAciWbtxzuzH/V0/yFQ0EotaZx79wal7XGuH+8dkc0Kdx2W27DUKrOI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3987.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39830400003)(376002)(396003)(136003)(71200400001)(186003)(9686003)(166002)(8676002)(26005)(38070700005)(19627405001)(966005)(4326008)(508600001)(66446008)(122000001)(316002)(38100700002)(54906003)(6916009)(33656002)(6506007)(53546011)(86362001)(2906002)(5660300002)(64756008)(8936002)(66476007)(55016002)(66556008)(76116006)(66946007)(7696005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SDUD/2N8FBv5L4masrhq7+T1f8VPh2j3A263DCqDFxKJqg5v/yKBnT5sc4dD?=
 =?us-ascii?Q?2YABmXuRGUMNYIoTJmbrxKfJnANa4uwYUfSwtQQ0MmI9STRssv/cMWdiY4d2?=
 =?us-ascii?Q?bLhAPaUdwXIs66b/2s8n8ecOTXi9/vrSt6JQOkOZoN3fS+u2HY8auLZQ//Y0?=
 =?us-ascii?Q?JhWpSEPaz0T1OcDhb2DDufChx4F32NUUf6KQ7MU12ISXOIQR0a4/JVUg9FDf?=
 =?us-ascii?Q?LfERN/hx4bF2RUMJxp22Q29STN2GgNI6f1naB94a98HLEU0kiQLw3mFGLPjf?=
 =?us-ascii?Q?PsQAQ0PM5XS+/E1+T5xDfHyPpeHRCQHyFzMZtx6CQ4qP00WydpOMDFmeWwjZ?=
 =?us-ascii?Q?QNHMXA7VqRKxqC94EPP7HK25Act/ne5YjtSzp9FSoyEtUCInMdlFZ0ipXBOI?=
 =?us-ascii?Q?dZHM07KPT3OmUtTRP1iPmH9SGc5b+KHDbZDu0KwuHYlcIIrik6Y67TQX27UA?=
 =?us-ascii?Q?MId63EWY2v1AIg6Y+ZfoByjuV5vkAXPxTDZ5DekyIMm8Irdd1mmzpLWl11py?=
 =?us-ascii?Q?pqDjhtD5OV9B4n44SKQQBiTYuxPA8h8aBBVaRkqroue6jx2eBuElMQLpcNK0?=
 =?us-ascii?Q?4Y3xAJfwRwEh6DqzHr9OFmCFDvPr97aIMhacymzWzvkIp+sxW0W8t/vCimny?=
 =?us-ascii?Q?LdFEc0l/FKD3IxV80r6FeDqQo4eIRwksIk1C3zyFjLUoUIKtAdPGoryMxvsz?=
 =?us-ascii?Q?O0J8l5SsSlIJ33aFlne4KlmKMV98JU1QIY1wwibsSVkRfd9d4RjUkvWyYtge?=
 =?us-ascii?Q?zE178YmVlslFpup00DnvWEJSuqMzpkrPAPDdYfX+woznUHxEkl83WKL92gEg?=
 =?us-ascii?Q?esdJSEs2YFR2FGjAHCbywGLG6e24GqWJJy2h9uX1bt/4GJ/p3yINT1pJLiRk?=
 =?us-ascii?Q?AQU4Oy3ChxL3VzrKs8tmvCid7YRMx5QmaIA3chAE7d6ApiiSFPDK0xHbPzKg?=
 =?us-ascii?Q?LMtb9vcREiobXY9h3DiS0T02dCY5VlrQrTXfoHddN23DIBZaD8WOFz5jsN2y?=
 =?us-ascii?Q?3zvc6gsUBkz/HcOf1/XLSGzC8KaYws1ll768uT8PJz5dwo0pgZ9BPEJCRflX?=
 =?us-ascii?Q?/S+lMb8e4UQD/Oaq0Wtr2OJNYfk53HfNZFAmYZS5LL/Tjj3HWy/VLtEng102?=
 =?us-ascii?Q?BQBwpScgnOF7AXXopsIfF8X+3pIoMqAvUrHI0ebRnjlh4IEH5TLrUS0L07Xl?=
 =?us-ascii?Q?1ypFzMviCknlzPUj+lKSKxgF+x0mIHTtUgYYfInTlS+0qc0GY+j8tF2Hht8Z?=
 =?us-ascii?Q?MlzUUgftPmLzz+AuRiXTpPEl4a72pNckHGnsjKhKPHAHyiylvaXAxL3szPW+?=
 =?us-ascii?Q?XIw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: unilogic.nl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB3987.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b6ca74-b58f-4cfa-cb0f-08d95819fd0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 14:04:49.1665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 80e1d02e-cf3d-42a6-8024-091a212ef6af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lh92WXqSlcxFsPjXWlRD41W3pK//9cvPEeN3dFSDKbo/lTUZT7Cnv9y0TpuARvZaMFDS0izbXv1bFOChYPuVHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0702MB3601
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
Content-Type: multipart/mixed; boundary="===============2727901461945673009=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2727901461945673009==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR07MB39876E0E73FD0E7059D1D5CB9DF29AM0PR07MB3987eurp_"

--_000_AM0PR07MB39876E0E73FD0E7059D1D5CB9DF29AM0PR07MB3987eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey,
I'm confused about the librt thing, because librt never existed in
musl, and it was dropped a long time ago in uClibc/glibc. Buildroot no
longer supports glibc versions where librt was a separate library from
libc.
In ed355dec (PATCH 2/3) the following line is what makes opcache actually w=
ork:

PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBA=
DD)])

Regards,
Pascal de Bruijn
________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Thursday, August 5, 2021 16:01
To: Pascal de Bruijn <p.debruijn@unilogic.nl>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>; aduskett@gmail.com <=
aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/3] package/php: enable opcache jit

Hello Pascal,

On Thu, 5 Aug 2021 13:53:21 +0000
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> No not really... I've not found a case where JIT does not work (when
> properly enabled in php.ini), maybe @aduskett could elaborate...

Yes, it would be good to have some details from Adam.

> Opcache (with or without JIT) was completely broken both in buildroot
> for both 7.4.x and 8.0.x due to the shm_unlink issue with librt. The
> main issue is that this fails at runtime, so you can have opcache
> compile just fine, but non-functional when enabled in php.ini...

I'm confused about the librt thing, because librt never existed in
musl, and it was dropped a long time ago in uClibc/glibc. Buildroot no
longer supports glibc versions where librt was a separate library from
libc.

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--_000_AM0PR07MB39876E0E73FD0E7059D1D5CB9DF29AM0PR07MB3987eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>Hey,<br>
<blockquote class=3D"userQuote" style=3D"border-left: 3px solid rgb(200, 20=
0, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(102, 102, 102);"=
 itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/QuotedText">
I'm confused about the librt thing, because librt never existed in<br>
musl, and it was dropped a long time ago in uClibc/glibc. Buildroot no<br>
longer supports glibc versions where librt was a separate library from<br>
libc.</blockquote>
</div>
<div>In ed355dec (PATCH 2/3) the following line is what makes opcache actua=
lly work:<br>
</div>
<div><br>
</div>
<div>PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED=
_LIBADD)])<br>
</div>
<div><br>
</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Pascal de Bruijn</div>
<div>
<div>
<div>
<div></div>
<span></span></div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Thomas Petazzoni &lt;=
thomas.petazzoni@bootlin.com&gt;<br>
<b>Sent:</b> Thursday, August 5, 2021 16:01<br>
<b>To:</b> Pascal de Bruijn &lt;p.debruijn@unilogic.nl&gt;<br>
<b>Cc:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;; adusket=
t@gmail.com &lt;aduskett@gmail.com&gt;<br>
<b>Subject:</b> Re: [Buildroot] [PATCH 3/3] package/php: enable opcache jit=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello Pascal,<br>
<br>
On Thu, 5 Aug 2021 13:53:21 +0000<br>
Pascal de Bruijn &lt;p.debruijn@unilogic.nl&gt; wrote:<br>
<br>
&gt; No not really... I've not found a case where JIT does not work (when<b=
r>
&gt; properly enabled in php.ini), maybe @aduskett could elaborate...<br>
<br>
Yes, it would be good to have some details from Adam.<br>
<br>
&gt; Opcache (with or without JIT) was completely broken both in buildroot<=
br>
&gt; for both 7.4.x and 8.0.x due to the shm_unlink issue with librt. The<b=
r>
&gt; main issue is that this fails at runtime, so you can have opcache<br>
&gt; compile just fine, but non-functional when enabled in php.ini...<br>
<br>
I'm confused about the librt thing, because librt never existed in<br>
musl, and it was dropped a long time ago in uClibc/glibc. Buildroot no<br>
longer supports glibc versions where librt was a separate library from<br>
libc.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_AM0PR07MB39876E0E73FD0E7059D1D5CB9DF29AM0PR07MB3987eurp_--

--===============2727901461945673009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2727901461945673009==--
