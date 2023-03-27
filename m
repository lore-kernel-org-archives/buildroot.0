Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5745EC76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 09:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B4D41610;
	Mon, 27 Mar 2023 09:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B4D41610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_gRJ3F9KWF8; Mon, 27 Mar 2023 09:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D643D41619;
	Mon, 27 Mar 2023 09:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D643D41619
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE69E1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 09:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BD6D40A1B
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 09:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD6D40A1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cftIeTlo0Phn for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 09:00:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDD47405FC
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDD47405FC
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 09:00:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtQkX3Fi/0v/Aoomc2HJ4M9yD22Zamc8ePhQ2mfvWAdd2uX5drJp7fzPqiVoi88SEi5GIrGMlmIc9hecTwXrSFSBDAzScy6GXFgSYUIiAhdsMp+JOJ0AdQIMUCY49FlHbuNYUwuqiZ0dhcLaUxjfEi8RxxQ/OsILvaaN/ia40GrT22YBKJ2Cc6o5ouSx1yeiM2tc3KyMM2mTiT2ZZkWVkOUE2R53RIq482ZdK06szwW55A3LLoAWlYM3Avy2/UDYy/Hry+9Q7uYVlh0obXSu3XNN2wz1tbMXbKEQjqkLIvwEGwLpy6nzzBgINbcNe7bTgCDtQqyZq0oFdW8QQ6piMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyhZtlWyrERk7BhubgEo37BDkSq8F5n/YrKiDyrMkXk=;
 b=nurnszOFeDJXffRWDFYVnAPVY/uzZTFPN1Toy4D9FvXoZ5178ZO8Kc8rzGSMwqQzixlllyEQxRWAWuNBy27iN50KZjXB3VPeqS7vIMF3DU0rFrYZj1Qva7SGBc0kWw9Su3o/5poAmbSJyU6LLzoxviKcb1tJv9Q8GnfU0YNvB6QD1bSLB8noiBFmr+eJBTOU7tX0oAWkClw59NLjmO9iAkxnZa37o7LrHZ0Xv8msuU9dplLhiDxuH2uuEf26MNiWO+9Vvlk1nWxjsILkUZvyyAtSkXarp25cRnS/uFVP27m4lKOwEH4wKeI43nXs91565Cv4/C8VzZDSK08hz/c+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Mon, 27 Mar
 2023 09:00:50 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec%3]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 09:00:50 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
Thread-Index: AQHZX+ylwlDcnFpbP0+plEFQFRl0H68NfNeAgACiAgCAACCiAIAAFewc
Date: Mon, 27 Mar 2023 09:00:50 +0000
Message-ID: <F57CF95F-1200-4393-9BDE-92AA80D6CC7A@amd.com>
References: <20230326220543.057f381d@windsurf>
 <B1C2F9E6-C87B-4B1A-A6F9-9A312663D946@amd.com>
 <20230327094222.3b11e289@windsurf>
