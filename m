Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D8EEF8FE5
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 14:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701AE40640;
	Wed,  4 Mar 2026 14:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJOC-8OIr2vd; Wed,  4 Mar 2026 14:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 837C44066D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772633822;
	bh=Rlk2CdkNY5tPgCSAfJyqZbvi4nKn3Kl2SsOtobU4kh8=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W0XqoMIOCBSESmmzE2/yAZ+/Y8v4LYlTW6cN58SEMfdV1TvM1lXct1gVAvFeDt4E4
	 49uri8FoBX8B3BKWPOmAzOI2nwcwJfJ1p1vK8jI+ePimuQiX1xTRP/IDhe5CY6Lk/u
	 vBi7dHD1M2Ivm2yvacyVc5fuFS09a2DlySoWCSjlnxnn0jiSgPjz5eHbV89D38YRRp
	 5faaDVPLqIYDreEkLSBZpUcfWmtNWqiftOGVyGCCz/Bhi3ixNimCZabNEnTvUhMWiQ
	 kXuukUgkTxmYGEmWYoFr19NfCazHBhToOKQIDen9gB7zfG5S2vpWh0XU6empzbJsih
	 R1PUTq7UGFADw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 837C44066D;
	Wed,  4 Mar 2026 14:17:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9583225B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AFB84066D
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvBQlTX0DL1I for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 14:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c110::3;
 helo=bn8pr05cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8298540640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8298540640
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8298540640
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 14:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgES/uo1KYkYvHinZZZRu+CmjHtehc/RZ5QgvXI3M5SvNYYqGl0p8lz2Jy/25iX8/f09FAU/T+K8jYrjEFjzusYDDeXfLHK8nb6a6HFm6p0NoStMR5zWeIo9jltgIW+UA1vnib3YQEA5VpG/4TFowtrm+l0z9I7ZQCizcH+7mS0cV+v8osCQbtJjvAROP1WjonkLrbYqTbJZGd7vvMZZ4AcrkE5vnJHeXR28FtreI/W/+i6YBQ5oG1dRxx8FvSHAmSJtK+t5JMMgJr7GaAl483ANTxJOSM9hcz0QeuDZAiEcB8dHhhqRb9sD42Zjgk3BiPDcfgDRfzfIJLRCwxpI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYzZrZcjYSWGUWu6GDZqNGb40Q6phBpviTl6h5ZU/iA=;
 b=mFJhZOKbE46XEzAEScq+8dy1yoZqLzqqTxymY3MDhPkypVHKUEeyg3EkOSfInGMKvNh2kuBcysYe+743KeOuTErsoI9fxsmS7465iPPDgHvfVk43tmq5ho7hyZ62grMR6uOl0CQbe009b/xeNryt+bIQIdmIp9T8tF5QCDpQeDzPfFlunjDMsrsMPS/oxhWQKWuKiYHyImWJOBJl149PdaP8X0OBw34g3E60UmnpDPfmv5r++Lz8R/3rVzTUd3YyLFN0akXCeVc+kUM4XmxNOoi1U/aL8l0fVy8MfQfMBxElKtY82SJ1SgrDKDN816IvWtdjc5AKY8a5bH7SvNEc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 14:16:53 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 14:16:53 +0000
To: Fiona Klute <fiona.klute@gmx.de>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v2 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
Thread-Index: AQHcq9uUfI7nXmsP/U600vD4Ue4egbWeZvsAgAAC+mA=
Date: Wed, 4 Mar 2026 14:16:52 +0000
Message-ID: <BL1PR12MB5032A1CD6A81B8C5CCBA2164F07CA@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260304133241.3389941-1-neal.frager@amd.com>
 <20260304133241.3389941-2-neal.frager@amd.com>
 <4a2f2b4a-ee67-4049-85cb-56285f02f619@gmx.de>
