Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ACAC46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 09:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A28C28149E;
	Tue, 10 Jan 2023 09:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A28C28149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGYvvQGPKrl6; Tue, 10 Jan 2023 09:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834498176B;
	Tue, 10 Jan 2023 09:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834498176B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 824431BF2A0
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EBBC416B9
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EBBC416B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnFAeUWOI1fV for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 09:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F1A9416C7
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F1A9416C7
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 09:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWGMH3wkgoMyASgPFFx73tyWKuwbIygeEtr2tdqUSRcQaCRxJWSgznPnmJ2B3DZZ+ArwC32WuxeFkvFj8rnsK6dGbhn9emRGKotRZjoslWsx0xCMRtu/3sUjcgXzVxacH+smz+y6rc5u1oa+rrPZ3InO9S7XWQOjwdiGS2iaVm+VSIu816sH6C48cSeaTEiCpYW1LSV41J1TIy+6vk0x7qHoi31W0idX9nUfXt6JVlk8TQq8RXV32z9A5ffMoGOZjYgtTncpMXnzdNM3xs/5S5I6ooNxOzmJz7xT17hAvS6iTlCllQjt7wO6NkMgG2Rlx4mddmgwF9T018k/sahKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcAC+LGF7OznLiuol37hrXlup8VapV9mI7YgTAaHxbE=;
 b=JfWEuTMZEgBr7c9rEiLURfINN28sd3eRkpvCQeK0eS0vALDuTvlB0nhwYxGMkhTjnEP5BxwTDEd1MT2za3LP3vVCtRu3lrlDdUt0ZCaHOu/Hc9RtlC2EWDhven2+foB/8dvziY3UCBoBaKqKpIDsjMjOYHlopvwlpq658HS2HX/eZFdQ565ooTCduaonJ2UMnntekRP20C7++4+ElnYK/j94ZyBgYg13rXhIzBRVsvH2VZSF82LjDKPVupHg3SBPX5VaiesncmxiXatlNIECGRb14pemohrflijJceBdmGeKBA0xVKi36qPMwvPe0ovczvJPozXZiTySW1jSkjpNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0588.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:12:58 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:12:57 +0000
