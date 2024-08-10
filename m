Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4798BC3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 07:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE5D4844D1;
	Sat, 10 Aug 2024 07:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a65PItRuOpAI; Sat, 10 Aug 2024 07:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC128844D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC128844D9;
	Sat, 10 Aug 2024 07:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 250851BF860
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 07:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 124C34026E
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 07:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uZmNXNGXdqg for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 07:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::616;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B648B40243
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B648B40243
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::616])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B648B40243
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 07:01:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NciZwwNRNYFMtMAfWnuLRwH+6Wd4BR9bHXsSt/HsfUKiIQPfN91tP7kYgEgeSh29qczW6mb+f1mTnqnxyO79X7pk3qp47vusnHdZMnnYn0DFqTIqk2u7hqKtY/koKQMwSmwTiQaGUbU32ESYIVWq213RI/Gj+jEq6RNJlHFVZQoSgTn+16zmhE3+xlLcVkIQwLdJ/UsZAZcMK8/OXoA2Qw0VMUZPO/kXDZa9Ea3R3Vh6f7nK4ylV5g846Sp8Ck9G8q5hzDnXRp3NkplXONmiJhb5LfpZe4Asa6poEDRoRRZHZ+5p/9bgdVEOJujLzFTEgWvjyVHaqdA1TAhHAGDPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w1FvIabhXcliLE6TcU/JGNTJAzcAXGvhl7BDx9Dt20=;
 b=jBh2JeM9o0s3srZVb/gPVdS04YAfzjxkNKSBP5o2As3qYQWkR1ibK6dVsrRZx8y1bYPO2ZziJ5fWoj7hhb7je+/pzFnDB7dhNPMkjWz8zPtQtWWkN3dBAMpuvl681uADC9hXidUv7lgGdViDSWY00SDCFz8SMIPyqkVpHajsFY8tT1KwFCbcotUlrfu1W2qKX6OV9TBMiU5KVFTvFR/IrWhpKsspxvvNuuIp0cxodyi8QoUgn/Nxz5b5eKQnZcX7g2+uZ8J98QGhggXwaD8qU8WtRC3fcGCOwjqYTZV7AayJLWNKEYQOniURJuESIKha96cyEV/RlDcwu2oV+QVTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Sat, 10 Aug
 2024 07:01:31 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 07:01:31 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH] boot/uboot: fix dependency on xilinx-prebuilt
