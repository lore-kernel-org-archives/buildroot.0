Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD5AE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 16:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560A2403D5;
	Thu,  2 Jan 2025 16:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7E-DIiW5FGXB; Thu,  2 Jan 2025 16:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3115640560
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3115640560;
	Thu,  2 Jan 2025 16:22:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EE29F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEB3E605A3
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlImfbGKgIjJ for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 16:22:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::60c;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B74E360728
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74E360728
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::60c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B74E360728
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJFXJloxWrRJA9I3qdo9bHTuVhE9bNdlAiKhOYtV5RJzQXyaXaa7O0IHIzjwGATma0X+ePPynqM5dd+9pSUTaB/kMnL1xJtOb2ZVBpnx6LbXHIgZ3/PAihBS9kuoXsxzo/igNMq7oINsnU1vBUgoNpUtHnvT5ts/AwtGFw33ggU8XbgMDZATDsuvIzhV1sG1IjWdgpZBygVVK5eWLCaBdwzhqVOySlJ1l3AiXuQaSS/GfH4uaHPcEA9StPwKsunAOsQy8G+uk2wmWKFC4Y9rRtgv0PBot72cqvoXndDZajLi50E0ScYUvht15GLFmDz1ncwSbLbMJSGenshdyZK+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4O9WzPB3leAPbrbLdYBR+JamjZgbgalJXSfQtvd2oY=;
 b=A9IGevpW/1YXla6C0GaF2o1br40Kowd8Nf7sYH0KKX5/74mGiJaM4EKtKjpu/Ux0vlrGhKwM7YtX+DyMLqCSUwVQ7BjYHfwkhLk8jGP9ZTB98XNZg4tFf4y7zDOGK+GzYDkgzaeI4P/MYHhNmQrf9RBQzY5eyJqZKALod+8a0VDFTV9aKPpTpShfinznW4pEUBauPUs+gheU7zsDqsckFlD6+bjGbZ9RXgO3iaFb+7gmr8e0B7ag/MxNctlxdt3thu3hbG9KsqFg+aJjvuRl7UlOeBv1YtyDvbsbKCC02umqboNu0FmW5oz7l7/6ozuan3Zo84LNMkraOy4p8MrHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by IA1PR12MB6306.namprd12.prod.outlook.com (2603:10b6:208:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Thu, 2 Jan
 2025 16:22:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 16:22:24 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 2/6] boot/uboot: add qspi.bin file support
Thread-Index: AQHbWTj2Szy6E8cujU6AN8eHdio3W7MDnpkAgAATl6A=
Date: Thu, 2 Jan 2025 16:22:24 +0000
Message-ID: <CH2PR12MB5004C64E3F8CA38FD945345DF0142@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241228145818.2211273-1-neal.frager@amd.com>
 <20241228145818.2211273-2-neal.frager@amd.com>
 <20250102161056.23d9a2fa@booty>