In-Reply-To: <4a2f2b4a-ee67-4049-85cb-56285f02f619@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-04T14:11:47.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|PH0PR12MB7079:EE_
x-ms-office365-filtering-correlation-id: c7cd8d03-c800-411e-7dd5-08de79f8af26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|41080700001; 
x-microsoft-antispam-message-info: XZCm/vIkOeRkQEIPR3Wuh8wDx+6fNdxMo7062Ve6oz0p3UKvWUi5KbeiOSeGs4Njw72Z8eRxVXhAm809espFE5oIBklDtE+76iZtgJl7Yn2lUZibABuIDjO/llItieAMectux+FO5UzXrR8YAUUkSp7qmpjAbJmjDZKPpuZPPT/agZJclDhEwpECnUdRO3zUYDIHNzmXJRHxo1a/TNrZYxtFDbL9DQn2QKxNbprtB1uNnU829bsh4I8XlRgMdIwQ4yoDcmLPgrcfEfWs/sHbMH8OyU5pNn+y96MFYbhxpBncc9NhZjZ35935xtv0BU1QBiomWifLqLkbLH4BM3orIXO5+/IxeCnd5Srx12AbpVWY+EnCVRqWqUQiTC8KC1ywjrCiXhxt+jph22WGJ9XB5/jm4lNbiBP56sAWHXroLYh3dM+70cVXCcBQ6FMT9CFIfez7m7SF0nQdaotMvvejWLpqYV+h97Gxm4vWocr5KEB7n4Svt7TJy95jDExCwWk8ngXyjae4yCr6XfDIco/POiDO3wYVf33uhBzTYmSPNkPwVXCEabB+khxZDH9icRewe/TBpa7CoqTGpcHnZ4Y1rNPP0A1qVOLK0VY127VXLAoIBdQRy3FOOHpQ5XtcTZM6/4KA2/hKziuIWeXeBv+OUScZyCoc6CQwDzS7tHsuC8qBS52vTiqhxk40M18rnug5g7ZNJkLXotjkWXVUAVVlODzELGw8UmZf4gCCKRPm3xQAWxoHHNYUdNrkSvEZlx35Vpg0IUuXQRPE0rr34pIDlX5nXpKOOgLKCrPFr/Kv2ohdt9sbJsOCucCgBp7ihjO1eI0fCr7SHMxc3674sZpD/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjF5QUQ3RnJSMnVJTFp4bFg4Z05ZbUdwY0kzb0NXMDlXOEhHejNXZ2kvV2oy?=
 =?utf-8?B?czA0VVhsVDluTkFERmhOK21KdlJHVXIrbGhiTjZNRGU2bHk3UkYwc1orQnlS?=
 =?utf-8?B?c1FKeG1CejZHSG9xNzhiVzZnREg4ZG5mL2lJdXIxdjNlWENZdkR5KzkxRytk?=
 =?utf-8?B?bnFJK3ZGaU1zbUxWYk1qMk1VcnowT3AzdTI3ZnJVVUJpS00xV2YrNnRiWG9q?=
 =?utf-8?B?Z2Y1V3hWcjc5aEJYRlh3S0lhOWZQalFxVDl2OCtndG8zUEIzcVFxdDJTTm4y?=
 =?utf-8?B?WHRBUTNIenFhT012MFFxdUlud091TlAyeE1IN3NNNmlaKzAxR2lQa2dSdFdh?=
 =?utf-8?B?b0l4N3dvTUkvVENsRmswT2ZudFc5bG53L002SXRlZENLRE9HT0dwMjgraHZ1?=
 =?utf-8?B?SEE0YS9LVTNock1MZnlpcHQ0TDhmUDdQVVMrbnBYZTR5cm9tNnlZTEJ6elJG?=
 =?utf-8?B?NWdHUFBHOHNIMEFvTHp0VEFHSWNWaEI4UUJQQjdQbDZQdFNEcUdwNmVNQlFH?=
 =?utf-8?B?dnIzS0tNeXl3RkxLUnpySDZHd0MycXF6cEFtUVNTcFNKVDdodEZtcDJtcGpO?=
 =?utf-8?B?MGM5SVgzZjE0Z2xrMmZaWEd5akEralFTTUZlWHVOM2lBT2ViUjZHelVQanpO?=
 =?utf-8?B?R0RpVWNzU2JzLyt4RnNyOWJIUmNCN2ZHTHd3eElsTTJBdHo5K09qMmY3azNt?=
 =?utf-8?B?VlFacTFzcHNNWFdGSHRWOFN1M0NaV2MwbTNTenh6VDViVjVnbHd1NlhYZEwv?=
 =?utf-8?B?ZXgxZGJUT3k4dm56bEkxaHdCb1gxaFg1MWNGNXV5UlR2RHY0WDhGSXNLNVZT?=
 =?utf-8?B?M3o0QXRyRzhxN0tISGNaM1BwaWk3a3J4Z1pmTW12K3FsanhYWHFxS28wZ09r?=
 =?utf-8?B?aVJmaVdqWHkvdHpYY3NkbmFGWUp3UVo5b2s1Y3lMTzBnemVqWnN2ZzlsVzVq?=
 =?utf-8?B?b3R6dXcvaFdIQS9LQXo0dHRldEp1STlzMjZ2VDNrbHBnb1ZZdjA5UXI1ZnlY?=
 =?utf-8?B?RDh5MmxKUnNmNUxadngzL0RicGRsNGgyOHhMNmliV3pKV1h5RWJoZE9ONFU0?=
 =?utf-8?B?YVFOQk1yOWhhd2RCMmtKTGpuMndFWVo5Wk13RTJ2YUsyZ1ErTERKVHFVU1h2?=
 =?utf-8?B?ZEtZZ0NIRVBDZUZtczJMNlBpZ2Jpei9kbWNXU2FzZE5WWTl5NTg2U3c5WHBW?=
 =?utf-8?B?WGhqMFMrTzF2cURpdFNCK2NKdHlYd1FBVi9jbTF0RlpaQmhtQTV3WG5ZaXoz?=
 =?utf-8?B?T0VMTFhzT2xKUnprdnBSQk5QNEhBRW1nSCt5b2hvbTNyUzFQNzAxWjNwa09L?=
 =?utf-8?B?SkhxZnFodkd2dHBhMk53NXdPQnp5V2p4YjByL3lMMDVkUnBOSG85RzE2dVJV?=
 =?utf-8?B?VjRseDZ2ZWJuRC9nMmNjbFdBWXR3bmpqZjVLc3R4OWlJRjlRYWlqUHJuR1Ba?=
 =?utf-8?B?b1JPOTV6VFpjUEIwRXgweVQrOEJrYytzajk5R2tMcEZDV0hiV0xqd1lQVEFa?=
 =?utf-8?B?L25IVmtRUDJWMW1XWFNqNmc2TGFWWFNSRzBWZkhSTGRGTGgrbHNDV2JSdEh4?=
 =?utf-8?B?ME1ueTE2ei8zNGJtQXV2RzRrTHNCdnp1SUlhMXpFeHlWQXBmUlpWQ3NCN05S?=
 =?utf-8?B?SGVxRVp2ZEk5aHZLVUFmT2F5QS9aWWorK2hrRDA4VTJHNUR3bGZIb0d5d291?=
 =?utf-8?B?MVI2YnpkS1YzQlFST1JjR2IvQ0trR0E5bGFpaERYYkVIaVp5ZVRMeU5jTGtR?=
 =?utf-8?B?eHM5SDFFdnFUeVd3Yyt3WGZDTVQ0OFNBVWpPNGFEOWUwV1I5VGdBV1VBcElr?=
 =?utf-8?B?aFh4RGpDcTNBdWV4d0FlYVVpOVoyVE1ZVGRLbXdyQkFIOStTVlBZTFFvNGdr?=
 =?utf-8?B?Z2V4R254NzJSMjQzdXNQeno5Yzhkd3FJU1o5NXEvSzMrMWVtbldhaVZ5OGNi?=
 =?utf-8?B?dGM1Qm12a210Z1NQTFFoajh6cnRIVVhWaWhZWWxrTHg3dFA2TUdMa3lCODBK?=
 =?utf-8?B?T3NjUGpQUVZneWV5eDBKd0ZjTTBhbUJ2YksxS2llYlJocXBSV3grL2t1MHhW?=
 =?utf-8?B?NkZUOWV5NHlsOER2R20zSDZub3BtbURFSnkrUHNqMW5XVzY5NEd2MkNLYXFZ?=
 =?utf-8?B?amV1cy9GclZDUk91UW1JanI1bnZhdVB3TDNsb00xbzh1ZHV1NDNBamdSZzV0?=
 =?utf-8?B?NTk1VmpWQWZEaFRzeHQ1OEZtZ2RlcjhHVEgrakNnNFJrK0thVTNRQ1JVRkpy?=
 =?utf-8?B?RjdnbzdoWFV3YWI2WloyYyswbU5QMEN5ZVRHc3RidmhuSSsxWEN0ZUlhQWEv?=
 =?utf-8?Q?Q9i68KNa/H0+M/GaRM?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cd8d03-c800-411e-7dd5-08de79f8af26
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 14:16:53.0044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AlJyvf8nWNrO6yw10QvUN7tDXjYjge5sGVRAGKeqU9P05dFg78HgPbSBfrOZCoXw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYzZrZcjYSWGUWu6GDZqNGb40Q6phBpviTl6h5ZU/iA=;
 b=cJ43/zcvYd98iNsLYAopSQGozEXEPE9t2oGbohqFtN6ATbMYzOgrvURNOGtXW6gavqtw/Ucj1ZABqjbZLyCYUKYOOdJKov6vC+DJn4t2y6+e/TZK4GyKJgMzHEhGP0WXzn1QPvVtOiWtZMrN540TK6X0GuZGjX7HPxpSskjUpfE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cJ43/zcv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
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

