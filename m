Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFC2C021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 08:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8165440B65;
	Tue, 18 Feb 2025 08:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6x_oTLu15h42; Tue, 18 Feb 2025 08:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B3564091F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B3564091F;
	Tue, 18 Feb 2025 08:16:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 767BFE05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EF2260FA1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8eZeTUeEHfO for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 08:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::603;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EE8260F85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE8260F85
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::603])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EE8260F85
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsPE66KjCRWBy7csFINGGo+TYmd+AQiffH0nbH5AX9faegEN4PpxxPttgJMTYWmn46gNECk82vAYvz9AiOe5QlVU3eu4mqOOYEVtG0AnwRrHv/tRLQd0f8vUGsTNN61P0X4+gBVsLY601RrrNdkx9bJsR/luTU432saTeU1kyIH3/dP0jdJuWr/QhHVSZfdyONsRvHPORhbSuATk3RBxe4FYMrEkly0Cv12BRnHwehpkQJwWS6LlzAl8YDzwtbfvooR9ZFjAvqgr19dOSWkVtZm+2xpNyIfPrkkh4OXOK53rq1QpJ5zCEoGhH6IekYq/J3wfJoMXuf7rFVV/+EpMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUfbBa85Vr3kUuqKMKUg3CnKwdQj7JjYTOkDpWjWLFQ=;
 b=ZOaUvI01VHWJT+jn3ECZVGIxUzIa52d3rqwCcIX1UqApR/SVvPTXb/Y2Bw9YiDRRtNmArPtSBECGX3rG5o8RbT1RLJkRKduh4i5vcV6ZjOWtE4Lvb0Ts1XnJb6ZeEzkl97Md86UD5GuSo8vZSPCiBg2qfe8IrWY/Kd0ZKrT6SBy4IAthqz/GpCQw3oULvQNWiMrLhRYSV74Phvo5K7UzjRwnIrSFiGXA5sWWjBDlQALjJn69mxfKhemi5XhCOxmsh6r7xX1oWN5mBnKW4nUi0tchS25vIFOw+6AHGEg0PXT3KdkQ42LJ3rQ6Kx5Q0C0zfOCSysn7GgKjX4TQbwafOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 08:15:38 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 08:15:38 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v5 4/5] toolchain/toolchain-bare-metal-buildroot: update
 help text for multiple tuple support
Thread-Index: AQHbgTp11Y1IxdF6B0+vR9k9do66KrNMEuWAgAB/1eCAACEiAIAAA7Fw
Date: Tue, 18 Feb 2025 08:15:38 +0000
Message-ID: <SA1PR12MB56159D2266C163E65A2809B7F0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-4-neal.frager@amd.com>
 <191e1010-5580-47ac-ac91-dae8fc0064d3@mind.be>
 <SA1PR12MB5615F539F6C0BEA4E38DDA2BF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <17f2c8f6-0e3a-4070-ba49-3c58889fe83b@mind.be>
