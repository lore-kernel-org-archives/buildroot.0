Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E15C5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 09:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E19080B56;
	Thu, 20 Aug 2026 09:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZTlYOlxw3lf; Thu, 20 Aug 2026 09:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787217092;
	bh=rH7tCIWXKSlj1t/dZ38QPuyc5RwOz1xsRMb+miq6UW0=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=TKVzWP4mKCUiSCEwPFNMCj48D7Bdo4zAZegGnBK+bKZgup69xwgNuQ8d+nN8e8IGU
	 uZWeNelhcUY7wXNwcWm9ZmtDDXV62r7jLTwn/kH40/ZJaBXZ32vm4Cgrsj2/XBC1DX
	 WEnmvKMgkCiB5u+NRGllHdg2UK/xKJ80Wzl2dqDUEGE8yunCLNBmNiPam0ASt5Uu/j
	 YuSiYcDe8erSM3sEmowQk7xU9YEHWHGou//k8tSVjErFJQs7Ly3qw9ckjQbZV030x1
	 L4V9JYoYYx3wSIOVRM1F5uAePpI68yYkrGZlfq0NQsjWnjbVx77Anl4DI8BNAoi8tN
	 Qd256eJCLOInQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B85780B78;
	Thu, 20 Aug 2026 09:11:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19EE5263
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 09:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F412540266
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 09:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5I64y57b5bCD for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 09:11:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=manikandan.m@microchip.com; receiver=<UNKNOWN> 
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B01B40249
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 09:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPXxK3vwKwVFfk7gWJt/6EOv/h7CQydNMhoz3cpUoMCHEJRFMom6bc5Pf+vSKasEPPAQxIJG4cG8uNR4ngnWCf7XgiRdTzAV7q32Hqad7nve7b36TkG/9AfarAoJOyLOZRhEOFKCFaUqFwTIHAxiYCG7suMWP6LmbnRH+s/NFm76DMAFsX0brClJNaezVXOU3vOYHoEYxDppXqK7ZKjDEnvCCFl7Cl99b5+iEKa0u0ySHZmMSPCr2Hu9MWg7rMfWSvaxqM1wpz2Q0CFs7Zy7sFfEugvCtHp1hJcZ3v0hYAI5bLqo//JQYFVCZxMKuzPfpp1TFeYQNmOk/4u1+wScAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaDcR0g8KqM1Ipv5oM+RdNn20CpcMbw5/DGxgyA/qp8=;
 b=XSHZt+5GYCFvCS/L5im/ZXMzK9vuBBWzQORagPCulJ0n2n0PfHQEuFOsp59eyaSB02SysM9CQReFBhUmoVMaK1EKYneqWVRVofUJt+nPd1Lf66uKYCfv9XFJcBgLqX+cTb9yvNyJhMdF0mam5nxIjazkX/KQ7DvUSCEvgLz4EeuAbWii8BM9Q3If8NyP7KD3S964GRCqNzLx8GyR+W26n8E3ji58/zJTII4/8gaWtdZEgIy5GR9UvpLlwUYxy4HCTWcf32BjRdGeJg8X4zHUn1cv6F4mtfcDBaG531PnK9TRso8kxvIOIR33naSfq/pLqVIbNq8OjG+rJy+95qzAVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19)
 by SAWPR11MB9759.namprd11.prod.outlook.com (2603:10b6:806:4c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 09:11:26 +0000
Received: from DM4PR11MB7350.namprd11.prod.outlook.com
 ([fe80::393b:3f8f:f327:ffc5]) by DM4PR11MB7350.namprd11.prod.outlook.com
 ([fe80::393b:3f8f:f327:ffc5%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 09:11:26 +0000
To: <buildroot@buildroot.org>
CC: <Nayabbasha.Sayed@microchip.com>, <Cristian.Birsan@microchip.com>,
 <Jamie.Gibbons@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>
Thread-Topic: dm-verity: Rebuilding the kernel/FIT after rootfs - Support in
 Buildroot
Thread-Index: AQHdMIPg0wKHF6LbIES1wKmT3XoNTA==
Date: Thu, 20 Aug 2026 09:11:26 +0000
Message-ID: <d87d0ad0-27c0-4f29-bbd8-8fc06421e537@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7350:EE_|SAWPR11MB9759:EE_
x-ms-office365-filtering-correlation-id: 7f3de145-0ba5-417f-0a95-08defe9b0368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|10067099003|11063799006|18002099003;
x-microsoft-antispam-message-info: N7u0BZybfX9wYl1PdVhFekMh7CHqo9HWGFVPoBMPbOVdJ2XKTLwVASKzqNPqXc9LEGxVj7lR9jUosFYgYAaUsqqz19OlDkSmBBHW7z/3QcMqYwllYSK27D9A9qKJZnXg7Lhk5g0cO5pWwMCLGqMLreMsAfa57rPTA+iCL3WUFz9mrN73Ot7q7jfSxP6UPmINUnbRffdZE45gdFJOwJvUu/1hNiIRPefROWsG5fRXEAoxa/yncAvdwBXpf9GM9XIDJi70sbOCMKWXrZeAM9mWqB0k4vJBtn6NQPBAmbkYHnDQZGsqChCT+p+GE8w77TWo3cWS2s1gCMnWQ1pCVOvnF9hDeBhseaC2CI4cI20cRAkafSRmgQWX44zMA4parYYQT3/2SZjiDrvWwZb0dtaDU2pWaf01U1CGW4Miyvr2Q1DgFkxRz/E2tAetKOnfOF2DK47U+BarYsYd7cwnwc9UzsZzff+LabHvpUmu0qbxVRorkYogNQ9X0Cv7gtbwr1jbo1yY9NakPb1SCc0fIFACz4SIVwLZoruJlnTPZFKs+B8c64rGt49ekg7x4th2q56gEuIkb3gWUEAlU87DxrdESwcf2c6kU7t9+xn4VrsDqM7TCm79xM2taSUN8fG4d0mWc2nMVskN1/QBCsPSuyceRA3/n1R9zhy/2DEucx3t69/bVSwd+NjWxe/ThZ4IZcOcjnRMVFXHwPQJkLZrR1e8Lx/Ob6+ReN80vAn/y6924a0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7350.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGFhdWNCTlFsa09QRTZwU1owSUJEdWRrVmRYNzNuN2IyOS8zOS9JblNBdE9X?=
 =?utf-8?B?cVhsbWllSzNQbjBFRjhIVzhMdWxmVno1ejVRRExUYzdvZnFidzQ2cWZPeDRz?=
 =?utf-8?B?SThKZitiUjdSeHlSd0grTFkrWERwS0pVR1ZZVERsN2ZlZ2IvT1NYczd0Y0U1?=
 =?utf-8?B?WURPeUJYUTF2MGFGRkNCOW5TR2dXWDlqcVZqbXIxblpRVzgrVWFsRWQrRkJN?=
 =?utf-8?B?YkpBM1hTRi9ZL3RVbWY2S1RvYlRrNGtDd1duN1lzZGhFZHhDS212Y3NMLzd1?=
 =?utf-8?B?ZWxPT1NaTXNzNzlKZEpqMktrTDIwZk1yNjdpOVp6KzRpNFd3ZlB1MUJWV2th?=
 =?utf-8?B?azFqdGFJOWJHQy96ZkY1N3ZBYUxmYVhxbmlVeFpYb3lCaGE4QkxGRysvZExK?=
 =?utf-8?B?ekJ2TGE5dHJHQWNVaXpwL2VJUjlNYjVaeFdZOEhqUnBsMTNweW1rbGIya0t3?=
 =?utf-8?B?b0V6T0d1VUpTR0tteWpGUWVWSzJVd09QU3ZhbWxEbGR4anAwMjJKWEt2dENm?=
 =?utf-8?B?S1BXTmxNdDcvaFdkblZUYTA2VU1MQXFSSFpUeEtxRGVYVno1L0tsaWtGWHNy?=
 =?utf-8?B?MzVpZnlhczNzNlNCbUNySFNZZUZudVk1SERlbzFxdEppY2xWNkxBWWZqRkl4?=
 =?utf-8?B?Q2NORXdpZDVBY0NsSmRnTkRSVVhjQWJWVDVIWTJnbTBRbXJLei9vMmNvbDFi?=
 =?utf-8?B?K040cGYwaTBXTDVWL1lIOFhNV2hhS2VtR0pNS1FrdFdXaHhHcGR5NStCVVFR?=
 =?utf-8?B?a2pUUEZ3VG91WFo4M2NKdGxxaCtzMnVjdWxGL1pkZWNtWitnZ2tYb2hWekFG?=
 =?utf-8?B?eUc5OWg3V2Zvb3NiZmc0TjhBRENRaWtlVzBySUgrUHhqOFgrOUQyaUhxRTV5?=
 =?utf-8?B?ejF4bGlOUm1yUlQ0Sm9mT1BGV3RZRXMwTXM0UlUwR2Znd09xVCs2M01KNnp3?=
 =?utf-8?B?QVJzQzN3NjhlRnBlR3B1Y3RBdmhaM1RxMEhFTE9xRWpBT1BJRDBmQVFZcFY1?=
 =?utf-8?B?NWhNc29uR2JIUGdEUGE0eHdIVmRoQ2M5a3paMGw4ekQ4QnBmcUpsKy8zajFQ?=
 =?utf-8?B?T0Y4cGJHeEY2NksyZkNGUTlrOXBJREZTK2tCeWNubkdxdTRPNHNNQ2FOd3o0?=
 =?utf-8?B?SlBYQzdSdU1CYmJPRzhRa2dKUlRGYWthY2NRbzJMRnVXcU5JVlpYWnVsejUr?=
 =?utf-8?B?M2RBSVlsck9pWUhacWtMb0lBUW5uM20wb1JwNWJrcEVhNWtxLzNYdHZBU2tM?=
 =?utf-8?B?T2FKdjNJSCtDVjRYR1U1TElkUUtHc1ZEdVBjem1GV0FHd0JscE1yemZBWTcz?=
 =?utf-8?B?SE1jenBkc2hIN3dNVDZQWThxcjdRQk9jd2hmN0w5NHVhSmhoV21qWnBoa2FI?=
 =?utf-8?B?L08wYm9Yc2pPS05WZG0ybW9IeHdoTW9FQ1FPZ3lNaHQ2bjhIVjJrelJGa0h6?=
 =?utf-8?B?N1hzNzVBQ1h0VUV0b09MbnNIQkNhL0hTaUhGbEJRZ2U1SnF6NGlxYTE3Z21r?=
 =?utf-8?B?MExUR3ZrTTFxald1dVo0OEpJWmltdC9DbU5rVGszM0paOTFWU0FBOFRvM2VU?=
 =?utf-8?B?aFFqNUdpaUpzaTYyWDJRQXAwcjZSbXYyMHFjb1k4S3FxZ1NleGpYWmVNZEd2?=
 =?utf-8?B?KzNUUHlmZ25lcWlmbHJ2V3pURTB2WFhTVGNKYS8yMlRNY0xMVTBMWURZNlVZ?=
 =?utf-8?B?bWR6RWk4U1k2S0htZUZuNFBvQm1KOGNycEt6dUpGU2JHNjVPQ3BRZWdBUlZM?=
 =?utf-8?B?SVZFS0gwSURzajdtREpYZ01aNlM1d01GMFZSRFBjaWQ2eWhhcWVnaDcrTkhw?=
 =?utf-8?B?ZWFKbDZWMGUrY1lXb0RrUjNtOUVjcTlielJpT0dwYkNVNDZMRC9iMGRjeG16?=
 =?utf-8?B?Y1o0dkhjckhISmJEYjBYUU56Rzc3My8yWm5xaFVEY1dWZldWZG9udVFLMDl2?=
 =?utf-8?B?RnczM014aVBaSWtxYnlNM1JwZEFNZllnczM4bGN1Yldsek5MSS9pWitidVVq?=
 =?utf-8?B?SGVIZ0VxaVFHYm9VaTR5VGYwWG1MeTNpb1EwdXVTelRGYVhwTXZRdkV5UXRV?=
 =?utf-8?B?NXV3ZkxWN1NaNUowZGltY1FCYm5yUFNmMnFzdmVxbnhqTmRnOCtCSlJQWVNV?=
 =?utf-8?B?N3dJN3AxZmRhOWxKZ3gySUJCdS9QVkVrUGFYSWZUV0w1RDdJSjlwZ0YxUWRk?=
 =?utf-8?B?cm0wUTZQcW9rRnphVFBaT3dWZmF6S1FqdWNYRWFLT0hVdnV0M3dUeG1JUlQ5?=
 =?utf-8?B?V0dKRXFxRnhGbmp1SFdPTGlhRDZlaU9mMzhwV1JrWXVYbEhxY2FRZzl0NjRO?=
 =?utf-8?B?bFZWVVB0Q2JjdGFTK0c3VW1NMHV1RkhDa1psWWZwNGJoN0MvRDVPdz09?=
Content-ID: <566E6ED2CDDB0743A6B7CEDF838D596D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7350.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3de145-0ba5-417f-0a95-08defe9b0368
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 09:11:26.3099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vpmy6iWwpRATah84bihQG4s/yFPe0Bdst0o90QG+m5Kbcne6RjuamfvZgO3S+4BapNEKFztS09y0kqolaLN4FZghNn9/rP7QA6M9ygjpjs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9759
Subject: [Buildroot] dm-verity: Rebuilding the kernel/FIT after rootfs -
 Support in Buildroot
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
From: Manikandan M via buildroot <buildroot@buildroot.org>
Reply-To: Manikandan.M@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sDQoNCldlIGFyZSBhZGRpbmcgdmVyaWZpZWQgYm9vdCAoZG0tdmVyaXR5KSB0byBhbiBB
Uk0gYm9hcmQgaW4gQnVpbGRyb290LCANCnVzaW5nIGEgZHJhY3V0IGluaXRyYW1mcyB0aGF0IG9w
ZW5zIHRoZSBkbS12ZXJpdHkgZGV2aWNlIGFuZCANCnN3aXRjaF9yb290cyB0byBhIHJlYWQtb25s
eSBzcXVhc2hmcy4gV2UgaGF2ZSBhIHdvcmtpbmcgcHJvb2Ygb2YgDQpjb25jZXB0LCBidXQgZ2V0
dGluZyB0aGVyZSByZXF1aXJlZCB3b3JraW5nIGFyb3VuZCBCdWlsZHJvb3QncyBidWlsZCANCm9y
ZGVyaW5nLCBhbmQgd2Ugd291bGQgbGlrZSB0aGUgbGlzdCdzL21haW50YWluZXJzJyB2aWV3IG9u
IHdoZXRoZXIgDQp0aGVyZSBpcyBhIGNsZWFuZXIsIHN1cHBvcnRlZCB3YXkgdG8gZXhwcmVzcyB0
aGlzLg0KDQpJbiBZb2N0byhiYXNlZCBvbiBteSB1bmRlcnN0YW5kaW5nKSwgdGhlIGZsb3cgZmFs
bHMgb3V0IHdpdGggZGVwZW5kZW5jeSANCmdyYXBoIChiaXRiYWtlIERBRyk6DQoNCiAgIDEuIEJ1
aWxkIHRoZSByb290IGZpbGVzeXN0ZW0gaW1hZ2UuDQogICAyLiBSdW4gdmVyaXR5c2V0dXAgb3Zl
ciBpdCAtPiBoYXNoIHRyZWUgKyBhIHJvb3QgaGFzaA0KICAgMy4gQmFrZSB0aGUgcm9vdCBoYXNo
IGludG8gYW4gaW5pdHJhbWZzIChhIHNlcGFyYXRlIG1pbmltYWwgaW1hZ2UgDQpmcm9tIHRoZSBy
b290ZnMpLg0KICAgNC4gQnVuZGxlIHRoYXQgaW5pdHJhbWZzIGludG8gdGhlIGtlcm5lbCAoSU5J
VFJBTUZTX0lNQUdFX0JVTkRMRSkgYW5kIA0KYXNzZW1ibGUgdGhlIEZJVC4NCg0KVGhlIGtlcm5l
bC9GSVQgdGFzayBpcyBhbGxvd2VkIHRvIGRlcGVuZCBvbiBhbiBhcnRpZmFjdCB0aGF0IGlzIGRl
cml2ZWQgDQpmcm9tIHRoZSBmaW5pc2hlZCByb290ZnMgaW1hZ2UuIFRoZSByb290IGhhc2ggaXMg
ZHluYW1pYyAob25seSBleGlzdHMgDQphZnRlciB0aGUgcm9vdGZzIGlzIGJ1aWx0KSwgYW5kIGl0
IGZsb3dzIGludG8gdGhlIGluaXRyYW1mcywgd2hpY2ggaXMgYSANCmRpc3RpbmN0IGFydGlmYWN0
IGZyb20gdGhlIHJvb3RmcyBiZWluZyBoYXNoZWQuDQoNCkJ1aWxkcm9vdCBoYXMgYSBmaXhlZCBw
aXBlbGluZToNCg0KICAgICBwYWNrYWdlcyAoaW5jbC4gdGhlIGtlcm5lbCkgIC0+ICB0YXJnZXQt
ZmluYWxpemUgIC0+DQogICAgIGZpbGVzeXN0ZW0gaW1hZ2VzIChyb290ZnMuc3F1YXNoZnMsIHJv
b3Rmcy5jcGlvLCAuLi4pIC0+ICBwb3N0IGltYWdlDQoNClRoZSBrZXJuZWwgaXMgYnVpbHQgZHVy
aW5nIHRoZSBwYWNrYWdlIHBoYXNlLCBpLmUuIGJlZm9yZSBhbnkgZmlsZXN5c3RlbQ0KaW1hZ2Ug
ZXhpc3RzLiBUaGUgZG0tdmVyaXR5IHJvb3QgaGFzaCBjYW4gb25seSBiZSBjb21wdXRlZCBhZnRl
ciB0aGUgDQpyb290ZnMgaW1hZ2UgKHNxdWFzaGZzKSBpcyBnZW5lcmF0ZWQsIGluIHRoZSBmaWxl
c3lzdGVtLWltYWdlIHBoYXNlLiBUbyANCmJha2UgdGhhdCByb290IGhhc2ggaW50byBhbiBpbml0
cmFtZnMtaW4ta2VybmVsLCB0aGUga2VybmVsIHdvdWxkIGhhdmUgDQp0byBiZSAocmUpYnVpbHQg
YWZ0ZXIgdGhlIHJvb3RmcyBpbWFnZS4NCg0KQnVpbGRyb290cyBCUjJfVEFSR0VUX1JPT1RGU19J
TklUUkFNRlMncyAobGludXgtcmVidWlsZC13aXRoLWluaXRyYW1mcykNCmRvZXNuJ3QgaGVscCBm
dWxseTogdGhlIHJvb3QgaGFzaCBpc24ndCBrbm93biB1bnRpbCB0aGUgc3F1YXNoZnMgZXhpc3Rz
LCANCnRoZXJlJ3Mgbm8gb3JkZXJpbmcgYmV0d2VlbiByb290ZnMtY3BpbyBhbmQgcm9vdGZzLXNx
dWFzaGZzLCBhbmQgbm8gaG9vayANCnRvIHJlYnVpbGQgdGhlIGtlcm5lbCBhZnRlciBhIGdpdmVu
IGZzIGltYWdlLg0KDQpPdXIgY3VycmVudCB3b3JrYXJvdW5kOiBhIHBvc3QtaW1hZ2Ugc2NyaXB0
IHJ1bnMgdmVyaXR5c2V0dXAsIHRoZW4gDQpyZWN1cnNpdmVseSBjYWxscyBgbWFrZSBsaW51eC1y
ZWJ1aWxkLXdpdGgtaW5pdHJhbWZzYCB3aXRoIHRoZSByb290IGhhc2ggDQppbiB0aGUgZW52aXJv
bm1lbnQgdG8gcmUtYmFrZSB0aGUgY3BpbyBhbmQgcmUtbGluayB0aGUga2VybmVsLCB0aGVuIA0K
cmVidWlsZHMgdGhlIEZJVC4gSXQgYm9vdHMsIGJ1dCBuZWVkcyBhIHJlY3Vyc2l2ZSBgbWFrZWAg
ZnJvbSBwb3N0LWltYWdlIA0KYW5kIHJlLWxpbmsgdGhlIGtlcm5lbCBhbiBleHRyYSB0aW1lIHBl
ciBidWlsZC4NCg0KUXVlc3Rpb25zOg0KICAgMS4gSXMgdGhlcmUgYSBzdXBwb3J0ZWQgd2F5LCB0
b2RheSwgdG8gaGF2ZSB0aGUga2VybmVsIChvciBhIEZJVCkgYmUNCiAgICAgIChyZSlnZW5lcmF0
ZWQgYWZ0ZXIgYSBmaWxlc3lzdGVtIGltYWdlIGhhcyBiZWVuIHByb2R1Y2VkIGFuZA0KICAgICAg
cG9zdC1wcm9jZXNzZWQg4oCUIGkuZS4gdG8gZmVlZCBhIHJvb3Rmcy1pbWFnZS1kZXJpdmVkIGFy
dGlmYWN0IGJhY2sNCiAgICAgIGludG8gdGhlIGtlcm5lbC9pbml0cmFtZnMg4oCUIHdpdGhvdXQg
YSByZWN1cnNpdmUgYG1ha2VgIGZyb20gYSBwb3N0DQogICAgICBpbWFnZSBzY3JpcHQ/DQoNCiAg
IDIuIElmIG5vdCwgaXMgdGhlIHJlY3Vyc2l2ZS1gbWFrZWAtZnJvbS1wb3N0LWltYWdlIHBhdHRl
cm4gY29uc2lkZXJlZA0KICAgICAgYWNjZXB0YWJsZSwgb3IgaXMgdGhlcmUgYSBjbGVhbmVyIGlk
aW9tIHdlIGFyZSBtaXNzaW5nLg0KDQoNCkFueSBndWlkYW5jZSBvciBwb2ludGVycyB3b3VsZCBi
ZSBoZWxwZnVsIGFuZCBhcHByZWNpYXRlZCAtIGluY2x1ZGluZyBpZiANCkkgaGF2ZSBvdmVybG9v
a2VkIGFuIHNpbXBsZSBleGlzdGluZyBtZWNoYW5pc20NCg0KVGhhbmtzIGluIGFkdmFuY2UuDQoN
Ci0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
