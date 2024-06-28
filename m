Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E85C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 12:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFD4F41A10;
	Fri, 28 Jun 2024 12:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO09LrsCHeCl; Fri, 28 Jun 2024 12:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D63417CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D63417CA;
	Fri, 28 Jun 2024 12:40:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 937EC1BF41C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 818266077F
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCJC_edr9aWz for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 12:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D4B860820
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D4B860820
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D4B860820
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 12:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoCKHDLOspPVQtAVuywjPZdwXOI7dpuZZZAnAtFW9BISla+zm3E2Hv1UcgFNElpe7vPtHxSL/cNUv2axk1m6L32pEQ1tkcbEyUbSGDi4rYIbu0CoB+3NfoAiN2SkRKcz9cNC2MbOBO0U5KSdf1CVeAmEYgyEiYvNUnCWK1FTHOlOCayMBT/Tkz787e0+I1Xa9572nazYI49sbyHAvLlFCVBQS1XPRfLalYOF7pJn/B9y5+fkMJlIY5LEOBavdvELWBDeOoCMR2J+dUJvfh75K/jPm0YM4YHS5SQ5ZZEHUguaPiPCOUmZ/68qsq0oxjK+utupys8hVrIV05zzgxxmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5b+bUtFrXkj66SHNdkSkn85sJVXILxDjZl1m438rCJM=;
 b=S6ASS9yj4WQzHrCbGPjBzJL467SYiiD+MYIG6wTdXVkv8chr6HmC4xC6WaltXujbJ3JXqO0ZuRzybNRBNYAlj5+ZQAyB2v/orKZiio69gB6apobmFyJB1n2Esp5WiNDAj7QhfP26bhU6fcky0UcXVFtyNUnD2K1PJ0G2y5ExZm1sWrEe5fe+n8y00/OZScTTxxbuFU7tU+Czvc1aB9Fb56mTFvqaAINqfuIqd1kMgfvdS2S4xm/pVBOdKly/xFQkHNan5xm/LgDbFMVTpRrIqr4RsjnpY9qdqDfgdl7g7XKq/kD79gFFKk43BvMRO5YiJtUrJ/gBqSTY+f+wK2FjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB6183.namprd12.prod.outlook.com (2603:10b6:8:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 12:40:46 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 12:40:46 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 1/4] boot/xilinx-source: new boot package
Thread-Index: AQHawVQND7IxWwheBkGuMUgo1SQRYLHc+YyAgAAzHqA=
Date: Fri, 28 Jun 2024 12:40:45 +0000
Message-ID: <CH2PR12MB5004046100C29EC4360CF3A4F0D02@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240618074922.3555070-1-neal.frager@amd.com>
 <20240628113233.2d8f765f@booty>
