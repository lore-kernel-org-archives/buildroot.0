Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A71E95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27F2640C6C;
	Wed,  4 Feb 2026 13:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3krg89byYa0; Wed,  4 Feb 2026 13:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CFEA40C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770211396;
	bh=MfWRWAdMeBNvbo9CbNSQ5YT3okE+T+TOjPkxOjqrQgI=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eusKFsEvTcBMo6cxuxoXJW/xD3Ea7qU5vV5vB2YhpIxlgI5pfVtKmLLOetLLgA61K
	 sAXdu9f0LGSPHa8uR7pKRkUWHJbzdGOpTBri/VOyTY6YliSFE5Hu+4/Gpe71Z3dAjD
	 QokN2/3fXDZc9345LKsUzNpRyd6ruu9ToiunrUDr7094DUgjrSQ1kZBQ99bRCs2K4e
	 IUd6lBMM9BubRHgXnXgGCjSBNI6rdAcF9dR8aPsWaOicNIfKNV2PS9qsUd0L6JNGVX
	 syFDClnSzyc93auO/hOo5zNZ8OM6fVqhhQgzdHVqNqfr9jJv5WWk/dUMCFJ4bCV8ZP
	 P9HBnykHUGMNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CFEA40C6F;
	Wed,  4 Feb 2026 13:23:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77801F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56319405F7
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3fa6_3DGB5Q for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:23:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=jimmy.wesolowski@mobileye.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 350E740363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 350E740363
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 350E740363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X60v+X0zrGiYraCG04Xtp7lEqwurn4W1SuIEZhUohE7FB8DebXecgDaP3qolblzZAPRKJXipdcqrpIc2HJRDzkrQjU2DFbTZvtmxclZJu8x876jkHciDbwh/DrHxfdDF+maw3DZeEOWThvedIuQaYiPpNi9LpD682tBayg24Us7hTRwCSShWBi7rpObQh5KQaOoEyRCqst5LWdphnZgbIyKE+9oJa7HmTh4aI2pVcBgKHs3EeOOhv98ewtt0n/l8UXnKbugVB2DBhK7lCn4FIhI6LyCIaG3KBlZbtE8ibz4s116LsT/nTzRcD3/vJMGhiZNHSFqWLD4YfMWJROcupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxEOAeFmAJCtsgfqm4r4C58xyTwvWtrJA9WqSpNDLTQ=;
 b=yfO2FMgIimn53NKq7Cl9hh3fpnS9+CWzcIdmXag7uAT+8BiCXzB9tIVK/fO3a22Ev2N6caUmWTvvhGnTbrZDeuaS9PC37LOC111/eBmharBZtoeJU14Qc3mLzg+aYIfdC/uH8/8JGE8IfRjKzjx266+/K0WkppwpzNbIoXRibQMAf2HILhayPF3una0uq6AxWgeoz23wsqYUNSDzjx27w+iNfqvjqjPt5tSQQLS10/oxmkHMI3ckGiii0CGVFBH0pSFs8K2RQqnfmw4Yu7ZKEvcgXUv+v+KKFamdHKGUN2GVMdtX+rWZzt1Yljt9Rl3JDNBZKwvJbZE2gUp3f07p6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com (2603:10a6:10:2a7::13)
 by GV2PR09MB6422.eurprd09.prod.outlook.com (2603:10a6:150:e1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.10; Wed, 4 Feb
 2026 13:22:57 +0000
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f]) by DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 13:22:56 +0000
To: Andreas Ziegler <br025@umbiko.net>
CC: buildroot <buildroot@buildroot.org>, Guenther Harrasser
 <Guenther.Harrasser@mobileye.com>, Vladimir Kondratiev
 <vladimir.kondratiev@intel.com>, Chris Packham <judge.packham@gmail.com>
Thread-Topic: [PATCH] package/coremark: port for mips-i6500
Thread-Index: AQHcldK8WvTPTwCwNkasvVAyahl4+rVyhmW5
Date: Wed, 4 Feb 2026 13:22:56 +0000
Message-ID: <DB9PR09MB4987A693711BB09B0A9C21B9F698A@DB9PR09MB4987.eurprd09.prod.outlook.com>
References: <mailman.20273.1770054247.2009750.buildroot@buildroot.org>
 <838e68729209415796298901bc72a55d@umbiko.net>
