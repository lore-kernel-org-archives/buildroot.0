Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93D4CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 15:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9888860A90;
	Wed, 13 Aug 2025 15:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3V1MVHVT9g2; Wed, 13 Aug 2025 15:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97FED60A95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97FED60A95;
	Wed, 13 Aug 2025 15:28:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8D7C1C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9DE881E74
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4efjFruDM8f for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 15:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::623;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F64D81D16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F64D81D16
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F64D81D16
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOkAWpRk0S7syGVGRUt6TMjS/1IBLymEOMIYf2uDU3g4tjHRrZisY8wZ9NSuvP6PRj0p0+6y8FGvmpe4ZekEAaGwB35Y3K8CUirXlJLSALOTFDQsrcIwd3NHf4u1tpnMHaYG6/uEFrOcPvCtrpvTSZNlhdN76tJsdsUKHZcxObxPgibIhAWdqESUb5MRNQQYxwcHNZN4gl70hYsf35gL1OQyLoFJhySBHONuiyHmXZdnjNzMi5U28OkdiL6grGGGHDL9gHm3YFpH2i+bX3zbHCxUVCTKiduyJKd8KAex2S3wfw6U1sp42nXglbg5B8HaoR7w0kvvM9bhqDOaea5Elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCmBoWEgRYX0KV3id78r22o97o3UtYCyhBPNR+ruYqw=;
 b=C8Wzm20eEYbyT8MAm0qWzBmmKk4S1qmDQU2p9hvvlcVUspcFhs0ofTsYnC1hddx5diHjP8392b7z+DeJ79ZDLkwE3qh7xuD1Yr+TgCI0a7ERd1pLUDg5SgSMfznoBW/jD57iGCMBTVk04aoE9O4D5cKbLnZFvpxhl7p7DDjeH3nejEe13OLkDLFR60sSkQImvHwVWAl83ct5le6hb8JjisPjNOtjoqPtJOYsTUMzMA2H//jlT/kBZxIZT3UKu81amBRrBNwzXCLxOy7TMngesCIF2+Ca0yLRKCzI1E6k8azUdsCHzIzWT1OKNJWb9U1RezG6QCCm3QnXhvLEE6v6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SJ2PR12MB9087.namprd12.prod.outlook.com (2603:10b6:a03:562::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 15:28:00 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 15:28:00 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "yann.morin@orange.com" <yann.morin@orange.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
Thread-Index: AQHcDC5rImx9aiqWN0OWo4Ty98gAUbRgTsyAgAAB8ICAAAOasIAABXwAgAAF3OCAAA29gIAACYbQgAAd3ACAAA2dQIAABgwAgAAL1sA=
Date: Wed, 13 Aug 2025 15:28:00 +0000
Message-ID: <SA1PR12MB5615804C1824C82F59F1FEAFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3>	<20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
 <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxyq8E0t+89Dxh2@yd-6wlzhs3>
 <SA1PR12MB56150000BDD0EC7C783A9CEFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813153132.5942d8f7@booty>
 <SA1PR12MB5615D280061C41231F1D0DA3F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813164154.797c9077@booty>
