Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D3AC433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 15:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3045760E2C;
	Wed,  9 Nov 2022 15:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3045760E2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oH6BPLpjhZmY; Wed,  9 Nov 2022 15:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D616079D;
	Wed,  9 Nov 2022 15:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D616079D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB3A41BF29A
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 15:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65C274173B
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 15:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65C274173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwicKFN2cUeG for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 15:10:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CEC341738
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CEC341738
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 15:10:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1caq+opFCEtSk+13e33pIXytrCXqn0nTwepUxHwqGCTIyqtsHfGwxaF0nnPtqY7tNeChFB+bVpndgvCbRplMvVMIcOf06k1Tg0Mv+O9b2HG801mHVqwRuO+QD5GiN5NfWeLUo4q5JZNCu+UF/WgALquvu9QQPfa8tX2m0vzodcL7PSo5DCBCkHtuM3I+TY1gV5WDU2UrgBzjurxS097osmSsh/yyIhyrcmQdt3CJTe8VdOZeBa/6EdxQEaWD/TlvBQmEyIJGKeAHzsM//mxW/jIX+bMD85YEURRgeApOFN5dey3y7t/e3Ah0rqe688JEb6214XfOBe45wbbaVQRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3XAlZLdSFiY4t2BovG6/NyvvTvTylWA1O15sPdSVss=;
 b=MA3bfK2+si1jZj+HfYnsP2MbF2JE44saCs9TIKSgoGGTa9TeqZ17WEAqnnCQdtOLLp23PopP073oQeg5pLeMz+Zr/Ll1yIzqJfjvlVeNe0hahcVxK3N9g7TKCpS8xuVqIoaBrVvLK3YNTX2CisaJMj2NX84aamDxjcsV5ofsOiV/Ci1tFJ8VV/Pd9f7fWaMyJcXCauueUYracSIjIXDfw4cIrHc1ZfP7R2QazsUxiDfTyQRukHJroWnoNjKTx1ki+330uaDpMj53EpMDI+Eggg2xgeEkLL+EAaDRqeVwBY5TL1Es4xdttcOSQh55U9g+PQVBcrdGEb+gZrJlkvbpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 15:10:27 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 15:10:27 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 2/2] configs/versal_vck190: new defconfig
