Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE08CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84DD2412E9;
	Mon,  1 Sep 2025 08:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QImKRzFwEfBh; Mon,  1 Sep 2025 08:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C13412E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C13412E0;
	Mon,  1 Sep 2025 08:46:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0A38169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9696640480
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIWoQfcumgzP for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::61c;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED3574044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED3574044B
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::61c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED3574044B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:46:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gmt5qCkFvBi1x5/iSKI91suvVSCIJYpxeFiEC0K/BJYx0qgipwzMQqgQ0skEAmcXaW4Ko9nBsPqZIVs214z+NVw5hHN6hWU2uC6xQVxljERMcSSb50qoJ0DuLfpPjHCaLni80qhoPCfK5ORoMVf01TvjH/UAczrmOc/60QXm/eEbqwawPY6xtr4LfZUpAYtU0WGtkmiJPjglJfg+BrEm4F5U1zXfcxg4jnYkHwTM9E/ESiCm2ezQUmycZTmeK0kh5QT0m6wJ2ZQcgDhEmWysS6AY8pmJyqU9RIhCSklTFgWWCqgEba8Q13Zq1RELjOIOMXVeZaSJR7D6YMkZPHZ17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qwc4jkuVRa9NdudJs1eS5n00SzbHC961qPkjnr7W2P8=;
 b=ZLG0R/rHSSRbBLyVR9cb1ihtsDPFdGKyE02w/tmi5VJs3Fbz1zWWv23cizvz0RVzHYoDmSD0snmYNIPJLlx49vMf1qF2iMTHw+MZrqh/KYfVzFoXrCF6tV/Wi6yge44bvnrawqcefPqtFkR17M1D4jEfiyn6TDpMbRKU4E5Y0qPVSj519l0tyv/fu29dh8u78d1AQ3ZpRPYgBUaFL7FQWWL9p143gRE0HqbpPnRp1hQUfw3jdpK5WiQgLuLzmZJv0pTdmes8n/nqyfoYF5A7rdi4VOD/vmk1whsyq9lxUOIYJX7DpskSD+TMbiIlGs8fg2GHmuSOoFiCkt33vbHONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by LV3PR12MB9187.namprd12.prod.outlook.com (2603:10b6:408:194::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 08:46:37 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 08:46:36 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] toolchain/toolchain-bare-metal-buildroot: add
 multilib option
