Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2373C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 15:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8FA88417E;
	Fri,  9 Aug 2024 15:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhhTJ3pLo_d8; Fri,  9 Aug 2024 15:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A844784182
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A844784182;
	Fri,  9 Aug 2024 15:11:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAD591BF5DF
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A67E38131E
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHWm55L8ffJH for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 15:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::600;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 100B681306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 100B681306
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 100B681306
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 15:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvRkdI9IT9HVgr5HMlLlVvuLmCJ5MiSsU0Qzu1cF41YkmAX3yOkDE3JwMQXg18ZBFotEiuVHDup+7sxe0SKOODZx3Jjasqp22c/+0pIJL2ka1LM93EKHy4mC8pYjmC831kNr0ifU/OB06CNHs7DZn7u347jGU+xe5/Og0MbosvShNO4LizuLDCVxTzUBuIYKGX9UbwDC3WOvqU3dKNydNNrawRdy2Ajlm95On3frhFxfW6REZ2x/PjJsR1cZUYzeuuG0NErHASxlhDEQ6wNjNks0Yia2nLyrqf86RWYhyZcsZHVvInHX6mKrBFPfUEBUe6DeJD2kAvKaY3dcr21C3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUwmXRfFp2P23g2bJO4kh0jGjPw+sg7GWgT+LsqN4GA=;
 b=W2u6c5P1LxDBP8xkZTagBiokQ3eOX/Fd+p3qPUNE2tkxhTmDeWUc5UNUcLnaQs3Do4apzEpyS03gpOBDyPbxJybJ23iaoVzwFZumyIj/+jKWd+JYkWIfbvJPR9DjcXAq5bgKGl4D2hNRmE89+s5Q4c9YmsF16DTQ9eFozxQMV3M4TBaSX7VOmip/k+id410u+YeOehlgvQPJ6Gz+JzxM5Nx7gY50XsC2XG3Duz6mbx7GVoXCd0l7Wn2/AMxB4gyL9yGdzXl12lrtR1GTkbsu8ou8ckI2CnN6pf5Z9K/e9isE7SXxJdPQuN6m3dRwZjdhjx6bF8R/vipSBq1I6Lnabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ2PR12MB8831.namprd12.prod.outlook.com (2603:10b6:a03:4d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Fri, 9 Aug
 2024 15:11:22 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 15:11:22 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig: add
 ddr comment
Thread-Index: AQHa6iHl0BS23OGBWk6B0MswtfDJrrIfB2uAgAAAwGA=
Date: Fri, 9 Aug 2024 15:11:22 +0000
Message-ID: <CH2PR12MB50045C28B8F29ACBC0BEA9B3F0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240809060336.3326177-1-neal.frager@amd.com>
 <D3BH3UVZ3BVB.29L1DI6KRZ1JU@collins.com>
In-Reply-To: <D3BH3UVZ3BVB.29L1DI6KRZ1JU@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ2PR12MB8831:EE_
x-ms-office365-filtering-correlation-id: 46509138-056d-4f4f-d791-08dcb88587c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?VUYreGxMbFVxaXAwS1pOWjNXYUFla3lqMS9CaTBiVGxNWWtlUVcwbFdmeDE4?=
 =?utf-8?B?elh4alBZR0NMU0NtK1czdmdrUVpkQVBjeGhpRWFscTU2YW1UUEV0ajEydXdw?=
 =?utf-8?B?ZGgwaFIvOWNqTXg1ZXNLVkNwU3BTT0gyZ3ZWY2lPcEsvQXI5QUt2M2xKbm5X?=
 =?utf-8?B?Y0s1aGZNYlhDWTZqYzBKNVZHTDRmWUl1UUhMT3k3bVdKVVV6T3BzUk1qbTdK?=
 =?utf-8?B?emVFdnZvcUJFaGF5OXpjQks5SERLYmtKZkFZY3l5WS9wdmVITTU1TzhMRm5G?=
 =?utf-8?B?QlJTazdnSkZmckV5ZUR3TWNEeCs5VzlGTUN2OTY5WHYzU1l2eFdmY01vUkVS?=
 =?utf-8?B?TStCMHN2cjh4RkFWN3A0dUNWNTFka2hmdnM0OXlMY3M1MmlUc3NNUUs4Z09G?=
 =?utf-8?B?M0UxRHh6ZlYvak5ZUGVrWkg5YU9lZmVwNHMzSE40SVpNQVQvR2FMWWc1bEZJ?=
 =?utf-8?B?NW1zM2h4UUJmRDl6UGJIdkJLUm5zYVJ5bUxCMHlKNjNyV2dIVVpXamhJZ0JI?=
 =?utf-8?B?WG1iMTE4cU1NUXNOMDdaMG1DR0JJVjQ4b2ZMTVZqdWYxcTFXRjBaajd6OHhK?=
 =?utf-8?B?V0ZvQklzQWtYeW9kRy9lV24rUUgrbVE1UzJ3c1N5M09YOVFKTXhwVUhQYVVq?=
 =?utf-8?B?OW0raU5QN2V4ZXA4cnFBYXlXSFp5NHNVUFN4dmxxdDNhOVh5MkNDL1pkcEFN?=
 =?utf-8?B?TTlIajBIRnh2aWlPN1BQWHlwcDlUZjdEZjl0cWlDcDdqMnNDNEorcUhyRS8z?=
 =?utf-8?B?SmExV2tucVBmNjZodGk2NlJLMFJ5bFhsd25mMk9hR3FPODRKL2ZQRzgzcFZE?=
 =?utf-8?B?aVRGUXd0Z242bXJ0T2hiSGw4RnVKV2N5ZTd4QXZnSks2Ymd1U1VTQlJLWWZy?=
 =?utf-8?B?ZGJxbnY2YjZtVlZ0S2VNaUJ4bytVUlU5VG9QZWlUVHQrVm10eVdpYlJtV3Jy?=
 =?utf-8?B?THgvNVVib3lYOEJyQjl3VHk4V053RXl2V3dtbUxHZThleTdENVJZUXcyc1F2?=
 =?utf-8?B?clgxY2tzcE1hQVk5b2V6RzcrNjBLbjlBQ1JzV3BvcEVVTjVaV29PR1VXNDMv?=
 =?utf-8?B?M1R4U1d4aHA1aGsyUGp4VVBjNHRmcnUzdTBEYnEvUW5vN3VhZGNaMzNiZGQz?=
 =?utf-8?B?RzIyOXdvbHJ6eTMzSllVNFhiNjVpcWxOVlZodUNGNUF4WUxUQTNPR0hhM2Qr?=
 =?utf-8?B?cmo4NzFrdGhHbnh6YXhrVStJTzhsbVVaU0FqWHBpQlAwUHZmQy9kcjB0cm5p?=
 =?utf-8?B?SnlHdzJDN1BPbFJLUWM2dHFZTERFNVlhUHNZbzVjZHA3U3Q3UEc0Qk8vS1B6?=
 =?utf-8?B?dHppWTlJemFvZUE4YjR1SENIelVCbHN1QVFJT2kxamtrckVWbktvdUZJclpl?=
 =?utf-8?B?WGd6REc0OU56TEFVRlUvbmhaemxWdjk0MnpMMkhPZTIySDZnWG41TlNIUUkw?=
 =?utf-8?B?VzdmaWY3ZkhwWlRpQ095bDVvRWQwQUhUdEtUMHhWN1hFK1lKV3VGM2dQTkxZ?=
 =?utf-8?B?NklNRlE0MmhXUm0vNE0vNHc0YXY4OWQvakM5TUVyZWl2NllsbEk5Q1VaSmNO?=
 =?utf-8?B?THpqd2RGVCszVUh5cUR4Um1UclljdnYwbFR3RDUrZGNuMEwzTW8yRm5kZWdH?=
 =?utf-8?B?VnRybzR6ZkZRaytCcVJ0ZDQ2am5QaThJakF5TkI0dElubGdJZTBrUHhVK2ps?=
 =?utf-8?B?a0l1Z3hvcmtCQ2YrWXJ3TEJ3ZnplSXdOUHdKM1QrZFJrMjFSNkZQazdpb3RZ?=
 =?utf-8?B?Rk53aExjMGJuZWJFNWZGYTFhWlpIR0RrWTR3UFo3Qm01N1BVQlJOaHpQU1Mv?=
 =?utf-8?B?UU40T1N3WDhxbDJ2cE5CQmRENnlhdUpyRGFtcU1OZlg2dUNEOVVnYTNUUDkz?=
 =?utf-8?B?M1RCb1NGUWJpbzhRWUg4eG5sdVNocUNXWmtoZWg2YVEwL0E1MmxtMjBzWEhI?=
 =?utf-8?Q?DJrj0VVj5j+h4IFgvGFzcZIRgDcdtazF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXpzWVp5NE5qY0pnOEhDVnBDNnpiRDUwR3VuMmZ4aG80OE8ySnRJMnB0T0l3?=
 =?utf-8?B?V0Z6ZEFlL0EzaGVRVGcwcmFubGF4Y1lPeGJCd29aNHFLUVZObHdPSENyTnZs?=
 =?utf-8?B?RXJ2ZE9ZWUUwWlVkcUlOdEFiVEsrd0NrVVVVMHRzSWh2T1dya2J3cGdPMUwz?=
 =?utf-8?B?cGg1MklQMUVRWWxJSEN3Y0p0eHZEUzNERTVGQmpHVFZjYXhWbEx2WVNra1FX?=
 =?utf-8?B?ZWdDTys2aUZQRndYSVR3UHRqcGpNSlBGUkZZd3FCYkVUUHgxcXBaR1VsUXlz?=
 =?utf-8?B?RDVTcFB5V01mTlEzaVpJdko0ekx3UlAxcUFxTzd4bllLeW1wZEtLNmhSMHcx?=
 =?utf-8?B?RUdMaGtyZkxIa0ZBcHplTDMwVW1iSGdmcHVXeE9ad0FRanFjMkNWZVhjSmRp?=
 =?utf-8?B?Wm5CajdZOUxzNHNGRnlxbTkrbXhkOXppZzlqV0Q0T1V3K0FCNWFXTExSNmFk?=
 =?utf-8?B?dDYzSS9hS01PdDdHRGxqWXkvVDhKcGIwQkJGd1BFYmhsdjNmMy9iWC9ZRnJW?=
 =?utf-8?B?L1dzc3MzRnRzWnFwdkxiKzFkL2k5WE5PSzFtcm1RNFlsL3R0NWxvK0toTWFS?=
 =?utf-8?B?am1kSG9Yd0JPdkhpL2FDMnprSkN2emZTd29vM25ZYnh0MzcyWWp3Q2ZlRzFy?=
 =?utf-8?B?N09XczdYTlBzeDN5RmJOa21RdzA1Yk5nUU9BSzNXNllFa05JbENNWFJPRkJq?=
 =?utf-8?B?bURZa1RodWdRQVhLaEFKZS9aWCticXg4dUN3aGFPTE5kMUVsSkhFOGdXMCtw?=
 =?utf-8?B?dU94cmg1Ym9wY0RxM3JZdnBvMTlDbVIvV1pFSVdIODNGV0M3c1FnSWxIeHph?=
 =?utf-8?B?alUrUTZLc2o2RUlPempRRDg3Y3VoOGFUTG51WWZrSEh4cGJUaFN5dUdIbTVF?=
 =?utf-8?B?N0FaMkZ1UW45b0Q4NDVCTkJLQWRnTjloMWgyby9MbzY0cktsOExnbzZvSmtk?=
 =?utf-8?B?OG9MSEt3TkVLSjlUQzNlcm5oQUo2emh3RERQUzcvQzlXMmhpU3AzcnNGV1I1?=
 =?utf-8?B?NjdlTjBKcTZFZEYvSmFtV1ltbTBSWkpUVEo5cHcvaEpkZW12TytPRFNXUjE0?=
 =?utf-8?B?dzJ0em5JM2d0ek5CNU81VS92ZkczeWdoa1F1STVMejRqSXNzRUp3UzhLeUoz?=
 =?utf-8?B?UVFnaStWQVEwRkxSZWxGblJTQ01zOXZjZi9pV25semdhMUVBNnBIeGt4aGhr?=
 =?utf-8?B?K2cyQnN5aVphZ21FcVgwdmpSU01HYlY1RFRleWplY1hKVjEyU3ZuZ3BIUm4x?=
 =?utf-8?B?clcycks2OEVjcGlTRWtZTWQ1S0cyblNoSmRELzIxRmtCV016U21sM2tnS0gy?=
 =?utf-8?B?a0VkdEorME9mblV4VndQazdmb0FJcXZ1UDdHclZzSFV5SDNvZFNJZHBxY3cv?=
 =?utf-8?B?MTB0eU04UGFwL25ockpMSld1QUE2VVZQT1NkZGlmdkdBakhPUStyN3hnU3V2?=
 =?utf-8?B?NVI0dEN4TjJuTWNGbGV1Wmp0SzNDTzM4S2xwVnd2MzZtc3dnUUc5UUZCbVll?=
 =?utf-8?B?ZmcxU2pZZXlBUDEvbEdrRGtWc3EyazFPbVdCVnAwb0dBdkhJQ2xTb2hybE1n?=
 =?utf-8?B?TG5sM0Y0RFlnNXdrWVJJbU0yU1RWUWlMZk5mMHFWbVFjaTE0amdEWS9FRkNP?=
 =?utf-8?B?OUMreGp5S0YwUHUzM1U0UkxaejZnN09LWERmdXJWYUZ3bDlha0o0SUVHUEFo?=
 =?utf-8?B?VDhVaURTUlJvRGNhMXBrTjdKTldjVDJQMnM5WmFZekJjeHJ4S2NkQXhSYUF2?=
 =?utf-8?B?TDBYUEZGTk5uK3F3MDY2bjZoY2c4NWs0NXRzS1ZIODJBbzQ5QTJyZ2xQNlZP?=
 =?utf-8?B?NzNnM2NrM25qTHFidzlmMXhQemxUV1QxNGVIU0lyT3BFWDlXUG9vYnFKbFdz?=
 =?utf-8?B?aFRCQzdlWi8zbUMxdzc4eUtlQ01UM1A2SUduTmx3TWEvbGcxWTZpSkVQRXV5?=
 =?utf-8?B?bUtyM1dSY0d6Y21BbytiVHVwcEltMlU0dk12VzBMZGN5OHhoeitscFJlVm5q?=
 =?utf-8?B?M1dTV2R3NDUyLzFiek9qUzVNSTJxS3NVSUVxVHF1bFlJOTdWVkV0SFVKZjNW?=
 =?utf-8?B?OTZkUmVQUDBqMVYvUXhjRGxZR2YrMmsvRVlhcGFXZkRoNUhtRWNWVldhVSt0?=
 =?utf-8?Q?pjuE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46509138-056d-4f4f-d791-08dcb88587c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 15:11:22.7419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eulZz65K675Kj5UecsBBvVeH1YcL3BN/mEoafGYwkS6uRGLNp3cl9i28JEcFFJ9z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8831
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUwmXRfFp2P23g2bJO4kh0jGjPw+sg7GWgT+LsqN4GA=;
 b=l0Ax1uWPdLfY6MuUli98bmAVaZ+tTcc8ADF3iAtVhXXsHIfjGfTJR5pkw2/YmagXUZHPkAZL+IJKlwpEjKA8XjNWHrUDmY2d7T9zhvXer5wnqkB9myt0HtPZbHXlFtv21zIbDVE+JftT82qoCrj+XW/3qZujVMIzKqR2JWD6HYU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=l0Ax1uWP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig: add
 ddr comment
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> Add a comment to the zynqmp_zcu106_defconfig alerting users that the newer
> version of the board has a different ddr memory requiring a different
> psu_init_gpl.c file in u-boot.
>
> Users with zcu106 boards with the updated ddr memory need to use the following
> config:
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
>
> The issue is documented here:
> https://support.xilinx.com/s/article/71961?language=en_US
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/zynqmp_zcu106_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index c10ec70ed8..6491f49d71 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -23,6 +23,12 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
> +# The original DDR memory that was used with the zcu106 revA is obsolete.
> +# Newer boards with the replacement DDR memory need to use the following
> +# u-boot device tree:
> +# BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
> +# For more information:
> +# https://support.xilinx.com/s/article/71961?language=en_US

> There is a board/zynqmp/readme.txt that has build instructions. It would
> be helpful to call out the zcu102 and zcu106 variants there.

Good point!  I agree that the readme.txt file is a better location.

>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
