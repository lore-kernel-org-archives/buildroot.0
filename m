Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E62C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 06:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E6F409E4;
	Fri,  9 Aug 2024 06:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGYVv11uuWYg; Fri,  9 Aug 2024 06:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C005D40C7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C005D40C7B;
	Fri,  9 Aug 2024 06:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1461BF294
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 06:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A65E80B6F
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 06:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSvcu2WU4wYp for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 06:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::605;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEC4680B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC4680B6D
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::605])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEC4680B6D
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 06:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmqExr3LGf1q4o3lJI1sF5pX8eRy8W1Pow22LDJr88M5SsVdJsTquZYh/kO8n90bYr9jKuqEkmV6AkBTuJq35gjWk08Gb4v0jpcZFhscwgm1DYwTUfpfbFnvrUfQ3ASd92XZ93sbLBzRccH/oScXRpTOIroPa+lrBsCRXX2U84GlzdM5j5IqoZWL4mXEdXIhjAOebJcCqENlxPqWzrc+g6tKk7utwDtNdv2Sbc5y35nYm910ivUUMzxdTYl/SiGcYuIJZzUTnXs1aZlmwTEiCtZB4u8OMTkB+v4LJPTk1WMGlZGxqEuavGSSc6iKIJvoSzs+ITtab9HET9yH4qzQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSWHVIkG6GSQufXTcn2QYYGYec2AuAR844ON4qxHVeA=;
 b=WW9rDERzJgqE4x7VFeMcsKasx9FBUmVtQuyx5/DEbwn+cYKP+EiS+LRzPtu7OoVL5BirHL6e1STyvPz1KjZ+xPwGgiOG49WqLs7+FTjpRXYMbBCJIwKj45mJvnvs8oZK4EkPPOHXQrtM5upHDg79WG0SfJF7v6fgjRPm2x7wfISxD8n6g/YImytR0TaGnymKwQXrKZAmgnrlblAvCvRMpFBw9ml53Z+A1n/a2F7NeHZ17XOdb1ITkinZoE7QR+JWbv56y8ag1U17olAFGN5Z6tIBUOEKh0kkQc5jaZDcXs7xSxQpPK7Uy2qMH4/bpeDO3YksMXukHlHgR11MMJ/KdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 06:39:45 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 06:39:45 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Simek, Michal"
 <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
Thread-Index: AQHa6ZYqUwxIqu7NiUuHr4S385pXN7Idw5SAgACEs6CAAC+6gIAAAQ7Q
Date: Fri, 9 Aug 2024 06:39:45 +0000
Message-ID: <CH2PR12MB50040DFC5143682676ED6B91F0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240808132318.2473585-1-neal.frager@amd.com>
 <D3ASDF13YKH7.1L058LU6Z9LD5@collins.com>
 <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240809083013.05d0d0fc@windsurf>
