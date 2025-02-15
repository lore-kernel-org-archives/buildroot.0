Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10A3C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 12:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4526260B91;
	Sat, 15 Feb 2025 12:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-QBg7fPdjS3; Sat, 15 Feb 2025 12:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22CA560BE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22CA560BE8;
	Sat, 15 Feb 2025 12:35:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40D2D1E3
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A37D42548
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJa1raG7aJ9P for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 12:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::620;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E3794252B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E3794252B
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::620])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E3794252B
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPKS6au5aFgBjuWGLydECDsAtJ7BoDk93iKr1Ec9Pf8rf4XiEO9pnjSoPOEbMmAYNbtpEWMVasgCGPHZVvmhtQzJTwJMIPGIuAIYQUj2sKCnd4F6E/0feduYYnwYZaivXmDAzogZoL8t9S7DlX/VkUalPsxLfZpmf0xcU4lnbnue9l8zQBV6vMNoDOhjzaPqZ77oWzHRsGDfdx6sWiLX/3ueHd/R2q9K0nk+8aOtpNQ6eCLOO/T/npse394fgXi4N+2kgZYiAIxdTq2N4OX8HzbcXYrrKpci7+ZuFGXYPJOTDK2aUKoFpRXTc30kdfnwvbKYl+eUHEoRFzqhp9vdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2loQD+qdE7YTUSt3dPNuxIHksgnHgU4Zn5R+16KHBZU=;
 b=wGeH2J+P+QN8Oh/VXvLtJD4FD6kcEBIauPg8pkVkePlGfWS3uoxFBTUtZ5WO3oiz8VsXmsGRUaehzn9IC/ZDKUbMXQe7Fc5oYAfXhXBY83JFwv8cOuy4x048OTF3ARquruz6nJZWmlON0msif0KAe5bn0THfMH1y6taF+NQFknIKX3xi0thDZcxX3ESg3iznHkrcWXm3OHC7dbfYkFQzT0T0Tyn3srvrVRYkKx2PM4stJNTdRqz2ei8wVkoCm3xWq8VyRIBMVrtaL0zmc6yrbZKHHQmPskjWcITKIFcolB10xGWrysDEs65oqfRVnxH5RLUh8ToGiY4gWp37DI9VHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sat, 15 Feb
 2025 12:35:30 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Sat, 15 Feb 2025
 12:35:29 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v2 4/4]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple tuple
 support
Thread-Index: AQHbfwEfo6SnXLbvN0iC8rNj+AuuDLNHWqwAgADyqyA=
Date: Sat, 15 Feb 2025 12:35:29 +0000
Message-ID: <SA1PR12MB5615BDD62E8F4C348DCEA1B9F0F92@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
 <20250214165402.1128194-4-neal.frager@amd.com>
 <20250214230356.7463c628@windsurf>
