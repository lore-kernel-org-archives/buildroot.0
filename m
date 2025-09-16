Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC64CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 14:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCAF40D3C;
	Tue, 16 Sep 2025 14:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QTahxZnnWrU; Tue, 16 Sep 2025 14:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C627A40D42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C627A40D42;
	Tue, 16 Sep 2025 14:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C012199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 418FB40D3C
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJ9iMLfVaotd for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 14:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::7;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C8B040D55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8B040D55
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C8B040D55
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDTTbz05qxeymtZtJECXkIU8yPy5qFikosrhWRGibDat3RMKPjm/o+KEoZwRbQ3y1eW/25ZDb5EEDWsJK3E4Z5DzEjCjRiWMPyB9HIrXaBDV6dv0UVCdB87Mnp6AlX+2l40ngCC6iyeMrPIkK1EoOWiJuR4UcQm93yDkyruGGo4m3hBKemxC8DO8vln8qcHW0IUa1ncM0nn0995eD0eJKjTPpoHbtuqyqGoAAPi1W3+Z2WTyHmuVZKQ4FrjBadXlWnnrCbVD+1SV/iwCXoPsbjxBkpc76Lk7nPczSN7CBOtaxeKmGtTA46T+/V5VBfpvmHy6bGSQUqTgbPAr7mnPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClPstk6uixACj+it8p1f4P537mDFqOd4uUIAaHMjtIk=;
 b=v2eMXmDvXhEW3r6fFx0AiS4Tnn1bvRpsdacnWLc+F//arguEaaC1BGgViYTpgFMgutdgMmVEsQnCEhjwb3SabILRF2xKP8qLJyxp27J+7+z9M8GfYkSz2UxgJJFdKJC/Obzg6dCcs8fpUftQf+Re1ODHQ7UNiaoMcs2kbZd9nxpgJJoDQAfodPIXrb08/Y2uDRxMQMp+4GjtJ6f2jaLe/tDGLtmgKRM+j/5BFg1dVjARX5giVYA/FU2dLJiZq9JmtvY2Tg8ciWhlWy6h4tfYxA3BxR5eADRJLq80gCBwlggFsJ6K8gu9H7WSyLxKpkatUaDccw0fyk8PcQgeLkEChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15) by PH0PR10MB6957.namprd10.prod.outlook.com
 (2603:10b6:510:285::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 14:19:42 +0000
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::ba61:8a1f:3eb5:a710]) by DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::ba61:8a1f:3eb5:a710%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 14:19:42 +0000
Date: Tue, 16 Sep 2025 09:19:38 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: Christian Hitz <christian@klarinett.li>
Cc: buildroot@buildroot.org, Christian Hitz <christian.hitz@bbv.ch>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Message-ID: <aMlx-vByLFUkXXSh@colin-ia-desktop>
References: <20250818064235.258181-1-christian@klarinett.li>
Content-Disposition: inline
In-Reply-To: <20250818064235.258181-1-christian@klarinett.li>
X-ClientProxiedBy: BL6PEPF00013E04.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:19) To DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF3984739DB:EE_|PH0PR10MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d9e735-942d-477f-3500-08ddf52c1405
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C7Pm7Rctly/U6yDj7E9339T4UYtROQXI1mEQ0x+G/hMLD489Mh0d2DI5BGtJ?=
 =?us-ascii?Q?llMxyqs6ucnqCaNjnA0vuj7Nqvb2gSpsSBzbeYBhp30g3Ba0O6xEjNZtcM3S?=
 =?us-ascii?Q?uoWLbCqwJ0Su4fSXRheS5Q1FmJlmROQOIP3HL6N+IIMILWnh7LiTMBaTcBzq?=
 =?us-ascii?Q?SUXmM52F2yG7hfTVVxgDwZwOvMbSPCWSBMgx0ZBmerxbjA+X7LiQSz7JSUkE?=
 =?us-ascii?Q?C7dFu48tuyYoIRcGHGeQS2sLskjhI1ii0OxElvPEt/U+gPyWY1iJYCJhCujx?=
 =?us-ascii?Q?zK42DJa/puMKbovQWGZvLrH4Uut7KlOJZp102P2DUfMQCPLQI3WpUoUHIy8E?=
 =?us-ascii?Q?2KiteuTxIYrUvqFYvpNrXYolq7UsDV8cH8SJYzHHXmC2gjoEZ66cjACu0oCq?=
 =?us-ascii?Q?voDuKpC0kQ87ONR5E06c/15dA3ovc4Tkx6WoHXubbS9+ZA8N3wCaGI3byNCt?=
 =?us-ascii?Q?Trvcw0KWHlq2UPWBEsAqNulnoPuE1tygyfS601+rxaabpXhrsZzIFZtYhExH?=
 =?us-ascii?Q?E8B3+fPSjVQHRplc2yPVQAh72GiGb1Dzyo4H5uzjc6VtY0utAoPT3s1tZl0f?=
 =?us-ascii?Q?XlLElGKVQ8BBkRduzlsYK8fARPrw7mBfe6hiBpTomQQqwvwNa/uO/9VRPhKR?=
 =?us-ascii?Q?+4DQX35LfhfEO8xZjhYhHMU9aPjzQIwi5ZFg34JNRyMlai1vu+FvwyWFDXVT?=
 =?us-ascii?Q?K9U/PKCK0ZpOpX5t6TvW9HIQUxCRKmqKB66ychf162KvXkB31kmqKW+TzH/D?=
 =?us-ascii?Q?3dEbvRmdxUHQHmrjtHa3idOcymz8YPk720LFRvZe8qrjUp6PuGLvse1XFLXU?=
 =?us-ascii?Q?UcbDrNFPFr3xcZ5832WC7bq2VZUTjbyxtYT9N1PPta2uveDGBCxHM5r4lJhg?=
 =?us-ascii?Q?eZSXtE6rxS8fsbnQsfK31dFGbUMpLS8TD3K3ODHmfkdKqQubzL+ba4M/3eb5?=
 =?us-ascii?Q?3FKgYTFlHlwPgIvnOGjf+DVnnl5SR7lt3Ok25HvE5o/gQ0U9RC1OSw68PlDe?=
 =?us-ascii?Q?AXW/PQa5ZVcfwjfvTrSiwiAJJGBuBrSVN0cQea3mCqdz/BWsD+iDPHGNc8yl?=
 =?us-ascii?Q?Yw9kkK7Ej8OpNkAa5dydsyC8apYwam1ZO6oE6zB+JJ5e+UU8dVIglLh3eP/l?=
 =?us-ascii?Q?UzWkg/GPgMbirZDoAB8+fH6h/EzHllNooI9k+NWh7I0+iseQV3gispWPvrRm?=
 =?us-ascii?Q?i/uy2dACBX6Vgt1iObXP+W9LgVRKunIFx5YwY1gzqor/RNsBvCFYe2ALFIan?=
 =?us-ascii?Q?7hf4Bn2UHSU/r4BjADyuQenLUE0rmhHwuePOV56Fl27YqXqMs5TMXDRlpeGX?=
 =?us-ascii?Q?lIQ36SpJQIVDudBMrBErkW/uwlfjptmfhTTU0A022AwhY+S8UiCPgwIMt2Tv?=
 =?us-ascii?Q?VoZT+Xk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF3984739DB.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5D2NSQryj0MhM7Z6YD8hdTsavi5VIWIQLat/CpM2gi2NQSDDp8h526uHqNJx?=
 =?us-ascii?Q?CYQSzCXEeXDktchx/oaTxbvpV8nEUSVI7P9QL879ihnDYgD0dzvqD8JeGRqH?=
 =?us-ascii?Q?2Xt6v890i4B0lyRDa92k/fHI5ogiTGj9tXvSImlpIt1AXfzEO1dDN5IWCV5c?=
 =?us-ascii?Q?zonvec1U1G0ET3PlDRNYtnM0FvDZslVLz0QlaBjXhdjHUEp3OV9mTDxV96AA?=
 =?us-ascii?Q?Q1Gmu9I22Y0FHFQIU2nOOtK8Z4DKKjJPk8Q31L+vWmSD6cz4dFNzPZBF6yT9?=
 =?us-ascii?Q?evzfKj8Mu9dorvZwSTg+XDlVg0h29Jd8uHU4VnWejcF520/DgWbDsGAcmLm/?=
 =?us-ascii?Q?B9RPJ7Dijvd5nWM+mqHYHM8GGurGri780FkTUXjjjWQHCWJqOu2mZJ7b8yQp?=
 =?us-ascii?Q?wJdnrsgy9/Jqjew1MJQfWm617XzNBj7w0vAzMrLjcI465tgtyiYAtc9G9bDn?=
 =?us-ascii?Q?EZE0KOi2MytNvPr0v3vg/i9uzUz+lRJyM8irc7c1oExDMrU29MxjUvr1YG/h?=
 =?us-ascii?Q?Bh8G9oLcw9qlBFWVVBS2uFGPT0Y7Qjax/wVl+HtbcT7opSoPSBbL6/C60GgU?=
 =?us-ascii?Q?+hUvPvU/MyDQX372//GqycEcAhEYDpONH5S3R9bfzuzuOtAmm2T0gsXHop6k?=
 =?us-ascii?Q?cfFgV3aI6NjFChLugLYzs74VyJotjHjF6IVtU1Et15OcyAhLPy1dtxL9WOlf?=
 =?us-ascii?Q?n2WIoXuIyM78GwEHuCmdPM6Tny+zxOSPmCs+ahaXpXLosqgeaZTT1LNJtk5f?=
 =?us-ascii?Q?t9dNx3GeYGEyRjJ6oBD7oPV/0Kxtac50537Jz5N4RzBke2XgJ23eNCE7dld5?=
 =?us-ascii?Q?UU7SZVz8a8aDKJamxdpHUDveKa16gBCYR5oPjauvBPCxdRzk5qNFmqGYBgZ3?=
 =?us-ascii?Q?hZBZfJHy7RKnAB+4UZZGN8kKwphbBIO+lwgZPJ0+ghE6NhL8rJA2TtROWOpU?=
 =?us-ascii?Q?rVJZbFbh5tAxBNK5qbBAhTstn+Jum4QA3BZoAA7a/3168youK5z+rl1X7VH8?=
 =?us-ascii?Q?m8u9SbYvf2vB/f9Tfvi9fYHLup20Xri4ElrMTmmHsBicWKnkYZyG/gyQ86b+?=
 =?us-ascii?Q?t4Sl17O/2KzGV0j+TIu1JBHRLF7GBqPuWDodkigggExWkUPbI9fnJdUaNEXH?=
 =?us-ascii?Q?LjhHTRF0xWClN+8XUzVBQQoE61FubwPUCSPIuUGZiiTkfEN7/Fu5gNjzbNK1?=
 =?us-ascii?Q?5C2+C0PfEdRsW5CWe8nqDMIlp8xDCJZjtrZeYIa1kDkfZvMfP0j9qSdMsc0J?=
 =?us-ascii?Q?zEQ+kKcECNxjTLM9Ltf+Z4xKzNuccXktM5Uts6CGJ6ckGGwVtJO8tQzR1aa3?=
 =?us-ascii?Q?FMA3jM2CqNqQVEEasuIJHfgtWvigO7+1Dl1HBRJWDAgf8DbvZXWsgYyDnNeY?=
 =?us-ascii?Q?96DjUGVqcAI2aHG95V9a98axwGSTg4+FW3Jinn/X3ExBDAABEorDhQzWZeV/?=
 =?us-ascii?Q?IwFJg/VgpltsEnicGsk3V0dneqnmsi1rLT+66X7lRp59Q4hpyJJVn9lmWGMU?=
 =?us-ascii?Q?nCh1A+gd/7hy+NSSwLHyLk5xv2cZjYKfkdpXpJ4QlVBfO7Ad2ikQuLoeh4SF?=
 =?us-ascii?Q?lTdBgDWhLsyZ720mqf3oF7AGOoKy7e5IXXoKIbw9YWfoiRhOhkEgxQdZDD0k?=
 =?us-ascii?Q?vfbgwFtXVWlFBiIXt8wRmpQ=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d9e735-942d-477f-3500-08ddf52c1405
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF3984739DB.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:19:42.3364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBuafcxRDtB4TcGsXUq24gZGkz24nBWlLBzYSkj6Bz+ztnTQNDPP9Yrp4GEMWzv2gwLb5kvBpuhQXZUdplgr0/i3qwnD/wY//L9bFpuCUBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6957
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClPstk6uixACj+it8p1f4P537mDFqOd4uUIAaHMjtIk=;
 b=EKlmRrEGIm7DRi7f2plQVtv1qd/jKURzCY6p1D55o7JQdUhW2lwivPd0usNOK0uGcWfWyj68wGiwyq4JQAa3qi8Ce257VBwPFFwyGrcWkKkyOekY64eE5Ym+xfy1ZqStoz5MC/nisOhc7USHPPLbdBQSvuevgYh7prfOK3uYXe8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=in-advantage.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=EKlmRrEG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH 2020.02.x] package/systemd: bump required
 toolchain headers for systemd-networkd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, Aug 18, 2025 at 08:42:35AM +0200, Christian Hitz via buildroot wrote:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Since 256.12 systemd-networkd requires kernel >=5.4 due to the inclusion of
> the sockios.h header, which uses the SIOCGSTAMP_OLD macro.

FYI, this seems to break in 2024.02.6. The
TOOLCHAIN_EKTERNAL_BOOTLIN_*_STABLE refer to
BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19.

However, the website https://toolchains.bootlin.com/ suggests the
stable headers are 5.4.296. Perhaps those toolchains only need updating?

It isn't immediately clear which headers are in ARM 14.2.rel1, but that
claims to be AT_LEAST_4_20

The end result I'm seeing is systemd-networkd doesn't compile.
Compilation failed in 2025.02.5, actually, due to the same macro.

Does this need an upstream patch?


Colin Foster
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
