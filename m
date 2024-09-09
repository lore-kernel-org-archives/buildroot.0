Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F6EECE57B
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 08:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7D5D400F9;
	Mon,  9 Sep 2024 08:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K18nsxen-5MM; Mon,  9 Sep 2024 08:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AF5A4037C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF5A4037C;
	Mon,  9 Sep 2024 08:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC811BF3AF
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 08:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A56C80ABA
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 08:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ByUZXvc66uS for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 08:31:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::627;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2B9280AB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2B9280AB1
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2B9280AB1
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 08:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raOvXJ8RcFpQa0Vzw12XsD6/N5Z+r3ADLaBv+D02z7QZLDY4To4Njh9ajIp/7eIZFE8Ty0TaEbIifp0zKZjbBi2eonR7bz21MhYevxhIJL2c0ryCmuB1NDhf4hh/RwYoGiBkvVg5qLj+XDD5ShwDJXBif1o2DRElsRqLc/qZC66Gj+8o4rAJGbkCM+nu99anwaGpyI2ZBAmGdEQJRWvmW1iGO5lKt9bJ4SobdUr0jo2pvmc1ybz17QcUEov/mwF66Z/EtFpb9KBKrFITokxoYYcrUTYWT1v3PbBXTj8W8uuCbym5YGhlvI3K5KHJ8E8v2vEDmfb9UAxWBgFywpdEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KwKC2lB0hHQVynl/5R4I/Ock0Pg/kSDJtq+JaIGg54=;
 b=OnLQ0Pb95vWkHPy5xtUb9EiFyjdyzU1Zp32FV1pZj7suSUfmO2VR+wRCWBNCpNgXne4GCLA6DpBWsuJg2HwLCelrqTmHLamjVacLudwQTvkBeT+F6kuhYiQG8o8FFbxG5D/InGGd08+D1F9h5tGBJD6vleGhDg/BsTH9+PTaPzteIKTj4I8V9i+Y5DJzqVFXrViFMWsFWs3T99+uUzEDZ1k/DPLAszwviEdJokgiJfA6bpv+V/xX7vbL3sG6fQJvXx4Mu7vm6MRy6nj3wotlz7S/UdybqwhDhrGt4HXB7tGumtlKQKf/REoX5FNEmgG5MuibOXHDRXVbl6PcGiVPWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 9 Sep
 2024 08:31:27 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 08:31:27 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 1/1] board/xilinx: bump to linux 6.6.40
Thread-Index: AQHa7HYKOTF8QjpK6EeE1Yw9YA6hibIuZPIAgCDnP9A=
Date: Mon, 9 Sep 2024 08:31:26 +0000
Message-ID: <CH2PR12MB5004C62CEDAE64725AF5D50CF0992@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240812051058.2911075-1-neal.frager@amd.com>
 <20240819120244.7e17ad7a@booty>