In-Reply-To: <838e68729209415796298901bc72a55d@umbiko.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB4987:EE_|GV2PR09MB6422:EE_
x-ms-office365-filtering-correlation-id: 77b4a1ca-49f4-4b67-6dee-08de63f082ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?oO5p9qw1RTvqOoqwVcnYot/Mx81ULTdWpmgSqKVAztHALFrqaZzNMZPOka?=
 =?iso-8859-1?Q?rts4zmjT2lb7EGAkUMNpM9FcuZhSdd6Ziao9srolffDUbMO5Ak2hgcZEp9?=
 =?iso-8859-1?Q?smJMD17qLBeX0H4REx+mC1+leYsycvpa9/qfagSasTliYBFL1b8cFYa0+X?=
 =?iso-8859-1?Q?4+AoNxFRZGGlfLN1Y2aGlypvF6SG+ysq+9pIlr3AWJidIXMpqgxOM5mVvS?=
 =?iso-8859-1?Q?+rVSmb522HfECGliWlgcihPJhxZdB2yhlezeubzHrGk8IJXcyYI/jTc8Xg?=
 =?iso-8859-1?Q?MgGcjLVkX+Fy/500U2xBj1ptN2y9zmf8JIN/auJWEyZ7oWLsafdVIZgo3O?=
 =?iso-8859-1?Q?HAmiFDZzwtuKX5lWse1mBNMf9tT9NrfzB0wo3flLvW0LbldS9h0C0S5FNa?=
 =?iso-8859-1?Q?MNmiTIa/ljkKEOEkZtVB/A3UJJZb+eCJ3NhsXmVZTRo4jw6sQ5ZNchl/Lm?=
 =?iso-8859-1?Q?xKhXwriVxAujfCaUVzWxTapYYFWwmILpDF3WQpjACBoW0HtwbB1vb7NqZ4?=
 =?iso-8859-1?Q?0oynLRI5Nobu+top4onaado8j0c/Ec3Ocmxl+wCG0BRvKSZXwtyKqo3Oh0?=
 =?iso-8859-1?Q?McVRQSy0NCajr6VngaZGch6mhSK+f/KsqlX6QMm05xHGW0haq7YZ0fde7v?=
 =?iso-8859-1?Q?GYTxIzq9bhOVRENFo4zcBEKJ9nOrjokVrp8OPoL8ZkRQ3y7WCix2Asn2Pe?=
 =?iso-8859-1?Q?GzFri7vpwR/Vrc9APbpufft28XMYFXyDCBzO65JYfXcIQ7+PPNI3eLtrL3?=
 =?iso-8859-1?Q?YYalPvM1pHrNFLTPfg8cEdxJ+S1CrDssjUz3pRgqrjS1773INBex0sn0NI?=
 =?iso-8859-1?Q?pcrDkGvVYxRyn0fLhFsw2BHHetMaCW6YEZguUZieEM6rx8RUJZBsylVux3?=
 =?iso-8859-1?Q?PtoJBayMG7WIsiw9N/nAD6i5DLyx4+xo0L/bxGTK+R9ENdOZas/Bcl/C76?=
 =?iso-8859-1?Q?rQL/MsE6HRmizdZ3z8b+MbqzfkPQB1ooKHvpVFdGw/8PmdTnd92W0gvzAB?=
 =?iso-8859-1?Q?teTuapHFHh+DvaFI6JsPbZawRVBJosoVHFQKSf0yNPkyg+9h8D++qsnAQ7?=
 =?iso-8859-1?Q?GFU6stRew9oNEfxhFqTiot8IK4qjk78GGod9ND3fUrOfNU+xEaUP9HLjDu?=
 =?iso-8859-1?Q?y8pbfdrb0VJjHYHyr3W6ns2iqrLrC18bOoPxmJFx0tBopUGShy3Dxp7dCL?=
 =?iso-8859-1?Q?Dw09EtRI+p4/B9IuIfh/76JRHWlzV3yjEXWvNSGLF7gg9mw63IlDvc9OUQ?=
 =?iso-8859-1?Q?bqvpDQnsv8IDFzG/qZz/ZlXmCsdUi0dKnxXu2WEWiXS7w+ws4WcHt/oFmT?=
 =?iso-8859-1?Q?T9wB3xq+xomY1PyNjzJbnr7Jt1spRBbvTSuBFPM3MfbBPXktH0P+cIuUIk?=
 =?iso-8859-1?Q?kXVD9TA6rR6Gsv9SCBcletrdHZ5RrbaY2ofb3RRNEJm0k+x/MAbwCuaWTQ?=
 =?iso-8859-1?Q?6ldNP5fgUUo/p0Pkc9j5IP6flI7lTf0ec4E9nVhMKxN8XSoNqhk/0dYUgK?=
 =?iso-8859-1?Q?It26d9tsw6c11I76rsAH5LYQ7ATgP0I9zA1nwO2ZCOPyDrjFjjXqPTbToT?=
 =?iso-8859-1?Q?WYBTjUWGp+u/VV2feheXwBR7DCyf5S46ovgB+SS+Tp40Oa62yeTRLc8A7L?=
 =?iso-8859-1?Q?eujxaTNR7eS51HbNtlZaaHFZ0rmY1poqSCX/Hb/P7oruuOayNUM7m84ny3?=
 =?iso-8859-1?Q?TLo6o9VA3DDIqygHCNk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR09MB4987.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?skGv+YK8xVIJBm4cbUalgN3hQNj0aQmR+1dSJSLisrVfsT2Izj6CEUbo1X?=
 =?iso-8859-1?Q?MELlXvek47pr6awWyFrFpHygAAdAU1nAfh+FGhS2Zq8q3u5CTOeMPLj942?=
 =?iso-8859-1?Q?bXwlD2HAN7cjs5rlxlx09uHrofSIaM/1BflTRRqfw3REyCRTywgZEIPy4j?=
 =?iso-8859-1?Q?ZelqMw1+7EP+6xU47pmx/tw9PjeSXZmZ9ZmU/yPljiejv7HEk+qZEo1x0A?=
 =?iso-8859-1?Q?NwRUV1AU4lcG4Qr78NHBM2HqZ79MOgZ77e97n/nKLgiUsj0CY9zweY7yoS?=
 =?iso-8859-1?Q?EE88v2Qwi/rc2omK4+8+WSgHYQKyt3v0//A0/v9uur1b5Pr1augsRrzjYg?=
 =?iso-8859-1?Q?p8qaO4DAWOmqHoeroYBJdTyeyf1J+6a4z0LzowUYlr7HWzy0IrIFhLUkQQ?=
 =?iso-8859-1?Q?XMw3yWtRovYjqODQ169IO6PtqXrcanNi2zYhYeh5Q0TuS6PnKvmi/tCg/B?=
 =?iso-8859-1?Q?MLDF05mIlzKLehkmEo8Qn43+8F2qX2doWKqslSiR+JJb2HkpDBBjETIy9p?=
 =?iso-8859-1?Q?ng4Q/pKrCxQ3Z7eaOL7XzgCGx2G2Zw+f6sz0vZjQbXqXyQnBPXGNsfz7jK?=
 =?iso-8859-1?Q?3DD9DqIRSHLJkaNHt7w8hhklXSMoKIJ75vGjIfckoOBBpbLCkTJBwLApvf?=
 =?iso-8859-1?Q?Ye2hJa0JbTSFXuPfbF+TgW7M/0y8KtqY/22z0n4CbDRkiDRa95HVA5/auQ?=
 =?iso-8859-1?Q?bpwTcWyYBT78G3cAv9Zxrpk1tWuSSFgOnRTWDhZAy7KwlaynIOm7Ogq0gR?=
 =?iso-8859-1?Q?VtXtmOBtTvfr0wZzu1tT4U76YkanNksNxU77WkhL5DKur8Nq0Qte8EDf/s?=
 =?iso-8859-1?Q?P8bOGKhXaFZE+xRqwstCjyDCr1okWKboGZhFw4NV58qWBNr0nDzvzoRHRf?=
 =?iso-8859-1?Q?/x5YzyZaVEG5i4y6nh7Q1mnclmMYMa1XYHIvJVrRhYYTWZGwfLJBIy+ynq?=
 =?iso-8859-1?Q?os19TH/NAaCUHJvdA8V7li76ERKBDWZXspebZ9C8O0YtFp9vjSFUv6252u?=
 =?iso-8859-1?Q?jE/KHL0fEpkq2/DA2xB/z6DzRrJqpIvsjmpItGxdWQK4HgK/8qztJNMT0T?=
 =?iso-8859-1?Q?cutQdSxGoMnfokx6gUn/XY6KMxc4Xuw2XK06XHGbQqSpimDskb1be+VLba?=
 =?iso-8859-1?Q?e4gD4aJQ0c3X2gRegthogAF9AcR5puO+ZFmXFvj7wXQE+PdEkrSHgipfgS?=
 =?iso-8859-1?Q?t7QKnEOaVcQ2z37GnV2VJYaWI/ISk4jrhK7UlRgz3FV09ITb64D8YM0Yh6?=
 =?iso-8859-1?Q?dHKDais7bwPKkxgT82yvHDV2liK//HCb0BtNHRN3saMaRPVf02Z4kgYBKi?=
 =?iso-8859-1?Q?pbF9bcVyjKTzz/2KjtEDAXxGbG4eM3FX7x1qPfklfz/riizaZa5Qx3Jv1G?=
 =?iso-8859-1?Q?4PTtC/MzFwmAKj3+8qSKKv0EcwM925t9XIaQIcHpZaQtlsQy2UmuQUy6TR?=
 =?iso-8859-1?Q?tjoyIl2vluad3xb/2S3WOaTemSCRb8RvbcNtc/m6ydSfIbSEHxrZaeaDVV?=
 =?iso-8859-1?Q?U+Gtql4KIIH/s9x8pWraOvcCILYWr9IJKxHnd91DOHQ3a8y0AswdUVNzLE?=
 =?iso-8859-1?Q?+yNISP2/j7kqX6ikPtj3ijTXyA4dlqQWNxFOnUKkcRPoQEKtw99bRpH2Li?=
 =?iso-8859-1?Q?4n8VvmEyp0bJt0eTiR+go3HMltIq+Hn8J9KELTOx+PiGX2RO5SuoWBqdKU?=
 =?iso-8859-1?Q?XBrS2FGlDFfGn01HulNffKfy400yHA5KtC2retXSNT6qzbrZx0Ia4WEbIa?=
 =?iso-8859-1?Q?pFxpBgNENXwjTZTPzWROYiX8lkhBHfOv+/jMmBguDOVYJS?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB4987.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b4a1ca-49f4-4b67-6dee-08de63f082ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 13:22:56.8590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4NSPyh4EoR4zO8pwzaALyycGmIVFq2HCdoKK9XwaW7NdQMtlnpP0HXoChfviwPmAFe2o3ER7cqYuNdfAUJW0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR09MB6422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mobileye.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxEOAeFmAJCtsgfqm4r4C58xyTwvWtrJA9WqSpNDLTQ=;
 b=MgZeV5xIEVidLHaBK18B1oe2fWQgbFttoc2liYdhhfDZtp5caCifrWEof4hbooJg51NjH1TVVnasJKWvGPkRM749plFxFhw3yHxlNF8XqiDrgCVyDW8gF4U0tftzvJGHDGb7wpJOp3uQyLEOlTDpSZ2xR8v/mY/b872/ibooG5k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256
 header.s=selector1 header.b=MgZeV5xI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Subject: Re: [Buildroot] [PATCH] package/coremark: port for mips-i6500
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
From: Jimmy Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas,


