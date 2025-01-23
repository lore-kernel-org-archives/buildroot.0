Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294C9C0218B
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 16:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AED44400D8;
	Thu, 23 Jan 2025 16:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUgjYdxz6bou; Thu, 23 Jan 2025 16:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DAF44012C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DAF44012C;
	Thu, 23 Jan 2025 16:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B3ED94A
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 787C941371
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISh0qH-nfxLC for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 16:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::607;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4502240498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4502240498
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::607])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4502240498
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0JzwqZwTHQ+7vPUbhIXBwrFje1ccaBAOH7zhC5zmnQWzdGbHCweFaEGldRsBvKlyAYIQ0ySbdVmnrJP7SrAxq31H3eK/Q1ZGh9j80XIgwSuB3nkjXjfJQX0+z84xTBMh4r32KlPT+9KRWX3HxTYWiJbfZEynyYm+x/RG1S6k9i8WauIVr3CQy0QZ4k3j3Zvejxm9RI0UCbNv72KgXKHUoNdQf6o/aCliWstrwch79lOnr/mBpH3HVg1gcfxPpKUkxcQQM8N5dCrkwZEnAjETP0tIWb4/L2RPPEKSCjLg7ze7OImQm7777WV8+7D8UM2mKuXl0iQrzhcNbfPUYrt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORyZfwbasG4gasN4XUXMpX849eNUH45+iCg1dF4kIyw=;
 b=eX0fsH+BP/2sCG3KDb0P9WRRYWTjN0pOuIOOGx99vGWAi0Mzi1eaYO2ZzsRQS/uw20rTGwddHuOXq26Dhgc14vtvSfrIYZmpbCK/nMHCP7iaRmIIGkCODUoJnnSEM/7GtzZvc9lE4j23vA8A5CN+O09jcZrIgLH4nhEPjVw229bOA+XpTxP/EV7IJw1nUVeN+V+ENWgg/SdS9LHFqll3uWChwkgb2EhDN9tYNwx6zpGQQnSHrYhRAqoFP2Y9IN1KI8HjgkFWk8E2JWx5yh5Sdd78gv0cYY45V7R0ZjPNX/Hz0pALI57l1dmGqfCXy96xlqKQyOKyvce/ykX5kNH02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 16:50:29 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 16:50:29 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v2 1/4] boot/xilinx-embeddedsw: new boot
 package
Thread-Index: AQHbay89zGN8FoY7A0ilbt96TJtW2LMklqWAgAAAVnA=
Date: Thu, 23 Jan 2025 16:50:29 +0000
Message-ID: <SA1PR12MB5615360D2E2DBAF2B096F01EF0E02@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
 <716b05a8-c26c-4c6e-aa01-4bcb43ce4303@mind.be>