In-Reply-To: <20240809083013.05d0d0fc@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6930:EE_
x-ms-office365-filtering-correlation-id: 92892028-687d-4403-e6b8-08dcb83e0ed0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?NI+/udHmc4fp4LK3bVJz/5fRsGOwAlp6jkYb8czqIc7RmuG9882gCsNzlzNA?=
 =?us-ascii?Q?BZIT3v2dUf0Vgu+jHjIEwj9pzn3jWPURVyW2MPpyOj+UGQgLmJb2iIqq1YdX?=
 =?us-ascii?Q?3GpTvLA9uPN+tT/8UnMCuUd0/F2z2AsvBNkJG/b73+x9sQxPmopnuffQhmB7?=
 =?us-ascii?Q?9lHNbHGytlFpzXRvcnLb3gRMHrtKHwItnOIU50dUqa/DpEZzDhrqW7sMaCL9?=
 =?us-ascii?Q?OL5Y4uybK/RjmMiAvm7kDIOsgKspTSK7AlOl/atrkj1JZVoyk96m/H7xJ8Bv?=
 =?us-ascii?Q?stxaJgO4k/BvchNd1XTkBnGXQmDelmkzPJYmhCTZWeoYOG1i4oP1E0e64k8/?=
 =?us-ascii?Q?2UhSS4QYzIQ09nsog2NrAPdPbhFMx34qZwIUPXYEGmu9yfM632rFqZg+UjL2?=
 =?us-ascii?Q?mnhmtGGwiJNMe3pK5IBuJE0hRG0ikraj8YdEcLneoXfE0GiWYr4BhEHsGObJ?=
 =?us-ascii?Q?Z9L1iVwY5Ec1N4QGoVLZ9ZAD4k6HQOxTc/3yCgUE/qPmGUbrf4KQHmNJbSG9?=
 =?us-ascii?Q?VhVZpxRk0oHz5rtaqSQNbZ3JrAtBgYuiVkugtPBkn0OF8HSBv5WHej3GRbDv?=
 =?us-ascii?Q?NtZxxMqmpFPwlrfkCw79DEFwFymJoutC6EsP7zfUJM9rs1UCGBPZtlmCyxlh?=
 =?us-ascii?Q?IOyciqr/tkuDby2CGNmJUV0SLFf5a7ewEwyOnZSbZYxyVlmPTtNKcxiZ3tIW?=
 =?us-ascii?Q?jUA17J4AHADXmh0McxfrUFlLZFjbe7ByvTIneU5n85oqlNkokyYRZo4kd/23?=
 =?us-ascii?Q?KQIzTD9/E3thC351o8s9w8cQ2UnwsdBjEt4pWzqVUwXj5iT4EyzsVGrrFEar?=
 =?us-ascii?Q?T/ZZTs6VHkziI3fSFxODzPy0Uv+pWXGpL5lRdR61V4UJvlkfQvJIKSGFh6Z3?=
 =?us-ascii?Q?IuPgTxxCGeXGYvlRVIWFCn+BwzD2DNirtZJkYtmAHToTnagSbHQS3wsk1cWQ?=
 =?us-ascii?Q?BLUKniKX3HVQ3829lAPFCFN8a4eg9gbJTlQl9bmCOpOwyqph8Zz1TCs9ul3x?=
 =?us-ascii?Q?EPhPyAPkgSf65zGlIK1zOXpz3os/S3UsY40zctbSSiMwV1bB18LQsF02E0Xj?=
 =?us-ascii?Q?Vsaq3EJDPsfx/QFAaMEWclBHEvYwhPiTh5DiUu0ume7IawnCEn3+cax5GTI+?=
 =?us-ascii?Q?SrR6nk4+yn1XXJnT+GBpoCr9uESEGllRNPNdsHP6GuVxmZlvtZ4PiTMVp6av?=
 =?us-ascii?Q?jD47nKAWKpkiQAzN1b3O0YEOsOzxSxqJuqgqc5cDVev8ZopNZeb4b7RlLVdC?=
 =?us-ascii?Q?j1evp90CvSqrvT/kiz+fwj+oZgRJGydER6IfkqnSR8RVCclWyQMOl7xBx7fo?=
 =?us-ascii?Q?5KBr1ehE9KISpdYFmPawTTnzajheXKoMHwl+SAAxM0E91cuaxJMS1oYAiFZC?=
 =?us-ascii?Q?k4GK6RJrM4d5EXRlICfXEQmRNxEex9+QG6/DwDH/4yzCnWmKuA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y+Pp/RNpO2/Hv+7S/e0rhDRvEmtsxWH8aI6fdxM06lt/YfsTTlHkFvHbN+lU?=
 =?us-ascii?Q?2go6PN3d4rpIEMrSsvd0LFW4SYkVAVeh2U17wMZszRQlxJNeJnf6jbcppuS2?=
 =?us-ascii?Q?0tvmMwMHl1m2n3yoqkbzrtCeIZ17kqq5wGSw+JUrtPwz5whw7Wp97sgxiTxE?=
 =?us-ascii?Q?PjkBCFgJ3r9MGbP4RkLvmu7nrpnCioh9O4XIG/fgs0O4/XowgOWrf6CY1oO6?=
 =?us-ascii?Q?vAUyipbq6rRn8+mDY//G8lMCNH36gZpByw/1IjjKc9vOhxdXHdLwahRFpE8K?=
 =?us-ascii?Q?/zZoHhJOhcV3GEzmP2PhQrNQHXY9Pwxzzzr+X7do2ZGDSaBYnFkR63W1MHQp?=
 =?us-ascii?Q?IlVxHE18rqWox23kx6mnquKJFms+8jdMSZw3D84HimkOV9CZspsBDAHCCHOZ?=
 =?us-ascii?Q?7PBKSkGieQx7fh1PRMsXX+YnbPZ/atuw1P9X51ECZIjIu2DbCG2MRYH1jg5I?=
 =?us-ascii?Q?CtiowojsUIX4kNOGjog7e7vrawtJq2cUxiIvPVS0wy4eLlKSQqCcZ+xpvMgx?=
 =?us-ascii?Q?p9z3IIdAVUMPGniVGw2E/c6bqtoOKfXwUBBjK1tdrg70DJBkveGiKHQBeqvd?=
 =?us-ascii?Q?Ocmz8QUl1nWcDAGYBhllQ3bAD6+XrkLnF3CSHWavNyP3AtVg56ArbzkOjCLQ?=
 =?us-ascii?Q?gpcLBLycoJs4oHsNK6crbgQ8/t68n2y/ZEe7AHF0wvuVeRBDhQyhkniPHnkg?=
 =?us-ascii?Q?Wa7HsA8PoWMhrleFxAXZpuZOkdMuy5zferpY87D0+obT72C+mnsHsPBrCp/e?=
 =?us-ascii?Q?Brl2+8STq6ffD0Be0Y9ed/MD3ROwi0ZmVUTAc0BhGPbh4Evq2eVUDNLqTD7H?=
 =?us-ascii?Q?TY4tVxqwD/xrDqVPBCTtuQXBsyFMU8cMPV7noIRllPhJhHRALzcj3qedvgVs?=
 =?us-ascii?Q?ZxdXCmlZI95ZqdclXX/E74f/GwjFi7ea2irYo+P1hg/lw4aLK6Tn65EHK4kp?=
 =?us-ascii?Q?1B3jMZ3zlJp4sHacCt6WKhw4bmxVENnpw2lVCqU5K/+v72LCTBnT4xR5Dipz?=
 =?us-ascii?Q?EODpX9rz26rST3WWDY1roIWvhFJ4YCLwC4jIReLfvUWTYIXLeibnuRtVS36J?=
 =?us-ascii?Q?h5gFHT5+RlF7CfETJ+kzU1jgMoWm166MNRgzukuqBcw3EtiOdBk04fzUNkHV?=
 =?us-ascii?Q?n8rm3AjRYD3o8tTDaLExN09GAoLASUubDTLIikLM+jtuQ9KNPse3f4X8iWls?=
 =?us-ascii?Q?PrHdKOtUTWKVpnZXj2GlgHwf17TMFsV3xQAQkMjmdG69titzdTtCCe07JFz9?=
 =?us-ascii?Q?0yIub7QX1wE71liwmDEjRFbCBzAJMlk1scejIBB/F1h21vPi7r/Ck5uE62N0?=
 =?us-ascii?Q?MrdSjxQWdwPximDsbjHlT3EZ8E5zVHIT4rnExP2W5EHi7tzMgdfXT0dPA5+e?=
 =?us-ascii?Q?UHsJ7IuWT3D96X1eUFubXl8jVsmTSmz3afkW1WQHTos7ak2CHvL6CYZH7DGG?=
 =?us-ascii?Q?AkF1Mw2npBlELvKfi/SSP05InJoeJH2oibHsr6URgzmtM8lJJeXvn2JjdR7h?=
 =?us-ascii?Q?CMZEPo/e7cgX7MvqDZxmXshCPNmsN/IBKWTKXdrJV5DjpdIEKCRsysin+NdE?=
 =?us-ascii?Q?b4JtB2dLyxzJVDEl2xg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92892028-687d-4403-e6b8-08dcb83e0ed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 06:39:45.5409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+i+hnQWZLID8xAR0gGGTCZGTMg8zdbypwsAQliB2s/sGmWD1yUwrOJAi751odUR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSWHVIkG6GSQufXTcn2QYYGYec2AuAR844ON4qxHVeA=;
 b=CmJyjk8TWh+10gcM13UfD4oFci8YIJpGL6YhIRTSDg57dKAMwupm4hl5qAplIKM7y1m/37fm4nwKXXLydhOP5tDG+Zs594/WXJaEHdCHFLhpJy7kprDKTHVk01Nuh/meej28SNSdMu7PPil88vtG/DoH9ZZEUXDftlbBTyCYgxM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CmJyjk8T
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
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
Cc: "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

