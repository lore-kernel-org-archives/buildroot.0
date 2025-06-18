Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94DFC71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 21:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85CAA60B95;
	Wed, 18 Jun 2025 21:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKkRPe-tWfMG; Wed, 18 Jun 2025 21:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A490C60B9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A490C60B9A;
	Wed, 18 Jun 2025 21:42:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7097B16B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EBFE810EB
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi4MQxYZMRD3 for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 21:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::60e;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BB7780DD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB7780DD1
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BB7780DD1
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yompOdiPefTjiX2Hnmr3uRzTGZs4h4brR8PhbWtig7XhPf99lkDTs5AnmuJIycGrDKadwpXxyCrP/Sj2Ld+A+CFXJ5SVDQDtcuvDWv0jebYQQj2ZubfYNLD0tEfmgR25WAc3mtegYGtBJQy1R9FnHj+1fG9og3+jx5jy/b+0iahlSLINrI+x6+I0c/xq60JRpXpCMkNZS1/21zr9t+c9gW0n87J4fJgvCw0pAhU7IV2KNOp9Fmzj+FZlMIzK8JVgLHM8uQhVafaL9106+c7j7+8eOx923smvHY3BK0/HbB4jkzC0kW+xU5a/R1FskAsAmD1dDOkco1R+rELvTxrOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkN0zeTp4bD5/w0sQWXVLyr4MJT3lwF5j4W9A2rAPBc=;
 b=vg6LG68lcavmYSXVKe+zNCVOh/LPXLfk3QFxPiz5WsKgXgVLoWgJP97SRAL0uAMuoS2jJ692lCbU8rp5PaSG9BjY9WJFfInvcE8kHI5bP9uAjbat7wSK2jnw7eNHwYGWgWUip3blu+s8QEM728wnb4pTT6pWQaoDt4O5rXS8gXfd1WfgLF31+oZD96EPJX8LfDqDDAsNDjELD+85nUb9BSqMgxXBEFNSBWuEI8IPekPhQEZbl9gFhqiZUKMjFM10vndcIYPN+l/n65lsQuwiqNP87MQnYYb0BZmVmyYOT31hlDXR3NZLrKLlol6GgrwJvbeB3lxqGZ5e2EOTZZZzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by BN7PPF683A477A9.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 21:41:59 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 21:41:59 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: toolchain-bare-metal-buildroot
