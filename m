Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E7EC7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 12:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC1C40995;
	Wed, 18 Jun 2025 12:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLLpYxTeZSzZ; Wed, 18 Jun 2025 12:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF602409A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF602409A2;
	Wed, 18 Jun 2025 12:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E4F416B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5014380756
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjAvgHowZGNs for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 12:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::60a;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F7858072B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F7858072B
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F7858072B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jidwSZgqpYqrmYiBT/gGrHc3j2nEIM9MyDOPrRR61lvHt/YMrss6ZbOTN07rR/S50gOC+kZiPR/wrgXTMmR+aiX7ZnOMO81aebpUAUW/pbflZcwSX05EGcHl+g6QLSeibalkvjb+C8Mbot7WrjwudIx2bOmuahbWT//pjgmRM2dvZoW6sjNMurW7XqVm47hMdSDO2x+QlwvLwVGaob/5LU0vortEICzx9CfAdTFNLqJUsOKF4M02IO6ozHWaA+prDOXdqlZ9Hg9fBgWFlnhGdizjsv0GR4U8BZTNktK9lT4fVQMjS4NCNjF4ZUOxbBXkMhDTqRSyRdVqa0lMOks0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWwvT9KSbgGykswKxX5fAV8VIuvSwnIlXJIl8OEqp+c=;
 b=Rjb13QOBSDHWCG00e/RaRJ7xEN7eKHaFfmet1En0YWWmQ/pF79AEdTHYnkXjLMRnjNWUps/4M6qiM4woGI9XX2odicKO3yfMTZn9iRqw3eU0/85i7U+2vzk2AoT3uzJO4gwGK+qL+RsbNd2utaLbRe93CYKJCJiwaEEeougk0zh4tfXP75wGqwDZm2W40oFPGYmkLdAJsnDw1/LGb8m10IyRuGxLB7sjIREDOApsSsl242YA3rWXEijVlitnJ9xEXhC/yXtlYGhBO1ObIrhDcjdTVeyQX2eir/F871Z2obfOCwCktJSoKZtP5HFrUO7pTajsTIsvolEAXLvHsE9+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 12:42:43 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 12:42:42 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 2/2] board/zynqmp: add custom board documentation
Thread-Index: AQHb35JeZnHrdbUaTE68vzgNvTK/l7QI1QGAgAAH21A=
Date: Wed, 18 Jun 2025 12:42:42 +0000
Message-ID: <SA1PR12MB56151011068D941AA4840C62F072A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250617141534.2074877-1-neal.frager@amd.com>
 <20250617141534.2074877-2-neal.frager@amd.com>
 <20250618141109.3dff0c99@booty>