In-Reply-To: <20250214230356.7463c628@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DM6PR12MB4267:EE_
x-ms-office365-filtering-correlation-id: a5c0e4ae-d999-480c-f873-08dd4dbd3b67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2O1ORnEN3vt5SaYxnTJ2Pr+NVRoeLHdmrw4yhY/69e7udeuy+KSy9mJmL0Ud?=
 =?us-ascii?Q?F+lQQ4ZRW82TyvvxPjQl1p/Uf8RCqONI4sbrQaaMh0flZn9tQbt3jrtGAZ/7?=
 =?us-ascii?Q?iK8wj4MaVx6GAOYwNQKa1w9vFLEGUO4JkqDFaLFE65Zyvr+q4sPh4kYqAPuR?=
 =?us-ascii?Q?JeOBFMfi+S8E1YarewcJJwmxquUaOrm6bwRmhsK4ik3DMfvHXQg/JvO5ltqs?=
 =?us-ascii?Q?h+njPdCPPqcJdsyFt6WQ75jB+YlFoE2NYkgY30raIuNkMRf0OtPS+vuRtFom?=
 =?us-ascii?Q?mDzSIiwQXniLkjj0HENUr1hP5FcrYcYIW5SMVngb5EWKmyZ9g8ovmzcSkiK8?=
 =?us-ascii?Q?ODyRo+aOt4Qb8F/RTo94jhFl6fuyR/G7nCCih3DuDDTqdgPiLioIlvsuXOgX?=
 =?us-ascii?Q?kaE5SnfbpXkMXURpL1PBbmp58m1ybBJkMyzQgQ7w1zgE0scTRAyErHqIkbUV?=
 =?us-ascii?Q?/kODwFHQpT0BQ1dF+yV0GqpMys7B6aYtKZRTJJZnwVDav+6DgMzzT1iFtKW0?=
 =?us-ascii?Q?Zbxsqvvmu5QkkN9draeZPOGdZQxiCK9YzD/5Jz9pq9GO+BWltvIlkO5dn8Zl?=
 =?us-ascii?Q?aWXiapg3gpswTzKEpEy3eaZS6igGyIU6xie6lwCpSYA7L8RrUQ3qv6ARLHhi?=
 =?us-ascii?Q?mujjf5ADpGMI1eYIxqtiLb/GRwnaHMYeh4pEtpv0Xt+qce7U4tcSBSksTO79?=
 =?us-ascii?Q?ChXns0KIo0HKoXxuqIc/s5FjLV8mzUfn/x3aiFNU77MCck+AmCoA5Hq1UIxu?=
 =?us-ascii?Q?a7I6+ofyMMbBoCKkIhf57jwJL5S+ETwa7nmMdr5n460afzlONg/KN5tRqYuR?=
 =?us-ascii?Q?beS+CrI03Wawrc3ONM3KQmqNwIaajvfS0GJCD3IhCYggXb++eUxf2NTVrxb+?=
 =?us-ascii?Q?CdsNJMabTjB7/8zap9Z6k2AOQmb+5g3NCjUJyno2itbNLouiAr6O+jZAoQmH?=
 =?us-ascii?Q?IzgMJS9wW4S9cAkhDCB8mlIKdlJHbUkY8WShlREi7tvG7ITK9DAof3+1mOxx?=
 =?us-ascii?Q?dZQxzKQMOxsijq5cbFV/l+GzZN5JUrund5r1caRYlQURbcFIJH78sOLsgC+M?=
 =?us-ascii?Q?Drj2XQMD6W8faAQKLLNjbRsSweu+n0Elc4lsLNTZoxdj7SPUlbu5m87SHfFX?=
 =?us-ascii?Q?Wy25Wrw3a/AFWGudnRSZvPqg7md2baxCg/3ZGtZSq+YWKo3pk6vHfs6diRPm?=
 =?us-ascii?Q?6VQTQ+SCYzsTSy41qjTPtwi8nwbZiHvz0qnJTq0FQMhJrD7ESjYMkXkeZHnE?=
 =?us-ascii?Q?dQx8EjiXj3bDOSHnnxIf8rFAKF3FLf8fHeOHmQOK5XmJkyqUGBgeHnL+EfPi?=
 =?us-ascii?Q?7Dn1mdeNLPQdm/gQDMot55yGNzYKVTSObyE5lm17YjPEbpxMVLhIw+h80Qpk?=
 =?us-ascii?Q?95rf2C0jNLWAyZEMAm79/oYQbOMTNzleQGaDEWZ0sEBwQPvynjYvrB4XcVYI?=
 =?us-ascii?Q?+8D99E8kjR4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TGCOXOslIYucW29Kd6HltbB3TSJ5RzRjwdvPUeKuiZ2l1BW9K5032Si27bkZ?=
 =?us-ascii?Q?dH6pV77UoScgz9tHPdA+iOhtfM8nDjgl1FG2ymKzedwZL00KkYCAnsoQxErf?=
 =?us-ascii?Q?cyxghIAr2GFWpMd4kddSquAHQP51+o6J/lq0BAYSga2H5KQWUitxNhSQhQxb?=
 =?us-ascii?Q?ZXeH2eWvBRUvQrQ5bmdy9zX5vXwtI2dG+UBV8K7jVgeYhYr6ON1+zbWzcvq7?=
 =?us-ascii?Q?JFQYwbOCWK7whhTwkI3nH3qbeuF7YsAhNl7eDZkmJx71ULpzLVdSeUL+uBH3?=
 =?us-ascii?Q?UEjI4egAKVx8fI1wTDVEJmfTq0V6QX4wJ3u0SbX18x0/D2CDx9Bu84sKJMl7?=
 =?us-ascii?Q?iGgKWvVvgDv2O0tPpN9dxX9rYrGfBIDyXwV0Pcv8JC8xqlne3xS0mQsBIGL/?=
 =?us-ascii?Q?GLez5LjnY+1kuFgIrcTgqlJ/sDE6lqR7MurTLQyn2+ObWY53kERt/EHegXJc?=
 =?us-ascii?Q?BE31JN69Se1hBrT1M/jqNgaaB3yQlVQK0I4svjbg88ENc75yuc/SQKIvob1/?=
 =?us-ascii?Q?49XEywRhMoqvlLTAzLzNEDNo9j886W0I722fdafIQrHjB+0P7bry5mHsgYH0?=
 =?us-ascii?Q?3OR2ZvuAl4bsV+Dv7H/liabjpcluwJ1+8byqmdkBoL7WHl/slHZ2n8uZFJw8?=
 =?us-ascii?Q?E1mUKRxdiY9lkWDHPz70w9JUvZM63nJ/D0hK3DdyuHJJJY59B9rDdfW5bUdr?=
 =?us-ascii?Q?/WBTDrkTcxxViKFcmsc0QRv+kN9K7SB9pdTCLM9KI/2kEhx/MD9h2iRA1Ud6?=
 =?us-ascii?Q?vyR1ydSbFNjaJHh4tRUhX8KVluEBqx+L78e9BtmsfzpIQaJWf7+tSpSVjS1A?=
 =?us-ascii?Q?c99CZl/IavwMO/RV8a9/0tBSdxp9+D4hwD9wrGNgCjHUBvKcw/O0/46OyKmb?=
 =?us-ascii?Q?N2EjEr2ja7O1WfxBfhqtuJd0Zqv35+QghCikcNEf7UAUwirIPNfrh6/FZTdp?=
 =?us-ascii?Q?0c3ZD8toVfsyDA05kscWDC2e6/ZUESmSQYujWPeeuNP8ImOCoC/33M52LSOX?=
 =?us-ascii?Q?XcFFfEpdVGMM3QVlM50auUPOPJHmhlmoCKuTR40VaBuRPTCeaaehF3YPUs5c?=
 =?us-ascii?Q?JEFy7ueF1YKtGzlffCAfgHvaQtS0JrxCZeyo98ZSZrB2MunvSzOak08wf5DS?=
 =?us-ascii?Q?rxxGDQFOMYFKtx9jejuQyaYaHUgklvoxluyArdWaJaHAxQV/Kr6X6DNCUhP7?=
 =?us-ascii?Q?KLb6fToXYS6Khdh8sfcow+UQvNXibRKJJJ+r8n008yPnXYxaMJip+taavcO6?=
 =?us-ascii?Q?RVEs4XmA8AeD8sioNSxLPPAIifVMsIm4l+gD5TwfVpt6vjVhpLMRWX9FNVz4?=
 =?us-ascii?Q?n6IeV0tsBrkvxJ+9+rRb8myf/Aqz17rjL1QtWDx66NHE0kL1HICoEPRNI5lG?=
 =?us-ascii?Q?LTAYaTysGSVCKDfpDwdyRSoWoboC/oN5cVCctPstPVNnoYL9TcsTvbYMHdzg?=
 =?us-ascii?Q?jEd9qoZviq9ZcMuFOM8LFeKbHB9VSTiJg5V9ii8k0xnhwHCtTmeE3QcKxqRm?=
 =?us-ascii?Q?jrdJz6rjk4zGKpYxPh/yFdABfEdEVIPEWMQo5FDaTCcl2wGe/IaCCwDxJIjC?=
 =?us-ascii?Q?sXN3jcE1bhXOakQfi+I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c0e4ae-d999-480c-f873-08dd4dbd3b67
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 12:35:29.6855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hQIRrt9Uw1Dd0L5xV87+Pm11wtrgFwkerjVP/wyf3ox/pcZcEpm/mlgIw8T10Vt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2loQD+qdE7YTUSt3dPNuxIHksgnHgU4Zn5R+16KHBZU=;
 b=NzBfHJgAEDiE/dTB4Q8l3TYYUh1bImMBgL+JEUpa5Q++5OQpb/zwzHiUua4c2qX7E2ZNwOkSJ0kVQbqtzWY75GSH8lpxpkgdjMleJ+poFgqi67Vq4fkMgchE/ca2pV6dNSCaj4OocvW0CVXv9A7s4NZ/yB4cMLUkmASz8pJur1E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NzBfHJgA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 4/4]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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

