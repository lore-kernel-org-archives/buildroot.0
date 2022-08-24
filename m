Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90E1C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 06:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A6228148E;
	Wed, 24 Aug 2022 06:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A6228148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6uC77wpN4EJH; Wed, 24 Aug 2022 06:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F8818145D;
	Wed, 24 Aug 2022 06:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F8818145D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 688391BF2BE
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 06:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3862640347
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 06:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3862640347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kxAeU32iiaz for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 06:43:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF1B40342
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AF1B40342
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 06:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9rdr1iasxYY+1qq6zrnCK101bnLjTMAFEkOV78UI08PsacyuzLLf1fJYzeAtmBIQgWB6mSmsFSUlCABpMN7ijoJoJmi5dnesDzIZpbVqhraSIDP9svNLtGp4IKdrvN4CtJyg4MltnG3FFY4HLg8FD5DdhA1ed08PUtJa1vrPL2v2vQEZ15UKpany0+ni0IdMBSVmVJqSPjVHDeWSj2SQnU9LJlhJTJQZJdeJtlYinphbrsm2h33UFOqYQkTyP4SDh10FmgNqqZHkt2mRO/tuU6Re6mPtIwGXRyjlaENXVH44wZ3bExg2TIa9o5hJ7Yr4uNOTqk1V94jqSzbCGuBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXRuVAnknxn9c1PmfBHpLmGuJ41V1dmcKdGpcLPs9No=;
 b=YbkU1DRQIV9oEmOLQiVvi1ZebsZaV6pEJXzD9UyjJoJRSrd37ZxOrRdnjUN7MEz17o8GYd7gcSe2y/PEkMlbomPjR1/xy1BcAzR3aeLNt5ylwhAa9JUYecFSQmKuvvEjWnSSnn15N/QRETT2gORARDsYSbYMZGOeFG0n7kK7ND+ofmWkLYCleMGZDpnm4McBW+v78lST9gnvZWd19+GDBrAere7kiyAkonIEDqiwkJy0vkwW49G762nRswkMtkF3DihMPSZ61Rqatd7tz3CVIcmDq+yKci9vUcGvTmo2YU7kUoFttSXHgVqjLBrxHzwKnOqqBv8oREQ215Jjxr/JKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BL3PR12MB6427.namprd12.prod.outlook.com (2603:10b6:208:3b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Wed, 24 Aug
 2022 06:43:16 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3197:7841:2679:9aa1%8]) with mapi id 15.20.5546.021; Wed, 24 Aug 2022
 06:43:16 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
Thread-Index: AQHYs5Yt/VTzzNzFBUGC6DI8hhWoIa2352uAgAAnvqCAABytAIAChlAggAI5ogCAALJkAA==
Date: Wed, 24 Aug 2022 06:43:16 +0000
Message-ID: <CH2PR12MB5004A50492A20D03A9B4FAB8F0739@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220819063717.33591-1-neal.frager@xilinx.com>
 <20220820151243.GM2167049@scaer>
 <CH2PR12MB50042583296DCDC5716F5ACDF06F9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20220820191736.GQ2167049@scaer>
 <CH2PR12MB5004EBBE77F6DB8E7661A9A1F0719@CH2PR12MB5004.namprd12.prod.outlook.com>
 <47db36a5-f706-0751-c7bc-dd164d8c0071@mind.be>