In-Reply-To: <20240628113233.2d8f765f@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB6183:EE_
x-ms-office365-filtering-correlation-id: 7cedbcea-1da9-4cdd-9113-08dc976f880f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qkOVTq+gMM5/kbYC05EGv+UY7U1cHRkzEojTGgkVN0B3GUwNSx0pO+yoSBLK?=
 =?us-ascii?Q?bLa6pBL2KgdqPEMAasWAIvExsKsnOZl3yx4RzX3JGbPTixACJvj29BFvIaQg?=
 =?us-ascii?Q?a5Re+IYFkxAMah224NdBGx7y+O0YECnRb7PfMcxnRFlG1GvbTaNM5Y/ck44E?=
 =?us-ascii?Q?YLygqOFkbamgz7vbDrqhNJbeRQm0Tvt8D8Vt5yy08N7hQI5is1ryLfhrqSu0?=
 =?us-ascii?Q?0OPseqhQXKG718RlHeidAmDWzaCG7Xp1mO04IIEdaz+ZnFvgmCLJmKnm+Zhd?=
 =?us-ascii?Q?l1zUEfIV7UkCPoGp6IxhnYBrpxhF9xFrJg5KNnJPnBR+Ry5M5kxZh3amvUd5?=
 =?us-ascii?Q?b5FJACy1SHAUUfxdEospp9qEsryso95oaOIuYCL6GkaZ45g6Eqj6/mxcI4zp?=
 =?us-ascii?Q?qa8xvGc6ui9zyrtMKQTUjsseh8H/65yleIAEoi7yK7Z1BavgvKIlJx+52v6K?=
 =?us-ascii?Q?/tR9hV5oHxgVWJEBVi6LwQSgGGPt0CyM7a79X7PxLod4dkpmASY4/uqIGHvU?=
 =?us-ascii?Q?esUV6DBgbL/YKZs6yzomShiW15JpFOwLpV9K+qCzEJeYmS8+1M2blG8UqPTL?=
 =?us-ascii?Q?wWaSaM0/UcTDuZvJ6fw31oAJCCCGIWFnJgsz4HLGf9eEioWmR1lMhhrQb/ll?=
 =?us-ascii?Q?SYk0abBuZAdL1RZzYUBqimGvV4zzamCkH/US4/5W+BpLbWdQ2P+XOSuujS+5?=
 =?us-ascii?Q?GKBCavU6RrqCKWFBMN38pg9ef1BVTZOzDorjtePA8tob6/MO21JXbf58zdZa?=
 =?us-ascii?Q?sBf4nIIXHgNQWHXiLSlVVzkjY02Qh4THujBoMiixOb7c4TsAzpEN2y7h2dkp?=
 =?us-ascii?Q?0fofpOZSNCWTWf6LlEjdPbHNO5JEQk4PRQV5zL93kdfVNwTb5EvowcUitAvT?=
 =?us-ascii?Q?3MOUXKdf3zAEQADZeueE2sWnNI9UIHWBlMRZxcJTWHUsH/LN/LdTVmgUW4jc?=
 =?us-ascii?Q?u0fdNQ2FuglecjjKO34IJKiMXd3fisYP9V8a40FjV5KnDis2/91GHDaMh6/9?=
 =?us-ascii?Q?zcai6z+Cy0Zg/Z9F6zEyMy91vjp8ZEcfyWCQYgnjnckUd3dQ+I8F6YcYNnk2?=
 =?us-ascii?Q?fff0AvjrLFO0X9LOEUWUR67PFSwKr3G1FrYzhdp2cNkeClX2W8QUpQuwGPJu?=
 =?us-ascii?Q?+eUDib+ImZ8iiXLn0DsYTcRHcHM0UGhtqCWkqsaXgmvBaRSZYzIOL7p6jgeh?=
 =?us-ascii?Q?aF8D2qYNGaqlvPTfxwm18ANwfsckbfyVuxWYsWjsUv6sMfV1QR2ZeXHbn7oM?=
 =?us-ascii?Q?q/nmd57+HXTyDivMxmHHQMjVr7c4sPO1IBorU8Z5aEB2LLkndcB+8Mi0zF13?=
 =?us-ascii?Q?7rriwunscJd/D0kF3f+SS2l0hxETd4SvekxFy+5VQjnY8976vyvf67vaqIk3?=
 =?us-ascii?Q?2HVDlbOjWXKhNlMKyFHIC4REUmr3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UhphTeFPqSfBvX/OQiMRGYcvl+GKKKzQZ27vIifDPlBnUpi759OQUja+PUtA?=
 =?us-ascii?Q?mlCZ9MC5eZqN1d1YsNDhiiT+tc/Wc3LgCojuSokzqy0md4yGNBMurKhUBct+?=
 =?us-ascii?Q?z+bn3o/jrgQxLJTi2UPq8P/UEYCHj2Z/qYwe6902p0c74pJH9Ay9HxxtIM7m?=
 =?us-ascii?Q?SPtzvHtBnEaZfqQnj5k8WxG++pBAEprgvXQ0eLJz9DnX9vPb/mkQ9nM+XsG6?=
 =?us-ascii?Q?I16CAcV2wK0S/r2SOluxDSFV2thpPMEz7KojWyTBytIpjtYEL4QCiFlH6RB6?=
 =?us-ascii?Q?WB6r34/OzvvjE3q73ipOtnLJPNRqYS9MVOpepudnecMTQcQOeT+kQHCdI4zM?=
 =?us-ascii?Q?l4URNhZAM6pElmSHaYEBekhyxgXK6jFpZGj4TWVS6/yLWq65LhLuKkun9cGw?=
 =?us-ascii?Q?Q9NzEOfEb+91u35Q6yBs11oDGrTPqLiuXYFE131os5+A6c+PM4fpvTYS328C?=
 =?us-ascii?Q?6igylPIE8M9LCyYHBV1c3P55Xg1zxwLCaZZYpaSzfmJtCjYJyOXFz5AvEff6?=
 =?us-ascii?Q?4/nWMB/CbW1CHdrVUGxEckWEftZ0FOAFgn6IFULptRa5CKb/XD9TFfwAVvQN?=
 =?us-ascii?Q?J5bw6WA6SCjMTng5L8PUuFkP+Yonqn43QQQUObOcx0L4sgwW9vixGiVFUN2G?=
 =?us-ascii?Q?pXsCQTT41r5lvma3olOr84bRA/uE2RghxCUczrxOSygGR/AFYiHC8p05k/py?=
 =?us-ascii?Q?fhWCPk4DJZJS3YVkcn4ui3YtftKth0vlI7TztY7jmcZG3PA9uWBiIetKmGxj?=
 =?us-ascii?Q?W4WwdavspS+uyXl42QJqnEw3NpC5N8eKi6SZLPeoeMzzd4ohLvP5WAngv0TD?=
 =?us-ascii?Q?RfIEfDV3n0kWBSiYqbML3LdZ0LiWPdz6SuLB2LoApjKlSHvybPQywutFiLr7?=
 =?us-ascii?Q?nih99eh/totJnoDluLgn6l3a/CaeopwyGn4uK+/t3DgUjmGtI2+feOytfVGt?=
 =?us-ascii?Q?Bz6F3NotPz8Ctmlaj/lLLpINNCSAlEF6aJ7i84e+v0LL4PuBXfPFZoVW/iVd?=
 =?us-ascii?Q?ZEns8l39ct7D8rRYP5az6zAaTDOyKC7Hp9Wj9tvhluixQF51Hyae0v3NJK89?=
 =?us-ascii?Q?RK9wrDd01whQ9Gxw76/X2e/0FK4Go1W2vjtP6qtR8rjADZU+P1HisKhpEQoG?=
 =?us-ascii?Q?CISMfk6IIq00EYYdwTnsSRjytu8RJXbiLIeL0o6fvpdwiPWdbW/E/CekVm78?=
 =?us-ascii?Q?A9oQGKd/dR1JXaVYLSZ0kR5g+5LgCgBhTSkeEnakC9zcFopf6TDWM6x9ksJY?=
 =?us-ascii?Q?ar93bvdUE1faIF0dhMOtoaH+UB2fRXu4nB5S9w04C8vZNSKABI0Y2VP7r6wx?=
 =?us-ascii?Q?AyWlltBOMtqi6lXax9MdWR3PrrhTOHIpntkUkgvx3BgZcao3ZShSBOEB4PVx?=
 =?us-ascii?Q?zekTE4DsMtnNzKRckt0xEkXHnxHd/qrfCZehyOq+6acilu7lBv05udupV95P?=
 =?us-ascii?Q?vJMXiYKOoAbd9gRaiLgFQlpXgOHfcFURATCKlwYNe3sNk7DjmTIoJOd0hpHM?=
 =?us-ascii?Q?8L+QNLth7mR27cGmug688xvClAr582hUkdM5iW5jfwUePWFuFex22/qFu87w?=
 =?us-ascii?Q?hTFqa6RTlPa+UNhQ3Cw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cedbcea-1da9-4cdd-9113-08dc976f880f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 12:40:45.9079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5/KusBuF+IH1fO1aEs1Ih6LhM47piyyKSLhOpe6OcIMmVGuR3T9MNrz99598X61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b+bUtFrXkj66SHNdkSkn85sJVXILxDjZl1m438rCJM=;
 b=Njl+eoiVrz01quWO16yunOsNDtNn9Mv+ntXPmunxdSoZa3jBFSRc9uf2FBJxYQ838RP7+faiiSas5CYizBikGknzahalYi+onuyrizuBTRJ44I7XOJuPp92pTk7MzQL1cw7w0VVWjSf116BTjgugSyFz8tw4SYsOCekTGgKTI5k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Njl+eoiV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/4] boot/xilinx-source: new boot package
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

