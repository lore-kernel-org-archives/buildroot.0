Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F0ECD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 883A1409EE;
	Thu, 11 Jun 2026 19:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpPDI5buRJ6H; Thu, 11 Jun 2026 19:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 169A6409D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781204535;
	bh=SJsQ3eJCEL+GB/6P/1MyIWcLqQuD48NFHKjfDylOilE=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pnkGVNNNzk49cC0axvO99bXTTVTUvwy25BUdXSkq9QAKquDa7zGwNddUoNHM6zAi+
	 o59Nk0Hb+RxOfVCORi2zX3RZeUOyUs4Zsh+uTXJQMwA3v1ANSAabvSecIth4dsU/88
	 CFhDj1Uj4QNN27I1ihmHRXrvJPTooELy89nDPK8DFTt/DIy0E+N29EjvjTXJJBjLxc
	 BjJ/0HfyNpvU7WuGbuWg8VHohFJOARR/LhXUOEnUpw/3pd9dedGZjtQat2It3gSrLf
	 lJQzIDCwv+qRf8e5O1jBKm+A1174iGcb1Zs4pbh/XqGyiZiXM5jjhj36PRRpozgbqd
	 MSuCJiUezuV2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 169A6409D8;
	Thu, 11 Jun 2026 19:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BE8112F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B6A1403D2
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cWzqp6ZCcMt for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.76.20.195;
 helo=ewa-mbsout-02.mbs.boeing.net; envelope-from=matthew.l.weber3@boeing.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84F38403D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F38403D8
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84F38403D8
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 65BItQlR050509; Thu, 11 Jun 2026 11:55:30 -0700
Received: from XCH16-07-06.nos.boeing.com (xch16-07-06.nos.boeing.com
 [137.137.111.39])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 65BItOeN050475
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 11 Jun 2026 11:55:24 -0700
Received: from XCH16-07-01.nos.boeing.com (137.137.111.34) by
 XCH16-07-06.nos.boeing.com (137.137.111.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Thu, 11 Jun 2026 11:55:23 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-07-01.nos.boeing.com (137.137.111.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61 via Frontend Transport; Thu, 11 Jun 2026 11:55:23 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.179)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 11:55:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=tSmHReCYh9b+O+2lPiR/Ap319Ppd7GsQOaFg5+DqoxNM31Xpv0GILhvdyiYzwazKVPAT0duVkkp+9AJkt/3aQP7Nm/T3uijW+VozQ8p9293ZqYdDG2N75av8210NlKiAmflXmgQVgXCW5znLt3JdNOqP/MZhgRo8wKW8CW57PnUMUk6dKTd3leGeJYa2QYirI9mc9TiG3G19M1ZXmVEUW3V1UL0/pRfdYrGmyuIpq1G+9L73j3OxQdS71YWFdWCv3Mt1Ckx/XHkwauNbJfUYD75klVllFJXB3Mg8HftwsGiNZeDbQAqOm8TkLDXAlZGCGY8TdfyFq21YizTF2ejC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1D0AkysQEGvspdShMTBz71S8jnDC/MusuSq35vwLZ8=;
 b=uu8VN2MZQiLuC5PrnzocwFZJTDhZE7LulKFvdCAKG3MKGBuuj0i9Fwsx6qlkG1FrnoTdJqEVPZ11HZnVsNEk5CSetd25bst4+1irhBOcKOXwfxGz12lHTtbZaQ8eJ3c7X92np8kq13KukPrlQ4uBJXcZXGG1wRWYHAybpPPYNj9azm0FOm7NNACuNKsk/hYV3wMz0V8+TJJGNkDx9KtE6q1daxui9JULjX07bKxcG5LX7xz+GUtY8V4vEWkCsGjY2c6PK/xhDK3p8j0N1PSexkPXSC2iO8qrG2Nd6YIi1SRDfuAECbPSEDNY6r+1RZIpxc4dSycVc+wz6QQz3qoWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by SA1P110MB1814.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 18:55:03 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 18:55:03 +0000
To: Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "ibai.erkiaga-elorza@amd.com" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "micheal.saleab@amd.com" <micheal.saleab@amd.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>,
 "Wood (US), Brian J" <brian.j.wood2@boeing.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "michal.simek@amd.com" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [EXTERNAL] [Buildroot] [PATCH v1 2/3] package/xen: add custom
 tarball support
Thread-Index: AQHc+YuhacVV0zLR9EKg3wwuw4HyQrY5tD7Q
Date: Thu, 11 Jun 2026 18:55:03 +0000
Message-ID: <BN0P110MB206767D4B7F2BE21B39C5E43F31BA@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <20260611101734.1968785-2-neal.frager@amd.com>
In-Reply-To: <20260611101734.1968785-2-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|SA1P110MB1814:EE_
x-ms-office365-filtering-correlation-id: 5f680918-2a0f-4678-4878-08dec7eaf23f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|23010399003|38070700021|22082099003|18002099003|56012099006|4143699003|41080700001|15866825006;
x-microsoft-antispam-message-info: bqNDm/yBgbts+q2fxiF9wwU/3E0URpG2vUSONF1EmwHUBjoca+yr3QwMQke1DPaVm/cPedj+nmik0E6GMUsQTP/aZ7mPLWJ9TgTG88omj+2vCVw/DXcF9oiBc+nCDUqd8R1/IMq0IvR8wqLP9zBvpqv8f6WN/uTswkEKlnQldEZpt6wf3shq5AirFeCGoJHQVMeLLBxrEF2qIaG49uygAKQEzOGVObwTjZODc9IAFYPWb+UB+ktu6Ek2rU7uRI9r62xjC5qfJMyoIZ1ajCCM85MimfbanPdR+2aQGDFqKv14vYyIzwyQNeB3GVATpk+G2D94AUozsIk3b21jOQ4HWus4siFbMDnaM7B/dgS1RwHXHHKnXDO1R7C8t1O4A7miecqon4xMN1VbSbinwxa57D+VlQ7TvImYjFt1hmQQMyhu0ED56rF7Hm7By5fFjrqrigc+bLoIiA7pHLKW19CSA72Qrwt6XiRKhjPfloEkrcjKV6/utPQrEo62wOcYLnR0QZaHbxPTmSDEn8n3DkeqfDR3phSKMF1OhisAnqoGB5C7PyoAGX72emaDc+optMoWNJJSg9Hal3OfH708zK29ibPcdxSrmvPAzbXZ0S85OHQ30BrMXaUKzOEpjLfox8UapOsKQxct0TeP5GTvNQJudbxy+A/IvULhomP4J/mCmIVtvS0Wc6cVjIEHAOx0eM0E1/EhbJqDnotZRV28qav8BYvT/1eNmSUbdJXU0RA3b+1ycJAazNbdDOL4R+7UpBPDG0uEHlG/1/eI4nLcuqUCfyOPqd2rzsWYjSQHJUl0OuiKPRrMvzvf8hMrRM1Dveon
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?caIQcnP93FG+BtRhDSCKmRQiEduMnBiaIDDD4LiY7d1oLvCjO9SezCyBhlsb?=
 =?us-ascii?Q?oO8Crs1rOvodnL6FmOfyvtpOYIUSJS6U/YY6BWm3Js6qtru0YxZMUrZaLXmw?=
 =?us-ascii?Q?22yl5PtbkJNzXMd//k7i3h2HG0olurrz0gel2doq8daHu6bEcvyiW/6FBMMB?=
 =?us-ascii?Q?rza0mFghoutYxjOhQqmtyel8Nr1kQbWxqnd9GIJEEr8BGhy5vmXy+HsCr7K+?=
 =?us-ascii?Q?lD0ZK2VZSnZABpS5S4iY9BVIqKAXzqFiTOKyHFJEjX8Yj749UueBwUfFvKsq?=
 =?us-ascii?Q?5bqMtSTHhgObm/5mzZ7gr7s/HhOfeIDHHV9iCm5e0eNAlR4Oy68I5C4XqeYG?=
 =?us-ascii?Q?YIvBIjUaQUodweM7rpcdLMDhsQr38JwlgKUD4ohI2vtkCydrhmJ+xUY3B2V4?=
 =?us-ascii?Q?0CKgMO62Wcq3MLqY5cHMZ7HFma1shzBOQzN2wqQxQmLJRat+hPagZobPHkHN?=
 =?us-ascii?Q?Kbqn5YdRUpqaBzt9Cexqd/ruvGrVCOMXXArF1+4TsI0zZZmESh1dZ+vur0rf?=
 =?us-ascii?Q?12+6QC6tJo4pH9Z7T/mQ7WVwCVsHiULPCeZSFPSGe8tP/STg6o1EnwibEsy8?=
 =?us-ascii?Q?2/3HrOz/aWDAWhTgGF/MNqruItNdYbbCRdepTDcDP50TrEAI+/GkpFCoOF9t?=
 =?us-ascii?Q?TFEMbI5IC1aLsdv9bQT6Xq5RjlUAL26QMAXWZihVceqZp5zerJvY6aOYlAKj?=
 =?us-ascii?Q?pircXgF6F1CQ8mGyfp4GooNFTJOoLZhcKoYdxi2pDizCONYCNA/n0cSmo2Yi?=
 =?us-ascii?Q?sS6E20xJUpOUNL0Ekn5e29ApfV/jgSnJjFa/OEeKFY3BwfwG1i80dV5gY4qm?=
 =?us-ascii?Q?G/a4T8BvSnVynGiRHY+Z5hvpiX2u2c47rCiQtDJp39GpE0AvWxiVAak0fUVZ?=
 =?us-ascii?Q?peY3f6Ipw1ZNLGM5hK+TAqcNFcvx/jnBTyZba49lvOtj9DMRB9r0ySxZ5ouI?=
 =?us-ascii?Q?j7f67517c774eN09J2oDiJDmL0GI8ParfoTNnwjBu2q4uTRRLkWwoPUd6f8P?=
 =?us-ascii?Q?vEkncbhB/D8Y8dx6YRC21vXOJO8GZIpIPICpNGENlePJ4mXVsyJk+b9Li3MG?=
 =?us-ascii?Q?9wI+GzKnohg3Xv7QOfdEBfrQdOv0f/BoAZz1nMvejBovRzWylzen/j9yIFVb?=
 =?us-ascii?Q?KuQkfxqOFRiinGher1yJVBdRuo3tZ9/n6YtiP9yd1BfEpfJ6x5CcJpOAb8ZL?=
 =?us-ascii?Q?kDaV86f/MOofuN40qIK+rgWLUjiOSK9NdEuj/c38uXc5yEg/0X65Tkzz95ZD?=
 =?us-ascii?Q?e4Ic5YZYomGfM/YJAfxphxl3ByC2ymAiH4hT5j9ZPZst/seO4qWPJ7sys1k+?=
 =?us-ascii?Q?w2I/XAtAB7nXw5Yh9MW8fmxL7mKU/x09b3RKzTtD/UjEU6nzpne4qglCMKaD?=
 =?us-ascii?Q?f7CLwwHTt+R/215ZY68PN2WaMQHIgRYT+TJN4TH5HXsIlBFpE2eyjqQVfXgO?=
 =?us-ascii?Q?3rC+46A+V85Ojl+Dpev5C1NYnhEO3M5J4vrvp8+XM7TxV+O0NQpIMnugLtQR?=
 =?us-ascii?Q?i4h5g2QJznGlhEhbxo6k80vC6I1E4vZa0trf1Yv5uj8u8nRTcF0qmlhwpZ2Y?=
 =?us-ascii?Q?0Sb85yWAUSKHxnOYKwHID2sBooM3QFHtbPfwyqYAin9SkhvliszEW0qp/Zz6?=
 =?us-ascii?Q?EzgX3lEtdn8271LxTMmsn1psZvDFxeyUlG796z1aoDogIj8/9llB74lrC+GB?=
 =?us-ascii?Q?4HMdHQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f680918-2a0f-4678-4878-08dec7eaf23f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 18:55:03.2990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1814
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.com; s=boeing-s1912; t=1781204130;
 bh=H1D0AkysQEGvspdShMTBz71S8jnDC/MusuSq35vwLZ8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KQhZTSUvvbSG1z9t+wWVbKnEHRjFS0ASCoKL0L0BBMoX+yGMyiVeZyr4fFlBdOBFO
 R6wjMKvUbtn5sKHuKAEVLP91gL7hMR8Qp6yHBr6rszbr+YHAQZjQFOCn2O+tE4713K
 KNRUiBlIosyCaTvmKkpSvbwfzrFyTae6Vw18pBzx640EHJij5YM0aJBRhE2M/HD8ee
 PudaNF1dCMpa3noTj6WoY1F7dSJ7r2P1cG+vlb3z00NB0Axcsfq2XDT2H6ohIVDLd8
 trPaOhIFcoW74YXYusiRzjOy9sD895hKZOGmT4iCA9OvqcJo0UhV493NFro+opiTln
 ubM1CiY9SMxeQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1D0AkysQEGvspdShMTBz71S8jnDC/MusuSq35vwLZ8=;
 b=BdkyWb4/F0s0ppZk2PAfJPdnBqUeXEXi6h5QbNOiPPPWdicQoP7fMvX5/MxPWXhrsuuUuUZ/24DJj+Q9D1V+gSuUx6HTVRhi44aP57fc/YICmluF3OVx/fQHhRvuomjn088tlv7Mt/dW4WOD9MAyMc0PPRSFyAFfmBf9fbLyONo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=boeing.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=boeing.com header.i=@boeing.com
 header.a=rsa-sha256 header.s=boeing-s1912 header.b=KQhZTSUv; 
 dkim=pass (1024-bit key) header.d=boeing.onmicrosoft.com
 header.i=@boeing.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-boeing-onmicrosoft-com header.b=BdkyWb4/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
Subject: Re: [Buildroot] [EXTERNAL] [PATCH v1 2/3] package/xen: add custom
 tarball support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Weber \(US\), Matthew L via buildroot" <buildroot@buildroot.org>
Reply-To: "Weber \(US\), Matthew L" <matthew.l.weber3@boeing.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal,

> 
> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Neal Frager via buildroot
> Sent: Thursday, June 11, 2026 5:18 AM
> To: buildroot@buildroot.org
> Cc: alistair@alistair23.me; stefano.stabellini@amd.com; ibai.erkiaga-elorza@amd.com; luca.ceresoli@bootlin.com; micheal.saleab@amd.com; yann.morin@orange.com; Weber > (US), Matthew L <matthew.l.weber3@boeing.com>; brandon.maier@collins.com; Wood (US), Brian J <brian.j.wood2@boeing.com>; ju.o@free.fr; Neal Frager <neal.frager@amd.com>; > thomas.petazzoni@bootlin.com; romain.naour@smile.fr; michal.simek@amd.com; romain.naour@gmail.com
> Subject: [EXTERNAL] [Buildroot] [PATCH v1 2/3] package/xen: add custom tarball support
> 
> EXT email: be mindful of links/attachments.
> 
> 
> 
> Add support for custom tarballs such as tarballs from vendor Xen trees.
> 
> To test this feature, add the following configs to any zynqmp or versal
> defconfig, so that they can build the latest release of the Xilinx Xen vendor
> tree.
> 
> Add to zynqmp_*_defconfig or versal_*_defconfig:
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx_rebase_4.20_2025.2)/xlnx_rebase_4.20_2025.2.tar.gz"
> 
> Add to package/xen/xen.hash:
> sha256  3453d17402d2d1417fa86ec7f959bbe5ccdf63312224679ef51e4f97d0a32870  xlnx_rebase_4.20_2025.2.tar.gz
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>

Tested with BR2_PACKAGE_XEN_CUSTOM_TARBALL=y and
BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION pointing to the Xilinx vendor
tree (xlnx_rebase_4.20_2025.2). Tarball downloaded and hash verified
successfully. check-package passes without warnings.

Test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