In-Reply-To: <20250813164154.797c9077@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-13T15:24:15.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SJ2PR12MB9087:EE_
x-ms-office365-filtering-correlation-id: 6fcccae3-cd78-4186-ba6b-08ddda7dfcf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/KJDGKcHWy7OwV3puMOFKesrIeB/dlcMVOFVuDXLJsHM9Ir4Y8IfKxdSmrGU?=
 =?us-ascii?Q?f/pgcaJ66BWKaeNlRPpH3TEV+Rc6K6PDh22UzlBCPFbd6YfsVr+LeX5pWeiW?=
 =?us-ascii?Q?ARKFBLYCRmhcFY8yGT3H7VOa7YhAglC++weyinb8Cg3oh0eijMlgEYAzdKiA?=
 =?us-ascii?Q?R8zMR+Lqndjay4Zb3Z2b3anJhBXS3LlSavhWbuybYdXYPzRrMpKdRPxNRSo5?=
 =?us-ascii?Q?MKcn/1rjNKhkN5U5WihYoyw6dnUOOXzLzwZUq4EUSmHwoKZHaJufN7LE7FdG?=
 =?us-ascii?Q?KD5S6NiBlrKj2tyh9kQ/54zyCD0OIZ2btxgoRfe8+3bU3AuV9BMEXf5HZND4?=
 =?us-ascii?Q?uTm4ApoNVZqQYf32ezHbM62EcUY32JUTEpLMMxp09KKfmLCu3kQatJgwGf0C?=
 =?us-ascii?Q?83t0x5ugm+Lie6Vy9ljvof98aHvyCmpmV/VFwmTZoh7iOzn4LFWOZdSsBZfD?=
 =?us-ascii?Q?kox6syX5SRAQWs6/vo64278CDCfnONrgyiBtY6ShJ7Zj6FHaaB7s7u7ZNYA7?=
 =?us-ascii?Q?v8CqLlO7evviQQ2lVUOlv6ldxDcIOf9to6O04B28yzqgHtXuKScPtT+L3K9X?=
 =?us-ascii?Q?QT9WBpvI/12lyMTCPSzjMONo+AWy+xiO0s7i3eIUVrAKx+yz7gfk58HFhYOR?=
 =?us-ascii?Q?l4IgX3zpJeWiuSivfS6Ij9bF5xdbRCCl6DE7PUdukqElhs3CZot5zAMb3ANV?=
 =?us-ascii?Q?BQFBvaKVrs3A/zau/486FiUoBzNgaq/fzqjus+x9cRClVU1PXbatB5yVIXOc?=
 =?us-ascii?Q?LvQZ8ZhZ69XD+FuRCpb6+YcqrFkpTESUReqMOGFwiXwZ+f42NAcZygyLZxq/?=
 =?us-ascii?Q?2xc0pDVmFMTjWiTK0RwlgBVX2UyUa4DNYoCSIclL5sSI2bjEIKYz5b4ucRFL?=
 =?us-ascii?Q?3XeeghK8O7R6XBiV1vJxUmxfRG2cIQ3QwtyNkuuG1tBRiKlrH03gPgcxSUcQ?=
 =?us-ascii?Q?HW6LWIBRnkM6xci/beE4/9Gh7qLRHWXEOHqM4tLNS4WBdr4Bx0yJyR6ptpYR?=
 =?us-ascii?Q?Srk/NcU0WbAK5t86feJuXo3+j1MCAnf/2brj0fZSi5uyRsFEzXyaxREhWbHO?=
 =?us-ascii?Q?bInpFnSzfDLhQLw/J3GWGr5d1b6JmUkClmM4PdnZj3he/okyt8MdCdeywwgz?=
 =?us-ascii?Q?yu+QKsQmiybg6hrSeNB3M6QXFE4hL9E+0LkRd6TIbcUaANiOMjC+0Zyumb+q?=
 =?us-ascii?Q?Qgm5geZSqxp6wN4CTkAc32syZP3jVlWYKn2eX+SH057359bbjx+Iatn/W/Hb?=
 =?us-ascii?Q?xWjjvVSnXiRjy3qOjJ8k8BGFhqRgVnzLiFIodREI53yO65r703Ug6l9rBzxw?=
 =?us-ascii?Q?Kp6zA9MkIpU5DDyhWps4/D72WO0PSLeXL5LHVz+blq75Rmepmer9CslI8BZb?=
 =?us-ascii?Q?VmPxGiKDEQwIsn2qKfzTdM77F2n8dR3vW4D7ucGdJqhkVAFAcKzrlC89kuWb?=
 =?us-ascii?Q?eO8wL6GipsN6Qd5kTA6vlD17XYVB2MTJxR5XdqhWaJD6+a0WFr8KG/I62W0G?=
 =?us-ascii?Q?GWVta+LJHaMMbNq+SmC2yKR2d32TE2JIloOF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6IJ5v8hyDbHRjtRzJtbenLUDv8WOly3EJAqm5K4bptP9HOeIai2l6O6AFNRj?=
 =?us-ascii?Q?yTr7Jtansjm2CYarxEL59MWEedtm49BDPm4bpyq6wILHZlK0HMCN+bILyAnc?=
 =?us-ascii?Q?kZJu8oS2g0aQSU+FcbXHi7hScqLp15EwBDnWLL4MLEaoRwKK1ATvZrDY+UIa?=
 =?us-ascii?Q?aVxWQewzEe56gWNSQYoHjC8C0jPJecydRoCfhckJQIO7zhZO86ZQrtgg0qEg?=
 =?us-ascii?Q?8wgvh2plTeVuJYVPvVFjfutYXlrsIX3tKTnRSeAylG9n5WXp9OnTJ0+pzHuf?=
 =?us-ascii?Q?71xWBW9zc4jyU+L7drEp08FFdbSsdLeNxrzlPiCsjY3QcHUhaQ5Hi1CpUpqO?=
 =?us-ascii?Q?k4SCEfjSyh7bmJHzkI30PW8eTBdFogs4PfwOEwV+zj8CYNK+up0l/pq4Z0N2?=
 =?us-ascii?Q?RJ0kqFCrOQG99oeb54QC6UbQLiNRhq1qAYMn5K1TVuYGoYWse8I3jzmry3ye?=
 =?us-ascii?Q?PVdPyOBpsBJYOBYxfU5fWVOoJ9c9zo4RAVAent1x5PwZPwQt5s0k1s+OJAkO?=
 =?us-ascii?Q?bMlONtWEE+VztYjvxyBTcqsyYheBV9cWby6I920VeoCqL35D3MacEMUIyj21?=
 =?us-ascii?Q?mq/wDwPvt/1hdRzi1YsXc494BCwgyJz2wIMhrjhXifya5+obkCyd5WoJ/kAz?=
 =?us-ascii?Q?YbYdCVy4my84CEs9x1wGVcqV9xotaWou+O2R2dHDhZfkjlcc0zOamGNhe4QO?=
 =?us-ascii?Q?3PN+4YMaZeYlOmeEvixFk/DA1+CtfLVqpvD1ErH7pbWEJAA4OVO39A4t3tMc?=
 =?us-ascii?Q?YL9Hs9DV5Jq69DR4F+Qpme6TrklmbmOsB9D6N/tC+hbQnFO7l8MS0auaWl0E?=
 =?us-ascii?Q?wOZ5kYdnfGKnsRg4g2/w9kRd5cQHp2VhPVEPBTpLnZFNwnINujBK7vcaKcZn?=
 =?us-ascii?Q?/m3GgnJ72mVRi8UCnFK0XQmCwcL8LZCBj6Iv1N3qFGEfRlAQi0gAmFB1n9R0?=
 =?us-ascii?Q?Y6aDwyiTIY9/wFHiIEjmfF7+iwRxF8oLOT2YkJSs7J93p2RCI3//eS1gRSW6?=
 =?us-ascii?Q?qLBGKOZcUfjpx2kSLR4awCqFKvjMdYGlEmc3//FB+D2nXxyHr4LO91DoPyum?=
 =?us-ascii?Q?MLedpekgdl/WAv0HcJJcXcHVAlFnbNZEOYs0p8kTVzJJStpYmuqvTU4hiJqd?=
 =?us-ascii?Q?4jBTm+tEGhj+DajZyfgbcB6LGvyz1JV6fTtqD/83DYpfrsRPZgft6ru+qnv0?=
 =?us-ascii?Q?8+YocW0RCwTvhcrPDEp7yGB/fVxosQXrg0IThpbRXrm7a4XWGE75GQBo7ui6?=
 =?us-ascii?Q?aOx2X+v7Qk7KOwKCefnhFLR+aZQXqx8Ww3XlxPqlp3/gEnUU9+br6l4Q0PR/?=
 =?us-ascii?Q?t18OybJsHnqnntZrnRf2BkqV9bNri4LlrWnYkKoxbLabo0cBrgHwN0WMzjrV?=
 =?us-ascii?Q?mhbVUnNAjiEtiGT4IWfaTBSuLngZUfISejEDhmObnxXN35DKkRVZmSUNdvXl?=
 =?us-ascii?Q?WtyKkeG5b/seSRjDwBf7/rVYf/uX6UuhH3vlZzs1B7oTv3ME7RPT8VySiD07?=
 =?us-ascii?Q?g+an8W9urVV431byJfvV+RCVuzcWNtW7WxgIsU0joL9o0HpxGLS64kgzHm0c?=
 =?us-ascii?Q?ONErbtkPOXwlNe2bojQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcccae3-cd78-4186-ba6b-08ddda7dfcf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 15:28:00.5420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5X23Q1FWiOiUScoeiQWriTJszGBfxTPCp6u1xynXtM7FjFs7UTn2vtlgrQ8AY5sx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9087
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCmBoWEgRYX0KV3id78r22o97o3UtYCyhBPNR+ruYqw=;
 b=0nomLTQZZX/CJhKV3588/9yCokZhisrGgxJarv3v74F6rJR5c+lsq4aokGfDreQx88YtIHuC999mHIrSMe/Wf2XIn1439UiRo49deoip9x00zzaZRrVZtWP3NDKZ03O8509aTStm4wGQ5w+c3RpjxecPMLtt38VD5es9NfKGktc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0nomLTQZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