In-Reply-To: <20250618141109.3dff0c99@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-18T12:39:16.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH7PR12MB5902:EE_
x-ms-office365-filtering-correlation-id: f3f9b6c6-36d7-4f55-b389-08ddae659dee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?M60MC7PJaGmrh+wArDQlT9wGmi9E6Ike3NcB4GsrcdlkgSOvAbOooQG3Y8jY?=
 =?us-ascii?Q?4jsm+bP4cTZXfyObBJMp10fO3jv7GW8Fax9EFtj2Cwm5BHZQD0HrybQLbi6C?=
 =?us-ascii?Q?+/1DvG2fRanvrVTv2emosHClZ65O9D9t4CA+A8MnmMl4Vy6u/ZtR1I6+TFVx?=
 =?us-ascii?Q?/x+9VwntDFFP9qCl61L31XAxszkydwnmyjUccPhKRUtSftwOuT8P2TMkN7L6?=
 =?us-ascii?Q?5qejyZeR+vwDeacUHtB/C9tT4i3OPZJCJXRHQqm11lWIUN3Lf/OeGOngVDsL?=
 =?us-ascii?Q?zs5xH7Jm8nRKCS/3+fngzBbwiOjreGvL/nkgU+jbS1BnprEwDSL1sFgZL+wX?=
 =?us-ascii?Q?Igx0m+qFQ0xoAbauOIlViYu5purigcPeE7kWvUBP8BJd1Lid+zX2VzvhCfH/?=
 =?us-ascii?Q?nAoMi5QP9f4Ah+RSuvcuX1fFtP2BLpLjXyNE6zk01uw5iHNmICet93y3BD3w?=
 =?us-ascii?Q?FXfiNj1bSKV0ay6uu+jaPVU4HfmNNTQK7Y+PRDhD2aUIdJ98ZpZjgK2HZv+G?=
 =?us-ascii?Q?P1KJLUJ/E8sd78CU3lTmFmuRqD03zakiFtrLvOvLjWcHrYjQoDX7RcyJqXDZ?=
 =?us-ascii?Q?IT7qhM8GOXqDm4hi3I3BK5XEW9uPWMVPZNzDAUGyXWH1nzoYbkc5idMlcyCg?=
 =?us-ascii?Q?U5Ez1ewtLe67vMsIngHGOlGVSToCliSg/qAETwZIePu00lrLAuPpe5L7d1x0?=
 =?us-ascii?Q?WNKSKuoAZptcubFOabLpH/eij6goftYwjqwbLmRFmHL92eaVOuHGMxwZH4+z?=
 =?us-ascii?Q?zmYYOqqbYQ3BR3sb1poiVCfZ+jlXgmXYvrxr3iqNuRQGMvr/f6xMINoXXg/i?=
 =?us-ascii?Q?ZuGKnJjYlPvEsfMvGwixZPLfQ7uEgljOZAnEK3mZdipwwv0SUZHXZjWuIL7T?=
 =?us-ascii?Q?+2QMo4upbIpOI8l3KQscpCnpeOBrNAQ74GWADYCpQrmFRvsle6M4/YgT352G?=
 =?us-ascii?Q?Xh8xF0Q1PzOGQqf3WvYsJMeWHYrMNSU50nHbd6EDyd78Q6wkh9cY2aukIC4c?=
 =?us-ascii?Q?+RhlgDPtDcb6BWLq4bnVZlHQXbiq2Mvz2mRbZHNEtw7GGxSAz7aBfM8VbHac?=
 =?us-ascii?Q?MfBd60LrCH1t3XzWkM7WlQ9U1eK5U8gGqQKMMgqEPys7X5f1XPkJu24ZK5qw?=
 =?us-ascii?Q?7B6EbcMola3G5Vqn1J28rgbCOZE7BT7WDDbqB4U3kq8+CUkYndVummcNwmQn?=
 =?us-ascii?Q?HmQwC0x4ASpBSpd2YRk8SYrdrURbVByUuMNQp14GtT4XFykSYUJ1EkpE9da4?=
 =?us-ascii?Q?RxnGK8ejx65zei9CEaWdvV3wEcAw0I8hLVoz9SKUCFLCu7yZQJFc+PsA7zN/?=
 =?us-ascii?Q?K+rW1RSMweVVWZyjXy9SA4MEUrT5oN3HND4b9i8uM8P1bthu7sjWtdPLz++T?=
 =?us-ascii?Q?XONTIoRyStqNh06nXrJmQGPgngzTdhBY4l1ISNAkMY4dRjnqeNcM3eQGXvLt?=
 =?us-ascii?Q?8QBpWtAKbg4Jt8/evLMFYLueDfjbxNTMVQIVR+VwUBfozaoFKtnZbrB03hPO?=
 =?us-ascii?Q?ESnEQLO0qz4k/sUYLkNz4lz/iWTy/dVmbFzk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QxK12aEn4AARicXNssNJDkhbU6kPy9dgREXm0YH/OtiQrJHFHPVIT4TtrN9f?=
 =?us-ascii?Q?V1BaRA4MAYBN3n1n6/K8CvG6C4EbjC7Oxijnqls1e76H1/Q7cWwUwkMSh5wS?=
 =?us-ascii?Q?ZyUEiTt1mLRlZQG0yaccpZBnrKw9qDxWpDB1JAnboyTVFytH1hGLFQUu9jlN?=
 =?us-ascii?Q?UuN8gZVHSBIZe0v2YmwQKCahaCpsmeL+Ad57TcEkhL1vVKLnysojsl9p2MdP?=
 =?us-ascii?Q?LJ/y5ppjhLlE4/h8Ezq0YoWxxqzGL0mZQgw8Qk3QOgbkyziFvTHgvMkB0wwi?=
 =?us-ascii?Q?p+g0XD9vh09JXf3iOGbZxqjiiUiPUBvdOChGVTnRVyA/JSb7QpK9ooZ7cTA/?=
 =?us-ascii?Q?FAU3dySvRRTpWHTY3DMWRjKd6Fumzs3thFmE75qz52YLPlQSSgib6naLAHmR?=
 =?us-ascii?Q?arViZpbPOXKdHg5i08zXgPAtRnebMIevSPUMyUN7h80DM9eA3+okTBRV2sFV?=
 =?us-ascii?Q?If9AgUnyOtIqNv8EAC8yiFeYyfnSwrFroquab5TPpsQusDUmGcWc8X2N8gIU?=
 =?us-ascii?Q?RFy0d5JrTQ24azTXuPxokhXWm+doxE95MZX3muC1L7QnqWEO3j2e8xNFBSZq?=
 =?us-ascii?Q?iqshDHAdaW4b8yZ0Z1Jh87TZy5S4+F8xnPM48BfHlkZQHwqDTOh564SZv5Y9?=
 =?us-ascii?Q?pS43lkFK64bYBO6PrYlQifkPswMvoaP65Ing5JL9sJDAqrnRadhpVOBahWJQ?=
 =?us-ascii?Q?pIDF0I+Gn5T1sh2KPFjrUpViVcMg9M6ekcJX3ru15rXJiNBc0j062Tp4kHdk?=
 =?us-ascii?Q?OPrvyElcKtjHasZ1V6VSBoXB7ku0Vr7i1X2gnIHjlzTckb4wWKNFTB6JMGeM?=
 =?us-ascii?Q?j5HEgJnzTWHVeriZyEJr3wBirjxr72XxGCPWEOXSltbyu8NWCZsxdk8ft144?=
 =?us-ascii?Q?IyARu6Pp+RE7xu6rDaw8Ezk/Pg2quPkJ+701lwUkrLOAwzJTfv/4G8GWZC1A?=
 =?us-ascii?Q?oFXf36rR9zoiJWPgv7DIeaNmkeZGkFPcW3bDkA4DOLIhX1uyKaf8LLFV/cZK?=
 =?us-ascii?Q?hh6Xwoyjy9gbA4nRbMYjkmLm4V6nPmompgdbu0V0vYFvPQaCApJL5NV/JrSJ?=
 =?us-ascii?Q?X6OGbwNlBVMMNg0bteUG1huYBQVTFNKe/TR5U5LXrpIpbPkISs7WVnAOWu4t?=
 =?us-ascii?Q?3bskTqa6XCDcHcAjMwGa5nJiBa/sYxAF3WtLfOq95F1NGyOVPylPy2uK2uke?=
 =?us-ascii?Q?8NPLerh3ITZTkxS869gwyNxe5/tNcjYbpLJLvI3qNKG5B/htktviG7Z7C1ya?=
 =?us-ascii?Q?fmRhIKs65TE5ary4vfPR5tZ8CWF2KmMde7MGbXWDdvDrXICm3oguDYt1BoRA?=
 =?us-ascii?Q?RIQDoACaSa4D58lxdl5ZpYwpZF8TcmuPIkt+QCd9PjzChUiytOfwMX8CDWzh?=
 =?us-ascii?Q?bPgSX7F972PEJUSXO4mekHC/Oi7lXgVE3hImV65uKnt6JZfvoLPks7BWZ6VY?=
 =?us-ascii?Q?+bjeHzYnStwZSlucu+0hYkOv4jLElYHe3rTNKqaFnqpcPQ1dQbg39tyF2Gpo?=
 =?us-ascii?Q?TPTKVDM1WBBP6TmjWVYgkpVVnoR6CzknbKW7T/jbAA4w/C4Qhf0R6WN8BPps?=
 =?us-ascii?Q?0QvhhcfdJsq3zsmqw/0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f9b6c6-36d7-4f55-b389-08ddae659dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 12:42:42.1051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ps0zBGX/EEDmRfhHmjXebanRcfbKtZM/izqqA1QwkgEj0DBthMiXTy0uRTwhVET3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWwvT9KSbgGykswKxX5fAV8VIuvSwnIlXJIl8OEqp+c=;
 b=UMcrMpE1y7uzHef4K5RF6vYAfL8eCarVZJOZD3juGwe4fJ6ScxjWV0OjQHOoQANrk3fiHNOGBUkDKtBheEtx2ipvxcp04UZGRT9WFJQF4WqQO0/j8+FinghcgLlLGpy177P4DC7+lHFQq2b2oAntNnF0ydL8OGOjJT9X0seZrhY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UMcrMpE1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 2/2] board/zynqmp: add custom board
 documentation
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
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