Thread-Index: AQHY9Btje/fKxpNlD0iFO0ixpgBZLq42rqSAgAAD1gA=
Date: Wed, 9 Nov 2022 15:10:27 +0000
Message-ID: <CC27D304-488B-42BA-88F5-0B13A7FEC403@amd.com>
References: <20221109155621.4af7f270@booty>
In-Reply-To: <20221109155621.4af7f270@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6909:EE_
x-ms-office365-filtering-correlation-id: 858b2c6d-a7bc-46be-65bf-08dac26488ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LyB+vzsfgdo7+yrdjNb8MVva2Z99nk9J/D6GA8lR7Iff5yoKJcIk6UJomIzjiE6riCzeBXT+2zbxbBpSGTdCQ9Zg37RvFJA5pmDu+1owCgBI3eTFXUo9e9GEOjs49cVMFcyoO2EoZLwrUTTtI0Hlt6FARlcVG9hJ0hAIGsUM0z0zvQQ+VvDUaANEGX+D3WdBabLE2/kjTOGSswBEXElfdmZ6qzw1N2UR22QoPOQ9jl1ZU/Hv4TywqAMT5cKyvt3mJzLDlxA318F46WRO0OWVKIkeA0deS77y1NlrSc4MCtMu+xapLJqK4Aj0LpLyCcUxr1urHWc0BHEOZ/MNJGWCYvtMTFuiI7y1ocNOb7GfBi99RqzdMbDE7OfPPvlbDPtdDXOpO4sBA6VqeH89R2AHXcczgq8PmsN61Xa/pUTdgXdmV67mbuqCj3XtMtzOkQA2lVAv8FBJ4LGgvCVqaVeZKi/VYlGF1eACFbRiyrXzyvflhX0mOK8Ph9KnbgSV+Zy1B9HgkxbAbEo9VtX5K880q7+yU9OPu88+OWImE3gHtwWtyc5GCTHdnsYs4VHeH9I/aA6ELKKXL1sah0p5Y//4Pztv9+VJ846CBmpToldLErid636T6W4nLk4KVrNbBimf0r095trPM2fZAEGfkD3qEsqx6fFRKh2WOhHotoh8u8Ms7QVE3ez5YqqHz8Pb1j3iSTp85EUvdk6SW//+vBfetToG6o0Omn0D0798wweixYVWm+s7DuOKj5ijLsGG52NGkwTY5fuZzGehC27TzAQpJbFBRTaBK6pyCh+aN+Hd+BS7cYagHqqwCl2mO53pI6q7wmgJnT9RNcYZBl2D9yX3e0TIEJ/tmZVMpYkXdhN7VhAcPr73qJIkS2we6KhTpK4Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199015)(478600001)(71200400001)(38070700005)(966005)(38100700002)(6486002)(122000001)(8936002)(6506007)(6916009)(54906003)(316002)(91956017)(76116006)(36756003)(86362001)(4326008)(41300700001)(6512007)(33656002)(83380400001)(2906002)(66476007)(66446008)(64756008)(8676002)(66556008)(66946007)(5660300002)(186003)(2616005)(66574015)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHhhUmswamxydkJyYk1ad0lPaC9USmFOODNHRjFuYkV4aGQrZG1mb1ZQS1pR?=
 =?utf-8?B?emlZeldDazN0bWRITU5yRU9kcG5DTFZrV2RHc1NIbTUxY3BGa2dNSzg0OWx6?=
 =?utf-8?B?TUkrd25Bc3pzZVE0UEZueHp2VmlnazFGMFNoV1ljMVp0MWpZaUxHWFlsVWh0?=
 =?utf-8?B?VHJ2S2dPNFcybGlTMXQ4S3BzYVpPR3hsSlNHM1hOT2pMMnRXTVZLMG5oNUxz?=
 =?utf-8?B?SDJRT0orZjBYeDB1SHJPajdqZG9tVEtjSXlPcU9QNEowYUpaaWdvVHNwUFU0?=
 =?utf-8?B?RlpXemlNOW9uVm1JTGJEbWNYR1lsdzFIZU51RndPKzhGNU5td3Zqdjg5eWNt?=
 =?utf-8?B?b2NXUG44RTE5MFI2cFMzbDFtcCtHOWlZNnd3a2NYQlZjL2x6djk5dkp5bW84?=
 =?utf-8?B?U0g0WHY1aElub0NoVHBzZ2N1YjRhYklBbmZlN21kME1mb2xZL2tYM2pReWUy?=
 =?utf-8?B?a25JajVVT0FqWmJzNzN6SFRLaCsvOHFJNkVUSmV0eG5RZWZub3AxbU83RFVi?=
 =?utf-8?B?UmpZVTQ5UW9DRU95SlVBNjFQWmlkb090eE9PeHlGOHJLbE0zUEUvWE93U2Rz?=
 =?utf-8?B?ZzBsRXZWRVNwdVhHKzJxYk9FYU81ZWpGSGcvVjV1YitMU3pLMmlwNTZUVXJU?=
 =?utf-8?B?NUJIMFZMMWtsakN2THJVVWRhL2M0ZFR6dnBrb3pYc1U0MVpVMTRHOXhmRXF4?=
 =?utf-8?B?eGUycmloZzFDYlIrRkdyUHhNa1VUTVpxdjFzZk8waDJhU0NaM3Z2WndKb2RI?=
 =?utf-8?B?d2lxTXF1RmZWTUFXS2l1MWpnTjRoRCt1MlFRTGp4YTF0bTdRSEswcTdUeFJF?=
 =?utf-8?B?WEh2c3BQTk1veVRaS1pJSjY1SUlNRXh3U0lESWZpNDJudWxoTktpUnA3UWZI?=
 =?utf-8?B?YlN5elZpd1B5ejFIUXUrQ294dnFHQVVXV0ZkUW52cVRnQzQ0SWM5M0Ywaksz?=
 =?utf-8?B?S0NUWFBzMW9FQldKa0d1ajIxcytIU3ZzS1FITE54YWROTGE2eXZSZUdsNjZI?=
 =?utf-8?B?WDN1R0E2RlVSNnNFT2JudTBTbFdYbHZJVnBESjhqVVV5QUNCYjZPaGJvbDBw?=
 =?utf-8?B?Z1Y4MjUycWtEaE9VU3Z0MVc0VHNVc1prR2VlS3g0YjdwbUtrMlRyUzZTSDFV?=
 =?utf-8?B?VWZQZnRsZS9BdzVWcVBPeVgxSnkremZKQm1FTmpiRFIwakhzK2V4M0E1dXhq?=
 =?utf-8?B?cHE3Z1lHT0hUTFF1NndVdUJPNlBNMHJpQ1QzWmRLMzdXSEZKM1RTNEpaM2Nh?=
 =?utf-8?B?OWRONmsyMTl5ck05aGxVVWpMRGVzSEJCVXhXMEptdjFsQllOcnJMVjhkY09l?=
 =?utf-8?B?YXJGTnBhemc0SlZOQjVaUFFKVG9LK1AyUHBPa0Q1Y1hZSk16aHM2dTRLU0RF?=
 =?utf-8?B?RmQrZGRPanhWdnRVa0UwZ0xDdVhrRU1hcDdFLzdUS3pYbFNYcElIRGRhZnNk?=
 =?utf-8?B?MlN0UDR1TWg5OUJtUncyZ2kzZXJLSVdyWkNjaDhWdFk2NDdFRy9PaExNRDVK?=
 =?utf-8?B?Vm1NejB6cnB0V0NTYTdnTnJPQTlLdlFiQ3NscFZYSk5IQWhGZTdLa3Z5VEhr?=
 =?utf-8?B?YVhLczNUM0VwWWZlV1E3Tm9yRlFsa3ROSUF4WDBwL2lacldSbHVYTDJEN0NR?=
 =?utf-8?B?YUtjUUtXSjA2Y1E0bFNHK2dYTThlYU5aTVVZSFFvVUZlbXlobUMrazRCanlo?=
 =?utf-8?B?Mm1kTEpOSDI4VHdRRUxkYmFIWXVvY0lGRnI1M3FTSU5sc0srVXBBYnhUODVz?=
 =?utf-8?B?OGdYd3NhcGNhTHZ1V1dJcGs2ZlRCUzdzTVRycEdWT1J2S1plYmZ2dXU1ckxN?=
 =?utf-8?B?Q3dRYzBEczl2RDVHNnVLMjVHUEltMG5WVTZzWmRjUmZMdWh2dWlBZmNmMlV6?=
 =?utf-8?B?eEFZd2hMRUFmNXJ2Y085S2Z1bGxXVXZrQnlHTTNQaWlaRnRGVFNrUGs1eENp?=
 =?utf-8?B?d2NTcWd6R050ckJYVVI5RGF2anVqdklGMTVmN1dMNk80bSsvazZIYVZwM1E3?=
 =?utf-8?B?WFVnWk5FRGxibmw5b0Ixd2hKTU9UN3ZsQU5RbGx2ZGNzUk5ubzdweWxSemJO?=
 =?utf-8?B?V0l5VFo1NjY4T2VXY0YvdXoweGIva0gvc0hKQm03aUl4STdGbVV6cklGWWhK?=
 =?utf-8?B?U0RHdTdlRHVVdDVpcE9DVDdjMEhxOThKY2xoeG1rQldqd1F5K1NzbFNKOEJS?=
 =?utf-8?Q?OOcP2y++ok2Hvu0iopdsqWczCfK3HUOKxKEoQ7AKEZyA?=
