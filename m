Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE835C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 15:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7050384328;
	Mon, 12 Jun 2023 15:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7050384328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3lesDOEeFva; Mon, 12 Jun 2023 15:58:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C1A838B2;
	Mon, 12 Jun 2023 15:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84C1A838B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D13991BF398
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F441418B2
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F441418B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MulJOk36lHzQ for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 15:58:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9AC418AE
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF9AC418AE
 for <buildroot@uclibc.org>; Mon, 12 Jun 2023 15:58:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aht4qaDm8WTvqENfWG3Y2lDgdbjZd7i0CEEMg25eJYQMJFpSOfjLuv3HTSAP273Qx6X4x+kYgkaoLEI+AEx6ZqtZdJ5la5kNT4/WF6b4+SWHcHbJniwmE4A9WsKUUAU2wpSxUW6iT4YodtZpdZDqI7nMquHpX5C22peleAbeICPQUaDQ26YZxVkRs/a6XM4BaYJ7PmXHDMfQ2K+16v1DGJzbVkxi2rreYFh4AUERn6sEGsan25JQ3kOujqKQa9kAm8M9hskIczxsH/M+adY8smBE4qy4v9aPnxCL8lOB2kr1ounn+Qh7x9s9/KDfAHQFXfgkG53MsA0/JjuXCxtZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSMhbwoRrDxRGA/ha9bwWkq64fveCiyzI6etpdQoWxI=;
 b=hnfk9iRjUmu+zpfQT8n+n3j+ixO1wOx4V+cp7Ib+m8mX6qG53izIks6RGs7+PHojA2Grb3LJNzJAczN2eRNATUUG+24qjNthUPpPji9fknhd5lz3Nvs2SWJRBOrYvd22qA0w2m2FkMr1aTH2YZVXF71wqs0Rf0vBL2QbUusLg7Xm9ZzN6sBngrS6++xZJAYW6tPnklaRFJd+fUkPg0YYZnVEL9sQ+4zCc5mz1XD47Ms03hSX5lf8wbRmogh2Gyh+f2oOtaAVMs3B58W7D3e1mjBYNhdtbS5wrVe0rJlFE2ol1jIXWpnifW/o7yT0hrZgcUK9DKmLThGm/OqntgNEBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 15:58:08 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0%6]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 15:58:08 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [git commit] package/bootgen: bump to xilinx_v2023.1
Thread-Index: AQHZnUU20teYFo5eIUCUKvqZM/eL0a+HUtJ5
Date: Mon, 12 Jun 2023 15:58:08 +0000
Message-ID: <F538D9F3-E233-41D3-8A3E-1D293B324D25@amd.com>
References: <20230609161307.432DD8262B__38013.4634369583$1686327210$gmane$org@busybox.osuosl.org>
 <pan$df8d3$d38b8fa2$c50497ad$86a070c3@ID-313208.user.individual.net>
 <87ttvcznqk.fsf@48ers.dk>