Hi Thomas,

> Now that binutils-bare-metal, gcc-bare-metal and newlib-bare-metal packages
> have been upgraded to support a list of architecture tuples, this patch
> updates the toolchain-bare-metal-buildroot help text to describe the new
> capability.
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is still backwards compatible with
> its prior definition as defining a single tuple with this new definition
> works exactly the same as before.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Overall looks good. Maybe one minor wording comment.

Thanks for the review.

>  config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
> -	string "architecture tuple"
> +	string "list of architecture tuples"
>  	help
> -	  This option allows to define the architecture tuple for the
> -	  bare-metal toolchain.
> +	  This option defines a list of architecture tuples for
> +	  building bare metal toolchains.

> This option allows to define the list of architecture tuples for which
> bare-metal toolchains will be created. One toolchain will be built for
> each of the architecture tuples specified in this option.

Ok for me.

> +
> +	  For example, to build both a microblaze and a riscv bare

> microblaze -> Microblaze

> riscv -> RISC-V

I will change this.

> +	  metal toolchain for Xilinx platforms, use the following

> I'm not sure the "Xilinx platforms" here is very relevant.

Yes, you are right.

> +	  definition:
> +	  "microblazeel-xilinx-elf riscv32-xilinx-elf"

> In fact, I'm not sure the "xilinx" parts of the tuples here are very
> relevant/useful. It's the vendor part of the tuple, so it has basically
> no effect. It would probably be even more logical to use
> microblazel-none-elf, or even microblazeel-buildroot-elf.

Since we are using Buildroot to build these toolchains, I will use Buildroot
as the vendor.  I will probably update the xilinx-embeddedsw package to use
Buildroot as the toolchain vendor as well.

> Thanks!

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Thanks again!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
