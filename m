Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36746D132B5
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 12:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EFF4033D;
	Mon,  4 Nov 2024 12:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ma42v2SKpEsq; Mon,  4 Nov 2024 12:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3253C403C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3253C403C4;
	Mon,  4 Nov 2024 12:42:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C91C723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 12:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49BF9403A2
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 12:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRscWTtnfu0A for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 12:42:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16B7A400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B7A400EA
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16B7A400EA
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 12:41:56 +0000 (UTC)
X-CSE-ConnectionGUID: znaewvlfRy6MYdvvV8f52g==
X-CSE-MsgGUID: eOowh6ieRXm6g8ffonHgsA==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 04 Nov 2024 13:41:52 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 1B8BEB5A88
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 13:41:52 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 263D2B5A86
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 13:41:49 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 4 Nov
 2024 13:41:48 +0100
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (104.47.30.108)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Mon, 4 Nov 2024 13:41:48 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oK+t87btqKowot5cYVzt1atBpM/X511j2GJfMB5Kty8HodXpDOLDnQwFr7yVssnhzjpnA67cr/84KmHJAIN5cokKnYeJjQg/UDYno/vKG9ARB1hsZDuLG0jp80i5+WQm7NyAHBkU7q+ENBxUNFEICMOcdd8nePxG5TA8T4RUjaZ2eNTf23t/O8eCE61zGL26dxLEEvsJuE4km2WM/P3KtCltJdi7y/vuBtHy9VhjjkrHmQj8FG2v30+PFSfGhIwmpenF/6Fed/ZCOqHKOvaYddpIwlypVmiA2K/qiaPLk6XNpH6wWkClzaEAOFxo0+0qn4P9ozPZIL5cSMCHDeFrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4S90SlE3eI/EEJtVRKFUTNJltABL9wiyjYkvrTXkY4=;
 b=fzw1mw3iGKU5rmckoZGe5bWuhMzBIAxp73ADqgivf8BNIYefQ/d7IcFQoMTlPTleixVwgWhnb+Pgvlf4cMPc0oNVzG6yVNHI2hBE3r2OTF3ZNELCM2z9n3ahACOEI4zFGuuW1aaeD45Au5ADB5RdDHQvEpPYKsB0l5OFjB1EHkCYHLoG9FbCxhnsC3CJbv5DIuWCYByCVubSf0HBcLx0WpdtYtmhRh2TiGX3hNAp/7FMQXlGeUwtXV4Nh+AgBrWZRtERSUS6hc8pNvz/TbZgfEpmU5HDGX5npq4OVDfvElD316f4ffmzjEEOtOzCGADk2eBBbb4mc4eUg+zRCCMOKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PR3P250MB0274.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:17d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:41:45 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%4]) with mapi id 15.20.8093.027; Mon, 4 Nov 2024
 12:41:45 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 1/2] package/libzenoh-c: bump to version 1.0.1
