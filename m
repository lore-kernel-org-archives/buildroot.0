Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAC8C0219E
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF2140D87;
	Mon, 17 Feb 2025 11:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ECnAo4D75Qz; Mon, 17 Feb 2025 11:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48B7F40709
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48B7F40709;
	Mon, 17 Feb 2025 11:14:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0775C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9451D406C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-UZKOLttuxi for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::631;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 774B640709
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774B640709
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 774B640709
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9otWR8Od0Ot8S7pLvDo/ETKeWsELQPe60GKoW70KfVt31zhoIVuDq/4Ef59tKGSODTWDEfkeAtBReo4sDCLOXlKOhf9TVcNUNKWis+LSXtA3Z1FbCrGObA7ku49yytD6nkbe25mg+nllfkvjEtd9GYt1NiV9VIGNu0KmgvjHNVSzpkvqSkk46KoMPX2eEMFCZt1p48q7jIcI8JuWsYvT8uLNjt45J4kCOUrUCvaqTgelCttKM82o/9mHXrB5kxyyZWGh0X3RLKdNTu0KQ36aYEZ7f+t9tEL3CvcyPjTCG8AfqSqU/JX8dFA08Ee53zSkU2n9O1EOMuPMZtZMcXrCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXVWhT89BvvSN0szVi+/29d5zUFSGnMFFA/1ULrsogw=;
 b=gxZj8JAnTtyNmfRg8WAdhQlUJVgdDogeT/YJ3zzUHSi7v8bKpoX1qPzyppVY02qnVFbeZWVbnzQRLlnRjeDej1RIw049uI/un223Kh8kCWW9B0lF8+f4A62yZXuPYyI00WSElygXDFTBT21Z9SrUDCjbaY1StbztoYduDvGQgI5xMvVT7bqR0iLyyBESmOa0C94oKopH9K1vE1EV3eg/LKWwx6y9AzGbOjzlk7vf0iDXxloh7335nohkfu527UDUcfkKirPIMHsj+vF9xYd6pk+1b6xemEaC9qJcOPkFnnpSUirL+UrCrbOfKEGDH2Sg/r6e7Bxkzl/6DKaHdzB9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH7PR12MB6609.namprd12.prod.outlook.com (2603:10b6:510:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 17 Feb
 2025 11:14:34 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 11:14:34 +0000
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
Thread-Index: AQHbf6kyWn7uMT21M0acf/GM+lz6bLNJ5qaAgABOhdCAAQXlAIAAHcQg
Date: Mon, 17 Feb 2025 11:14:34 +0000
Message-ID: <SA1PR12MB561507917041F98A96EC4044F0FB2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
 <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
 <SA1PR12MB5615121EEE77BC29889A29D8F0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
 <8e84d75f-32f7-4095-80f9-0c1279d3ab10@mind.be>
In-Reply-To: <8e84d75f-32f7-4095-80f9-0c1279d3ab10@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH7PR12MB6609:EE_
x-ms-office365-filtering-correlation-id: 52052ed2-57e8-40b8-0274-08dd4f44420b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?Q1hvR2R0dXowYUtRRmNIUmdzdVRZNWdKbSs0emVYajRzeTQwSTJ6UVdtd0ht?=
 =?utf-8?B?cExqQW4zS2phNk5ia2llcy9RUzhJc2RpK2FTckU1MWNtcmVhMWhOYjZVSHAz?=
 =?utf-8?B?QlhPOTBkNlE4eENHaFNMbHNhZUtRTm03ZEJEOUllS1VyaW5HYkFmWmpySG9W?=
 =?utf-8?B?bTJiWDlmWWdaQUJOMkJ2dS9DRjlTNDczVXRBLzFMNWcwWWVEYjNnWjloK0J2?=
 =?utf-8?B?MzJ1VnUxRzhUZ1dKckVVS0FJWHREMlQ1aVRxUUo1azFTb0lhSFUxaUJ3TDJp?=
 =?utf-8?B?L3dDR0QyaGZ6VklNbTJDakFHYk1YSGIvN2xpdTBseS9ZeEx1U28yeU5HV0RO?=
 =?utf-8?B?eTIxUWVESlpMOXh3SzZlRVFYWnk5d2ZaYjFYZC9qM2xIcDdRMzBvR2JhMVB6?=
 =?utf-8?B?a0ZDbHVjV1c1SmpxRE4zb3paNW1CRUd3T3FvVkpENTJCSjcwMEI2MlRWWXo5?=
 =?utf-8?B?dzNzZ1BjejA4bFVMQTNsT1h4UzlBTHZQMnVZNjVsN2RqcVVzRkN1NGU4VEJB?=
 =?utf-8?B?SlF6MUg5UkJKZFg2UzlMaXl3dkJLNFJleHNCa3dHTzRvVXVyaTR1eTU0Y1Vh?=
 =?utf-8?B?aTc5SU82elR1d2tXNmlxdE94SDdYUVA0V0pub2FMN0dWWGxBNWFNNDJtUGpD?=
 =?utf-8?B?Tm50UUhKL3p2cnFmb0J0UkpwSzR3S2pEV3lPM3Zma3VldS9zQTlNWDVXUDdr?=
 =?utf-8?B?MmovWUhUenMyUUdiTnhRK05RenU1NjlRR0V6WFViK3RFWkp3VWxoNVRvU08x?=
 =?utf-8?B?M3hEd0hBNHlQS05udjB6UFc0R3E2ZjU0ci9LQys1U1c5VlJ1OVpETG5PSi9x?=
 =?utf-8?B?RkdUdmFtalBPeU1uYmtpcFB0QjVGRUVwa2JCWnhNakhHQUduZ2tjNldVdmd1?=
 =?utf-8?B?bEhNcjNmeWl0OWpoRFpLTHRycDFkY2paWUdOY2w1am9JS0tXdmFSQWpyenND?=
 =?utf-8?B?ZENZdDhORmd4REJYS0xRcHVBR05uWDJjekdYQTVJamI5R1c2ZnRiU3V2SEJP?=
 =?utf-8?B?b1ZoQzROdXVaNTJ2VUxwaHlrV1FNcGNIbW12cWtJaVAvekVZcG9hd05UaTgv?=
 =?utf-8?B?MGxkeDErTWhORWpmRGVKZjhla2VXMmo5TkprNGtSeG8vNnZSVTNvRmluOUl4?=
 =?utf-8?B?WTMxZlUzbzhzL3ZrQ3Npdzh2eEJxTjlwd3dxcHgydnU1TVROWk9EVGFpMVNy?=
 =?utf-8?B?c3MvdFlSdjNMY3QwM20xOUc2ZkFEdWNORWVLampVQWxxSUNMTFVrNHU2Mnl3?=
 =?utf-8?B?LytoVDNWNU5mRDZ2aUU5dVR3YkM5ditEMUZ6VzJNcHdFTUw1eWlYQUczeXZW?=
 =?utf-8?B?UVFPaG10aEViZmlLdURqdGZreGovT2Fsd2FvZGZ5VGx4SnBsNTNFdVJjTi9O?=
 =?utf-8?B?QzBydEdHMDBHMUlhZnNGUjFZcVdpSlZPd28vZFRwSmljMEhNUTNTK01XQ2V1?=
 =?utf-8?B?Z1hGdDhQNVpoRkRWTUNZZzB4NTNUdXU4aDMyTWJLcEQzbng3MTlCWDhCTTJa?=
 =?utf-8?B?aHppWkplZ1RGakFaNE5sMGttaEJOaTNyMXlLQU5ldmp6QjZFQy84SDRxZUli?=
 =?utf-8?B?S2hITnZDNjdxU2lQRmRyTkhRcWpWczh4bmJUYVF6Y3VOS09VUjV1SmowNVNW?=
 =?utf-8?B?cXhyQWpJVDJCcjNZeXFEcXBWc29VWU4wdVluNmt6YXN1UHZ4YjhjaEplcHIw?=
 =?utf-8?B?dHNneGUrUloxUmMwdjk4RjZ6WXlsRi9ROXkwSldGOHQ2WnlBNmJpbE9HeHo2?=
 =?utf-8?B?WUx4eFNSL01mcHZEUVAzeGRxT3BvUkhyNVRTS1FGMEt4MVpMd0RCZTJTU3BG?=
 =?utf-8?B?L1lKZmtWZFVSOUhrMkhtVzZNaXNmWno3SFFqQlFXU3VZOHpLUGYzSWhzbS9W?=
 =?utf-8?B?K1lxZzdQYVJrMmNoam9nalpwd2FFS2dNUlBEZUdjSnhrVnl3Rjc1YUhlci9Q?=
 =?utf-8?B?dUw5MzQ0cWl3Z21pMk1LSktxaTNjSmhLYkYwL2VqbWxIYjc3L1VGVUYzYzdw?=
 =?utf-8?B?N1RCOURHcjNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bE56T0FLTUJCRWVFQm90NWYyYUtMWCtGTEkwUTZWVlVXNHNxL3N6UXVNNWlC?=
 =?utf-8?B?OVFUU1JkZFJkV2FlbmhBdE41ckJHb0RmamVTeTJqcTV2QUFqaTl4L096VXZt?=
 =?utf-8?B?Wml6Z2NkY3RqaWZpSEo5dkc0VXdrMGtPK1Y3VHQwTmN5TElydmF2R2NUL09F?=
 =?utf-8?B?dHhld0V3cWhpRElyQWdEaTcvQldRS3hqenZzZzQvN3o2KzlzbHcxNWRRdjd6?=
 =?utf-8?B?a0tSaWdsMlJDc3VMWElPdWNITkNOOUdkVE01Ky9pSGFJajFhUzBVMkJnTlpw?=
 =?utf-8?B?eGd1cFllSG9pbDd4OExCdGxiWm4yeWRPVzlveitlS1B2Si91MmJXYW1tOEl2?=
 =?utf-8?B?Z1V1K3pLalhDU3dwa1dFUWd3dzRWcER5dlppOGlEdUNXUlE5U09aeDJhVldU?=
 =?utf-8?B?WGJYdEVlRmpUbXJ6TWwydkorN1ErRWF2bDV1YXpFV2RVRkU1K3djdVU4d0pK?=
 =?utf-8?B?eThmbm5HWEt2WldPWDdlL0xKYUNEK3orL0w1d2dicjVlV2pXNmlhZXp6ZGVJ?=
 =?utf-8?B?WUlNdmxRMDlKMGVyeDk0aEhvOTN0M3VBUDJIT2lzbm4xWExoeWpaMFE4aTF0?=
 =?utf-8?B?MDZuK0RURU1uWTVBOWJ5VDh4c2Jla2s2WlR2MmhaWDFaN2pRbEVrUmYzWERr?=
 =?utf-8?B?K21QWVRjalJMRHJVRnFHRU13cnQvdjZTMlhGK2ZFa0lVSDg5Q2ZEbVVCMVFa?=
 =?utf-8?B?ZWJoR3hmTVpjUWtUUElPWUJ0WnVDdExYY05LcmR3a2N2aFh1R2w0SDh4L3My?=
 =?utf-8?B?T2x0ZzRER2JadHh2Rm5GQnRtZmFJNmsydkdFZzM4MzNpcDkvRnBFZTc1NXF0?=
 =?utf-8?B?cDZGMTh5UVpJR1JGL2Njckc1djZhWFM2U1haeTdZTENQTVowclNlK0hmNFpZ?=
 =?utf-8?B?elJtTTROQnNlNVpkWDlSVUl0VlJuMmlVWVZ0WnVZdDhIWWw0Q2dQek5IcHI3?=
 =?utf-8?B?RjFtclR1aWxWaUw5QmQ1Y1BSYlNZNU93d2JNUmtyNDJtSGVDcjdvNThrM1pw?=
 =?utf-8?B?MmhSdUN1NnFBR3VZbFpWWS9mU3ZMYUtVSWJ6aGY2UkIyc24vNEQ4em9vTkFO?=
 =?utf-8?B?M3d1ZFdOdUlIUSsybXlvUzBlbXd5TmR0M0l2aVNWYXlVa01EZ2hHWUxjV0pS?=
 =?utf-8?B?N0RoV1p2aFF6YStWdERsaG9QM2x1ZUV3bURRbGhkRzBkYUw4UnQzZnB1Tzh4?=
 =?utf-8?B?SFRibXU2Rm5qZk9LZk03SkwvY05WZmx6M3NvQ3BhS3kzZzNmd0hiZ1NnbXRa?=
 =?utf-8?B?Q3c1UHNTcnNyT1VqOUltWmJnb1Erd3ZycFZMbFZDUmxtZ2kxSUhpcTNrQk1N?=
 =?utf-8?B?N21YeVBTRThKM0dYSFJlTktHQUYwVWd3WXdXZGNZTjl2WmFRd2FBYXZEa1px?=
 =?utf-8?B?V1BGRGtlVHptMFNsR1hMVGdxTEc4aTRhaWtleS9oa0s0TjEwdnhkOXBNeDMw?=
 =?utf-8?B?MVJMOVNxajQ1c3o1WERuaFpHd3pLUHZvRXJZNWRnOE55MU8ydWpocllsR09x?=
 =?utf-8?B?eEgzODhTTi8vd1Z4cVF4VHZteDhoVk5zMFduVXlLNmx2M3J5NUZpRjV2N3FC?=
 =?utf-8?B?SlAyR2N0Zyt0TXlmdzNubHF5SDVvN25vL084VnJBc3RteTNiSWFmbWdOK00y?=
 =?utf-8?B?OGVHWFRVZTVTZ0pFWXZXMlh1YXZIOUR2S3VVTHlxUWkyRWdRWGtNNmljWkR5?=
 =?utf-8?B?dWdKcERBMlEzVzJiVXUzRUlVb2s4KzZnbEt3VWlqc3VXalNDUGdXWE1RYloy?=
 =?utf-8?B?V01Fck5LeVlyeWIxMEtxNm9MUkpCbmdOZjVQOXREcnNxYnVPRjY4SWVVb2Ri?=
 =?utf-8?B?ckZLdW5IUUdLWGVZS1ZsZmJnNldlR2FBb3JxZURjcWdFcWhCSlZRVm1uU25U?=
 =?utf-8?B?TmVKam1aT0JCbDE5VWQ2dFpWTnJRZklCMWtOMmVwZHl0OEFYdWxMTkhIVFox?=
 =?utf-8?B?VUhyVUFvT3hSSHRDNENqWTl0YjJtVHkvaWJXM1ZKMTRXZXl2TGxHNnN4Zys1?=
 =?utf-8?B?VTlpYVRDTHZhWU4wUHlWUDN5YjNmaVVkaFRwcnF4M0FNS3ZDaHpZRSsyUEE3?=
 =?utf-8?B?UXZBbGlHZWdRRG1tajRoN1V0MmlmUkEzMjBteDEwMzlrZmx2Q3Z4L2F3a2Q0?=
 =?utf-8?Q?CXhw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52052ed2-57e8-40b8-0274-08dd4f44420b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 11:14:34.0585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpDUrvE2/x+xJWONuBrQGfrdmKEJT1xFGeu8AIv0labpKe4GPFb8gUWqkgJHx+aN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6609
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXVWhT89BvvSN0szVi+/29d5zUFSGnMFFA/1ULrsogw=;
 b=fQH8UwP+V3XDLuSPnWiKK6JjTWVG4cU7CNGUKxdtngtFwql9mfLYzHS66VOgjw0D5C1ex2CrGnKbS1V1819kbyiAeg2mor9g06sM5vylMC6I6kZPra51uEeZqMn8uqdkXBCc1RWxwTPNDkh+RjRzQ7E8VUOrtFFT8kH3Rbseus0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fQH8UwP+
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

> [snip]
>> - $(if $($(PKG)_OVERRIDE_SRCDIR),,...) is dropped
> 
> Not sure it makes sense to do this if check when we are in the package in
> question.  The infrastructure needs to check whether the SRCDIR is
> overwritten for each package, but since we are in the package, we know
> SRCDIR has not been changed.  So I will keep it out.

>  _OVERRIDE_SRCDIR is something you set in local.mk, typically in order to try 
> out a patch before you commit it to a Buildroot patch (or to GLOBAL_PATCH_DIR if 
> you're in an external). So you do actually still need that in order to stay 
> consistent.

Ok.  I will add it.

>> - $(QUIET) is dropped
> 
> $(QUIET) seems to be empty.  Not sure what it is for, so not sure why
> we should add it.

>  QUIET is set to -q if Buildroot is started with `make -s`. It makes configure 
> suppress almost all output.

> $ make printvars VARS=QUIET
> QUIET=
> $ make -s printvars VARS=QUIET
> QUIET=-q

Ok.  I will add $(QUIET) as well.

> [snip]
>>   I think we have two possibilities here: either we use the stuff from
>> autotools-package _exactly_ and just add to it (perhaps even keeping
>> HOST_BINUTILS_BARE_METAL_CONF_OPTS as a variable) or we adapt the entire thing
>> to precisely what is needed and useful for host-binutils-baremetal (so dropping
>> all the useless options). Either option works for me.
> 
>>   In the first case, we could even rewrite the autotools infra so all the common
>> stuff gets put in variables HOST_CONF_ENV and HOST_CONF_OPTS.
> 
> I am going with the second option now as it is the easiest to implement and
> a lot of the configs in autotools do not apply to binutils or gcc.

>  Make sure to explain in the commit message why they can be 
>removed/rewritten/whatever. It may make sense to do that in a separate patch, 
> i.e. first copy it as is and in a second patch remove the redundant ones. 
> Although in this case it is not really necessary - it only helps with the review 
> and at this point we can trust that you looked at all the configure arguments.

>   Also make sure that the commit message explains the two options and why this 
> one is selected (basically what you wrote in this thread two mails before).

>  Regards,
>  Arnout

If it is ok with you, I would prefer to squash the changes for each package to
a single commit with a clear commit message explaining the changes in detail.

On top of this, as I have been going through my due diligence will all the
config options, I noticed some duplication.

CFLAGS and LDFLAGS are already defined as part of HOST_CONFIGURE_OPTS.
Is this always the case?  And are they always the same path definitions?

From what I am seeing, I believe we can do the following with the autotools
infrastructure.

pkg-autotools.mk:

define $(2)_CONFIGURE_CMDS
	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
	$$(HOST_CONFIGURE_OPTS) \
-	CFLAGS="$$(HOST_CFLAGS)" \
-	LDFLAGS="$$(HOST_LDFLAGS)" \
	$$($$(PKG)_CONF_ENV) \
	CONFIG_SITE=/dev/null \
	./configure \

Could you verify this?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
