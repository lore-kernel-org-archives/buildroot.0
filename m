Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26DAE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 14:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891CB40685;
	Fri, 13 Dec 2024 14:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4toohGkJTyiP; Fri, 13 Dec 2024 14:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 418DC40688
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 418DC40688;
	Fri, 13 Dec 2024 14:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96D4575
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F1F4069A
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6sCZ8qsJfG3 for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 14:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::60f;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01DCD40685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01DCD40685
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::60f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01DCD40685
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajdgk5ZKpVSyXIq0CW+EBoP5X1qiVOjksaOBVrRZsMSYDzIahE/rtsUIYk/T2XiOnner/NsDkk6StuSWYJbPW5YzXDwVTIAcLu2plM19xiBJti/+gxuJzfd5ejet3tk2saZXOwHQscUC+TnEPijKtXRSEidW0rKPJFIGMAhrR5dTyrL9n2xOUn6zDv6SiViwUCg4faPRxJFDGKWRHX5c0VaDL/faeqOKwv7HXuXLrwzo0PUpl0qkLyWgXglUieEwoCv6/yKlg5mJELEAR8TCiMSckKehtvC7Ekm856Y2Z1idrSIIZsNz43ktAnHkOWws7epkxQB5jJkrdF0t9lL4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/nK8JGAQUdc8MnEvBoyJWaHvctP5+vnKSQcip58j6c=;
 b=jYHAbkWr1nG5WA/WmDkYXLYTRlQWWsbyf8UEnzEvDJvKIgQmckdfF/McOpyAw6vr55bX5CerpBljqjgN8Hv5JmXt8uBr112dH2pRJ5ZcFqUOf4tI0oFUtYw48vcxSJ7kD0D9q5ltEAXRr7VRg/Wa34Bu1nycIhFmZjkqjyaXDvtyCGvIi4xVIldrJ1ckMYmHj1WjhVPvuOCaS8lxDbD8nZ9e2PJhcHLMM7Ktr5kkpAxn7YXpqDoFDSZ4NNfhf2xBPBAPvkJPnTWE2IfChPLnEgfV+20ljuy8w/Isjd6ljpE5oEh5LYlY8gKSPqyXaTdFSDSm6udBnP8Fpbvfx3XGHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB5903.namprd12.prod.outlook.com (2603:10b6:510:1d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 14:18:26 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 14:18:26 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig: bump to
 xilinx-v2024.1
Thread-Index: AQHawTEMoyu+eO8XaUWWah1EeSt8SbLlTKkAgAABj7A=
Date: Fri, 13 Dec 2024 14:18:26 +0000
Message-ID: <CH2PR12MB50045EE1D12517691A999E80F0382@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
 <20241213150136.0c434b72@booty>
In-Reply-To: <20241213150136.0c434b72@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB5903:EE_
x-ms-office365-filtering-correlation-id: 1dc86316-3dc4-4273-e3c6-08dd1b8102c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XLLg76y7MgQvcdOMIIKhyH4vYpWu7jwvUjgMRWvBn2Wmc+mXBjywxVRvPLsn?=
 =?us-ascii?Q?oLU+nNF7QFuOfQuSwb1AwFEVP/hRnrG+5j1xDzKIwvESjrqR6IkWDW4bGZYK?=
 =?us-ascii?Q?PpJcR0rZonZt3F23ntH7NdHiWrrTwex8lBqrzfkvy908/y6wybDRIDfy60uD?=
 =?us-ascii?Q?v9GiKxzzn5OH/whpyj4haRDgwMRKUoKGtXfBExQgGCsuNxduqvsJz/snRZix?=
 =?us-ascii?Q?qDace3ZYKblULSoFeTKbMrJEWVelVNH4BH2wbFghoBs/qj2XN1XmSkxcokAo?=
 =?us-ascii?Q?6TGQqozjN2omjcnFMD+A1O/yGzTRF4jLaJUsfRxkDaC0yzZSE8hUmxZ93Cfa?=
 =?us-ascii?Q?3YY9LzMprqeFjG1C+E3TJ168pt06YHun007JjdXrjkv7giFDzPFeCvR0Klvm?=
 =?us-ascii?Q?boVH/0RXQX2RqhYS/1c1yes4tLyYGf4mPG/ttxpkQ76Osd0F2rySFcJeG7Z7?=
 =?us-ascii?Q?u06/Dk2TNFdmyPfzWNvPjLWLCIeYb4uxOKEyiOL5HumuRLvyS+ldrhzTv25R?=
 =?us-ascii?Q?v+LPyTN+QOdvbMJy/EZ3UaLhx+zhSw6DKL3Nv58sQRugxEnPbzTxQPJSTxmc?=
 =?us-ascii?Q?WyPYjhtl5mbasS04TxmiTsEyq/lBQt8K6Wgcdc4IOo5hbOr3pNL7YyJFFRuN?=
 =?us-ascii?Q?a3qgx/9ekkbbJg/8JA+WvDgxWoU2YhRWE6VFItdRqsYKgN9+TVKXEACcILbe?=
 =?us-ascii?Q?vTEt+SB4U2cvGGVGJfsMvZ4bPOU/0BgnyAC5qCWciI0Of2wyvGjCcgOiewj5?=
 =?us-ascii?Q?b00D72z7XDbsXVRqXhpKaFFjNPnHmbpIMWr9KLs5z7OKh5gwaBgvcK48CYhd?=
 =?us-ascii?Q?mJOqsCqAVx8pGYuFNA2VEI8kyxLg5OCJCq1JsaUS3hqYvZdeHFUClcV86siG?=
 =?us-ascii?Q?9dOdZRSkbp/RyMnm/CQ27WmwsLsnXauXbGwPVPMX02wPN7amigRp+y81m+YY?=
 =?us-ascii?Q?6qK4W/zgCTYVwu9lMBqML6KHaaNkDJGiP3R2NnWWDSdAl8iKecGKwXowFCAA?=
 =?us-ascii?Q?j/TYIxA/HYA66gVaaBvxuf1yYV8dUMZJHFFbioBikCjpCFwdPkZrTAYJxS2i?=
 =?us-ascii?Q?F5IMEVLkre1g6EzDiSDxGdH5tBmUY2ZW/sKT0rnwFGlbaylYoNMMuaIDrsvm?=
 =?us-ascii?Q?2hn/jo30irjTgYv/kTh7ROazdlmsar4sqjwbbeVOrGOyP0ZxOfLEsLqnXAjv?=
 =?us-ascii?Q?jS1s7wla6HHKSYBEA1enMYRa3g84MyhByS0nXHTaRJNWYuxjojAHa07+gFda?=
 =?us-ascii?Q?iZw8wW6tYLgx1xeqDZ0Wj59txfjnABfjBiywbLSuk2h+YLE9N43KZKLpJpMk?=
 =?us-ascii?Q?MrP90EsvDVxHNCH7pHsBRTsxc+AXvgXPqbeAm1vbGBswkZRdc26UN5uRP0hm?=
 =?us-ascii?Q?gY/AbJ1WKyfMcUof3wzxl9c17sK9qKQBwW25BpBaP2lQ2Fmjeuxgo6YPiCnM?=
 =?us-ascii?Q?egUwMj6E+I+ZyY+NX1BwVttMUMDd4pw1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oMeh7Isezpw4n91yKSWfUSqIHFK0olyvZ526mEn1JIu+XS+HD/80myqEX6E4?=
 =?us-ascii?Q?jKn1mb3OndJ8PcLzKjjOxXpr7bt2yJea/BmGPgSaI6eqLMxoJdTrSeUub0Kw?=
 =?us-ascii?Q?UnprCrRNCwbm8GIPSKpoOs0Cq/a8PMueWLKtMtxvkSftbva4a+Xd8UTsQN5w?=
 =?us-ascii?Q?gX3bNcmo7GHCqQIpDRj70h1XMsi9OgIWnZ+bmPCUAuW+C+rII7VFw0VC5y/1?=
 =?us-ascii?Q?Jzh8QicwKoCunt8azWr7Fh0S8PIXFsB+SvQ1HVkuJESah476Kty2DONBwKZt?=
 =?us-ascii?Q?X7bq3NTM0G8ExPE/OrkpUkfsqdHCO4I5N8NRba1ZvEv+owQplA5E45DaL1Uw?=
 =?us-ascii?Q?nooIg98tmVc936zOFuPTq5yV3e1t19HmX7N/pJRqAI5NCgdg59Cgvq8Xkx8x?=
 =?us-ascii?Q?3paHkWWhgy67CGjosblef8OhS8bnDBUNILRNIA2KPlWsHey2baoGGSLzIVtl?=
 =?us-ascii?Q?wP//qZ3KzYxl8kNRqkuEpD0koc50BIE9AS1a73267fc8916EO4WdPnBV9oW2?=
 =?us-ascii?Q?yC4OnAX0HJcb7AGHwEPQGaTUIZoxCiohtgPvQ0JOCwn3XHbVehFfU9eRUPro?=
 =?us-ascii?Q?hxnupw5UlcIm7/QkhAo2seyyFHVSu0SRm5jRx+VhgxLF7r0FhMfvALHCVILd?=
 =?us-ascii?Q?Sdwquhnil9DVrlAHvG4uAjr3Ys1El0SWGD8S0l1dml5oyif4rC1SL9W7LpMl?=
 =?us-ascii?Q?RsY0IopLdMtbfA62I19LnCiQaHj/540wsZHrCUYDRtJa71SK9i6UYWbZGG5Q?=
 =?us-ascii?Q?NQXCVUlD/OoqubzxckEfmOUwsr1Yya0WghPMyLBAqKmAmbn8d31IZ9dGUTXc?=
 =?us-ascii?Q?mCaS8Q1ErAJ6H0yc3mq2RfnmmPoMn+zyEwAP8s0/hFGLpycZVdB3/A4W4ZSf?=
 =?us-ascii?Q?URwWSPYVBw/CrGDwc6U0WV9vg8LUAOrYz5f1cG0udoINF7/b7RT8j20XE7qt?=
 =?us-ascii?Q?dHlA6djNBJu2zwCfXx6UipLl5y4ZzvJqPWEgaHvsJ5RUOpubWLuk5TJK91py?=
 =?us-ascii?Q?j2XvPr1W4KIT9HcdKAqCucvVs34tY/Nt28mzBe7aDCoVx1plRlYMRNvnHFEL?=
 =?us-ascii?Q?awK1fqfwtjXBHt0sg5r8jtDjK5CX/fvN5NILcNU8kDDpdJdYGyqFMp0WM28r?=
 =?us-ascii?Q?CcfQJGtMzn+AeNqjV9BsBiMiZT6AQs3QAJsLOijwjHwTG8Q4oIneMIQXmU/Z?=
 =?us-ascii?Q?YojIQzC0gYjXQOK2aSqo55NTqqskGvi5on5QKTBxlx11BeJIioKrfAilp8XD?=
 =?us-ascii?Q?cKNHlV4r40j6GHochuHVE3VJLRW7GmcXqM/4tb6a0zOojhtKjmIAHTC5slz8?=
 =?us-ascii?Q?jNk8ly1UEYiaeURH+3R2olidt9WEEh8GCqStIDuQwWbDMONImLM/EaCAR03r?=
 =?us-ascii?Q?Np5K0GHSgke34nKamEtflqL4mPxgXbsghoDmz8xKbk8XJO+qUkT7IrG0C0bg?=
 =?us-ascii?Q?UUtHy6qUmcJhdzzDTGItLtXleSwmztTJloBZZV+JBiMzRZyRTt8ZGcZMxQ7A?=
 =?us-ascii?Q?Zzean81voPgDfff866jP066tF29N1xqcvNw7eyLE3Br2QcRkMqJqbahLog1/?=
 =?us-ascii?Q?oLRXhmR8pX+aOCdSneU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc86316-3dc4-4273-e3c6-08dd1b8102c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 14:18:26.7234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHhtDZjuD4P9cGSW7T27YFSQoe0itgD94YsXkb1jzOYm1lYCf4kmLXQYf2vOKMOK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5903
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/nK8JGAQUdc8MnEvBoyJWaHvctP5+vnKSQcip58j6c=;
 b=gInDodSp+SedutFO4ye+qIqm/OMV7x6YmTJUWIlVdOCUvWQWYFIHMSg7JjC8weV1uw8txNvJuWoR3xgSXnuek1r6DMU9j4RQFZEKT8iL1Ave4oeune/O0ujuAn14Ig6e3+rirp/XRLEKJXNW8UO8AcYMFIDgnzuiC37I1AqwndQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gInDodSp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
> 
> Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
> needed.
> 
> With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
> the offset between the base address of the boot.bin and u-boot.itb instead of
> a raw base address of u-boot.itb. This allows for A/B firmware updates since
> the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.
> 
> Thus, Kria SOMs come with the following QSPI address table.
> 
> Partition A:
> 0x200000 - boot.bin
> 0x280000 - u-boot.itb

> Now I realized there seems to be an issue when using the flashed
> recovery tool to upgrade boot.bin and u-boot.itb. The SBIRT recovery
> tool does not allow writing at address 0x280000, thus using the current
> flashing procedure leads to a non-booting system:

>  U-Boot SPL 2024.01 (Dec 13 2024 - 13:41:04 +0100)
>  Loading new PMUFW cfg obj (1836 bytes)
>  PMUFW:  v1.1
>  Silicon version:        3
>  EL Level:       EL3
>  Secure Boot:    not authenticated, not encrypted
>  Multiboot:      64
>  Trying to boot from SPI
>  SPI offset:     0x280000
>  <system stops here>

> Do you think my understanding is correct?

> If it is, I already have a draft solution, which is basically creating
> an image just for the SBIRT tool, based on:

>  cp boot.bin sbirt.bin
>  dd if=u-boot.itb seek=128 bs=4k of=sbirt.bin

> Do you think there are better solutions? Otherwise I can finalize my
> draft and send a patch to Buildroot in order to generate a working SBIRT
> image from Kria defconfigs.

> Luca

Yes, you are correct about this issue.  The SBIRT tool was designed for the
FSBL use case where there is a single boot.bin which includes the u-boot.elf
and u-boot.dtb files that make up the u-boot.itb.

With the SPL flow, we have two files to boot from, boot.bin and u-boot.itb,
which was never really supported by the SBIRT tool.  Even when we put the
boot.bin in ImageA and the u-boot.itb in ImageB, it was really a work around
for the issue since the two files should make up an "ImageA" or "ImageB".

That said, I agree with your solution.  

With your patch, could you also document the solution in the kria/readme.txt?

https://github.com/buildroot/buildroot/blob/master/board/zynqmp/kria/readme.txt

My preference would be for the sdcard.img to include the files for both
flashing possibilities, so the genimage.cfg should include the boot.bin,
u-boot.itb and sbirt.bin, so the user can decide how he/she wishes to flash
the images.

Thank you for your work on this!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
