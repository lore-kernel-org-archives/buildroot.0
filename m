Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3465C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E45060882;
	Wed,  7 Aug 2024 14:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMtZrSD_mIqN; Wed,  7 Aug 2024 14:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73FC46089B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73FC46089B;
	Wed,  7 Aug 2024 14:47:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 008BF1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E25B06089B
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lmcTgvxGaTS for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:47:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::612;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0CB560882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0CB560882
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::612])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0CB560882
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTegfMTL8eqM9qIVXjmiDreVwtIKTNnzrev+27z6iUzXwt10hsArlO4njI0nVF9xFjaQFguIUy9LBKH51zozOG/7pRRzL/n4a0GXOYKfG5zehrH7IG27K4UhMufKz1miaZfbrAfZFNZrh6kI+nziLiezdB4jQfev9bYoe8X5XE9wQcfogsF6wDCQtblvBkDMGrU8ONSse1sruB1GqbP+pegxgphyd6/MSPRvlbmh4AVDXcLeqJSzDMK5G3kbsJ3yxwS8hFGjbnsUb0BqZg1p1LtyRqinB+croma6K+k7wxdyBuQF5N5lNKoGlZH78Rg14kikmA7Smlp0anXIWS9WIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtCkv9WjdlBjoFZXt70p92vewOOYmUiVBpsBW2sTOjI=;
 b=wssg9lvIVZaO5cU2YIbId6yds5pC5Hjk0CWzl6mmCwRzDlxuc4uKK0VQGliofwcmdrzvM9uk4CcxHkfItvSMuXpow55NnbQ+SltAY2J8WYO3DLjLvVSOb4++rmlIhW6HAygcF1QS/wmWpMMgTPkqly7oNLoah2tRfjREx9AVB9Y9FDui+IY0o8fdRk/b6NYICsMq3J+SzfNlJJMjQ+RGNranhSWWG+XqvWfC1ql9Ey4WT4EUuLcaA6aLXZzQ7pPqukOGXU3v0qcgilYAZungJDJJ+vI7ql0jTY26zyQ5gb3B6MMXqL8680A+n5DRdRtNau/+OrZQKGez0sDE6iBoDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 14:47:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 14:47:24 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add linux
 6.6.40 hash
Thread-Index: AQHa6Li55XsRTBDAbUymX+ME1mR6K7IbuDoAgAAhcgCAAAEVgIAAAFJAgAAEOuA=
Date: Wed, 7 Aug 2024 14:47:24 +0000
Message-ID: <CH2PR12MB500458D35DEF07C58D703FFFF0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
 <20240807142506.45de55d8@windsurf>
 <CH2PR12MB5004D0D6722981F95A9C6D17F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240807162841.52d0481d@windsurf>
 <CH2PR12MB50042ED67EA2441FE635D585F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB50042ED67EA2441FE635D585F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|IA1PR12MB6308:EE_