Thread-Index: AduJFiy8oFc3ROBmRFmVSI97y0+mlQEPp5AAFNDAbcA=
Date: Wed, 18 Jun 2025 21:41:59 +0000
Message-ID: <SA1PR12MB5615E7AF9C45C860DBC4FF74F072A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <SA1PR12MB561598FDC7DDED2E1FC57054F0CD2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <e5a7d90e-c7cb-43d2-8035-82565a81a7d0@mind.be>
In-Reply-To: <e5a7d90e-c7cb-43d2-8035-82565a81a7d0@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-18T21:27:31.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|BN7PPF683A477A9:EE_
x-ms-office365-filtering-correlation-id: 6c31a982-d29b-4706-90f0-08ddaeb0f447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aExKSnFCNk05N1VuOHhGem9KU0tsbHVhVUtjMWlSUkxYdVFWOS9SVDB2MWZa?=
 =?utf-8?B?bG9EeGFvSG1hUXBKUmh5NjFhWXFIOHI2ZnpwQmMycjEzY3V1WGo0U2NxdWFl?=
 =?utf-8?B?c0dtM0Z6OVlJeWFKdjRxczlsaHFvWnpJa2NyS25mTUpIdVpaVGRWRGVEeHVQ?=
 =?utf-8?B?YituU2hyZFZlSGV2TFhkSXBMQ0RSaDA0SW40cWczamErWVFMN1ZDc3pWYmZS?=
 =?utf-8?B?UFBmaklySVZ4UTUxbkFsV0JacUl2MUVnRXZRNktzbVV0bFY1aklUNmZQM3N0?=
 =?utf-8?B?VTAzOC9CcWwrc0Y5UzNFZ2FDcjZJRnV5MjBudDJNZndkbStTMTBoVVJMNDdm?=
 =?utf-8?B?ZG52Qmg1alFvRzhSTXB1WWNmaVk2ajhJNDEwbEtjRk1jNVE0aUR0T0lQRGE2?=
 =?utf-8?B?aWdFUHA1Kyt1MDA2SkZweHcyMGFrVzNWb25LRE1CY09UNEo3bFJCbXJ3Vmpx?=
 =?utf-8?B?T0JjSW1CcGdrOGxoY1lGTHlxQW02ZVNPODBFQ1R0ZEcyckwrbjN3NDVYV3VR?=
 =?utf-8?B?cmd0VTk1eGM1TWZhUkRzRGJhcWg5RjBqaDR1aGVIU25wODdZWEh4OG1jNExw?=
 =?utf-8?B?K1EyRGNKNEpmM21nK3FYSVU0L1pTMXdmbmFOVXVvcU55dlFRaU1kTnpZRkJ3?=
 =?utf-8?B?WFFoc0RMWE1nUDc1V1NtbGE2N3c1am1CRHpMR05KNk1QVmlNMDg5L25qT3Vl?=
 =?utf-8?B?Q3JXYXp1MWdwa2tRby9FMXNvdUkzV1pFWUR3TTRuelJSNHNkdkd0ajFteFJq?=
 =?utf-8?B?aS9XTHRTWk03NjcreWZVQllVSTNRVFNNcnhXbVdOU012YWtHd3FSQ29Od09M?=
 =?utf-8?B?bFhqMzdCTlBPYkNoM2ZGbHFwS0g1MjNkYTh5cGh6SEd6cUk0TU9tejZOcU94?=
 =?utf-8?B?SHNYb1NYS2s2dDYzZEZuelpiMnlOcjJ1L1oyMU1MNWFHb3ZrSTlpZWZSTHph?=
 =?utf-8?B?bHNBNWhoUWU5MHl5dERaN0FybWU4MFRYVzFrY2tBKzdJZzlwK2JJMkt4MGI2?=
 =?utf-8?B?Z2xlV2RINlBmOGZKS2xtR3l2NDN5KzFMbVNQRGUzU0hJZVZTVXpkMzhCVG5r?=
 =?utf-8?B?bjdIbmhKT2JQSkNhalBZQ1UvZnJ3QW4rSHI4ejZsWklpZlpTTHgzRmlxdktI?=
 =?utf-8?B?dit5V3ZEWHdnUXBKZ2t4MFhRSzFVb2JvQUVHdlRDejArN0VMVUd3cURybWlF?=
 =?utf-8?B?ZFNWYkQ4dUxhWktuMG9GZzgxellQRitpNlZQR2pValphckQ5d2puYkZsaXBz?=
 =?utf-8?B?SVprYnAzOUZsNlh5dHNrZDErRGFENS9RYzdVcDdTSkFJWEtiVFczSDM3bmRi?=
 =?utf-8?B?ZjdsdHcvUHJkMDJ3SGN1eUZwbER0Nkt1aHhOc2ZUS0dQVUZTY2xpZHJWaG9W?=
 =?utf-8?B?aFQrSnVYOStjbmZlUEhzVkUzYk5kNk5NOVc1N0d4bXIxM0MrK3pJSG04SE56?=
 =?utf-8?B?anNkS3kxVU9RWHl3UTFnLzAveUxmTDhyRGhBSUZQUGZ4eklLSS9KdElSY1F0?=
 =?utf-8?B?cVMyeXRCMXUvMzQwbU1uUStOMklVMGdOays3V09MNjBNRWt1OS9CR2x1QUZR?=
 =?utf-8?B?aWpRWmpIWGtxbDk1UDNyTytvQ2ltZEgrZVhkOW1GRUJRUmZPRGtuYnU1NlZE?=
 =?utf-8?B?NEpJZ3REaTFCbE1UWGc5MUhmeTZDa2hvRm83d0N6aTAzQ2lGTjc2d3A4aCsx?=
 =?utf-8?B?cVpNc01CZWhJMURnNWhDY1ljQXI4djV0OUJGaGRzZVVZYXBuVmFkLy9BdU85?=
 =?utf-8?B?WGFqWkR3cnJibXdtYzU1RlpzemFYajF0OFZaZWlVUHQ2cnhReEVuUFdETURW?=
 =?utf-8?B?TUVnTTF2NTNwMnhqSnV4QjFnRk9YbDV0d2VZeUJSVk9HcllzdEE4SWVGcU5G?=
 =?utf-8?B?ME1WcnRsMWk2NTV4U2FtZDNrcWdpc1JYQ2hMUmoyNnBTbkw5WTJlc0JLNWVq?=
 =?utf-8?B?alAxdDl4WE5rTitaMTFWVDdiL3RBbnBUUW5PdENURkRYaTVRRHRoc1Zyc1dF?=
 =?utf-8?Q?R4sm5gzoqUwU0xKg2D9aL+GVadTP5g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0dDa3UrbVR1anJXVW14bEF0UEhENHhpUko5dEdadE11eFFpNDRzN0F4ZnVQ?=
 =?utf-8?B?bUZGRk45bFZyNVg0c045RGcvbUdidmM2eUVKSkZWMy9OSFYvOW9iV1d1a2FX?=
 =?utf-8?B?djBLL1FYUGM4bmxVYWRUd29vYXNLZ3hnR2FtS2RZM25jWUFwaFlueWtIYXp5?=
 =?utf-8?B?VHRWLzlPZU5kWCtvdlhoUkFORTc1emhwM3cyU0tuNUoyWkFvNmsyTGpJcDVu?=
 =?utf-8?B?bDdGZXNlcUpSeFJpNncvbHpIYzVTZmZiUi82VXl6N1JmWjRPWUhmR3JkcVlV?=
 =?utf-8?B?MFFRVHdXQXFOMGdyZFFFU0p0Y0llSmdvT0t1YXNyV3NOZDhrUGJEcFpMMjU2?=
 =?utf-8?B?em4xSGlVT0ZqUzMxTmVwcDZIbFBzUDBHYW41czNVQVJzN0hPOVZkQlFpMU1i?=
 =?utf-8?B?bk8ycmtzN2UxZkFFWEx1UXlwTklvYURHK2RXTFVVdWcrdzZVbFN5RGd2Ri9V?=
 =?utf-8?B?RXFUekQrNGxNVDI4SHJ6K3RyTVdsNTRnTTBURXlNbHJPa09jSm9lcTI0MUpl?=
 =?utf-8?B?VDc3RDMydWIrTWNBei9QZ21RUkRVZ2xvcHFrQjNwUjl3N2IySDBhZG55WW1Z?=
 =?utf-8?B?cGhHYTNzRktGVFF1T1ZvajRubmdESHkvRXE1d3FMRmxiREkwUEN0WEh0VWZ5?=
 =?utf-8?B?OVZ2VmFXTjE0SHRSVUFnS3UrSkRRTngzOUZKQ05kRnpIQkg5UExrck1oM3ZH?=
 =?utf-8?B?N3o1dGNnRFpDTGN1R2JpNm81QUhPWFh4bnJOdkNQNy90dTdCQmkzVDg3K2pD?=
 =?utf-8?B?QlRmaG9VM041VGpGdnZFaXVobHZBMjd2azM3aE1NUlhuUTJZT0NpSlFrSDR0?=
 =?utf-8?B?LzB2SXpJRGRjVkl3elBBaEZrRTgxbW1rNkJzNjNkQ3c2K2Znc1NJTm83cHpX?=
 =?utf-8?B?d0JCRndzSnNjV3l1aXFTRWU1WDNkVU14QnZJSjdLU3lMVUJCcGZUQUNIeUdl?=
 =?utf-8?B?ZTZnS1Q5MlhTUW1RRG00eitKZlJJaHg4QklMTjdQUG5UOWsvYkFhSCtoOUFz?=
 =?utf-8?B?bXZ6cGZ2cWE2SW1EYngzdXZ0N0NJQ2h6UlpOc216MUhPUEE1VVlNeGNpdmNt?=
 =?utf-8?B?bkxMUWQrc0xmT252Y2pEYVZPWUh5N3EyMnVYR0dZL3djNXd2VnBiTXZpZnFQ?=
 =?utf-8?B?alNHSkxqUzlnVWlWWi81bjl1N2JKR2tDMjlzL1lxOEVLdnkwbUxMTVVEWXor?=
 =?utf-8?B?SDFEblgySUhiS1NpWWtqeHMrV3htQjJjVExaWUlCVHVUZDhRZ2NNOGpKSENh?=
 =?utf-8?B?NkU5RHN4UVlvZ1loUU1zR3NMTVlBOEI4cllOems2MmRCSWFZbUsxMFZIeTBF?=
 =?utf-8?B?SlhPQ1BieDNNRVFjQm1jWUhQdjVmMzFXREI0eE0rRkFxRHg5Vmc2aVNPbFJY?=
 =?utf-8?B?RWY3ZzJ3cWlUTzd5ME9oT1BiRmZQbHk3czVNSE5aWFpPNXNwcXpnRW50MjAv?=
 =?utf-8?B?dGlpdUFmblJyOFZoblEzcTF3MjBHQ0g2RUs2cUxQQjZDSGovaGNBOGFUYWpD?=
 =?utf-8?B?S2Q5d2lycEVpQUJrTFljTklsbnIzZU1iNVc0TG9GTFJPa2xvL2NZYlBTWGNh?=
 =?utf-8?B?UWhWbE5rMHEvRTZqK3JCUlY4bVRlcjdvUU9KVFJOdnNCeDYwb2F3N0p5dGk1?=
 =?utf-8?B?b1o0ZDM0TVFvZUd2UW9OcWsvOUlucmZJYkpHdXY1SW1kK2VCSTFTOXZMU2FR?=
 =?utf-8?B?ZUdCa0xvZk9ieTdTQ015VGpPYTR0bGhRNUhNbnFlRDM3WkNLOUsyZzF6NTVZ?=
 =?utf-8?B?VWUvdTF6alIzN2E4V1pKNEtRQXZrME8xaXNoWEhSYWUva3p0OGM4RnR6Skdn?=
 =?utf-8?B?VUhJZUMwU2lidmVTTk1nYnV4NzBjcGVGVkFvM3FYaFhURE0xZTFiUCszeHpa?=
 =?utf-8?B?U3Rhc29mWWkzU295SVZmWUNwOER6azdRREVUS2EveW5xM2RRRDdSYThaaXRt?=
 =?utf-8?B?WTFzbmwvN2ZyWXlONVk0elRzL0Y5Q0ZkNnlDQXMraGhtM1YvMy8zM1dWVEdT?=
 =?utf-8?B?M0w1U1dsTGN5ckdXYllsanNnNlAza3YzY0pWYUNCTWZTK1U2Vlo3NlJ2TjVV?=
 =?utf-8?B?T3RzVDF5T25YQVVOWWYrd0VRdVZtbXJQOU1kYzltTER3ZU1CMm12ZUl6bUpZ?=
 =?utf-8?Q?R2rg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c31a982-d29b-4706-90f0-08ddaeb0f447
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 21:41:59.1968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1xXyPlfs5PwvXuGY/oX2BlE8T+vZQ+HoxkJKVWn5j40elhAwLVwYAjcggh0acvH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF683A477A9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkN0zeTp4bD5/w0sQWXVLyr4MJT3lwF5j4W9A2rAPBc=;
 b=okhFVD34LUwHrL6LEdIjxJqemwAjKkAD3bCi9AoHYmdYQdZsIMLltQT78pKxElVstvC4TWKjyBRAAsw4tEC36g6pQG0ws6+gHiliZ+jJbXECeI4PHQhvtdvx4V11cMtbDNOWNle4qwP8HvvUoqyv0bQmcaIxHwSbCn415fQLt1w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=okhFVD34
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] toolchain-bare-metal-buildroot
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