Thank you very much for the review, and I am sorry for the terrible format, Office does
not allow proper inline answering.

We are indeed using a BR2_EXTERNAL, but we are in the process of upstreaming.
However, you are absolutely right, I did not pay attention to the patch itself, and that
makes my Acked-By more than a mistake.
I will adapt according to your comments and resend once fixed.


Thank you again.
Best regards,

________________________________________
From: Andreas Ziegler <br025@umbiko.net>
Sent: 04 February 2026 13:35
To: Jimmy Wesolowski
Cc: buildroot; Guenther Harrasser; Vladimir Kondratiev; Chris Packham
Subject: Re: [PATCH] package/coremark: port for mips-i6500

EXTERNAL EMAIL: Do not click any links or open any attachments unless you trust the sender and know the content is safe.

Hi Jimmy, all

[add Chris Packham -> DEVELOPERS file]

This change is normally something that would be handled in a private
overlay (e.g. BR2_EXTERNAL). Also Buildroot will never pick up these
modifications, unless you also add logic to
package/coremark/coremark.mk.

More remarks below:

On 2026-02-02 16:53, Jimmy Durand Wesolowski wrote:
>
> Compile for MIPS I6500 CPU 64-bit, with all compiler flags as
> recommended by MIPS
>
> One missing flag -s "-Tmsym32.ld" since linker script
> "msym32.ld" does not exist in the MIPS toolchain
>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> Acked-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> ---
>  .../0001-skeleton-for-mips-i6500.patch        | 804 ++++++++++++++++++
>  ...iler-flags-customized-for-mips-i6500.patch |  35 +
>  2 files changed, 839 insertions(+)
>  create mode 100644 package/coremark/0001-skeleton-for-mips-i6500.patch
>  create mode 100644
> package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
>
> diff --git a/package/coremark/0001-skeleton-for-mips-i6500.patch
> b/package/coremark/0001-skeleton-for-mips-i6500.patch
> new file mode 100644
> index 0000000000..e71dc980c8
> --- /dev/null
> +++ b/package/coremark/0001-skeleton-for-mips-i6500.patch
> @@ -0,0 +1,804 @@
> +From c8f187ca290e65f9d6b14ef5ad57fa61f7f8b95f Mon Sep 17 00:00:00 2001
> +From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> +Date: Wed, 27 Feb 2019 09:55:55 +0200
> +Subject: [PATCH 1/2] skeleton for mips i6500
> +
> +port for mips-i6500 created, copied from linux64
> +
> +Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> +---
> + mips-i6500/core_portme.c   | 336
> +++++++++++++++++++++++++++++++++++++
> + mips-i6500/core_portme.h   | 291 ++++++++++++++++++++++++++++++++
> + mips-i6500/core_portme.mak | 140 ++++++++++++++++
> + 3 files changed, 767 insertions(+)
> + create mode 100755 mips-i6500/core_portme.c
> + create mode 100755 mips-i6500/core_portme.h
> + create mode 100755 mips-i6500/core_portme.mak

