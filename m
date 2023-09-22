Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F82E6FE2D
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 13:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1445083F1B;
	Fri, 22 Sep 2023 13:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1445083F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liVwzCJrQXvK; Fri, 22 Sep 2023 13:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3824E83CA8;
	Fri, 22 Sep 2023 13:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3824E83CA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 388FC1BF375
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E08183C93
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E08183C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKqWjIRZ6KKU for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 13:35:02 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::620])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C696837AC
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 13:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C696837AC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnz5tu3ZVRgWBYq1Ua0fjsM8kSyD7H98IeIGa/jMrT24U8PLLYartqYgFdpJTzdjWov471UrS7W6TKJN5/RatiQdqQbqlS0G15wNiIfLAkBL4yEo4ADFbD1uYVsJ96E51Hw2+jUTN9BGxan2aCLBeiRroOmGUikfGW7Y9u/H7YG0DP3pQTmX/qzFnGl86v7ttGd3RWvuPtX2dyHZF3c15lJRdMDxPZ/dughINKeUsY/oUWCx6ZGwcx9XI51qaLV3CDBFQFoPtue9pt+ZoYfionejj9Cl36zifpYX841z0aOzbphLVA5u36AUAsYqgwIaNSTZGngHXNVTOjhI6fNvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0LaKcb09ZO1Yoq+yLX1RipBZsclpM4vB9lnn1Ok5Uk=;
 b=kvZCjV+iilcIw7PEKYEvwzBIBuPIier3AC6hRoHsGLq8UAkvsE6eZene3y7ao2ImlCP+Xe785bl1pQSybAmNzKRL/SoxKBkD9DILpbHkdLhrhpzyY3P5tmWgxFcmFCcQnG7k5QVUBlb9O3O04xI+eWq40JploFMGVstolsnTU3nWA1MissONV5G1PUY/uq57XtmsqqQ3Z4i7VC2Kxi5+Jksg1oYuN1XldDc9QLrtT0G64UEvvaHQVdZ9dmAq7mpTdAzdsUbv9MeLN2mNnTI5VIvQcjTefxTjP4cQ7B+QdkRKkik3Fw+hplnRg6KyRKqF6wFGEX7xeA3kILct6MR7ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH0PR12MB5645.namprd12.prod.outlook.com (2603:10b6:510:140::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Fri, 22 Sep
 2023 13:34:58 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 13:34:58 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 1/6] package/binutils-bare-metal: new package