Hi Fiona,

> By switching to the LINUX_DTBS variable, the post-image.sh script can now
> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
> the transition users will make when migrating from a zynqmp evaluation board
> to a zynqmp custom platform.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - removed unnecessary $BINARIES_DIR from symlink source
> ---
>   board/zynqmp/post-image.sh | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index f44b66342d..10a3c32b2c 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -2,13 +2,8 @@
>
>   # By default U-Boot loads DTB from a file named "system.dtb", so
>   # let's use a symlink with that name that points to the *first*
> -# devicetree listed in the config.
> -
> -FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> -               "${BR2_CONFIG}")
> -
> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
> +# devicetree in the LINUX_DTBS list.
> +ln -fs "$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"

> The comment and commit message talk about the "first DTB in the
> LINUX_DTBS list", but this command will only work right if LINUX_DTBS
> contains *exactly one* file. With two the second file is interpreted as
> a possible suffix to remove (in practice, probably ignored), with >= 3
> you'll get an error.

> That may be fine for the defconfig (I haven't checked), but in that case
> comment & commit message should be clarified.

> Same in patch 3.

Interesting.  I only tested with two DTBs in the list, and when it worked, I
thought that basename was ignoring all the additional filenames in the list.

Since users may very well have multiple DTBs, do you know of a better command
that we can use that will strip out the first filename in the list?

What I would prefer is to have a command that matches my commit message.

Any ideas?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