Thread-Index: AdsutqQ98yM0KoVKSR+PskWavTGm/w==
Date: Mon, 4 Nov 2024 12:41:44 +0000
Message-ID: <AS1P250MB06086CBB5E8C0ED17299DE82A9512@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PR3P250MB0274:EE_
x-ms-office365-filtering-correlation-id: 80649ddd-bbfb-416d-a979-08dcfcce0a91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nPdXrk9biiNujxGbR7F4kmw10VFqITyPFGml6DE1pMTBs+ZPPMNKLXAy23tE?=
 =?us-ascii?Q?7ph67490pOYo4cmW+br8APpdHASnmIMkePgCGLUAdygqB4DWR21U/OMAEwjL?=
 =?us-ascii?Q?RG5e23lMbq4ya0slmMTn5BGAYPJS+s5tDF5CQ8xGNfyMiEatqpWPCxy8zlnz?=
 =?us-ascii?Q?1WOGOAY6cjYg3SFktoAmkfQagvOoUmXtqbdwjQ7jlXV8+LTJyF8tJ1ZsMHJv?=
 =?us-ascii?Q?JBEEjjvlu52DrDHSf3v2w+cM5ei9jyGtoi3yfOEuXMZwfKI086Rj/kvGxAoB?=
 =?us-ascii?Q?w4teN1jXXBGxK/wb6sLpq2jlnMoKYyseG+KRie+I/wMNoV0rl4ktzel7Z3tM?=
 =?us-ascii?Q?FDRKvvWlXXIzyBC0I86YSjiG0gGt/sSMHS1Ap38s2Vuj7kr6QfZTnBlJW+mF?=
 =?us-ascii?Q?73LUw6yTU7bHKpC1cQfaze4PRMIdyIJKC9xKzF+IpKN9Q3r9SkIJAQ/JN38G?=
 =?us-ascii?Q?pDig9rXkO7KZG3Y1mPnVwGjtDSPMyuEup5lk1QLqczeqC3Eqj92ABzZ/1ENM?=
 =?us-ascii?Q?CQe9Czr7hemjG+bRWAZT72EZOpIbIpa56m6l7tHBYlRt59YR4R4OKKaU0Ob0?=
 =?us-ascii?Q?DnWNctsMdqdKbb5D4BQwoF1dJAncqH+5EP3ZK2m2/pj3+8nPIs6nnZKBbeM3?=
 =?us-ascii?Q?lkp1ZRdH4o2zjuxR1uVy+jOgD7XqI2Tc0ZQ5pkoqqq1pMvJ5vRsD7gEm+GsO?=
 =?us-ascii?Q?XWSPzxpuOsQmJFv8ez36cv116R5yL3s5p6gXPe1vdeY1S/fYwAk0usX0xHcU?=
 =?us-ascii?Q?agbNaSra+f4+Vc28nf+/jVQz8AELWHRhEmppK5m3s6gIws0bAMCfteMqkvqZ?=
 =?us-ascii?Q?SN/Qr+Iz1dcqVMZNrGbmIfx2lp6KC7SS+eiqBatmcxEjq/Sa2nC7nRo9DbkW?=
 =?us-ascii?Q?XIrDa+UHBYLDIfab9yPIY9/hUrXJd1IJwvmYwyzph0b+rhD/Ljw1FnKNMLs2?=
 =?us-ascii?Q?CmOSKh2ojGAcFXelQm29MB1KQMjBz9qh5K21/UGvjCG4eHrbhrMf29LjyxMq?=
 =?us-ascii?Q?WqvHyh9xzkMrm4Es9c8osR8ZTxXhWDj1Di05LGEk0W4Z9DZS6HqKJL3wBO8u?=
 =?us-ascii?Q?Uq2CXm5ifvhkszri+lfnws3te8gdm7vTFAsCh39omEUy1BPJKW1wPAP365ke?=
 =?us-ascii?Q?bLidm7X22aSX2JgIddpcNCWCL8i1w7J3+V3WVDekEZUTVgorAgcuXDqRgZRW?=
 =?us-ascii?Q?Uu90ECzRCReVweKI6R6/CDSiKyUy5nqritqkLJDpF+qSOabzUfJfyxCetfK4?=
 =?us-ascii?Q?muXJ1Jvb9CKBaTYOW60h4bx7qMy7fhieexhKxaAX9NNoipVxbLZxSd+CaSta?=
 =?us-ascii?Q?5eiFkQlQtJwRyIS8OMVHgBnH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6jvIfc7P0aee5kwzXVLxFF3waTk/qEMwds8C6baYoAniTGUtKIVxhietwuIb?=
 =?us-ascii?Q?EpecdY4Q+p+Xj2nBg6ACnFQfrgpAYVE9TWh2pUB6ZUKMSFqooIU9tVdDFjDI?=
 =?us-ascii?Q?IYuOaP0ju3ZeiW0CgAkfBIcoewBwKLVEcuoZQBUAPdJpV0RJWaROAVD2OSvd?=
 =?us-ascii?Q?oU/gOMpq+kynB4QdOy7S2Q+FGLVGT5uo+779ZGhIiLXWzoMBRC34DxBxdsg0?=
 =?us-ascii?Q?GjOeCBv2SxG/3R4PSNuLMwtAH0NUoTuPvMPrGQbNc0PYYclcqnagZFrLsJ5/?=
 =?us-ascii?Q?zGligiWQJgyGhyY7T+gMqmhxbDc3OEOB7w+isiN/X4hqPwCsZd0leAE45aZw?=
 =?us-ascii?Q?ad3uZ1jm6YVNM88GP/Z8unr6xfjzyyOfmQHWyoPG8KzgFnHcZxkvkcp5KVKj?=
 =?us-ascii?Q?xgEnSxh8wTa1HX+U/ZVFFpW3PbFzHtyPpLaBOAmn2sY3L7y9BvgR6EmTt3xs?=
 =?us-ascii?Q?z5UD90IuagWoIRqmqHDWUTwn2xbB1vCj7k1JwAzKk7QzP261qj4Ireccwpa4?=
 =?us-ascii?Q?PsNmrqCJvJRc9iSxUW1Hm5PZ+A6uvD7l5iJeW0BQimtUVw2+5NzoSh5MVXy0?=
 =?us-ascii?Q?BSk1aCN0TVrj/nVQQvdcwe2MnZPacoHxZf/xRSCAY896bDFVaHqYcrfpDGFt?=
 =?us-ascii?Q?YNnkytkFtYo04bWPvmbCsVPJw1+xMmRpo6YkN401y2eGWdLnxCAH9plHO3CZ?=
 =?us-ascii?Q?IR4+eYXstWLmZXpXjGbuLmOSbfPtaBVu4CTsfVyfXwv4xi4tb7ayp9he4kZG?=
 =?us-ascii?Q?luOAhbwAVgv+br4FTGGMcDZRp2KICGxMhyYxxb1pwONX2npRPWGmVVVUK8a6?=
 =?us-ascii?Q?xAJ7wogDPnokdbkbdA2et/ZygCobtOcT6Bj+neVEkQsvdVBUeJHhJCkygla7?=
 =?us-ascii?Q?DczbeB449ih5MIZUXuApG0maHzg0XsdYNz/8fysEARJ56g2RT8I/gVtWtA5s?=
 =?us-ascii?Q?5Flokx7UMjWPFiSqFcrW0GSuhOrxugN58gB4YCeRvSeGClQVP+Ix4yHgqEHt?=
 =?us-ascii?Q?EjTRsLRGVMrDVtC7i/kElNJMY6jNi0EsbdMVVjctHNQZ1uto7aFGW/cFj5QQ?=
 =?us-ascii?Q?q931BZfSi/vQd3Kad7zahGSZR6H07Log57HhkMMAIaGDD8CddwFoDQQATKIE?=
 =?us-ascii?Q?KJYA1e5UYfNSQ7+0uuCWRmOpVB3ORerF4UhobutSoGpG+WjbVNDziDhLNklG?=
 =?us-ascii?Q?0Agh0dcjfbLz+YO+g6YltZmmnXxwihJUnoaI05RPntiRUSpKcxczXqVrkZFi?=
 =?us-ascii?Q?qVXP8a7nn37gFKyWfKsg1jgsknqDgSBDp8uwu4NccIdfp9DtZ3Aedz8BTnlO?=
 =?us-ascii?Q?GNI0CddkPLnXnB7MHJ8KceEGD+D6bpyuyg4i3a38sWZtuDmI0N9Kb6mLIlqt?=
 =?us-ascii?Q?liUyx46DqAREb5kkHCviI+bjS5x+DBdnIg+aOnVvkqGU2zReSm/ZJa7lOzuM?=
 =?us-ascii?Q?hzpsfwQ2FrDc4lFDjf+V+OMCR6aJ+hbyOp9ufvWK73oZnsI94bXw3dG6UpD/?=
 =?us-ascii?Q?xFQwqVzashaCHvx0nzsRHHw1P5MxwfpIGe4L4lU5pqGZl14Kc4TQKW729kMm?=
 =?us-ascii?Q?6jk5ujALiXtViLcBL02LyEd0aN7iH7AEVPgrCz6N8z9Z2Papf98MLM3G5wbp?=
 =?us-ascii?Q?JQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +5ZKCaYs15Rx+6LJ6YczXAer6zRFazLNDSvh1+EfpvK31EghA/Z8pEaYg1eS06X0+s09IetrFX0VeTOfDIbmfiqA7eY6LqsmCWMdZBsNnMqnGCNxkh5I3wMUsP+UxvZwgnDZ+CaJeFUqzDShfyraffumdHqeNfw7fgjbmCubxoRQJZvK3sDf19iI6D9n+I76TGB1Ow+DJ/rT/WMvYAe3VAvU3Uo1hhV0RogqZ98l6sE+XiAdWgdodhSw2kXjiYNKNxny3n1Mfs8JM3DADmsVwZu3MVvXeP8ovkAYpzwhvk7LCemE3nkQIhDN2U0U80KzcyTP3wEIpgA6yy+pu+D9wILT51Qs9BQbvupOI3WQ3MP8wqdY4m89LeHOfqaDbc65NsvGCosxKclrx4hBu0Z0i/gV8Ax3MvimVfkU0HXCQdxm9r43+lgM7Fbp0ZQMRyOycUIpvuwdR8N7bVUfnK8vHAM8BD7uFii930oMl5tm05jAoN35ta8rA0wHSlFObRlpNLryQYLbI0MRwk7mFCZiaMcvQ/vPzSZQDS82qKhs5iUd0IkIElglpNk+m8cV3BzmOJUlq5jw5/dOKAYcyGTy/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80649ddd-bbfb-416d-a979-08dcfcce0a91
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 12:41:44.9966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KaOy8/hgR7vgGYrFpEk94gSiGFaPxVtLbvKElLVLfM9c2DMNfJpAGpcIUaW361SrG2+oXj66RV91cZLlfUO7f4xNHHTHN9s1XUafl31Iw6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0274
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4S90SlE3eI/EEJtVRKFUTNJltABL9wiyjYkvrTXkY4=;
 b=fwBqTCH0hKUGwJlV551l9mh1Z+sGSraNgALTIASDfdxuzHePUFcn6TW3pYChP4En09XOJc0dsz+CvAisO1dxpwfsbJ7lS2o6BY8XADp/aXt1h81do8ku/mtT7zR2hb+EZUWTerEykIE9EmUhXo2jiAUu4hrCQ+p8RrY5FyLmPiA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=fwBqTCH0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version 1.0.1
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

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.1

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 3472494355..124128736e 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80e3144ebd82bdbfb43ff10e7f22047826adbbe0d0ed0081b215924a6c1bdb6c  libzenoh-c-1.0.0-cargo2.tar.gz
+sha256  7765bc1bdbab608da4770db7624ec868ac3cdf7e63707d7aff406d85558bfc15  libzenoh-c-1.0.1-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index c474d98b07..4b3982525a 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -7,7 +7,7 @@
 # This 1.0.0 version is really newer than 1.0.0.12, so please don't
 # update 1.0.0 even if release-monitoring.org claims it's a newer
 # version.
-LIBZENOH_C_VERSION = 1.0.0
+LIBZENOH_C_VERSION = 1.0.1
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