In-Reply-To: <47db36a5-f706-0751-c7bc-dd164d8c0071@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c218a8c-f0bf-4b52-05a7-08da859becbb
x-ms-traffictypediagnostic: BL3PR12MB6427:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IkR1s8/zZQqnbbHs20div41KJhx0qqOyplBpDIZXX6Pin+it1PLOlIsJXnfeiD8ryToy7UU18BqMeo0HKtk0LYAKu+qIThG6qlrdBRAZ931F1o/xpL6wX/b4IpH4pb8PeXoUGuQEMWccl+WwoG2WLDy2k+laNm9Qpnn7QMU8yXlC8eLx3ERd53hIuO22KJMvqReF5LMm8IVU7DDBWCmZAmia0Lxc+33EhyI/4d5PRy7c6LGmGfb/lqOuo5Nv5fn0wMwe+QoJb7nelqbNj3Lz8EM8HQH6cYWliIus10mqrGJ5c3vzy98QZbJVT5McbzIvd5vPrp0oCq6VRuCJlASo+M44Tmb/NXJ7fyaNPRP0xsXfAbmF2NYpu17eL6n8XJSCILiDd7h5SXuQRa3RIHUFh/2tPnd04GSWEBBQKiyHkUExHsgdqWYpAi9BDkgeUN678sr1EwERf3JukEFYqbVcm2q4x8blHYPIespsYQadAE02h/PKqN8j3TQBqG9bAzHyYY7lBzXi9qsxT3wul8S63wQtK+CIu9qU6TWLL022gQYzzAUGLULFnvC5wJdQ1f0k6iGeql/8e2N7RqtgxMj1TV4EQS4dE+HE9pkZdTLYG+wJQPZLZcIqdvUcLqvBHXuVbNtgAabJl6Peb4pqN11Fl7318UcpeRD1ljrW+Z9Ilx7c8giL8imjgB7uKy0AGqBYhNOAR8kLEpUUTiboPC//jUNi8Dx9JSbRRGZdhtBHVloK1RADcUhBNM8HNPSry8f91ehVsWBX0w6nJBexLaK4MnXvOmtE3z5El/X1FmK/trkBjQmt30QU0ocedRr6Gg/kgGkscDM6rDdpwdCDXm0CGyygCpV6LvU9VqgoFPoIFK117NHwBgy+r8kqNisTqcA/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(66446008)(66556008)(64756008)(33656002)(38100700002)(66476007)(86362001)(8676002)(76116006)(66946007)(54906003)(4326008)(110136005)(122000001)(186003)(52536014)(83380400001)(9686003)(41300700001)(7696005)(38070700005)(71200400001)(478600001)(966005)(55016003)(316002)(5660300002)(2906002)(8936002)(6506007)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1libTB3SGxFMmFSN2hRVDlkZnkvQWdVdnZ6YWsyRHZOaU5qSkphazgreVdl?=
 =?utf-8?B?ZjBFdDBYVGZSbjUyN0JKMks1eVZCeXdCRE9NT3lMbHU2YXZUN2lVWWIwMndo?=
 =?utf-8?B?UHQ3TVlYZExWR2dKZjVsd2ZiUkhFMzBhVFFDR0lscXRVOFpEUXR0YmJITThV?=
 =?utf-8?B?a09GYjZKMWZjcm5EeU9zRXdOSkhhamJZazdDMmgwR1BDeTA5VERWTjRKTGJs?=
 =?utf-8?B?Sk91L2xuTFpzbGFsc1V5OEt0Y1VzTFBuMEg5cUUweXlzRHJFR29BcUdQUmky?=
 =?utf-8?B?NmdzWnpTZ3VQREJFeWI3eFJORHRTMFNBUGZPOGFaNGJ0aTRqOEdUK3pFRGo1?=
 =?utf-8?B?S1dhYzM0dnhkNklHY3Q2NFNYd1lRVDZQUjF5Z1ZZZURSUkxHUmhmVUxITmJL?=
 =?utf-8?B?YlZYZ2hPSWphL1B6QjM0dGwzcUovb1Joa2trYk9sVDNxNk1TTnJ2TmNJTjRI?=
 =?utf-8?B?NTgrRTUwazFndHMvRzFzcTcyMHhvSFpGdWlHd1B6K29oVDVqeC9SeXhvVjAx?=
 =?utf-8?B?M0xSdmFkRFVITlZSbkU5MTE1dm45a3RVTW1ScEZyamU0alV4ZHBMUjc1TzR2?=
 =?utf-8?B?QkRMcmFNWWdtTUFhZVZMOU51Ymc5OExhSjJXUTkvd3V2QWNVUUpudG1xQW1F?=
 =?utf-8?B?QXN2VWdtQStPNjcvaWMrVTlIUUcxY2tudmhQYVcrVm1VTzJUMExPclVZODVp?=
 =?utf-8?B?b1ZxVlFJdWRYcjZpYVozODdheCtTcjlWYWp3M2UwMXJITFBUNG5DSVZxbzVO?=
 =?utf-8?B?UnBBT1puS0RBOFBVQVc5WFJYOW1VbU1Cdkt3UFFFR21YZEZQMDQzR3NnWm1r?=
 =?utf-8?B?NTkxeGd3T0lrVDEyOTN5UzlJSElrSUdGTC9SNCtVSVh2a1lNOXRnQmptYTJP?=
 =?utf-8?B?K0UrSERpVmM5RkpUVVdwSEJQcW1GVkZqWWNLVHBIYTJxRzZTZ1JCTlg0aXRv?=
 =?utf-8?B?cnJtelMwOThvTGVBRzQyaHlqRk43dDFhOHdjYXZ0b2dWRDFoRkljQTUrL1V1?=
 =?utf-8?B?UVZnWXdxZUI2Q0lKWkhtVWpnQTVnZkZPNVZsd1pYSERGTDR4Y0U3VGZ3ZGdQ?=
 =?utf-8?B?cERnNklUb2xOQXl4Qys0UWF5N2ZaU090d3FNa0xiTFJpWmtmZUl2cncxd1Er?=
 =?utf-8?B?SWNGREdmSVdab3dHZnQxY1o3bWt4QkNhUzc2R042dUFwczc5bVhZeWxBME03?=
 =?utf-8?B?aVZaL3prMm5JdEdQaHBmaGVMZ2RaVjluTk14NkR2UGhSNjZHVTBkMFNEZmhT?=
 =?utf-8?B?c29PWHYvSkdFQi9WYXJzdHc3WENUMnZlZTEwVWJnR0FwWklUS0tDSTliUEhJ?=
 =?utf-8?B?MnJQRWRsTVFiQk8rN3ZtaUQzb3ZlaVZUTGZ0SlNoeGZUMmpFdnJka0dRajVV?=
 =?utf-8?B?QndjZU5aSlMwUE1HMzg3V1hOSFBHMHpqRmMyZ2kvVk8wQVlkbmliWmNOaFhF?=
 =?utf-8?B?c0JlQkE2L0hrRTFpWGNpaUNES1FkNUwrcUtmY21nS2M5VGRQbTl1UmxqUmZN?=
 =?utf-8?B?b216cDhHTlo4bmtGUTJhSGF3R2o5WWRnRFdHak81U0l5UllIY2ZrYVIxRk1M?=
 =?utf-8?B?TmJ2TEpZRFZTRmZzeTA4UGtrKzJlOXo4VDc0djlKa0xRUEdzbm1iRnE1cjV5?=
 =?utf-8?B?bExzQlh1S2JsR3N0TnYyRmFlalB6NmYvNjRncDVQc0FWY210SmwxMUZ5ODBl?=
 =?utf-8?B?QWJIbDh1RHBzSHRULzRhNG52cEo1T29LMFJ6ZytnVjk3NTZaZ21oMldRNUla?=
 =?utf-8?B?UjZyS21FUDNza3BUbFdOQ2RzRG8wUzhTbk5wSXpzOWh2S3NZb1lJVzlUOVJu?=
 =?utf-8?B?K05JZDZkdzVVY3Q5TXhpQVZDdnBjY3NOUmhFVmJaNENybUkvYS9PeVJPRWp0?=
 =?utf-8?B?bVFXeUNMMGdyRVpQamovdlNBeUZ3b2E0TE1IN2tudENxcU04M1dEekFLSnNu?=
 =?utf-8?B?MWRJdlQ5djMvL0MrdUZ5dWpWTU10NUd5MWVJWVpBQjJNVW5QRjNCakhsektY?=
 =?utf-8?B?THVveC8za0s3K2JBSHc0SnZCWGNZcjhrVGxzUlhhdU1ENUx2a3lPR0FSVStq?=
 =?utf-8?B?aEp1Sml5bDBsdVN3M2F0bkVZcWpKNTBKSXF4QnB6eTA5L21RU3ArbVQvdDdS?=
 =?utf-8?B?akdmNEowZHNrY3V6Q2l2bkhWR3RiR0EwU2lsbE9lN1c4WWhwTThjV2dXUFJP?=
 =?utf-8?Q?s+6qAjkFOAiXKxcYZbxm7uM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c218a8c-f0bf-4b52-05a7-08da859becbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 06:43:16.3826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: woumet7cDp442pK4Op2+fKr7A/7Kp5k2wNycYAzwwAfnFeo79AbEcC1EXXXem9Ad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6427
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXRuVAnknxn9c1PmfBHpLmGuJ41V1dmcKdGpcLPs9No=;
 b=vv5bmdw9bAKZ3PokgyWmpzUm6WUZNkOOtKNOrG2Cq2js5HR/4Efziem+G67QIWeiy7eQXPMKbjyDSSnIGOlzI146Oqo+NTXsX37abfkKDOGqvjqM/wXCPxIVYjPjdtLMkN9zAuUlHIqHmnA3/qmY2mHl7KSTHre8ZaC9TVLJr9w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vv5bmdw9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> Hi Yann,