Thank you for your thorough review.

> This patch adds a new boot package for building boot firmware for Xilinx
> versal, zynqmp and kria targets.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - add make dependency to be sure bare-metal toolchain is built before trying
>   to use the toolchain for building the xilinx-source firmware
> V2->V3:
> - fix copy paste error that causes build failure
> ---
>  DEVELOPERS                            |  1 +
>  boot/Config.in                        |  1 +
>  boot/xilinx-source/Config.in          | 45 +++++++++++++++++
>  boot/xilinx-source/xilinx-source.hash |  2 +
>  boot/xilinx-source/xilinx-source.mk   | 70 +++++++++++++++++++++++++++
>  5 files changed, 119 insertions(+)
>  create mode 100644 boot/xilinx-source/Config.in
>  create mode 100644 boot/xilinx-source/xilinx-source.hash
>  create mode 100644 boot/xilinx-source/xilinx-source.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8bfd36f1d8..adfd9520ea 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2340,6 +2340,7 @@ F:	board/xilinx/
>  F:	board/zynq/
>  F:	board/zynqmp/
>  F:	boot/xilinx-prebuilt/
> +F:	boot/xilinx-source/
>  F:	configs/versal_vck190_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/boot/Config.in b/boot/Config.in
> index 25a50265d2..da22f15e8a 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -22,5 +22,6 @@ source "boot/ti-k3-r5-loader/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
>  source "boot/xilinx-prebuilt/Config.in"
> +source "boot/xilinx-source/Config.in"
>  
>  endmenu
> diff --git a/boot/xilinx-source/Config.in b/boot/xilinx-source/Config.in
> new file mode 100644
> index 0000000000..bf87ff4178
> --- /dev/null
> +++ b/boot/xilinx-source/Config.in
> @@ -0,0 +1,45 @@
> +config BR2_TARGET_XILINX_SOURCE
> +	bool "xilinx-source"
> +	depends on BR2_aarch64
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
> +	help
> +	  Build boot firmware from source for Xilinx boards.
> +
> +	  https://github.com/Xilinx/embeddedsw

