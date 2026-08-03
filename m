Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94122C55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 15:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A34960675;
	Mon,  3 Aug 2026 15:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXty-hfB-Xi8; Mon,  3 Aug 2026 15:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A75C8605D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785770566;
	bh=iQqhqG2kHCMC1n6vwfd1OtboCVc7G3SUUGJrHuzfdK8=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pLvfJdcwtd3zOzRChz1syiKzXP0sasd1wtExDyTa1UcZM6Tv4A4Ayt0u1o/Q6Q9tA
	 pAKAJmeWAoGj3TJA/vtoNIrnk1srMuXexytpqSfl+EtMy2j166CUmu3LyTa7s4EwaX
	 Qas7ybMbk0q9FuySBhKiL6p3hPl72b55sDm8xuw8ElLqhJU4mzgQmDsgqFTUx+B7Hx
	 mHWv0U7tPZiNSAalaFeLuYF0cKwPCA9RHew/AGwZwtT6yujMouO88D+c0Ua7QWCPwP
	 WeS2LR4nOeB2QAiSr0B6wEj8yZ/Ha/DIiRLikybytFWOL1Xwi69iTvyYCPMirXtf1T
	 xVR96R72g+goA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A75C8605D3;
	Mon,  3 Aug 2026 15:22:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3693C2AA
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C53040506
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2NMp1ZaRdd1 for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 15:22:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.76.20.194;
 helo=ewa-mbsout-01.mbs.boeing.net; envelope-from=matthew.l.weber3@boeing.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8C1A40504
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C1A40504
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net
 [130.76.20.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8C1A40504
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 673FMPVp060463; Mon, 3 Aug 2026 08:22:42 -0700
Received: from XCH16-07-03.nos.boeing.com (xch16-07-03.nos.boeing.com
 [137.137.111.36])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 673FM027059768
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 Aug 2026 08:22:00 -0700
Received: from XCH19-01-03.nos.boeing.com (137.137.110.158) by
 XCH16-07-03.nos.boeing.com (137.137.111.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.71; Mon, 3 Aug 2026 08:21:59 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH19-01-03.nos.boeing.com (137.137.110.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 08:21:59 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.145)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 3 Aug
 2026 08:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=WQNkOm2hz8lgnlZxpzlUas8oEVlBoTc4b41iGe0FT0DJZdb4zHxnhVELFh6GA7Ian8WpPXPBTnqUJUVYYU/kh2I5ovVPvIKYEj7drWi1CZv4rQzgJwj0OApCvw6dVSV38zZN1RP5U5cCKZPtKESNtyD5oXBG/xDVWEzS0JGKrMiZW+KY1Hh4IA9DJ7NDGH+RbiYcoXFXOO9jGuW7vHk7z6QEFHfKKwHE+AeF5HQEYkWMZlrwAWI1V6228JEdSsvZjPPg0ieVK9eSQJxcUApg5WdyJyYbh8M+xduDTUEIDz0wE7Iy1yM6+PiyCfaI3H+PslVkAzZyaF7hcCANJHR2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpPyN99C0lPgpsu0BpIs+IciV9KlR49zA6/1I0Pp9qU=;
 b=uKL3H5fZvmWJikCzMos/abaZzyYUxuWRmUw4O+A0ATOjZCcYyRdJFzDCyyD8L3WYt9OTNCDjWDBuAohfNufRojfbYXMqkK7rKenn2/714aVSD6wGV19xco8OXR2V0NnaLSwrJ+u+ubJ53QcuQXW7sZxMpzX/E+MCA/eVTTrWkCsM3F94NSOFR7Doc7BEb6SqnzOvIdOs2HPF3aeMCiIqwlLXWY3oeflTZXP40h2Ga/uOMj8eyNATMh4NpZTXS7ldLC5ilXpagAYY4qE54zQQyMRUgKhqaimmYBabyGKRalghjHJXIFhVtns/2HrUls4UyWZuqxV0mWoo6XmK00gEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by SA1P110MB1567.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.21; Mon, 3 Aug
 2026 15:21:43 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932%5]) with mapi id 15.21.0223.017; Mon, 3 Aug 2026
 15:21:43 +0000
