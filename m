Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D95C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EA7A60728;
	Sun, 16 Feb 2025 17:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFdkd1WAmxkS; Sun, 16 Feb 2025 17:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3676C60743
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3676C60743;
	Sun, 16 Feb 2025 17:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4712FDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 340B0403B8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWUidPAreDRw for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::624;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B782840281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B782840281
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::624])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B782840281
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9uDexwNmjUxHZJz4XRmHX0Ayqj6bLwc0/gQowcPnzDzWbngw8QLY/ssx2eqTjY6MI4fas1cipxZkVtkxRWSnZeeD81Blv/1Feg34k6/Co5GpNeIlxhEtIMq0Ac/L2wyk1bmEreq3LEVoEwo8qbyAdg/75QUQrwuU11FArAPP1IHwwnTGtyjkrACBzun8NhhdutGRrdOOjM3FJXaQ/PyBWtXtJzRkQqGlNHwmLY3mDJUxKxIXtNKrMWaeENlUS3rU1D6uC2SrhpTozf0FZQxXN/iWKIOCTtZouNkXLRtagqXyKGuO+lj0iac9O13u4Gb9tfYVY10zsDmyLNOQ5DD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8A4ptYT28lFyYUZFvVnEvaVnsKmc0mJQG5I+kOXRg2E=;
 b=B4RPAsMWJhfF9AlxtG2PaqaboAkaiGczbcv6XFKcf1kgAkLs24J95bfMX3AotU4Abog54L1NWt97NxsoAR1eV+VvWA8xsrrkjL7JRx/flU4q3Xus+NeHRFyPiuSWsEgF9aCWNd+WU72VvMuC4R3pohs0t895VtKALXM84PDDSXJlgH8U+zSFRIVqXE9sIPKHyIeoFyvWTjv5HsZ/9Uqa4pWlAbHw3eI6dl97TAveR1ND4UZCAfZ8mH0u6cqUOGYQyi+s/QCDrtK4+trvrPvUW56fzSYgWhlriyEOZIdEKRGm+GdwOM292ksVOfwYfJVYDXsKGxQpqSV1UiRnuAei0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Sun, 16 Feb
 2025 17:54:52 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 17:54:52 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v3 1/5] package/binutils-bare-metal: add
 multiple tuple support
Thread-Index: AQHbf6kyWn7uMT21M0acf/GM+lz6bLNJ5qaAgABOhdA=
Date: Sun, 16 Feb 2025 17:54:52 +0000
Message-ID: <SA1PR12MB5615121EEE77BC29889A29D8F0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
 <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
