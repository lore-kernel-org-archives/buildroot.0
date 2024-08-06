Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15D9C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C8C76085C;
	Tue,  6 Aug 2024 14:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0ihXRsPVtUZ; Tue,  6 Aug 2024 14:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02A70606E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02A70606E2;
	Tue,  6 Aug 2024 14:48:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51B261BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FB8081164
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPVR_7G_0RQG for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 14:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::615;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C9C880EF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C9C880EF8
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::615])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C9C880EF8
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 14:48:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B089lfKtkVs7T3u+XRxsyLVO7/bj03J6qVIxej7q+p46PPYhNg2mxHpowthWtliaA8XY2VJYVvUdZDeEknBfCWAab0AiQ5Y+F4e+YHm4+pYfNTPJUwbIfCvOo21hBx1ff9UoHcI1MrKQAD6s8xo51kJcwKquVrM1pT2RqBXV34OE8B4/zmYSEU3JbnxO34FvgLEMfb+kXxP3JS8cAxbPKPYJ4IIBN207cWR2Ypf4AH22R5kigDDnHQvt5pBV6pTSRg8Su6WFN+Xpx8Q9R6DkgyCSNHMr9NV/9B4ZeP5x7cBMxeG1+aRE/wKlJvMIGR0VpGHX+pKcx9/n87F7tr6ooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAZRWVVRKnXHdK+yXP7aEu/g42gpKdCGt7sFxXOS0kY=;
 b=e/ieCCikfuNOyiAViidVT7bCW5Xb8jrJtZsXDpH/nG+MYKj1XSaKbSMVSttG8T6lEmYOI3cjhD0lINGiRVqxlDaT+xWQYpHPFODbSM0eKmUXqaVoNS2xCrAnXh3Tfou1F8pWbHtcZP8a/rbinLmkAKnq8WpkYry6K+3mXfeavgBArot8aYVN7M0KZSpv+UGCY8DaG/9nmJ5e7j+wLDlSscfSPJWxSn2DZ5sK6tMUXHdl0p2zzE38xOgA5+1v1STVYVpZt82AGlCyDgzqSZHSY8NDtcCJtnQkBkkCsbw+sIRd2BHl/I8gwWCZgh/6ADZcOGZljtV8Vk8anYjxgCGj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 14:48:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.008; Tue, 6 Aug 2024
 14:48:23 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] configs/versal_vek280_defconfig: new
 defconfig
Thread-Index: AQHa4l3Avv+0df/NdE2DKg1OZWSVoLIaQp0AgAAWNYA=
Date: Tue, 6 Aug 2024 14:48:23 +0000
Message-ID: <CH2PR12MB5004046E7E2FD1B4FC175A5CF0BF2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240730085153.3496255-1-neal.frager@amd.com>
 <D38UZT2SUU4G.3M5NHMNLDJ2HS@collins.com>