To: Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "ibai.erkiaga-elorza@amd.com" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "micheal.saleab@amd.com" <micheal.saleab@amd.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>, Matthew Weber <mathew.l.weber3@boeing.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "john.ernberg@actia.se" <john.ernberg@actia.se>, "Wood (US), Brian J"
 <brian.j.wood2@boeing.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "michal.simek@amd.com"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [EXTERNAL] [Buildroot] [PATCH v4 2/4] package/xen: add custom
 version support
Thread-Index: AQHdI1fJ1szT+W3zQkGYxTM2N9xM/LaMbzuQ
Date: Mon, 3 Aug 2026 15:21:43 +0000
Message-ID: <BN0P110MB20672AF5339439D6D7AD3013F3D5A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <20260803145152.102135-1-neal.frager@amd.com>
 <20260803145152.102135-2-neal.frager@amd.com>
In-Reply-To: <20260803145152.102135-2-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|SA1P110MB1567:EE_
x-ms-office365-filtering-correlation-id: 0057b3b0-1db6-4f87-b443-08def172ecd1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|7416014|38070700021|6133799003|4143699003|10067099003|56012099006|22082099003|18002099003|41080700001|15866825006;
x-microsoft-antispam-message-info: LiR+E0pZytQt3WamWdGdmwnIgfmYlMykYOs5Y661OVkw1LvRqZ4wxdKgjWN6KnMmeQjwDjnGRUaBMhTvNnrZS4jBG112ueTED8Utfp20yUACRNVXOS4Zg/zfm1M55X23raDhwjBZ49lmFfuBzNRNh8hiC3Xb+El79RMnmSOJFNyERi22bgHTBFAIy+wqBRVeDm3KWNE7dCfo6YjcIt+QoX6VG6fmGKJN3OICHT5vlngCE5l30leSuJtaFXXSqS1VAK6L6Fp4mtJHyg1SprzEWZPMqZZpopFLfF0sPT6CQ4p0EdCAqc4dy1J+1t6CsnAvIB27sZ/8qAUGgYHz8SyXGxQaHy8xVJvPvACYB73Uhq1cP5IclHyd59PBSjXqHh+D5502sGP/9hSMwL50DNsLsYI6931mRR/p9q37qUXM05AJVvNhtBiIn/H6ljBQyFFNXaW0Hm6QCcHTwbBqboHBi6wi4IEcLzzSGMN43AKx/mj3xMDxhUhJeOe/tJXYl85zdekYhMUYA/dS/cMferD+XBCIgz4TGhS1tT8dv9MnAuj9FKjrHoSbTDCSeED45KKEuxF6MPGrklNHhuIZW4V/I64lH0CLzj0+gXkx9MSWX1gsTbHPe6yhpOfvdwpSYXASE0iTnz0ijS+dlKB1AOXk33lYY3kht3LKikbi1gJZs0CIjd8VjSrcJ5yDRNJ/9bWn2rFXFeDafkH+QLEkb7ujho0zY4MHYTRq9FlEP1OFDyQbMmXHF/OAdvUFtClVLJssx7mTw0mFv+PhtWUh9wGsk/89nDCh3pTSvy/Aken4dtQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(38070700021)(6133799003)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xxpV7ZZ8BxLfh3Dq9FwsnhLz6vXXf8IToIJfVoZru32+aJqnJ5G8J3wKiZni?=
 =?us-ascii?Q?bEtg1tvkOgO28akHvC20ijfVGp2tgJobScHIPt93eFOylbp1JRZhk7Pd0E8J?=
 =?us-ascii?Q?HLIF8lPGc8mahZEKCwz8XZrlkuumPtj1oXOyJI8YMkTOi5OTay3sbCdAIaTy?=
 =?us-ascii?Q?MPDOZEa4ramWn0wigrvNQvKTckZboF7vQ34q3pn9QzCrhCUUi2GmAZwp/EGt?=
 =?us-ascii?Q?10lXjuWIjnXSt2Vqxqo+w6niTS7SAPB9rGOUY9/AZv7cZ1J4i7rgSE2mJe5J?=
 =?us-ascii?Q?ZqTR/MrkJOWEy2TxkmPkCixpr9HTLIQLW+g3DUZDQ8hW8hXlBv1WI6VO2Lz+?=
 =?us-ascii?Q?JPRC59QNgJBnYss29Yko4PNLGj3wNLsKz8PxWnH0YXsmqE/MSuk0embwi8Yz?=
 =?us-ascii?Q?U43urLYENly35gp3ScjQG+pioFsgILyZRbZgaHh4D5K0Ey0Lg8cTfysRDHGu?=
 =?us-ascii?Q?Tfl3IHXVKk649yyLuNDUYNLj+UnCs+TbeTgR2IaM02yzeNLjteuxhBkTfO8N?=
 =?us-ascii?Q?xM0MkvVLCm1PHHScaFujt14za0KNBg09xtwvZMM1bZdklAMIGLvhfiN3zDWe?=
 =?us-ascii?Q?lRP0+4BorKkTVtWWo550JTrslYsrSym8EZCsuoaAgUSAqu+ROWCvNcTFdI4u?=
 =?us-ascii?Q?Di2LnEfpbVPxF6Fn6CZK8Ipe+Dsy9Tl9vWnVPWMpw8mAPCYpG6VuaFBD6CTK?=
 =?us-ascii?Q?kCMPScK/GZ4R7mzn42ti5jhTLhh1ZNQbpXy8oqxNlieYOIMz/RnNyuEftGiO?=
 =?us-ascii?Q?vxyR39ckp77a4YBv9n8Cd/tHT1Euho+8DFj/G/6Xk7GaMY92BRMwqi+kwpib?=
 =?us-ascii?Q?OcxiI516Ag5M7agmbKRTFiquAqT8Fv7FpIOphuZIHsdwkMGXIgVx+WWfWMb3?=
 =?us-ascii?Q?mTKhA6BMfbdTQjBysj8VO7AgTZGeanDcmPov6iEK5rHC3sAwP+Bi93Y34+ag?=
 =?us-ascii?Q?NqLbvF1OOL0AwDQMYtEf29nL50Hd//bpuOoK6o555AvN3zZCmmtDZDBz9WbC?=
 =?us-ascii?Q?2P7SQbRMijS9R1X1u8lfCVr00HGm603gaUm31sXA3GXQ4rspf+4zN/afx6fd?=
 =?us-ascii?Q?kQpljd55pVAolIWwoDNtn1zqIS7Jkv9t8X9LLdpOt5A466aB9k3ri+3vhU3y?=
 =?us-ascii?Q?2C74HD+u78cTZoXZ3fVWpCIcFpE7tYBcl7C55LL2YYl0hR+9QL3XzeWqkGMD?=
 =?us-ascii?Q?rxUKC8GgrauZU21bOBRIQGUJlDaqrKITdb4DJuVlN5GbXMSP2SfYaFVfg17t?=
 =?us-ascii?Q?SFhNeLe3w9cH9kZsWjnw0NNYSIwFRwzaZhVBo3u77HKaGaZhqb7QUwjr9GEs?=
 =?us-ascii?Q?HOAopyIozvH1LvqBWU2TYc4J8AASGEIy/5u4OQjALcieRUddWK+szjtDHr4T?=
 =?us-ascii?Q?eKoAyERm4qjSRT0rrYBlEqyAB56K0rSQ+5E3C/Ch7c3nTmuUo7GBisgZlDlp?=
 =?us-ascii?Q?YpAJWERkHxgiiOYgcv5Q1rlnRqa1O1mB8w1ZylCyyfMMKYauOn7/f257YkJQ?=
 =?us-ascii?Q?NIifIUFN8lSyVx8wPDqZfGTQPKNx2ciApulsSrjLCWEy93scl1ImQJ2Po3KE?=
 =?us-ascii?Q?Lb7Yva2h2hcUqNwd/FCghjEESkHMXt4FRgUDAccFSFX599jY/h9rJdwxe9yN?=
 =?us-ascii?Q?jdwiEQL3FasZXPrqHF/AyKYIkZSQWUhd59WdM1hRrqH7te2lEUIGH7DwW0C2?=
 =?us-ascii?Q?MT/YYw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0057b3b0-1db6-4f87-b443-08def172ecd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 15:21:43.4296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1567
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.com; s=boeing-s1912; t=1785770562;
 bh=LpPyN99C0lPgpsu0BpIs+IciV9KlR49zA6/1I0Pp9qU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=pUTo3DKKhyeOJDL3R+5tekqvdRG0uGLrswVUSw+HFg8PtGX6/ZOvephY00mjEw8Qb
 w5VYhbv26prCycxDx3/JMzpTneisi03WpH6X3jJOjXspdX1yel2vjzW+Yt051F0z1Y
 2PXIhMoWnyi96dYe9Notggi9bhcnVlTGnjiw1O1m7S3vRFHWE3EaxF6I1WLi98gzkk
 EO16ghMri/P+4vUNgKF5Nw4yMQsMKA+uZFYX0exEOQH9P7xPim1mj2f0ZeFeS3f4OS
 S2rSN/JzQvwCWC4+CnRvFzJrkcGcQdMn1hcx2szkXOBGSn7VFm03u1FhsVzmBhT6SK
 JLaP6uejgc2+A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpPyN99C0lPgpsu0BpIs+IciV9KlR49zA6/1I0Pp9qU=;
 b=UnxTXJ23XhVDR7VvqJw2i0sWnLAy94yDs7qPkTy0/mUxX84Yma17Ulp2GS3BLZBijMnaSiEvjxEvYhbCF4A9ExPlGg8zvtjJSRDVVKq6kq6wBn0QaqwUMLKZvjHp15YldUkU93+jIVNoiunw9op7Y5TgC9ZEZJSpSZbs+zNAGZo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=boeing.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=boeing.com header.i=@boeing.com
 header.a=rsa-sha256 header.s=boeing-s1912 header.b=pUTo3DKK; 
 dkim=pass (1024-bit key,
 unprotected) header.d=boeing.onmicrosoft.com header.i=@boeing.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-boeing-onmicrosoft-com
 header.b=UnxTXJ23
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
Subject: Re: [Buildroot] [EXTERNAL] [PATCH v4 2/4] package/xen: add custom
 version support
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

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Neal Frager via buildroot
> Sent: Monday, August 3, 2026 9:52 AM
> To: buildroot@buildroot.org
> Cc: alistair@alistair23.me; stefano.stabellini@amd.com; ibai.erkiaga-elorza@amd.com; luca.ceresoli@bootlin.com; micheal.saleab@amd.com; yann.morin@orange.com; Weber (US), Matthew L <matthew.l.weber3@boeing.com>; Matthew Weber <mathew.l.weber3@boeing.com>; brandon.maier@collins.com; john.ernberg@actia.se; Wood (US), Brian J <brian.j.wood2@boeing.com>; ju.o@free.fr; stewart.hildebrand@amd.com; thomas.petazzoni@bootlin.com; romain.naour@smile.fr; michal.simek@amd.com; romain.naour@gmail.com; Neal Frager <neal.frager@amd.com>
> Subject: [EXTERNAL] [Buildroot] [PATCH v4 2/4] package/xen: add custom version support
>
>  EXT email: be mindful of links/attachments.
>
>
>
>  Add the ability to configure specific Xen versions while leaving the default version unchanged to avoid breaking any builds already using Xen 4.21.1.

I think there is an edge case that if the user's custom tarball or GIT repo selects XEN_TOOLS and contains the qemu-xen folder with a cached set of files those won't be used.  We currently unconditionally do the following in xen.mk.

define XEN_INSTALL_QEMU_XEN_SRC
	rm -rf $(@D)/tools/qemu-xen
	cp -a $(QEMU_XEN_DIR) $(@D)/tools/qemu-xen
endef

I don't think this edge case is worth considering at this point and if someone runs into it, they could add a new check for existence of that folder and fail out.  Or determine a better option.

Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