In-Reply-To: <716b05a8-c26c-4c6e-aa01-4bcb43ce4303@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MW3PR12MB4361:EE_
x-ms-office365-filtering-correlation-id: aa868f1b-bc92-43f5-de27-08dd3bce0b7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?YTNHNUZsdWx5ajl2Y09KOGRRb05mdTNhdmc5UUlGbVFmckp5UnBSN1ltNmpO?=
 =?utf-8?B?NDVmT0VBWkJOREdUOGF5NTRraDJpZE9RaVZlYmhPTUdrSXZxZTFLR2xLZFR0?=
 =?utf-8?B?Y1J1cG9UMnVyanRXcHRsYzV0cEs4Y1JjY2Vrc1BFbnpreHZxQ1UxalV1ekVL?=
 =?utf-8?B?LzdGdG5YUVQ3MUlQa2JaZmNaaU5nVWQyK1lxaVpNZjFNaFRzQkFRbEVsSnFB?=
 =?utf-8?B?Y2J6STBqRCtST1Vna3hBcUZCaVlCd2sxbG1mc1Mxc29kTE1FT3FmT1Q2ZG03?=
 =?utf-8?B?enE3MDFnZWgrZzFZK0VUZUtOcFFUNmIyenFOR2F2MTJwZ2VseS9ORzlhYmZp?=
 =?utf-8?B?UEEyZmdrc1JEdDlnSENOejh3T2lqUjB4Qms4K01id0dmQmtKV0taSHk5NDB3?=
 =?utf-8?B?ampxT2pJOXNmR2c1SFpvL3dIeWhabk8rNDlPckJXbWdCUjBNOWNOakZpMTlq?=
 =?utf-8?B?ektrSWk5NFNYRStBaW56eVhDZkZ2c2dyem41OEphVEJWb1V3OXRoLzh5bGt4?=
 =?utf-8?B?VisvNzk2bXVyYndqTE0rc2tuckd6WGY5bDRxTGVVUXVwWFNvVHY1OEZJWDVS?=
 =?utf-8?B?aERDS083UGZad2tzVVByVldDN3lpRTR5cVlSZXhWUHRpbjFSdWpiWURadnc1?=
 =?utf-8?B?YkdqeGkzSVVhRWFxQ0o2eUVxbUVXRmdCRndVWU9HSjdBZ3pGQ0JPZnNIYkJ2?=
 =?utf-8?B?SGJxYXlvcTNXSjFZMWJTTUxOSXNIWDA4SnpMc1hKbTBhOEx3WU1Fb0NPb0w4?=
 =?utf-8?B?cXVvN2VnUG55ZFpMWTdvdVJZUE8rWDI2YW9Tamp3KzVQZTRiRGQ0bzBzbXQr?=
 =?utf-8?B?MHhQbTdZS3NyMDJxOVNUd3puZEFjWlBPRC81dS84bk5MV1pqci9RdlIxL1Vz?=
 =?utf-8?B?d2pJTDdiQ1hFUUMrSXljRU1VRXhWdDFCSEhtYnhKUDViM3B2R1FWUEpJWFBX?=
 =?utf-8?B?SDE0YkR1R1drNCt3MURtY2VobWx2azBvMUtESVFKemJKWUcwR1hrRkMvZnBQ?=
 =?utf-8?B?L3liUjlHQVdIbjhXTzR4U09uTlR5K3pwV2hNTHRiSEtZemVxLzlhU0pndUox?=
 =?utf-8?B?SHlMdmpNU1FqbDBBb05JUWczQXVjTzVyV25vNlJMQVFxS3BxUEMrUWsyRUs1?=
 =?utf-8?B?dWJSclJkblpUUmlNZ0ZoNjNqeTBnSitnL2dtT3VKekFvaEY1SWx6cUxtRTl3?=
 =?utf-8?B?dzM3SWRrbitDY2pRZ0JMblgxTFhVaUVQZHpZdm5sUnhsRUYyTzRRdWJxZDIz?=
 =?utf-8?B?WTJXMGRQUTM2MWdNejM1dTFxcXVnNU5Wc2U2d2tQVVhTSUt6ZytDenVJQXkz?=
 =?utf-8?B?WWFtcGtjZGUyTWNwY2lRQmRaa05UVDNtSFJPTW1oc2sxL3hDeG9EWWVoZjc1?=
 =?utf-8?B?TlNVa2R3YTFFdXZYZDBiYVBiRW1maS9Dd04xL01pbXgzS2JIeUpSOVNKYVJU?=
 =?utf-8?B?cXEvZ3FJLytFMVFGNUMycTVpNTR1WTdLWEVQbnFnSVRlN1Q3N2Q2cURGa3Qz?=
 =?utf-8?B?YmRGQ0xQREJLcitSZmhKRWhiM2o0V2dER0N5N0czMElTNURyTDVLdy9jendH?=
 =?utf-8?B?Wk11USsxdEllcUgxMnpLWmZiMi82QlptMC9DVnJNcC9OZHRpMHhad0NZK200?=
 =?utf-8?B?MjZaVDgwOURwd3BOdmpLKzRkaXZoNlRvNnVveE5YaHhKM0tJNGpEWUpQWGpD?=
 =?utf-8?B?VFU5VGQ2aGZJSDhENVJwZDh2c2ZYMVg2NE5hZ0d1NThOSzlVSzcvV1ppdjVY?=
 =?utf-8?B?cnRkanF0ejVjcW9kZ0FYQmNjcHYwckFQSkg1SlpTOHhCSlY2RXNJSXJnL1d3?=
 =?utf-8?B?MXlORzNYZGkrK2grNDE3TGZCaUtFTnZhWU5GYk9KOUxRM2g2ZVdhRldONzky?=
 =?utf-8?B?aFpSZE9BUzJZNDkrQTlXNXMzSHFlM1gzOUdmc0o2M0RiQU1IYnpFS1YzVmpv?=
 =?utf-8?B?dXV4WXNXN3JNY1RaOHhTUUx4Z21WZjBOUm5mU0RhTUZQZ1o1bG9zYllqKzUy?=
 =?utf-8?Q?SkUjcLG+qgpFsLUuGzL+zioneSo6gQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0x0Tmw1U2F1ZlV1bFpPbDh1N05sS3BkRGl3ZlpLNnpHWEROaTAycWtqd3E3?=
 =?utf-8?B?MFFGZlQ1Qlh3THR3VVMrRzBmNVNaTFBZcU53Z1lHVitTcitmb2JabU9TTXhD?=
 =?utf-8?B?dFlVamI4MmxOR2RaMkdyVDl4NkUxdHpNc1Rua0E3RW9oejdROUROQXhyYmlv?=
 =?utf-8?B?aXRFaGZhUjdLUU41Y0NmdDBuczZ0MUNLVzBSRzBIMHpVSFhFQTlFSXQ5dWtO?=
 =?utf-8?B?bHdDcUwveW5jQUppSkgrY3Y0d0FIZzFFTm9CMTJ1amFJcThqdnJJaGhEcDZF?=
 =?utf-8?B?VzNLSDZwUS9kNDRNRm5KaXZGNUthOHA3U3c2aUpoTFhXdTNrWEVpWFVxNC9B?=
 =?utf-8?B?TFliM1RlNTY3clJFY3hlb1dJUUx2NUdvcW5UYkxrK0hISTNCZXkwMGdEMHZn?=
 =?utf-8?B?cEpjb1BEN0JRbWl3c2ZwTVVVZGhQZ0Qrd0x1MXk4a1gxM05TS0NGbjBrS2d1?=
 =?utf-8?B?V0NCc0NGek5VTnA5UEJvb1FJcEhFNDU4M0hlWnZOcmw1RVJEcWQ2YzI1dzE0?=
 =?utf-8?B?NFVDanFuSlhZRFZpMEtSY3NlOVlBYWR4a0VodDVCcVlMbTBJK3NBWTFZRlE2?=
 =?utf-8?B?QmVVbTR4aW5JVC9FbFBGMXF5OEFrNnI4aVRhN1FCOGF4M3hrbG9vdDZZTmtZ?=
 =?utf-8?B?dFcwR1JqankzV2ZRK29QTTNYR0s0enFmdUxjWmI2NGgxemF6amFUejBDbUph?=
 =?utf-8?B?TnlydDFYQkNTZ3VuOFJpaWQ4Y0VoVjNaQ2xkWWYvbFlMSzBuN2g4SmUrc1lP?=
 =?utf-8?B?QUdpaFhSa3NPdUNGc3FDMitmT1NmNVpQQm1VeHhnd3NCRjhNVjU5YzJHU2I1?=
 =?utf-8?B?V1lUZ0Jnb2NYbjFnOUpDSXBoMWJDVytodG9vaXhNNUJSVlJlZVZ6RnZwWmJS?=
 =?utf-8?B?emJmM3VqUkpPUkZEQ0RZaUJocjVQZmNvUXJaRTJLMzI4S0pkeStjeXV6dkhX?=
 =?utf-8?B?V2ZvY2tiMVg4ODV4ck5DakZKWFlxYmJHTWNlTzBzMGEyZE5OM3AvMGxFbWFV?=
 =?utf-8?B?NjBMem1tQVV1Um84UEthcjYvd0ZVcUs0VGdRWTlKVWEvLzN5dCt5RkFlQmRI?=
 =?utf-8?B?N0JSMkFzVmVpVVRUQXlYdlNYa0ZJdHpDanlFTmhNcXYybU10T1RXWmRRdXdZ?=
 =?utf-8?B?UVFvTjFVdXdDclI1dTdJdVUwczhadkwyN2FSd1czdVhJK2Zqa2lrL0thQWpN?=
 =?utf-8?B?YWdsVnJwT2dURUc4cGJvNVMrandnZUJTY3Y1TWYwSytRU2Jzak1xR1lsb3dB?=
 =?utf-8?B?c1UyWHFObElMTGptNHBqdGY0elUxYUwrQzlQclkvR1FqNU5uVjNwbmdtaGEv?=
 =?utf-8?B?SVlSaWhqZ0RhTGlyMGdWNzhGOE0yYk83Sm1ibktqMkFSR2grdFpHcmhUME82?=
 =?utf-8?B?NGZCQ1AxWkJXZVhlejBnQitvN2JGRFd1NVBNY2M3alNUVE9OZ1BKMzFSRHpt?=
 =?utf-8?B?bDcwNzlJYWFrWWNrSzN3bFppbGNXZ0VBKzNRazJiazBJc3JQa2paNVhEaWZJ?=
 =?utf-8?B?Vi9QTTF5WkhHd2kycWI5cmd3ajNCRVp0eGhLRHFtWVZKSGlaQXBmbjJKWkFy?=
 =?utf-8?B?R3pyZmxhQkJtR2x5N1pNUTNoenA1eTBsQkpuSG5MVkNwMVJFcW9mYlhUL0gw?=
 =?utf-8?B?VlNlNU53RG1WR3VFVmdoeEY4VGZFTWFVOHJnYUVqWjdPRjFvVXZ6TmFWcmZL?=
 =?utf-8?B?c2NjL1pRcEVCWHlIbHB0T3BGYlF0RUF2Wmw0bzk4cExlaHZyWU1VaWVNVTVL?=
 =?utf-8?B?R1ZzQ2Y3dmpzZEx5OWdTWWxOZTRIclVwS0JyUjV1MldQckNuaGNUM2tJRUE4?=
 =?utf-8?B?bmdwV1VreTZwZU1McndINlFSaW9HbFgzUmpPSmFtb2VDNEFtTU5KaHMwMHNn?=
 =?utf-8?B?SkpKVHE3VDh6WmhrU1R1RzJFNmxmdzdmSzEvWi90YW4wWjFUVlVtMTZwOG5V?=
 =?utf-8?B?U2YwcU5FWjNXdmVsQ3hqWHowL05HaGlQc3FiRE83ZWY2anlhWmp4VjJUNDZ5?=
 =?utf-8?B?WklucTJWNnNkdlFyc0J5MGEwTzdiMXZ1Qmx1VXlhOVdJeDlGd2VHSm02cWNv?=
 =?utf-8?B?U0tWeWNrSGJzUTZScmcwMGhhQWxlYWdZUDFJUG1UQXg0V2VZZEhocmllRStK?=
 =?utf-8?Q?K1nc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa868f1b-bc92-43f5-de27-08dd3bce0b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 16:50:29.7817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RKBAita2XOhe930zUY4ZBPFaiHRJYFVj5BnYh/2bM0CbMSEN1MV/6Tevibw4pzlr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORyZfwbasG4gasN4XUXMpX849eNUH45+iCg1dF4kIyw=;
 b=ORy4GSfwLqn4LEZhEf/V8ZhR872RXJtIZ8Ttk8QKNmqASQWJChH+tqqlR8witrYOjGdaOor3RnojWYbGFhdG9H6FWClhO552eEejexl8k0DbqjNr4msGCKLaZmZLPf4jOgJ/8KAR2lQyWNK5Dylcit6R9YbCGNGMsW5dIWQg18Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ORy4GSfw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/4] boot/xilinx-embeddedsw: new boot
 package
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

> +XILINX_EMBEDDEDSW_LICENSE = MIT
> +XILINX_EMBEDDEDSW_LICENSE_FILES = LICENSE

>  Instead of adding a patch that adds a symlink for LICENSE, you should simply set

> XILINX_EMBEDDEDSW_LICENSE_FILES = license.txt

> (and update the hash file accordingly of course).

Yes, of course.  Luca told me too.

Could you review v3 of the patch set?
https://patchwork.ozlabs.org/project/buildroot/list/?series=441189

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