x-ms-office365-filtering-correlation-id: 6bbc34b0-9c79-4ce6-6ed4-08dcb6efd9cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lH4wFgmAoR1w1Dzb0mn9rLnzzrEhUC95Uu++3zF+oBNF3JXIQonXhDPaJmgb?=
 =?us-ascii?Q?0RAE1rvU/t2XEwPuJPqhBotOTO6NoUqY9Jc0/rnpzkk8hLqAwYbwGl/TVM4l?=
 =?us-ascii?Q?JGtwmT43bLaR41ynCHxIl2tnHQpNZZYtatQDJxQd4ZDj/nDocUC22GLQ4no9?=
 =?us-ascii?Q?FQ8En8wUHruwWF75TlXYHo4sijseI49gfeh11RRXiRjStsI5RVVDluqqrNcL?=
 =?us-ascii?Q?hWFXnaBqopwINO4Jfn7BwdeHnEqreRZQFqHdZH+zDsXDywloCtknxlwGe1S+?=
 =?us-ascii?Q?Pgo7LwGJZmiyRWJMZmZXBSFnbPvFGqFFtffHFdQb0V0sCCw7yrDeE6CJJC1J?=
 =?us-ascii?Q?4n3FnjDHAOeehGDJLnOAR4diLpFYeJcASWmhHYIp9D/xGcFQbsDM8DqU8y23?=
 =?us-ascii?Q?rSxpzoBkc2LevCNBSqLc3xMr3/xsr56gP1+tfZqIhstl//4YaLOh14r1N/Tm?=
 =?us-ascii?Q?bqhxiYzqPWX+l+Mkc6UtR0pxdECl4CsPqmJovzutc2b4EhcukmPdrbbiUppu?=
 =?us-ascii?Q?QLbGOD7moIjyy0oUwnDrx1tP0UE8MK1poThmrkXsNr8p8ozFGjpB96Lo3PYu?=
 =?us-ascii?Q?NiEjuNAosaYA+XTbgEnjyAYllPnAmcynwrXliDhaiUDcfniqpbU2txjoTDvR?=
 =?us-ascii?Q?nZm35e1LxwrCPNv11ce29Ius0KN2v8+TRGPzWtcAM7JgBiriLrZYlyjC5Vxh?=
 =?us-ascii?Q?hYc97uFG3S2yTLgjVBdbg8nSDcpmR2i9UaY2U3VWWR3yAxUEpW/qiZCugsFs?=
 =?us-ascii?Q?Kj1bcUTg+RuUgRd5VCklG2RODhMn5P2nN5ec6YYBF8APq/dkHRd9L9TH7U27?=
 =?us-ascii?Q?X5V8CjfKV46XujAaWYrIIGbtatAHtvutMNa7w6/jpXyooIg0HBNgbsFLMg0P?=
 =?us-ascii?Q?nEg15xMPt9jBJS0N5E8Qb1oSaObYsYBlZV/eUccDQVUVGJ0FwRrVGwx6nmQH?=
 =?us-ascii?Q?laNbtjWu25GJWtgxcGNne3PEHZw518h9MmkX+/zAxeXoTNOLMljesb7wi73D?=
 =?us-ascii?Q?qE55ZoAmhHSoCphWffvoAoWzaKRodNNvnOAt9THoSLSqJ8dtuvmBgzFKmTBx?=
 =?us-ascii?Q?ezOf+0N5c52k3m1lKjtGLoCWBlt98MyGdrcHRRZTRPYFPtCSd3GKJHcAV7ao?=
 =?us-ascii?Q?hQfj5OOESY4ltN2yuXeSA5yXhcxue8WMUuLLwcaAjtooa7AoVf4wIJUua/Ov?=
 =?us-ascii?Q?4Nyq67tMEI8Pm8MpZK9UuVtVKLHBIUhxlyJqWk5tXGJR7ziME4NPiczr9DQ0?=
 =?us-ascii?Q?3jpuFmIpbkKi4OqQ+f92YGLdAA2UGMVX6RilPiR6yB01FSnMPk9qeXxf2Pzh?=
 =?us-ascii?Q?kj5LUJStF3qoqmW8pNxktcSB8gUPE6uYm2XkiDQ5MzaJBZ4a3BSD5oDU61yI?=
 =?us-ascii?Q?JelaxgvTkkjSBqKGtuJVhulzqzsusdNglN42DO1nD+MrTwB3jNTY8G+l5jS9?=
 =?us-ascii?Q?a3FvW1d9Y7g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d/P+FVAyIclCicsOvvAlNTonOaNljLEqu0lffkpD97VXTmnBmwRCnw/B/hFy?=
 =?us-ascii?Q?sdgPP+uxCAwdH95vAQCOsJWhCgqbNYPSWKsmbg/nGFG499ZLJnbGlOPjoHAl?=
 =?us-ascii?Q?0PDm3z9ht+k9rr/uKLlfFUAEFZy3UpeRX43npXptPddXEd71E2laVupCUKo9?=
 =?us-ascii?Q?8XHl2tSECSCDkPPxvp32XBeH8TBhpe9DP5JKQB1VM/mnV0FXQOC2VMpL9pFy?=
 =?us-ascii?Q?ytSAbr3kc3VrHcMSbhebnZNV8G6g4fwR+vs6exFa6wlnNHYuqeXNxGKQhdcX?=
 =?us-ascii?Q?mvZojkl+fTZjWH4Q6N41zvCITuNZrO6GkwfeWhfgqNurJdx2weaaQ4feYgIh?=
 =?us-ascii?Q?h1z/jj8z1KVM6n3nYP9TxQGfinKoezhsF3w7E288JwkNxOmEBOTY5LE8mI/b?=
 =?us-ascii?Q?LpQvyE9Q+nkdd17EHwGbNCgIxgbnV/mMy7mVVRThLao56WFIsWcRKZI+SeNw?=
 =?us-ascii?Q?SYblZ3161AMBTjql5hk8T2YjjlgyHGhxU5ZzlPfVKu7SFjGciQ+0IDbNGGmu?=
 =?us-ascii?Q?acmnjpuXiDe92BfqGNLkqQG67cMQdpZ78b2TICQpz8wn++ncnNiRk1Wo1yy4?=
 =?us-ascii?Q?jv0PWqFv0hTY6ogSgtUA+5Bym0H4tbqV9M2mEp4pC9VDXI7fELogBue4s1C8?=
 =?us-ascii?Q?dWLeGG+PL6wYrGEtV0hXZno/EanA3V9rBNws6K24AGoObMhrRFdasVqLB/lW?=
 =?us-ascii?Q?Yc+SXxRlEriyYcR0zX3Zjh+r83HcGp7w8mHCnLRvyLF4wzi2MhXF5hj229vI?=
 =?us-ascii?Q?sL2QVnYoh95de+P1iy1uHRx2MqXuZ1Ol0wA+fobo3teIigNm6cCOzOHk7HSX?=
 =?us-ascii?Q?mMWkZENB+4LN6yVALWdz7GeTB98h4n/jstPAQPVQA6IuONFBs8+4E0XOQAd7?=
 =?us-ascii?Q?l4O63F1SAEBLdTQ+MuxF/8Y+jV+kmDFTZciS6c3upvXOaqaVtvP5DFb3lkav?=
 =?us-ascii?Q?guU6JYXUr2qAaPZ//BRo12X3kfHyPWojWF2ilmbgPIAR+0r3eayIzT4KUHtT?=
 =?us-ascii?Q?lNyJ29XJC4AwA32Nr/NKyrooq5YfUOPuUWRhyBvPLESP8C41jXuGo6/4mMlE?=
 =?us-ascii?Q?DhxPOR5lC5u79C1yacmp+URQnOTWhMltV1H4zhLU+tglRhusG/EaWjN+Fwt/?=
 =?us-ascii?Q?RPg4IyLYPf7f2rHL1OcF/8AyGrl+MH/yG4V2ghEUh5JnEYu6+siWt0PJodFF?=
 =?us-ascii?Q?/8VT9uTP2KxZ8UQH+Fos0VCKK3L/cdWA157baL7X8VaxXz4JChwUl9WYxUe+?=
 =?us-ascii?Q?eLIoq1+D9EX6u9H7PXYnBwdLcdInUasw10wGqW5A5aj8Nx+25OqrPOh9oA+w?=
 =?us-ascii?Q?CHNJEByrxm5lhB8OJNyxnnjTdUyc6bLh62Phi1hbM0P2tO6Y1TNXnguxisra?=
 =?us-ascii?Q?b/AtATeKW3LrcPCRS85NMDZpjB6dtU3hMUTT0SgNC4o8zy2z2ZQo/xyHW/9h?=
 =?us-ascii?Q?10sF0gosfRyBKC1CeFD8E6gCLmDZOVxAl7MPRZ0nKsjeDMpoMYBwGO33tvgP?=
 =?us-ascii?Q?+VXYiQA5WkgfsVXRNkIDmYnE4xsY0YzOKONpvVjX8g3OqIgS84LgoiXxjpxR?=
 =?us-ascii?Q?QKhhVmN4f2vUx8HM0kA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbc34b0-9c79-4ce6-6ed4-08dcb6efd9cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 14:47:24.7214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XIgYUDKN2W0MkH/1VdjTwazL+x1CMbwcAGs/vcmCLlaBfbJX7IdfO+xuL3hfNeY2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtCkv9WjdlBjoFZXt70p92vewOOYmUiVBpsBW2sTOjI=;
 b=zJchamXfsWzzqdSU6VBhIZ6o004r3VPwOkQqOhVzhNOSW5aqefHMZMAFtW+xt6G29cTytBsbBxKyJRXyTQmzsJ+8lJsKXgld2OQq9CdEkbRSsobU+7HCI7iYBCzef8t8+9dKlZ0wmsYasCIBnUf/SGVImW0pyR+DIhB1yJaZg+M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zJchamXf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add
 linux 6.6.40 hash
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,


