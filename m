Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EB3C27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 14:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B237560873;
	Thu,  6 Jun 2024 14:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3BPxt0jZFdy; Thu,  6 Jun 2024 14:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A56306087D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A56306087D;
	Thu,  6 Jun 2024 14:01:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A80B91BF32B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 14:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 941D440576
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 14:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4sOStakCIjma for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 14:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61c;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8515F4055E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8515F4055E
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8515F4055E
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 14:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MURVvp3oYOEp0IGP9p5eaP93Ua+wEiI2xNud2EY7Nu+Nk+iqlRgCxg54QotOGF+9G2RacVEEQ3TuXik85Y4Nj5uDtcuyi28qNaAwkujCeozn03JaNGmlQONmXjdvLTEGcjtQYsa15T6p6RA0sVtru/xiOfRkpM35pvu/BjmtkK9WYDQySH/GzcKYImm02aGOQ2y1yEXJtk8tjd52F73JA3EGWGOOWiXrFZRJzF5PV3r47QuXuStnoprKBiEGMWVg5jdeUammiIizdr6zj154loFM09YwVM8EmecwUUXaF4kvf+KvEpvNd6iS+rnMO8GBM17U3cMyj+bD20iVpHJ96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApXd3FlmI7O/MAIsb9pPCUSIfFXkvgPbI22ZFfFVrv0=;
 b=IrDLocjaiQqHHoDCEa7n81A42/STMZdLdjLS1+lWAm7BcHEM73Jax8TMuAqhDpOSzeXTYWWEBlOwYqL7qh9KouQILTpfD1/Ibn07yEAVaqhrxvSkeoM6AJheFYiHkz8PgZDMZykBvxj9bNbDMko3DvS17NJkTtp8W3ph25c39o44cufn26CTY5/Bt3rocUjKBQw7VikPLW2a4BDHHoV72YzPKRcL6KgqIGFk7RdJOQfZKwsqMOmZM6EnPtJ5PJjbAVB1dWHri1qLKx1iuq9CvPYjbC2hPstJvXtmk1M9TddsDMYkZh2EAoePKs8Od7TTuDkMGkaypwAFusshDpTfkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA1PR12MB6969.namprd12.prod.outlook.com (2603:10b6:806:24c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 14:01:48 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 14:01:47 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [PATCH v3 1/1] configs/zynqmp_kria_kd240_defconfig: bump to
 xilinx-v2024.1
Thread-Index: AQHatlyw+q32/YBg4EqT3k6KiKwGcrG6xt+Q
Date: Thu, 6 Jun 2024 14:01:47 +0000
Message-ID: <CH2PR12MB50047455E62BBAAEADF04558F0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240604085325.2073913-1-neal.frager@amd.com>
In-Reply-To: <20240604085325.2073913-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA1PR12MB6969:EE_
x-ms-office365-filtering-correlation-id: 4b8db2c1-162e-46bd-6992-08dc863134ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|1800799015|366007|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Pz0c6pMXIMAeyd4y3ev6mCZjx4V9PuDP1twC065pYGh8PoNfaF3cUvv9YvfR?=
 =?us-ascii?Q?IRD0njTNi1KIH5O4iTq6x8ewmxgAMdZA8Z9E6G2izC/ncrTBBfF8jMU/gBQy?=
 =?us-ascii?Q?GlIreVaGmFDMzbPo1xPdAOeawbMtk1/4hjt12WPbLy6TdxVvgX1xJO38HgvI?=
 =?us-ascii?Q?kWjRcxOsrOTjatziuPg0sNeTMV0IKOiY+QQxMEDV/chtbWTsHNS0yaZdL689?=
 =?us-ascii?Q?XzLlCChcorR/7XTkB8LUaIMLNAS8enCAR/B9nvF4AmyKb261h3cWOggtzfRA?=
 =?us-ascii?Q?oY0GZfdvJhtIDSAlHz6m2zI/E/Af2vLqK1l3bcDMNnZvsSZ7Y8igFyOxI0dH?=
 =?us-ascii?Q?KugONGOAfTazsSuRAaYOGGVc7N1yI94BLFzvm4bOoimIc5/TlojmRxNJ1oIX?=
 =?us-ascii?Q?PcbNm1THCfsg5tZhSvVHBxWvhTR6DmOfKyYYpTFsrdfj4K2KyISZIsDhBRNq?=
 =?us-ascii?Q?kFzmLvP3pFxREuLc6fnu37qIoEdc8td4AaNjw+uT8wYptvK1rXfqvPsaBe1/?=
 =?us-ascii?Q?FojJW9O8XAbqghGKBXnTR0zJQ7qYWIkEzRj8Bjyn8HZFGKKQ0lOt4D2CvXUO?=
 =?us-ascii?Q?OLVvTKfZ0DCAZXRWnQ9HDeocLrX2TYEBHTani5j7QD4hg8lwn4lCLN/6m1ld?=
 =?us-ascii?Q?4tC81Q+0hhJcpCXYch4YEXMDh+eLAp0ZXLJ5wggFspkDBh6hKxTMRMOJ2Pj9?=
 =?us-ascii?Q?R837b3haL9HlFOCs9o0Xx/H8plhsIwm0QX6QyofkehdZfnUnqyacO95zFh3q?=
 =?us-ascii?Q?mmz3kPp8LR7XGtzyTdS4kyxu3u61c/ZaeVneQ6XdI2ee6BdMihUlJuM0kc7A?=
 =?us-ascii?Q?hwpBi+urecb2vSxrtmuerRquH5HlggrRBeS4exb4EzSsa+NdGr9SgBZeO9vZ?=
 =?us-ascii?Q?tD8HA2yDLjVLeaQ0u70fPvIAtStcOkCSYFFPRzvfncxLTEcg9qf4yPfX2RXN?=
 =?us-ascii?Q?quckFI1pSjyZn1nNUY/K3j/cc7bNTMxwpg1KzqV93NkuLqkM18SCnXNWiwRM?=
 =?us-ascii?Q?wKV6n9bMoM59n/NpGinMs0PxolQrKjuhS0Q5zxkH3FMJcG+E3pmV+gNJE5iU?=
 =?us-ascii?Q?tJrWDZ4L7TGwiaQFAI6ov6YB7sEWks4Je1qc59EgqlMN6O7aK3S2pm4QxoSC?=
 =?us-ascii?Q?9uuw5ziG2nyd2vx7d+WkCozt8uuVUa8j1HdA96Jd3y1PQVCECArV8c2fcwvx?=
 =?us-ascii?Q?zCcFyE1l8mP6Ae2kYWRNLgGqDSR8ocHUdFLNIQCbRjuifzTNTY95h82/QYku?=
 =?us-ascii?Q?zY1ZO0Y4qcaU/rkScOVPiXNsI+SY7YjQ69saGlx1Mvv74mPrt+MG3EZr+8Uq?=
 =?us-ascii?Q?pOgR+qeS3gsfgLiv8cuh3lB6GUDjh0g7SoEPNlpmPDP36uL5Uw5TP7v8oIsF?=
 =?us-ascii?Q?MZFqj5mInx4tr5ASEWnXFQ+HSiI23w61bi3ipwfpC9+m8AhXpA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NrKxx1ytNyo/LROrjEtcZPJpguYkDO2MbTC3l6KXvk6omJsyniWoFDciikL9?=
 =?us-ascii?Q?i3qc+0UipSkyawgtUfxGwUQFFagZaP0FLDPfkP1mbQvrmZcPvbFKh14Wvh5X?=
 =?us-ascii?Q?ffzYmSNjZIjOSNFXn4t39wDEsOXn6JRHp9MkpevAuLpkByqg8dtS/MCoFKA3?=
 =?us-ascii?Q?cRgzVCfl4dOlBQx1bj/XWZA9srqq8vYlPhJxrLZFnyK07vxs09FcUPnBcIbL?=
 =?us-ascii?Q?xk2iYcDpM5Exo3nRfwK6iDujXseaa3m06+WywUWTfhAZ7+LQR1IW0VSZZdgp?=
 =?us-ascii?Q?0MdHqOAcXZQpLMD0jwXN77nKxPySZhuNNHU7SH2txN8ZaoFbIi183lyxt0HW?=
 =?us-ascii?Q?D2GEpiENA4righ7Q2H/mikq3zGRgU1tAfd5VEecRRMvKW8d+MyoVSi9N3YzF?=
 =?us-ascii?Q?iBw5pYsXgMIW4a261k4jIuobdVdiuoPFbrTKkxxGV2GrOThdknGL7WOx9ZZo?=
 =?us-ascii?Q?f2soSuKDfivTR9ZHEfQcfOVzkxEyqt9uvdolb5Oq80aBl8eep5RbdWqb53OD?=
 =?us-ascii?Q?Bv43PAGNT6/1QGoU0c6UkE28so3Pk6iN1JFWkEFouXmHajjB9Q0bbGAxbBPS?=
 =?us-ascii?Q?1IdFKLbZSFM0eG27BqxbdfOPxbN9NVzn3woi7PQ5SXHPzrVCQSanzsSqVDhG?=
 =?us-ascii?Q?0/i3Ozxn/Kkp0mVVt+pyDGjl3Few9gFqQcSSw2f29Z6nUU7YfBTsl6I8tDKI?=
 =?us-ascii?Q?/sl5+tWD0fXUInyWmv0N5yEbCv42hEZU10c1DP7inGypHCTh7xCMgH4L09by?=
 =?us-ascii?Q?r93yq271CQ/UO65VEm0m0DFGo23n7FMmVooNSN3vUf4NJR0s23ooCNBZUIMI?=
 =?us-ascii?Q?lCj1pD5XgP7nDUN3sZa9BmytiDD91XecY1UQ1uhi9L8TbBV7naZAlwApQPvl?=
 =?us-ascii?Q?AwGwT0+HGewRTBCvR8ITyXhxnAOmPWBIIBAjXzPFSsTtBk0P3hRRFkQF2Za7?=
 =?us-ascii?Q?mnPO8NOjGGbyRJIfZGcSZDHJh7S9ZBAxlAYn+qaymz/0Jr3W4DvbxNtyxt5K?=
 =?us-ascii?Q?3rSS8z97QSFBrA0nJ8mWFRC/wxsDNGAhUM7OqC8THH9p/xizoAzMrUTEj4q8?=
 =?us-ascii?Q?mLoE837nZyOaBZSoSa0pRl/K1flk6HejtxdI/QhzxEo4i/+ygk2C2QrwWRTA?=
 =?us-ascii?Q?sXcLkY6X8yfDMIC/Py7aynePfjiC6oXO4hGe1Rc4P9WO+O2wCzOFc2C9IMcp?=
 =?us-ascii?Q?DBro5vM1+oaGG/vD/mjqRFyu0WY+gRSnCNEwrzm2rNgobLb0XiK7Mhlk58oI?=
 =?us-ascii?Q?QAcQgKRbvFErZzHwcc90GuOLdM7HdBGHmAk479hCr3aQuVJG5R09CkSnnJTA?=
 =?us-ascii?Q?Rin54sRhNzxUKEXV8XHgbjPuvz1E+Y5Ir0LEp7ldXJidlFydCkQxkDmALwy3?=
 =?us-ascii?Q?MCw1IpIpB2auJFNYub5TlpHTk5BlUHTLIehs9kJeSpU3CJFqVTBeWlM43uqO?=
 =?us-ascii?Q?nT2bBHSFVTfssAsAAJ6kuP0/H8taSvkyCqvTXNoSISgTJ6j5JNkri7B4ebui?=
 =?us-ascii?Q?sws5fR2+MvNkN1P/vCGWoOQ03mtoEML6vR31izyhiDrkxRnhQcDyY5Ul4ZE7?=
 =?us-ascii?Q?phBGTkQQbL0Oy8JfTj3cyYlvjbA9kxBTfs4H4xUpTitYxxhvf5wQDF7bmbl6?=
 =?us-ascii?Q?TxWH+OYF19dVZFtwiBMUPPE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8db2c1-162e-46bd-6992-08dc863134ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 14:01:47.9167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tbEPgSNTPoezF1TyQgigY5s/8/4/CB69b3jhR9muEDVZ0Q7w/EHCf4juSAJYPqkc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6969
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApXd3FlmI7O/MAIsb9pPCUSIfFXkvgPbI22ZFfFVrv0=;
 b=XJXyDteb8ngQF8QwTu8DP1zeRN84C8eFJ2ecuMkwTPcZpwbDNjYndsKFouJMOHqY+FASTExo4YrIjFWo0XXnIxVVOfAvDn+Aa+7q2BsmbaxcuB69HhtwwcdlR2Vv+uOxNoFnjApQWS1FbzlcMaMDX83Avh83/U+QBPiiJH2ffv4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XJXyDteb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
> the following updates:

> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1

> Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
> needed.

> With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
> the offset between the base address of the boot.bin and u-boot.itb instead of
> a raw base address of u-boot.itb. This allows for A/B firmware updates since
> the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.

And this one to the next branch, if possible?

Thank you!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
