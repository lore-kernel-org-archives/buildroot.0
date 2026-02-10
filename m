Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF71EA8123
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 14:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B4BB83E3C;
	Tue, 10 Feb 2026 14:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvPIDBI6mGFX; Tue, 10 Feb 2026 14:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D63A83D21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770734620;
	bh=oV/kodAtFcGl1KmyK/+u32yksV8K9TyQlIgmyJ1l8Hc=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E+JwjD4o0Di8uVXdq/DQ9P68918lAFdcn0pcjETOmRuZJYJ3tcuatK/ilF5Ya5fe4
	 BFnHXFHKNAbrpvTPwrrXLE3wrOUssGoJJj27zjxfTsT3UMw7zTW+FMqliAbdAYRkzm
	 5mh+WiesKwjQIqkpfpDZRZ3O9SUZ6MN6tWR3v0r5Nk8EbJWDS11tZG+EUHkHgaRC4K
	 cYFo/hbiGnp6aB2p38lAWfYN78x2ufYkHjmYLWPbmRpNoT8eDECUjNi8B+5A+LpyRL
	 nmRnBH6+obxWJ+DgpSBSywhzX/mu0Qs8fgOuiB/zWT3nuSmpyUIUbB0nuQb7+8+zkM
	 2TQG8EN9VDCgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D63A83D21;
	Tue, 10 Feb 2026 14:43:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF5C51A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90A94608FB
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG8L6aXG7CxS for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 14:43:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::4;
 helo=pr0p264cu014.outbound.protection.outlook.com;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 542C46087D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 542C46087D
Received: from PR0P264CU014.outbound.protection.outlook.com
 (mail-francecentralazlp170120004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 542C46087D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oT/1KrZkioiNFgY5Jy8OSwB2D7R/vLcqqmwlG5y9hJl/Y/JErTTKGiFWqAdB1z3R4l+jLLOaP4P6uE+9EkKo052lq8jZ6CubMdoP54KWvcoJk3wuNC2sDirXhrlg4YNcZQFPVH40mE+8d1Zdy2eWWAszJQQ14Etx6Klckd4SKIObTYnvH+TWI9X1WL4xUExPayG9GlsEGhZQQPgLqzTTQc7/Wd+v9ZItclJ1rg1c/tqHy2H1TFMY7+UJYFlFs+vHaz6FqkXPf+Mg46sVBH/PFNCBDLIMBknn86ifv7IuiFw05sCCvm5QqtVF7ZRXHDD0SkVhjxS7UL5NsttIJUYklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWtimSpcdt2mbBR9gk8RbMwzdwKs8Z35BWFY3tpWO4w=;
 b=BqOWbf7EklhtZ6L0ztehYgxqn8DgPht6jvPyPJGkQxqYFdgd4tKrHuIfIYqlaVp6FmrhjReN/npxA8bwEa9UZDhC9F2zJYbIpmx2eIxu5ftsns6InPfdmFWySetsztr3y8CK93GfRD0FTQuFHzFVoalJdtkxxXzjiM+Xpnhaakbcbkb0UHDpt4EF6n3wqwK65c1o2NCjLmCYUiscxbiUua7lWUbHHv3eWVZaEv16vxSqRT2rGDIpRoFoEr5tR1X4s3fOiyK5/MT/6HfTiYh3tal0sDuUj8HNRz6kEAZM5U+caDjrmSmjujlUkq9753+OrOH1NWhhVGH7K+Nhq6DvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartandconnective.com; dmarc=pass action=none
 header.from=smartandconnective.com; dkim=pass
 header.d=smartandconnective.com; arc=none
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::6) by
 PARP264MB5519.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3eb::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 14:43:33 +0000
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1]) by MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1%6]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 14:43:33 +0000
From: Sebastien LAVEZE <slaveze@smartandconnective.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Sebastien LAVEZE <slaveze@smartandconnective.com>
Thread-Topic: [RFC PATCH] package/pkg-cargo: add HOST_* variables for target
 build