> From my view, it is best to keep the shared hash files since there are now 12
> xilinx defconfigs using this and soon to be 13.
> 
> Since it only requires a single line change in the defconfig files, I will
> squash this into a single patch that updates all 12 defconfigs to Linux 6.6.40.

> But are you able to test that those 12 (soon 13) defconfigs all build
> and boot fine when doing such updates to all defconfigs at the same time?

> I have 10 of the 12 boards (11 of 13 when the versal_vek280 is added).

> I do not actually have a zynq_microzed or a zynq_zed board, but these are
> mature enough that I believe testing on the zynq_zc702 and zynq_zc706 should
> be sufficient for covering these boards.

> So far, I have tested the 6.6.40 release on the zynq_zc702 and zynq_zc706
> boards, which is why I only submitted the zynq defconfigs so far.  Now that I
> will squash all of them into one patch, I will go through zynqmp and versal
> testing as well.

> I will create the squashed patch, and then go through the build and run
> process on all the boards.  Once complete, I will submit the patch.  It will
> probably take me a couple days.

> Please note that outside of my testing, our software team has already tested
> this 6.6.40 release on all of the boards, so I am really just doing a sanity
> check.

> Please let me know if you have any further questions.

Also, in supporting Linux LTS, we plan to do release tags 10 tags at a time
in addition to the .1 and .2 releases we do each year.

So 6.6.40 then 6.6.50 then 6.6.60, etc.

We will only be doing it for the latest LTS.  Meaning just Linux 6.6 this year,
and Linux 6.(12 or 13?) next year.

We are also upstreaming our software as quickly as possible, but since we have
a large number of patches not yet mainline, this is our short term solution
for supporting Linux LTS until we can promote customers using the mainline
Linux kernel.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
