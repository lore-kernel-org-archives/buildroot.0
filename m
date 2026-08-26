Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A09DC5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 06:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07AB3605F7;
	Wed, 26 Aug 2026 06:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iis_2XmEDlAr; Wed, 26 Aug 2026 06:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787725166;
	bh=MnqHPGhWOwdv/iVytN3qXkx0xXGlRZwRpO0pjd7kMLw=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JYmT/wbWfk1K9aQ4D1vh5JQbyVDXqwjZ9oqz/15tIYNGOn5Bl0BG2RlNrWjRxQj5M
	 hfxuXEj4w1sAxum9i5Uvj3TcjXifRLpoEnqDdBOUZ4r5ePeiKDeDa3jw2jSFn7qII0
	 ezy4qk54r6ZZG2l/nY1OVvYFUSTtHnybV3fHLSZ20zxlN4aZ3WpofmT7TjQZ0C44fP
	 bSaVZq/ju+hHVpKRQBiv4csqVZm3wBF+MrxGKNtNqCsDG9H+DXXS+tYbZXUr5KRQGZ
	 KNT4WudFqWVcWsAwG2P6zlRGlVjyINQSV6tYPJdPkrZMOyu8BLJqGVd+vqhw4N0w2s
	 Vzack06tV41Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED0C8605FC;
	Wed, 26 Aug 2026 06:19:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAFF023E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0F9E605FC
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlvFpHOc2Skx for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 06:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87E0060602
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUO1RiGYB5pyfvYYHEHFKER/u9qHcOt+0p9yJ8jOsS7Afau+XCtG8PFGw/z8e2/jOshHT9gypCRdwe+jh9bS79877AIZ4EdHKCuoUxOporWxoU3arKizZPwZbrlx/OpPtTsW0ndYFO8K/ayvZJ+l3bGNhGfBsllrfDpxlMv9rstxvbCxPfW4lQXIGzVm8vKU5ONzWh5yrmhPPFQ+i1hT1J41xcgWA5+wThCQHQ+AH+w3DcxF74Gpc+sIEmXgSe7dy3ARcdBukzfxqObDewmpKkfPmC+k/v4Tdh8+J7Mc0U0O89brkmDbwzJZCiRTMfOCx+02n557qdr/apdKpGzjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7rXe9dPPPHa/mYLT81bWYRWXCwR67rPGdLnSeLj81k=;
 b=lHO07kHb76D6syUBAev6CNsNNk//nqCX7AAqZ23n3X1VuMRFJwqE6I+wk2AaTYQRH9YkkYa3jGlOjpSQbXvwaJhAKtsCVSRCPSSSgqi0SQDjThkvwBtUeiuImww9nhaXpkGbd3RQRWoZrboO7l2UyMQ1xdnqGedghTPMmwlQJ0tn3mkkbdvFQ4kc98Z/2XaiZLNfVknsfk7h50MwuJt1il5Ihf/PVrxJn7d2Yu/RYMzhI+u8tjFtozG7MSrW3vK4hPdlILSVp+W1m8H5dKWAX2BBdpKiyQ+T8IUK0QksRasv80UFeWD9zGaerjOU3kcEnvLtsWpUKirS0ntaI+DhFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 06:19:16 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 06:19:15 +0000
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>, Matthew Weber
 <mathew.l.weber3@boeing.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "john.ernberg@actia.se" <john.ernberg@actia.se>, 
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v4 3/4] package/xen: add custom tarball
 support
Thread-Index: AQHdI1fGvunlbezGUEK7Ax9nA9wpDLauky+AgAFrTQA=
Date: Wed, 26 Aug 2026 06:19:15 +0000
Message-ID: <BL1PR12MB50328CB0D38E9C3F2D91DCB6F0AE2@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260803145152.102135-1-neal.frager@amd.com>
 <20260803145152.102135-3-neal.frager@amd.com>
 <dd93f44f-eb98-454b-8061-1589bb9cef63@amd.com>
