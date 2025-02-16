Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC7BC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC3BF4074D;
	Sun, 16 Feb 2025 15:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPwENU7vsCIr; Sun, 16 Feb 2025 15:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C99040825
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C99040825;
	Sun, 16 Feb 2025 15:20:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 558271BA
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 350944045B
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NzWHNHz6kWd for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:20:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::62d;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9759D4019E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9759D4019E
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9759D4019E
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoEehbeNoWbzIEDClD76wlWkrBl7YoCoC+QCP2qpM33dMqP9uNXoIFL7uX9o7bzp1cOLUIw1hj+KO8C+7H956nZUz6Id9VC9yofpET2nBhe6LEyg4DEhjhBHRxC+47fE+zLH8Hvtt0wt14om3gG9E0arV6itSEa9Ak9PbyOUQitB4ihsmi0+u6BjJmamfSAxvexco+AEdT6dO9DfJn0ZfCeux1w7/4XlFNhT/KdTRHYztLUGOXGkOM8fd7PTOwPQ/t9up51vrfs/de3PiRDfgTZz8gPDG+j7lFwV8btP64zAgtXzTj5XtjWx9vcaFhvZShgHMJ8bXM293G5ve8H8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NkVuQYSloH3fvggbtpG7794VPmqgXa8Ubp6q/CcmxY=;
 b=AtTaeAslV3Q06l5sE8bdaJnhtVhpS0XeO8jXWbKYo43jxrty4cgjqCf+orc/WlsX32JctFhPTXl6/4BRKC4vl5oxO7500NSlGLEDr0h1mQx1oVOccXIeXrCTMgAfsFjNLdrSIbuZtzo4AprSofevC3ew2ZZKNQDdiZGnkIJiEhuBSv9q6IN/KCWV5gzeDp8TWAtUR2vkvOZ/PCM+iWTe5LqQlGyaxJx2hOPP8dzBNOx6utgeGdeSFX0EgLHmkOYlKixCXOC/syEiYyy6Gy+GbX7qiCf+/bYOemAZrGA4ucsYQM0j5MCm2ptSlDZ77Y52lLLw9Bh9TAnsFCG04Clg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Sun, 16 Feb
 2025 15:20:49 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 15:20:49 +0000
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
Thread-Index: AQHbf6kyWn7uMT21M0acf/GM+lz6bLNJ5qaAgAAdnECAAAd0UA==
Date: Sun, 16 Feb 2025 15:20:48 +0000
Message-ID: <SA1PR12MB5615F44DF6090DA0BE7C7294F0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
 <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
 <SA1PR12MB5615DF093BBFF53DFB8427FFF0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB5615DF093BBFF53DFB8427FFF0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH2PR12MB4311:EE_
