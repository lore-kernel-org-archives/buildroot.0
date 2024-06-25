Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F304CC2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 726B0400FF;
	Tue, 25 Jun 2024 21:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItOpSJG4OCqh; Tue, 25 Jun 2024 21:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31FC040103
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31FC040103;
	Tue, 25 Jun 2024 21:02:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB131BF863
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12BC781D3D
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gT1QRV0tB7Hd for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 21:02:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::62b;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0977380A61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0977380A61
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0977380A61
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 21:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ej9JHybCEqnuvTdzGU1lNHqvq8M/Ot2VRpNgZsNkalvuHDooSjI/yaAJvi+po7GOmBadtvLwRB9hni8IZt0127mQqi2LEzA0MvQzBopHFIVerfHclnGviELloRwzVPlxsudg42U+vg2KKeVFl1XeuObqo6UR+8NYnlz6oqO9PRhDcUjogB8L5eBA5CmIWdPLsMcU9mHLg4+WBNJ/ZOMXPy4MTa07cE5sTIe+pWTU9cXyaawfMBSJo2CTfyjIcX0fEOT1hJIOxCH0e53v1t6di32kzbANvrt1g02ZXGPFFd7UOJssYgGhMBPF2qJ49Lw8ZpZDUpzUxpO2NgL0qvRODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gApkrWrr3kZpaCgh7wONGR+OstnCiATe/3NRyx4QIX0=;
 b=eQiMKlhbaEVuj/GZMCg24BPhZJG0KFtwwCpiUa5MZegsLX5xk/0I1mtaRCtVAQy+EpcDLVMN5KY39yNu9nCwrHoSWnkQ9T6PxkDDzgnmCYgPIZWptYfk6N6ak2u9/XQNJKCfo/eNPh03NzvnYXXFCiaKc/ztZJqS6Ar+L6m3tkO0yT4pj4yg7oUbyz5cLlkAolgdCfcKYflm1c/Z6QnCALWUuW/6zPOPNIGRI8XBlzmE1AQ8meUsoO9h+oWYdUDygTVTAtF9Vg6OZys8B5nwnextXebFOT2AK5OuDERD2w63XHhPu3CGRhovZhbulL4n11+/XwBgB+XEjryhwaRgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 21:02:41 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:02:41 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] boot/xilinx-prebuilt: support custom boards using XSA