In-Reply-To: <17f2c8f6-0e3a-4070-ba49-3c58889fe83b@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CY5PR12MB6406:EE_
x-ms-office365-filtering-correlation-id: 9a16192d-9d41-451f-b7a1-08dd4ff46d9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?U3pQR2FQRHA1WXlOUWVmS1NkVVRueUpVUzBUOGVHUTRFTDlpazRWZ3NRQVZW?=
 =?utf-8?B?QmlibXdkUDU4VkNuL2twZTU0TkZpbXY0S256S1NDMVd0NnZSVlVSU0l4WGRu?=
 =?utf-8?B?UHQvcUpMWTZrOVlQaGd6RlN4VUJEWXdVQ2xTS3ZGN1BuWmtOTFJNbTN6RlR0?=
 =?utf-8?B?R2lKTnBVRlRJM1QxeFNkM2VRR3pRNUdLcGpudDE4dGFEZXpNVVViQmp1dTBK?=
 =?utf-8?B?T29IOGFMSGM3NVp5ampIQnp1OGNpUFY4dXhpTkhNZTVKTXFkeUY4ZGpjb3Bx?=
 =?utf-8?B?VkpGRWpseU5kRVd2MDdLRUJtY0ZobkhESi9VcDI1S2NBd2pNY2xueEppYTZn?=
 =?utf-8?B?U21adU9lYUFVUlREVVBlcFZ1dXNHZHg0emw2ancvZFNRckU4UFZQcFNPRUpz?=
 =?utf-8?B?N2FPamp3UzB5L3ZrQzdYT3lHYy9rdWVCVmJ4NXRHcVBxOHlOMUxoemo3ZkEw?=
 =?utf-8?B?aTNpZUh3bjYxZ0xoTTg4S214U0R5N29ML1pmVG5lWWxpeWpkb1BpWGZHUzRr?=
 =?utf-8?B?SjNuQXlUOVRTQlpyRFRJaXhBVGxNbFRWcW9PcUJLYVFsY2JxRW0vZ2FnTFBN?=
 =?utf-8?B?c0FaTVRld1NMWUpGSDV3UUUrVEdza2pyQ3R2bkhMazQ0T3pyLzVmVzZWUzVq?=
 =?utf-8?B?OERMdDY4eFNaUGdRNWNvUGd3MnorYlZtUHVHV1EyNk44WXA0cWJuMXZWRFUy?=
 =?utf-8?B?cm5WM0RCd01CY2pHR0dHaEJFN00wYVI3bGNiS3E3MXBSSG82bEN0blFsaGsr?=
 =?utf-8?B?SWhmZ2FLVXdERWkrc256L3k0MXdiN21iY0s3Zmp4anNjWWhOVW1MOU1iVHBv?=
 =?utf-8?B?YTBaTGo2ZDBwK0VFSVJhdG5KTUJSbHlrWi9iREJQdnZGRkY2QnRnOVpzcVV4?=
 =?utf-8?B?RWF4c1FHMnp4UHZFTkZ4NjBWbGRNSXREdzZLV2VzV1diNEdNcklnNTFBS3hO?=
 =?utf-8?B?MytpRyt5dGFWK2JDNVRUZUVSQ3cvLytzWU80NkpWeC82MHpZcXI1R3BxTDF1?=
 =?utf-8?B?aWVmL1JlcWFaMGR0cm5FeklEYWJmNVBQYUM5SlRVSXpVTkhFVFBjODd6di9r?=
 =?utf-8?B?YXJEdDM3Q1FlL0M2UERtck50VktHUTQrMzJlNVVNTlJFdkx1WUJIZVI5ZWZK?=
 =?utf-8?B?M2ZlNS9pMmp1bFJ5NUJKM0d0SHQwdks3YVNaM2dKR1F0Nnk3dW5PRVBmUlNT?=
 =?utf-8?B?Z3A0OU1MTVFlekdXemEzM3RMeDlWNG4xRTdaNkRBemd4aFdCakhmdHBiSUFy?=
 =?utf-8?B?c3B5WGlaRlZ5QTdmeVBtQTdKdHU5T0J4WXFuMFlZejRBSlM3TmcxRHgxMXRO?=
 =?utf-8?B?bCt4VTB5WlorM3JuellKMmE4VUV5V0hWK1VYam5Kb05qMmVQMjZnTEVpOTFz?=
 =?utf-8?B?cmdydU91ZXVCOGRucENlK1krZkMwd09UajY5ZHdtak1sb2FLTFFNOE9ZaC9R?=
 =?utf-8?B?TjI5cmwyaXlmeWE0aVJVV3hCelozMHdTK0pqQXowc2tJS2draDBMOVJ4QkFP?=
 =?utf-8?B?UU5qMWZDSTQ1c0JEN0NMeHJpaWFPSUxhSzczUTIvRVE5VjhrdlhYeGlsTkNK?=
 =?utf-8?B?WHlZbDYxb2tiYkgzUXJRRUVOSFBrMnAzT0JObHdaZklUVUdSbXRKaGFsZmRs?=
 =?utf-8?B?eGFLbG51QjFqd1dBd1BBWXc0OWtRallrR2dmNER2Nmtva0lPd1NYQ0Z4am5C?=
 =?utf-8?B?cEd2SlhZUDh3ME1OVDJ0b1pPRmhpVElVa3ZCbjREU2FHcHpMcFZ4YWI3clRw?=
 =?utf-8?B?TW8xZ1pHeUV1Um9oTVpoZndNRzl1TSsvQ1ErM2dlQitQUnozck5GNDQ0eWtN?=
 =?utf-8?B?Sk4zUW5CS1F3TDRIQy9jR0YrRmhZWWE2TnlQRVJmTXhQanhuTy9PYmtuSllU?=
 =?utf-8?B?S1JxUzZoRU5ERXJOUGRmYmZVUWdISENqT1B6cXhMajlBZmcvZ1RYcmR2VTd1?=
 =?utf-8?B?T2NkSlk1VDBLRzU3Nys5RzEzWEVmNUNuZDNFRjdzODNvdmZsWDdwV0JDS1gx?=
 =?utf-8?B?V1BidGFydkFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUpwK3BPYU14REhoLzVrdUJyY0l3R0lFTnYxNG8wRENrOVJ3YmcybTVHYVRq?=
 =?utf-8?B?eGxUQUx5aWpPOUlDMVdWQm8zR1QzYWtMZW94TTViWURxbjRKeC82N2Q3dXpv?=
 =?utf-8?B?NGdlb3NJc0VKOXhhZ0ZRRGU4ZUlyK1dSUzBPQTBLSkl5dllHd041RE9lMHR4?=
 =?utf-8?B?NUtxWEFPeUVldHZFbitVNzFzQnozOGdjdUx4cHdzcUZ2aHRKNVhoUTRYRklk?=
 =?utf-8?B?SGROOGRXcUZYY0l6T3RTSlZETDZ5ZWFlWFNjeXlxK0tDTThSemRXajNJYU4v?=
 =?utf-8?B?TWVBOWNXOFR2OVVjMnltRkxLamcwK0VWR2RxNXRkWEUwRDJFdGVCZS9ITCtG?=
 =?utf-8?B?bEllalpaL1FQZ29aTzBPVmZLdTNQNU5iTkNERmFGV0JUbGd5eFBqTHgwUEs4?=
 =?utf-8?B?OEVGTHJXcFY3ZnA4ZnRMMFZxRExGTUZ3UnhPUEFSNzlHK0pFR3Z0Qnl6L1Ux?=
 =?utf-8?B?MEttZGFqQzN3N2JhVEdhbDcwa2krcUk4eG1rMndqYnU0djZiaEkvb0w0d1Q0?=
 =?utf-8?B?OE14eC9HWnl1YmJmbDhhUXh0cFdLOGpoNjdpNWlPVFV5bDdiaXpIeTZ6YTJp?=
 =?utf-8?B?OXZmWlYxSXU4REFWdVNWcmxMTlBvY2VZQkJGRldkRXhBQlZBWGpLd3ZLaklC?=
 =?utf-8?B?eDBJN3FVck9vYjhMcHQ1dTh4ekpOc01TV3RNK2o3citvdlQ0RzhUY1ZmVGtB?=
 =?utf-8?B?akprYmRpeW1TeU1abS9VYTBGd0FkQk1TSEQyczlYd0xEMlNWOG56ZTRJd216?=
 =?utf-8?B?RWpLdWRNZ0ZWSzR0d0k4aEFiZlgwVHBXSGFWUmwvQjhEM05rQmZoNnV3ZzFY?=
 =?utf-8?B?aCt6dmF1YkdadVF4STdKbmJlNzU3U0NlQ3pjVkNRaDhMRldTWS9sdHpjeHl2?=
 =?utf-8?B?WHlIcjJ0V1VVdTdhTmRzR1BvcWJWdDBtbENNcThhTkFkOUk1OUEyWEhCdEkz?=
 =?utf-8?B?cWo2TW1yck42SWFUYTkzRzRBV0dxcFpLV09tWXRFdjNuUkJyNDAzUXdESGx6?=
 =?utf-8?B?cEdMZUpJZmRnakdZdisxeUZPTnkxVHUzNHhwUVpJVTBWazY1ektybUlXbVFB?=
 =?utf-8?B?ZlYzWjJRaDVXUHhoQWpIOHQ3eGE2Zy8xSkVwNms2UVJLK1ZPN1kySCtmeG5w?=
 =?utf-8?B?eVZOTFl5bjgyN2c5NkNrcThEbzYwemdZYTRYeVdwWmNXaUhNY0V0SjJDZHZo?=
 =?utf-8?B?SEVkS0dUNkd2UWNSOFozWGkzck5wdVBvQUlscEZIZUdPZklSWHgzOEdJbklJ?=
 =?utf-8?B?Yk85Z3NuaVl5dXNldkJ6SDloOU1IUjZETG02bWMzUTR3SHZSWlk4dEhVWFJ4?=
 =?utf-8?B?blYwRDhiLy80TmUyYzlicGl2ZDl3N3d2cDJVeDdGZDlnNXZ4V1Z0STBDR0Jm?=
 =?utf-8?B?OGk5MHBRajJvUElyNW8yL2tjZmRFUittSnBVOFh6US81eDJmcXlFOWdTV3A5?=
 =?utf-8?B?RTh4c1JObTZxTEJMOXIxdlkyMkI2d0phNncybHk0R2FtdCs4N0pZOG9CWjEx?=
 =?utf-8?B?dlBvWWhITmFIajRKWVk5WmoyUlRtNUE2aU1hZkNRK2N3RjFxeUpGOVZSVmhY?=
 =?utf-8?B?bThpdzBzeDJQaFp6L0RxcXNTbUZ2NlJ6a2RFTDJCQktrR1hodXhPQ1pMdXV4?=
 =?utf-8?B?WmVkMlprMUZWWlY5S1phcVBBcXFzNEFWRjMrSFhZN2thUDJQSGNEKy9Rb1N6?=
 =?utf-8?B?MEFJQVFPZ0pKR0MyVFRLS2xPQ3BHQlR2T1RjWWZTL0xudTBRNWxXWDV2V2RF?=
 =?utf-8?B?eDBaU1QzMHo4U1QydUU1TXdZNnJUZ1hobENGVUd1Q0JSNW9KQWlZUVFXMXpD?=
 =?utf-8?B?Qm5ONngxaEFDWTFWbURkcUR3QzI5M1lpMU9BOXIrckQzM0QrS21zeVgvVmdp?=
 =?utf-8?B?WGNzZFhOSHU5R3lLeVBOZXlIV0RMcFFLeFJmQW9mSDExZzI3bTZlL1Jtc2lB?=
 =?utf-8?B?NDUyc3Mwamd4Z3FIaG1YYlZ6WDJBRmNsaGFZMmxwQ2NtVmRaYW1NTWFFOEVO?=
 =?utf-8?B?ZUl5Z1V3N0t2VXRxMGlCRVJZSXQydjFPdUxEeDd2MHdUWEZRdVBkN3ZJdGpT?=
 =?utf-8?B?K3JWVG5xYmlocnppVDRPbEx1aUk0UWFjSWhiUVdVaFlac3VpTnl0SXRGbnhx?=
 =?utf-8?Q?himc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a16192d-9d41-451f-b7a1-08dd4ff46d9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 08:15:38.6106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9o5l4eDuHis8qTvyFQIXHFWHZjhV3P3rHjE9Reha5EUXovhfjVyIKrhhQG3uOI2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUfbBa85Vr3kUuqKMKUg3CnKwdQj7JjYTOkDpWjWLFQ=;
 b=XwALBjl40PGByJi2AB1QTu6xsIJ75BZXeS0jwRz0w3CTGEGbk2QbF1jSmHpqB5IvlOKhF2Q/rqjssvkCpbRZ8Zor57tUHHvyl+WHljRhORyzObRJIUwZvuJCjTYYFp/Ty4eBbWSC2DWW+E6P9ckXvIXAhZPri+M+WHPekkmP3Cs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XwALBjl4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 4/5]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> Hi Arnout,
> [snip]
> Even though Microblaze only ever exists on Xilinx silicon, if someone
> wanted to run Linux on a Microblaze core, they would get a toolchain
> named microblazeel-buildroot-linux-gnu and not microblazeel-xilinx-linux-gnu.
> 
> Since we are using Buildroot as the build system, and since the vendor name
> does not change functionality, it is probably better if we re-name the
> bare-metal toolchain to microblazeel-buildroot-elf instead of
> microblazeel-xilinx-elf as it is named today.

>  It might have been better, but changing it now means that anybody who has a 
> current config which includes xilinx-embeddedsw will also already have the tuple 
> set to microblazeel-xilinx-elf and will get a build failure when 
> xilinx-embeddedsw tries to build with microblazeel-buildroot-elf.


> The toolchain package is called toolchain-bare-metal-buildroot and not
> toolchain-bare-metal-xilinx after all...
> 
> Assuming you agree with this, I will submit a patch that changes the name.

>   I don't think the consistency aspect is important enough to be worth the churn 
> and the backward incompatibility.

I have thought of a better solution.  I could update the xilinx-embeddedsw
package to be compatible with either tuple string.  I have thought of a nice
way to do it too.  You will see my v2 shortly.

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