A more elegant way to create the baseline would be to add an appropriate
rsync command to COREMARK_POST_EXTRACT_HOOKS.

<patch body removed>

> diff --git
> a/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
> b/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
> new file mode 100644
> index 0000000000..1fdef1f300
> --- /dev/null
> +++
> b/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
> @@ -0,0 +1,35 @@
> +From 59542343c82a936326345455036d33ba30a646c5 Mon Sep 17 00:00:00 2001
> +From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> +Date: Wed, 27 Feb 2019 10:05:52 +0200
> +Subject: [PATCH 2/2] Compiler flags customized for mips-i6500
> +
> +Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> +---
> + mips-i6500/core_portme.mak | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/mips-i6500/core_portme.mak b/mips-i6500/core_portme.mak
> +index 5cfabee32658..8e0ac11d7854 100755
> +--- a/mips-i6500/core_portme.mak
> ++++ b/mips-i6500/core_portme.mak
> +@@ -24,13 +24,16 @@ OUTFLAG= -o
> + CC = gcc
> + # Flag: CFLAGS
> + #   Use this flag to define compiler options. Note, you can add
> compiler options from the command line using XCFLAGS="other flags"
> +-PORT_CFLAGS = -O2
> ++PORT_CFLAGS := -DRTELinux -DITERATIONS=0 -DUSE_PTHREAD
> -DMULTITHREAD=4
> ++PORT_CFLAGS += -O3 -funroll-all-loops -falign-jumps=16
> -falign-loops=16 -falign-functions=16 -finline-functions
> -finline-limit=1000
> ++PORT_CFLAGS += -fgcse-sm -fgcse-las -EL -mtune=i6500 -mabi=64 -mmsa