Thread-Index: AQHZ3xdOetzd6qes5kKjvQ75CSQimbAm6SMAgAAITYA=
Date: Fri, 22 Sep 2023 13:34:58 +0000
Message-ID: <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
In-Reply-To: <20230922145236.027dc287@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH0PR12MB5645:EE_
x-ms-office365-filtering-correlation-id: a0ea8c21-2255-46f1-5880-08dbbb70b736
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CaAwkd0Q9LL+0qEpts1DHS0Bmhx6VOrQ5j5BOe7qY0/9dA+D4azamm1qUD+0TPXsZ7CD5uGyMF7/gYyBO+h2BOtu4yq7ZwZBhVHiDIxlFao85hHwOR75Scffw9aPyY6sROa9aFwStKeO1V7tQO2UOAZuAsqsolVXLQV4NmGFtJjoop6OMDjr7ycbBeEdGOZV86gY0NUSV1HV325+SN6xYe+BbV05kh1jOCzs9DKDwHC+VaRBrSy76S7B2lVaF5aZnFWERBAmcYheK7BzJlzH6aWEHPRXIpV2a1SvqcRIkrBZZt2YXwVCZ1y7wEySdW4ScuBBJia+oFz8T/cXnVF2hGPzbYqXI1wwHLrvmG04tNFVmegyDLK+LbKA9EJDVyJGtARTLi4/bzw2Q8LME9HyJ9BsSDXT1my0wnN2mNjJFIGcM371flu9qz1K9Rt8xK5RJalwrayiQXnGo17rEe+3fRxaNnsUV2rcfQCuXjfRpxGwepox5RC9jEUSSV3JGG3wWFOLO3219XpwS0EZksMNCeJE+BMBb9eHXYHQKKqYIGQjBCBbzTyUJWr3JJX0wILWv1xP194stCfCx7x4WfRPmz4Z0QO+JRAoZD7Zew9vULk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(186009)(451199024)(1800799009)(7696005)(6506007)(55016003)(38100700002)(122000001)(38070700005)(86362001)(33656002)(2906002)(52536014)(478600001)(4326008)(5660300002)(71200400001)(9686003)(83380400001)(76116006)(41300700001)(6916009)(316002)(66476007)(8676002)(8936002)(66946007)(66556008)(64756008)(66446008)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8cvQCheXRuMWONWOC3yCszOktL9pNhkCaNHi2CicNAn++iUg2KA81EI6UsYU?=
 =?us-ascii?Q?dHh6pgrkIeD7uMIO7C61eM4TayRTv2DtSXOkPG+EVysKSOuWzUIfFOmp2cUU?=
 =?us-ascii?Q?CSmU9CoJk4CSmxKIv9O810oHEy1On2DN75+RrnlSN0Ifk1gsmwzDFzmwjl9e?=
 =?us-ascii?Q?GjcUFFNwWsQ3a1EOiv/UCmaZSL5iIhcoqzbUvtZdHIoyOONgyp0WddecaeKd?=
 =?us-ascii?Q?j3Zw75JyiHcLSd0rkV58zkTDwOv7fIBBPMI2EXU2QrXBwVBNmvK8xBo8SsUw?=
 =?us-ascii?Q?snTBf+VQxEyCfMzoAIP+3YGOrETPP+SJz/y4mFf5ccHAL4cAjkVnwxTpmFXI?=
 =?us-ascii?Q?v+VExkRYsNjeLvbHF5Tk/ygsI1NL1TVRF7wyndesvS1p6WVOYvJZI16eiyLr?=
 =?us-ascii?Q?BuYrRUdho2+/OfcAdGY/Vg9d8cA3Ga+LmBHhAqnNE0nWhuPlZ1ReLWVQb2ku?=
 =?us-ascii?Q?zynuX1YX6Qen9jwFQsJgmLb+GalvyaXho3re/GSFyi7egS5ZH2lqTUkrhDOw?=
 =?us-ascii?Q?Y+W9H/K1Ec3yrpuq0rXuggpNGWuuP0qgdQrDqJcox1I6w40KIgkq7JSFeYwe?=
 =?us-ascii?Q?yRh9g8kaoQnnWfqzkt0Uc5p5G8wMCOCeO394W4JHbdDznL5EDHXVooKIfTEr?=
 =?us-ascii?Q?4ls9NITHauyZP5vb3CUSDKmL/lu/5JEWC9Qmpc2htpkcF5jFi5btECHFaznf?=
 =?us-ascii?Q?NSb709OyEOETkZY1m+BJlanTc+Cv/iIshycD9vQvd5BBN8pjXwkznqmrIsXQ?=
 =?us-ascii?Q?ABPi982wfMZ+/5I1J57iY11WYkiT3e0xOsOat7bDYt76W2eQHE/0CSqkl2vD?=
 =?us-ascii?Q?nOgC/iDNXuNDfuGIeFN+R0hYfdAf2zFbLNNLnLxwBSf6VxwcuazYmXHbrR7N?=
 =?us-ascii?Q?kWoAkW5ctqkyU/mVM0aWMNsmHvsaagj9/Z1f4VUmdDb8AVW0028J19ZDO7/B?=
 =?us-ascii?Q?b6i+Q380CSA7gpjtWyixqvX51EMM1IJEhk/ZmTn7Q4uxT/v1zesJJrokkxrd?=
 =?us-ascii?Q?8Frry/cwG7i2CxtgVKa94Pw+gdslVZfCQeKEec6lVySdCacHYZ2h4TlJQCs5?=
 =?us-ascii?Q?jxDYm5vf5csC6Bg/Jy3Ynj4A/Io8EkfcmZx1nNdn0VeCDARlVVG+Z5k5bEs8?=
 =?us-ascii?Q?naLc2dlRs0FBoBdXMIN+9XqljdvOJVu/CmZMQzW6Cli15roWJ1P+9ojtbI41?=
 =?us-ascii?Q?9h8M2SpRL/TQS++SKhTdaEHGbUaH9tdq9NbRwVpK9Jr0PFAh9Y8ZvvmvQvNV?=
 =?us-ascii?Q?WhS06FbbOassaWW2Bed5ALNJY6Ieu/FrievVum+u8gaumJeyLxpZqBPx60Uf?=
 =?us-ascii?Q?tofCeX6BLmvQKrG1/L/v5FpspfgxaYckDhFFR9XLRs2YI23Zz9wjCZKxUnjf?=
 =?us-ascii?Q?aPilAgY0fnWd6z0MOqobqT/z2pSCK/dSgmaPZVLSL2wHKJcCeW1On8nF3l6c?=
 =?us-ascii?Q?2pXwWrXiOGsDeVgpqJQHjXxkdGws+T/QsgYr/wUteBMFXU7JTJZGsuP+0GZ7?=
 =?us-ascii?Q?IKp0qO+ZQJVjMhr2hmMyp5W0/6ZNtwu30+9Z+u8ZuCW90TJcVrQuHuKJMDzE?=
 =?us-ascii?Q?bwIQK6+5mfuuwl3bnHDBB1JNKFoewk2VIuZ+MRfP+Sjy4v6C7mvwrPeXJph+?=
 =?us-ascii?Q?V2w/ie0YWWV6/HiqRewbaiA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ea8c21-2255-46f1-5880-08dbbb70b736
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 13:34:58.7232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: srdx8ormx9PGcwq9RqdjJsq5PI3+OOo1T6i/Zw6MlGRydb1v5rUVHp96JjokLIre
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5645
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0LaKcb09ZO1Yoq+yLX1RipBZsclpM4vB9lnn1Ok5Uk=;
 b=LOdD5t1yn/iB9hI3OR+W3J3nLGEjWmahPKoBRISpP57HMR+UaL1nshn/bOgXOUt0slyprQTWMv/5ZBfCIJvEaXaPtpnWBTh18oT6HDenh7NR6jB7oKYBt97RmYI3SXmcjU6Ayo/rAED3hk0cMc024oMuMjMAAulMYgOXUo3r9Jo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LOdD5t1y
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Hello Neal, Ibai,