Thread-Index: AQHcmpuhwZTZYBeNS0ijj7Y/Fn2kvQ==
Date: Tue, 10 Feb 2026 14:43:33 +0000
Message-ID: <20260210144308.689103-1-slaveze@smartandconnective.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB3425:EE_|PARP264MB5519:EE_
x-ms-office365-filtering-correlation-id: cf38f13a-6ca5-4d12-dd17-08de68b2c3ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?U0Fn9wUcT7gSduSeCwcik1E7nZcnWESY4CrgkKIZgHtbnpsHP1suRyEjVa?=
 =?iso-8859-1?Q?UNLl0o2BUG7O2iEcAs7ADlTi1jdY1pc06lFoWVRBp8CMda96nmDW4F33iv?=
 =?iso-8859-1?Q?T45UU9A5ZsjrzG16NrLEh7iypA/qxF/4TKGccqzb1YWRgSqlZoDMAQL1eJ?=
 =?iso-8859-1?Q?uDoQ7pleaP1Du0pwnuiYioQFh0IjfcCcM1QqMx10rijkHR8i9IdClhNsWf?=
 =?iso-8859-1?Q?XJB0YjK1A0ghMUttiIMChvxJAEBSNlq3wAVo/MNJx9JJr1ykWK2LlqrV38?=
 =?iso-8859-1?Q?O2br4REvIGlktxzHDBf0jQuLRxx4Z/3W6dzgJTAGX8efTVoxQBnkkBKODC?=
 =?iso-8859-1?Q?UC9UpkjIm9OxjaLWG+26SdLN07t/4RS5G5HYTAS4ESnSS2vJ/XMAVR0Yyh?=
 =?iso-8859-1?Q?EGGg/DUufNVBYZlPzcEMT2lhGnW1yU703AjyJwd0QTyBL/RX26VBrTma1v?=
 =?iso-8859-1?Q?lORJQ/EWMOVp8TiAEt9VrlMEycN6FValud0hNqIBbCTgjfWrF5qL00pqxG?=
 =?iso-8859-1?Q?BZuQPzSp8b7nu1aA/Vg93N3Yr7iCQPgadCwsneQIMcp0yRqLbMlyxWoJbg?=
 =?iso-8859-1?Q?rMI2kGORKPlkqdJdQhWZoJFTuEXPYgJ7RCkcgJkyY3E8tzhXJiq+L6Pryv?=
 =?iso-8859-1?Q?7Vty2uWYaAaoPPFkv/HfwLpW/4AZHxeGb5Uion45y37C9dT6cp8VupQ4Cs?=
 =?iso-8859-1?Q?c7kVuZlRlmBSg4SBnLxde9gevcZWpctKG1lwOZdNUpa/kGybFVbdpEU/mL?=
 =?iso-8859-1?Q?ZANBQfaqcm30wXaaVHkgIWVS1jw7ytcWq6gh4i4aGQTybRuYluLbalIT2V?=
 =?iso-8859-1?Q?/qHblTt3INd97QOm+ckA++/JZZ/bSGS7I2EvQ4TvKo52FO9zZMn86qfCLz?=
 =?iso-8859-1?Q?nAA5299W5GFj1jM8XoFDWSRSi6co91zf/wN+B0mfClaAXZXkwPsVFwLTgr?=
 =?iso-8859-1?Q?J67iOI8GlRG+QU4ZnLqtOLFL0jkexgo4i35MiAt6yNoqeOMq7x4FfM7dfU?=
 =?iso-8859-1?Q?z6IGZrfH68zFN0ne9Y+rQCN0aBnNco5kqJz3fiBdwn2+JiSwWGotsUBkXa?=
 =?iso-8859-1?Q?kCmFMX7NtO2PCwNJB9ce8z42ZwUk1akC0vfrA9/AjvkK5wFb2jpvDRDsPP?=
 =?iso-8859-1?Q?jdEgfSOTBWwm4N6iB+3k8eVwgTySBSQ6IM92UJccsnm7AEDVr8Ax+z8zEc?=
 =?iso-8859-1?Q?mh8+oJGXlBRj4vsyttO52mY6h4H9uIyL9Y8t5sjcDIIbTvPO5EeADMSOA9?=
 =?iso-8859-1?Q?3sukyKJsC1Vn2b/DPjtY8Uw1UFF82UwO0Au4GJdWVkqlCgiCnr1XEYtHJj?=
 =?iso-8859-1?Q?tQUYAK9TlM8NEF9A88AG2j+/Qq/djQjbn647qrKKr1zMPRFvc+MOy1hLBJ?=
 =?iso-8859-1?Q?D1KPcM7OjR1QTJmitTS2QVb2MjQ1LZwB8Koizm/qSgRkokm8MDVTVaJuYy?=
 =?iso-8859-1?Q?CDFYXhGeWr5a0/ujA0mjz5B7t3gelMKCY1+d0uLLGihxuDRWyhr+c4bXtP?=
 =?iso-8859-1?Q?GQXSU9aUdWjc3j7Cy2A7ABN9o73WInq6FpPNr7vFfkGJ4aG0Y5xsoIwSjG?=
 =?iso-8859-1?Q?6hmeGkuAefGbaYbk9XBmF/EkfBn/y0FTI8JeruDl2IFSvM41wh8gr6pRyP?=
 =?iso-8859-1?Q?WopvWNZsWTcIXD101fYpvu3GwtEcz5N1Tp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gzTZH0yH2j9o0eXNrMlKw2Cv7MwEeP/loun2UKu0+gvE/QyVyHghB2BWvA?=
 =?iso-8859-1?Q?xieDfetYd57bY/zAD8vzNYwlZMWtr5boTpHbeeV6etesm18kb0ODRYZypc?=
 =?iso-8859-1?Q?o9Ajezsw9p2BNTX27WzmRfIAjlFzzTO+g05SOcm+T0Rz5o6XRJyLfGsf7M?=
 =?iso-8859-1?Q?iPpDwY8wpSXpIuPgS1pKG5QXZnU2Uod/9fZwxCuJEzQHTuGVbYWkzDsslm?=
 =?iso-8859-1?Q?DTFvgWhBEebclvx7wFJM8l/d2kHlM68CnUt9qrxAvh9kGiH6XhwknHKZ/z?=
 =?iso-8859-1?Q?AQWzQIqW8xe8Ig0/IHwthQ36B1gq3iw/L5A7c5wXVFt3OZBRy/44QDjW1E?=
 =?iso-8859-1?Q?Gri0za2zWcqNoa7GBXd3zwR7WaqpTTUL7c6LSs7CYxM5tz2DzGDBarmyoD?=
 =?iso-8859-1?Q?8lqYVzatLUbge6rXPOI011xF8ttJBsrZ0Ue0mvLEEA9eXpEHzhgLTQpOxT?=
 =?iso-8859-1?Q?a/awb+wGRqMmo8rgo8YRkjhsbbFCv2t75JmhEadSUgUNhBPDvS57k4n/+t?=
 =?iso-8859-1?Q?iBr1+rf+sBIsA9Bk3jV3/SGCeBLMtKwiZyNY1mjX4/85ouyay5knu1r7DP?=
 =?iso-8859-1?Q?YBXaurST4oa3EwZSbo1Nqi+xKdJJMTGwtvQ0OXtw3og9/v0TVoMCknmjjT?=
 =?iso-8859-1?Q?AdXf98vt3ENd6k9/2oU5VTDcEW+FgQbyRAKqLUDmTQjWqKlM4jYGudZfzx?=
 =?iso-8859-1?Q?N9ETFruNMw16yXuo4bJn5rBpHiK7aVTSkouuw4/TQr8wVTFsmpNoEYKzS9?=
 =?iso-8859-1?Q?DVf+wh2Y1P8lprF9IctWH977LNNNAV6l617FDFqikCQLAitXd/NfTLOB8D?=
 =?iso-8859-1?Q?FsmdP13H50dWbWUiCgcuWx/ehYV+CrFe/KD3zjd6XDCxTx71BOoKgldOxo?=
 =?iso-8859-1?Q?5B9hdVnOI5pCbU3b1MgEsAseQBmsdNSeKlTi0HqTPxFnl9OIvB5zX5LTi8?=
 =?iso-8859-1?Q?/kHCDYc7u2M203mXBSNiBZ8wfCAf8LIyavNjopN7hXLjPLXQzLJ4EJdsTf?=
 =?iso-8859-1?Q?ENb7QAfhFRq3ptfWt5ulmSo/rYNETuVv4byZOprYJ76PB7vM6m4UmjnDdg?=
 =?iso-8859-1?Q?AKNzLWiaPe9rZjObm8AkoQWnbKrMluAHr9lMmjHg6cCOL+vCCiJQJK3fUV?=
 =?iso-8859-1?Q?7btb4QvjwDvuBPGM10F8hizFFEFUbddyKl5ifco4tzh+GJ9QV+X0n+09Gw?=
 =?iso-8859-1?Q?Np+OzInpdJWsAYF4ZOnTe5mU6MwIbBbEJJ5IORNJybKy3RUJhox+agzMCq?=
 =?iso-8859-1?Q?5lJG/Yvva5ho4GC6vi+VtB3GtL2cLrVgIlVVKmziF/61iQ80SeRgAVDeEI?=
 =?iso-8859-1?Q?csK2tzaAk/AKQexv3Bcnq/KH2K6ZafbYy8hl3OY2z/SMZM0XRiDL0p1wSO?=
 =?iso-8859-1?Q?waJxu7XbUC65eLJseyQ/8QB72cjQd9IllIcJZ9DG3ngzvoVCoeQnQXA/Ux?=
 =?iso-8859-1?Q?9/TryAdFVNL4Vw4M/K0Obja6eU8jNvnbBzTfrrJfHURkYy/alBCUkBQPGg?=
 =?iso-8859-1?Q?+IJ6nTaabGiSaitlpmI81aGL8CKXQO46yGu+9RuchbeoTwzzrr1Y3Jl2lg?=
 =?iso-8859-1?Q?u7bOr+9GWH5hvCByHJTjji7pIuWVxz1Ku4wIpnIyHPEIkUsDQyX8msjvHM?=
 =?iso-8859-1?Q?XGijHAZjaKPhoWdpKXFlq0lYLgsKuPLJsbqdUbUS+KztjAo+gvSB5lFCxG?=
 =?iso-8859-1?Q?r19ZaoS7kHurlWYAvGoVU9UTiMm1wzEuvOwjC4rWYg7HWOLCtwGCIap4I+?=
 =?iso-8859-1?Q?IiqyTLhqjp/6rv25yK7kSF5geVFfPuBJIydOusfkuV2rHzJ903z+bmHOh5?=
 =?iso-8859-1?Q?q2b+aPz/Df5TDmnrvxU0D35ozRdPzcw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: smartandconnective.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf38f13a-6ca5-4d12-dd17-08de68b2c3ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 14:43:33.3444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7f3dead9-eeef-44dc-ad5d-e14fabd26082
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JmO2OfkzfhQOtVpoIP7Wf+IXBe+wCKF/2JnBb5jyBKa+WQeO8b4IYmdXBI93zP/C6IvM6b4S/s2YHhFuNi5Pxe2bewhzE/hq8VIh3N/MQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB5519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWtimSpcdt2mbBR9gk8RbMwzdwKs8Z35BWFY3tpWO4w=;
 b=Oz3q+fvjHG/QqB6G/mrmbq9it+abDETBYd6XhLfjnGVB+pU7POIupS9L1np8l5aMSPHbEa3FzajTw8ddU1hKQDI1nev3YJnKBNGuMjRO6vUpQPW9v1gdjT8jyZr7CQ+J7aw7gmtFN3sPgWJJCaHHzR600kfXMYfhot42IZLwYIY+0sReH6tJ87Mic2M0GDreoEIzJMj3q3TfXQjUatiDVzfGwv0DcTb7Ibo6TkecK0nvGIs66mo17+jGl7OfFmrmXLg0d5EQHxbliNvcC0PiJc8Vr63kDD+Q23hPlms4vvoCebNezbV6gBKgnG1NZn13kVmIbuD8d7FK+vxW86B//A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smartandconnective.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=selector1 header.b=Oz3q+fvj
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartandconnective.com;
Subject: [Buildroot] [RFC PATCH] package/pkg-cargo: add HOST_* variables for
 target build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sebastien Laveze <slaveze@smartandconnective.com>

