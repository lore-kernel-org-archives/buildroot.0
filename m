Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCFAC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 05:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D0F81678;
	Mon, 14 Nov 2022 05:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89D0F81678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bii-tizehfl7; Mon, 14 Nov 2022 05:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1704815AD;
	Mon, 14 Nov 2022 05:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1704815AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81DF21BF57B
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 05:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37259400F6
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 05:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37259400F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbBl4Be2Y8hJ for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 05:20:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4A0F400D8
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::622])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4A0F400D8
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 05:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTnGwjexrPcK8RXWScRjrbbc31baOKa0tORNYKfFnG1EoM2PILrggS4lUfmvBClMftz+aIZa79PjgQLJeTSGHBnBw3lHjyBurN89xABPEKxnVWBhjGFVR6iYYnBrr+w+Dfn1pf7eHOrd8RL4ofWafFNzYpyrhvl5joGyq8Ovv97lliDdKtNiM1OGoJ2w0aY6GvnVs3b6O2ekO50bv8vWxGQxCEkCOpHR8sCtSm2SuRuCkoNLqXw23WI5fXeBNBrT7An+ROuSInzL47B9W4zWV7L9Gputw/z6qT6Otdn+i7tRpBrvB3mC4a/sffqylqZ+7ozGWy5n72F9ZWGy1ybQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgEJeWAqTye8RpEqm0zCoU+oJFsURo4PWnBjLpi0Unc=;
 b=EqlvRgODw6qQXKoh+xWmkC8DOj0/hdJ65wvwYfN8njXQg8Xt1sGBH4OpFPOPVCFwnI1DjujzVStCiA6zS+wNGbzJ8FkbiOA6Z8tvjggv3mxHPJtNKzbUlmRusTSNITXojZzwt7uSw58IlRJvyiA9FgNMO3mjFEIAHoW00XJ1L45vNFmRfg6xwgiIzBe6JakHfP8ZE+a1XOyN9OlCrfWDpG5Ctz1dNPO16CxiwrRJAySxIx/5z40W+JTAVrHyXKALSQ+pW86SlBVBxEWJof2aM1czMx4DvNrLOKubPudzCibX2clKxBAroBO6mlUpOf+28XAEQf8wJZN18ZSMU6dacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 05:20:43 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%5]) with mapi id 15.20.5813.016; Mon, 14 Nov 2022
 05:20:43 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
Thread-Index: AQHY95CvOWzbCNQTGEOxWUMidKLHK649VkEAgACMTWM=
Date: Mon, 14 Nov 2022 05:20:43 +0000
Message-ID: <0CE02715-2AFE-43E1-8EBE-7060E44E4C93@amd.com>
References: <20221113184933.47232-1-neal.frager@amd.com>
 <20221113215834.00ae7f71@windsurf>