Thread-Index: AQHaxzKATUBe08FaRUaTdjPNfFUJp7HY9mLg
Date: Tue, 25 Jun 2024 21:02:41 +0000
Message-ID: <CH2PR12MB5004D83C6AFFB37223A0F732F0D52@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240625-versal-xsa-support-prebuilt-v1-1-f64a7a396a34@collins.com>
In-Reply-To: <20240625-versal-xsa-support-prebuilt-v1-1-f64a7a396a34@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW5PR12MB5623:EE_
x-ms-office365-filtering-correlation-id: e6778adf-0355-41c6-ebb8-08dc955a2733
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230038|1800799022|366014|376012|38070700016|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?bDVTM1AzU2JYekQrTkNXbDVIZDlIVzdzSWZOWHNCL2I5T0F3V3pRMzVCdjQ4?=
 =?utf-8?B?Y3RwT2dvSXVNUDdYbDBuMGNYenpPWWVZNVNkeUY4NWxCUXVBREl2eTJncWIv?=
 =?utf-8?B?Z2hXNkVsK0VHQzdWSWlvN1pySWk2M3NPZ0FFVCtsTkhZQTh5V3B0V1dnQTE0?=
 =?utf-8?B?VDlxeE1Odk5QRXVGVDJDaVg1TS9nT1JJT3Z6WHpnSjhDMU9IVGpPeXRpWVE0?=
 =?utf-8?B?YWw0R3Z1dEJFSDNFUWRjZDRGWjM2UHZva1ZiblJUVDJFWjc4aHVzSCtYcXpu?=
 =?utf-8?B?cm5MSUpZYnBCSmlhcnVHaEt4amFkd1g2RFpIYTd5WUt2Mmg3OFA4VHVDcWhS?=
 =?utf-8?B?bnRmT205RlJ2M3NJTlRsTGMyWVltUDdGclVxTGViRFQwdHF0eG00WmVETXJV?=
 =?utf-8?B?aldjNklzd0wrdC84TlBRRlFaQmdDM01IZC9DTnliNmVHMXhEZGFkSEgxLzZw?=
 =?utf-8?B?YldBSXk0UWlCQnlhRTdoZmFXYmVRVlZXR3BwR0NReFA1NTY1MjBoanUvTjJE?=
 =?utf-8?B?WHBYT3Iya3dIVkhlZ3FBaHh5bmpvSHJJNlV1TFgvVVFYNHZKTy91WFFrWWNp?=
 =?utf-8?B?cXovNTd1WDFFQ1ZCVjdpakVJTE0rVUs3ZTh2bkszVnNJRndudGxFREVHNjg5?=
 =?utf-8?B?MW10WUw5RUFxRlNSY2taMnBjRlNPS2dTNEp1U01IM2lYZVJHZjNxYUl3SVZi?=
 =?utf-8?B?M21ZdWRVSHllMDFPQkNiQU5SWTNkNnFqNnJLYW1EZCtKWXB1ZEZLL0wzbDhG?=
 =?utf-8?B?V0JTM1RVOUVLb2lSMXRHMVkyc0JJb0VETVZhdU9DeExodzVIM0puc0JSclc4?=
 =?utf-8?B?RjhjeXdwQW9QeXI5NGhvNldJbndvbkxCTElKcTMvY3loRnRPOFAzcmpjUmlH?=
 =?utf-8?B?SU94OVE4bHI5d09FNmowZEJpN0dIS0t6aFhpa1M0b2crVGRFcXVndkY3ZE5Q?=
 =?utf-8?B?ZHNVVFFyYnIrbUNRN04wSE5nQzF2dVIyc2ZCMkpCbDF5WHpiUXJaYXQzWlNv?=
 =?utf-8?B?T056OEozdlFKb3ZzRlBxeVlpazljZm04N0R6UzdTSUtmVktYMFlGZUVISnZ3?=
 =?utf-8?B?UzRqK2c4Y0t1WWRGdVRWbWxKNGJjVVJQOGQ0OHFnNFpOc215UDBxaW8xNmZq?=
 =?utf-8?B?NVFvQzBrVFd1OE51ZGNxZnFvTFoyb0pZWVdZNnIzanJ6S1VKVlB2UVBieE9t?=
 =?utf-8?B?OFZTSGNsakp6dXhZdmJCTzlCRlRqQjhTK1lEWUdaa254UWlhNXRkaUVXYlE5?=
 =?utf-8?B?VGkzU0hOaEpROG56VERuQy9KT1QyWVVMVWVZQmw3Vk0yZEl6VW1XeVRjbmtv?=
 =?utf-8?B?Q0MwTW5TZXdsb1pTazYwMi9FR1hUMThnaWY0djJNNlNHSWdDZjlQTFZqa05l?=
 =?utf-8?B?RFVseTR5VGtiS0g0UWptYVlIbzZIbFhsNEplNmRNTHhhZlBaQTNvR3VQTVZT?=
 =?utf-8?B?V0VPUVNqWmxCNmV2VytnK2t6emRSc2dFd2hHKzB2eWt5NkVIL2hCc0JxNUY2?=
 =?utf-8?B?NjM0WWgyenExcFQxOWlnNjN4S0JwZy9tMVFRVmh0TjdJNzM3eHZTZC9qUG9t?=
 =?utf-8?B?cjB1YTMxWVlUUEdoSi95NE96TFhnQ3o5VkpWS2NRQnc5TVBFdUMyTFg4Yld5?=
 =?utf-8?B?dzlzaERtNFVwbHpxajE1dlFOckV3dnhmTnhuQ05OalZoc3hEcUJmaTJPVXVj?=
 =?utf-8?B?Tnl1TEtiUE1KbDY4aW5NZ0FWdjJoOGVwNWxmVmlUMHN4T3RmYU4vN1ZUcjZa?=
 =?utf-8?B?UlkrcWpacmx0R0cxTEl4MHBsckRCbnh4TXpJNEM5eDNKUjQyc1FTMlBlQUZj?=
 =?utf-8?B?MStleU9vU2pTTXNZenllY3N6azdMN0RMNTRBYStrcktWWEk3N3RIa1FNeFVC?=
 =?utf-8?B?S0p0ekthbXFCN1pwdE02eUVuVGk2NnU3cTVLWGVsb3Qvd1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012)(38070700016)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VngvRHVieW93VVpPQTFWc3QreFNXNThuaEJScVVaaWR5L1dGT21ENWdkQWlx?=
 =?utf-8?B?cTF1bWdPVTFlVWp1UVF1bk1oUXlKNDVhY3c4a0dxRk9aUGc4MGNIbmVZTUxj?=
 =?utf-8?B?OEdnZXdmaHpRamdhVmZaK25ZaUwrT3Q4NG9uUXlEbzErTEhGSUJqMDE5R1ZM?=
 =?utf-8?B?b0xVR0JSUURiMlZrcXk3UElVL2R3WnpnazFzelB3TDNQZC9TWEZyb0txNDBN?=
 =?utf-8?B?RE9tODh6U2dGR0JhUmRzZlExbU1XV25sdWw5M3dDYk9sdmJsaHgwcUZRZWZP?=
 =?utf-8?B?R1o3eXNxL0g2R3FYeGxSSlV1L0tnaXBiZWRGeCt4alk2RDBpZFlJcHdCNys2?=
 =?utf-8?B?TVdrWXRHVExyd0FRajZ2YTdvdFZKTEdMRDlhVmtlWHl6OE5SNkRlNTBFQVF2?=
 =?utf-8?B?RTJVeDUxazhWVDEwbHhqNDFqVmZhL3VVQTZrUU9OclUrQUdvT1kxVy8yczFJ?=
 =?utf-8?B?OE0wNUt0cFo5UUUya090dlByQ2FhVXI1ajcyZ2dNZE5aYi9vOTZ3eGZlbTlE?=
 =?utf-8?B?elJRbk1oT3NNejRsZnUvLzFBNkRVWFdsNi9yeFlBMksyL1VVM3o5VGpWdlBp?=
 =?utf-8?B?UmNKdFhQSE53M1pNTU5pNkg1WVViczhaMlhtMEFMaHpQM2YzT2dDN3l4ZjFs?=
 =?utf-8?B?NWNySXFVVTFZRWJ1eU00NmMycGtPR1lQN2xKaU1ETVMxbTY1Ykp4eGRSemlL?=
 =?utf-8?B?VFhSQXlXaXUwaUN5Si9hMmc0VC9zN2hKMmxXYUM4OUVqcVJRZ2FyNDJYVHk2?=
 =?utf-8?B?Rll1cW4xRXdYTkVHU2NOdlRNZVdFWE9hNTRBUmtnM3VvajRYQUxRSmZ4L2Ja?=
 =?utf-8?B?aEorK20ydlRDbysyZGd3SThTVXRnL2xOMkFTdWZUZnlycG9jdS95OTF3Wm1N?=
 =?utf-8?B?RXZqdXg4TDVReWJLUWVySmIxL3p6WVhQWUV0blE4TVIwUTNKVnlaVVk5VGlx?=
 =?utf-8?B?R1dyZDg0eDhuTXRHRjYrWXpKUm1TcGJOWjByOFdNcXVaazB5SXk1S2hBZGhn?=
 =?utf-8?B?REk5dG1JRk91bjZGcE1kVy9PVUo2aENDdlZxUU5yV1RiSDJ2VFRmUWdCcFVT?=
 =?utf-8?B?OEpXVmlZMzIxallKZUJMcERrVEJNY0dGMGdTdkZwcU1SYTl4U21BWGpnUngr?=
 =?utf-8?B?ZmQxR29jOTNyekozUlFkTFloRG1mOStaVDdhMVhNb0xUeEJtTnhoN0JidUo5?=
 =?utf-8?B?Q0lxc09rOFBobERDSElNbzl3ZGx5NXl4Mlp0bUtwMW80M2l1dzAvb0RpZmxk?=
 =?utf-8?B?bE1XZVVseVVKU21SUGdYYTF6QWRIaXJhK3djbnhjWGFhWHpwM0U1V3dFTkdV?=
 =?utf-8?B?QTMwbXY4U1UySWlYMEd1VEtSZFhIVVp1UHZpNWNGWGZBZHRVSFMzdWVSMDNL?=
 =?utf-8?B?aU1YWFR5UTVmK1NUWjRMaEloWHdDdCtpbjJEeHZVTFlHZDl5Q2lqSTdDdWth?=
 =?utf-8?B?bzZyOHdteDZoK2VXRTZobkVKOUpJKzl4T25TZSt1ai8yZ284UXl4dVMzOFI3?=
 =?utf-8?B?ZG05S1gra2ZSaVl6bEFvelBCWElMSUVQaWtjK2x4MVhTbEc3am04N093QXpZ?=
 =?utf-8?B?YWtIem9CNHBBZTc2OVNnUzZIT3ZTa0VxTmRZK0JKVjNZNGJvWmhDa2F6cVNR?=
 =?utf-8?B?b0Y4eWNLMHVMTkU0R1UvY3FORnA3ZHd1YWhTekxxaDJqTDlNUlJ6MC9Wc1hj?=
 =?utf-8?B?blMrOFZmNzkzZ2dxL0Jkd0ZGc3pDTDR0aHFoY01SeFFqU1EwRzFzVnAxVG9Y?=
 =?utf-8?B?dTlJZGt5RVFySm5PUU9wQ1dCNXBlamZ6akJaMlJNWTl1QXhrMllBdEhwaytL?=
 =?utf-8?B?eUU1a29sVHN6RE0wS2ZNRDRubi9veGRHbTZvTDlQTXV6d2JWSHdvNWpwWXhr?=
 =?utf-8?B?czUveDU0M01SQ0ZQTDFvL2VERW05eVlIM05SWE9iZXhGd2xLSC9lN1krZWdJ?=
 =?utf-8?B?NDJaQ2MxbkUvSkxXbE1KOW1LRTgrTG1rVnI0a3grYUV5VHFtcCtWaWZIWlla?=
 =?utf-8?B?blhqU2dIVDU3K2t4V3dvODZwR25QVjdrTkM1VEFDbEI3d2tZMWpiUytWcUF1?=
 =?utf-8?B?TVRuOTBtVlVtUzZGTmYrNmFCTURmVG5iL3Q2c214bVUwa3NhSFhDREU5ckN0?=
 =?utf-8?Q?UZ6A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6778adf-0355-41c6-ebb8-08dc955a2733
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 21:02:41.6975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 12ULr9lQG/KzfdgYxqafZlfMnz00bXIeaEse9fADSiQKEUuWhQ6NcPWZoJlptWRi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gApkrWrr3kZpaCgh7wONGR+OstnCiATe/3NRyx4QIX0=;
 b=U5RASgefvYEnrxLYikR/f3GUH/XkTULTgr/errHfXGk7MakFauF2JO3W7oAP5l0MwYerrtoYVG12qXKNkG1aEXiVAP3JzwKl5plBM2+Ok9Y59sHh7N9GTuOHkmfkzfHiX8/w64gbvEmQGpiSCySMu+5q90gGjDTWqnVmB1nHIbE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=U5RASgef
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] boot/xilinx-prebuilt: support custom boards
 using XSA
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> The xilinx-prebuilt package only supports development boards that Xilinx
> has published firmware for. Custom designs based on the Xilinx platform
> must generate their own firmware using the Vitis software suite.

> Vitis produces an XSA file, which is a Zip file containing all the
> firmware needed by xilinx-prebuilt. We extend xilinx-prebuilt to
> download custom XSA files and extract their contents.

Thank you for adding this support.

I apologize for not catching this earlier, but isn't it Vivado and not Vitis
which generates the XSA file?  Just like the xilinx-prebuilt package will now
do, Vitis only consumes an XSA file that is generated by Vivado.

Would you mind correcting this in your comments?

Other than this, I like adding this support to the package.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>

[--- SNIP ---]

> +config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
> +	bool "download a prebuilt Versal XSA"
> +	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
> +	help
> +	  The Xilinx Support Archive (XSA) provides custom Xilinx
> +	  firmware files generated by the Xilinx Vitis software
> +	  platform.

generated by the Xilinx Vivado software platform.

[--- SNIP ---]

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