In-Reply-To: <dd93f44f-eb98-454b-8061-1589bb9cef63@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-26T06:17:35.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|IA1PR12MB7687:EE_
x-ms-office365-filtering-correlation-id: 9f826fe7-42f1-46ca-d8a0-08df0339f448
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|7416014|376014|13003099007|38070700021|6133799003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003|41080700001;
x-microsoft-antispam-message-info: r18sT3++8Q2y2GWwD5ckQYuzxjATn63/f2HJQ+KLiR4YlqTQW6O2VUR66nrjD5ATXOGV/kSxX3UemD8dNYxjkHlGS6CRb4ekbrUcU8ttJ05DAJ2ep94SVj+x/cQxxfx8vlnkTZVExL6iHD1Jp/tPUHRqWZnfQ2UJf8QYE9UN9zVOreCOvMAQUMwVZnrBkNuqrPOazK6osksGEpfxbrNwuEVCkjZ/94VbyK6PYeH6A+9gKnfRsxt0AANpM80QzpawTcNkX3x/MyHiLsjnDi66sGtWc4YvNqIg5b61TuaSInZwEysV3gsoqBZrDmFiJEsFIh47nNi7yucaID8NvTA/XXBhOVDkoyv0Zr2+2OEm31j6e3uqAV39uPjLJLVuYVi/kMTOLSK738eZWh5xBrxlaiGJnAMCTwNNCXzAUrxB+QY5SxAtTsBv/rLvXdJc9rBkySIDjNshfiqx+2rmItjNGITSCrbRdNeLOTePypDjwW3gvpd1ylfbUfNk/gl6NCYTUTUcM7mAP+TPeppNMLQ1+pjJgdYb48oOnLnyepJdSNv4vMOQrmX6K86Uqx6cmWaBr1jXPSkw+01Y5tl0AKaQB/SNFgl+tSVmKWJ4tIKvMWfu+odC1gaWbsYx/uS/BaG9k9dGm6BfI1No4v/zw8ob2Xx91ig4MPj0iN1ZcZEMUPzSwzyqFua3eIY/HIQtlC8hNTaSla7ICJT3EGyij6eB2g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(13003099007)(38070700021)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dy9ZUHNHbWVFYVlwUkVaUkorN1hqTUFwaU9sWURYY2pYSHZ5anpjU3lXQmZ0?=
 =?utf-8?B?bmZQaVQzaDRIaHBTMEtzQ3BpQ1Zib2NORS9iNnZjdzR2TjdZb2hwNWcvN1JT?=
 =?utf-8?B?ZnVpMGYrY1hzME9QZzJuWjRMdmdGbWJvUElVbUozeWM3KzZWSmNnVmFzK1pu?=
 =?utf-8?B?dlIrb1lZZ3MyTCs4cGpaK2sxSHY0QUdsNys1Mm94Wjlud0FUZjZUSWpMZ1lF?=
 =?utf-8?B?WXd2ZU9VVlh4RlpJc085eWEvMGxBUUlOUkZLTnpuVm8rRTMwZkl6K1B0T2Va?=
 =?utf-8?B?cm02VTlrRkhUbEN6emErWERUdktkSnVzcllKU21maENzb055Qk5hT1lKb0th?=
 =?utf-8?B?ako2N3hVUkIwWVg2T20vUEU3VmNNNGNnTmdIN3FDQUNJVUs4TzdqcEZTMVJs?=
 =?utf-8?B?RVRET1VCMU1Da1p6anpnT0taZDVnSDlyUkl2UWlLSEtKNitWRUtGMXJXQ0xO?=
 =?utf-8?B?SUVySW5HbXZzeGlPazRHWHFUZm1qTVJLRzFxSDJSOTdjQmN1R1JGTDlGWVNF?=
 =?utf-8?B?YktFV2dmTjVIRCtaMVdGNWE3MVNEVThCWnp0TlNiL1puMEMzWkREdUNiNnJ4?=
 =?utf-8?B?L0NmUmxDQmVYdWRCbGVaL1BEOVBpeFk4Y2llV08wa2ZWNXNGYksrdEw4L25i?=
 =?utf-8?B?cGxsVmd4VjEwSjEyWTBIeTBVdWVYTnRVUEUrSE5TSVhwbTlYTlBkMFBuSkFO?=
 =?utf-8?B?emtpaW9pTHZuT1UrMGdYOWh3a2ZSUVF6YzFETzRycTlNQXZYam5EbXh2QkVD?=
 =?utf-8?B?OUtjTEhIazF1WXE3Y2tSaUFKbDFtM3FHbDFEd2oySmZENXVRcFdpdXhyb1Vi?=
 =?utf-8?B?VXpBbzhKWmhyYWk0WGNHUUxFaFFmSXhZRkxYMWE1ZU5YR25xUXhyWWpYSGVJ?=
 =?utf-8?B?Ui9ndVBEL3N3dVdzT04reVQrajB1cFNzTVlPMGRaemgvZ2lNSHFyb0V2SG1q?=
 =?utf-8?B?UFVLek8zdkRtQ3JGYWtKUCs3bXhTUDlEMFN2RkxLbnB2TW9tbTAyUjczYnZi?=
 =?utf-8?B?a3RLZXhPVXc1SWNlOWRwMHVUMW9EMStUSVZBSTlDMWhYSGplZzdpKzY1Z0Vp?=
 =?utf-8?B?TGZPWXlTWnNoYzRvc2ZmTkZweUQ1N1g0UWE4dWtPVEhIbElodGxLNm9aZ3RW?=
 =?utf-8?B?TlR3VjdUc0N2eXJaZkkwWGx2cFFFYVhFTUw0TENiUkZWS0tVMjZJUEEzeHVs?=
 =?utf-8?B?RFJwbmFxTnpVcmhaVkg3dkQ5SFpWaEtBa3ZXeEtVL3MyOUxTcFZFbmsvT256?=
 =?utf-8?B?UUtuYUJCMTVSOGtLcmZTWURKM1Bmc1BWTFQ4M2tVODF2QXU4SFpmTzc4SWNL?=
 =?utf-8?B?SHpWckxLMzNDNzB1UlFWbnNCUGU2TXhONkRJeXdRTzQwU3ZsTzdhL09lY21s?=
 =?utf-8?B?MVc3V3d1M0RmWk4zWm4wVlBvRExpbXltWC8rMHlMK2pNcjJzN2gvMUJjUDN5?=
 =?utf-8?B?N1lCN2ZsNnlzV3c0OExXcWF0eGJQdno4aTRoYVh0YUxvaTJId3hqOHkzUktP?=
 =?utf-8?B?S1pxNXZBNnMyYzh6RWZYUm93aGR3aTUzWWtsU3ZTaE4xZDFxM0haSElMNWlh?=
 =?utf-8?B?RGwxcmp3em5ic0R0NE4rclhEWXNENmRTcGQ5MWdmZTRtUllOLy94MTZBQXRo?=
 =?utf-8?B?UmpYL3hkQ3NqSXlGanltdDVPYXA1TGVwK3J3WVhQajZhb1VteWMrS3pKaWg4?=
 =?utf-8?B?ZVV1UVRZRS90MmlZaWN0ZDIyU2hTekVzSkJGdURlalRWWjdXVFJXVDVqbmZM?=
 =?utf-8?B?clhqaktYWEhFUFlhQjg4WGc1YVRKRTVTQ1c4OTRQT092RHh5dlRMNzF2azVl?=
 =?utf-8?B?VDhaUitBMTFvZGNzTWVwVEt1dnBCbER6cU10ZEFqMXBSMEY3Rlc4L1A3VXMw?=
 =?utf-8?B?L1NGWWFyUXV5aDk0cEdRSWdWdWZnZ2VnZ2M1bktTN2pkTm82Qm1jRmc0UWFj?=
 =?utf-8?B?RzdhQ1J2UUd2WFR5QVRJa0FYSWpodHU4WXQwRzBjVTdLck9CZURtVmU3ZmU4?=
 =?utf-8?B?YXBhanpkbGVoVDU1TjhpdjJNMmU4T3lzekxyMVBDYW8rTmlVMUl0UjBUWDND?=
 =?utf-8?B?eWpPUDIvdHRRMEV5WG9hSkJpL1hNcmdHRXZ4aDMxVXBaakZwQ3VHeFpnWDcr?=
 =?utf-8?B?OWFwQVhqUElPL3FiM0paS21EcWNzZU5yeVEybVRzdjRTV3R1M0J4ZDlXRVJI?=
 =?utf-8?B?bXc4aUJzbEI3ZjhjZ2M5V2twdTluRTlLWW5ialBYVnBhYlFON0p4RXNpSnJF?=
 =?utf-8?B?aldLdDc4L0hNWjJqZUkyRXVCN2Uvdnh4MVNncGtVcGpvOU9UcDk4c3l6Wmxs?=
 =?utf-8?Q?p23cQ2TvHhFPzH/u6G?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f826fe7-42f1-46ca-d8a0-08df0339f448
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 06:19:15.6197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zr8/XOP5Ao/423DKf4euPA20ODB5iv5HBxc+Ki78I4AwAoiGdCICpYkrDdqyPe3W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
Subject: Re: [Buildroot] [PATCH v4 3/4] package/xen: add custom tarball
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Stewart.