Thread-Index: AQHa6nl1/a0gc6z2W0e0vz3LmRz2QLIgECCg
Date: Sat, 10 Aug 2024 07:01:30 +0000
Message-ID: <CH2PR12MB5004250FF91D0CADB98CF309F0BB2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
In-Reply-To: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS0PR12MB7678:EE_
x-ms-office365-filtering-correlation-id: 1bdf3cd9-d96d-40d9-d4cc-08dcb90a4356
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Qi96SGNnUldCNCtjMjY3TFJLSEx5Y1czeXFSZlk1dm1TY1AvNVZpQmViNnQ3?=
 =?utf-8?B?bHJVZVgyTWFUcS8xZkRPUjFqalpLcXFMQUE5SVpTNjhRb3dEUExLOTEydnNp?=
 =?utf-8?B?QXpoYnFDTTdxZVZXakJpTEU4RXU3WkFIaWQxVkR4WWVCUlJJSUNxOGdvaVdv?=
 =?utf-8?B?b013d2M1WUdpSDZ3VUtWSXBvZFpuTDB0WndBd2d3dGw0L3M3c1JqVFNhUVc3?=
 =?utf-8?B?QUcwUjRENVNaSHRkRVA1eGhlazhIRVlYclpFdGJWNmVUUHM1WmlVVHZ6QkVm?=
 =?utf-8?B?djBIa0lFaWw0S2g3V2g4ekljcTJDN1grQ3I2eDVEVkViTStBTTdXSWwrbUVR?=
 =?utf-8?B?MjM1M3crTHZsT0p0c2RsL29FMXFDWkxQUEx3Z0Vqd2dwbWw3cFNuTDhZNFlG?=
 =?utf-8?B?NFpzVzl2bEFybTRuOEFHSGxrMWZWYXF0QUZFM0dZdVBiRmdKaytNYTN4cHps?=
 =?utf-8?B?ZmNWcVBNYnBJaTg3QUluMU9OUlFKbnVUdS93Y0gzVjNsQVhyKzVrZFBGMUxt?=
 =?utf-8?B?ZUlCWlBZS0Jwbmczc21OSS9EVFY3eHVNSENNSG9xclRrUVNpYmw5OWNDblFh?=
 =?utf-8?B?YVBWaUltRURTMEttZ2hFZUZBMTNqaE96VEM1dEM5ZGhhaXB0djdYc1dTQ2dn?=
 =?utf-8?B?UkNWWWNreGZFaU9kYnVLU1MwTGpCV2RUSUhHd0VrbzZsQjFFOEtva2F3WEZq?=
 =?utf-8?B?K3duZ29yaDVxYnRhK2YvY0toOEh5ZDZLOGFKYlpLN2tSZEdzYThmYjRKb3Vm?=
 =?utf-8?B?dS9NQzB2L3hYV0FBR1FEN3JtS1F2cTFVc1lUK0VGM2dDOE1EOTl1bmU0OU1n?=
 =?utf-8?B?c0xOZ0dhaEFOQ3NTYnlORjlIQ05wUWw2WmVrenprMDBkaUw4RFNZTlptRDJi?=
 =?utf-8?B?WDBDTHd2bEg3SVZiUWREVUZxeHdiYmVXMHd4MVVWQXo0d1hWVHJIa3puSEx5?=
 =?utf-8?B?bi90TWRNSTFGQW9XUDYzNXVaZDNtRGZiN0tNZTJteS9FdlF0aTQxTStOTlFi?=
 =?utf-8?B?ZElvbU1lVmsxcU1BWHpSM0RtUDdNaENWUU1mQ29QNjA1RnZsWE4rZDZnZTd1?=
 =?utf-8?B?blFOY04wUCszQ1JwYWFqUmFHZ3lmM0libVpGNU1vV2NFdGVWN2RkSkZsOFF0?=
 =?utf-8?B?bHI5RHl0cGF2N1dnbytwK1hsTkR3MDY5ZkxSWmgvSjVFLzZSc05CckFqREdy?=
 =?utf-8?B?WWc5elhNWHZkcFpxbStwa3ROaXZmWEsvR1hvam9GaGtuOHc3VmFGaitPb1Yv?=
 =?utf-8?B?dFZmTXpua0Y3ckhYTjJSVFZjUmticWcvcC9lWVI5RS9uMWY5MjQybCt0QTNo?=
 =?utf-8?B?TzJLbWhucVcwREFiaXF2TW9TQmlwSzEyYkU1YmFOdUpyRnZBNklwY21jU0J6?=
 =?utf-8?B?REozVUV3d09FbVdadERUTTVTWUMrNHh0Q3hEZHh2bHdwL1dkYlRkZFJLOVRl?=
 =?utf-8?B?QUNKNjFCZ2crb1AwMHFmbFhRK0tTSmh2UEplL3FmZ2FITzhoTlZGS29YMGFy?=
 =?utf-8?B?Vm1NaFkwOWJaYStOVU9LNWpYVVpaQ1JVWnBDOHRPTVY4V2ZZWHVoalI2QjJm?=
 =?utf-8?B?bjlLRStNNVJTSDUxeWx1QmludnZGYnVZQStSbmUrYjFIVGtGVEhqUnpoM0Jo?=
 =?utf-8?B?ajlxSjUxQkFYQWRZVklRemhMa05pQ29lYnBmQ1J6Y2k3UURvbUFKU1JQbWVo?=
 =?utf-8?B?UXgybHhzTVdsSzZDSkRHWE9qV3hIdmVlcEpTbFRnejdYcFJtNFN6cGJ4Y0tP?=
 =?utf-8?B?TnFldTNkeW1EQ2hLVytJYnhJUWEvcTJFbkNIOVo4WFJ6VzBQOHBNU2NRZmNu?=
 =?utf-8?B?LytlL2JLUmtLUWc0eVpQUm9uMDFHdTJuUmhpcXpNcncrYm50ZjVtOUJHQktr?=
 =?utf-8?B?bFVwVWczZmRGWFdTbkNPemVYbVJDU1BPcG01NWp4RGdYbWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWdCb1FoWHpQR0pjZXl3cTZsUVlMZ1JSY2tCNm1LcCtVZUg5WW9Qc2NLYXRM?=
 =?utf-8?B?R1RBdUZwalRNRUQyMVRXMHNBbHRpV0dpZTR0WjB6dmRFK2RJcVJGVEIwRWJa?=
 =?utf-8?B?SkpueVRRM1lvSGRudmhzZEMyaDU3d05QSWdPQklaWlNUK21QQ1c1dmV4MXd3?=
 =?utf-8?B?K3JTL3Y3cDIwcnhIWEk2T090ZDgxWFk4NWNMTFpidm1pYUM1dlV3MWVrWEQ1?=
 =?utf-8?B?anhwMXhWdEJKR01rRmJlR0lkaTZEWFJFbFM0N2N5TU1QRTZIRGpvWnNlaE9k?=
 =?utf-8?B?RnhFKzVmRUZOai8rUVZIa1B3NEFqY29nWG5NTmJoYzZQbnMwbkJROEhuNkhS?=
 =?utf-8?B?V2ZrT2E2eDVKYU5VMlhXbU1oeTZpNGFFWDFpeWdVZ3hUcE5GSy9MUklnd25O?=
 =?utf-8?B?TVN4eURhQkI3VzJmOVVsWU1BZXdLNWVUcERMd1hsS05nRWZsRFRpT0xDMFA0?=
 =?utf-8?B?MitVWFMyUnl1Y01ycFpRY0VNVENwejhJSklSZTdpekJ6TUNyWVRmei80Z2R5?=
 =?utf-8?B?MmNrZ0h1azNVSnNJaUdETzM4M095UVlvZWNCaUdHVlZlNU5IQzNHU0E5TDZ5?=
 =?utf-8?B?RzlzeVJBajhGTHRXU0dnZ2RpdXRtVVdTa2NKWlVCa3dNRGNWY280L1ZSVzNv?=
 =?utf-8?B?cHZ0MDFLMHhVQjdMWjhKaG9uUWE0aFI5bHVZVC9YSGQ1OWZ5blNCalZKZHVu?=
 =?utf-8?B?UU5BRVpXYWJ0T1JEUkplTGtlOUkzdXBCN08zdVNveWxjbFhaQ0ZYSkZOL0d1?=
 =?utf-8?B?czhtSFJDNW9WTlpEaDJJYjVFa1JzTDV3QmNGT2I5YmpvR3JhSXZqM2IweVZL?=
 =?utf-8?B?MEdBbEFrdjRyL1NNck10RDRvMkgrNm05U3lEVzZYaGlmZy9Ud2FId2s5YVdI?=
 =?utf-8?B?UjVIcWZEZHVpcTJaK3ROSysxOUFRaFNjeDVjVVVrRXJscEpPK3d4elhnc0k1?=
 =?utf-8?B?Q2crbkJFRW43SHVSVVhLY05BSkNISzhaQ1oyM2NVVnAvZER6WVdxLzhFTGdJ?=
 =?utf-8?B?cTJJeWNkY0ZySzdyY3cyL3BWaDlTeUpPb25CaEd2SGFzTm85dCtyQzVZZUJR?=
 =?utf-8?B?NFFDdlVSQ0xldnBIRkptYWE0Y2xYc1ZQUDZrc0VoeDBWaTZrdHRISk5HNGVv?=
 =?utf-8?B?emRTV1hNWEtaaU1Gak91ZTRpYkRuSWcrb0R0UWlaa3JCRGFJYjdGN3luOFVv?=
 =?utf-8?B?d3R3dC9WdlA4Rm01R0RDbG43M0xPdmNzMEVIMHpWTmhXM2xqWW1IcDJGaEpz?=
 =?utf-8?B?QUtjU3NoSjAycUdmK25ONklEUUhscU9FYlI3R0VwTnRqcG9CMER0amZmcHM3?=
 =?utf-8?B?NHA0eVZHdFJtY25tNWZ5b3pwVEpSbXlIRm10YkhaTGVHSktMa3Z4OEh3N3lm?=
 =?utf-8?B?VUtzY1ZpcklQWnlMMStiY29NNWNJTjVUUUlrZThjdmZ1eTBJMjl1TW55R1ZJ?=
 =?utf-8?B?VUF0bFY2UzV0cGJYVWtxR0h6VlNFSWlQdStCb016a1pHOUFuTmhnR0cxSVZJ?=
 =?utf-8?B?ZVk5SGc2REhja29UNzIwc0VvYTgzTDZFUEN6L2JKcm4xRG1aeS9tTXZpREVy?=
 =?utf-8?B?MVI0VUU3SzdBOU01YmRNd0tKd3NQOXFtcjdNMVhUTUh1YVYvRFdVTFVLbGNp?=
 =?utf-8?B?cHJ6SStTRkZpQTZVblFIMWFvaEMxZXZNSG55YVVoZElpSnk5QjdxTVBKNjA2?=
 =?utf-8?B?dUozblhIRGhqQkswbko3dWlvdDZSckswVUVHbHFRVlZCTG1iTnF4L0JPS2J2?=
 =?utf-8?B?UWk0cG1sNnVSbXAyN20ySlJNUzlWVzhnUzJ4elQ3WEh1aHhabHcyd0NKZFdx?=
 =?utf-8?B?aHJUQk1ZU0FYTm9ZN1FKNHNMZFNmLzJISkQ4R1UydVRuak5MaDJyTlRwV2hM?=
 =?utf-8?B?VW11S1k0ZTVjVG1CKzZ4MFVpOWpNcW44TG5vcktpSHU2MHpmQ1hkNExNNWNP?=
 =?utf-8?B?K0V5QStzS1U2ZXQ4ZUlOVGNCclpxNzR4VWJIL0s4WGZ2US9ha09yTG13MlFJ?=
 =?utf-8?B?OTZkY0RKbkhUUFRZdUtKdG5OZFpqWURVZVpnd2dod1g5UFlmOGFWZDE3T3li?=
 =?utf-8?B?WkdtbE8wWHY5d1NWZ2RndGsrOG1WbzNoZUdPYlN1WHZLaHpJeE1YZ2lvZDli?=
 =?utf-8?Q?p6j0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdf3cd9-d96d-40d9-d4cc-08dcb90a4356
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 07:01:30.9942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J/MRU6OlN3OK1O0z+P3n1RhkYgdcAO+yk+WS0SdihafDfAxOaxcMqlijXsi4g4GH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8w1FvIabhXcliLE6TcU/JGNTJAzcAXGvhl7BDx9Dt20=;
 b=ZEISJBIQ3J7hdSmWMri+gcEXIlwNjXdBlvbgmh+NjYWFUSyD7o/PqovFJwgySpivsEdQpbGljxswvkrD5yv/HJE1W+2UB9s7tixQJcVrbdWverBfE1RZ+GITS197/ovq/G9c99dtM8bb1Y1gZf4E41qjHPX1mHXSURKLEgZS9us=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZEISJBIQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix dependency on
 xilinx-prebuilt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
> condition occurs between xilinx-prebuilt and u-boot, resulting in the
> following error.

>  objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw.bin
>  objcopy: '.../images/pmufw.elf': No such file

> U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
> xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
> DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
> fixup.

> Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
> after xilinx-prebuilt has finished.

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Thank you for looking into this.  I am adding Luca on copy as he developed
the uboot.mk code you are modifying.

Shouldn't line 448 of u-boot.mk prevent this issue?
UBOOT_DEPENDENCIES += xilinx-prebuilt

Do you have the following config when you see this error?
BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