x-ms-office365-filtering-correlation-id: 50c56154-6800-4ded-641c-08dd4e9d7e2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?eThYNU52ajd5Uy9KQk5xcjZVbWRzTy8yUk9rUWtUdDZqZTdLUXNmN1BRZUQx?=
 =?utf-8?B?UU9NSzB6RlQ1SlFyOGpVT2JTWFdMTXlJUEl3SWVtUWNDUkVEMkNEc2FGaUVh?=
 =?utf-8?B?YzBOQmhPQTJLSTYvYXl1ZHZBYVdaZ1hBR2JKQ3NjTVhrc3BuU2h3KzVKUi8y?=
 =?utf-8?B?Z280b0VjUnY3NXVRYmI3UlNhNmQ1Kyt2TzlpanhERy9Bc1BBZlRVUUxucSts?=
 =?utf-8?B?WkcxOHpJNm50Ull2Q21Rdml2R0Q5WkNJZFF2SXRyby8zWU5yU2E4clpIbTVp?=
 =?utf-8?B?ZERIdHBCY0RreXNudGpNU3ZpcEhxRVpoY2NxNGtBY2tZVzBsR2dvNGdEVkgx?=
 =?utf-8?B?L05kaWxPMWxiMnVuL29rdE80cTR6V3V1ZVlPbXlGcHFCOEtqejNXR25IOFp1?=
 =?utf-8?B?dmJTNzlibTFXanUzQ0s4dTBYRSttbEhTeE52Q0xFaytUYitYbFozamRKVldQ?=
 =?utf-8?B?aFl5eUNXeGw4Z0JtcDZOREVQQVlGSlVWU3dxVTdvWURSYjdEU3RNTzJZMDM4?=
 =?utf-8?B?Ri9tWFRFTWtSK3pPNjZFVmFzQXdLRGxNQWlrOWZsQURDVkw2NHBsTTAvd2Vk?=
 =?utf-8?B?dlAzWEUyNElPSmp1Z3ZwYUxacjJ1MjNCWXk1RUZRdnJJWEpZdUNsRjBST0pO?=
 =?utf-8?B?cHZBdGNBT3BPQjIzTDEzUEwveDZmUG1xdHNpRFYvQnJzSFB2NlJSbk9kVmJZ?=
 =?utf-8?B?K0hDdWtjV0NtdHBkbUFvc1Z1OGtTVGNhRGIzLzUxYVRTdTd6c2VkZHZsMUs0?=
 =?utf-8?B?RW1WL0NoYmJkenUxZGhPaTdtZ1BSZXA4MVY1emw2eVBKQ3NoaEZMSUtwbFJU?=
 =?utf-8?B?cDRhUkNGWjdvVDk5OVk4RGI2T2NUdDJld2ZHbTU2K3lqSnBCbkZmcURBRitr?=
 =?utf-8?B?dTlBYklLWmRVdTV1NFlESjM3YTREM3lsekszcW5wbU5IV3RsaWs1cTRZWWsw?=
 =?utf-8?B?RDdnb3NSNHBhN3dVU2g3OGNnZVpIRkJYUWhHbHRFTE1lNFFXc242Z1F6MVRj?=
 =?utf-8?B?YTlRbzRmUVRvQ0oyTEI2bUN5R0NZWUhkdUszRkFGZVBjaGFPQVZldnh0aVNZ?=
 =?utf-8?B?OEc3eTJTdGVYdmlxcjROSVhLUXc4QjlEdTVVdGpVdk5VMGlTS1FJalFJNFZS?=
 =?utf-8?B?dzdaZjFJcFFGZXBxeFVGbDcvWkU0TUV3VmhEWWJoTTUwVnoxaXJhTjI4TkVw?=
 =?utf-8?B?bEl5cWo0RTRnajcvdGc5Z0l6dFpkb201akhsRXRhUVlRd0hRSnRlRTcvQmhu?=
 =?utf-8?B?Ujk5Q1dUZkhsd2ljWU9Yc3dOSWNKUitMOUdpajVpTFVjT2hiWDQ2NDUxM2pQ?=
 =?utf-8?B?Zm9DT01rRnNsRjFSaVFJT1hHMWdFN3NYdzgvVVA1d2ZzMm9KaFFRNnRQcHNH?=
 =?utf-8?B?Wm1WWlJEU0p5L0FXcldGdVV3RVlHcHBBMWNQNEY1SGRQazYwbk44eTZUVVZS?=
 =?utf-8?B?Wmw3L0JCMXBKYmp0QWJGU0xPL28xaDVwSHJyeTM3cDBJSWREVkxWbldhcXV4?=
 =?utf-8?B?MWRIWHJINythbkw5UnU1SExhcDJLc1R6akQxaXlLaXdyamhZQ3hvSEhXZFNO?=
 =?utf-8?B?S1lVVFFHb2RJdHpHL1NHNDBwUlpnc1QvR2xJaFNCL2lBNjJMc1p1a25keXFo?=
 =?utf-8?B?cTNSdHRMUll2WlZCNjU3eGJKNnB3R2hyUURFL3VFSDh6S0Nva3BHemN5eTFC?=
 =?utf-8?B?NUQzRmpGNWJFbC9uZ1pUaVhPNkF6WklRL013KzhRRlZLTlpGcDBkNlUyRFlV?=
 =?utf-8?B?b3FQMDhhMzd5Y3NVbWs1MFVNbjNCZy9CUngyM0gwbGhaRXE1Sy95VmZ2T1Q2?=
 =?utf-8?B?QWlGTDhpUGNKWkwwcTVFZUhPMy8vNTJnWEIrZmM2UGNPMnpDL0dUYWgrVitY?=
 =?utf-8?B?YlNVVGJGQTVZUzZkbFpUNHRrT0lXdEh1OGRCOFVrVXNmNWlpZGtXdkVGQmIw?=
 =?utf-8?B?SnI3Y0xLQXpBaFI5bkRQaVc1aXRsQXF2UGJwejFtdDlsOC9KRWVVSlFwOElt?=
 =?utf-8?B?aGhoYzMrcENBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXV4T1lRei93WFdpS2tmRHlQUWdCWXZvWGNQVE1nOTlZRUdVK29XdjdrSUxH?=
 =?utf-8?B?WEJLYWlla1lQdVBZZHozWHZqZjFqMjRCbFdOb2J3cDJkU2RzQjRuUXNmWlhM?=
 =?utf-8?B?cUZHQW9ia28xL2dhMnY1cGs2WkU1YmRueW1XN2Zwb1BXcEk2S2ttMjU2bGgv?=
 =?utf-8?B?VDAxeUN5andXSlBEMExyNkRFaEY3cUNzOVNpMlRENWVtbkxTcjVWdk9ZQ05r?=
 =?utf-8?B?N1J4T2tDYkxzZkNCUXFZQVJvanY0QmpTcHZBVjRvQzQ4RG8zRktrVmtpN2hK?=
 =?utf-8?B?UWorN0NFMG1ITTBKYW0xMkNzQ1ZDZS9KK2RCSjhCU1Z3cy9oNGQ3UklWeWZK?=
 =?utf-8?B?bTl1V3lxNFgwaU4rNURyOE82clJJT2l2Y0ZrNG1RZmljZ1NmRWhTWUp4WGhT?=
 =?utf-8?B?akM1QkJsOVZMMUdkWWJJV1h2NWNwTFNDTjBvTnhNZFlyRUYvNUljT09TOWNn?=
 =?utf-8?B?M1kycFppeE5ycENKc29wMlZtelkrTVgxbnVwb3hkU1ZuMXh5d0o5b2hkRTQ4?=
 =?utf-8?B?OHQyZWVPOXJKTTNGby9DRHFPVDcxam0zL25IK1lreHpvZDFyMUtIRE5nZHNF?=
 =?utf-8?B?VmMvS0szL3hSR0FSejVJSXFISmtBVHVjT1NkL0loeXZhMzhESVNwWk9HbjJv?=
 =?utf-8?B?elVmeTMwaE5FS1U2cVc0aDhqNkdzaEZPa2J3WVR2TUhYaWJzSlVhaHhNMTly?=
 =?utf-8?B?OVdLS1hEWHpIOGV5dVo1TjRWOXNKNWZic01SSFlSVW9DRVNZTFMrdStWR3R3?=
 =?utf-8?B?QnFGeDdHWVlIQUwxU0REbWRkeHNJdm5GZ2dNaHNOMVp3cVJ1K1ZaYXJpVjVh?=
 =?utf-8?B?L0RVOU9PYU42NGk0WGpvMVg2dmdwU3RJZVlLakJTWWhGbHZvK0RMZnR0SW9w?=
 =?utf-8?B?czMxTEkxeENnU0hlL25PeEUzbDU4R0MyZTNsZ0pzbUYrT0FMdnc0WWJCT1Rq?=
 =?utf-8?B?cFMxRUZEZHBicnl2YmRLd2ZBb096TEZkanBHampQTUNaZnBKYjJPMDdUeTlR?=
 =?utf-8?B?WkszYXN6aUJvMWlsTkxHOGViVVltR2RlTXdlcnF0cEwyNjdHLzMvZ09XNGdX?=
 =?utf-8?B?aTFmMUNTN2RNTzd3TEl5eGxybHQ3NUVGUGdGSUU1MWNYcVJkUDJHT3lLc0V5?=
 =?utf-8?B?cFFlVEg2MjRWMklMUnpZS0JVZ2dldUExL3BYcVNCV09yZmFqR1JLS3kvK0NJ?=
 =?utf-8?B?cGxJTTJYSnQxWVg2WS9ZMlNjN3BqeS9XZUp2NWZHclZiRElGM2tZRWszSnNt?=
 =?utf-8?B?UWFwYUFCTy91Z3JrMzRCTVhTUnBDVVVyUVgrbm1JV1laWW91a2UxV3hzSXVh?=
 =?utf-8?B?Nm81UXpHT2lzZldjTEU0dXJwN3dTSmU1R3JoRHJSUGlMNTZJYlRYMVloM0py?=
 =?utf-8?B?QjZLV0tXNG1ycExPbUFzNUdhWnpZcFc0eEtiSlJKYUhpLzFuSmozNVVGdWtO?=
 =?utf-8?B?VUJXenAzUG42RGR6VUU0azJXM1RwLzh3alpOYWhUbDd5NTBSNHVJVkNGcnR5?=
 =?utf-8?B?Mk9YKzBCdWFhUThaRzFWcG4rb25NMGo3N2YrNDRjVyttK3JWaGp6eDhTNkRS?=
 =?utf-8?B?RXgzQkR2SW54aDNkOWRMbWlhUzgrVjloSzJUME92eGJWN0Z3MVRCT3J4RmZz?=
 =?utf-8?B?N2xDVStqMERhWXNYbVVLTGRtd1l4c1ZEYTZaaHZTcHVTTGwyV0tHM1lmS213?=
 =?utf-8?B?QkluY256dmE1cjBFTTJFWWh4RmZmYzVMV2YzNWlIczh5eUdvNUk4L0NDMzZC?=
 =?utf-8?B?bmozZmRyczJySWJDdEJ1ZGVCeVpiaTYvMUxveFJDVWwzdkI2MEVtODZ2Qmdu?=
 =?utf-8?B?QkRBQkZSc1J5UldkdklzRC90QWI3Z0d5b2t6OXA5dmI4dlVnWG5pZEo1Um1Q?=
 =?utf-8?B?dUFPQ3BoRnFLak40UXpVVTR0cDRFamhNeGxUY2x5bEk0SS9lK2tUQ205QTJt?=
 =?utf-8?B?bjRSQnlNamErTVRBOVAzTjd3WC9rbW1MR0tNaUUxZlVnV3dEK2hIMC9nbmtO?=
 =?utf-8?B?YTh3NWFtQzhrbG5LaHh2ejFYaHEyTG13WnlyU296QjY3U3E1clA1Z3Yzek11?=
 =?utf-8?B?ak1hYVlBaXhiQWNKS1I0aU1iM0huNnIraTMxQUZWY0hmMkpHeUh6Rmtxbldv?=
 =?utf-8?Q?ZzTE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c56154-6800-4ded-641c-08dd4e9d7e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2025 15:20:48.9528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aROLtlrGuoJ/DhM2DKqESWJYm6JsF+SV2rkuJ9bD1vcHBOgp4Y/tEcaJEQtZexYI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NkVuQYSloH3fvggbtpG7794VPmqgXa8Ubp6q/CcmxY=;
 b=zZg9jfwtWbjIw0ghczr1dVjs65anFX3aGvhn3CYsDeZWDIjy/JCW1IHj3S90dCyPwf5oixL0QE/Uq6NpJmvHhiW4aFUS5hQ4hxA8Kxx9BZ0hkhyrkLVvzQt9T9JVyrJ4Q1npQv5uFQCnwB/EJpMhrcKxMMaSEvfB5woTPBIvvY8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zZg9jfwt
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

> I agree with you, and was already thinking along the same path for v4.  To be
> transparent, I always find the software development goes quicker when I have
> active participation from maintainers like yourself.  This is why I submitted
> the patch set as soon as I had something that was "working".  Cleaning it up
> with your help has always been much quicker than my taking the time to do it
> all by myself.

> That said, I am thinking the first option is the better one.  For v4, I will
> wrap up all the common autotools environment and conf options in variables
> HOST_CONF_ENV and HOST_CONF_OPTS without changing anything to avoid unexpected
> consequences of other packages dependent on the autotools infrastructure.

> I will also bring back the HOST_BINUTILS_BARE_METAL_CONF_OPTS and
> HOST_GCC_BARE_METAL_CONF_OPTS to include only the options needed by these
> packages and nothing more.

> Once this is done, I think the patch set should be ready to go.

> Thanks for your help!

I take back my previous opinion.  Looking closer at the autotools
infrastructure, we would need to handle wrapping up the conf options
as variables for both target options and host options to do it right.

Since there would not be any packages using the target options wrapped up
configs, I think it is probably more prudent that I just create
config options for binutils-bare-metal and gcc-bare-metal that only
include what is applicable from the autotools configuration and nothing more.

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
