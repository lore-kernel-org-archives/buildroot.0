Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A574C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 08:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 441DF810F5;
	Tue, 21 Jan 2025 08:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5d8W-zs6FUy; Tue, 21 Jan 2025 08:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C2D0810B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C2D0810B1;
	Tue, 21 Jan 2025 08:40:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0BE5959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC0AB6105E
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78syOYXLu0Uy for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 08:40:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::623;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 933A8608D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 933A8608D6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::623])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 933A8608D6
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShgOPRHu1j3usSLBDoqj/LwccZ7qabg8ATAMHaGZIYnHe41/umrAadsOR4gHJquddnG8wa7/0i+bzPsgVnVBdOTkAj93xSlTBpcrG5aoJe5Q8TThSBWRnTdVN07vgK0yn9MDZqbA+tqnaZBkJdP2GVNO+4yTScp4mbgYhWOhTxHtwh5wO+AudOoa4NJoaQa9NC8sx9w7VGDvNQwaPGZLe7LiZq7oYWhvKyDBcqg/xxMCljB0Tq8EZIAygiVMe0RBKQjPAWEmoCtvC4spnf8w6jIWUc2ob7t9BmKVGcWcC9dmyPVnC9KEtZ92nbd27WJlwOQRenyYBZc7jrQVF1pLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mmj3TYbNXKBY0U2W1+/qOZ5m0kf8VpQTIzJ71Ky150Y=;
 b=o8AH5sQ55kFXeEoNyv8rtwdJjgfZILyRFrPCxik5UZqbqiKK7uVx8KdzNIxVaR4qPkpJ7zOB323SInWl0v7S5i5C7BtYWjeZ5SuiaZoAcH8CpddZ62sg2/b5VEjzsPyG6HjvknUBr2hCKkyMyx9EYObzXvia+0O9KIK+dfLL6tOloWdEyGy0KRNS3El85GQjNBoceQElsgn2oMtYtUqTR60W5gvn5/YmGCjdcCjhveX8yYmGNvE1up8uzTJibGJFFMIQ1fubjNcreZ6TeLfHqYmXDmYkA/txl4jV8Eg7eDM5iVGuq7hJ0MQAImMtJvtvFjRwQiZR/Fgv1KOMx9SE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 08:40:33 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 08:40:33 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 2/4] boot/uboot.mk: new zynqmp pmufw embeddedsw option
Thread-Index: AQHbay88Ve8J4p70k02V1wwxe6Nc5bMf7G6AgAD6ZrA=
Date: Tue, 21 Jan 2025 08:40:33 +0000
Message-ID: <SA1PR12MB5615DB0649E75B9C9349F308F0E62@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
 <20250120113405.3938838-2-neal.frager@amd.com>
 <20250120183321.2dd343a9@booty>