In-Reply-To: <20230327094222.3b11e289@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB6806:EE_
x-ms-office365-filtering-correlation-id: 5731da76-8d46-43b8-fcf2-08db2ea1c340
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tfdQhUMq3B9fZ4w/Z5zsqVRJLx27YaR9btWyMEf/UfMyftDnVabSGMeHgZWcDb/zCxjNiW1VvGvj3BhIJb4grlMzXiiyczz89+lKXZXV/O2/k75/F/3pcSHI0Wp9A31+lXHA4MjC3MkGGx8j+uyeP/TptmjaicCWdkxmSWienCANHU5VACK6EDi+MpOLu/7di9i7O7GH4Pa3Z8O3G+bzYbWSdHbI7354J6aoDAULM9cjtVqgMog1QpP037zOXn5G3Qd7EnIKOzQaLLd9coOvOZuBid+xLW91vxGxC9XAUpDkUCq536XBB+ZlyZg5iOQjvUU6V0Cit//5SUdKeJ2CmLXToRnTEQjSEHB3GJqEhG1+rIH4B/9WSiqkyY/HG9TV3+C+phs+k1s+t8O2A5IvKmVWxoZDGAibDWstZ4Itjf1+b3FQChb+4n9zThY+lgMlWSiEPeL7nqs0qWoAjZVS/BUTEtUJ4X6QlrTfOMWyt3CG2707mtbRUV5WNmTrd6lpQlC7OCvq+Wxg06ho+aHQjafsMQV6SlUR9FOBgk69wGa7miyRrfufAProHKvLrM8Xxau9E4zTIgURM6aW4hAZns+Ryq+1Nl+ONA/HfBFXs8U4pHJzrX9jpyhAjz0Yireihuf27Vcjn3GCET8qxGex1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(122000001)(6512007)(66574015)(66899021)(66446008)(66476007)(33656002)(36756003)(2616005)(4326008)(66556008)(6916009)(64756008)(186003)(66946007)(478600001)(8676002)(83380400001)(966005)(86362001)(2906002)(76116006)(38100700002)(41300700001)(91956017)(54906003)(38070700005)(71200400001)(5660300002)(6486002)(6506007)(8936002)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aks2K0dlZ3JkZmxSMjZqSnRBUlZoS3NIRFlqa21Zb0ViU2hieG9YSHY1SGhp?=
 =?utf-8?B?aTFFVUo2b3VORjdXQjJOcnhLTFMwWXJTK3YzT3VScXRyM0d5OG12c0llT1V4?=
 =?utf-8?B?TlZRYWlEVWJId2E3OU5XeGRxWWtyOG1OQXEzU0htNzUvbjV3bCt0SHFzVnVI?=
 =?utf-8?B?Rm4rVklMWURTVVhLSHczSE9IU0plNC9Qc2VIWW9nWTgxcXo3b3VGeVJpMmpS?=
 =?utf-8?B?ZmFwaEcwTTlmb1I1cTFBQVNERXVSVW5IZ2NuMmtyN2JsU05Dd0RHWTV5L3pa?=
 =?utf-8?B?bHpkOUg3dDBtWlJyRmF5cnAxekFIMnprZkNnZFFzZTEvclRQTEZNSGtLMUp1?=
 =?utf-8?B?eXZPT2oyQmxvT2QvL1pDQm1UKzN2Mkk0aXo5eWxNR2htOHFjSU8zbkdhSld4?=
 =?utf-8?B?TkZTa3hZS2JCMmRyaWN6NnJXOW12ZDA2VnZqZUhTZzJnUk9tQzBLVmFIK2ww?=
 =?utf-8?B?bTVPKzQrUm42NnlINDByTXVHSDlhblBFelRubW5XOUVvYkY5RGZyZ09heHlv?=
 =?utf-8?B?bHZHSDNzSkVJUFhLckcxaExuL1BmK21zYjJQaHdDUTV3aFpLVDBCSlNVVUZn?=
 =?utf-8?B?VWZLa3NCSndMZGVPTEp1T01lYmIxYVIxeDg1ZDlrazBJVGhsNEJudEl1Sy9z?=
 =?utf-8?B?eXJneFd1TktveFBjekNEMWZFcllNNG52dFpTZXdGZEc3S0UrK1N3NmN3YjAw?=
 =?utf-8?B?SHNCZ1FBeXVJSXNHK2hheHVVQ3c0UEhnNDV5WVpNMUMwMXcxY1BNNVNxMXc3?=
 =?utf-8?B?TXdXSTNzNkpyL0JuNUdKc01sZ25VTDZDR0liU2x6dVV3RXJiT1NBODBPSVlw?=
 =?utf-8?B?RXZWWUpGdzFPaEEvNmVWd0ZxdlpFZHRyQ0Z0ZlNBVnN0Wjc0d21RZnRNSktJ?=
 =?utf-8?B?cnlQdDZ3bzlYVzVKMnc1R2lNUmI2ejNOWHdEN3JyVkgyWDNtdVM4WXcrajVp?=
 =?utf-8?B?K25ublJON013b1cyRWExKy9tcGdKdmpiMnZDME1Eb294dXB6QjJwc3ZkZ3Q3?=
 =?utf-8?B?dFdkdFRRczNQcWhWVEtTOVZNcXFvblVwa3RPUWFZa014SmlZNDQrNHB5SXE2?=
 =?utf-8?B?RGJqcFgvTTB1YjBhTnFJWlVBd1Z5Y3hFZnFRRTRtUDVwcnJJdEVuMkwzUVQz?=
 =?utf-8?B?OHllcVNHNEdUQTd3UUl0dHlrY04zSVl6cGsyR3VQQXE4bjdHUTBQU2tGa2tS?=
 =?utf-8?B?ZitWQTZiZDVBa3h2Zjc1SFBMdlNsb2syWFBZRGlVd3Z2d3pMZXNjeGtnN3Vu?=
 =?utf-8?B?MWlnaFlBK1RlWmpJVW1KZzloRWdLSTQ5VHpuaFVjTWljSkFyREdhRDJsZnRT?=
 =?utf-8?B?bllGeEZnOVl1QWY2ZVVTaGJ4MUtUZjlyU21ldVR2Q002TUIyb1ZqVThnc2x1?=
 =?utf-8?B?djhBWnVET3d1WUJac0RJelRUbmt4NkJQcUN6UGRiTUNkN29vaTNOaWZiM3Nj?=
 =?utf-8?B?UjFnRDZmWnRjdlAxNGhOVC94ZmVDYUt0NGN0RFV3WE4vMnh4ZVlyOVV2a1VE?=
 =?utf-8?B?cFNTUUN5L0xybU5YQmZ4cTUzSE9KeEFRbTN4TXo3MFNrL1IwNTE2eVMvVVZk?=
 =?utf-8?B?dUlraFl6SWo3VThvLzlyWlcwVmROeVQ3dFA2dWJiMVlOdE9yck5lM3lOQVlr?=
 =?utf-8?B?eXRlWnNSdU42ZHZ3UmRCRUdTRVlXOCtzcVN3WVN6T0J1elFUc3V0MzJMUVh2?=
 =?utf-8?B?VmREeGl6d3Juc1Z4ZURndE5GaUJVYW9HSnF5VUsxNjhCcDRBa00vb3l4NGxz?=
 =?utf-8?B?QVZVNU5wUlkreEpoK1F3M0JGazhRSkkyU3hJN1Q3d3EwK2o5b01wcko3MmNV?=
 =?utf-8?B?Q3dvMmJjRDRMZzg0YS9FR3d0K001Nno3dnBJditHR1dkVlMrQlltTG9YTmov?=
 =?utf-8?B?VGRDUjIzdm9UU2YyN2orVS82SStpaXRUQ1FyRWx4VVdmaGpIVTBQbCtnbDlW?=
 =?utf-8?B?aWF1d05WZjdnS01OUlBrTUltSDJYVFQrVGRHOXBrK2dkVTV4aTduenBtUEJi?=
 =?utf-8?B?QTZuYmJRcThXQzBKTzhrUVpHVUY1OGYraldLblQ4QUwwUDVqMHk0ZnFGcFk1?=
 =?utf-8?B?bm1CTGZTUHE4eWN0bDBXSHRZeEtzM2FvdUV6UXZRdEE4ajllREFienJrY0hN?=
 =?utf-8?B?K1lKUVl5WGN4VnpwOXBFMFVmU2hVL0RvRDlwdXhVNmxwSFdIVi9NcFV4ZDNV?=
 =?utf-8?Q?/W/9HlEHXLzFtR/YyeHtkCw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5731da76-8d46-43b8-fcf2-08db2ea1c340
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 09:00:50.3015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xLOZWSG65HHCT3xdvSJVTGfY8rPJhJLlwKvz0oQ/lG/BxzW415Q2u3GRiGC4zkMQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyhZtlWyrERk7BhubgEo37BDkSq8F5n/YrKiDyrMkXk=;
 b=fkdJW1s5vdPlI8BjnSNl4uSneCkqNw9V0WHVGN0NL4ILcmPP02yZwDUt+YX3GaV03OxZvBeen0rx99QP6mtxbL4J2Kk7CpJYnKshiieo6Zae2dE43kvjMQGjzn4yCS7fmu4z+6vw3gQQ5j9lgOsKmjAk1XxNhdpUhn/RgVf8oJE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fkdJW1s5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQo+IExlIDI3IG1hcnMgMjAyMyDDoCAwOTo0MiwgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOg0KPiANCj4g77u/T24g
