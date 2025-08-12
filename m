Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6CEC87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 06:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDAA41E77;
	Tue, 12 Aug 2025 06:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wUsQja2ed1H; Tue, 12 Aug 2025 06:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7BA541DF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7BA541DF3;
	Tue, 12 Aug 2025 06:10:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E5F2B8B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FDE941DF3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocVLLYuDzTlG for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 06:10:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::612;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0511841E67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0511841E67
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::612])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0511841E67
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqBYB1tgaI61pkBowkAAM7jbOWhyh/Wc6nP+R7Mp0adcawcJ/+g2zhC0S8IVlRxsdHDodg45KK2V0n3AJ9QHNdFNUIVhNQPXqZJeBroQVxLa115O9ovU99npeTwCMCTKFDsyC8LV+GeKLJjB9mJqZWZh3yWA88Ps0sNoVnRmV7oLXt9nu8N6aR3fO7iulcdXUbXu59ee5pQb6j9S/qDLJwBo6pYGrOOSShx1LuBCwaiJTjWNBHQbxJvVh15n74CL/QPTx6wGnzUhGihdIwRIaRTvVF0E8pxET6nbafzj4OO3e1dk6uPVPOH7/vcTSdR0w7gRn4YlOE5q9VNKFlHo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEXqSdAszF4v8hINguN8/XgqzA95XL3myR9E0UV0ZQY=;
 b=wkKS6t5Kl5COxN5mVYXt3qIIZxK2IfKVRyO940ZbtOsv6a/EQ0NAH1VFBns2IkrB4FUrtH1WCv+IOw9IzRF6mzm+Iql/jtEFY4uBa2QYgK+4K8Gttj2ZjLVfhg2tBuO2A1GpY8kWH7gqSwexzSlTpZ2ACgTKt1MdWLtfZ0nlnQhVI30ssOcDY2KHg+OZ0aou0ZnODVsQVwVPZ9OVtf0dIU874oMH1dGmP9G4XXnsjmrWAZzduYnU0dfqW0Q56gmLtmRetDeSVPxMjBukVU/FdAx6P9f5NIcNVCpSs+n2trd+bknwWAOIGhg6E7ximwnYQ65wvuUrZAz5XX5WaLUMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 06:10:06 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 06:10:06 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "ju.o@free.fr" <ju.o@free.fr>, 
 "peter@korsgaard.com" <peter@korsgaard.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "arnout@rnout.be" <arnout@rnout.be>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek, Michal"
 <michal.simek@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>, 
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH v2 1/1] boot/uboot: add support for custom zynq
 ps7_init_gpl.c
Thread-Index: AQHb4TBZIUS9BXeACECE0kC0T5l85LQdbV8AgEFvP9A=
Date: Tue, 12 Aug 2025 06:10:06 +0000
Message-ID: <SA1PR12MB561516875840EB0BCA111C27F02BA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250619153922.891360-1-neal.frager@amd.com>
 <20250701165316.2b030958@booty>
