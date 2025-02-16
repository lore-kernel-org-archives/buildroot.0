Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476AAC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1A15606F0;
	Sun, 16 Feb 2025 15:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpv67k5hqfCw; Sun, 16 Feb 2025 15:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7FDA6072F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7FDA6072F;
	Sun, 16 Feb 2025 15:01:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F5CBC8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E47040492
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUzbtsMaTEH4 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::610;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D6384050B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D6384050B
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::610])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D6384050B
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/NJ7p618Ozt0vD4MqMWtahZGOxOQZY1yw7HMiqyK+dnAKkQEHe3evwJ3hqetvMmzcBSj3h7kTRjSCQl/B11DnAnb7DFzYr+Ldj5t4Eyx+479P1bgsicUJ/I5fbUuhEdCK/fF0YcySPdsI6lJH0PxGS9yu1KWjmv8I7Bd44RviyBlW0OFz8pSSeITHI/L+FTCzvKBIHxc8Yr0MsBFz5Ru+NkTJhBREQUM1RSElxv8yNzGTXAmpPHxg1SicUtucxz0+CSlKTXG7+Len9IPrmrLjeUQO279kXXSMmUemttXQ7vRgzpDMlVEEbga6/WPetwfFrL9ym5CUBAH7QF+ATn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OohvDKfLYrR9EHJMyp9TSCgJyYqm3knQCfQSTiqgGK4=;
 b=Ezqzm8Wr09C1NNNsKqCY+DGz1N0mCiHBwPji0uHUjHh3Pa2kA4M90gCxVdcV96ipTD3NEbixccAcOv5PxpnU07x+o0aSWlJ0m9vZ0ppE/vGxDyQr6fA7RD6b32cpwnpMuwxWqfoS5C76dJ0+wkHDR7/LSa4LRmsmwP+SaCeP3bHb6Kj4wVK85te5y5VvmwbVKHhsGXbjePoeZXfsplFampOmTOiXAnG65FCMH948j2Bo+69bmd9kUq3FuH0GpzzG3P9Eot7336F68W8SeEGXwuP2I2TBJVEA8YKwO1udX+76F9zAmI4TdCH4CbOmDEnBczTEu2HA2jgWSQNuWC1Fjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH3PR12MB8535.namprd12.prod.outlook.com (2603:10b6:610:160::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sun, 16 Feb
 2025 15:01:34 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 15:01:34 +0000
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
Thread-Index: AQHbf6kyWn7uMT21M0acf/GM+lz6bLNJ5qaAgAAdnEA=
Date: Sun, 16 Feb 2025 15:01:34 +0000
Message-ID: <SA1PR12MB5615DF093BBFF53DFB8427FFF0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
 <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
In-Reply-To: <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH3PR12MB8535:EE_
x-ms-office365-filtering-correlation-id: b6798ac5-9333-419f-3b0e-08dd4e9acdd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?UW5YWmFJb3lWZkFKRTBoekpaTEZlSUxVRkZ0MFJxZk5tellZYzdCNndrNmRV?=
 =?utf-8?B?RTJISEhVTWxTSmk1Y0c2dGpHYjV6RzMyenNjNUhkUGh4cmx2Z3gyWllLWFFV?=
 =?utf-8?B?TlJxa1VtQlQxY0NkUnF6S3JWTXczNGx1di95VmJFUmJjMXBNZ21rVnNRRUZy?=
 =?utf-8?B?MitjYVNzcTV4RzU0N0UxN0ZYWkFNaitTUFgyMXhmSTlFT2FUODUvQ3prcEpF?=
 =?utf-8?B?UWxFR2N0OE9ZZWhDS0JiYWhVTGYwWDgvcGN3Z241ZTZXdGRoUzh5R0thNlJ6?=
 =?utf-8?B?SjhRd1h1N0FHZk4vVndLQ1JCOU4ycVBzeWJaWGZrV2J4RGIvMXpNUWU2Zy9h?=
 =?utf-8?B?OXArcERWUGo4aG5ZU3pXMEhqZENKcDFtSlVURllKcXMwSjNSM09HN1VneUFm?=
 =?utf-8?B?UWxPb1ZqT3BIdS9rVEhyVlozVWxkTWpvK3JjQWhJQWpjM3doVDg1OVh6aTdr?=
 =?utf-8?B?aGY5MTNlcjB4MG9lU3lOMnRXYnQrNWJxWEQzZUM1a2dNUmUxbXpjVXNPeGVm?=
 =?utf-8?B?S01SRkliZlZGVitlZG5JK2tIS3YvSEZ0YkpGZUxWcW8zeExuT1UyS1lhaDl5?=
 =?utf-8?B?ZDl5Uk5qR0wvTFI0UnRSaWJOL3dSZlRySHFrcnlScFAvN3QwNElGdmx1OHly?=
 =?utf-8?B?SjVzSGc3dXB4ZzR4TllXVFhxUTNRdFNkNGZ1NDY5N3NDc1NjNnhURk9iTnRZ?=
 =?utf-8?B?andWM1RVMGlJVzJtcTREZG85bnE1N2xWZjlvRXFqRVNnZktRWFA0elMrTDhi?=
 =?utf-8?B?S3VWclBXZXAxUFVGUk5uQnUrWm44RnJZV3ROQkdsODNpaGdMSXJmckdObVU5?=
 =?utf-8?B?U050Tm5NN0ZGbzFMU3ZsUWpvMURzdm1wd2t3cWVoakZscEd0NlMybVh3N1JG?=
 =?utf-8?B?bkZXa01xUnMyT2JVaGcvS09OaEpPSHhEckdXaVZEQnF3NGhJYTV0eUkrWDN0?=
 =?utf-8?B?L1VOVktnbStYTStyYmNzOEpjOHBGNVZXVW54R2xkWEUzdGM2R2JtSXZHNVZH?=
 =?utf-8?B?NksyOFkyRFZuRWp1R2dOeEVZRmVaTHhDcDJFQUlXQ1orc212Y1Z3TGZlOUpM?=
 =?utf-8?B?UG5RUlFhK3ZBZytrdnd5WGtHWEVsaTl4WnQrTFltRU8yekNjNmFjcnFlZElj?=
 =?utf-8?B?QW00a0lLaU1ZTndHM3h4Ykx6WDBkUHRZSFJzaHhsNGNKMThRVGx5STd1dFMx?=
 =?utf-8?B?emdXSmtGdEE0SjBUdGhiTm9HVTFMcWJLTVNTcE1ISmljK0tXVkovZm9nVG9Q?=
 =?utf-8?B?QzQyWndtT2ltSk9jMlpEd0pMa0FyVzZhSG94VjVYUk0zbTNDK1BEaWd6a0Y1?=
 =?utf-8?B?MDZLZlV3Q0VpZVJ6QzBPbTVaUDM5cTdPalNTWUJxNHJESmViWDZqREY2a1hI?=
 =?utf-8?B?Q0phd1VCaVRBYnNwY1hRTGE1QStmc2RVekhYVFFsK0xQYXpKTy9DMVJLUU45?=
 =?utf-8?B?aFc3N2UyYkdEM3hVNExocTFUMk4raWhCcFd0SmMwenZGT1d1aE1LV0pYMFFE?=
 =?utf-8?B?SGxvR1VWZG1yT0Qwd20wMWFURWVHVktBVS9kWElHVU1VMmlONE9LYnpuaW5M?=
 =?utf-8?B?dkN6OUp3bDNWS1NRcjRLNjQxN3NabElOU0dqd2loS1psTHpHbnZXSE5aditF?=
 =?utf-8?B?aVM0RjQ1anZER1FWWGJGNFI3UG5sdCtyZVhWR2syN3lDZmxKZFdCc0RZbUNw?=
 =?utf-8?B?bWR6YW9sUnNZOUhvNUtUbmI2S29teDZkRUtKMURYMy9jMkhjS1I4MnJzN2kx?=
 =?utf-8?B?Y0MwaCtsaDE1VHNrajZSQ2ZYcTRPTGp3aFVFTjZzcVY0Tk02TWRDMUhhV2dz?=
 =?utf-8?B?M0F5aGpZRU1FYm9hUW0zOThNVDd6dkhPdldDNUdrTWhyTTkyVkpDWEkxOG9B?=
 =?utf-8?B?MEVMa3ZCVnJWdjlyZzA1Ry9JcmFKSXk3UXUyeGtKOFlZcmh3OEp5NytMNkxN?=
 =?utf-8?B?WDlzR0JVNmVEd3FGeXFoVkYrMzhGeGY3SlZKdUxSZ09TaDJQVnpMRk02OGRo?=
 =?utf-8?B?SUVycExVY2RBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NS8zSGxmWmVoNVNvQWNUMUVjNDlpTSszcUx0Y3RydXAwRmNsemF4NDFyaCtP?=
 =?utf-8?B?aWF0QjR5dXFGWm9IUC9aY2FwTmtWUjZuUHdNeXNWYWh2akJmMmkvMm1UM2RY?=
 =?utf-8?B?bXQybWVkUWtIaHl6MHRnRWRpUnFCR3RhSFpnOWVqbGFlUzZpUzMxOWdPM1lB?=
 =?utf-8?B?SFF4NVNkcVNpUFZTOFpDU3NJWnRNSSsyaDFySHdVZFgxVUordTNDWG8ySGlE?=
 =?utf-8?B?ZkwvdlBFc1NvaDVlZjgwQmFHOXZvRUVlRmhVenFWUlhlQnpnYzlJekJQL2N6?=
 =?utf-8?B?aVZyUXZBOFprMnNXS0NkKzNaOTV2bG9Da1Boam1ucGNDMXU1eVNZeEZ0bDBO?=
 =?utf-8?B?T0hyTmpsbU90dUV4SE9DQlowVWRsOTg3STJxVm1WSHozcDdpb1JFaCsva29E?=
 =?utf-8?B?YlRPTkRrTHZ6K0x5clBYSFptUXRWeWRHSWQwSUo2R0JPV1AwRVN1eGJOVXM1?=
 =?utf-8?B?SE5wbkZKVlJHUVhNMzdlRnQ1L0ZMTFNDdTV0RVFNNjdmbURoZW81c2lSbGc3?=
 =?utf-8?B?cXNNc0RNSXJVQlpzeURpeFhUSW9Hdk8xaitqcG9BaUVkdngvdmUwTW1QVGlY?=
 =?utf-8?B?b1FWNVcya0NJdmZLMGN6OUxTU1VHd0ttaUduQnJNREszb29sSVdDR3hBTCtt?=
 =?utf-8?B?R1pveUxKYTBEOHhWQUhhNkQyYlJNeHFNQVVTL1VQVjRCM0VoWnp4N2pmZ1Jj?=
 =?utf-8?B?Ni9Zd2Z1Z1ZpNmdVbnB4Z2dOTHQvNHhiV3RwUHZmSWMxTm9lRnkvU1BVWktM?=
 =?utf-8?B?QWtqSWlaS0M0WEtNM1BjVzk5ODU1S3BsQzNvTDVST2R3bnFmc3BGMFAxRXlY?=
 =?utf-8?B?NWxWUlczcTYxNmxmeHZRVTREM0xQZm5UUmsySzdwTXYzbjl4OEVtZTNrZ01O?=
 =?utf-8?B?UVRHNUlneEdOMDdCTzgwK1B2SlVSMnFQZVduWUNnVVBIa3ZpbXRRSnliNVBB?=
 =?utf-8?B?MzhRS3pYOUpEYVpWamFubW11czBJRERoTEJYS3VySGhmcitzcmhyR05JUUxh?=
 =?utf-8?B?dWdqNDVvTTFpSWJHd1hRUUg1K3B3TnNpQTU1VkpQUVlyZzhOLzcyalBFNzZs?=
 =?utf-8?B?a0NyK2xGOGpoOWovRVcwaisyWVo4Z0pCZFJLaWdYZ2NGOHgxOHc4RWVXNTR0?=
 =?utf-8?B?VmxCVm45d3M2SUIrY3BhV0hsYXZFT1ZDVGJTdFJzZVkrZm9yWDM1QmE1Snkx?=
 =?utf-8?B?azlrR0QrbmVxaFJvQkJ2WlF6Q2QzSGhUWDlXRVg2MmxHdk83MEFQUnczT2ND?=
 =?utf-8?B?R1BYcXBwaldCSVhpM2RjamwvdHRUM3NSclYyc2h5MzNkbTNKVTZjS0dIRmJD?=
 =?utf-8?B?NVpZSGRuOE84RjFudS8wOUxBWXlLcUpwMWk3M2RIY2JTSXEyRUU2WkZ1MVlM?=
 =?utf-8?B?bjEwQXRQek95SkNWMmhqSlNFNGxabnlVQjBEbi8vSCsyQVBINDVhbEM2R3lG?=
 =?utf-8?B?bzZWSy91M0JnNzZRems5bHFOd285WGNMQ2lLWklTTmRLUVA4a3NZZU42SXlD?=
 =?utf-8?B?QWdMbDkrZHBZL29Wcng1ajBMRHlpQS9raHlHR0w3WlRmenFVRDUvRTQzZThJ?=
 =?utf-8?B?ZUtCemQ1RWU1NXpndVdOY1QzcXd6VEl1RXV1dkRUdlNFZ0V1ajlXYU10aVIw?=
 =?utf-8?B?WmgzWjgvZU9WMEJ3TUJlOXR3a0JqYUNiUjFTQm9uc0VaK0hqQnp6T3FhODFB?=
 =?utf-8?B?azByUytlRHlabU5qbTdDTlNrTHhEQURtdUxIb1dXVTJnZW1rbHpVWnlFTlhE?=
 =?utf-8?B?UmVMS2FtaHhwQmg4VitlVWRDejd5T1YzN1VtWkE5ek9DeWNjRUlaQjc0ZkdO?=
 =?utf-8?B?VUxGWjdYb1pvZjBBd3ZnWmJGWmE0M24rNUwxN3VQRVBwbW5sdjN6YlA2TTdt?=
 =?utf-8?B?U1ZjVmd5SS9PNmxaMDA4WERhY0pEYStVa0owRFNNT2JDOCt4V1ZrdXlBdVg1?=
 =?utf-8?B?eHROcGw2b2VQVUx4Q1NJR0lnTC91MWpCeThhMnVqTUgwUnoxZ2Z4UENIMnJ6?=
 =?utf-8?B?ZFdMRW1OY29XZDJqcENuTjNwaTEwUStXMmVRT2kyWXdwRjU0TEE1OFNCejBt?=
 =?utf-8?B?d3FKSVF6Y2NHeS9jLzZMN0xaTlRwU3B4K3lnN1hkQWJpZUJGcVVjb08yRTQ1?=
 =?utf-8?Q?CCYs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6798ac5-9333-419f-3b0e-08dd4e9acdd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2025 15:01:34.1385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /843WQozR4Mt+AdY6ZZL/iJ2M6StKtcrIio4TlvHZgQ7PyIN2L2kIT7VveBnY2Na
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OohvDKfLYrR9EHJMyp9TSCgJyYqm3knQCfQSTiqgGK4=;
 b=u7q3ahYUE4jHbXap6Iv8op9CWxpRS9Azl0hmQDPeZaqc6xz7CtHZuhb4tDDDiPNCCMaKGoJaMUtLUsMNi4w1JcW06pAoP6NFB1k29ocol44EbYQO6/WqgDcasYksRhDM7PiV2xuToCWsPjY19BGZ5oeqm5shXoW7BQBHi723BZc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=u7q3ahYU
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

> - --enable-shared --disable-static is reverted (because that's what binutils.mk 
> does);
> - $(if $($(PKG)_OVERRIDE_SRCDIR),,...) is dropped
> - $(QUIET) is dropped
> - CFLAGS and LDFLAGS environment variables are dropped
> - CONFIG_SITE is dropped.

>   For the latter four, I don't see why they should be dropped.

>  In addition, there are a lot of configure options that don't exist. We add 
> them to the generic autotools infra because unknown options are ignored (with a 
> warning) and it saves a lot of repetition in autotools package, but here we 
> could include just the options that actually exist.


>  I think we have two possibilities here: either we use the stuff from 
> autotools-package _exactly_ and just add to it (perhaps even keeping 
> HOST_BINUTILS_BARE_METAL_CONF_OPTS as a variable) or we adapt the entire thing 
> to precisely what is needed and useful for host-binutils-baremetal (so dropping 
> all the useless options). Either option works for me.

>  In the first case, we could even rewrite the autotools infra so all the common 
> stuff gets put in variables HOST_CONF_ENV and HOST_CONF_OPTS.

>  Regards,
>  Arnout

I agree with you, and was already thinking along the same path for v4.  To be
transparent, I always find the software development goes quicker when I have
active participation from maintainers like yourself.  This is why I submitted
the patch set as soon as I had something that was "working".  Cleaning it up
with your help has always been much quicker than my taking the time to do it
all by myself.

That said, I am thinking the first option is the better one.  For v4, I will
wrap up all the common autotools environment and conf options in variables
HOST_CONF_ENV and HOST_CONF_OPTS without changing anything to avoid unexpected
consequences of other packages dependent on the autotools infrastructure.

I will also bring back the HOST_BINUTILS_BARE_METAL_CONF_OPTS and
HOST_GCC_BARE_METAL_CONF_OPTS to include only the options needed by these
packages and nothing more.

Once this is done, I think the patch set should be ready to go.

Thanks for your help!

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