To: =?iso-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Thread-Topic: [Buildroot] [PATCH 4/4] package/atk: remove package
Thread-Index: AQHZJCna76x930sTekq7e1U9I+ZGsq6XLxgAgAAr0uo=
Date: Tue, 10 Jan 2023 09:12:57 +0000
Message-ID: <VI1P190MB04937E83D67F730C0A1D380F9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB049320A6AD3502E69083DB819FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <CAB0FRsuJj7OksprVHrCOfO0TmXkaY=0-S3xwMOza+3JBpXTcKA@mail.gmail.com>
In-Reply-To: <CAB0FRsuJj7OksprVHrCOfO0TmXkaY=0-S3xwMOza+3JBpXTcKA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0588:EE_
x-ms-office365-filtering-correlation-id: 6699dd4e-6b25-401e-4a63-08daf2eadd7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HErB89EC9zFPy3GxCn8DlSlAs09rRY0MzN3zO1zaOFJoAqJx4ILPUsgyE8YbyPu894NaYEE5h8hSB2FO0jKfehT/ox36tzdku91l3OTB1AQQjU82Vb7YzNWnLWn3KHtZW1dy7YZSHpYeR+jxUjtHQT+Q/gIwmKN+Vgj6J0h1qeinOCAJYWEhZLLryNO1Ia0sjlfFZ+14tU1LoOXwVWGx/AKx2jRmaQ726q0QCafd3+z0hE8T5Uqj+DNoWGyuVyfRTH03PELWSEDw1sLeDry2FFn1H3XsyUZUcN16IvFl0kCxs/qR588+9d0nrC2f6CJvngG+ZEVHeZqGDwHbSr4LVvT/3Jy/iRbMKgqiRiicXHsJHZDCezuWEqrGoMu9kwV4BqYAUF+Il22EaSyMD7N1Xs0TKWa+tr337eTlL2Zgbhb/MNO/vB9cKuUas7c+NgDoeuu1dSnnO4g044wRiI04JzRppljhx8G6Ot+pZGctGElNHeotYXShKoHRCeROlJvfca8UAvc6qUJ4vxkjgHnioCoaZZrq0sLJpV0dLliy5qzAmp9TIOcBgA0mwbddxL0X8qSfQF0T2Yvhl+wkT64lAV5hOjgNzQjVe5UshjLp2RaAm0gDU6F9R6eDua7Fs82dFXjPR5yLxIibm8D9niII/d3U4PfuA0+p/awjjhcy4yRK34fpMRnVq8iJw6F91blGRMlqrn0Ar1gQkN7ciNbONmcR/i/kxt5+XduaatDl7t4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(376002)(39840400004)(346002)(451199015)(66556008)(52536014)(2906002)(8936002)(5660300002)(66574015)(41300700001)(66446008)(66946007)(76116006)(64756008)(8676002)(66476007)(71200400001)(316002)(7696005)(4326008)(54906003)(33656002)(6506007)(478600001)(26005)(186003)(6916009)(966005)(55016003)(9686003)(86362001)(83380400001)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2n8A4faw0Zt8biwAJ1nVhAvKY3XYdnRTmMxMQEmFE8fLGKPdoQp9dpCwWd?=
 =?iso-8859-1?Q?bCpZg9BqcWVG98J8zX4r9OHjSOMQ1GfN2VnMAn5okvDE4FXP4AGTMTaS+L?=
 =?iso-8859-1?Q?fQW6TgqWJvstN7JL4qo9f8iNCYkbnxbc/CgLt1di977PJHT2zXAPNK6CbT?=
 =?iso-8859-1?Q?jK+F9z7nG7x9bsnw41c81vadc8z52YvxiKTjIaNvhwriyEA+3GrXcghwx7?=
 =?iso-8859-1?Q?7qqcBKMG9j28m4NSIi1YY12Se1yOMdFPOBz3zop0QQuIPwMuB5HHZE4yUe?=
 =?iso-8859-1?Q?gxErWWLBRrgAPrku1gET1PNY6pDsmDgmvhoRAPLZBgQeFfUE2ldT0pJjzp?=
 =?iso-8859-1?Q?P3T4ro69GeTkUaqrV0+aEL/fhyYFM9yeLHw13p/pMoRy7y1Mv9hITu793g?=
 =?iso-8859-1?Q?tXF4wAxEYRC43rLfE9v41yM7Zi97J5cmdEklsCtOpPKMD+iX05Tt8cYCLb?=
 =?iso-8859-1?Q?gXcvxZTm9kwDl7tIAoTq4IqWXx23Cta/2s99nhSMagUV+DkXTjs7YHDuMh?=
 =?iso-8859-1?Q?J4z+2YGor6kk5KtboprddgzkeBdTp6TNUxJbHDnRfSCBHp5H/dC/CgbDdF?=
 =?iso-8859-1?Q?rMDKX8jCMJFk4OOv9j9S80bDnOokWvtHBWzpmafjaiE5wFazw/stlzSDPG?=
 =?iso-8859-1?Q?qSyoUYgQ3YyfMyxxlO5ThrEDu2Tx1mchpKurR08vwZOcx0enfFFv+C0Uzm?=
 =?iso-8859-1?Q?fyJiCXbIYYKOcOxslo2MUFK2Xg+hICOhtmbBjVPb82wIwBE99U7e9JPTSo?=
 =?iso-8859-1?Q?O/vkS1N/sBo/tJ9ndCsSaUo/hC7LfHnxM7LyEskJ3H0a6Fvf/5ZHjxvw9J?=
 =?iso-8859-1?Q?bWU9lFgKQmDxnZiMDCm8WrXlcxSQBmXSyRScv2GShQNaqgfQaKogrw+n1m?=
 =?iso-8859-1?Q?GAu5+vEHUfHNPIjyNl0hch8sfmJO2+UC069uS29CK8A3nke/RXfN4ZMA/T?=
 =?iso-8859-1?Q?ViVuNT6HcxFEWeAffy/LFPqfORVm4P1wx8ZDMoBrlfJzbNXx5cYh79nMLy?=
 =?iso-8859-1?Q?SXidortSww6QLj8FNILJFNYxt44cLkJhgX+KZIabGIySJGG4QN9TZaQaWW?=
 =?iso-8859-1?Q?fLQYHDKyKF1fL/aaKlqwnj8HzX1qZeT4EAIiVcTw4Iiz+utxlhkfsra/JX?=
 =?iso-8859-1?Q?3gWJEIsrpIV5thbKc+Kk6d6BUvq1+FSCoKvNEHEQk1+WuuE/t6PHVnMVov?=
 =?iso-8859-1?Q?YZfSdSkKyXBwNT2/wSuZmz7Bjrymo9ay80gr7m9ILoNLuO9L3BB7atBtmH?=
 =?iso-8859-1?Q?8W+JNd5NRlr43Q3zjb3WFQoSFlBOnrDZG7XnmzS5MNYKZyj04XeqRRaiRm?=
 =?iso-8859-1?Q?c1k59hCUoQDXRKr/4l974E0wvrFPaXfZ2sYZEEG3mGEASQfUaIugakxI2m?=
 =?iso-8859-1?Q?HfKqCNeywRvn5CrjWtATkMrD98vVfrDAdc2xLAPX7dD7GtejQC7joHi84w?=
 =?iso-8859-1?Q?6xmC3n3u3AZL9/XqSb1qvZX70wzzneu/2ts02RImkUNSVGHx2qbjq8r9G6?=
 =?iso-8859-1?Q?TGC9RiL/31SOTdKkTseqTVlR/3pQkv0T/0z2Q10N1NEVzE0m02tmBqS2Ia?=
 =?iso-8859-1?Q?GgA04e5ZCRSqlTU0SfAhQaKky6ITFNJ4GE61jPGqEamDAfgGF5lMyMI9gW?=
 =?iso-8859-1?Q?seS+6EcuZWIZM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6699dd4e-6b25-401e-4a63-08daf2eadd7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 09:12:57.7966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P5DrG1TCVlW511Biipv71GrNrUcbwJ18sJ/extISkEs2QNJejfOmqhrXvoK9D/+LM03oKnyGe6LnTEFjGdKdNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0588
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcAC+LGF7OznLiuol37hrXlup8VapV9mI7YgTAaHxbE=;
 b=DxV6sao7WuKD1sX12widMhsBY2bOZ+2oogo5MYvVhV3c9KdFAC24kCkJmXY7+2ZuXis5iZt7jxUFwbdT0ctT/1umaiqFDZhO9ubN2poa57S/pvlLq1slgVQcQlHUbt97FKb+2yCTqVTZGIsK8EkyWPQHbPydeEYmZknyVORqeaA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=DxV6sao7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] [PATCH 4/4] package/atk: remove package
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "james.knight@collins.com" <james.knight@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fran=E7ois,