>
> Hi Luca,
>
> >
> > Hi Yann,
> >
> > [--SNIP--]
> > > > When the dependency is not tricvial, I think it is good to introduce an
> > > > intermediate symbol:
> > > >    config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
> > [--SNIP--]
> > > I see your point, but don't you think adding another symbol is still
> > > a bit overkill?  The dependencies are still only 3 lines and are rather
> > > straight forward.
> >
> > > This would not be unheard of, there already are a few packages with very
> > > few arch dependencies, but that still have a dedicated symbol, see for
> > > example (some are more interesting, as they do have comments for each
> > > dependency they carry):
> > >  - bayer2rgb-neon
> > >  - bitcoin
> > >  - bpftrace
> > >  - dpdk
> > >  - host-flutter-sdk-bin
> > >  - (host-)gdb
> > >  - gtkiostream
> > >  - ... and so on...
> >
> > > Note that we usually do that for libraries, so that it is easier to
> > > inherit their dependencies in selecting packages, but of the above,
> > > only two are libraries.
> >
> > > But maintainers will have to decide what they want. ;-)
> >
> > In the end, I changed my mind on the issue since there are two places where
> > the arch dependency is used. The BR2_TARGET_XILINX_EMBEDDEDSW as well as the
> > comment about the dependency needs.
> >
> > To avoid having the two be out of sync, it makes sense to create a
> > symbol BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS that keeps all the arch
> > dependencies in one place. This way, when I add BR2_cortex_a78 in the near
> > future, I will only have one place to add it instead of two.
>
> > I agree this is a good idea.
>
> > However the same logic can apply to other Xilinx firmware and related
> > packages, such as xilinx-prebuilt. Thus I'd rather create a single
> > symbol that can be reused for both packages, and it should probably be
> > in boot/Config.in. It should be also named without "EMBEDDEDSW", e.g.
> > BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS.
>
> > Side note: I personally don't recommend sending new iterations so
> > quickly, without letting the discussion settle, it produces a lot of
> > noise. I'd wait at least a few days after the latest e-mail in the
> > discussion before sending a new version.
>
> Yes, you are right that we can create a global symbol in boot/Config.in called:
> BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
>
> This symbol could be used for both xilinx-embeddedsw and xilinx-prebuilt.
>
> Not only would this enable us to only show the xilinx-prebuilt package as an
> option when one of the correct cpus is selected, but we could also use the
> BR2_cortex_a53 and BR2_cortex_a72 to limit the available choices in the
> family variant selector. This would prevent selecting BR2_cortex_a72 and
> having a zynqmp or kria xilinx-prebuilt family selection or vice versa.
>
> It would not change the need for having the family and board information
> because the xilinx-prebuilt treats zynqmp and kria boards differently due to
> the directory names where the pmufw.elf files are located even though these
> are both based on BR2_cortex_a53.
>
> But at least creating a BR2_TARGET_XILINX_ARCH_SUPPORTS would put the arch
> dependencies of Xilinx components in one place. We could even update the
> uboot package BR2_TARGET_UBOOT_ZYNQMP symbol to be dependent on
> BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS instead of BR2_aarch64 as well.

> Sure.

> The only exception would be the zynq platform. The BR2_TARGET_UBOOT_ZYNQ
> symbol would stay dependent on BR2_arm because it is the only family that is
> not an aarch64. I suppose I should add a BR2_cortex_a9 dependency to
> BR2_TARGET_UBOOT_ZYNQ as well, so that it limits the option appearing even
> more.
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20250619153922.891360-1-neal.frager@amd.com/

> That's true as well.

> If you do all of there, please keep them as separate commits in the
> series to be easier to review:

> - add BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
> - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in xilinx-embeddedsw
> - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in xilinx-prebuilt
> - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in uboot

I will separate the patches to the individual Config.in files, but to
simplify the usage of BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS, I plan to
use it right away in the first patch by doing the following in boot/Config.in.

+if BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
 source "boot/xilinx-embeddedsw/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
+endif

In this way, I can simply remove the BR2_aarch64 dependencies in each of the
subsequent package patches.

> And the zynq7 changes are already a separate series, so I guess thay
> can stay separate.

I agree. I will add a second patch to the zynq7 series to add a BR2_cortex_a9
dependency to the BR2_TARGET_UBOOT_ZYNQ symbol.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