> It would be useful to add here a few words about what gets built and why
> versal requires BR2_TARGET_XILINX_PREBUILT while zynqmp and kria require
> !BR2_TARGET_XILINX_PREBUILT.

Yes, no problem.  I see your point.

> +comment "xilinx-source needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
> +
> +if BR2_TARGET_XILINX_SOURCE
> +
> +config BR2_TARGET_XILINX_SOURCE_VERSION
> +	string "source version"
> +	default "xilinx_v2024.1"
> +	help
> +	  Release version of Xilinx firmware.
> +	  Must be xilinx_v2023.1 or newer.
> +
> +choice
> +	bool "family variant"
> +	default BR2_TARGET_XILINX_SOURCE_ZYNQMP
> +
> +config BR2_TARGET_XILINX_SOURCE_ZYNQMP
> +	bool "zynqmp"
> +	depends on !BR2_TARGET_XILINX_PREBUILT
> +
> +config BR2_TARGET_XILINX_SOURCE_KRIA
> +	bool "kria"
> +	depends on !BR2_TARGET_XILINX_PREBUILT
> +
> +config BR2_TARGET_XILINX_SOURCE_VERSAL
> +	bool "versal"
> +	depends on BR2_TARGET_XILINX_PREBUILT
> +
> +endchoice
> +
> +config BR2_TARGET_XILINX_SOURCE_USER_CFLAGS
> +	string "optional user cflags"
> +	help
> +	  Add optional config flags when building xilinx boot firmware.
> +
> +endif # BR2_TARGET_XILINX_SOURCE
> diff --git a/boot/xilinx-source/xilinx-source.hash b/boot/xilinx-source/xilinx-source.hash
> new file mode 100644
> index 0000000000..ed6a165574
> --- /dev/null
> +++ b/boot/xilinx-source/xilinx-source.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  733fdb09b2525c1fa322242b97f015122aaf9e32530a824dec71d6328be83850  xilinx-source-xilinx_v2024.1.tar.gz
> diff --git a/boot/xilinx-source/xilinx-source.mk b/boot/xilinx-source/xilinx-source.mk
> new file mode 100644
> index 0000000000..4352b07eed
> --- /dev/null
> +++ b/boot/xilinx-source/xilinx-source.mk
> @@ -0,0 +1,70 @@
> +################################################################################
> +#
> +# xilinx-source
> +#
> +################################################################################
> +
> +XILINX_SOURCE_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_SOURCE_VERSION))
> +XILINX_SOURCE_SITE = $(call github,Xilinx,embeddedsw,$(XILINX_SOURCE_VERSION))
> +XILINX_SOURCE_LICENSE = MIT
> +XILINX_SOURCE_LICENSE_FILES = LICENSE
> +XILINX_SOURCE_INSTALL_TARGET = NO
> +XILINX_SOURCE_INSTALL_IMAGES = YES
> +XILINX_SOURCE_DEPENDENCIES = toolchain-bare-metal-buildroot
> +
> +XILINX_SOURCE_USER_CFLAGS = $(call qstrip,$(BR2_TARGET_XILINX_SOURCE_USER_CFLAGS))
> +ifeq ($(BR2_TARGET_XILINX_SOURCE_KRIA),y)
> +XILINX_SOURCE_CFLAGS = "-Os -flto -ffat-lto-objects -DK26_SOM $(XILINX_SOURCE_USER_CFLAGS)"
> +else
> +XILINX_SOURCE_CFLAGS = "-Os -flto -ffat-lto-objects $(XILINX_SOURCE_USER_CFLAGS)"
> +endif
> +
> +ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
> +define XILINX_SOURCE_BUILD_VERSAL
> +	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(XILINX_SOURCE_CFLAGS)
> +		
> +	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(XILINX_SOURCE_CFLAGS)
> +endef
> +else # BR2_TARGET_XILINX_SOURCE_VERSAL
> +define XILINX_SOURCE_BUILD_OTHERS
> +	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(XILINX_SOURCE_CFLAGS)
> +endef
> +endif # BR2_TARGET_XILINX_SOURCE_VERSAL
> +
> +define XILINX_SOURCE_BUILD_CMDS
> +	$(XILINX_SOURCE_BUILD_VERSAL)
> +	$(XILINX_SOURCE_BUILD_OTHERS)