In-Reply-To: <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SA3PR12MB7808:EE_
x-ms-office365-filtering-correlation-id: f25c28cf-553a-4781-c609-08dd4eb3038d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?SFo3Tlc0Vys3UVhUeFhVUHJTNHNSSzExWG5UZ0Z6NDFIc21OV25xdGZ2aThx?=
 =?utf-8?B?cVdYMjFUb3VaNnNEZHkvbDRVNkxNVmdPUmlXdlJ4OHZ0RWlwQ0ZjbEQxTUxN?=
 =?utf-8?B?MkIzM0tEZnkzZ0t5clg1NEFVMVNTZjlsZExYVjl0YTJkaVNMY0YyWUQrMnMx?=
 =?utf-8?B?bzFvb1A0YmZIcEZhNjdvVE1oRlFsWVM0YTBSaDlwNDBrMW5FYUx4RUNBU1VM?=
 =?utf-8?B?MDA2c0dxeGpVbDJ6ME1rY2JBbkJ4WnZ5NEwzQ2dxVzdhcGIwUHV4V1dYdTBX?=
 =?utf-8?B?dkU5Y1FOUmVuRDhrY1ZpV0d6eGZmeVhmWHNxUHNrL2lUSStzWjF0Q2JnQjZw?=
 =?utf-8?B?d3NjNGVXenZlalhsY0lXMjRVdUFlVEErTjFZSlVaU25yMGxqQjhCZWttd0Ry?=
 =?utf-8?B?azlkaUpJbDJlUENESVF5Vko4Mnk3MW1tU0JyUmREUmlMc215RVdyWmRMS1ZV?=
 =?utf-8?B?RHhBZlFuSEl2ZzhEcnRwb3NvSzNlOFNKRG1rSDhvY0tMSmlOZzZSYjYrM1VY?=
 =?utf-8?B?YXpnYjM0UGtMSVVwekpUbjFFc0cxZGcvMkx4UElrT1I1WFg5VHRpK0pGa0Uv?=
 =?utf-8?B?dlpwZ3UrWFRuOWtjVWo4a1lIVGVvQzNKWTA1ZDJtdGI2dW9Ob0hBaTdKOGxT?=
 =?utf-8?B?NHErVFpmeG01Mk1FMkdOdDRzajJoNytEbmF3eGIxNEJWQzNpVFhBRFlkdXdj?=
 =?utf-8?B?S1E5VnhueCtjOExydXFLL09oVlZZRHYxc2NjYVNsbDFmVS8yMXZJZTdnNXZh?=
 =?utf-8?B?bHBmTmRoSkN2ZFBxdWR2KzRNOFN3N2NnSHJDK0xCdC9XclBKaHREeHJWcGo2?=
 =?utf-8?B?MGg3UitrNEtGbFNhYjZ6U0JyTW9zZXkvTmpxd2RvYUpPUDIzRldKeXZjbEhD?=
 =?utf-8?B?R0tFM3JuZ3lsanNlTVFMMVhTcTVOVWtFeVR5bEFJejB4eGRiejNUWmp1SHpl?=
 =?utf-8?B?am94S2ZWR096eTl1ZVVEbEhBVjZwY0lrZFRmcFordFl6YUdhR2h0S21DNjAw?=
 =?utf-8?B?cE5NVy9vZlhVQkRPUlhyR0p4d3AyQlloZDNOWThHNDY2MkhUV1htaS9aYlZ3?=
 =?utf-8?B?Zm5oc2hTWlV1UWw3SVhiNkpJby9NRit5YmUzbXlEQkxSWnlJV2htRW5Sb1dK?=
 =?utf-8?B?Mkt2OVZSN1FEdW50RDdheXIzNmJhQ1VldzJKRi85aXk2RmxLZDhYWEFGT0xy?=
 =?utf-8?B?U25IeUNWaE8rUS8xTUdtRXhucHFVT0dXdDNSWFI3MWZ2TEtrKzI3ZUlpRTUy?=
 =?utf-8?B?ZWxBWUlxNGJsT3lDaklwWlAxT3ZFUmNQS3NGSXlhdEtEaW1nZ2RLb09iaVNm?=
 =?utf-8?B?UjNyL042TWRQbGwrQ2ZxQmQxMnNzeFVkQjBSejhpVitabXJlQ21SWXJoaU1N?=
 =?utf-8?B?bDFDUVdkMXNmTUVieGlPWTdrQzBQUmQyTkN5OGRtbmEwb2RoMFdvbHl2Y294?=
 =?utf-8?B?andvcEhibmJsNTRQZ0RmQmhTL2pHS0dTY1RmSXdFUDh5YnF0cXBCQVdManU5?=
 =?utf-8?B?dDZRSE9pSktOZ3BxSVlxL08vZEJyZlhXQk9QNUltb1NaNlRsc0hQaWxBTlF4?=
 =?utf-8?B?clZhL1MyaDRhMG9Mck9OUmpvN25rMkQ1a3dlWTNYTXR4ZTFmd2owblV1K3k0?=
 =?utf-8?B?Y01sTGN1ZXR5SEFxeVh2YVVWNVRGR1VhWnVMWjNZUG5ZVjk4UFdvUUJ6V3E4?=
 =?utf-8?B?RVRocmovUkNhWWsyMHNkYU01RnE1RXpDRTMwNng0QVRKRHNhMFlPVG81Rkpm?=
 =?utf-8?B?VkMzY0tnTElwYzdPYlNHRDdDV0ZrektiMENYQjY4T1JsM2ptTmV2N3pQS2Rv?=
 =?utf-8?B?alNKUWJhMURpeE1zRTdMclhsbnoxVEx1Qno5QzJ4amNEbjFBSlJHemhrQmVP?=
 =?utf-8?B?c045YlY5cGt1Mk02Ly9QRFdGQzByYms1Rk54MTVSMlJXeDB1blVDN01HeVNV?=
 =?utf-8?B?Q09NUVA5TndsVTlqTUxtZ1Bud1NhTWZpR3pJZHNCNk9OemFBL0Q5emQxNG1i?=
 =?utf-8?B?a05mM1NNUmd3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXFTNzluK3hoS0RjZnZ2TVQwNkg4M3pJVTNwTVEwc1VuQ3hWRS9BV1B3Wkcv?=
 =?utf-8?B?dUR5YXkzeXYwK0ZFL1crTUx3QlRGZ3VBUnFzV1AyNXRla3BpYWFwc1RGSEZW?=
 =?utf-8?B?d0VLUUdmRXVtUTdJUXJYNlpEUXJpem5CTnhldHZFR2kwT1Z1MTRHcHMrd2di?=
 =?utf-8?B?SStxb2oraGFoTWNxa2E2aXFzVmtINlNWdVQ1V05xejJZMjJoZWFHQmJRaUV4?=
 =?utf-8?B?RGpQei9ORzdCazkwTGplSThpLzM3L2cvQ2dRUG16ZTVWOTd2S2pZcEhBbW1x?=
 =?utf-8?B?Z2NhODhueUNzS1cvODJGTndyUUZkNGdEK1B1U3Rvb3ZKaWhyQldCMVZxUzVK?=
 =?utf-8?B?MHZGZmQrWnQvMitRQ040cm1JaHk5SUxzUlNmcExYSDk3S0RuL1lxbXdUVXdJ?=
 =?utf-8?B?dmZvNTJOWUI3VUFIMkQvdGhRT2hwdXVTRUt0MWlndEJsQ2xCOU9oTlNSMVRi?=
 =?utf-8?B?N0RlYmFhK3lvMTkwMHBkb1k1blNaM0gxKzRsOFlmRk5TeFBUVVY4bS9lM0xB?=
 =?utf-8?B?SllOby9qYlRuemdaVE1VT09yKysxMitpV20wMXNjdm9xSFpMclkyZnhLd1pI?=
 =?utf-8?B?dTVsNlpUVmpUa3djalBrK0U5Tjd6OG9PRDh6QVFwaXBPQWowaTlCbzRlMHlm?=
 =?utf-8?B?eUZNV01UN2FqUVdSM0NXTEROS1dXSGxvanNHS2IvVUF4Y0tOM1N0YVY4d3E1?=
 =?utf-8?B?Wi9KRUNmK1VoTXJuY3JuR212TjhZbFpldFc4cEJDMzdLK3p0NTFqQ0hER2hD?=
 =?utf-8?B?VjlncnFQRFFpVmJhK0J0cXd4WjRxOTQ0SUkxYjdhc1d4Wi9BM0lnOHVXeDVC?=
 =?utf-8?B?VTFtanRSWEhJcjFyTGRzYlREalJsaTZ4SFllMFZGZTA3NlZMOUJaUUoxTHVH?=
 =?utf-8?B?eG9LOGVVc0FuU1FrMDlwTG9OZjlKVDlhcW93cGZBbUJvcEN0SW9OWkgvRzRS?=
 =?utf-8?B?NWkrQ0tqTnZnUmNVSGNXQUpRNWxiQktEbndRdGxjWTdrT2dLN3VDZWU2TDMv?=
 =?utf-8?B?RjlrR2FWMHVJdzYrRzFzM3U2VVlLeWtFWEJPV0ZacVlCNkpUYmNLVXZPYUJQ?=
 =?utf-8?B?MStkM0V3T20xR1d3a05nZ3pJSXJ3aVZSeVdpc1pwa2RDRGxtV0swdEhtTUIw?=
 =?utf-8?B?UXB3SWR1d01VT1pwNGlFTmxTYTU1R3NzcjZMMEtlWFp0Q1l3Ym0reXRvVzc2?=
 =?utf-8?B?UGV5NnVrOVBDRXBQczNQQ1E1WXE1Ty9VZUdVeDhLL0Z3NVY5ckZzcXprMFBr?=
 =?utf-8?B?MjZCR1ZIVXdrY29NalRJY2VtZDgyRFp3WCthQlJxUzJrcFVEMUwvTEVDVGxl?=
 =?utf-8?B?NEhyY0llODVVblprVm1JUmY0NWJwMmZ1NXdZaG5aWXNPUTdCNExlSFZVSk5T?=
 =?utf-8?B?VnQ5NWNvUmh3bVFSOGNvaG5vM2ltbStybzYyclpJZmJLcHhnZ041ZHZqNFNm?=
 =?utf-8?B?NVF4ZDgyVHBUOC9lNWlpTWhNaTFPc1ppZjdiTDZ1YVdrdVhEdGwxYmsvaDVm?=
 =?utf-8?B?cUJTejAwVHV6ejJtb2dKMmI2QjFZd0V3ajlYa25pY2FuZmRBcUxJUmIvSHNp?=
 =?utf-8?B?dEtkSlQ3bWhpOWVPV2UrT3RZd1dic25xOTBuQTJTWlhLVnU5NFBuMmt6YzF0?=
 =?utf-8?B?OCtmSXBjNG9wbHloUHRDSHh4TzJyRTF4c2FMOTkrK1JNUVlJaGFkcU5xWkpw?=
 =?utf-8?B?NWRxcEZuRkc5YW9pVno3TjNMOVVoZFU4aVRRV1dHczNaYzZncHhZSVIreXJE?=
 =?utf-8?B?cDFmMGwwdG5lNVBza3l0WHFMcDFKK0tqeVgyRXBBRkZ3NXBmWURWQnMzVjBX?=
 =?utf-8?B?ZllBR0VuODJNazc4WlBwL1hWRGJWWEJUSkNPc0JQendTbzA5cHpNMU9rU1VV?=
 =?utf-8?B?YkJGNlFmWTZvZ3ZKQjRWU2F3MkI3Y05WYjRRUnE3R092ZnBKWlJxYU90emp0?=
 =?utf-8?B?SUp3TFVyOVMxNWtxSHZEa3R6RDFScWhUUWIraWd6Z3AxY3p6Rmh3eUl3dC9E?=
 =?utf-8?B?cVBpU2ZkWmEzanlMNkwrL1ovNkhCVFZpM2Z6N0tWQXlPSWdCdEE4ME1hVUtk?=
 =?utf-8?B?MUUxRW1MRVlHcnZ5SDE1NVp3d2ZhRGlxRUhPbGpXNzlGNXd2OFFIcmZIaUc5?=
 =?utf-8?Q?3pAU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25c28cf-553a-4781-c609-08dd4eb3038d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2025 17:54:52.1900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xplIV6ljaypzZqmT03I1WaL/Y6yHlA+FcKUBU72dYg/4hZDtO4KTFu6EJyFABXz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8A4ptYT28lFyYUZFvVnEvaVnsKmc0mJQG5I+kOXRg2E=;
 b=xQt1F67jzI7CqYN+TzbFscVMDCZGRV2XIp6+vXpwKZOqvbdk/hlhnTRpj4jva1ZqRlfEX/0w7uPfyoukYz5yyULbeezcDyAp9owlKSdJWLRRk6Cv0xSn0aAKFPsCXYR8Y8L7rShhU1hC2HwnS46cVSsdr4uy5jn69Jay6yFs7+k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xQt1F67j
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/5] package/binutils-bare-metal: add
 multiple tuple support
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