In-Reply-To: <D38UZT2SUU4G.3M5NHMNLDJ2HS@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB5878:EE_
x-ms-office365-filtering-correlation-id: b572bd2a-72ea-4cff-4a24-08dcb626d2a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?MnZpTkVndkY3eHdIMG1mNXdJVytONVJacWY5K3F0ZXhBY2hHQnM0V1BKT0pw?=
 =?utf-8?B?Mm9SVEJaR3pCRlRUdkQvVmg5eVc3Z3JUR2h0bXJIZkNlME1kM2o2WmthU3Fi?=
 =?utf-8?B?ajJQZm9BOTNuMUlzczAwQVpmZjRoL2FsaVVyZ0ZNelJYT1creVRyRm12M3Iy?=
 =?utf-8?B?QTBZbjRZdFE4OWt6UktLSW8xMUZsNVo1MWJrb0VCb0p3aHZ5RlorbnFiNXIy?=
 =?utf-8?B?a3g4U04yVFlrcUVOaHRFdVJ3RE85MDRBNklVRDV6TWlnckVjNmZLLzFEYklL?=
 =?utf-8?B?a0duM3JDTFNTU1VoR1ExYmZkMEdMQzJreVV3UnpEMldnNXRWakJZWjFiRVZ1?=
 =?utf-8?B?eWNwYTNjdUllbHBuTi83QTBhdUFjd2Q0YXladFUyMEJQbmowMk14VTdrb0t2?=
 =?utf-8?B?VDQyL28rNXczQU1uRkFUaFQ0YTVtUEIzaTRhZ3l3UEpYM2E5WVBIYitkRkg1?=
 =?utf-8?B?dUt0eFlTaEg4S293VW43UHQ2cmt4Z045aXRRZnhNSEs1QnhlTEJzY25FbENI?=
 =?utf-8?B?V2h1VGtaUUJ5ZU02TndBZGRWRWoySitza3hjMUp4U3NRdzFSWUpPOW1nRkkx?=
 =?utf-8?B?cUJpekNCekF0NXFVa1ZqWDR6Q2ZUQkg1WjhqckFpbHFEZ0sxK1c0TzhiNStB?=
 =?utf-8?B?TytrS2J3dTNia0VhdkIvY1FqcG5MaGpkQzR3bTdIaS9mWjM0RmpGM254eGhk?=
 =?utf-8?B?OUdSbHdQSDVONjczWUd2b1VpZHdNb004SW9iYTZTVTBTS0JUOUk1QVlYa2RO?=
 =?utf-8?B?aksxeEVRbUUwTkR0VVRVaXloL01PbWRySEU0YUVGeElLR2dBZGRvOXQySUxT?=
 =?utf-8?B?TmRJaFVWSGlGYlVOQnhKRlRUN0tmcHc0T0U0MU1ySmpNaUJyUTVzN1hYQWpQ?=
 =?utf-8?B?blNxbnlIWTJlRGxMTUhCd01jMDRvZlRoRnpCb0FnbFlvZVJsR0JEcDZTOEJZ?=
 =?utf-8?B?bHpWd054SHNhK1ZCbU9aWURxYXJNcDhRa2Z1KytqTklBNThIblBFYWRtV3VS?=
 =?utf-8?B?NENBL2g1RmhvNlUwUnROQ1hvazV6ZXkvNGJCblBEYXVvWE02alZhN3ZDOTFW?=
 =?utf-8?B?eUVGMmF5b3N1QzNOazRsL0VkSHMxb0VvdjVLYXNPVVd3aDY3ZU0xMDZGZTlw?=
 =?utf-8?B?ZFpKQ0tVT0NNWFY4RHZiRGw5K0JQTEhLU01BbkdBWUFqbDNhSTFieGUvNGM1?=
 =?utf-8?B?WThocXQzZitCaXRPbnlyeGttWlRqMGMyOEVteHp3QXpDbng1TWFZbGhkcFJ6?=
 =?utf-8?B?L0tpZVBpdVZrdHVGMXpiSndqMHRrVDJ6TnFINDQwOHRtQmFaZytZWmM0WkZp?=
 =?utf-8?B?Y3dJVmVyd2d4cmJGTDZobXBSNzNqTUI0WWRsY1Q4QVppTUZBMGhVbVNYSU84?=
 =?utf-8?B?Z1EwRzRjaURhaFVYdEg1RkpoSTZNb0lsekducm5aRXd1Y1lqT0NvY1pEOWRj?=
 =?utf-8?B?QzAxaHRWaXNWZ2lZakdrY2xaOWt2L2ZKVVY5cDVLdUNxd2labVdocHQyZmor?=
 =?utf-8?B?dENxZkdRc25BZlUrYVhvemlIS1pTSG5Ea2lvaFMvTzVEaDBwQm9ISnJGUFU3?=
 =?utf-8?B?U0djaElNQkI1VjFqZVdiZk1hVUpkK3lPWWNUczcrS0JXVmV2SVVsWDdxM0lk?=
 =?utf-8?B?Mm4rRC9xREtPUE5sQWI1dWNJSWhYTU9FMHUzNDA2Zm1Ldyt0a2FoSlpJVFlM?=
 =?utf-8?B?VXREdUtXd1JjbUU0Sk4wKzFJWWF5ZlNyTm8vaXNDVGlUaXE3d2d5TGVHR3cv?=
 =?utf-8?B?UEdTZXYxM3VhUjJXbENTNHljK25FMWt0NEk0QzJ0eFVjTldSSmRRV2lhWi9E?=
 =?utf-8?B?UExXNnliVFB4WTM3VmtQWjZ0U0pCaVM0MXEzR1VOOHJDcTZOeGhkZGlIYzVH?=
 =?utf-8?B?T0s2SXBMQkw5Nm5VOTNGd0xJdEM1SnBWREw3anlxL2xha3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czhuREFoQXh6cXJVZDcrRGQxMUxWU0Vob1V4MG1sUlJrYU1WbHVSSVA4RjFV?=
 =?utf-8?B?eExDalpVUnRBUnZaTkZzczdId05UWjUvdXV4Nmw1YWlkNnR5a3oxVGRaaEpJ?=
 =?utf-8?B?c3dld2NMdGF0T2RQUks2dXRHaWZSQnIyaDJqZ2pheGZvdXhmUlBZRkMzTDNu?=
 =?utf-8?B?d05zcUIzYWdSTnVTb1hJK0ViOTVVa3VPdkVmWU9wb014ZGh1aXFCbkk3VWhN?=
 =?utf-8?B?cWJ5eE1haUcyZ1E3U3hwWFNFcVdaQUp3Y09DdEUzNktqWmh1bVFEelZQakwr?=
 =?utf-8?B?dmJrNHdRcUNrTXBvTVlhT1QwdWRpU0d2NGlrUTBNcXVGbFRVV0tzNW5kYWVN?=
 =?utf-8?B?QzErdEo3N3hZaklaM1M4VUtlZVRNd0dIM2NFL3d3YnhrV1lHR3YwTW5QWU5H?=
 =?utf-8?B?cEZSbmxTalZoQlVzNDcvMElNUkZzUFFtWjhyOTBTTnRsbVg3N2ZZOHgrOXpW?=
 =?utf-8?B?cnpVN094SXlDZkF1Z3NOaVc4cnMzakZ0Q3NBQmVZUEF1VFZ3WnNkNUhEWVJF?=
 =?utf-8?B?VTR3Q0d2QzU2VEZtT2pucDhHMHdMOTJxYWtVUFhmamc1M3lxa2hiWWdHSzg4?=
 =?utf-8?B?aWlBbEVRNkdkZE4zNk1XNzhweGVibXZjVngrcnp2REFNOTlOaGl2YlVya2Ji?=
 =?utf-8?B?NWNpc0VIU0lSZms0RTBDV2xXMnJ6dzk3UmthRkNUNS90aDdyaWpJVklyejZt?=
 =?utf-8?B?N2NMOVUwL21rVnh2clJXbWtob3Zwa0dieW00YjRFbHNudUhudXlBMnpTVzdk?=
 =?utf-8?B?WUN0L2JZMnJKbzR2YUdua2dxaTRVR0FkZm4zbDUydG84NFFOYWE0V3NzY0tL?=
 =?utf-8?B?RzRvaTd2SG9QaUxTYUNVNTBrYnlKS3M0SGZwVTNLQXRMMnA2ek15OWJSbU9p?=
 =?utf-8?B?MDhpdW1aa1hZL3I4UGpCc1FUckpzaGlkZ2lJcnUvenB1aldhWVRNQjNtQ0xp?=
 =?utf-8?B?bVIxeHdiZTFSWVpxS2dvVXJkT0FaSWxOY1hMbjlPSDNERklZR1dxaEk1Uk9v?=
 =?utf-8?B?NHBJOC9GcGQ0QTFTV2JXMVpRVUxScURGaTFWYkRlbUhLa1RCY2Vqelo4YmlF?=
 =?utf-8?B?WTk2S0NyWjkvK3NpTFRncGRzTnZzZ0lsajlVTnQrY1ZpcG9rQUNOdHpsMWZE?=
 =?utf-8?B?d1pZcmdpS3l2S0VGWVd5WlZXak14UnZjUEFZQU9SbE12VGdGQ0VtQTdDZjY1?=
 =?utf-8?B?RmNVbm14RFA4VDNrWW5acGowMmE3eW1KOHE5N1Nkc3A3RnBwRTMxdmpWYm9H?=
 =?utf-8?B?bW5PeW5SWFFCZjQ4MGJHZDZ0eG5tY2R0bUFUcmpjM1VzSFNHdEFWRFlJbFZj?=
 =?utf-8?B?eUVGL0syNExTVm1zZ0gvYVpHekF6ZjJSb2xqWWhZeC8yNUVhd2lSenRSc3hE?=
 =?utf-8?B?N2pIbXZGNEpUTTlpMnhXTTRBT3NsVnp4Qk1sSkJ1b1ZwSndtMG8zYjZlZjZR?=
 =?utf-8?B?QXRsM3ZRZExHY3RrbHltU1NLL0thaFVCc2NETUd6OFFNVUltQllrbUR0dEpD?=
 =?utf-8?B?UUF2NVphVmtiVHdvWmVtSU1pa1ltQU85UklVdXM5emFVYk5RcmcxZytoc2ZF?=
 =?utf-8?B?a0FUcVorOGJJRzBPTkxVQXovS3dZdWdsVnF5enRCdlJwRkZjVU1rVjY0VTVW?=
 =?utf-8?B?SXdnVlJQMU92L2xrd0pZNm16a0hkZTJLUGF1QXdTZlJXQnFLOWFEOW01aEpZ?=
 =?utf-8?B?Q0EwYzdzb1lZbjA5N0t2RUp1dnJhWlNwWlM1eHcvSytHdDhzQVFSSlU3WWM5?=
 =?utf-8?B?ay8vTjQ4VUNERTNXOGpxL2UyRUhSR25NdlNGRm9BYzI1RXFwb25SME05T2tW?=
 =?utf-8?B?SG9hUUl5RTlXNDQwK1oxZmdaVGZpbWJxRjZnd1BlV0VtYjFvRW5NVnpDN0Ji?=
 =?utf-8?B?MWhEN2hyeThNcXZjTU9OQ1NCSlVNT044YjVKKzhFYWpBTzVBOGltd01RL1N4?=
 =?utf-8?B?cXJoNVpUUjBPanduVWZ6czFVYkNOSVArUmR6ZVhBTjkvODVxeFUyU0t2MUpE?=
 =?utf-8?B?bTVuWkZVSlhDOG1GYUgySW9IeGFrN3paclJ6MnlqZ0RoRElRY25WWnVKNllP?=
 =?utf-8?B?UEs0bU5LVnpmODduMUhqTk1TenluUHRxQjdlVkxvYmYwTFNhbXphL3VpYU42?=
 =?utf-8?Q?Yq8E=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b572bd2a-72ea-4cff-4a24-08dcb626d2a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 14:48:23.7907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65chVG4qLVezJ9Z6Uxwn1k6JqNqXvUBpE/UgdPnRA8m8St3Z2uqTb2XV99ygKTh7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAZRWVVRKnXHdK+yXP7aEu/g42gpKdCGt7sFxXOS0kY=;
 b=sNHVdtkcB+I5X8n6QKPypaEu3UBQAdjfoGWFX+HomMvfL5K530XcrSFcCUIj9J+K0eXnj1JCGqDcW6i3mHILQOI1kvpwyR5PQauvoMpCsqZ+N+OWe4i/yd2iRKWnjYL27CQfgUaRtM3EwOXegg3bykNwd1PZUrQBMNUb871VMTw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sNHVdtkc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/versal_vek280_defconfig: new
 defconfig
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
Cc: "andy.a.kennedy@collins.com" <andy.a.kennedy@collins.com>, "Erkiaga
 Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> This patch adds support for Xilinx Versal VEK280 Evaluation Kit.