> The readme.txt file for zynqmp boards does not have documentation for working
> with custom boards.  This patch adds documentation for custom board support.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - correct copy paste error as the output directory of step 3 should be:
>     output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/
>   and not:
>     output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
> ---
>  board/zynqmp/readme.txt | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
> index 3f1b3a80c2..a98ff78f6f 100644
> --- a/board/zynqmp/readme.txt
> +++ b/board/zynqmp/readme.txt
> @@ -65,6 +65,47 @@ Where 'sdX' is the device node of the SD.
>
>  Eject the SD card, insert it in the board, and power it up.
>
> +Support for other boards:
> +=========================
> +
> +If you want to build a system for other boards based on the same SoC, and the
> +board is already supported by the upstream kernel and U-Boot, you simply need
> +to change the following Buildroot options:
> +
> + - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
> + - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
> +
> +Custom psu_init_gpl.c/h support:
> +
> +To generate a working boot.bin image, psu_init_gpl.c/h are required in
> +the U-Boot source tree. Without those files, boot.bin will be built
> +successfully but it will not be functional at all. Those files are
> +output from the Xilinx tools, but for convenience, U-Boot includes the
> +default psu_init_gpl.c/h of popular boards. Those files may need to be
> +updated for any programmable logic or DDR customizations which impact
> +psu_init (clock/pin setup & mapping/AXI bridge setup/etc). See
> +board/xilinx/zynqmp/ directory of U-Boot for natively supported psu_init
> +files. If the psu_init files for your board are not found in U-Boot,
> +you need to add them by yourself.
> +
> +1) Start with a defconfig supported by Buildroot (e.g. ZCU106)
> +    make zynqmp_zcu106_defconfig
> +
> +2) make uboot-menuconfig
> +    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
> +
> +    ARM architecture  --->
> +       [*] Zynq/ZynqMP PS init file(s) location

> CONFIG_XILINX_PS_INIT_FILE is a string, not a bool. But this might be
> irrelevant, see below.

> +3) Copy psu_init_gpl.c/h generated by the Xilinx Vivado tools into
> +   output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/

> Ain't this automated in Buildroot by
> BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE? There should be no manual step
> needed. Am I missing something?

Yes, you are right! I completely forgot we had this option already included
in Buildroot.  I will correct the zynqmp readme.txt file.

Out of curiosity, why didn't we ever include this support for zynq as well?

> +4) make
> +
> +Note: The files in step 3 will need to be re-copied after cleaning the
> +output directory and at this time, there is no way to save them as
> +part of the buildroot configuration, except as a U-Boot patch.

> If such manual step were needed, that would be a huge hole in Buildroot
> that needs to be fixed.

Indeed. Thanks for pointing this out!

Best regards,
Neal Frager
AMD


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