Hi Arnout, Thomas,

> [AMD Official Use Only - AMD Internal Distribution Only]

>  You know that buildroot@buildroot.org is in Cc, right? :-)


> Hi Thomas, Arnout,
>
> I am continuing the work on the toolchain-bare-metal-buildroot, and I have
> encountered a snag where I am hoping you can come up with a brilliant idea
> to resolve.
>
> In addition to needing multiple bare-metal toolchains, the versal gen2 products
> need the riscv32 toolchain to have "--with-arch=rv32imc" included in the
> configuration.  Just using the riscv32 tuple is not sufficient.
>
> Since the architecture tuples come as a list, do you have any ideas for
> how we can handle architectures that have many options beyond just the
> tuple, such as ARM and RISC-V?  Any additional variables we make will
> also need to be a list.

>  When all else fails, we can resort to hacks :-)

>  The target tuple components can only contain letters, digits and underscore,
> en they are separated with dashes. That leaves us with a lot of characters that
> we can use to add something extra that can be stripped off and treated
> differently. For example, OpenEmbedded uses ; in URLs to give additional
> information (like the download method or the hash). And URLs themselves have ?
> and & to add GET data. So we can use one of these to have additional data, like

> riscv32-buildroot-none-elf?with-arch=rv32imc&enable-initfini-array

> (not convincend if ?& or ; or something else is better; also I'm not sure if
> it's better to include the -- or not).

>  It is obviously super ugly, but I can't think of anything better.

I wanted to come back to this topic, as I identified a simple solution to the
riscv32 bare-metal toolchain problem which only comes with the negative of
significantly longer build time.

If we --enable-multilib, then gcc and newlib will build all the riscv32
library variants.  While this takes longer to build, it would be much
simpler to implement as it is an easy switch from --disable-multilib to
--enable-multilib.  I have confirmed that I am able to build the
versal_2ve_2vm asufw application by enabling multilib and changing nothing
else.

Since the AMD toolchain is already a multilib toolchain (since we support
soft cores which could be virtually any riscv variant), the asufw already
has a Makefile designed for a multilib toolchain as you can see below.

https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/asufw/src/Makefile

What do you think of adding a config option to the bare-metal toolchain that
enables multilib?  It would be simple for me to implement this, and then users
could choose whether enabling multilib is worth paying for with extended build
time.

Similar to BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH, my idea is the option
would be BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB which would be a boolean
used by binutils-bare-metal, gcc-bare-metal and newlib-bare-metal.

What do you think?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
