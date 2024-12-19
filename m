Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB8CE7718B
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 10:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D8784CEA;
	Thu, 19 Dec 2024 10:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qG8DLPTmZQtN; Thu, 19 Dec 2024 10:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 899BA84CA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 899BA84CA5;
	Thu, 19 Dec 2024 10:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A7CA6C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 10:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AFA441803
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 10:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTtqyQAaAIam for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 10:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::624;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E76B340F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E76B340F4B
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::624])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E76B340F4B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 10:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzZ6J02y8irFnQ3wYs3rUhvsH+RSj40i1U+U9v964iOU3COJD9CUehXn39eGoAXIAyaWuJbxQivs3ih/pOZ0brCY0/Y6vd+sryQuefZGolb/ol07Ak9ja57mpi61WxgQCprDiqO5abbTRuqHGCPWWddgXjXyhWu42QeVsVLhgc+0laDlECr4KuegG8X4JGkc3nxsrB6us2r7yEBA4q1VNEMF5o8WSXbAoSxh0rkM2Swse+DVwUSzOKmdXC99HzroznFhH7mLQk2+HcDVAcgVKJvuINUDf7RaNlStDnV+jVsAEPA4k76rauspiW0j93WYieZLZ9yfqtI7Rqxa/uziMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYByBWy/QpCVKxeV0qa4W4B1KbkOWyj2lGXfZjFCaBk=;
 b=v0m3v3aKdtR7KiOopmLdmiLda2BiLM+RyB0d6gFD0PET4/p5N7hRm91DnYLRA4dV3DMglJw6Ff+rYSNfQC/hZX775WdvwWrlU7RUS1635ylUpzIF/+5YEuH7CupqgVoxDZcbZbH8Eo/T/m5Oph1znNmW933W/Lg/Ms7qLhjcw94PJMemgRj7/z/aq53uXXvXfIlq0YKBcMFHGL31ypNLY1Bj+ir/DwkVnHDI30NW0Lcfx5BbTto99XahSYi0iHh81lRIc18MAE6izPf4NxmnmlpP/viTiGrr3GXGngNzHZtMOf5k9/T9ZHMDwMEUjiUD5iFf+grZU//hZSX+gCFQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 10:59:31 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 10:59:31 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/2] boot/uboot: binman generates u-boot.itb