In-Reply-To: <20240819120244.7e17ad7a@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM6PR12MB4203:EE_
x-ms-office365-filtering-correlation-id: cbc33018-30c9-4c36-4422-08dcd0a9cbfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?cPMRt8NMDRXbU81mfyQvpvu622V+71XymkyWkUOvCd840a4saMzc/yPDGhU/?=
 =?us-ascii?Q?c7ATFcAE/pC+KzemTMTwLn94F2upxWvUgTlBf3ovpJ/LQg18DrL0sk6PE0sf?=
 =?us-ascii?Q?YSVEyAHltt5LPZRhA02LCvNVKNg0zYhwuNlqP4s3jrpKMoayKuUVn+nov6Xh?=
 =?us-ascii?Q?3Q5EOoOkUrMcX0pTSFttV/PFxdRL3b6xpme2r9AJL8+kq0rj4Z+Xv96oRvvL?=
 =?us-ascii?Q?poYElvaRUCIYC76wbp6kFeqpQHWniysNPl1hOSI6v9NyJdpn+njvm9GaQIR2?=
 =?us-ascii?Q?YR3UuCTyKtx1/xcm+WhOxezGWIFIua/5nZZnC3wll1r7o+3Zz7WNqSfJjNzx?=
 =?us-ascii?Q?JzGOMBdnqZmpsEi+URF51lu6ywJUomqUhaXidVd2mzb2sukXn844knaIhAqG?=
 =?us-ascii?Q?svcg5ajVitgdOs3VkHZcoIM2oJms4b6UibOrWhWJIUZsdZgvFEu2Jgg8hPQ9?=
 =?us-ascii?Q?VkMkJshdK8fGSj+HU5W9QfcwNPqLNse7ANHbQfVeMnhYfUrrrcMRoEWgIpMy?=
 =?us-ascii?Q?aUK0OlkgYpBEbMozFdaJFtgDU7avdmleFeLwxgqZidUn0JUf5xb0wrIMcDLx?=
 =?us-ascii?Q?u4EAER6nA+PO3eMEz6LNB0krL6tK1Bf02HHty1Xj3b8fgCwXN9S1Ni79zqV/?=
 =?us-ascii?Q?2xJpLmYU+L2Oz6mevcJEHgYTgU6yPrCN0YTpSRzSqMPOJRaKFRyeXt7Rfp2e?=
 =?us-ascii?Q?4cGQaeExCJixAf4TOnuj7Cp8FqMj0ZpV8K6aGfSzdH2l/lWBZWL8IhRDRwZL?=
 =?us-ascii?Q?clOB3tMAIO/80jQpm8etRfHLHLeSvzArXZ+27Si+PIjHNVOdVj6DqDF0LfY7?=
 =?us-ascii?Q?D3bNlIhUjALdN1NoB78ygRSjVhzuD3I5DbxBbt3IlHYE3LFcNiMnJPxGcwam?=
 =?us-ascii?Q?IE7M2MY0lhMOIArzpVt116todUvVQpbcKWgRtdwfiN68KzcOtj8KT1YvAaHj?=
 =?us-ascii?Q?980No/kUh17M/f+82ty2d7icj2GTx3AHlcSN3B7oLWrkAtREvCLJhCpztUGU?=
 =?us-ascii?Q?ByBvvPJzu2XQ/+JQ3eVOsW03sUZCBhjSuiG2ozbjdqPsjPzFJq7/pDdtReFf?=
 =?us-ascii?Q?XwzAYiO2AQGZ6zgMpEyB+Rxq6klNlcCoyGYhs2ZVD6r9DglAfxCzK7ehzz6T?=
 =?us-ascii?Q?m60sVv/VCASCHTwQV1A50AfnklYFQhL3zKi4Qy+GDd41mTAOXEjEfxW2Cccr?=
 =?us-ascii?Q?XLuwziqA5LznLWthpaXVp0z3pY3UTBBX7I8kXRwwIjKEBz+WZ/NcsmhlQdrL?=
 =?us-ascii?Q?lLOa4+bDvEGEWGNPsad/hPTSAHIOGKp79+7puC1ZZYr62cjYDiFOaT98JOWf?=
 =?us-ascii?Q?wXxclElIUyi4Zyj/BCU3/m4nxXVW+gtoM4V7GskJJm5719rYVIiJbFpHPEZf?=
 =?us-ascii?Q?pR0TT5RbJyv9lvTiTU31FgwBG3ihpLil6U4tOlYEBpueCZvYsYR2GVIj0GR9?=
 =?us-ascii?Q?cqhTkjrhqVucgg3uIJVb0NG1OuwvZoTY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AgXcvB2B1FfdSPfe+8fohi9zLmcJ5iH1ptEyVQVK02juWCkdEWSfkk6N8tvU?=
 =?us-ascii?Q?bdiDUYVgpQkVtMTX8IYaP+M7gOe5ixj26GqIHf14uhicn8b8ssb1VlaN4Cur?=
 =?us-ascii?Q?nRPgaRl5dq5JkhOd3/vCWpXtepUlslmYuomw3JX6Tn486fXhGlWnhChvvrGT?=
 =?us-ascii?Q?9pZo5UPld3H9eULMSSq5kl8fNs2TUh/fxS1AhSpMrgF7Zi8N3rFOX+NS6/xl?=
 =?us-ascii?Q?ZBtbL2P5aA/hjm41diwJu/6zNYqMEiN323ElpVmZxJHyW4yWvQRCdnjQ6XHe?=
 =?us-ascii?Q?D0p9B4CTLndgC0T6QJucp3lcHnTdrRffwG9Ot9DztzYkQ7u2M4DeKu33UzmM?=
 =?us-ascii?Q?eljo3NsPJiMc8Rxnpqogk/2ger4qluS5jrM+SpSHnDA2HjyFRTtTPOh2zaHO?=
 =?us-ascii?Q?F5glhcAWKlVFTvVlfDaYt9R+4aXLDEjDTjo3XFGIWZ9JvXJddwbm8SbOCe3n?=
 =?us-ascii?Q?20VYvjA9RqT+4a1/WTfHn5FDPt7Df2IrRGvPs+DYXhXj/76r/m9+a9XKhomI?=
 =?us-ascii?Q?WRzLZqo4tvPm+nBZebxCgi+Rqvx8vQeyQoctLapbHc0Ps9pqq9MdRb282mhl?=
 =?us-ascii?Q?PoNZQB3/i2sURxaEx3kLkTbvKLp688cNeheUjNs7naHxEUUV+ieoK6BK7ZV3?=
 =?us-ascii?Q?rh/3kc//Dqqra3VThC7VbA3XXOjfFYPL4iRHgJDN3s7DHKcRM9sAz3MMllw+?=
 =?us-ascii?Q?DaINpM1RYtGUW9dMbuGoUcwOAN7TOCN7Kpw+DkfF27P7BisYQDxtEV3c38xr?=
 =?us-ascii?Q?RjlNgY71h1NgRVp1o7pPoshXQDUDrtLkOTbLJwkpvXCAQfbI1ImWKhikCOME?=
 =?us-ascii?Q?zj1EUTlOrz3D6duILbLxu33l4NbHv0idel0aK1br0wEADDSorPu/6cxUKqkM?=
 =?us-ascii?Q?kod3q5ephuGpZdSMAV7k1gqLXjkLx20p6yNX8fRqE7zkev9Rgu9zS7iQPd/Y?=
 =?us-ascii?Q?Y1Dd8pOuF408o25bgoSv/nEl/jUtf45UOfz2OW9zIUeMvousCTJXkh9xHIoh?=
 =?us-ascii?Q?LslEqqcp5b/J0820oZFAMalj8Ehy1sELVBn6scgcKpPg0mtkr8NbPvY2bagH?=
 =?us-ascii?Q?11EId8X7EaumYnNM7XUiGVXHvG/HpD51Zu+7LSKxDqPyRhsJpGe1sikS5BHM?=
 =?us-ascii?Q?d/mfwolVEcr9yrtvgBBpPxKEDQUDArnDbFWb4Q4rtqND/22zRbr8M2elbWQa?=
 =?us-ascii?Q?c95+TBvM77padZixNvQTnLzM3YhJuy4xJFj1oGeTwltWhQIsE6zYMU1n4+v9?=
 =?us-ascii?Q?TLO7cvHD6NCTdh7AZPW4WhY3hRmc0nz9PkCsZoYoer/8uU1XAW8k7HKJLBaF?=
 =?us-ascii?Q?hexWU+JNaHe3bMnWGGO69E6ifITvtalsbon9kBP4XfXSgrAaNDXdiBi/U8Cj?=
 =?us-ascii?Q?5caGkOwUT35wpZiOh5N4lEmDI7rb3zirPZJ4t7ZrFZhL5KjYE3HMlm4DY8pU?=
 =?us-ascii?Q?u8GB/AV0wwcRrb0t8a2zVz9dZl9ahNJdmUKla52HQ/sWMdfYopoqWk0jaJy7?=
 =?us-ascii?Q?P+sVn8Z30OU0wPae1ofWttyNvRB2IhlCuZf+OfqTYvYYSElIEAJi9dRfpUXL?=
 =?us-ascii?Q?0LqUf9mtgJXid/1SGnA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc33018-30c9-4c36-4422-08dcd0a9cbfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 08:31:26.9442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lYL3/+75AYLpv6m8r7SqKE2jP0Nlv3eFtQzoZfPBoavOgwtJa3Ksd/AIsIm2pBo3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KwKC2lB0hHQVynl/5R4I/Ock0Pg/kSDJtq+JaIGg54=;
 b=mIJnb/HDpUkRlIeEhc0F7hMBnhTfUQznqpbzNB+8Hqbi+4B1YKB+XgLVVeB25MF8OjJv/CN4LcP6J09h5r/tda0Z3kGxHs/NHwjVnQ03iF/y9QZ9F3kHe07VeyeuuTVHHpEOTfGwjuMLvyILK/oXa9dn7GlH0uDNVcrA3rEtPsE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mIJnb/HD
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] board/xilinx: bump to linux 6.6.40
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

> This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
> 
> Xilinx Evaluation Boards:
> configs/versal_vck190_defconfig
> configs/versal_vpk180_defconfig
> configs/zynq_microzed_defconfig
> configs/zynq_zc702_defconfig
> configs/zynq_zc706_defconfig
> configs/zynq_zed_defconfig
> configs/zynqmp_kria_kd240_defconfig
> configs/zynqmp_kria_kr260_defconfig
> configs/zynqmp_kria_kv260_defconfig
> configs/zynqmp_zcu102_defconfig
> configs/zynqmp_zcu104_defconfig
> configs/zynqmp_zcu106_defconfig
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Just a friendly reminder.  Thanks!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