> thank you for your persistence in working on this!

> The overall patch set appears pretty clean, except for a few remarks as you can read in this and the other replies. 

Thank you for the kind words.

> I had a small hiccup while trying to apply your patches using 'git am' from my inbox:

>   error: cannot convert from y to UTF-8

> This is probably due to this weird header value:

>   Content-Type: text/plain; charset="y"

> Probably some dirt in your git config. However the mbox file as downloaded from patchwork did apply without issues. I don't think you need to resend the series just for this.

I will create a clean patch set with v4, so this should hopefully disappear.


> This patch adds a new package for building binutils for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration 
> will be a Xilinx microblaze little endian architecture, so that 
> buildroot will be able to build the microblaze firmware applications for zynqmp and versal.
> 
> When configured for the Xilinx microblaze architecture, all of the 
> binutils patches that are applied to the Xilinx distributed toolchain 
> will be applied in order to generate a toolchain that is equivalent to what Xilinx distributes.
> 
> Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

...

> diff --git a/package/binutils-bare-metal/Config.in.host 
> b/package/binutils-bare-metal/Config.in.host
> new file mode 100644
> index 0000000000..036698d418
> --- /dev/null
> +++ b/package/binutils-bare-metal/Config.in.host
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> +	bool "host binutils-bare-metal"
> +	help
> +	  binutils-bare-metal is a host utility for a
> +	  bare-metal toolchain