TW9uLCAyNyBNYXIgMjAyMyAwNTo0NTo0NSArMDAwMA0KPiAiRnJhZ2VyLCBOZWFsIiA8bmVhbC5m
cmFnZXJAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPj4gSSB3b3VsZCBub3Qgc2F5IHRoaXMgaXMgdGhl
IGNvbmNsdXNpb24gb2Ygb3VyIGRpc2N1c3Npb24sIGJ1dCByYXRoZXINCj4+IGEgbmV4dCBzdGVw
LiAgT25jZSB3ZSBoYXZlIGEgbWljcm9ibGF6ZSBjb21waWxlciBwYWNrYWdlLCB3ZSBjYW4NCj4+
IHVwZGF0ZSB0aGUgenlucW1wLWZpcm13YXJlIHBhY2thZ2UgdG8gdXNlIHRoZSBpbmNsdWRlZCBj
b21waWxlciBieQ0KPj4gZGVmYXVsdCBvciBhbGxvdyB1c2VycyB0byBzZWxlY3QgYW4gZXh0ZXJu
YWwgb25lLCBpbiBjYXNlIHRoZXkgcHJlZmVyDQo+PiB0byB1c2UgdGhlIFhpbGlueCBkaXN0cmli
dXRlZCBjb21waWxlci4NCj4gDQo+IEhtLCBPSy4gSSBkb24ndCBrbm93IGlmIHdlIHdhbnQgdG8g
aGF2ZSBib3RoIG9wdGlvbnMgb2YgdXNpbmcgYQ0KPiBjb21waWxlciBwcm92aWRlZCBieSBCdWls
ZHJvb3QsIG9yIGEgY29tcGlsZXIgaW5zdGFsbGVkIHNlcGFyYXRlbHkuIE5vDQo+IHN0cm9uZyBm
ZWVsaW5nIGFib3V0IHRoaXMuDQoNCkFzIHdlIGFyZSBhd2FyZSBvZiB6eW5xbXAgYnVpbGRyb290
IHVzZXJzIHdobyBhcmUgdXNpbmcgdGhlIFhpbGlueCBBUk0gY29tcGlsZXIgYXMgYW4gZXh0ZXJu
YWwgdG9vbGNoYWluLCBJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgdG8gb2ZmZXIgdGhpcyBvcHRp
b24uICBIb3dldmVyLCBJIHdpbGwgY2hhbmdlIHRoZSBuYW1pbmcgdG8gaW5jbHVkZSDigJxleHRl
cm5hbOKAnSwgc28gaXQgaXMgb2J2aW91cyB0aGF0IGl0IHdpbGwgYmUgYW4gb3B0aW9uIGZvciB1
c2luZyBhIHRvb2xjaGFpbiBmcm9tIG91dHNpZGUgYnVpbGRyb290LiAgV2hlbiB3ZSBoYXZlIGFu
IGludGVybmFsIG1pY3JvYmxhemUgdG9vbGNoYWluIHJlYWR5IGZvciB1c2UsIHdlIHdpbGwgdXBk
YXRlIHRoZSB6eW5xbXAtZmlybXdhcmUgcGFja2FnZSB0byBtYWtlIHRoZSBpbnRlcm5hbCB0b29s
Y2hhaW4gdGhlIGRlZmF1bHQgb3B0aW9uLg0KDQo+IA0KPj4gVGhlc2UgQ0ZMQUdTIGFyZSBuZWVk
ZWQgZm9yIHRoZSBrMjYgU09Ncywgc28gd2Ugd2lsbCBuZWVkIHRvIGluY2x1ZGUNCj4+IHRoZW0g
Zm9yIHRoZSBrdjI2MCBhbmQga3IyNjAgZGVmY29uZmlncy4gIEkgYWdyZWUgd2l0aCB5b3UgdGhh
dA0KPj4gY3VzdG9tIGZsYWdzIGFyZSBub3Qgc28gbmljZSwgYW5kIGhvcGVmdWxseSBYaWxpbngg
d2lsbCBmaW5kIGEgYmV0dGVyDQo+PiBzb2x1dGlvbiBmb3IgdGhpcyBpbiBmdXR1cmUgdmVyc2lv
bnMuDQo+PiANCj4+IEZvciBub3csIEkgdGhpbmsgd2UgaGF2ZSB0byBsaXZlIHdpdGggaXQuDQo+
IA0KPiBBbm90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHNpbXBseSBoYXZlIGEgWllOUU1QX0ZJ
Uk1XQVJFIG9wdGlvbiB0aGF0DQo+IGFsbG93cyB0byBwYXNzIGN1c3RvbSBDRkxBR1MsIGFuZCBs
ZXQgZWFjaCBkZWZjb25maWcgaGFuZGxlIHRoaXMuIEhlcmUNCj4gYXMgd2VsbCwgbm8gc3Ryb25n
IGZlZWxpbmcgYWJvdXQgdGhpcy4NCg0KQWN0dWFsbHksIHBhc3NpbmcgYSBjdXN0b20gQ0ZMQUdT
IG9wdGlvbiBoYXMgaXRzIG1lcml0cy4gIFdoZW4gdXNlcnMgdHJhbnNpdGlvbiB0byB0aGVpciBv
d24gY3VzdG9tIGhhcmR3YXJlLCB0aGV5IG1heSBiZSB1c2luZyBkaWZmZXJlbnQgcG11ZncgY29u
ZmlndXJhdGlvbnMgc3VjaCBhcyBlbmFibGluZyBzb21lIG9mIHRoZSBzZWN1cml0eSBmZWF0dXJl
cyBvZiB0aGUgYXBwbGljYXRpb24gd2hpY2ggYXJlIG5vdCBlbmFibGVkIGJ5IGRlZmF1bHQuDQoN
Ckl0IGlzIG5pY2VyIGZvciB1c2VycyB0byBiZSBhYmxlIHRvIGNoYW5nZSB0aGUgY29uZmlndXJh
dGlvbiBmcm9tIHRoZWlyIGJvYXJkIGNvbmZpZyBmaWxlIHJhdGhlciB0aGFuIG1vZGlmeWluZyB0
aGUgenlucW1wLWZpcm13YXJlIHBhY2thZ2UgZmlsZXMuDQoNCkkgd2lsbCBpbmNsdWRlIHRoaXMg
Y2hhbmdlIHdpdGggdjIuDQoNCj4gDQo+IFRob21hcw0KPiAtLSANCj4gVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCkJlc3Qg
cmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