Content-ID: <38D335C296D4F743BC9AC0E24A31FD37@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858b2c6d-a7bc-46be-65bf-08dac26488ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 15:10:27.5746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XROkXy4JonLslcN6k97cJE2V4O5+nXN6e655VEJayJ4bpI+j1QNAsMywFAyMFY+O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3XAlZLdSFiY4t2BovG6/NyvvTvTylWA1O15sPdSVss=;
 b=HtKltPVdrXmZky3vpZTghK9nIAmEmGf+LUVq94rglczYjr8xFARv5D+MK5xMzUeP8pqJb67STAfIxuq4vmIZIhBtd+EpkOa/0jILqwf2kDpEoadzIVggpp2B2wIT3dAmQowwWeuxpxg/ohDx2NBfpEiWaAN7+FuciruPHsKporc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HtKltPVd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 2/2] configs/versal_vck190: new defconfig
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
Cc: "O'Neal,
 Terry" <terry.oneal@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KPiBMZSA5IG5vdi4gMjAyMiDDoCAxNTo1NiwgTHVjYSBDZXJlc29saSA8bHVj
YS5jZXJlc29saUBib290bGluLmNvbT4gYSDDqWNyaXQgOg0KPiANCj4g77u/T24gV2VkLCA5IE5v
diAyMDIyIDAyOjEyOjE0IC0wNzAwDQo+IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29t
PiB3cm90ZToNCj4gDQo+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgWGlsaW54IFZlcnNh
bCBWQ0sxOTAgZXZhbHVhdGlvbiBib2FyZC4NCj4+IA0KPj4gVkNLMTkwIGZlYXR1cmVzIGNhbiBi
ZSBmb3VuZCBoZXJlOg0KPj4gaHR0cHM6Ly93d3cueGlsaW54LmNvbS9wcm9kdWN0cy9ib2FyZHMt
YW5kLWtpdHMvdmNrMTkwLmh0bWwNCj4+IA0KPj4gVGhlIFZDSzE5MCBpcyBiYXNlZCBvbiB0aGUg
WGlsaW54IFZlcnNhbCBmYW1pbHk6DQo+PiBodHRwczovL3d3dy54aWxpbnguY29tL3Byb2R1Y3Rz
L3NpbGljb24tZGV2aWNlcy9hY2FwL3ZlcnNhbC5odG1sDQo+PiANCj4+IFRoZSBWQzE5MDIgaW5j
bHVkZWQgd2l0aCB0aGUgVkNLMTkwIGV2YWx1YXRpb24gYm9hcmQgaGFzIFhpbGlueA0KPj4gQUkg
RW5naW5lIGFjY2xlcmF0b3JzIGRlc2lnbmVkIGZvciBhY2NlbGVyYXRpbmcgbWFjaGluZSBsZWFy
bmluZw0KPj4gYXBwbGljYXRpb25zLiAgQWxzbyBpbmNsdWRlZCBpcyBhbiB1cGdyYWRlIGZyb20g
cHJpb3IgWnlucSBhbmQNCj4+IFp5bnFNUCBmYW1pbGllcyB0byBBUk0gQ29ydGV4LUE3MiBjb3Jl
cy4NCj4+IA0KPj4gV2hpbGUgdGhlIExpbnV4IGtlcm5lbCBmb3IgVmVyc2FsIGlzIHF1aXRlIHNp
bWlsYXIgdG8gWnlucU1QLA0KPj4gdGhlIGJvb3QgcHJvY2VzcyBoYXMgc2lnbmlmaWNhbnRseSBj
aGFuZ2VkLg0KPj4gDQo+PiBUcmlwbGUtcmVkdW5kYW50IE1pY3JvQmxhemUgY29yZXMgYXJlIHVz
ZWQgdG8gYm9vdCBhbmQgc2V0dXANCj4+IFZlcnNhbCBkZXZpY2VzLiAgRm9yIHRoaXMgcmVhc29u
LCBjdXJyZW50IGJ1aWxkcm9vdCBzdXBwb3J0DQo+PiB3aWxsIGRvd25sb2FkIHByZS1idWlsdCBm
aXJtd2FyZSBpbWFnZXMgYW5kIHVzZSBYaWxpbnggYm9vdGdlbg0KPj4gdG8gZ2VuZXJhdGUgdGhl
IGJvb3QuYmluIGZvciB0aGUgdmNrMTkwLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBOZWFsIEZy
YWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4NCj4gDQo+IFsuLi5dDQo+IA0KPj4gZGlmZiAtLWdp
dCBhL2NvbmZpZ3MvdmVyc2FsX3ZjazE5MF9kZWZjb25maWcgYi9jb25maWdzL3ZlcnNhbF92Y2sx
OTBfZGVmY29uZmlnDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAw
MC4uOGM1ZDM5MWI5Nw0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvY29uZmlncy92ZXJzYWxf
dmNrMTkwX2RlZmNvbmZpZw0KPj4gQEAgLTAsMCArMSwzOCBAQA0KPj4gK0JSMl9hYXJjaDY0PXkN
Cj4+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTU9eQ0KPj4gK0JS
Ml9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3ZlcnNhbC9wb3N0LWJ1aWxkLnNoIg0K
Pj4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3ZlcnNhbC9wb3N0LWltYWdl
LnNoIg0KPj4gK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0idHR5QU1BMCwxMTUyMDAgbW1j
YmxrMHAyIHZjazE5MCINCj4+ICtCUjJfTElOVVhfS0VSTkVMPXkNCj4+ICtCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9UQVJCQUxMPXkNCj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxM
X0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLFhpbGlueCxsaW51eC14bG54LHhsbnhfcmViYXNlX3Y1
LjE1X0xUU18yMDIyLjIpL3hsbnhfcmViYXNlX3Y1LjE1X0xUU18yMDIyLjIudGFyLmd6Ig0KPj4g
K0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJ4aWxpbnhfdmVyc2FsIg0KPj4gK0JSMl9MSU5V
WF9LRVJORUxfRFRTX1NVUFBPUlQ9eQ0KPj4gK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19O
QU1FPSJ4aWxpbngvdmVyc2FsLXZjazE5MC1yZXYxLjEiDQo+PiArQlIyX0xJTlVYX0tFUk5FTF9O
RUVEU19IT1NUX09QRU5TU0w9eQ0KPj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQ0KPj4gK0JS
Ml9UQVJHRVRfUk9PVEZTX0VYVDJfND15DQo+PiArIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMg
bm90IHNldA0KPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkU9eQ0KPj4gK0JSMl9U
QVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1RBUkJBTEw9eQ0KPj4gK0JSMl9UQVJH
RVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBn
aXRodWIsWGlsaW54LGFybS10cnVzdGVkLWZpcm13YXJlLHhsbnhfcmViYXNlX3YyLjZfMjAyMi4y
KS94bG54X3JlYmFzZV92Mi42XzIwMjIuMi50YXIuZ3oiDQo+PiArQlIyX1RBUkdFVF9BUk1fVFJV
U1RFRF9GSVJNV0FSRV9QTEFURk9STT0idmVyc2FsIg0KPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfQkwzMV9VQk9PVD15DQo+PiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZf
QkwzMT15DQo+PiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMV9FTEY9eQ0KPj4gK0JS
Ml9UQVJHRVRfVUJPT1Q9eQ0KPj4gK0JSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05G
SUc9eQ0KPj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJBTEw9eQ0KPj4gK0JSMl9UQVJH
RVRfVUJPT1RfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIsWGlsaW54LHUt
Ym9vdC14bG54LHhsbnhfcmViYXNlX3YyMDIyLjAxXzIwMjIuMikveGxueF9yZWJhc2VfdjIwMjIu
MDFfMjAyMi4yLnRhci5neiINCj4+ICtCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0i
eGlsaW54X3ZlcnNhbF92aXJ0Ig0KPj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX01BS0VPUFRT
PSJERVZJQ0VfVFJFRT12ZXJzYWwtdmNrMTkwLXJldjEuMSINCj4+ICtCUjJfVEFSR0VUX1VCT09U
X05FRURTX0RUQz15DQo+PiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkNCj4+ICtC
UjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9FTEY9eQ0KPj4gK0JSMl9QQUNLQUdFX1ZFUlNBTF9GSVJN
V0FSRT15DQo+PiArQlIyX1BBQ0tBR0VfVkVSU0FMX0ZJUk1XQVJFX1ZFUlNJT049InYyMDIyLjIi
DQo+PiArQlIyX1BBQ0tBR0VfVkVSU0FMX0ZJUk1XQVJFX0JPQVJEPSJ2Y2sxOTAiDQo+IA0KPiBU
aGVzZSB0d28gbGluZXMgc2hvdWxkIGJlIHJlbW92ZWQuIFRoZXkgaG9sZCB0aGUgZGVmYXVsdCB2
YWx1ZXMgYWZ0ZXINCj4gaXQgaGFzIGJlZW4gYWRkZWQgdG8gcGF0Y2ggMS4NCg0KV2hpbGUgZnVu
Y3Rpb25hbGx5LCB5b3UgYXJlIGNvcnJlY3QgdGhhdCBJIGNhbiByZW1vdmUgdGhlc2UgdHdvIGxp
bmVzLCBJIGFtIG5vdCBzdXJlIGl0IGlzIHRoZSByaWdodCB0aGluZyB0byBkby4NCg0KSSBkZXNp
Z25lZCB0aGVzZSBwYXRjaGVzIHdpdGggdGhlIGlkZWEgb2Ygc3VwcG9ydGluZyBhZGRpdGlvbmFs
IHZlcnNhbCBib2FyZHMgaW4gdGhlIGZ1dHVyZS4gIFdoZW4gYSBzZWNvbmQgYm9hcmQgZ2V0cyBz
dXBwb3J0ZWQsIGl0IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSBmb3IgZWFjaCBkZWZjb25maWcgYmUg
ZGVzaWduZWQgZm9yIHRoZSBzcGVjaWZpYyBib2FyZC4NCg0KSSBvbmx5IGNyZWF0ZWQgYSBkZWZh
dWx0LCBzbyB0aGF0IHRoZSBwYWNrYWdlIHdvdWxkIGFsd2F5cyBidWlsZCwgZXZlbiB3aXRoIHRl
c3RzIHdoZXJlIHRoZXNlIHBhcmFtZXRlcnMgYXJlIG5vdCBkZWZpbmVkLiAgQnV0IGluIHJlYWxp
dHksIEkgd291bGQgbGlrZSB1c2VycyB0byBhbHdheXMgc3BlY2lmeSB0aGVzZSBwYXJhbWV0ZXJz
IHRvIGdldCB0aGUgcmlnaHQgYm9vdCBmaXJtd2FyZSBmaWxlcyBmb3IgdGhlaXIgYm9hcmQuDQoN
Ck9uZSB0aGluZyBJIGNvdWxkIGRvIGlzIGdldCByaWQgb2YgdGhlIHZlcnNpb24gZGVmaW5pdGlv
biBpbiB0aGUgZGVmY29uZmlnIGZpbGUgYW5kIGxldCB0aGF0IGp1c3QgYmUgZGVmYXVsdCAobGF0
ZXN0KSB1bmxlc3Mgc3BlY2lmaWVkIG90aGVyd2lzZSBieSBhIHVzZXIuDQoNCldvdWxkIHlvdSBi
ZSBvayBpZiBJIG9ubHkgcmVtb3ZlIHRoZSB2ZXJzaW9uIGNvbmZpZyBpbiB2NSBhbmQga2VlcCB0
aGUgYm9hcmQgY29uZmlnPw0KDQo+IA0KPiBJZiB5b3Ugc2VuZCBhIG5ldyB2ZXJpc29uIHdpdGgg
b25seSB0aGF0IGZpeGVkIHlvdSBjYW4gYWRkOg0KPiBSZXZpZXdlZC1ieTogTHVjYSBDZXJlc29s
aSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4NCj4gDQo+IC0tIA0KPiBMdWNhIENlcmVzb2xp
LCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0
cHM6Ly9ib290bGluLmNvbQ0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1ECl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