> I can help you with this problem.  It is because there are two different
> versions of the zcu106 having different DDR memories.  This is because the
> DDR that came on the revA version of the board became obsolete.
> 
> I left the revA device tree in buildroot as I know this is the version of the
> zcu106 that Peter Korsgaard has.  Based on your comment, I believe you have
> the newer version of the zcu106.
> 
> To fix this, only the u-boot psu_init_gpl.c needs to be changed, so the
> correct spl psu_init routine will run.
> 
> Please implement the following in your zcu106 defconfig:
> 
> - BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA
> + BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0
> 
> This will build in the correct psu_init_gpl.c from the two choices below:
> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-rev1.0
> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-revA
> 
> You can read about this issue for the zcu102 and zcu106 here:
> https://support.xilinx.com/s/article/71961?language=en_US
> 
> Do you have any opinions for how this can be better handled in buildroot to
> support both versions of the zcu102 and zcu106?

> The only nice option from a Buildroot perspective would be to runtime
> detect the board revision in U-Boot and apply the correct DDR
> configuration accordingly. This way a single image would work on both
> revisions. Having two full defconfigs to address those two board
> revisions would be a bit annoying.

I believe I already know your answer to this, but I will ask it anyway.  Would
you be ok with adding a small routine to the SPL that reads the I2C EEPROM on
the ZCU102 and ZCU106 boards to detect the version before configuring the DDR
like we do with the FSBL?  We could make it such that the routine is only
enabled if the device tree is set to one of the ZCU102 or ZCU106 device tree
revisions.

Would you be open to this?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