> Le lun. 9 janv. 2023 =E0 13:59, Lang Daniel via buildroot <
> buildroot@buildroot.org> a =E9crit :
> =

> > atk has been merged into at-spi2-core with version 2.45.1.
> >
> > https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/=
NEWS
> > https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78
> >
> >
> so, the patch package/libgtk3/0003-disable-atk-bridge.patch becomes usele=
ss.

It didn't want to alter the behavior of libgtk3, but you are right, the arg=
ument for having
that patch is gone.

I can send a second version and also remove the patch, if you want.

> Fran=E7ois

Regards
Daniel

> > Signed-off-by: Daniel Lang <d.lang@abatec.at>
> > ---
> >  Config.in.legacy             |  7 +++++++
> >  package/Config.in            |  1 -
> >  package/atk/Config.in        | 14 --------------
> >  package/atk/atk.hash         |  5 -----
> >  package/atk/atk.mk           | 25 -------------------------
> >  package/atkmm/Config.in      |  8 ++++----
> >  package/atkmm/atkmm.mk       |  2 +-
> >  package/libglade/Config.in   |  2 +-
> >  package/libglade/libglade.mk |  2 +-
> >  package/libgtk2/Config.in    |  2 +-
> >  package/libgtk2/libgtk2.mk   |  2 +-
> >  package/libgtk3/Config.in    |  2 +-
> >  package/libgtk3/libgtk3.mk   |  2 +-
> >  13 files changed, 18 insertions(+), 56 deletions(-)
> >  delete mode 100644 package/atk/Config.in
> >  delete mode 100644 package/atk/atk.hash
> >  delete mode 100644 package/atk/atk.mk
> >
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 184bab6097..ac5943519e 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -146,6 +146,13 @@ endif
> >
> >  comment "Legacy options removed in 2023.02"
> >
> > +config BR2_PACKAGE_ATK
> > +       bool "atk removed"
> > +       select BR2_LEGACY
> > +       select BR2_PACKAGE_AT_SPI2_CORE
> > +       help
> > +         atk is now part of at-spi2-core.
> > +
> >  config BR2_PACKAGE_AT_SPI2_ATK
> >         bool "at-spi2-atk removed"
> >         select BR2_LEGACY
> > diff --git a/package/Config.in b/package/Config.in
> > index 5c8dcd849f..95db7c627b 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1531,7 +1531,6 @@ endmenu
> >  menu "Graphics"
> >         source "package/assimp/Config.in"
> >         source "package/at-spi2-core/Config.in"
> > -       source "package/atk/Config.in"
> >         source "package/atkmm/Config.in"
> >         source "package/bayer2rgb-neon/Config.in"
> >         source "package/bullet/Config.in"
> > diff --git a/package/atk/Config.in b/package/atk/Config.in
> > deleted file mode 100644
> > index d9371b879b..0000000000
> > --- a/package/atk/Config.in
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -config BR2_PACKAGE_ATK
> > -       bool "atk"
> > -       depends on BR2_USE_WCHAR # glib2
> > -       depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> > -       depends on BR2_USE_MMU # glib2
> > -       select BR2_PACKAGE_LIBGLIB2
> > -       help
> > -         The ATK accessibility toolkit, needed to build GTK+-2.x.
> > -
> > -         https://gitlab.gnome.org/GNOME/atk
> > -
> > -comment "atk needs a toolchain w/ wchar, threads"
> > -       depends on BR2_USE_MMU
> > -       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> > diff --git a/package/atk/atk.hash b/package/atk/atk.hash
> > deleted file mode 100644
> > index d8cd69ff1f..0000000000
> > --- a/package/atk/atk.hash
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -# From
> > http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
> > -sha256
> > <http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum-s=
ha256>
> > ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36
> > atk-2.38.0.tar.xz
> > -
> > -# Hash for license file
> > -sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58=
e5
> > COPYING
> > diff --git a/package/atk/atk.mk b/package/atk/atk.mk
> > deleted file mode 100644
> > index 2820fb486d..0000000000
> > --- a/package/atk/atk.mk
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> >
> > -######################################################################=
##########
> > -#
> > -# atk
> > -#
> >
> > -######################################################################=
##########
> > -
> > -ATK_VERSION_MAJOR =3D 2.38
> > -ATK_VERSION =3D $(ATK_VERSION_MAJOR).0
> > -ATK_SOURCE =3D atk-$(ATK_VERSION).tar.xz
> > -ATK_SITE =3D
> > http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
> > -ATK_LICENSE
> > <http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)-ATK_LI=
CENSE>
> > =3D LGPL-2.0+
> > -ATK_LICENSE_FILES =3D COPYING
> > -ATK_INSTALL_STAGING =3D YES
> > -ATK_DEPENDENCIES =3D libglib2 $(TARGET_NLS_DEPENDENCIES)
> > -
> > -ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> > -ATK_CONF_OPTS +=3D -Dintrospection=3Dtrue
> > -ATK_DEPENDENCIES +=3D gobject-introspection
> > -else
> > -ATK_CONF_OPTS +=3D -Dintrospection=3Dfalse
> > -endif
> > -
> > -ATK_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> > -
> > -$(eval $(meson-package))
> > diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
> > index aa58f8d593..f6f2ca8fc2 100644
> > --- a/package/atkmm/Config.in
> > +++ b/package/atkmm/Config.in
> > @@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM
> >         bool "atkmm"
> >         depends on BR2_INSTALL_LIBSTDCPP # glibmm
> >         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
> > -       depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
> > -       depends on BR2_USE_MMU # atk/glibmm -> libglib2
> > -       depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
> > -       select BR2_PACKAGE_ATK
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm ->
> > libglib2
> > +       depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
> > +       depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
> > +       select BR2_PACKAGE_AT_SPI2_CORE
> >         select BR2_PACKAGE_GLIBMM
> >         select BR2_PACKAGE_LIBSIGC
> >
> > diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
> > index 3bcb941c9f..76371aadbc 100644
> > --- a/package/atkmm/atkmm.mk
> > +++ b/package/atkmm/atkmm.mk
> > @@ -11,6 +11,6 @@ ATKMM_SITE =3D
> > http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
> >  ATKMM_LICENSE =3D LGPL-2.1+ (library), GPL-2.0+ (tools)
> >  ATKMM_LICENSE_FILES =3D COPYING COPYING.tools
> >  ATKMM_INSTALL_STAGING =3D YES
> > -ATKMM_DEPENDENCIES =3D atk glibmm libsigc host-pkgconf
> > +ATKMM_DEPENDENCIES =3D at-spi2-core glibmm libsigc host-pkgconf
> >
> >  $(eval $(meson-package))
> > diff --git a/package/libglade/Config.in b/package/libglade/Config.in
> > index e269a07548..4cf2ae4086 100644
> > --- a/package/libglade/Config.in
> > +++ b/package/libglade/Config.in
> > @@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE
> >         depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> >         depends on BR2_USE_MMU # glib2
> >         select BR2_PACKAGE_LIBGLIB2
> > -       select BR2_PACKAGE_ATK
> > +       select BR2_PACKAGE_AT_SPI2_CORE
> >         select BR2_PACKAGE_LIBXML2
> >         help
> >           Libglade allows you to load glade interface files in a program
> > diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
> > index 32fa595f5a..24865fb8ff 100644
> > --- a/package/libglade/libglade.mk
> > +++ b/package/libglade/libglade.mk
> > @@ -9,7 +9,7 @@ LIBGLADE_VERSION =3D $(LIBGLADE_VERSION_MAJOR).4
> >  LIBGLADE_SOURCE =3D libglade-$(LIBGLADE_VERSION).tar.bz2
> >  LIBGLADE_SITE =3D
> > http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJO=
R)
> >  LIBGLADE_INSTALL_STAGING =3D YES
> > -LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 atk libxml2
> > +LIBGLADE_DEPENDENCIES =3D host-pkgconf libglib2 libgtk2 at-spi2-core l=
ibxml2
> >  LIBGLADE_LICENSE =3D LGPL-2.0+
> >  LIBGLADE_LICENSE_FILES =3D COPYING
> >
> > diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
> > index c75c37fb63..f2888b2f51 100644
> > --- a/package/libgtk2/Config.in
> > +++ b/package/libgtk2/Config.in
> > @@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2
> >         depends on BR2_INSTALL_LIBSTDCPP # pango
> >         depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
> >         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> > -       select BR2_PACKAGE_ATK
> > +       select BR2_PACKAGE_AT_SPI2_CORE
> >         select BR2_PACKAGE_CAIRO
> >         select BR2_PACKAGE_CAIRO_PS
> >         select BR2_PACKAGE_CAIRO_PDF
> > diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
> > index d30e1d9d43..ad4dd74e4d 100644
> > --- a/package/libgtk2/libgtk2.mk
> > +++ b/package/libgtk2/libgtk2.mk
> > @@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV =3D \
> >
> >  LIBGTK2_CONF_OPTS =3D --disable-glibtest --enable-explicit-deps=3Dno
> >
> > -LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cairo pang=
o atk
> > \
> > +LIBGTK2_DEPENDENCIES =3D host-pkgconf host-libgtk2 libglib2 cairo pango
> > at-spi2-core \
> >         gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
> >
> >  LIBGTK2_MAKE_OPTS =3D LIBS=3D$(TARGET_NLS_LIBS)
> > diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> > index bc8cacd9f5..cb44607b7c 100644
> > --- a/package/libgtk3/Config.in
> > +++ b/package/libgtk3/Config.in
> > @@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3
> >         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> >         depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> >                 BR2_PACKAGE_HAS_LIBGL
> > -       select BR2_PACKAGE_ATK
> > +       select BR2_PACKAGE_AT_SPI2_CORE
> >         select BR2_PACKAGE_CAIRO
> >         select BR2_PACKAGE_CAIRO_PS
> >         select BR2_PACKAGE_CAIRO_PDF
> > diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> > index f277fce2ed..15190efd96 100644
> > --- a/package/libgtk3/libgtk3.mk
> > +++ b/package/libgtk3/libgtk3.mk
> > @@ -30,7 +30,7 @@ LIBGTK3_MAKE_OPTS =3D \
> >
> > WAYLAND_PROTOCOLS_DATADIR=3D$(STAGING_DIR)/usr/share/wayland-protocols \
> >         LIBS=3D$(TARGET_NLS_LIBS)
> >
> > -LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 atk libglib2 cairo =
pango
> > \
> > +LIBGTK3_DEPENDENCIES =3D host-pkgconf host-libgtk3 at-spi2-core libgli=
b2
> > cairo pango \
> >         gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
> >
> >  ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> > --
> > 2.25.1
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