> 
> [snip]
>> The official default solution (aside from petalinux) is to clone the 
>> embeddedsw github location and build the plm.elf and psmfw.elf from 
>> that with a microblaze compiler.
>> And then use bootgen to generate a boot.bin.
>> While I can build u-boot and atf easily with buildroot, I do not have 
>> a clean solution for building the plm and psmfw images and generating 
>> the boot.bin.

>  I don't know what the license is of embeddedsw, but if it allows redistribution of binaries, it's actually fine to host those binaries in your own repository. Just make sure that the repository contains a README explaining the situation (including the steps needed to rebuild the binaries), and the license files of all the sources that are used.

You can find the licensing terms for the various files included with the Xilinx embeddedsw github below.

https://github.com/Xilinx/embeddedsw/blob/master/license.txt

Basically, redistribution is indeed allowed.  And all files needed to build the versal boot.bin either came from Xilinx/embeddedsw, u-boot or atf github repos.

>> Yeah, I can see it being quite cumbersome. But it is not unheard of in Buildroot already. For example, we have package/arm-gnu-toolchain/ that provides a pre-built armv7 toolchain, that is used to buid the boot/arm-trusted-firmware/ in certain conditions.
> 
>> So, it would be technically possible to package a microblaze compiler like we've done for arm-gnu-toolchain, and use it to build the plm.elf and psmfw.elf from "the embeddedsw".
> 
>> But that is a bit of a stretch to go. Unless...
> 
>> This is why I am looking for a short term solution of just 
>> downloading a prebuilt boot.bin.
>> At the moment, distribution of pre-built binaries requires the 
>> click-wrap downloading procedure which does not lend itself well for 
>> an automated buildroot download.
> 
>> Above, you seemed to imply you were looking internally to lift this click-wrap restriction. If that is not possible, and you can't have the pre-built blobs hosted in an official Xilinx location, then downloading the "embeddedsw" and building them would be a fallback.
> 
> I believe lifting the click-wrap restriction should be possible.  I am working on getting my github officially supported like the ubuntu-firmware github below.
> 
> https://github.com/Xilinx/ubuntu-firmware/
> 
> My goal is to create a github like the following including the LICENSE file with the release location:
> 
> https://github.com/Xilinx/buildroot-firmware/
> 
> There is zero difference in the firmware files I plan to release for buildroot and the ones AMD has released for ubuntu, so it should be possible.