Hi Arnout,

> Add support to binutils-bare-metal to support multiple architecture tuples
> with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - no changes
> V2->V3:
> - removed unnecessary symlinks
> - removed unnecessary semi-colons
> ---
>   .../binutils-bare-metal.mk                    | 54 +++++++++++++++----
>   1 file changed, 45 insertions(+), 9 deletions(-)
> 
> diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
> index 3525e9fdf2..7a3017a12c 100644
> --- a/package/binutils-bare-metal/binutils-bare-metal.mk
> +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> @@ -21,14 +21,50 @@ HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
>   HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
>   HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
>   
> -HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
> -	--target=$(TOOLCHAIN_BARE_METAL_BUILDR OOT_ARCH_TUPLE) \
> -	--disable-gprof \
> -	--disable-shared \
> -	--enable-lto \
> -	--enable-static \
> -	--disable-initfini-array \
> -	--disable-multilib \
> -	--disable-werror
> +define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		mkdir -p $(@D)/build-$(arch_tuple) && \
> +		cd $(@D)/build-$(arch_tuple) && \
> +		$(HOST_CONFIGURE_OPTS) \
> +		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
> +		$(@D)/configure \
> +			--prefix=$(HOST_DIR) \
> +			--sysconfdir=$(HOST_DIR)/etc \
> +			--localstatedir=$(HOST_DIR)/var \
> +			--disable-shared --enable-static \
> +			--disable-gtk-doc \
> +			--disable-gtk-doc-html \
> +			--disable-doc \
> +			--disable-docs \
> +			--disable-documentation \
> +			--disable-debug \
> +			--with-xmlto=no \
> +			--with-fop=no \
> +			--disable-nls \
> +			--disable-dependency-tracking \