Cargo builds both host (build.rs) and target in the same build stage.

Host-side build scripts (build.rs) using cc-rs resolve tools/flags through
HOST_* before falling back to unprefixed variables. Without HOST_* set, they
can incorrectly pick target compiler/flags and fail in mixed-bitness setups
(e.g. 64-bit host with 32-bit target).

https://docs.rs/cc/1.2.55/cc/#external-configuration-via-environment-variables

Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>
---
 package/pkg-cargo.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47a6353f25..a3c7436a1b 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -51,7 +51,19 @@ PKG_CARGO_ENV = \
 	CARGO_TARGET_APPLIES_TO_HOST="false" \
 	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
 	CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
-	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
+	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc \
+	HOST_AR="$(HOSTAR)" \
+	HOST_AS="$(HOSTAS)" \
+	HOST_CC="$(HOSTCC)" \
+	HOST_CXX="$(HOSTCXX)" \
+	HOST_CPP="$(HOSTCPP)" \
+	HOST_LD="$(HOSTLD)" \
+	HOST_NM="$(HOSTNM)" \
+	HOST_RANLIB="$(HOSTRANLIB)" \
+	HOST_PKG_CONFIG_SYSROOT_DIR="/" \
+	HOST_PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	HOST_PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	HOST_PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
 
 # We always set both CARGO_PROFILE_DEV and CARGO_PROFILE_RELEASE
 # as we are unable to select a build profile using the environment.
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