> We are always building either for versal or for "others", so only one
> of these two variables is ever defined. So you could use only one
> variable name (XILINX_SOURCE_BUILD?), or even define directly
> XILINX_SOURCE_BUILD_CMDS inside the ifeq/else/endif clause above.

Good simplification.  I took this solution from Yann's xilinx-prebuilt
solution, so that they would look the same.  If we reduce to a single
XILINX_SOURCE_BUILD define, I would like to also reduce to a single
XILINX_PREBUILT_INSTALL define.

I will submit a patch for changing the xilinx-prebuilt package
accordingly.

> +endef
> +
> +ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
> +define XILINX_SOURCE_INSTALL_VERSAL
> +	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf \
> +		$(BINARIES_DIR)/plm.elf
> +	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf \
> +		$(BINARIES_DIR)/psmfw.elf
> +endef
> +else # BR2_TARGET_XILINX_SOURCE_VERSAL
> +define XILINX_SOURCE_INSTALL_OTHERS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf \
> +		$(BINARIES_DIR)/pmufw.elf
> +endef
> +endif # BR2_TARGET_XILINX_SOURCE_VERSAL
> +
> +define XILINX_SOURCE_INSTALL_IMAGES_CMDS
> +	$(XILINX_SOURCE_INSTALL_VERSAL)
> +	$(XILINX_SOURCE_INSTALL_OTHERS)

> As above.

Agreed.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