In-Reply-To: <20250120183321.2dd343a9@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH8PR12MB6842:EE_
x-ms-office365-filtering-correlation-id: eb725fc2-cc52-4cdc-fc74-08dd39f744f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XbVQYiCaZcxZ9tOQ4kUDfu59siP8l7fJAFR5ffPCR0hjO01LeH448XnAvrPt?=
 =?us-ascii?Q?FqauP5Yx5hf+pKPnuh5hhQhTE92FVFu0SDKXWiH/i+Emd9/pFWfdnp3kA+XZ?=
 =?us-ascii?Q?lYAxZo0Zt8zCIfJ8OwN39VNr6zobzOixrzfuBRtjtf8As/rPXyeRLVXm+gJs?=
 =?us-ascii?Q?OsRgRSQ2Z7gnwwApIHHfCYUtApEApts7ouqwHlOXgkbIzJ+mWcFau3w+Tbx+?=
 =?us-ascii?Q?RnUGHL1jN6brVZtbEYUzZWmrgPYQV+mCfti9TjkrItyAdkEeVwifFjotI0km?=
 =?us-ascii?Q?V0UA8Pli6oKkBPNbKrkg460qWBb3GR3QpubRPGfRmi88DcIwKHXniQNaTaeW?=
 =?us-ascii?Q?3fdZ7wWVFgSF9AbWb1sXgAN3IcepXde9hMsVYUAwDgu4ckkt+r6OvSt9HrbO?=
 =?us-ascii?Q?iMwvc1oPO9fwyu5/FtzzhcJo8SYiRl8/RLBsOfXH4mCY2Qt0I+6+yL+7svgO?=
 =?us-ascii?Q?GJyLnko/WSKyZ6NeC0Jin3qXcpt92fEpIrERgbehbFnBuRZMoTfkWwxyL3W0?=
 =?us-ascii?Q?L5Z9Qsjbe43HrJYolpctEV7lc5nbyGRmZthX3c/poxv0YQMGYRR3vmMhRkfC?=
 =?us-ascii?Q?/wLAMNrDNDhRH0jjhzH61CHCxsy8JdhxeNRlnuoOVhlyUvlrtUQtlwJgIkPH?=
 =?us-ascii?Q?FS6UXIEIdIwNP8EDoKvPK/YjbEkBGejCsn4MsDDjxQ4hFyWC6hrTyVLiXuNx?=
 =?us-ascii?Q?ksGmWRw9SS1e9xvZyoYJ+/MPCj89JHOu1FUuv1Ec2B8q7szq1re3qwXhW0Sn?=
 =?us-ascii?Q?TukvpsgjXBjpnT10fN4ZYmr52H+6xVhdbqlT4y3LfS+UDQrqvBY1/Own/rdy?=
 =?us-ascii?Q?5pUAakpvIAzByi70iE+oXrcZShiXMjgwC8k6ETJeE6qhWaQ6Be3WIflRBhuk?=
 =?us-ascii?Q?XNPnKc/VMpNu5TL+S9FWGCeQEv+xfntSHFChYOwbiC4iZhL7g5aMbZ2ZWVDp?=
 =?us-ascii?Q?ViIQBfqbEUYk9i8nVZUD25c4MuL2VUxGLB8bRNOKUmwRK3Zjx/+gLqKS957u?=
 =?us-ascii?Q?R83i7N/fz7pj4svC7BS3JYBRc3kR/OWIuvAoNEDYwsTUxgJCl3+YsAdCXgUg?=
 =?us-ascii?Q?olYzTEKj3LcBFWBn9VVkFF/m867QZzeyhKpKcgWltLvAiKIEc1xzLz26vnX6?=
 =?us-ascii?Q?+s+oQzTCvGGEPM6dYvCl0F9AK22hr+Z5aaMPXonViP83A3Aktdt5Mia8cLnt?=
 =?us-ascii?Q?P9rbHKkusYzNU/wVKt4LC0MNbXeM/766mhqGOLsKCSIvSq/MyniaIwdNXLO+?=
 =?us-ascii?Q?nYmWHrjCcbXdwEgD04/kXpQ6HK6UIABtnCdSiojde0GAVlwbLfj6Mzh5GsUA?=
 =?us-ascii?Q?j4QkZtCAAYbCI5cjlk+gPO9DTIIhWTHPLje1e7RTjXEnyTHW438nmEVwvf+5?=
 =?us-ascii?Q?aNl+09vDlz6CsXtytltCl9bx9HhDtyoQB4Sj3/Qj+k5LtwPXsG5tUj7GQ+5y?=
 =?us-ascii?Q?gTrQJQ4M06HGCDRz6ErgUyE7luaE81hFwvHsQTjmXDgFuJtLinqhxaP/0IMh?=
 =?us-ascii?Q?0JM5KOMDCwoTZa8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0d3tEYko+HSl+IfwEr+Advt4IpEbSFjL/2CDX5W32ALzFd3zZwodfDBe5tJk?=
 =?us-ascii?Q?bYFd8QQrPSJ0JEbxYf5N0IUI/Ml4Swd3KrX6aEjaigOPzqfbEWHmFydoP1fm?=
 =?us-ascii?Q?c88Iq6SsrJof8XCHGTRAC4XymQ3RSNvMyjByxzI7Gw6BASlbwcARo4JgEtw8?=
 =?us-ascii?Q?zVmu4zuRl5NZH/Ms/HE6SGuzyh6uHREFHCU2WjhOanaxzE1A4BH9MSPzw4jU?=
 =?us-ascii?Q?MZX37q3wcZQ0htWlhYrQJfi1ct24c9CMXOGBDYmejSxHMwDirQELVN/dpVLC?=
 =?us-ascii?Q?3YCbhCeGjSTELnn0sUaTiBx3RIHNZ3YZ/FUXZVGiIiamzVpTo7VP38dqIuhZ?=
 =?us-ascii?Q?thZb5tMcIdaBKTwV3wyDlThyiv9QGwlKFO5atytv8T2G0dkzlvWnKQG55H1e?=
 =?us-ascii?Q?Yy77yC/9/T2PJtCNhyq4t3H/wHWxA5RWIffsvhA8UMBZl6Dwbe8GWUfUboex?=
 =?us-ascii?Q?V8JEq304UcEbRQRYgxxZVFhqJe23G/JJICGQ/fwdqAvsXRd1bE51rLYxVy4s?=
 =?us-ascii?Q?ouO0G9PY8naa9a7MLMxSEQWHW84eY33q2AGHMG63Gu2v+SPu+ritpUaakZwR?=
 =?us-ascii?Q?DNrmniIuvG6Xx1bEkCkZHKCDf03sbuBBXQVgifDpGdi0IK0IADQtaY7QiG/Q?=
 =?us-ascii?Q?ibdOcPTKuqKFWXhUmBl1k1UNhymAcO1d3Qfwa/5B3a8NHNlo2NXqisM3i/vE?=
 =?us-ascii?Q?M7VAcx0uFrmsNUwD008GDCQ/Qi/y6h0wysXoZJj0TZtOpUUi0bPi4I+tyFrC?=
 =?us-ascii?Q?Sqhrjx87ctBpUSGFKLYYReNN+LsPnKGpxEs8KE2p3SkAomnE7HLkTH8jVQxN?=
 =?us-ascii?Q?XKKzCz2D9zcs4FqbYKEHAsQD7YkoARk/V1HmnR3M58j6VM33u4k9sClYXu4z?=
 =?us-ascii?Q?CPXpOUXbnVuasWMGXtRY9ehuj5dgxd9GdVNTu8egUojGDtZhTgsPT7o8tkW8?=
 =?us-ascii?Q?aJIV7fhE+lclYzd23P5lzy1TYfb4fZhwUC+ILFhLCYSGov2XU5OzmKAXbQow?=
 =?us-ascii?Q?9XUSZerwxfPMtwXdsvF9iJGNJmmPIffvwfPRQFnbFlAcfan5FeNt25TAchNK?=
 =?us-ascii?Q?DSpQb5ueuNyY1WLd5w0TiODIzsArxC7I5CxSbbKDZQe8qz73tX9GJJpMMZVm?=
 =?us-ascii?Q?hsNhSg2AOMsjARboKq1te50Df0LeMVUPw3T1VD/5UuT1aKGDja7Qnl15f6mc?=
 =?us-ascii?Q?P2WnPkL/IvEyAGBOlPttJFQEbPa3fJPd0B0gMEgpAfNjvwagg+i5vhKiRFcY?=
 =?us-ascii?Q?8Fkm61MFurEYzdxfo+bJqM09eAvQx4sUxgjzWM5K/yhuQIfZyB/uq2IMtIN1?=
 =?us-ascii?Q?yZjbl6pG56Zn7MGCEA/cR7PJIMthFFDDOtTVdubrgKLBlafq6rGFz7Ywys33?=
 =?us-ascii?Q?jbpozupfMkapHAYusMx6j/DwQbqmpBOS3vbrw0neBg50+vb4RRTKEThTrm73?=
 =?us-ascii?Q?NCXRBJ3FDaXF7xmzHIvkd0U8oxj3+af6Qg1PbFO4bTarOHEA2ISmEM/Sgwgp?=
 =?us-ascii?Q?i98do9rBBbzM9ZDbaompRk/iEaFUfitNCswkDp4zbjDh2Qk2sxg5FR35HQpJ?=
 =?us-ascii?Q?F0J9RW7M+wjBwBKgeoU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb725fc2-cc52-4cdc-fc74-08dd39f744f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 08:40:33.2578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NenD716rHJzW/skp+0h2Ja3OAH1TGnS1ryKQUIeGfKoEtsOvicdlfL0R5j6G+Q9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mmj3TYbNXKBY0U2W1+/qOZ5m0kf8VpQTIzJ71Ky150Y=;
 b=MUZ2CGaCtXrMalnUo6z8HGIn6Ks16RkSfyXAY+ptXrsFSbzXy+5b/FE3apZwjOOpKLr1IylxlUDYlKPtWlnAG54IGrq5Mq+ANsqymm9w7ui/RGRWWpWG9wZY74SB4Rz02ZTmJVaJ3N+5aW8rSrxUa7SI/ly/kzIL8/PiyVRLxzw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MUZ2CGaC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 2/4] boot/uboot.mk: new zynqmp pmufw
 embeddedsw option
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
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option will enable u-boot to
> use the xilinx-embeddedsw package for building a pmufw.elf that gets included
> in the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw from a
> custom location will be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - edited Config.in help text to fit within 70 characters
> ---
>  boot/uboot/Config.in | 27 +++++++++++++++++++++++++++
>  boot/uboot/uboot.mk  |  5 ++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index b6ac2f9380..430191d213 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -572,6 +572,27 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +choice
> +	prompt "xilinx-prebuilt pmufw.elf or build pmufw.elf from source"