In-Reply-To: <20221113215834.00ae7f71@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CY5PR12MB6383:EE_
x-ms-office365-filtering-correlation-id: f3a7e2da-0010-4747-3b0f-08dac5fffa84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yEbaA1kBAOrWXnk4bmPOF6BIMNQ4fENw2wQMyeWxurdtNC2Nuz+aeSnZrnpoc1F7MAfNcBT/VjR1ACAJl9dYvhWAL53Pb55IDQZos+yc89sWn3/2ot875tn8bwfLZ+dqC0MaSl/dqJjSoADg747zebov6nFtl0mSb47gz2TYgxGJuZs7r3PLeQ2pS8xuE/GDMzNlSlp6F+LprsaJIIoG487j+K9OXQdOZIvFSkWCy1UR8odyxj5fjl1djDa8gziUKIfIjMstszC30+CwF7kGl/27eQtZyROaGqDVCRb3Le+rTYQVm9tCtH1Ayi+YGKp+Z8nqgniWHAtQOzyziC1uEPU04208Pe8pwfJe+Rvy6bGZec2hM3L3kByttiop2cDxEf3K6iO1o2u9JJAd8yuF0ZlaQAecndTIkmV4yd5HZYfY2MLFUFteNZNMGpJvJkZc7jQeSGkiju7OeRDwL+rex47esd+TT52hXJhW3mXzzfW2F+ifa5Zy6jk7z9eZtTyYLqprWMZzPbopqG/zxaRf5kL89iD0iusxIaMqBp034l3u7fSTgJsYNDjGpwA+bUvyDCQEOMDcjTqlOR3s5PUoaCU3hRb1iXSurfVnaWHLEc6vr80lbqmw/jpeJkOjl0k9yrbRhHdCSKnBrJYh1wuZpXmwoyEPsnWjSbsMgCcftbtB8Cbpb8DKHWMnqtlizJ/wsJiu7MWFrA4wOCW6z7i2iy8X6inB4ZxP9qa50EED7u5ZyjVSlnFU4urJE9etXinB9K98PlUcLpAf55CdQ6PFoopdo7s75Kkbhv0AsfxhxBWHwM1T0x3BfE2HJva21oEVGQ0X0zvskP5xCXpD8Cilcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(6916009)(66574015)(316002)(6506007)(41300700001)(83380400001)(2906002)(5660300002)(36756003)(8936002)(2616005)(4744005)(186003)(6512007)(76116006)(66476007)(91956017)(66556008)(8676002)(64756008)(66446008)(4326008)(33656002)(66946007)(478600001)(6486002)(966005)(86362001)(38100700002)(122000001)(71200400001)(38070700005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0xMS1RkLzN5NkhoU3ZtWFIyRTRkcDlxMTJsRzBsOWZlRUVYUzlBR2xvU0Vs?=
 =?utf-8?B?MGhNekErL3ZSb3hDR1lrMzcxT0pnNG1OYWpvV2lXSGtvWVQ5eWdSZkU3T2l1?=
 =?utf-8?B?WWRlQzlCRVJobG1QUERZQ0NpR3p4L1hQeWZXc2J4QTdFTjcvRlk2RXozN0xV?=
 =?utf-8?B?QVVuekNFYlVST0ZqL2trYWxOd3V4aUZoN3pYYnh5ZXU2TWVJTWIvNEQ5SVZq?=
 =?utf-8?B?bWpSMjgxWmlJV0ZkNTV2Y2drVlgxZDRzVXM4bGlIOVZkSmc4RmF6UVRpZ0Na?=
 =?utf-8?B?aEl1ZGhFQmpoMGhncmYybVNuTW8wVDZHUExsbXBoY0pTdDRXTzc3dXB3MHRQ?=
 =?utf-8?B?TWVPNmdsMjRMcG9SdGZ3bzVLdktwZjZ3SnlMUHZmNFVVTTh5TDdKd2hUTXI2?=
 =?utf-8?B?VDVHYnpNVkg3RUNPWlBvdGNDZSttOEhIVFk0dEIzWExTUlhKaTkzTjk4TlpF?=
 =?utf-8?B?dXNzQjBPTFdtSDcvcWRRb2U3M28rK0sxNElwOGFXR3lJTEVwd2xBa3RrYnNO?=
 =?utf-8?B?YWdKeTZSUlY2WWtHL2M0bHF2U0IyV2FDbmsrRG12UGNSb00zWjErZTFPMTVR?=
 =?utf-8?B?VkhGbzVEYVpHdUZua1JqcFpJbkVzZ2crSXc0N1U5UHJtUHhKR01uZGo5YUZE?=
 =?utf-8?B?U3RuWkk4ZEd1L3EvUHZsZEQrcmNFMmY3KzVheGtLeGFXNmdER3pPdUsrdjdZ?=
 =?utf-8?B?UTJKNXBqZWNwT2EydVYrVC84L2FZZERsMlpobEVmNDIwZ2J4elJnMmw2aDdZ?=
 =?utf-8?B?NDNwWFlGZHZwQUFVTmlWemZBM2JUajdCRlU4MExHelVhOEtiU2xtcFhaVG1H?=
 =?utf-8?B?UGM5YmVMS2k4VVZiWUk5bDZpdDVpaW9qeEluU2IyVVBKUmNJbksxdy9UTTl6?=
 =?utf-8?B?SlQrZVFxR1loQVpramJmUWRLNExMNG9LZ1FvK2VWN1BPcEMyYTZZRzZHWDZT?=
 =?utf-8?B?Y3Z0TlBjTUhtSjRVTllrV3YwYzYvTWhQN1JjS2lLSSs4Ymlqc2VNbmdwcGd2?=
 =?utf-8?B?WW9NamVlbUpkQ0dkUmNZWDgvS0tWQk9vVXhwalhucytYcEY3c3NJc2lKd2VG?=
 =?utf-8?B?SDBTbytzQmVBYm5weHBYMk1wcHJDK1BkY2RHZ1J5L1NJeGNUN2tRRmw1VVls?=
 =?utf-8?B?T1VCZzMrQU9lZVJLTFVRbWRXZnFsWDVlY01EelZ6cHI0UGFPNXZ5dWtFRHds?=
 =?utf-8?B?SEtBQXBVVE11V2llS1RNN0V6OWpFcUFnTTZzc2lKTEJsbTU2dTJsdmF2MWYr?=
 =?utf-8?B?WnFWcXM0YjgrTXN0YzVWdFRuV3JDTnhkOGF1bEpVZktYWW1QY2VoeCtRUHps?=
 =?utf-8?B?Zzh0VEI3VTlGclc1aVlTK2ZGcmxDN3E4Ti96Ymg0cFZia2dOSU9lamxoSXp1?=
 =?utf-8?B?TzNhbnBuQkF1U1JQbG9tblB6eGNseTFSMHZIeFNvcXoxYWh2RUdZd01ZWjNm?=
 =?utf-8?B?cUYrbSt2NFlwWWk1M1Vra1VEcEUyZEhXb0FNZFVpZFBsaW5nUlIzdXJPN1hU?=
 =?utf-8?B?a1A4d243UTNwUWR3ZXMyREFHYnU0T0hlUjU5aTcxcXBkVVNPUHIrdVJNM1FL?=
 =?utf-8?B?VytnN3Z1T1ptb0VKanRYZEFDNmVSNEFCNlQyK1gyQXB3Q0J0TUNNbGkzUWZY?=
 =?utf-8?B?YUVvUUptMEpqeGJ4dmJLenBHdURTeFhVQTh3ZldNMVZpQmliNnQ3MW1qc0dq?=
 =?utf-8?B?LzhRZFBVdHM5L21mY1o4MVJsS2VCc0ZKQUIxV2dTVGtHYzhjdTlURGJOeFBp?=
 =?utf-8?B?UVRBaTN3aFZ0TXMwdk1zYnBCUTl4KzIwYlJubkNXR3BuQytEdWQ2Nm13cUcx?=
 =?utf-8?B?Y1NlaWFYdlJBRmYrTmlNNVBFalB6dzIrZ1FiQlprWWhOcDA5RXJhS3czTzJ1?=
 =?utf-8?B?cThFNGFzbTRKV3lSb3RSQWhXR1crRmFScXcxU0UxUTM3djQwbG55b3R1Mnhz?=
 =?utf-8?B?UThEZlFMNEJ1N0hqek9EcXFuMHBqVmhpWmtpM3J4cHZHazFQS21tbHlLakl6?=
 =?utf-8?B?clFTWW1FOW44TGM0SlV1cHc3OHZRNGNwem52YlZSSFNkSHp5cHREYklNZnJ6?=
 =?utf-8?B?eW8yN3NNSEtMTkQ0eXpwVEdhdDloNzY1ZlJhQ1NKd1VsZFFnNm1JWmJiR1Vk?=
 =?utf-8?B?cW9RWkdyZ1hPemplcGx5eXNHTnUwR0IydHVQRHdCakhHR1lnM1prYjdHM1FS?=
 =?utf-8?Q?Mr14PEnlru9YjuinZ/fg0xc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a7e2da-0010-4747-3b0f-08dac5fffa84
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 05:20:43.6492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJQPnr9SEvp4iptrBEnresFzDhkTsmHiwxbaGkK49+GLYZbZH3/qg404TLfHjSth
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgEJeWAqTye8RpEqm0zCoU+oJFsURo4PWnBjLpi0Unc=;
 b=kZ6XY5ZePJauyoPRkUsZYM34ZTuFGdmU3aIwIJOkGd25Avxi+2/OOiFPz5M9oDxsa3nJTv0p7oWLifUAcmwMI1+5ISdHX3Z+plS0L2tkf9S6odUshNxG1Tjco9X7OTuDD3d2tZhxK00sNq7Pf7CIYrfg3ENr5zY7iHXXH64h6ao=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kZ6XY5Ze
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
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
Cc: Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQoNCj4gTGUgMTMgbm92LiAyMDIyIMOgIDIxOjU4LCBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6DQo+IA0KPiDvu79P
biBTdW4sIDEzIE5vdiAyMDIyIDExOjQ5OjMzIC0wNzAwDQo+IE5lYWwgRnJhZ2VyIHZpYSBidWls
ZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToNCj4gDQo+PiBUaGlzIHBhdGNo
IHJlbW92ZXMgdGhlIENPTkZJR19NVUxUSV9EVEJfRklUIHUtYm9vdCBvcHRpb24gZm9yIHRoZQ0K
Pj4genlucW1wX2tyaWFfa3YyNjBfZGVmY29uZmlnIGFzIGl0IGlzIG5vdCBuZWNlc3NhcnkuICBU
aGUgcG9zdCBidWlsZA0KPj4ga3YyNjAuc2ggY3JlYXRlcyB0aGUgcHJvcGVyIHUtYm9vdC5pdGIg
d2l0aG91dCBuZWVkaW5nIHRoaXMgb3B0aW9uLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBOZWFs
IEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gYm9hcmQvenlucW1wL2ty
aWEva3YyNjAvdWJvb3QuZnJhZ21lbnQgfCAxIC0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBJJ3ZlIGFwcGxpZWQgdG8gbWFzdGVyLCBhZnRlciBhZGRpbmcgdGhlIGZv
bGxvd2luZyB0byB0aGUgY29tbWl0IGxvZzoNCj4gDQo+ICIiIg0KPiAgICBGaXhlczoNCj4gDQo+
ICAgICAgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8z
MzEwNDYzMjgxDQo+ICIiIg0KPiANCj4gRm9yIGZ1dHVyZSBwYXRjaGVzLCBpdCB3b3VsZCBiZSBu
aWNlIGlmIHlvdSBjb3VsZCBpbmNsdWRlIHN1Y2gNCj4gcmVmZXJlbmNlcyBpZiB5b3VyIHBhdGNo
IGlzIGFpbWVkIGF0IGZpeGluZyBhIEdpdGxhYiBDSSBmYWlsdXJlLCBvciBhbg0KPiBhdXRvYnVp
bGRlciBmYWlsdXJlLiBUaGFua3MgYSBsb3QhDQo+IA0KDQpZZXMsIG5vIHByb2JsZW0uICBJIHdp
bGwga2VlcCB0aGlzIGluIG1pbmQgZm9yIHRoZSBmdXR1cmUuDQoNCkJlc3QgcmVnYXJkcywNCk5l
YWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