>
> VEK280 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/vek280.html
>
> The VEK280 requires a patch for the memory node in the dts file because it is
> not currently correct.  This patch has been applied to the linux-xlnx repo and
> will be included in the 2024.2 release.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - Fixed memory range in dts files for vek280 evaluation board.
> ---
>  DEVELOPERS                                    |  1 +
>  board/versal/readme.txt                       |  4 ++
>  ...rsal-Fix-vek280-memory-configuration.patch | 45 +++++++++++++++++++
>  configs/versal_vek280_defconfig               | 44 ++++++++++++++++++
>  4 files changed, 94 insertions(+)
>  create mode 100644 board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
>  create mode 100644 configs/versal_vek280_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 78ea65205d..1fac1da208 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2400,6 +2400,7 @@ F:	board/zynq/
>  F:	board/zynqmp/
>  F:	boot/xilinx-prebuilt/
>  F:	configs/versal_vck190_defconfig
> +F:	configs/versal_vek280_defconfig
>  F:	configs/versal_vpk180_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/board/versal/readme.txt b/board/versal/readme.txt
> index 9cf499b35b..4d8406fb1f 100644
> --- a/board/versal/readme.txt
> +++ b/board/versal/readme.txt
> @@ -4,6 +4,7 @@ Xilinx Versal boards:
>  ******************************************
>  Supported Versal Boards:
>  Xilinx VCK190 board
> +Xilinx VEK280 board
>  Xilinx VPK180 board
>  ******************************************
>
> @@ -12,6 +13,9 @@ Evaluation board features can be found here with the links below.
>  VCK190:
>  https://www.xilinx.com/products/boards-and-kits/vck190.html
>
> +VEK280:
> +https://www.xilinx.com/products/boards-and-kits/vek280.html
> +
>  VPK180:
>  https://www.xilinx.com/products/boards-and-kits/vpk180.html
>
> diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
> new file mode 100644
> index 0000000000..2eff388f50
> --- /dev/null
> +++ b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
> @@ -0,0 +1,45 @@
> +From: Michal Simek <michal.simek@amd.com>
> +Date: Mon, 15 Jul 2024 08:24:57 +0200
> +Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
> +
> +Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
> +configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
> +(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
> +tab but not available as option in wizard. That's why only describe 8GB by
> +default.
> +
> +Signed-off-by: Michal Simek <michal.simek@amd.com>

> Buildroot patch files should include an "Upstream: https://..." line
> here that points at the upstream commit in github. Followed by your own
> "Signed-off-by".

> See https://buildroot.org/downloads/manual/manual.html#_additional_patch_documentation

Thank you for the review.  

I will make sure to add myself as the second "Signed-off-by:" on the patch.

However, the upstream link is a bit more complicated.  The only github link
for this patch is on the AMD internal gitenterprise.

@Michal, do you know when our next push to the external github will be that
will include your vek280 patch from July 15th?

> +---
> + arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
> + arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> +index 1641dc0b5141..ad5d590318e6 100644
> +--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> ++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
> +@@ -19,7 +19,7 @@ / {
> +
> + 	memory: memory@0 {
> + 		device_type = "memory";
> +-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
> ++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
> + 	};
> +
> + 	chosen {
> +diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> +index fda47cd87b3a..80aae8fa4b11 100644
> +--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> ++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
> +@@ -19,7 +19,7 @@ / {
> +
> + 	memory: memory@0 {
> + 		device_type = "memory";
> +-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
> ++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
> + 	};
> +
> + 	chosen {
> +--
> +2.43.0
> +
> diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
> new file mode 100644
> index 0000000000..37e479d692
> --- /dev/null
> +++ b/configs/versal_vek280_defconfig
> @@ -0,0 +1,44 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_DTB=y
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
> +BR2_TARGET_XILINX_PREBUILT_VERSAL=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_BOOTGEN=y
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