Thread-Index: AQHbURly/EVprcrhl0aeGnL4y1WDQrLtZbAg
Date: Thu, 19 Dec 2024 10:59:31 +0000
Message-ID: <CH2PR12MB50044EA5F1C06E9046A28E6BF0062@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241218065239.503162-1-neal.frager@amd.com>
In-Reply-To: <20241218065239.503162-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BY5PR12MB4210:EE_
x-ms-office365-filtering-correlation-id: aed53d7b-edb1-43ff-50c3-08dd201c3775
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?k+4zlbjxMllBQcqYx2uYTztzXlVkp9TYk9D2DLZomOGmqD3PtGRIVQE0+aVa?=
 =?us-ascii?Q?rKEXIh+d4IworM8iO4DlsNyvB5CA7tDGSExiwRLaHX5WyTW0LxseIUExQCtk?=
 =?us-ascii?Q?ttVH6oREfPjZARlDZr8AZ7saFTPAnn3p62+2T8VcnOPFxsOJMAHsqyRdRqE7?=
 =?us-ascii?Q?YlNlIRvbo0huL2PfduI9fMk3vIoeOSmTk4kQsMgMKUgzU3dDlW1wqeb4roh0?=
 =?us-ascii?Q?9JUlb/ebZKrVwVxeo5CfSeh+Pn4Vni7cOlfdC+ea4z8QM37Yun98KU3POm2Y?=
 =?us-ascii?Q?zDsZjYiD3gr2bDMpPlMwXfmODIsbyK0yL6VyflrD5PDTNkP6bqyc5IX2WFT7?=
 =?us-ascii?Q?+YtQbDcEjo0CPIuPQuKitNU0l3KChkxp89gSv7i7WFixttPqxv8T8zBy4gIm?=
 =?us-ascii?Q?oD0AVtJPoitDa8vwLbuCpb2Kkc9gU0ie5JCqzP8XyyQoFTXYo0v3u14vTB86?=
 =?us-ascii?Q?tCiH14fZ+iZGVFZEBcML1voUaGXe8ZXKLDiQfy6gouZy6Rq0iitiBlzDnFSC?=
 =?us-ascii?Q?9OBr9ceoLrt5Um3BWIvIvvacwXIMWB9tWvOVn+1z2WQiT6TIiQqbLEgR3+uS?=
 =?us-ascii?Q?3w2Gl3Fw39QUeLTb2vaF3QNA7hSWkUDynQBEhULZLa4f1lHb+2fa09lATHy/?=
 =?us-ascii?Q?XmMt/gK6Wa6ehRsXQ0R8iYO0wb8q4Xpi3tsnoKfswD4/6HfTDZZFkYcMvY9q?=
 =?us-ascii?Q?Mgdixz4y8L8cQ8JGVTfzjLaz3M9QZH/tZX4KRD/A8yOovGieC/c+IGm/73jr?=
 =?us-ascii?Q?HoQNkBZV0lYBdSjwJQ/AwD6iQxQdmFRgWiQjlIVkcZxCtHff68eDGi+dYAhB?=
 =?us-ascii?Q?wOuay0IpRFbHVH087n3CgLX92RK0iWuYGpAHXoVOs9anmM/BQTun3lhMTxVx?=
 =?us-ascii?Q?+YT5wwjDhaXY2Fx0RtYEiLBKo0asFvf+P/D7z7sszrGFVngPMwpHYMCXwF+u?=
 =?us-ascii?Q?gmRS7WSt6bmIa1RHGTBQM8uNkFSrt4kVptsvgXVBI3uk1rtDWwnu42RLXY0T?=
 =?us-ascii?Q?Y0/E1ofqiPHoSkTP7nb1vFHrl/5LR4vCRWVl3ct078hor0IYU0VcZp5H6T7y?=
 =?us-ascii?Q?if4arWlrgVBoPuj/EcDcBTUb78QGGb5Ys7ZMqEmI+eGGDjcjgTvn5R5aD2zP?=
 =?us-ascii?Q?LeBNRYoE6OENc5DDumGb+O1tEdWAXBHaJlc87mwdqcV9I6O+x6c0PFJi9gfE?=
 =?us-ascii?Q?KHr3CnXExTQgJtGB3maGUx3alzvgqtrL9pxK4Dx4H14tm6JJSWsF+Bg3v6oG?=
 =?us-ascii?Q?s41uRPGQi1n5W0qgS1U90V+4+5WORJ8+Z4WU7NDCZpel2GCLbdeclDUfRxYV?=
 =?us-ascii?Q?BSYbqf8clbDHEG5K33fbtHysNdcmKtb9ZlF5H0jHEKmAJFSQcGK+9tPRVe70?=
 =?us-ascii?Q?Gs+lWaApUtiZmBv8gwatNIKpVqma21mWc8YxlkcnvYccACcf/YXKQQnLyHuF?=
 =?us-ascii?Q?zrxYaSgQfOvXLeYiSKYoE1u+BZ2v4zcOWyVpq3jYTU2jjC8+7WVB5cpl3AWo?=
 =?us-ascii?Q?SASsqrMu+XPk5wk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Aple+cKfVi31HJH2hFBTwa1sIC/ieJMQtHt4k9/ZdKUCQGKpANGeJftj2t0t?=
 =?us-ascii?Q?urxo6Jj3eoet6JxZ2BhUjeBzHIbhddfwqPYDVHS4RiMVLZu+L/PgtfGB14YD?=
 =?us-ascii?Q?5m4pwSRJT/dtj9H2nE0ZDckKpj2uW+wWEYmjW9DuZLXZn4YtmMkgEey1NhdE?=
 =?us-ascii?Q?l+BUte/2OhzPpRUYN0Gazjvvf0K136Gl2PQicJyEPgSotFafXyVgqRI/KKgg?=
 =?us-ascii?Q?SkgKq2vMJPnW1Kd9brbTGiTqCfXtzCDBGUL1TSA9faqo9q9sOmgzs63cizJS?=
 =?us-ascii?Q?tcN4epS+gbwL88htrSix9TKc+a7x0OpeL7+O8RJ3p3Iymol74TtoboGtZ86Z?=
 =?us-ascii?Q?rXSAgTO6VOZRV+LRDYAcLFuo5q+6bWqckVCI8roF8Z0BItz764jKQczemkwM?=
 =?us-ascii?Q?giBTqdmqt4aTM14aJJF6z7fP+fL3Q0n2+cEc/kO9TWv57IHQRZ63xEN2Q0Ix?=
 =?us-ascii?Q?uzngwr6FwTOpkpmpAOTEGCGxnjEnzajqOJPgAm+EBUPG+nG6+Uh+/HaZvidj?=
 =?us-ascii?Q?0mM+dND0z4xRuDEHsRUXfHxc5UIFbx6NxkmDl732pcmtuVw9m8V6s2hwsty5?=
 =?us-ascii?Q?llo5z/YOnSBJE1/v8FyYueKURBaSZQ7/E74V4Cfoh+GWcW4k+/U5VddQVz5A?=
 =?us-ascii?Q?xpo0voOf3PxQCl+F3FkoKyKOTWIgVl2P/CAJspCfvrmQD1xPrgXUlFF0ASAb?=
 =?us-ascii?Q?NnSVcPtOyOhJn/HLKXCLHUUNoEAIA7e05pmd506J20qH87haE8kNnE/cDNK1?=
 =?us-ascii?Q?Ejb3Lcv/aZZTtpf8z/Iz4pGAK8seGyGMZe0zjUHZTy133DDsrpaqlCLJ+pbe?=
 =?us-ascii?Q?S/KP7PPmoXxMXRUeUEgwrvz2Qr8R8Lz2hI6LoNZYMj3a+Xs1xPZ0BiH2fy0Y?=
 =?us-ascii?Q?iQMZ1lv/T1gaid2de4vobwRhD0UTfs+pAppSq9USgZr6HqBPVB8bJmAJAmkX?=
 =?us-ascii?Q?m8DhI+dECSNKERprhzghpjHOckdDdm+5YVUTWp8O8qa02JH+/EiCB16RzXKZ?=
 =?us-ascii?Q?5ld7UhbjrlnpVyt2e+nwa7AD8k/tqOQqE3tlcYtl+xF8H9UCbU97ov72uUl+?=
 =?us-ascii?Q?LP5PY1iMjjLEztIe+10HgShfFg/ujOg8TPeUsYgUfcPhgfdnEWxgV3fHlh78?=
 =?us-ascii?Q?90/iDzNn+DT3osEgPwuurZY2sQH7PysH4BaRxJKuyinoAow6UGdHfrrCK0NU?=
 =?us-ascii?Q?c4BUGL/r6Abhmp3/4yPclFsBNhiwxPcNZ78e42l2J6Oeq0XqqX/PwwrwY1Yn?=
 =?us-ascii?Q?YTLFfTwX+fsvYx341zzYvWh4zjHkpyrKxpN2AJf8aWcDZVU9NgCT61M8pDP/?=
 =?us-ascii?Q?NHJpkQzjv7UalFb8qAYxm+nJ4se0TGm/HkPDvFyVFZHG7KlLH5Ro2oosI+9I?=
 =?us-ascii?Q?un+de3A+XpyALrtohh2MJ34jC3VMa55TZKZY+a0VENeBWIwPVMGl8LGj3/Xf?=
 =?us-ascii?Q?wI6CiNKbzQupNSHjKsmMFyrV7hfypYtPFP3hrhxpk7o1YNIqRDU5DcQGNSXG?=
 =?us-ascii?Q?/PifXMP4wFU7grdMc+glsEUEBe00WhTH6oiGo16qfFfNH8lI7ZRG5N0ysznb?=
 =?us-ascii?Q?qP0iZA+wiOTt7y7nlC8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed53d7b-edb1-43ff-50c3-08dd201c3775
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 10:59:31.7841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8M+lo3WMl15/b4Z7hEhdkVCoUe2xD0BktfgGpXrA65UfcnzL6oTrDql+W7Y+I2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYByBWy/QpCVKxeV0qa4W4B1KbkOWyj2lGXfZjFCaBk=;
 b=IY529zJ2vVHNj4FJYIpiQk3MuM4c8Fm/aRB1uPgmZGMHz7T9tpYzG5EEaGGYGSkVYuosYOhbygvw6HMoCQjqbUObbAAiPMvcU5F09Ej2WxeM1dsvdMOBFgkBDbxjyX2c6ZODVUCPnVGb3MZFJ1UY5tdHWY4Hj2T7e/7E75zAnHI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IY529zJ2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] boot/uboot: binman generates
 u-boot.itb
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> When using binman to generate u-boot images, there will no longer be a make
> rule for generating files produced by binman.  However, these files will still
> need to be installed to the output/images directory.

> One such file is the u-boot.itb.  If the u-boot.itb is generated by binman,
> then the file still needs to be copied, but without the make rule.

> Here is an example of how binman generates the u-boot.itb:
> https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> boot/uboot/uboot.mk | 2 ++
> 1 file changed, 2 insertions(+)

> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index d8faef648f..fd0323bb71 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -103,8 +103,10 @@ endif
 
> ifeq ($(BR2_TARGET_UBOOT_FORMAT_ITB),y)
> UBOOT_BINS += u-boot.itb
> +ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
> UBOOT_MAKE_TARGET += u-boot.itb
> endif
> +endif

One other very important detail.  I have tested the upstream next branch of
u-boot which includes binman for zynqmp.  See the commit below.  With the new
version of u-boot, the zynqmp platform will ONLY work with binman.

https://github.com/u-boot/u-boot/commit/9121d572e2d061922e747c3e9636ad744316059c

This means that this first patch for u-boot will be required just for being
able to build the next u-boot release for the zynqmp products.

The qspi.bin is optional, but the u-boot.itb is required and there is no
longer a make rule for it.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