> "a host utility seems a bit of an understatement, I'd rather say "Build to GNU binutils for a bare-metal toolchain" to clarify this is building no less than the GNU binutils.

I agree.  I will change this in v4.

> +
> +if BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> +
> +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION
> +	string
> +	default "2.39"
> +
> +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS
> +	string "Additional binutils options"
> +	default ""
> +	help
> +	  Any additional binutils options you may want to include

> Do we really want this without a valid use case?

> The same question could apply to the _VERSION setting, however I feel it's reasonable to keep it...

> This applies to patches 2 and 3 as well.

My thought was that someone might want to add additional bare-metal options aside from the Xilinx microblaze target.

If not building binutils, gcc or newlib for microblaze, users might want to change the version and the config options used.

> diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk 
> b/package/binutils-bare-metal/binutils-bare-metal.mk
> new file mode 100644
> index 0000000000..fd983abc93
> --- /dev/null
> +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> @@ -0,0 +1,56 @@
> +#####################################################################
> +###########
> +#
> +# binutils-bare-metal
> +#
> +#####################################################################
> +###########
> +
> +HOST_BINUTILS_BARE_METAL_VERSION = $(call 
> +qstrip,$(BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION))
> +ifeq ($(HOST_BINUTILS_BARE_METAL_VERSION),)
> +HOST_BINUTILS_BARE_METAL_VERSION = 2.39 endif # BINUTILS_VERSION
> +
> +HOST_BINUTILS_BARE_METAL_SITE ?= $(BR2_GNU_MIRROR)/binutils 
> +HOST_BINUTILS_BARE_METAL_SOURCE ?= 
> +binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
> +
> +HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+ 
> +HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB 
> +HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
> +
> +HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
> +
> +# if toolchain is for microblazeel-xilinx, apply Xilinx patch set 
> +ifeq 
> +($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx")

> The toolchain-bare-metal is added in patch 4, thus this series as-is is not bisectable. I don't see any obvious solutions as toolchain-bare-metal selects binutils-bare-metal so I guess some maintainer can provide some hints on how to handle this.

> The same issue applies to patches 2 and 3.

Ok, I am not sure what to do with this feedback.

> +HOST_BINUTILS_BARE_METAL_EXTRA_DOWNLOADS = 
> +https://github.com/Xilinx/meta-xilinx/archive/refs/tags/xlnx-rel-v202
> +3.1.tar.gz

> This is not a huge download (500 kB compressed, 5.6 MB  uncompressed), but we use the binutils patches only, which account for 10% of the whole archive. I wonder whether there is a way to download only a subdirectory from github.

> And looking at the patches themselves, I wonder how many are actually needed. At a cursory look, some don't really look like production code.
> Are those changes being mainlined?

Our initial plan was to make binutils and gcc versions that match the Xilinx software release as closely as possible.  This is why we just took the patch set blindly.

From my view, it is easier for me to maintain this if we either take all of the patches as is or none at all.

> +define HOST_BINUTILS_BARE_METAL_EXTRACT_PATCHES
> +  mkdir -p $(@D)/patches
> +  tar -xf $(HOST_BINUTILS_BARE_METAL_DL_DIR)/xlnx-rel-v2023.1.tar.gz 
> +--strip-components=5 -C $(@D)/patches 
> +meta-xilinx-xlnx-rel-v2023.1/meta-microblaze/recipes-devtools/binutil
> +s/binutils

> Please split this very long line. e.g.:

>  tar -xf $(HOST_BINUTILS_BARE_METAL_DL_DIR)/xlnx-rel-v2023.1.tar.gz \
>    --strip-components=5 \
>    -C $(@D)/patches
>    meta-xilinx-xlnx-rel-v2023.1/meta-microblaze/recipes-devtools/binutils/binutils

Yes, no problem for v4.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
