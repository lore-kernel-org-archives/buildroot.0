Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D2DC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 15:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB18405E1;
	Thu,  6 Jun 2024 15:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lN1iNrcSbZ2; Thu,  6 Jun 2024 15:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FCB942406
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FCB942406;
	Thu,  6 Jun 2024 15:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 761901BF584
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 15:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6252B401DF
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 15:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTbCeuif5Q-n for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 15:56:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::60a;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC9A8401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC9A8401CC
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC9A8401CC
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 15:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyPC+BaeYsyEJR9m6nFbzdBiHk0R5yl/a5E1obk1JKo4uwOyN7VISVrsLx1rHqQjrl7MwF1ZwquM1ovreA94DsyiGSsB3umvS4GTKrPfXLKC6uQhhczQTgv4vCSuTZnRwcF3pJKi7uvKGVcrf/jkHF9K9CGXRib/8EI6UisizXe2KYFSDF3JeNGH/Mcq4tKTVHrRvVX+XDaeNHtT9vsaTTJfJ6n6wepGmLgDs04XrNTpaqkMkhiqlBgb0jKMeDhnoqMerWKkQdmn3Nx1FUJNLqDx7G6DIQl2KDETzgUt3hoFxe5Jam2yRTVbqngv0zAxGX6rHylQJScfChjl9ehKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36xP+p7TfC3kbVO12ywTiXrNXzP5zYPbmZVBjrH77Yc=;
 b=XOBgOhI8qVH0dFxQ6HuxyFHEax+TxN/juCMpzFVXaUUF5btYPA7USR1fGZ23l9PV4l30z8Eodh5wAAN8Q6MfhkH1rfU1pJVYMaBiuAhfKIWs3koUbbzbwR74u66zCXi8uF2dxJmMbWR4h4yNk9+VEjKDG6cctFF5uiJ9lfuqNHDrJ4vyv+zVTdKEnaeAxOKRt+ydI8asKk+yJkbPagHqeLHUpvORD8AkOooMEU+1UHAyl8RqzmqFSbPuZBDWI6lK+/oIlHx2qZO/8cMhCb3PP8OheMnTvIzsInvTBZ8IW3ojbpZqv1BytUWbgWiBJufb18wE6HXWni5oT1F5LE1clA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 15:56:48 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 15:56:48 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump
 to xilinx-v2024.1