Why not use the project's CFLAGS? You might always wonder why the rest
of the stuff is so much slower than the coremark score suggests ...

> + FLAGS_STR = "$(PORT_CFLAGS) $(XCFLAGS) $(XLFLAGS) $(LFLAGS_END)"
> + CFLAGS = $(PORT_CFLAGS) -I$(PORT_DIR) -I.
> -DFLAGS_STR=\"$(FLAGS_STR)\"
> + #Flag: LFLAGS_END
> + #   Define any libraries needed for linking or other flags that should
> come at the end of the link line (e.g. linker scripts).
> + #   Note: On certain platforms, the default clock_gettime
> implementation is supported but requires linking of librt.
> +-LFLAGS_END += -lrt
> ++LFLAGS_END += -lrt -lpthread -static
> ++#-Tmsym32.ld
> + # Flag: PORT_SRCS
> + # Port specific source files can be added here
> + PORT_SRCS = $(PORT_DIR)/core_portme.c

Shouldn't pthread and static normally come from the Buildroot
configuration?

Unless the sequence of library includes is significant (PORT_CFLAGS ...
LFLAGS_END), you might just override PORT_CFLAGS and be done.

COREMARK_CFLAGS = \
        $(TARGET_CFLAGS) \
        -DUSE_CLOCK=1 \
        -DMEM_LOCATION='\"initramfs\"'

define COREMARK_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
                PORT_CFLAGS="$(COREMARK_CFLAGS)" \
                PORT_DIR=linux EXE= link
endef

> +--
> +2.19.1
> --
> 2.43.0

Kind regards,
Andreas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