In-Reply-To: <20250102161056.23d9a2fa@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|IA1PR12MB6306:EE_
x-ms-office365-filtering-correlation-id: 242a9e2c-26eb-431a-5df4-08dd2b49a438
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?e9bao7Bp7sqHB6BkYbLIxRmzLTPrSwPBOqjlQ2fJxizU4mRRhFnvoYcm5Fyg?=
 =?us-ascii?Q?pNmDAK1JYwzKtCXJlWKFFZHigPx3nT8SmwWxrpxQQYAuCUpXnJvARQdeZQa2?=
 =?us-ascii?Q?ymk7xz/HJI92oK/dGlYrs3VBzMPesSyU17oq5uL+AfUqZxDiKvpTLO5cv4DN?=
 =?us-ascii?Q?5klakhaDJz3Iba1c9gcbkTg3o7NigvMkRd4994xp8OwdG5dLz4pbjyRbvzSZ?=
 =?us-ascii?Q?GCG+NJgLCJc5nF7/V9q7SJ6vPVGfNFGk94rMe20ZQZUWETc+/nPdVufHLj52?=
 =?us-ascii?Q?bBeQatBOthGqicXFLNUTpD5eGlFXJ52KUlXgJf6Cx5sjxGIrOZGQAUgx8SPv?=
 =?us-ascii?Q?F5jMVruYi9bhz5iu+KQIe9YfLQbai5+IqJ+7F5bFR71kEl6Knbkmi4oXgdNc?=
 =?us-ascii?Q?IHCOXiS1bNO4YXi0qFe5xarajfbE3Ndtdf7qNamZdFrqPxWyEYxYvi/525UR?=
 =?us-ascii?Q?aPrMPssh3nShdF7nfwWkcz6vIYUlXFgJabJFC5zr89Nh7h2L5uCqsHCHdjjX?=
 =?us-ascii?Q?eTB57zaSKar8dcslw2eZA7INdMB+CyO1BvwhVx39gksWk+WM5aR+Ggs9NziD?=
 =?us-ascii?Q?pRekWtcXek9y4fR3L+7rFyEXXmrAqUbox3J8xTSWqajwsFvFbtFap/iRtT/+?=
 =?us-ascii?Q?CknVUaqrT5ZYmq6idbOYoX8LklDoE6YLpba3+d6Eg/7meQZpCncLSiraith2?=
 =?us-ascii?Q?JQqW7IeRT5TBwQUh+Swm8P2cr3Tt2Z+EXmrWmGusJOSyobjd6SerQqhVPDA+?=
 =?us-ascii?Q?cy2osxpSBG+S6ZZKQnsDsS+4nBHasNGBtLPI9Z20QSfocDNPiVvKgss/FajD?=
 =?us-ascii?Q?D7nUrJdfVWeAwMMATWv3ozh5cWs5gc+AP9VklzIbgcud60LOBeytIy2fYxo9?=
 =?us-ascii?Q?8AbdIjFm7W9gzCgioGPj7ViyS8ZAjdSqBKrVvlkNKNluJf0rziUiE0XFe80Z?=
 =?us-ascii?Q?Ay95HVVkzGYyfp/VVOrGFhhYafDGtKWFGdSHDqgVeX8s34I915OX24ln7TAb?=
 =?us-ascii?Q?FgRUrMYm2tibnZtx7MHIpIkGtK3pVMWWjF3PhQkjo3PZmgmWU8mNkCAeEeQg?=
 =?us-ascii?Q?Bae0aI6W0b7at0NOIZTXPTJLsYSlYHQI41NXYTkftW0RNpEdUvqSg1e4RBGv?=
 =?us-ascii?Q?ounh8DQTPARt+Gdv/JUKYOM+ktbFeRxvyQuZwUa/uoF+wSPlJUwYfCtMFHhy?=
 =?us-ascii?Q?TLlaVegjxpyRiZwbAZxDv43J8Juto/lND3/SS3ZR06J0Jb7I55tK0LviA6sW?=
 =?us-ascii?Q?QeGw+gLaIaFw6Y6UnD56IBrOD96JnKF8BxB17r0KlgtodFqEfE0RUx3UZybX?=
 =?us-ascii?Q?G7pFy9WSfPWoteWLXB0rWLYxf/wAhqVH0YJtvFwWHiJD57k+/uFmtnZlZHc1?=
 =?us-ascii?Q?GEbJNLj4Hagc7UhRBk0dQbDdKRgfoqqA32dfmIEXGc7eqEJ3FnQ78YltiLr1?=
 =?us-ascii?Q?rUkRcZoYN2A1qyKGEw2Ud6JLRl2HhDlozLmIz9RuBAAX2uU7v7qErg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MDOWegGCwYu4xTavWtGAZ3EcUC8DZVz2Affnn2WGlwH81IjtnW/WKcHiPaAg?=
 =?us-ascii?Q?ehcsoIW1mjxhkxkbLMDFv++WQZxxDmgjy0PlpsWF21qiewIkWrfWa0sG270e?=
 =?us-ascii?Q?ORCzqa1TVtwGb4aMCWGkR87LdkXBcazCiUn+E0D+k4Nx5m9rrxfobPws8Gth?=
 =?us-ascii?Q?8a8VoDup4h4nlApXOTTgCL4W122xDjUKBa+pfFtotQUzMly2RcH/OyXC5B18?=
 =?us-ascii?Q?p7dBVH/TG2u9Xpkiu4NXuZqvaKaVl+62scI1CGjTg/WQwLn0DabTDjO4Nz1g?=
 =?us-ascii?Q?mEUHmZMlEszdgG/7wTK7oYvHAZgQwUjFIqMMltG2/mlptEe+2xZUfTn564Tn?=
 =?us-ascii?Q?jXtluDoDNcLHbg0FtFKH936UuBz+dvvnuCo0Rk9kYsLH8dAmGKFwCtVZ49u0?=
 =?us-ascii?Q?cOyP1guIAdSWqRFLsEd+VIxwLMD2eTde2ne8HIXVu8l3LrSZKL9BSbkny+a+?=
 =?us-ascii?Q?b8vmxgeBzlWJvwEKOanB/wpS7dVxjbFdvcmg0U5213ps5Ed1OQvsk5tl+dqE?=
 =?us-ascii?Q?0RUUL5IARVHtBRGNtluEFfeQZ1eG4OtKS+55qZG795ybhzwY0M7v+Bi93/fP?=
 =?us-ascii?Q?E8O9999bi9Uoj6bG3QzLSpKZp+70J+FKpUA1Npra7SQmgwFnpz78AIRumCuG?=
 =?us-ascii?Q?QVlnOJMPmS5XOoY+ugFsURjqDpbywuSF0BvLqQhnT8uNFbwDTrMQBurIzjyP?=
 =?us-ascii?Q?2Ufnyb9sdZBVL3fcH5lLwtRxWd7P1LylKfPshlUihurgR3JXCCZcKBdLyXRN?=
 =?us-ascii?Q?DNwYsjwtB8j8uwHr+FUzMOsXoXIV0ZtPZRhsBmxEEghIWVIu/Pl/lY6x7lHQ?=
 =?us-ascii?Q?Re515qZfVzCWVYHep918/ePDaLvBNpbe4dv6Y1WDHXZcD0lIqcwOyVHGuxC+?=
 =?us-ascii?Q?aiyCw4y4lV8DMQEpTLClgYTEeI9LseNf9WCjdoZ4DjSvM+lD+h5kwrj5WYdT?=
 =?us-ascii?Q?05WeOgbDd+33b3wNSR3Zvdu9Sn1Hf5FUS9HtDc2r1iSnSiO5O2eYW/aRAvAu?=
 =?us-ascii?Q?vGpmqWZVwszn55QKX8ljaRZcqIgw0D5OxZFrxSIsIllSTIC0vHXvsz5/4x1x?=
 =?us-ascii?Q?WapKgbJ5M4b8ndt2XeJ8VTU7rUuvHqnFs9FKzvBUa7fJfFeGiMXBY68hTNMU?=
 =?us-ascii?Q?fokIlWPEXHmx5InYtcmbdthL8QxkTGHMMli6nmL/+sUqLVIjU/yhTKxIZVqg?=
 =?us-ascii?Q?A+2SfnVuSERhrWwkiseUKR9kdLY30IbiI2Jcum2G6s3hmi93+TGd35Bytzts?=
 =?us-ascii?Q?rks1KjJd+rXejPHTkPG2uBeAvYPQR4aFfIPApifp6kWlduzQ/ZeENpY/KsYS?=
 =?us-ascii?Q?K+fCm3jpqvMxtQbLM91urxf7/jsffwLpdKj0cgbh7g/7/eszNtYBV+3zxof6?=
 =?us-ascii?Q?u56yaAgqgv6kxcTENblsB3T3G3vSIEu6vho6Xj3d+sslqGFLWbbkj5ihSLKf?=
 =?us-ascii?Q?9bio7oOyj8ivDfBk50NiXp9RJO0OllAW/TOZBul+I4Q7kuesydydVQgGBZiI?=
 =?us-ascii?Q?zMQRdf0ghpQxt84ljIPTyqDrepk5Jb2HqxwO6eKftvV/FJJz4OMxVv8K/B+2?=
 =?us-ascii?Q?FjNx01RCaYfm+7Z1zxk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242a9e2c-26eb-431a-5df4-08dd2b49a438
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 16:22:24.3664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOzdadyacT72fuLy9ezibP2GTf9WqBMz8nXhqb60d3dzgq7HnxRvCRDhCLOP1qXe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6306
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4O9WzPB3leAPbrbLdYBR+JamjZgbgalJXSfQtvd2oY=;
 b=uu5Ml8RjjN6VUn7VB/S/b4MO15nZlNesuboMYjOKdDhI1pTE05JwsNlTwZjHQficTIQkh6UdIZsv7tU3mUQwp0tdfpP8pbS3aGyA2dsu4JZdlE5nXwYGPKn4G+xSwoYRt70si9KvQV+eMcbYjtObNGE+AzXDgxYbGDnksm61wDU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uu5Ml8Rj
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 2/6] boot/uboot: add qspi.bin file support
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> u-boot has introduced a new file called qspi.bin for users who boot from a
> qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
> single binary that can be written to the qspi flash.
> 
> Here is an example of how binman generates the qspi.bin:
> https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
> 
> At the moment, the qspi.bin is only used for the zynqmp platform, but other
> platforms may adopt it, so the buildroot support has been made in a generic
> way.
> 
> This patch adds the necessary support for buildroot to install this binary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - added dependency on BR2_TARGET_UBOOT_ZYNQMP
> V2->V3:
>  - no changes
> ---
>  boot/uboot/Config.in | 8 ++++++++
>  boot/uboot/uboot.mk  | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8648d6eb7e..2946aa7251 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -446,6 +446,14 @@ config BR2_TARGET_UBOOT_FORMAT_SD
>  
>  	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
>  
> +config BR2_TARGET_UBOOT_FORMAT_QSPI

> I think we'd better add a _BIN suffix here:

> -config BR2_TARGET_UBOOT_FORMAT_QSPI
> +config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN

> One reason is being consistent with other config knobs naming as well
> as clarity. Another reason is there might be a qspi.(some other
> extension) in the future.

> With that change:
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> [Tested on Kria KV260 starter kit]
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> Luca

I am fine with this change.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