Thread-Index: AQHatax9g559kmzXMUmo4Ts21YO5tLG64BiAgAAHwMA=
Date: Thu, 6 Jun 2024 15:56:48 +0000
Message-ID: <CH2PR12MB5004460067BCA2D50F456AE0F0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <ZmHU1-EPxRFiHZDl@landeda>
In-Reply-To: <ZmHU1-EPxRFiHZDl@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW4PR12MB7465:EE_
x-ms-office365-filtering-correlation-id: 6bd4ce28-7e78-44ef-afb8-08dc864145ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|376005|366007|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?Nk5XMjBldGFSOGtaaVJQdmI3d0hIam9EMEhmSzB1N25JM0RNeWZ2bGIrUE9H?=
 =?utf-8?B?SXl1SlcvNUY0MitDZTUrMjlhbzJRbzlIK1BlMDZTMkpPa2xHQ3ppVjBTNlVu?=
 =?utf-8?B?clgzWkI2UGkxdjNNQjRKa2dLMVR5dmlOcVRtcVNxWlRLODNocERTenZTZmdp?=
 =?utf-8?B?R1MyZWhsU1JnSXgxUGtXUlE5NStzZk1IT1dlVXlBbzlrZHRpWHlTanpMa1pt?=
 =?utf-8?B?VnFqZlVkNG5qdk55NDJYMVBHcm5ONGlCZGllRUg2dXo2WlB4NXp0bTI5QlUy?=
 =?utf-8?B?SDFDbk5jNWxySERnL3BhUytoWmxYc1JUMFY0b2NIYndlZ09TVGtsSTVUaFEr?=
 =?utf-8?B?My9PRVhSazFzUWY4MmRTOWVtM1EwVFdDc0VuUGFQQWVBY0tCMFdJMW96Snpx?=
 =?utf-8?B?NW5rZlBiSmR4aHRCU2g4b2VCRjFKR0Z4N3VqZEI5ZUxVMnliMDI4ZU9MelBy?=
 =?utf-8?B?RzlaY242dnVFTFZsSXlPVk1hcWEvQU9YYmxZMXl4ck1kSUlranAwM1ZFOGdt?=
 =?utf-8?B?bDZIMlgyWGhjMWZVcnFTSFFiOW94SzRJeFZ0VVpTMDUvVXdHTDB1QjIrYWZp?=
 =?utf-8?B?VWRyVHEwckZkZkc5VEsrWWl6UlNvTW5GUk5HNVhxRldieHVUdkFmbDlGZlp4?=
 =?utf-8?B?Sk16bHJlYmd1eExqNE4yTXhMT2I1UnBvN1QwUGFjR1RIUjBmWXRFVVhHcEtD?=
 =?utf-8?B?Sk92QXZLdlgrWjNwQXFOV0gwOFRqMVFYamNZL2lLb2E5aVBvMkVEZjlPc3dn?=
 =?utf-8?B?QVFBL3lQeHdnRGpCaWNLZUdXdFB5V25tOHpyK0FqUDdLWDA1YlFXUEhZeW5k?=
 =?utf-8?B?amdUTGFKTWM2SzN0dWVNSEF6dWNPVk85dVpDUmlxSE5SUWhvZXk0cXlnV3o2?=
 =?utf-8?B?TVhCTThjRnhzMit0cHhIRHV6L0F3RWhuTWhnSlVDK1dtdFZDTHA4WFlibmhJ?=
 =?utf-8?B?ZURLemxSd215WFVJUXNnMHhxWEpuYzNuVEg2N1lKYll2MUt1blR0aGp0R2JU?=
 =?utf-8?B?anFlQWtMbnZBR1RLckRYQkZFd1hEc2JGalk4TGtWaThZbkNac0Y1cS8zek5q?=
 =?utf-8?B?cjJ3UjR5ZWkxL1NsU3VVV0JqOWpwVm9iaEhpdDRwVnRsRDNkQW10eXpNYTNk?=
 =?utf-8?B?TDhWcXAvOUJSNHRrQ3B1c21YM2EwSnkwT0szZXdtYmVwQWthOCtzclE0QTJI?=
 =?utf-8?B?SURFck5hSUVWeEM5WTJDK2FleHJ3OXlxdnp4eU9qWTYzNVBPd25YcW54TEt4?=
 =?utf-8?B?WDBsK0Y1aHFCMWoxdEdZa2s1NXBsM1hhZ0lmSjhORlhGTW5Yck5ScnhFK2Nl?=
 =?utf-8?B?TmxSejdXOEMwdGh6eGZNVHF5N0ZPZC9zMTUreXF6ZDNvUFZyNHFSSUFBRTNt?=
 =?utf-8?B?ei9BY3JIU0VGQ2RMd1NHNzlHaEtiUU9QRHd5K0pRWjJucWpjQ3ZUOFE1TTdK?=
 =?utf-8?B?VjR6dW5OTlBoYUN2THlqbXNWckhyOS9nWjU2VTdjaXZrZDRUYjFTTDdJRlAy?=
 =?utf-8?B?aVhrb1dOL1FyaFFrSFFiU3NYTTJPUTBlSVlTOFNiWjZsVXRRTFh0aTVyZ0Fn?=
 =?utf-8?B?NFE4SXd1dFdudmxqVGJKN3FLcXdyT0FoR1NUUDYrVlZXdHZydS9neC9QRFFX?=
 =?utf-8?B?NVQ1Q0Y0cDlNRVlBdzFzQWg0ckNrR2VnZWV6MHpURW45SjBDbHd5aG53ODZn?=
 =?utf-8?B?U1NXcFJMeDJQTWxGT2RaWnA5Y2xIK3U5dkIrLzRlS1cwdTJmZ1YzemVKNStT?=
 =?utf-8?B?UTJHQ1ZDRTNZRGcrMzNyUFByWDYrTXhwQmcxRW5rQklIM1dQQW9nRk91RTZ3?=
 =?utf-8?B?UHVqNkFyL20xNFRJc2RoVEgrekk3YndzaHM2ZXhVNjVSRHcrVHJIZXhXQ1JY?=
 =?utf-8?B?b1ZaYlo2eWx4YzFsL1BNdHZRRnBCUkt0TzB3dGpLUnhlK0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlBtZi9OM2N4RlpEQk1ReGcxc1d6TitFemMzMjhXRTNlVTdTbEpDeCt6QUtR?=
 =?utf-8?B?bE5EcjVialZ5TkNGUkhJODY0N3BHc1ZuTDkySWlRM2VrbzFlemxrQWhiRjgx?=
 =?utf-8?B?YS9qd0ZzUE9DbWVFNnlkb2tsNUN5aVIvR0IwWnBsSHozdGdQSnNORWxIR05w?=
 =?utf-8?B?aTZ2ME9pTWZWR1pML2ptNFdZRFQ2QVJyVmg5UFBtTGtmYTJ1aVdIUUFWSUU1?=
 =?utf-8?B?eE1UQmxVTmFnQTRhTlQ5T3U3Qzc5WWdmTTdRTzJ4U0dtRVNSN0pBU1BUd3Nn?=
 =?utf-8?B?MklBV3hHckpmMndBTkxQL0dnc1A4LzRhVUVJeWIzM2tONzJTeml0T2pYcXlY?=
 =?utf-8?B?UzVwczBXQ3g0cGhsY0xzOGE5YXNXSFdRMVZlcjN4WGFmSlZBYlBKMk1uMERp?=
 =?utf-8?B?Z1gzM3g4T2ZNQXdTK0JEeTdzemZuQlNNcnpPR3ZlUTF3dUR5V09PVnZ5bUY2?=
 =?utf-8?B?VVdheXdjbTVpbWlCMERBamVtVzFPSVJtSitNamU4aytZWHdjK3FiSlJJZ25S?=
 =?utf-8?B?RnA3NzFTME1scDN5OVNNRmgzTjFWM0VqTDFUUXNhaWRQZFFWZFlFTWsxWkVi?=
 =?utf-8?B?TDJiRjJCNmZpNUFWUk9YMmJjNkgySU9YbTd5c3pkdmptZDRlMktWUTNYVEY0?=
 =?utf-8?B?RWNQSmdlWHpRUnU4VFBpRmtvVlduNlJoTW5HYVJUR0hjRW9FOFBUelZMRTQw?=
 =?utf-8?B?cDFIbkoxb1ZYeHBjS3hCeWorcktPK3FNRnpUT2pISG5qRUFKdnF5cUkyejdH?=
 =?utf-8?B?ZXZ0bTc1R2pRbEJtVEV6UHFBdktyMEdHNDBIY1pTYmFUNm9teWh3QktQLzM3?=
 =?utf-8?B?cTRUamdJMG8vWm9RTEhaaHdxN3JSaEZhVjE5enYwQkM0dTVueXJsTFE3OElz?=
 =?utf-8?B?ZGNocERIK1BNZ3ZiY2plMWF1ZkxBYmVsVDRkZllROXpIU1RwSUl4UTRSUmFC?=
 =?utf-8?B?Ym1nSmxBN2QzWG4wWEFQbmVleGdrSzVuTUJwczEzR3M0bWUxRXVmbmRtQ1B3?=
 =?utf-8?B?Y0JzMnlmbldNMnE3cG8xNE5ucVZRaGgxckd1QTdRQm9vN2liT3lGLzNseURX?=
 =?utf-8?B?L0YvYVo0UllHaUZLTzVjSkVRL2t6QzJXL2Y5blVRdnBqelZOTU1laVptNHZ4?=
 =?utf-8?B?dkx2eWxnRDRQUmF5b2R2MnNTc1c0UkJGZUtENFhQK2pOTnZBcTFwcW00ODFT?=
 =?utf-8?B?QW9QdGpoUnkvNmFRb1BSVWpBNExrRmNTU0c2RUQyTUczMUF5bUx2UGRIMXZF?=
 =?utf-8?B?ZnJOUGRaeDdxaU5hS21Jd0VxNmN2empDSVIxaEFyVEdMMFRPbjFVdWlPN082?=
 =?utf-8?B?TkxCalhUbjQzQUl4SSsydk1tL0NLdzI5WDNQR2dvZlhyWW9rcjBQMXZGVkZy?=
 =?utf-8?B?QWdCeGVXSzZ1VnJLWVRHU1NZL1B2eXBZUUhxdjdDSTJjb3c3S2x2aVVqejkw?=
 =?utf-8?B?SmtyaGRKS1ZjOEk3c1ZydW1DSzQ5d2hYNjJuN2VKZUJEUVJMU3ZEdU9ML3F0?=
 =?utf-8?B?aTZ6SmhDcG94Um9tN1JlWG1yY2FUekpOelE4dytGQ2JRZVhPZTNqVFNmVG9L?=
 =?utf-8?B?S3RYUitCSlpDcER4bktEQ3VTaGsxUXlibE5BRWJtNFJacmVIa2FsdjNJeWJH?=
 =?utf-8?B?WUQ3a0NVRlRYaUNWUmswUFJDWUlPNUwyOUU4M0VTTHk4eXJaTFkzM2Z2SFNt?=
 =?utf-8?B?NVhERmFMemFSK0pLRnNWZDlFc1piTDMrek13OExNUkFvY3I0MDNhb25XVDBR?=
 =?utf-8?B?MWJ1ZFl2S3FiVWIvdXNidXVrb3lkR0VNSTNXNWtnWThpSzY4aWFVdGptOGZx?=
 =?utf-8?B?cC93dHBuWEFNNFE5NmpLRVZqeGpqbGdOQUxIbWR0RGVVSCtnNFNybWt4MXox?=
 =?utf-8?B?TzVwV25qWG1SekZkSzU0WWQ4Rm9xRW9yUlBEbU5UV3Q1VUhVMXhMZmFiWUpF?=
 =?utf-8?B?cXdqdzRGNXBCWHV5RVIxRVVhN3B3VndOeHhicmk5ZUo1UnFvR0dPQktMY2FR?=
 =?utf-8?B?L2F1eFIvSEhJRWtaT21DRElpK1dNQmJ4dG5sdmNXQzcwUk03emZDTnVlVXN3?=
 =?utf-8?B?bmlWSXNTWkNlZFRwRG9QRlhCMG9ENlBNcUJnZUNKT2lreVJJaWdvUkdsN3JN?=
 =?utf-8?B?N1dROWdBM0hTbTFoZ3FhdjRHM0xPSkFRMHMzTkZFTVlra0hiV0RKV0F1OEts?=
 =?utf-8?Q?aOQ5yVUYYswzLfKWksSFqHE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd4ce28-7e78-44ef-afb8-08dc864145ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 15:56:48.3951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4vghShnIDYceFsdxF264aNrvNJq2QNnybqfAnqqvsbSLJT1MTg3s/JpVh0OfXiLX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36xP+p7TfC3kbVO12ywTiXrNXzP5zYPbmZVBjrH77Yc=;
 b=gyikMDcUfMr4qKwFtgRLNZb7AsQDptwB3xNI7JY1Mu9m5ON12YjhffuqPMXOHExyb5jlrp2c0NU0FT9PTlotFYJb3hUsWbLUVyabgFPgz8nIfvUsNilpb8v0aZafz1e7D6aaOZO7pT4VXpTlry35uRiE3d0IVDIcOnK26BDWXLI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gyikMDcU
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
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