Thread-Index: AQHb4TGVGJpYw2URNUakLRyhBVogQrR+dsNQ
Date: Mon, 1 Sep 2025 08:46:36 +0000
Message-ID: <SA1PR12MB5615E2EA793D38A804A57B90F007A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250619154811.936265-1-neal.frager@amd.com>
In-Reply-To: <20250619154811.936265-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-01T08:44:06.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|LV3PR12MB9187:EE_
x-ms-office365-filtering-correlation-id: 242e13f7-c6b7-4160-0e37-08dde9340fcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9XyLRCvMKtxTXv6RGKiSqZYm0+WhcXsBDiu0PFwn2bF5qn0r0l0LxeCgF/GP?=
 =?us-ascii?Q?SBwlPiXzgUfpRqdYmOGMcBtJQcAI5psXR2y96ivEhNYQ9Pc50szIRaV7vSnt?=
 =?us-ascii?Q?Qmr6Fr5jQRZlIVBMQY+ds1t2U9Yl19wtqMfwoH2J8IVcZ7mbdpPKJK7v4Dbm?=
 =?us-ascii?Q?D/dpn+J/8/ICteM+zN4YCnturX94qRPppTzl4gRfCX3L9qgObySF1qJvVhVt?=
 =?us-ascii?Q?ERc0YZXRe985BFkhmH4O1VMPxx4p52YCcUdFHlhZhINWj3Tgk2CzOhNbvTMK?=
 =?us-ascii?Q?bWyksq58mHDIrfCyakocAYI0xRz3J43QSgFJdgSRDqhseYoNADlCxxNEUfxW?=
 =?us-ascii?Q?D7AHH7CcMgkin6pxmBt7T0Z/cvAr9Q+AW1r8TMglECUGW08rr3BJWvtOJNbK?=
 =?us-ascii?Q?BLBSUub9sCYofez/a1TIQ9cgW7gwy/mSStAwHJPD25+z+wl//7mHztAjVAWJ?=
 =?us-ascii?Q?5v/3qGfa4urzg0VXDGWbebtPWFSOb1HIw5SmtAIKfyu66omLqwx2c7I5OwYd?=
 =?us-ascii?Q?uDOa00C+/X/e+pM2Tc9m6hIt3Hmhjnh8Ab3k9NS80xf0cOc2lVwLA4KlNL0H?=
 =?us-ascii?Q?QkL9fKIATRtmkXj1pvg6GZuQT11WhOJ8I68hQgZkRjYDGwt0OV9Xd+/XBWHp?=
 =?us-ascii?Q?YhHfnqJAmx/davxSzNM1T4bJCpQeZBEHgEwX2bh/SqAYxQ0Utjm+nKZdLneq?=
 =?us-ascii?Q?q7v/Sqho7udWyPAW8cjjWteI0rJCk0Dzw4WsE0PwmtOfDH8NfvK9lrQOVEo0?=
 =?us-ascii?Q?08OiB5rtRaGSUTL51pGOmv8bPMQr4hYA/jlPhaRqgR8vtZyp/hDi6Gzn82UY?=
 =?us-ascii?Q?Pp4bEcNYnMKnKYbaIOQQsKY/xXj0eUeSNpr8Mbc4Soz/sGP8g+KaFD3Oayaw?=
 =?us-ascii?Q?JgzOPpHThXN9JblbvGnRHuzA/0Dg05On4Kgge3v3SYeEJ3vA8lQ65myDVUFe?=
 =?us-ascii?Q?PBfOXYGj4cwBUyFRbvv5PklWXRBIG+dZ+ReDbr0mk9uf3uWOGphx+jLRXVnz?=
 =?us-ascii?Q?Pz0UVPadspBEouU4ZJV05RVKvYUXfUfjATihSddC6xPXcxZUTX+d9LDu3A6u?=
 =?us-ascii?Q?v/DehbCoSbcqjARafnfuo7UWiHx2oF8oxwXxSyf7jAeFOGQJGsNhxjBJcz6P?=
 =?us-ascii?Q?y+Mg3hln4ltEwgof0R8fyMwgo/mu507hv//REPholmSfHdRqXEFq4tilrILu?=
 =?us-ascii?Q?Uqxp33W8jAF1BNsrgXTMlG55E9tmZHlVsfBK776pLEiGi6pN9/dhSW0Jm1Jn?=
 =?us-ascii?Q?KLqBAu2NddriZHdshIVHHLNgoNnBQq0Dx/HDVEUqE/HrD/+LXt+uHBWHsyFk?=
 =?us-ascii?Q?fF6D7mpWUa0t0JvGkjsnhrisADNwzeHFhUU461MpXoIxF+B6PKP6OFdAx/83?=
 =?us-ascii?Q?p1rC43Lq6yvRA9Rg84kdfY/sXgCf3KsT/OjYL6jPNhApZ59qhgmeICd9TRLi?=
 =?us-ascii?Q?QOO0qST4R1Ep236X52f0vRqQa4Ow0jhUgXvELtuy5nIHbT/DwzuMtQesclIM?=
 =?us-ascii?Q?MWb1OCzvZ7CDH8CTCKhDLOu6hiLe/9ZzwoVp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K3V9rDY144aeVk6AZCpIm1jJ1n+aLNuW5JsH6OmYFzmK7rNZW3jzOt9/B0tE?=
 =?us-ascii?Q?q5mxyYyy4CRRVSyNHqfcLV9bbRneHTb0gSLIXbNDs81HXawhiCXkdWGq3M3A?=
 =?us-ascii?Q?ldY2FWL9XvBFrLyHFMMWg4uUKHOQJhHEzlpheyex1rYMicuZRAyBeZ9f7dFJ?=
 =?us-ascii?Q?YI8Ok3eMbcVsoxAgcSfJ+4CUbnoOxn0kfuaLk2yDUY59s09AIqfUzxtI/6ie?=
 =?us-ascii?Q?MzUgP8TqrwPwJHgOPqUkd9cuzj4lf5hS9BAtnR2o9sPi7DsEgPWG5H+09/Jj?=
 =?us-ascii?Q?ie6kw5bWCID2rs0G5h0sE9D4wJ2A+5rd03OL3piHEHNdQlLW9bXEF/rQLldp?=
 =?us-ascii?Q?VMORpY4G0LyzHSU6EXV4e0FKCtd5Vlk9fRWUy1uTpDLtV0eU+uf7VCpMrEaQ?=
 =?us-ascii?Q?wD+bZltPVciy0WAkNlz5bZDydY46fj+Xd6RxsE7W8O9JLOyaiIusXAblHhwG?=
 =?us-ascii?Q?sitKQkZ+s4IQ6NM1uUUkCjaeKVPetYogaVzgXcIi6XE2mAagI6NhcJXq6reH?=
 =?us-ascii?Q?mAdKp+H5XOepRukZUpkKMVYwNvhU9DmcYnFJ3Lg3N1S1pxGpbHtv6PlDf26x?=
 =?us-ascii?Q?CqhoCfkepmYAMh05WsaZhWAKr9z/UMhRdOKBR31dgjXD7glMaIN94zQJFP61?=
 =?us-ascii?Q?u6kAHTogRee8WeqrLAoI1AGU9Ry4llpttwqb1tY214xilCxwLJAkZ+QXz3YK?=
 =?us-ascii?Q?sJ0LkHNLGWy0ewtlmcnD8uzjDxkICGtoECdzlp5zGeLfNsnOYoB15k+DTHvT?=
 =?us-ascii?Q?v2jvb379Z7ECd3GynqwuG8HkkjaRncvGmjT0MQlv3yVaVO/vbZ8o8sBy/Q/n?=
 =?us-ascii?Q?ZqutLLUJVs3qTMa7gqX5a788kZukXNIHTqxe0GJaAruzrbdLZ7DbTnFnkanN?=
 =?us-ascii?Q?stZhj6I1Au+oxqxPqaTrVIy4lGtuGNf5nJLUYmUDlvVI2DStn7f5CVP3nUEV?=
 =?us-ascii?Q?dlv4wil9SRz1y5b7L+mE8uYq8TRJeCGAp629+pVAm2OVAxN40oaVW3wcL0qS?=
 =?us-ascii?Q?P23QWzvGI1m/RBDFpRBSZDeaOy/OIz1rwprnUrztaSrGEBBWarqQdmFfk2Z9?=
 =?us-ascii?Q?Z3GPgqNHluoQyjwqMiuypT7HBqk85E9akJCwlUU2PecmF8JT6Q8UY7V546v3?=
 =?us-ascii?Q?++oPL+opDmhp6JTPAJEOg6wGZ41PlQgrsDCGKHfRJCU5cZYqBbX3/LLUcLVi?=
 =?us-ascii?Q?ShnpNLehByCr3xTRNZ4TXecB+M8sD+ih+hI8tEKpiiev3MtGnW6bqOw8AgfS?=
 =?us-ascii?Q?/CHwbongZCUtQiN4IzFYFyixedt4jPdr5zHf6NxOUWrzyJU0BEOJhuB5dlQd?=
 =?us-ascii?Q?UdodhgppkxH3DNw+DLdojnASujLYCOiEMtGqTm+NGSOlNRswccvsOeZEtbYM?=
 =?us-ascii?Q?kDrpS5OJruvUPx86UpkFBYf3VOT4AhEQKKf91eIF8fnfduuoRPsTLyJCUXwl?=
 =?us-ascii?Q?Vp0IGwT3BmD2FB73F7XVyskaxI3dfMbcIo+FHpSVEc32Z6KeIuhF1gVBDqa/?=
 =?us-ascii?Q?mCYzDYElNplNuNXGUggj9csvIsTfESBT5KYqy6KxuJzNl+j/6WicNyR7sKyO?=
 =?us-ascii?Q?uBw/uHxbnReCbMun5UE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242e13f7-c6b7-4160-0e37-08dde9340fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 08:46:36.8798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U9pemquKP2ZrlZsPKYJsZRUS3nwVn7wsGX8wFrz+IB/PHONlcLKNSV/ogsc6/gaS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qwc4jkuVRa9NdudJs1eS5n00SzbHC961qPkjnr7W2P8=;
 b=oNilyXGcHN4RqjRBKdqizGQbAOwovmOpRXRKY0iIExgf45V45xZ4RvNMdF+WhL33oc09PC+D5USzECloNVv1C+21+O2Js6LkoAsA/Ek2TuW6o2PpQy1hJcTURknpwUc2lp1nMNX+/ofYSCSYUT+10dbzO3TvplnYICn8H1Ci8Ck=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oNilyXGc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1]
 toolchain/toolchain-bare-metal-buildroot: add multilib option
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello everyone,

> Sometimes the default GCC and newlib libraries built for a given
> architecture tuple are not based on the desired ABI. Since ABI definitions are
> different between architectures, the simplest solution is to allow users to
> build bare-metal toolchains with --enable-multilib. This way, the libraries
> for every available ABI will be built and users will be able to select the
> desired library for their user applications.

> This patch adds the option BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB to give
> users the choice to enable multilib, if desired.

> Please note that when using a string of architecture tuples, this option will
> apply to all architectures in the string, so it can significantly increase
> build time.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> package/binutils-bare-metal/binutils-bare-metal.mk |  8 +++++++-
> package/gcc-bare-metal/gcc-bare-metal.mk           |  8 +++++++-
> package/newlib-bare-metal/newlib-bare-metal.mk     |  8 +++++++-
> toolchain/toolchain-bare-metal-buildroot/Config.in | 14 ++++++++++++++
> 4 files changed, 35 insertions(+), 3 deletions(-)

As this patch has been sitting a while, I just wanted to send a friendly
reminder to see if there is any additional feedback.

Thanks for any reviews!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