> Add support for custom tarballs such as tarballs from vendor Xen trees.
>
> To test this feature, use the following configs to test latest release of the
> Xilinx Xen vendor tree.
>
> To test:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx-rebase-v4.21_2026.1)/xlnx-rebase-v4.21_2026.1.tar.gz"
>
> Add to package/xen/xen.hash:
> sha256  03498f51b8daae70c429ace4bde6e2be679b3a0ac28b886c7335c022feef6100  xlnx-rebase-v4.21_2026.1.tar.gz
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
> Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
> Reviewed-by: John Ernberg <john.ernberg@actia.se>
>
> ---
> V1->V2:
> - rebased to updated master branch
> - added the line move of the XEN_SITE definition
> V2->V4:
> - merged into new patch series as the second patch
> ---
>  package/xen/Config.in | 11 +++++++++++
>  package/xen/xen.mk    | 19 ++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/package/xen/Config.in b/package/xen/Config.in
> index e50b232f0a..3726504334 100644
> --- a/package/xen/Config.in
> +++ b/package/xen/Config.in
> @@ -23,8 +23,18 @@ config BR2_PACKAGE_XEN_CUSTOM_VERSION
>       help
>         This option allows to use a specific official version
>
> +config BR2_PACKAGE_XEN_CUSTOM_TARBALL
> +     bool "Custom tarball"
> +
>  endchoice
>
> +if BR2_PACKAGE_XEN_CUSTOM_TARBALL
> +
> +config BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION
> +     string "URL of custom Xen tarball"
> +
> +endif
> +
>  config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
>       string "Xen version"
>       depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
> @@ -34,6 +44,7 @@ config BR2_PACKAGE_XEN_VERSION
>       default "4.21.1"        if BR2_PACKAGE_XEN_LATEST_VERSION
>       default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
>                               if BR2_PACKAGE_XEN_CUSTOM_VERSION
> +     default "custom"        if BR2_PACKAGE_XEN_CUSTOM_TARBALL
>
>  config BR2_PACKAGE_XEN_HYPERVISOR
>       bool "Xen hypervisor"
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 51d51333ac..81568020d5 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -5,7 +5,6 @@
>  ################################################################################
>
>  XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
> -XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
>  XEN_SELINUX_MODULES = systemd udev xen
>  XEN_LICENSE = GPL-2.0
>  XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
> @@ -19,6 +18,18 @@ XEN_DEPENDENCIES = \
>       host-python3 \
>       host-python-distlib
>
> +ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
> +# Handle custom Xen tarballs as specified by the configuration
> +XEN_TARBALL = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION))
> +XEN_SITE = $(patsubst %/,%,$(dir $(XEN_TARBALL)))
> +XEN_SOURCE = $(notdir $(XEN_TARBALL))
> +else
> +# Handle stable official Xen versions
> +XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
> +endif
> +
> +BR_NO_CHECK_HASH_FOR += $(XEN_SOURCE)


> I'm curious why you're adding XEN_SOURCE to BR_NO_CHECK_HASH_FOR, yet it's
> still required to manually add the hash to xen.hash?

You are right.  Thank you for catching this.

I added this early on when developing these patches and forgot to remove it.
It always helps to have another set of eyes reviewing!

Thanks!

> +
>  # Calculate XEN_ARCH
>  ifeq ($(ARCH),aarch64)
>  XEN_ARCH = arm64
> @@ -90,4 +101,10 @@ XEN_INSTALL_TARGET = NO
>  XEN_CONF_OPTS += --disable-tools
>  endif
>
> +ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)),)
> +$(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)
> +endif
> +endif
> +
>  $(eval $(autotools-package))

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