> This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I've now applied this series of three patches to next, thanks.

> However, while applying, I noticed that those boards do not have
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y (so my post-apply hooks triggered).

> I wanted to add that and point to the newly introduced
> board/xilinx/patches, but that will not be possible.

> Indeed, those defconfig use BR2_TARGET_UBOOT_ZYNQMP_PMUFW, and that is
> added to the extra downloads, and we would need a hash for that file.

> But the filename is unversioned, which means that we can't differentiate
> between pmufw.elf from yesterday, the one from today, and the one from
> tomorrow.

> So, when arbitrary downloads of unversioned files are done in a
> defconfig (or in a package enabled by tht defconfig), we will not be
> able to force checking the hashes...

> Of course, this is not an issue directly introduced by this series,
> which is why I applied it.

> Still, for this case, I wonder if that would not be better to intriduce
> a new package (e.g. boot/xilinx-soc-prebuilt-firmware/ ) which would be
> properly versioned, and on which uboot would depend when
> BR2_TARGET_UBOOT_ZYNQMP=y.

> Luca, do you remember the details why a package was not introduced bacj
> when you added the ZYNQMP PMU support?

Another solution could be to apply patches 1-3 of the following patch set which
create a zynqmp-firmware package that will build the pmufw from source that has
a hash associated since it is using the Xilinx/embeddedsw repo.

https://patchwork.ozlabs.org/project/buildroot/list/?series=397588

I have to re-do this patch set now that we have bumped to 2024.1, but I think
applying this zynqmp-firmware solution would be my preferred method of solving
this issue.

What do you think?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