In-Reply-To: <87ttvcznqk.fsf@48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB7524:EE_
x-ms-office365-filtering-correlation-id: 66cba415-3089-4a18-9c1d-08db6b5dd0ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TREjEz9h4GEiXc6gKPmQ+qgXYj7ITgspZ0ORXH6I8YiZbMbB0w4rx35YQaj5EXkwN7vTlqco2yQRAdFFeDjFy7t8HC2hyBj2XcQYPg3dLYyPeQfEs8F+G0YXPhxmV3KP64ZNc+FxAWTBVPukw4qo/9BIOyFKElRRHoT7nfMW1rPvi14Xb4xWnhPe8XWzfYLF1PjMNlaLfpSkvFmrKHQrP6E8XlftWV+1Gk4cMPLPQef7kT0ucUncvOyvbMf5/7dAit8Iy1x1dWZ1NIuEfHzrsq/bMM3os/3vM5WfGcD2cKQryz0p6UMht8kNGTQMsdix6hq9v+S13TsXRkBzNid+7vgUV8A0rWJTR++vsF2f4r+Fm/h1A5mbnRxzXGnPKmJG/sLCuGg1yL7IZ8K4kRMOJBJWFmbK0cHa9uywO5RJHrvoswCz5Nk10Ft9+ryYDumF7LXQh1YXBHTCM77WaT5/2dP/9GjagNquavIsv3EnXr+bfnlEN8JgQdWs/Gz0sk5PxKizTndzlap5aX7K6BLl2B9ztMpXopgJumd0cVMgnTfQO+qMNLVVVZShncYKNWkNNj0o14mvmVvv+mbWa/QXOcz0oOqZGr1ozilUQyuReMfl6NqSwkXjV4WsXasek8p/ecRHDDElTXtrcDAEQDXi5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(6486002)(966005)(36756003)(66574015)(2616005)(38100700002)(38070700005)(86362001)(122000001)(33656002)(6506007)(6512007)(186003)(66446008)(2906002)(5660300002)(54906003)(8936002)(8676002)(316002)(41300700001)(6916009)(4326008)(66946007)(66556008)(91956017)(76116006)(66476007)(71200400001)(64756008)(478600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2w3bGttUkxPYk0vUmdhcTM3QkNNL09qVGhmTjRWREVIWXNSRStjQWQ1VEkw?=
 =?utf-8?B?bG15WC9sSEJMTVZIdmZaZkp1U3FSUUR2eUFYZmkxWmlqdlhwbEtmNTduL244?=
 =?utf-8?B?OEJabCtQeTUxOWFoYmJtUGkrOVFvZHN5UFVxRE9KM2dxWjhVK0tmMExrcWIz?=
 =?utf-8?B?YWlyTDBlbklkTlRGdUZvZHlNTzZTZkZ1Y2ZpdDlia3JXd3VHQzluYlpEN2NP?=
 =?utf-8?B?aG9TRWdEd1ZoM2szdlY1bXZGczNidXdlbmdjUWMwWFZPbVdWWmlzOTVreGE5?=
 =?utf-8?B?UW1vdUJ5VTZ0VU1tRDZaM2FjdHlHdmxyZUU3a1NlTWFJdTVBMlRMeEVXc21N?=
 =?utf-8?B?VzVGcnNGVzQ2czR4Q0NLdjNkSXNYUmJBYmp6TGFHRTc5Z2dPVm5xSTQyM2hG?=
 =?utf-8?B?V3cvck1uM1Y5WWVHU1RCTHkybmE2enZDZ2IvK2IzelgvR2ExekQ3VmExeUc0?=
 =?utf-8?B?aFZDbGIyeUhVWVJWWmpIVzhzRFpPQW9KSkhyd2E2T3Fua2VOekU4RndXNFlX?=
 =?utf-8?B?dEZ1MldKMnl3Y05USHRRUk1VR21yZCsyQkFRZVpCM3NLMER0cnVVa0pSV2hv?=
 =?utf-8?B?dEZ5OThzL3ZLcis4bnZscXQxL1ZWNW1NTk1aUzRUY09LNnRpU0h6TFBGOXJp?=
 =?utf-8?B?ajNQSnQ2cC91S2dIbm4wMllkZnJ6cU8xc2h5Q3RubFVZenJWWFhQek51Zk1R?=
 =?utf-8?B?WVkvSDVLdVc1bDhqWExRSm1wUXJZWDNaSi9YeG9SeXRDQnNxTXhNUndkZnJJ?=
 =?utf-8?B?T3NYbllTbWlJM1JyTytCRDNISFROWXNxT1Y0WllJTStpWEN6Tmp1T25KdW43?=
 =?utf-8?B?Tmk2aC9hcW91ZGlEck80KzRSNEJrdXRDc0tGZ0hpSzUvSmlBUmNzUkVxUWp6?=
 =?utf-8?B?ZEJPWVRVU29Od2JmTUNXRS94U2liajIvaTcrNHQ3L3Q0UFh4eDNjbzQ5eEcw?=
 =?utf-8?B?ajZBS1lzS2dUYjV1L2puUW9sY1BSZnFDRm5RUThxd2QzYVFNYURVVThVZHF6?=
 =?utf-8?B?WDJ5NCt0SEtRNjAzZE90MW11Tk1NMWllZDlScnRjQkpOWXdkaHIzVThrby9a?=
 =?utf-8?B?ZnRscWJmRTlqZFo0bGFVVmduZDhBbzFTaGNxSFpEb1Y3MmIxQ1ljTGRrWGdM?=
 =?utf-8?B?b0JQTVlURExhSzF0YUlrT0FXdWh4dm9SNEkzZzM5NytqbDJkaXA2ZUt0MzN4?=
 =?utf-8?B?NEthU1gvMlNSZ0FlZE55cVdBRWJtTkU3TWNLUllwMjFDc2wvLzV6dVRkd3A0?=
 =?utf-8?B?UEFZQkRUYXZQNjlKQUdQOEhFTTI4SFZkZFMrWlN6S1M3LzN0c1VHUXJldnBF?=
 =?utf-8?B?MWxzbFdRSlA4YjhQd3R4Vy9Mb3BLQjJrbTRHR09laGkwYm9Ed3dDYlY1N3Nt?=
 =?utf-8?B?ZXdNQTRJcTEvelRmNTQrTHFjZ2JmTnJpdTN1MThYdUN0NkpGRmxPOTFPZXM0?=
 =?utf-8?B?MG1UdnBUbEpkNjBtSjRDU2JWdldLZytJQ3Y4d3o0N3Y1STBEeTZxaW5yZzZS?=
 =?utf-8?B?VHZ0dWp1MDRSQVVuV0hBazZGUlI4Qk9XTjJzZnQxck9HVXpzenJnZUtTVVNm?=
 =?utf-8?B?RVBneWhhL2VFenhlT3pGSlJpRVFHd1RRU3dnaGFsZEdaak9MZ1ZlUDhsTVlL?=
 =?utf-8?B?Y2grZ2dha09oVlFXWEpSa2djYm1EeGEwVU5mWFJnMEVDdEVnK3BaOXlCNEpa?=
 =?utf-8?B?L1VUcHVhSTlpLzZIcnBBUVR2dEJsaW1mUHY0L0tpSEtualRWc2pUL3EzMGJM?=
 =?utf-8?B?bnRJSFA3a3diaXAwRW9YbEpJWXBQUkM4SGlHbUJWQm9NeE0yN2pmMEZuWDV4?=
 =?utf-8?B?ZTBFWm5JTzZKSjVRSm45aFpRQ3hNZkhBWDB6aWs3YTU5c1JIaldXbVhEUXpI?=
 =?utf-8?B?Y05UMlBSMllWakxURVMrSmpLenRwck9GNWR1dXoxUXBhMkJUM1dxR0h1KzNk?=
 =?utf-8?B?WU9JWlU0YkhlNVhEbklIVXpUbFB0WXpSaWZXT3BFQjFtWEczM2xXQllNVk5N?=
 =?utf-8?B?Qk1nd3BmQk5NVFFhSzI4YkhWNEVWT0t3Q0ZHbGg4S1hnTFBFSUQrUXBPV3Ez?=
 =?utf-8?B?M2tKQ2pMVjhKbkpRbG1pZjBQRk45UE1FQW1JRmRId0NwV3B5K2N6cEJBZnNo?=
 =?utf-8?B?MHYwNFdzUFJyZ3BPN0FSOEhXUS80MWdSaHN6aGtBUEVLZWNUdjlBcGNGcVhP?=
 =?utf-8?Q?ovEMuLfle75H3BhLSpVk7IU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cba415-3089-4a18-9c1d-08db6b5dd0ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 15:58:08.4279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4e2XOPzPVnO1IYpZy4M2VxsKg+FgqqUTW8POoBK/EBn4Ngk/qCakJWjvbGUsUnl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSMhbwoRrDxRGA/ha9bwWkq64fveCiyzI6etpdQoWxI=;
 b=Zjr5sWAwgE+ChfpZ8DutKKDrcF9dB2Ni7wBm5s6hRStMPsKTDOtPJ4sJwPWRhcNSUuV13bZrPAnZSBoE8NgYCXXxyAtwmHNhFJ5rz4fvFXrnZnJPL9xNwrk+9KKo5xwfh3Xa3RvITZNoRQol1Ej9mTzyFal14Nkap0x3/u3P2uY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Zjr5sWAw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [git commit] package/bootgen: bump to xilinx_v2023.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "buildroot@uclibc.org" <buildroot@uclibc.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsDQoNCg0KPiBMZSAxMiBqdWluIDIwMjMgw6AgMTc6NDcsIFBldGVyIEtvcnNnYWFy
ZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOg0KPiANCj4g77u/DQo+PiANCj4+Pj4+
PiAiQmVybmQiID09IEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4gd3JpdGVz
Og0KPiANCj4+IEFtIFR1ZSwgMTYgTWF5IDIwMjMgMTY6NDg6MjUgKzAyMDAgc2NocmllYiBQZXRl
ciBLb3JzZ2FhcmQ6DQo+Pj4gY29tbWl0Og0KPj4+IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQv
YnVpbGRyb290L2NvbW1pdC8/DQo+PiBpZD1lNGFjMTRlMDlhNTc2NjcxNjgyNzgxODczMzFjZGY3
MjM4YjgwMzI0DQo+Pj4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9v
dC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyDQo+Pj4gDQo+Pj4gVGhpcyBwYXRjaCBidW1w
cyBib290Z2VuIHRvIHZlcnNpb24geGlsaW54X3YyMDIzLjEuDQo+Pj4gVGhlIHBhdGNoIGZvciBi
dWlsZCBtYWNoaW5lcyB3aXRoIG1vZGVybiBmbGV4IGlzIG5vIGxvbmdlciBuZWVkZWQuDQo+IA0K
Pj4gSGkgTmVhbCwgaGkgUGV0ZXIsDQo+IA0KPj4gb24gbXkgbWFjaGluZSBJIGNhbm5vdCByZXBy
b2R1Y2UgdGhlIGZsZXggYnVnIGJ1dCBpdCBzZWVtcyBpdCBvY2N1cnMgDQo+PiBhZ2FpbiBhZnRl
ciBidW1waW5nIHRoaXMgcGFja2FnZSB3aGljaCByZW1vdmVkIHRoZSBwYXRjaDoNCj4+IGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC8/cmVhc29uPWhvc3QtYm9vdGdlbi14aWxpbnhfdjIw
MjMuMQ0KPiANCj4gSSBhbHNvIGNhbm5vdCByZXByb2R1Y2UgaXQgaGVyZSwgYnV0IGxvb2tpbmcg
YXQgdGhlIGJ1aWxkIGlzc3VlcywgaXQNCj4gc2VlbXMgdG8gZ2V0IGNvbmZ1c2VkIGJ1aWxkaW5n
IGNtZG9wdGlvbnMueXkuY3BwIHdoaWNoIHNvbWUgbWl4dXANCj4gYmV0d2VlbiBwb2ludGVyLXRv
IHZzIHJlZmVyZW5jZS10byBzdGQ6Omlvc3RyZWFtOg0KPiANCj4gLi4vYmlzb25mbGV4L2NtZG9w
dGlvbnMueXkuY3BwOiBJbiBtZW1iZXIgZnVuY3Rpb24gJ3ZpcnR1YWwgaW50IENPOjpGbGV4U2Nh
bm5lcjo6eXlsZXgoKSc6DQo+IC4uL2Jpc29uZmxleC9jbWRvcHRpb25zLnl5LmNwcDoxMzYyOjE4
OiBlcnJvcjogbm8gbWF0Y2ggZm9yICdvcGVyYXRvcj0nDQo+IChvcGVyYW5kIHR5cGVzIGFyZSAn
c3RkOjppc3RyZWFtJyB7YWthICdzdGQ6OmJhc2ljX2lzdHJlYW08Y2hhcj4nfSBhbmQNCj4gJ3N0
ZDo6aXN0cmVhbSonIHtha2EgJ3N0ZDo6YmFzaWNfaXN0cmVhbTxjaGFyPionfSkNCj4gDQo+IFRo
aXMgd2FzIGluZGVlZCBjaGFuZ2VkIGluIEZsZXggMi42IGFsbW9zdCA4IHllYXJzIGFnbzoNCj4g
DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS93ZXN0ZXMvZmxleC9jb21taXQvMzM2YTFkZWFhNTc5NzVm
MzRjZDczMmQ2NTZkMWMwY2JlM2Q1MjMzYQ0KPiANCj4gQnV0IGJvb3RnZW4gZW1iZWRzIGFuIChh
bmNpZW50KSBmbGV4IDIuNS4zNToNCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngvYm9v
dGdlbi9ibG9iL21hc3Rlci9iaWYueXkuY3BwI0wxOC1MMjANCj4gDQo+IEl0IGlzIGEgYml0IGhh
cmQgdG8gZm9sbG93IGFzIHRoZSAyMDIzLjEgdGFnIHNlZW1zIHRvIGhhdmUgYSBudW1iZXIgb2YN
Cj4gc3F1YXNoZWQgY29tbWl0cyByYXRoZXIgdGhhbiB0aGUgY29tbWl0cyBmcm9tIG1hc3Rlciwg
YnV0Og0KPiANCj4gVGhlIHBhdGNoIHdhcyB1cHN0cmVhbWVkIGhlcmU6DQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9YaWxpbngvYm9vdGdlbi9wdWxsLzIwDQo+IA0KPiBUaGUgcGF0Y2ggd2FzIG5vdCBh
cHBsaWVkLCBpbnN0ZWFkIGEgZGlmZmVyZW50IHBhdGNoIHdpdGggdGhlIHNhbWUNCj4gY29udGVu
dCBhcHBsaWVkIHRvIG1hc3RlcjoNCj4gaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC9ib290Z2Vu
L2NvbW1pdC9hZjRmNzA4M2VhOTI5MzFhMDdlNDc5OTVlYjJiYzJhMzQ4YzU3N2VkDQo+IA0KPiBU
aGlzIHBhdGNoIHdhcyBub3QgYXBwbGllZCB0byB0aGUgeGxueF9yZWxfdjIwMjMuMSBicmFuY2gs
IGluc3RlYWQgbW9zdA0KPiBvZiB0aGUgY29udGVudCB3YXMgaW5jbHVkZWQgaW46DQo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9YaWxpbngvYm9vdGdlbi9jb21taXQvYmZiYTkxYjJjODQxNjBkYzIwM2Zm
MDlmMGU5MzBkODJlZDA2YTgzYQ0KPiANCj4gQnV0IHRoZSBjbWRvcHRpb25zLnl5LmNwcCBodW5r
IHdhcyAoYWNjaWRlbnRseT8pIGRyb3BwZWQ6DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
Ym9vdGdlbi9jb21taXQvYmZiYTkxYjJjODQxNjBkYzIwM2ZmMDlmMGU5MzBkODJlZDA2YTgzYSNk
aWZmLWUwMjg3YWRiNDIwZGJlY2MxMTJhY2RmN2Q0YTFlZmJhOGVhNmNiZjA2NDAxZTRlODY3OWI4
ZmZkMjJhMDkxZDgNCj4gDQo+IEknbGwgc2VuZCBhIHBhdGNoIHRvIGZpeCB0aGF0Lg0KDQpUaGFu
ayB5b3UgZm9yIGNhdGNoaW5nIHRoaXMuICBJIGltYWdpbmUgaXQgd2FzIGluZGVlZCBhIG1pc3Rh
a2Ugc2luY2UgdGhlIHBhdGNoZXMgd2VyZSBzcXVhc2hlZCB0b2dldGhlci4gIEkgd2lsbCBjb21t
dW5pY2F0ZSB0aGlzIHRvIHRoZSB0ZWFtIHJlc3BvbnNpYmxlLg0KDQpXZSBzaG91bGQgYmUgYWJs
ZSB0byByZXNvbHZlIHRoaXMgcHJvcGVybHkgaW4gdGhlIDIwMjMuMiByZWxlYXNlLg0KDQpJIGFw
b2xvZ2l6ZSBmb3IgdGhpcyBpbmNvbnZlbmllbmNlLg0KDQo+IA0KPiAtLSANCj4gQnllLCBQZXRl
ciBLb3JzZ2FhcmQNCg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