> Not a very clear string IMO, it should not list the options in the
> choice title. I'd rather change it to "PMUFW origin".

Agreed, thanks!

> +	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
> +	help
> +	  Choose between installing the pmufw.elf from
> +	  xilinx-prebuilt or building the pmufw.elf from
> +	  xilinx-embeddedsw.
> +
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
> +	bool "xilinx-embeddedsw build pmufw.elf from source"

> And I'd change this to "Build from source via xilinx-embeddedsw"

Ok, works for me.

> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW

> Not sure what is best here:

> a) if xilinx-embeddedsw is enabled, show the option in the choice menu
> b) if the choice is selected in the menu, enable xilinx-embeddedsw

> a) is what you implemented, b) is what I had in mind before reading
> this patch and it would look more intuitive for users I think. The same
> applies for the xilinx-prebuilt option.

> Opinions from Buildroot maintainers would be welcome here.

I thought about this as well.  Unfortunately, option b is more complicated
than just enabling xilinx-embeddedsw or xilinx-prebuilt.  Not only do the
zynqmp options in either package also need to be enabled, but in the case
of xilinx-embeddedsw, the toolchain-bare-metal-buildroot also needs to be
enabled along with configuring the tupple to microblaze.

Since I do not think enabling all these options in other packages
automatically from the uboot config is very clean, I think it is best we
stay with option a.