>  If there is no difference, why can't you just use the ones from ubuntu-firmware?

>  Or does "zero difference" refer to how they are created, rather than the binaries themselves?

There is a difference, actually.  When I refer to "zero" difference, I meant that all the binaries on the ubuntu-firmware github were built using the same source repos as what I wish to distribute.

However, the actual files I wish to distribute are not the same.  The versal boot.bin and zynqmp pmufw.bin files are not on the ubuntu-firmware repo at the moment.

For now, the ubuntu-firmware is only covering zynqmp products and not versal.  And since it uses bootgen for generating the boot.bin images, they distribute files in .elf format instead of .bin.
So for each zynqmp target, there is a pmufw.elf.

I have created a repo mirroring the ubuntu-firmware repo which uses the exact same LICENSE file.  
All I am missing is adding build instructions to my README.md file, and I should meet the requirements you have laid out.

https://github.com/nealfrager/buildroot-firmware

For the zynqmp pmufw.bin files, the steps are quite simple.  Download the pmufw.elf from the ubuntu-firmware repo and run the following:

mb-objcopy -O binary pmufw.elf pmufw.bin

For the versal boot.bin, I need to add a bit more instructions.

In any case, AMD is working on a new firmware repository to include all of our firmware release needs.  I am part of this internal discussion, and my vision is to get all these binaries on the official AMD firmware repository.

My question to all of you is then this:

If I update the README.md to include the build instructions for the various files, would you like to use my current repository as a short term solution?

Or would you prefer to wait until I am able to get all of these binaries part of an official AMD firmware repository?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
