Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEE5C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80A4C605ED;
	Mon,  3 Aug 2026 17:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMRGev_TSkCK; Mon,  3 Aug 2026 17:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65EE1605FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785776774;
	bh=RnmHrLhsUwwYKaiRsrl+akAV+G1A3fbRgpWSkMSfitY=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pHdUimmDhRuolfcZcaIOYejx25kY/fxRJjM6CkFKEWljs+mGf2aEDLLBugZ5jIPja
	 IqpPCipod2PosqpDBkGK1IVas8QF85FCgbLH5Rx1WQzQwM8QqlXS/szXFxxzF3b7l/
	 Gp5Rl+v++9HYw0tT7bt0PJamy5kHHd1z5cqCoUGoG/SfyYTtB2U1SeNN1LkPFp387m
	 56tdH+qVq06YGTEjSKyBNh704VJrwH17bxLu6NLgUgrbA0wKSqAl+VdkZq7sP43ia0
	 vJmqH0xoXWPSDy5ZY7VEAG8BEvQcldEXKiv+uEZB+TcJqj88Csq2KINXIgRnLLcbFj
	 rz5Urp+ZAvQyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65EE1605FF;
	Mon,  3 Aug 2026 17:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 569B9218
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 17:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 483E340525
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 17:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQhZatxDw_b6 for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 17:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.76.20.194;
 helo=ewa-mbsout-01.mbs.boeing.net; envelope-from=matthew.l.weber3@boeing.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C18B540523
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C18B540523
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net
 [130.76.20.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C18B540523
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 17:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 673H64I4060627; Mon, 3 Aug 2026 10:06:10 -0700
Received: from XCH19-01-05.nos.boeing.com (xch19-01-05.nos.boeing.com
 [137.137.111.106])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 673Gr2PK039443
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Aug 2026 09:53:02 -0700
Received: from XCH19-03-02.nos.boeing.com (137.137.111.41) by
 XCH19-01-05.nos.boeing.com (137.137.111.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 3 Aug 2026 09:53:01 -0700
Received: from XCH19-01-05.nos.boeing.com (137.137.111.106) by
 XCH19-03-02.nos.boeing.com (137.137.111.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 09:53:00 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH19-01-05.nos.boeing.com (137.137.111.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 3 Aug 2026 09:53:00 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.180)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 3 Aug
 2026 09:52:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Fpc2DmR8DqA4Dec6vWHmo7Dr6j5hmSP1IlkWrbPdvGLRSyWuMeeyfiD6D6M0QLkOQIOUDTS4z79uOHCkj4jQLoddNtl2rPbyBU1U07y74qXninT3mU/61Ff3Ipoxl8VJElxhZ0QEFSxYZirywz2yn31BzKT2NEWaNJGTsyWbNpGel6WvmutI3884vycx9KbaHL6k1fEuem66PBw+/uzbo5vluodfz+qQpyd+0g9go1JQk15pQEky6QlTEo/wkWhtd+3ESH2B2XveCUk03OcaHTRDakMURBGaB3W8n5zRR4yyobWWrqxBuEYgZNsNKIfFv+VFP1Ku9F6OxhOQW2qe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOpMk2ukOCnIn1dM+GvCGhsZ12BglXcKRpPNAyqKe+I=;
 b=Op0XB+OYEpHJhsNjcGGP9dm+UYRU7O5M1CfxcNTvQRVEYelpX3+ZPVgCxo/3NSYBURazsoteRAaqtQ0HfUtUkIYlLKXlDREHzMJwOMcU6VBMdwQ8sC1+iPT9KGVH0AfdE0bpLaHbJYYrSOwryYAlgA7uhLSoclVh9b61bnwJy04cisuC7OzXrpCN9gXnAYpx3g1dxk5u4HviXWUL4D79Nv/p6V3OYHv+KJi5qihifU/u024WhRmNEz+Ycdq2Bh1PM/SwkSBXIuPz9dsOKWP6eW0UocnZ7EPxnsoaUM7Cwx651B6cihvy+BemFF8582H1Zxmnn4SFC8MhTfDvbAKmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by SA1P110MB1103.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.21; Mon, 3 Aug
 2026 16:52:38 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932%5]) with mapi id 15.21.0223.017; Mon, 3 Aug 2026
 16:52:38 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "john.ernberg@actia.se" <john.ernberg@actia.se>,
 "Wood (US), Brian J" <brian.j.wood2@boeing.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [EXTERNAL] [Buildroot] [PATCH v4 2/4] package/xen: add custom
 version support
Thread-Index: AQHdI1fJ1szT+W3zQkGYxTM2N9xM/LaMbzuQgAAGiICAAAEkcA==
Date: Mon, 3 Aug 2026 16:52:38 +0000
Message-ID: <BN0P110MB20675C051ADEB0B8646C8628F3D5A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <20260803145152.102135-1-neal.frager@amd.com>
 <20260803145152.102135-2-neal.frager@amd.com>
 <BN0P110MB20672AF5339439D6D7AD3013F3D5A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
 <BL1PR12MB5032D537E06564043D25A16DF0D52@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5032D537E06564043D25A16DF0D52@BL1PR12MB5032.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=true;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-03T15:26:36.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|SA1P110MB1103:EE_
x-ms-office365-filtering-correlation-id: a75cbd91-771a-40b7-d919-08def17fa062
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|7416014|13003099007|38070700021|6133799003|4143699003|56012099006|10067099003|22082099003|18002099003|41080700001|15866825006;
x-microsoft-antispam-message-info: AounTdFI3Kp8Qnwcn0DTMNS6EYvcgT3ibClTd4azP9GnNcAGqVFQjFgoIJaFtHOhDaVrOVekdZxp7VH4hldaEN3WRrG9aGd1F5qCCctUqgx/CpgZfsemtY2N05cQ3fRBBRIf9tw/WB5N+2c45RrtvC9hoMnczNT3q6axzZ5Cp9bA4Tmn609QEEnWqxep+zMO1FsFxfSlCPmf+F+0Pmsb65LYli8maX5ieyqeAlLk+PsDavWxFAmQ178Xm7PxRWE+C2W4QSedLKycsGf8sOEE3XwYrDuqLzevmcuLQkqeR4miDAXE3TDrQJ1/lkLWAd+yLLnLvamhHlsDth2dBI31BujcuuiKfIYsvekI9ifLozJe2qCllRfJwkLsoDBbgUSwi4ypVZKlSlAckGltLOsCzKRsFyCm7aj93og3RnqulRufSG1p2rCQWYZc7h70KzbaDVKTH1IdktE2v8hfF3Jo1C72e4D0hFSJlHe0HJO4APoFF0+ms9nwurvYKo3PKGRR7DblFKdkpbETMi+Em9QF0MpXLc5aHY8FhI0sq6ZOKX8r7lQqHdjZnGzLmc+2w0zEPlKuuJJasm6pFtHkb6LB+3LTptltbOzfH6uryfd1/dc1TUXw+Vd2ns7nB2qNSgpUKNBGDmHYwwkeVdyu8fbSpm7pOh4CXw0Dpkl66pWs7QvV/Y4Y+BZq83mR66lvp2BF7dF6NMllzR3cB1ivYCvoUV6ny3tytXB676s08Dc+MIo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(13003099007)(38070700021)(6133799003)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Zk/bP4+OW+aqGSB3pidtCpC59hFR/DppiMJJ0JQebBanPIR01vDah7li89x?=
 =?us-ascii?Q?nsIqLFg1o1V0YeOm9y6LtOglEV85xwFKXANmIKpsmKutZd7lD/v1nr4AnOqC?=
 =?us-ascii?Q?szfyP/oLC5IDz6XujlywMzko2Ojcnrv1kQ572Zjqd/pz2SHb4pmsq6LzY5+D?=
 =?us-ascii?Q?mQsrg55lvFzTy25Abky40avW+clG1lUGzznFQkvCVUluoMWJZMvuyydOSV+A?=
 =?us-ascii?Q?QB2kLqkTSNlVlynGPXqGr80hXIXhaZ0Gwwwo0cbl8j67iidQYGrLoR7wKH8Y?=
 =?us-ascii?Q?u22d5Z3oYay6a6YiLRTMllUi0fm8q18NtIRHlCHmXJBEiyNcV9DAzUbPZCT9?=
 =?us-ascii?Q?V6ogNC2DBWl7s90EiectxQW3smP8RHE/E/zTxSdpDJeG3yhVC1GfMGHqThul?=
 =?us-ascii?Q?u+KUfA7Oha2SBVpxWVoknVKtZ3CB/a5ScjEcgCFGcdBk7u64HyrLWqajD0pW?=
 =?us-ascii?Q?P9E0dWwz8QYz4yFG5pfPAbg6UI/9tG0RFjhDLXCvVzgBephu0e0eThAhmv2l?=
 =?us-ascii?Q?rr4FKMFx05mAZrkBA320XB0g+oYR0a1i0BN7HvF4dF04PpgfrdMe57fitq2V?=
 =?us-ascii?Q?/0ewotcmofJc07i3QceOWSY6rWTjcSmYPMPo0Xz35Kx2ZKDz6hduAs1tqhpe?=
 =?us-ascii?Q?QG0s/hoQp8sAfatjJIFSu8ziUwNwr1R59mBzU2C2URu8ipPO4sVYH80xN/iQ?=
 =?us-ascii?Q?OH81Prn+5+EGR/Z9eoIE+HuF5wQU+EquQOJEyr6fep8TSclj4iY7SEzetdeN?=
 =?us-ascii?Q?Mcyhxm5dczlcMDGF4m7jUGT/e4G0eQiGEQOMUGw4Y205zxLv8yfhyZIGskY1?=
 =?us-ascii?Q?NGuhrArslvPLqqYFxN9qVn+dhfV5SJlY9Hg2OWpM+xF5QHehDmHvQ1QaM5S4?=
 =?us-ascii?Q?g2ndFLaAwJJNu66mf80UkILe4ek4xLJrmm6aMqmfk9qW00e5WVKpNqRIPtsL?=
 =?us-ascii?Q?O7pn4yIhi6WvCoRhjFtJpi2nn0ntz3Cw3xzN+CgN2GMwxCXtGUoSiVBjm7cm?=
 =?us-ascii?Q?HmPzK/em/N3BZ6SVFO7KqiHX/pB5kc3EqC1O3adgGfSdDzh6ZtUqdbeZG3C8?=
 =?us-ascii?Q?bgvClcJ8n8c0f5N02CE2YZY+r8qnbn2iy237tLg79+W9a4izi8NyjbvQZ2be?=
 =?us-ascii?Q?JPaQhvFoKoWQPg429A3x7TywhEq7tx2bnUjvbYWJnukO9c/78RUmIu5KDXQb?=
 =?us-ascii?Q?NurrDoRQbQLgQ9sUeDfWR4At5TYaT/xMnVuXwEOiCoAP7VOIu/FYSnb8cooK?=
 =?us-ascii?Q?9naH+8rrBTeiEd86IJ4u7t/lpeudS7tY6IdPtPcS8+Cuwci3yBj/gi6CQORn?=
 =?us-ascii?Q?20ofJ0itGXYAAsvRVE10NmBd3lJhWuVgNjKXWOvJ4AXi3bBDyp6m3N5/ekjZ?=
 =?us-ascii?Q?SWhovdJBh3ukNt8kcJGFP8ocxd3MLAJVKXyyNKHTHG6pvYrn2oXQPL0MgFPs?=
 =?us-ascii?Q?NdUWrKwxU9WnjQROD7hwhyHiwvfw0s43vYFe3F8TNGiHjGu+gad/l30xGPlP?=
 =?us-ascii?Q?8odWbzV7ke+ndTNlElCh8ds39dB2eQRdWYPRgi4wgkAgkMEdM5CStIzukuEu?=
 =?us-ascii?Q?JKQIhtaANV4eoDGutLollXECFo9IvbXQNwHgVQCOTzsCxqY21Wwdwt7WyVoE?=
 =?us-ascii?Q?kiSYoKyi/mt3aWhdPhSZWF0jE2UGBhmByF27WnHoI1yQ4bsHHnh9UCF51+yb?=
 =?us-ascii?Q?gjxweg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a75cbd91-771a-40b7-d919-08def17fa062
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 16:52:38.6620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1103
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.com; s=boeing-s1912; t=1785776770;
 bh=oOpMk2ukOCnIn1dM+GvCGhsZ12BglXcKRpPNAyqKe+I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GUBOG9a7dJvp0J3+Vq6Sx6djLe0/UkQSzj6tHsmmxw27bSwftOFJza9djjIKqSARf
 dZyAn654rgd4EYamjdD80qfV2K6epOFqlCl1n3ZMhQn0rpTLb8iE69wOniDjsnwG13
 r47++K4habvwXrQh6Uq6dJ6ATtHc45kUkA6DCU4E0aASHNtPeCTV5/J6rLLA6av/J4
 bRwF1S3Mnvuc5mX/klCBmRGNZNyUxGZOc3FX//KG/LqmMOioRFvuCkhqf2irG8Cmdp
 iJtrwibLTf82o1A311AjqU4q2A/ezouSm+d0OCOSTjA5KTIiCkpv7L5LDGdzs50Jb9
 UnlZ+iipinT+A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOpMk2ukOCnIn1dM+GvCGhsZ12BglXcKRpPNAyqKe+I=;
 b=YbWi6IFsFETJHj3YSHVpUc6q+5pLUlUGodSf9Qm3wTo2q9pMPit90XjBzn7kOlqmhd5BknCavym3rE5zgnEUQWgLc2WDD04rmDHFGabu4IFqkOX0Bh4MESXUogx3S6zivDSZ/0/sc2ENa5mCmcPs6YSsu6wptLMiIvHiTZgefaA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=boeing.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=boeing.com header.i=@boeing.com
 header.a=rsa-sha256 header.s=boeing-s1912 header.b=GUBOG9a7; 
 dkim=pass (1024-bit key,
 unprotected) header.d=boeing.onmicrosoft.com header.i=@boeing.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-boeing-onmicrosoft-com
 header.b=YbWi6IFs
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
> From: Frager, Neal <neal.frager@amd.com> 
> Sent: Monday, August 3, 2026 10:39 AM
> To: Weber (US), Matthew L <matthew.l.weber3@boeing.com>; buildroot@buildroot.org
> Cc: alistair@alistair23.me; Stabellini, Stefano <stefano.stabellini@amd.com>; Erkiaga Elorza, Ibai <ibai.erkiaga-elorza@amd.com>; luca.ceresoli@bootlin.com; Saleab, Micheal <Micheal.Saleab@amd.com>; yann.morin@orange.com; Matthew Weber <mathew.l.weber3@boeing.com>; brandon.maier@collins.com; john.ernberg@actia.se; Wood (US), Brian J <brian.j.wood2@boeing.com>; ju.o@free.fr; Hildebrand, Stewart <Stewart.Hildebrand@amd.com>; thomas.petazzoni@bootlin.com; romain.naour@smile.fr; Simek, Michal <michal.simek@amd.com>; romain.naour@gmail.com
> Subject: RE: [EXTERNAL] [Buildroot] [PATCH v4 2/4] package/xen: add custom version support
>
> EXT email: be mindful of links/attachments.
>
>

[snip]

>
> I know this is just one test case, but the fact that the xen and qemu-xen repos are separated, it should mean that we can mix and match the versions between the two repos.  In other words, if someone builds xen with a cached qemu-xen, it will probably still build and work when the xen package wipes the cached qemu-xen version and replaces it with the buildroot qemu-xen package version.
>
> Before we overthink it and add code that might not be necessary, I propose we wait and see if a user ever does run into a case where replacing the cached qemu-xen version with the buildroot qemu-xen package version causes a problem.

Agree, I think it is OK as is until a specific case helps to clarify.  I did a test with https://downloads.xenproject.org/release/xen/4.20.0/xen-4.20.0.tar.gz and it built after I manually applied the existing 4.21 patches on top.  No issue with the newer QEMU used for the tools build.

BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="https://downloads.xenproject.org/release/xen/4.20.0/xen-4.20.0.tar.gz"
BR2_PACKAGE_XEN_VERSION="custom"
BR2_PACKAGE_XEN_HYPERVISOR=y
BR2_PACKAGE_XEN_TOOLS=y
BR2_PACKAGE_QEMU_XEN=y

Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