>  It's a bit confusing to me... All of the above are copied from 
> host-autotools-package, except:

Looking closer at these:

> - --enable-shared --disable-static is reverted (because that's what binutils.mk 
does);

--dis/enable-static does not appear to be a configure option for either
binutils or gcc, so I will remove it.

I am keeping --disable-shared however.

> - $(if $($(PKG)_OVERRIDE_SRCDIR),,...) is dropped

Not sure it makes sense to do this if check when we are in the package in
question.  The infrastructure needs to check whether the SRCDIR is
overwritten for each package, but since we are in the package, we know
SRCDIR has not been changed.  So I will keep it out.

> - $(QUIET) is dropped

$(QUIET) seems to be empty.  Not sure what it is for, so not sure why
we should add it.

> - CFLAGS and LDFLAGS environment variables are dropped
> - CONFIG_SITE is dropped.

I agree with adding these 3.

>  For the latter four, I don't see why they should be dropped.

>   In addition, there are a lot of configure options that don't exist. We add 
> them to the generic autotools infra because unknown options are ignored (with a 
> warning) and it saves a lot of repetition in autotools package, but here we 
> could include just the options that actually exist.

Yes, none of these options exist in either binutils or gcc:

+			--disable-gtk-doc \
+			--disable-gtk-doc-html \
+			--disable-doc \
+			--disable-docs \
+			--disable-documentation \
+			--disable-debug \
+			--with-xmlto=no \
+			--with-fop=no \
+			--disable-nls \

So I will remove all of them.

>  I think we have two possibilities here: either we use the stuff from 
> autotools-package _exactly_ and just add to it (perhaps even keeping 
> HOST_BINUTILS_BARE_METAL_CONF_OPTS as a variable) or we adapt the entire thing 
> to precisely what is needed and useful for host-binutils-baremetal (so dropping 
> all the useless options). Either option works for me.

>  In the first case, we could even rewrite the autotools infra so all the common 
> stuff gets put in variables HOST_CONF_ENV and HOST_CONF_OPTS.

I am going with the second option now as it is the easiest to implement and
a lot of the configs in autotools do not apply to binutils or gcc.

>  Regards,
>  Arnout

Thanks again for your help!

Best regards,
Neal Frager
AMD

> +			--target=$(arch_tuple) \
> +			--disable-gprof \
> +			--enable-lto \
> +			--disable-initfini-array \
> +			--disable-multilib \
> +			--disable-werror; \
> +	)
> +endef
> +
> +define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
> +			-C $(@D)/build-$(arch_tuple)
> +	)
> +endef
> +
> +define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
> +			-C $(@D)/build-$(arch_tuple)
> +	)
> +endef
>   
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