To go along with option a, I like your idea of making the choice three
options as you speak of later on in this email.  For options not enabled,
I would like to add a comment in the choice menu informing the user of
what they need to enable to make the option available.  I think this is
a better solution.

And since the custom pmufw location option is the only one not dependent
on another Buildroot package, I would recommend having it being the
default choice, since it will always be available.

> +	help
> +	  Use xilinx-embeddedsw boot package for building
> +	  zynqmp pmufw.elf from
> +	    https://github.com/Xilinx/embeddedsw repo.
> +
> +	  U-Boot build process will generate a boot.bin (to be loaded
> +	  by the ZynqMP boot ROM) containing both the U-Boot SPL and
> +	  the PMU firmware in the Xilinx-specific boot format.
> +
>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	bool "xilinx-prebuilt pmufw.elf"

> And this to "Prebuilt via xilinx-prebuilt"

Ok, sounds good to me.

>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> @@ -585,9 +606,15 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
>  	  PMU firmware in the Xilinx-specific boot format.
>  
> +endchoice
> +
> +comment "If xilinx-embeddedsw or xilinx-prebuilt is selected for pmufw.elf, custom PMU firmware location will be ignored."
> +	depends on BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW || BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT

> This is not needed. If any of those two is selected,
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW will not be visible. The commit message
> needs to be updated accordingly. See below however.

Agreed.  Making this a three way choice is the best option.

>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
>  	string "Custom PMU firmware location"
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
>  	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT

> I think BR2_TARGET_UBOOT_ZYNQMP_PMUFW should become a third option in
> the choice you are adding above. In other words we should ask users
> "How do you want to get the pmufw? Build from source, download from
> xilinx-prebuilt or pre-built at a custom location you provide?".

I agree with the three option choice idea.  I had not thought of it earlier
because choice options need to be boolean as far as I am aware.

To make this possible, I am thinking of adding the third choice as:
BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM
    bool "Prebuilt from custom location"

And then the BR2_TARGET_UBOOT_ZYNQMP_PMUFW would stay the same as before
with just having a dependency on BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM.

What do you think?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