In-Reply-To: <20250701165316.2b030958@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-12T06:08:18.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MW4PR12MB6924:EE_
x-ms-office365-filtering-correlation-id: fccdadef-2328-456f-6654-08ddd966e253
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZeFX72mLNKMhiXADbmwsnh7z/nl9ULP7n3obM0Ai7vQ1We+Ajo1wI1avh+r3?=
 =?us-ascii?Q?ygEq8sCoV1/QIEYRglUIp4fIN9W9LsMsLqj3EBgmUyBpYc2DOhpaaKHrrgUl?=
 =?us-ascii?Q?1+5a5+zzO+ZMHpHd0OirRUrIdW5xQPmVfdGfFUr5iPmLvIhkq3mhxyr+29Z6?=
 =?us-ascii?Q?OyrhQI4Lr4awmCkC5vgscTsNUK56v5b/et+I8A6E9b2FUISTf6jOmVIKKsFJ?=
 =?us-ascii?Q?oOBEKkGsB0iPfQZB7F5nSNQbzbBe+M9BHTH/or5V6FXudq/aMtldBT+1z4Ov?=
 =?us-ascii?Q?Y8B4OUUtJkqoeYgaIul11gkYI0L4aVTDqqzfJZG1D9hOOprRxiB2fbURHlBV?=
 =?us-ascii?Q?Ayc4N7Wbbf4x2b+9d9reP4sNpSj7uYFqOK7QJHOfCbdEviJiNDM2/ZkkaWX4?=
 =?us-ascii?Q?yUlAHNAfmfLiNRWSEwk0/KJh1DSbM5G/UBCoXiDbHhJO/RuR0VvsKfJu4Kkw?=
 =?us-ascii?Q?oX3VZIgLxDkyCOQowgB1+Zcdd3RwgsxF1TFfPjqymF2nsUqCHOFQvNCpbehy?=
 =?us-ascii?Q?4O+r1ZKXvUo/Zj90PmO0pEBFrRjp48gkefqH7/Y0efRcFu7m7kyMkUU/4IPz?=
 =?us-ascii?Q?WiWF65STfwTM7AkrF8AleWAefKdBxfaE9MvKRI10k/xZgt/a7NGjeKcPH2Mw?=
 =?us-ascii?Q?yJJYpk53XeVR8Oqw6vwM+vdfln8unI5N89H3HO4BN8RZRHa8AgwjxdhaQc1u?=
 =?us-ascii?Q?gENp8ecAgf7dl6XjiOd7s+ZV+Pvxstma/uFbmASLHd+3M8NpEh1yB8tJhqsP?=
 =?us-ascii?Q?6dYBKaCdQ2Dh6RKCekESQ/NRKHNhzyUZq6ijYGdQWv5RLXpkvX/fw1jBSijW?=
 =?us-ascii?Q?l6HwaSmeOvlPp81+v4ZnoumABdNwdSWs/3tV8Wa8rgTmdxW/OXwqZar46xNf?=
 =?us-ascii?Q?jEtHOp35MCLrmfauVPe3mtxBB+WvB9znXCeZY1xFPMCBZiiq9Ws4kBP0ZQ5r?=
 =?us-ascii?Q?g7ipo2c8LU6OXru1+7gh7JWELZ7h6p3BiXxUWKa9EIYfs5f4Yv9r9eJ9ag/Z?=
 =?us-ascii?Q?vreE8Fk3Iormwwortimc7chg+9Be0/u881MhCN5bIzY+hYBrnh8rCRfLFirC?=
 =?us-ascii?Q?aHI14jBeoPjDp2XniYEFhgHBjTDy4jyFJLUKeFnecfq6+ucyaVnSRifyzIi8?=
 =?us-ascii?Q?n7vb/tCF6SwDPWdecxWAqaFbjCTZn9GH1KPIHStYJcmr+VoXaSrdpMtnzZ5m?=
 =?us-ascii?Q?FT5b0FFNqYjSJT/3Ze5JPrn7e0HqasIl/SScJ1GUu1wCVVuF6q0ovK9Y6zss?=
 =?us-ascii?Q?sLEDD27TxIPQXUJlBxA62nprCHcmE3CjCDcFecidG5/SKjdTzyyx16Rq2Vce?=
 =?us-ascii?Q?bpg17F7XtI8k+nUUZhittcKpgInBgNCJI2dWRp00UHl83PV4ffBWrDkgpfZ4?=
 =?us-ascii?Q?Q8dhMu0F4ZrSNza4ucETYsQrwYsLKAj2jl3vH1bl5HMGLEJo0sFlpJOIUDjg?=
 =?us-ascii?Q?yQoqlhU7v+od/IpHXT8ZLyz9TA/yxN62sbgAzpVCEfu765AyZyDNZw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MsEZfyOGJGlnJEDKna9lqB9v7LnpdBxELTpAEjT7euqIxLQOpJqh+jwKQYQm?=
 =?us-ascii?Q?Yu3Yc5KthPx230Vx399zEcKK1BnlFYWv0ks406w6O9lqFFvTk7WRSJrnzt1I?=
 =?us-ascii?Q?xz3eFkCMSSj23k+PM7h/P+Y6cEfKk6J+p8tojA84IuuE2Cf5C/4Mk0n2N/PS?=
 =?us-ascii?Q?iiQbcwyUSySr3eck6VcyV8I5hQKu7SMMOlxnxTJ29TyfKxzDwuEAUu0n1XCb?=
 =?us-ascii?Q?Mq/d4ODuRoWCx92JHP9036QsaNeKl2QnPMLhiYyid5Ep6YTiEJXvHYZEHohf?=
 =?us-ascii?Q?V9QU9Jd9lBXgKOqXscNFysyQ3ZJYTcIGpLgHe2tPm3ACTmSSoH8Me1i6jk14?=
 =?us-ascii?Q?bLHDT5wgCxIsxsOITYPajHni2DGNSdaF1lKc3pKOixqsoGAHPBWRhhZw5mOa?=
 =?us-ascii?Q?I8H8UfaEDgWWvfaCTc1T1bEkY9gCdGPHw6y3mjVLjmTsBJM9zERzePGR6qkH?=
 =?us-ascii?Q?+2mRa7oUYwRWABC3omgTM6u0SVtvV4EWIrVIonz/M9NxHjvnkDGozhna8vj/?=
 =?us-ascii?Q?Tk4C/G8S2xhp4DAos1hKhOBTwmcsnJcFAYB3yBDoaPKpwJfjCvmKNGyzL1Yd?=
 =?us-ascii?Q?diPnZl/S9S/m6LrTcXA8Pg3c9sfdo/86vuq1ylO58ewPX/no+NrVIZkAddqM?=
 =?us-ascii?Q?DdU3helDBazwcXKZGrVBw7JlRk1jakh5W+uo7airEEDlVJwSkNiQwpbnxzsY?=
 =?us-ascii?Q?Bj9QTOsG5dEj5hfiRG2HExq8bYQl3fxaFPVggDXAx7NwJOxKZAVPR6bheC9C?=
 =?us-ascii?Q?8vvYT2TIIhGavk8SVRR2VV373EvZRdWcYLtnYGDzfOLgFXHkjbseQlirXTy5?=
 =?us-ascii?Q?MGekGwl883cjXPq5gj8IhsfhdIz6Wd11IY2DMtWPGfOUcAlbMu8ZomBqBWY9?=
 =?us-ascii?Q?NLTdI5oZ32PIcNrr6zz4gJzMv93eNNlQoExfCOu9SaA5tlabz/bdrqD6/tj+?=
 =?us-ascii?Q?E/+GIJ68TewBr/CjgscOz4WbwX22wLqTtkTSN2lhQLGU6UIwMMMZ9MwUlEhl?=
 =?us-ascii?Q?Yj1f/YxicPNyxHtt3/lNQucq6aYLFd2+A9qis4sY/OJUlJmaCB2DZub1U52e?=
 =?us-ascii?Q?0MPnOUHdPrYOfMIiyWLbAAjvNXDDhFuJ4pu6+9byiRYo6cjLPefBlHOe+gjU?=
 =?us-ascii?Q?ZT/XytxUqbWURlfeqL6H/NeJaxus4nDslcaNOC7w6YHz/8Wbwq6gnlbY7Tpl?=
 =?us-ascii?Q?CeOnS0EOXLQYxpt8CbYdx0GhdEsp2QuZwfSmGRU3ZWjk4J1D3X0mYcfw9MNM?=
 =?us-ascii?Q?PJHr71cwKXF9ZrdAxMYV+2TIi5pzPOmDwyHvWuXXwMcmVOHzOgG6uyrRcdq3?=
 =?us-ascii?Q?AVdqDI1Vod+v8T2rNGJMoIOFVlkAB08TwQLHj5R4PA9NWnIO1Hm3y6fpcqVu?=
 =?us-ascii?Q?ixHa8q134EKspmgufWGuwtIZHnp4GejfNwuU2+ewU1WJSeDMvlkE9qbbVZEF?=
 =?us-ascii?Q?PVq/sVk+ILzPEfRFrVv9fSwrQldIOu00UqUsbk3QZArC5tl+z9XzSqo9lX4g?=
 =?us-ascii?Q?CrqROhnvdJ8kTFJ9pncmbvPg6DAzwSdr4c1ALqrpo82hD6AM09FCwwuYPfDv?=
 =?us-ascii?Q?CcQul9iq3LXc16TK9Wg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccdadef-2328-456f-6654-08ddd966e253
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 06:10:06.2936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3VTCea67bA+b+sg4p4hvtxTjjPyLcPqEKW+qaVTUaOqTrPfaSMyAGoUsogpBir/B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEXqSdAszF4v8hINguN8/XgqzA95XL3myR9E0UV0ZQY=;
 b=UBidnaagqw0jAerklNCfQKvMTgld5hCSckYBdzIW7PdUS27Z4xfoZJLsqiiKfNj0qJMUk3CAL3fsegkgzV6y+Fu5wHJKNJcVeWVcI1VJarmd18s+SuDXeH87EIrtweZeeWKZW/+qOd4tCmlRJ/Rog0xBqzeJvE1HJNRlp3KRaf4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UBidnaag
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot: add support for custom
 zynq ps7_init_gpl.c
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello everyone,

Just a friendly reminder on this one as it has been sitting awhile.

Thanks for any feedback!

Best regards,
Neal Frager
AMD

> On Zynq, the booloader is responsible for some basic initializations, such as
> enabling peripherals, DDR and configuring pinmuxes. The ps7_init_gpl.c file
> (and optionally, ps7_init_gpl.h) contains the code for such initializations.
>
> Although U-Boot contains ps7_init_gpl.c files for some boards, each of them
> describes only one specific configuration. Users of a different board, or
> needing a different configuration, can generate custom files using the Xilinx
> Vivado development tools.
>
> This patch adds Buildroot support for custom zynq ps7_init_gpl.c files in the
> same way that is already done for zynqmp when working with custom hardware
> that is not already supported by u-boot.
>
> To test this feature, the following configs can be added to any zynq_defconfig:
>
> BR2_TARGET_UBOOT_ZYNQ=y
> BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE=<path to custom board ps7_init_gpl.c>
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
