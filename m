Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFC8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFEF4819D1;
	Mon,  9 May 2022 06:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKrfEGII4BHk; Mon,  9 May 2022 06:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B834F8199D;
	Mon,  9 May 2022 06:23:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74F901BF284
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 716478199D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5n8FJGfNDXVR for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:23:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18B078188B
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOGPG6cI3Oi7yNLNaupDj4O5XZwrK7y0LhkK+8DCALFFFkDZ0wxhC9+dtFUezovqNZeXDY/O0d4m01nZ4CXNZ9kUxcLG5uspg1WHJJuErYnaOpVKgz8p056YDhHmOhy4z9AuaWdjG/WUPqAW+C6uN3zCYG1Goo72kPKywTglEAgJ2/nibNqvULCe7GQ6Zbkmpj5UB2VPjROtq3aY8Ig6i9Al2/FuOjjbtSKR0BP+JVxA3bfytb5WiAHQEuJjnrVWUxup7y1Mqg6uKvSVBPv84c8Er+dw2ELp2lX9i5LU2ASQcwtSxFuYs6zw7K0NWfhQ8USZt+296JQ5NwZ/Ebt/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dA1Sx/5/JSPQ/WChIVLMiJ0kSceQ0lpsWQf7vR09omA=;
 b=RYfr1VOVwnVGv3sv3pB1gYvGK7KRet4OkK4+gNKvQpubJcCtql3jZSFSh6QbgfqV8+aQHK4HnjHUR/lmnhaNycVocjt1iyKx1+IrBe8+vFawKFSQsIsjRDLPVt9prOmMhYf+gmOQBidoySgBqa6RHKCCusB2GncGQqNCHQiVY0v0iAvBwmFBYOOGDhjek9zMSX67gGWI1I2si24h28JkMhIphsWswlVtVE0/JWhNglXanzRQ2LOACIVWXUq0MbWSEBaNR0G7Wxs9CpJwIocV138FeLZp6F90RK1Mu3m4dJzwEl5N/LV2/vNmsy7/X2lfx8h+U83dLYYgCaMjjq4o7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dA1Sx/5/JSPQ/WChIVLMiJ0kSceQ0lpsWQf7vR09omA=;
 b=c0f9TaQ1cxOiYhVnNCEs9spnbr/BfEOFu//zgRk/Be2BNFBj4y+FuDlSj0o9ejhxa1/es/jLZCV8e9tL5qxsQ9PWw2YZuiDuZzjdDSWjonLqMev5XQJJUI3/zUCHvjt2vwlmjaQ3YfumMAJxMZRt0Vocz05idPg9GpK035fH/Ek=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB4860.namprd02.prod.outlook.com (2603:10b6:5:10::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 06:23:37 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 06:23:37 +0000
From: Neal Frager <nealf@xilinx.com>
To: Michal Simek <michals@xilinx.com>, Wesley Revens <wesley@sonifex.co.uk>,
 Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADXACABF8KsA==
Date: Mon, 9 May 2022 06:23:37 +0000
Message-ID: <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
In-Reply-To: <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb796517-4f70-4cc9-c5ae-08da318473a9
x-ms-traffictypediagnostic: DM6PR02MB4860:EE_
x-microsoft-antispam-prvs: <DM6PR02MB4860D472E407BDA5F7EEE327D7C69@DM6PR02MB4860.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w/dDYzqWsi99FbBMHVA+m/v/9RpIEIJi+CVBvrqs5Qy4g7uyNSs+3S7OoLaPTZCYZzJDCL5MT5Wm8aMJtY76sO5UV8uxZyqLDmPsfRbg39Cx3gYOOfwz3V2jsV8UunkzrMlvAw0N9+/P+wjEYLcGQRU0Sx8Sxw+Ytnr4kXjrZL9s9wDCVpEj+vD6oPCmnzMaedCTBAkrKVrdeSEOtBWP4+Yhxqqip3bfwqxBucmmcuU0k/2wsDyxAshQQYCdibG6nftVB9QjI7Wg8yRogQlHHO8J55yzF57qLfbLc66+/7nzgj8Y9age0zjGAimC541Rr9VEGCTiYO+VDqF9tccZkAImTUh2EZcfjxee1tx7S/AgZn6zkqcaU7QMLnqxsWqFD8G5DIRGdHqwDMV8yl0mBHtk9hD9yS4g010tnJuEbSL67SAMCQ/H2ZqZEiLKydBK98Pmyd6TjDnJh8Kw0mgteHuIXfyrsJrRFWTElLljlS5X9hx7BTgCrtP2xdD9++A/SkyGCndytW+SNLXul53g8GFKdJWiChQEJPoPxgzB48bUt8vbTI18qQDSWR3EXf9bW3p0Vo21t79pgyKwE1tI1y5ia3zmv9IZSHU1VF9IvIwtF/0iB00gjOGzsavyZlPt05XZNUWNxDAJjMEY8LAC7VKYJ28gb7bpuiC15uEC3ySgdMy5sE0zlOuTVQozJmQLLMabnl2nyITXzY7FHVuE2yPDvC81nYUhcgpiaB4HJdg/RHjrv6cI+9l02FlApfjdA/S4Y/1qWYuyy4/sIC7ndZEHhlvAVPzRWuVtcFdKi8U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(508600001)(966005)(316002)(9686003)(186003)(7696005)(86362001)(6506007)(2906002)(5660300002)(55016003)(83380400001)(122000001)(54906003)(66946007)(4326008)(66556008)(76116006)(8676002)(64756008)(66446008)(66476007)(38070700005)(38100700002)(33656002)(8936002)(52536014)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXVHSm53VktiVk9aSjk0ZzBxM09WNFBWM2d3ZGxPS0liWHgyOFVqQ1hBYzRV?=
 =?utf-8?B?enpSZWt4SzF5VlZ6ZDJyUExQMXZYc1ltSndLNHJseG81WXUwcTMrWGtzL2E2?=
 =?utf-8?B?dVVXSWYzZExzWVQ3cVh1UkZ6TWJ3S3ZDOTFTOHlLeFRhaVdsNjk5UjVnRU9r?=
 =?utf-8?B?UndGRDZld3hDNGRnb1VGbzIrV3dyM0hmYXdjeE9MYlR5UE9ZejN4bkJMa3hE?=
 =?utf-8?B?eVRGSVhZVWFBNzhkcXpIbno0S2M2a1pET2pqZ2VqWVVncjU0a1lSQmJ0K1RZ?=
 =?utf-8?B?R3lwVzlibEF4RDQ5bTN1elFRakVsN1F4ZHplOC9GWEdLNHVaT2ZoYy9IU1hk?=
 =?utf-8?B?L1p4ZS9GU1ZHV1BoMHdvUG1EeThFOFZUSFQra3BCUXFrTm10Y0RWWVBXdEVn?=
 =?utf-8?B?dUNyL2NPV0FERE0vblpPRk9PbGxKZUlnNnQ3NVUvbSt3b1puOEN1aFJQVWJ6?=
 =?utf-8?B?UllLcks3RGlieTVmU3YzLzZnVVpGY0QxRVNWbkRJNzU5c1NHRHgzZmd5aHJU?=
 =?utf-8?B?ekRKMUdmRnFPOEJwNEVTS3A1NCs1THcyMDI0dm1PU0p4ZDcwU095YytiRk4v?=
 =?utf-8?B?MFpvbkEwdkowbFJFSUZmRW5mNHphcVU4N1hmNy9qUkdNUUphU1VGZVdFT25n?=
 =?utf-8?B?dXhHa2Facjl2aW5DSmJuZ1lsUjg4cVdTcVdJcExyeWplc0hNelRlYzRpM1Rq?=
 =?utf-8?B?Q1kvN2RkWmVjNDl6YU9Rc0NiRjFTQ3FSTVpKb0NRYnNXelFrL3VrMDhJM25h?=
 =?utf-8?B?WmxHREd1YU5EWkpXTkNIS3dDdHd0dkdsOVd5ZGIxSVh6SlBDalN6aUpncVQy?=
 =?utf-8?B?REk1MjBDRUlMTERJVm1DNlFqNzNYRm1DVXFjdWxxZGFySGdLSi9XcHpLZm5S?=
 =?utf-8?B?L1FjZW1mMTNPZHVIK0FYUkJXMGdnb0YxZGNYbXhnRU9UamJwUmpQNTA0V3hJ?=
 =?utf-8?B?cEVDS2VlT25oa1VPYXJjRGQyMU9RNnhkRVhNNWZRd0FxOW13NXBwRmhhelZR?=
 =?utf-8?B?VkdHQWtZWjdYTjV2b1NkYTlEUm5NdUt2MzVkSi9qMUNhak1BNnhXV2x2a0VN?=
 =?utf-8?B?S3p0SWw4OENRell6R1ZXVmdHQnYvYU5oNVFscWxYQ2I0Si8wSE9qS3Q0L3RD?=
 =?utf-8?B?QmVNK1hSNDVYdjdzUzB3THZ1MEFxNUNwemwwc0dWZHUwdzNmR1Yzb1pBUzBG?=
 =?utf-8?B?NmhXd0grbjJvRnJubXFGZ2g4djFnaFlEaWVmL1RDZmRRb3FXUHlweU9PbWJ3?=
 =?utf-8?B?c09lWStLYVVveW9VZ29Zc0NEWm1SMVI1UDk2V0pPcjhuNW41OEU2bEVLQ3Ur?=
 =?utf-8?B?TU84MjRRdWRHdUVTbzVsNEtsbm9DVVB5cW9VK3RNUGlDclAzaXBzMXNGME5M?=
 =?utf-8?B?VzdiMzNsVDlGOGx4TnVqalpraFpVdjBPeWhXOWtKSFpYL0xzdlJaQTFyMm9P?=
 =?utf-8?B?dW1sekdmY3VUcjY1NkNvakd5YS9RWUxBNU01Y25NWFE5UlVQWGpjOHBXQVlk?=
 =?utf-8?B?azRqNCtCNzZ1RnV1ZjI1c1ovYVNzWVIySnNFUjN4dXFRYjVlSzIzWHcxellK?=
 =?utf-8?B?UVNkSTFMciswRFZkR2I2aW5WSitwYkpoZHRiZDBXVTBvN2FuV2hqU2lLc3BY?=
 =?utf-8?B?T0lzMGQrS0ttRElGMmd1em16NENUV0l3NEdxdU1EWDhsR3NqQmg0eVRyTXdu?=
 =?utf-8?B?d3Q4ZENEQytiOWZ6akdoMHFLOFZycW1qdStDcEdIUzVHQ2lKbmNVWXdwcjVn?=
 =?utf-8?B?VjFmMXEyZnRkRWtkMW5KZjNtR1hZaUpYdTVLQ3AwTjZzL05OSDhKajhuajhY?=
 =?utf-8?B?eGJtTWpDdmM0OVBkamttWGRLZ0hLUkhuWWhiLzdHTFMrbkRHTGU0OS8xazdo?=
 =?utf-8?B?R1VTazlBS3VaS2I0QURHc1NvMW9JZ0hGaGZuUXZFTTNJMWN6dU81US9zV3Ey?=
 =?utf-8?B?ZlBxODBOVm04YnFoUk5LRzZNVjQzcDJCWHU5ZG9aN0VCeFlRT3pTTC9lS3Ax?=
 =?utf-8?B?K3p1OXN3WVV6bUx0VTFQT1FINy9XRlB1ZHFNNTFraXo4MzZtOVorS0JoNExI?=
 =?utf-8?B?OGlGaEE5K1gvcXpqRWw3MjhOaXNPSE4wSWpmaXlnellzb3FrYXgyWkhBVnEr?=
 =?utf-8?B?YnhhYlNSbE5nUXY0OXRCMzNIMHQwdkl5NDN2Wk9lc0xrQ3pBSjBUSEVXYVlv?=
 =?utf-8?B?WFR4bGtKWVdNOWx0Z0wrb0Mza25YR3dyakd6aDRteFVQV09JSEdlQWdBQk9W?=
 =?utf-8?B?MzNxU2NhU0d0TlBEQm11K0o0MXRQWXZyL0c3WDd6bWR3anloa3FKOFRDWWRy?=
 =?utf-8?B?MGJsSVJPUyt1TjdjNDlBczUxTncwZ3VaR094UTlnUEVKYnpOdHlHWmdMMlhy?=
 =?utf-8?Q?DWxp6BaxYF3VOY9ttM9/NAZmf3rGZ5w70fh9M?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb796517-4f70-4cc9-c5ae-08da318473a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 06:23:37.1827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cNnDJVSz0Wu8jXWYq+TWxVSHChYuxOMYvb50tvT9ieVg7y/+wFfTu1YQIJ/Pkv91n5T/3ARrLLViA2XPFDfkpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4860
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFsLA0KDQo+IA0KPiBIaSBOZWFsLA0KPiANCj4gSSBoYXZlIGJlZW4gd29ya2luZyBv
biBhIEJ1aWxkcm9vdCBpbWFnZSBmb3IgdGhlIEtyaWEgcmVjZW50bHkgc28gbXkgDQo+IGNvbXBh
bnkgY2FuIGV2YWx1YXRlIHRoZSBLMjYgU09NLg0KPiBJIHJlYWNoZWQgYSBzaW1pbGFyIHBvc2l0
aW9uIHRvIHdoYXQgaGFzIGJlZW4gaW5jbHVkZWQgaW4geW91ciBwYXRjaCANCj4gaG93ZXZlciBJ
IGhhdmUgbm90IGJlZW4gYWJsZSB0byBnZXQgdGhlIEtyaWEgdG8gYm9vdCB1c2luZyB0aGUgVS1C
b290IA0KPiBTUEwuDQo+IA0KPiBJIGhhdmUgdHJpZWQgb3V0IHlvdXIgcGF0Y2ggYW5kIGZvdW5k
IHRoYXQgdGhlIExpbnV4IGtlcm5lbCBpcyBib290aW5nIA0KPiBmaW5lIGZyb20gdGhlIFNEIGNh
cmQgdXNpbmcgdGhlIHByZS1wcm9ncmFtbWVkIGJvb3QuYmluIHRoYXQgaXMgDQo+IGFscmVhZHkg
cHJlc2VudCBvbiB0aGUgS3JpYS4NCj4gSG93ZXZlciwgYWZ0ZXIgYnVpbGRpbmcgdXNpbmcgeW91
ciBwYXRjaCwgSSB0cmllZCB1cGxvYWRpbmcgdGhlIA0KPiBib290LmJpbiB0aGF0IGFwcGVhcnMg
aW4gYnVpbGRyb290L291dHB1dC9pbWFnZXMgdG8gbXkgS3JpYSB1c2luZyB0aGUgDQo+ICJCb290
IEltYWdlIFJlY292ZXJ5IFRvb2wiIHdlYiBVSSB0aGF0IHJ1bnMgb24gdGhlIEtyaWEgaWYgeW91
IGhvbGQgDQo+IGRvd24gdGhlIEZXVUVOIGJ1dHRvbiBkdXJpbmcgcmVzZXQgb2YgdGhlIGJvYXJk
LiBPbiBib290LCBJIHRoZW4gZ2V0IA0KPiB0aGUgZm9sbG93aW5nIG91dHB1dCBmcm9tIFUtQm9v
dCBTUEw6DQo+IA0KPiBVLUJvb3QgU1BMIDIwMjIuMDEgKE1heSAwNiAyMDIyIC0gMTE6MjE6NTUg
KzAxMDApDQo+IFBNVUZXOsKgIHYxLjENCj4gTG9hZGluZyBuZXcgUE1VRlcgY2ZnIG9iaiAoMjAx
NiBieXRlcykgU2lsaWNvbiB2ZXJzaW9uOsKgwqDCoMKgwqDCoMKgIDMgRUwgDQo+IExldmVsOsKg
wqDCoMKgwqDCoCBFTDMgQ2hpcCBJRDrCoMKgwqDCoMKgwqDCoCB4Y2syNg0KPiBNdWx0aWJvb3Q6
wqDCoMKgwqDCoCA2NA0KPiBUcnlpbmcgdG8gYm9vdCBmcm9tIFNQSQ0KPiANCj4gVGhlbiBub3Ro
aW5nIGVsc2UgaGFwcGVucy4NCj4gDQo+IFRoZXJlIGlzIGEgYmlnIGRpZmZlcmVuY2UgaW4gdGhl
IGZpbGUgc2l6ZXMgZm9yIHRoZSBib290LmJpbiBmcm9tIA0KPiBidWlsZHJvb3Qvb3V0cHV0L2lt
YWdlcyBhbmQgdGhlIEJPT1QuQklOIEkgZG93bmxvYWRlZCBmcm9tIA0KPiBodHRwczovL3hpbGlu
eC13aWtpLmF0bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvQS9wYWdlcy8xNjQxMTUyNTEzL0tyaWEr
DQo+IEsyNitTT00jQm9vdC1GaXJtd2FyZS1VcGRhdGVzDQo+IA0KPiBzbyBJIGFtIG9idmlvdXNs
eSBtaXNzaW5nIHNvbWV0aGluZyBzb21ld2hlcmUuIEkgdGhpbmsgYWxsIHRoZSANCj4gY29tcG9u
ZW50cyBhcmUgYmVpbmcgYnVpbHQgYnV0IEknbSBub3Qgc3VyZSB0aGV5IGFyZSBiZWluZyBwYWNr
YWdlZCBpbiANCj4gYSBzaW1pbGFyIHdheSB0byBob3cgdGhlIHByZS1sb2FkZWQgYm9vdC5iaW4g
aXMgbGFpZCBvdXQgKG9yIEkgYW0gDQo+IHVzaW5nIHRoZSB3cm9uZyBvdXRwdXQgZmlsZSEpDQo+
IA0KPiBJbiBteSBvd24gdGVzdGluZyBJIHdhcyBhYmxlIHRvIHRlc3QgdGhlIHUtYm9vdC5pbWcg
cHJvZHVjZWQgYnkgbXkgDQo+IEJ1aWxkcm9vdCBidWlsZCBidXQgSSBoYWQgdG8gdXNlIHRoZSBY
aWxpbnggYm9vdGdlbiB0b29scyBhbmQgdXNlIHRoZSANCj4gWGlsaW54IGZzYmwgcmF0aGVyIHRo
YW4gdGhlIFUtQm9vdCBTUEwuDQo+IA0KPiBJbiBmdXR1cmUsIHdlIHdvdWxkIGxpa2UgdG8gYmUg
YWJsZSB0byBieXBhc3MgdGhpcyBzdGVwIGFuZCBqdXN0IHVzZSANCj4gd2hhdGV2ZXIgQnVpbGRy
b290IHByb2R1Y2VzLg0KPiBJIHdhcyB3b25kZXJpbmcgaWYgeW91IGNvdWxkIHBvaW50IG1lIGlu
IHRoZSByaWdodCBkaXJlY3Rpb24uDQoNCj4gTm90IHF1aXRlIHN1cmUgd2hhdCBOZWlsIGlzIHVz
aW5nIGJ1dCBvZiBjb3Vyc2UgeW91IGNhbiB1c2UgU1BMIHdpdGggS3JpYSBTT00gYW5kIEkgYW0g
dXNpbmcgaXQgb24gZGFpbHkgYmFzaXMuDQo+IEl0IHJlYWxseSBkZXBlbmRzIHdoYXQgZXhhY3Rs
eSB5b3Ugd2FudCBkbyBhbmQgZG8gc29tZSBhbGlnbm1lbnRzIHRvIHUtYm9vdCBjb25maWcuDQo+
IExldCdzIGFzc3VtZSB5b3UgaGF2ZSBzdGFydGVyIGtpdCB3aXRoIHByZWluc3RhbGxlZCBBL0Ig
dXBkYXRlcyB5b3UgbmVlZCB0byBzYXkgaWYgeW91IHdhbnQgdG8gaGF2ZSB0aGlzIGZ1bmN0aW9u
YWxpdHkgb3Igbm90Lg0KPiBJIHBlcnNvbmFsbHkgZGlkbid0IHRyeSB0byB1c2UgQS9CIHdpdGgg
U1BMIGFuZCB1c2luZyBwYXJ0aXRpb24gZm9yIGltYWdlIEEgZm9yIGJvb3QuYmluIChTUEwgb25s
eSkgYW5kIHBhcnRpdGlvbiBCIGZvciBpbWFnZS5pdGIuDQo+IFRoYXQgYmVpbmcgc2FpZCB5b3Ug
bmVlZCB0byB0ZWxsIFNQTCB3aGVyZSB1LWJvb3QuaXRiIGlzIHBsYWNlZCBpbiBRU1BJLg0KDQo+
IEl0IG1lYW5zIHlvdSBuZWVkIHRvIHNldHVwIENPTkZJR19TWVNfU1BJX1VfQk9PVF9PRkZTPTB4
RjgwMDAwIGFzIG9mZnNldCB0byBwbGFjZSBpbWFnZSB0byB0aGlzIGxvY2F0aW9uLg0KDQo+IElm
IHlvdSB1c2UgdXBkYXRlIHV0aWxpdHkgdGhlbiB3cml0ZSB1LWJvb3QuaXRiICh5b3UgbmVlZCB0
byByZW5hbWUgaXQgYmVjYXVzZSBndWkgZXhwZWN0cyAqLmJpbiBmaWxlbmFtZSkgZmlyc3QgdG8g
aW1hZ2VCIGFuZCB0aGVuIGJvb3QuYmluIHRvIEltYWdlIEEuDQoNCj4gQ29tcGFyZSB0byB0aGUg
bGF0ZXN0IHVwc3RyZWFtIHZlcnNpb24geW91IG5lZWQgZW5hYmxlIHNvbWUgY29uZmlncy4NCj4g
Q09ORklHX0RFRkFVTFRfREVWSUNFX1RSRUU9Inp5bnFtcC1zbWstazI2LXJldkEiDQo+IENPTkZJ
R19FTlZfU0laRT0weDQwMDAwDQo+IENPTkZJR19TWVNfU1BJX1VfQk9PVF9PRkZTPTB4RjgwMDAw
DQoNClRoZXNlIGNvbmZpZ3MgYXJlIGNsZWFyIGFuZCBzcGVjaWZpYyB0byB0aGUgS3JpYSBTT00u
DQoNCj4gQ09ORklHX0RUQl9SRVNFTEVDVD15DQo+IENPTkZJR19NVUxUSV9EVEJfRklUPXkNCj4g
Q09ORklHX0VOVl9JU19OT1dIRVJFPXkgKG9ubHkpDQo+IENPTkZJR19VU0VfREVGQVVMVF9FTlZf
RklMRT15DQo+IENPTkZJR19ERUZBVUxUX0VOVl9GSUxFPSJ2YXJzIg0KPiBDT05GSUdfRE1BPXkN
Cj4gQ09ORklHX1hJTElOWF9EUERNQT15DQo+IENPTkZJR19QSFk9eQ0KPiBDT05GSUdfUEhZX1hJ
TElOWF9aWU5RTVA9eQ0KPiBDT05GSUdfUElOQ1RSTD15DQo+IENPTkZJR19QSU5DT05GPXkNCj4g
Q09ORklHX1BPV0VSX0RPTUFJTj15DQo+IENPTkZJR19aWU5RTVBfUE9XRVJfRE9NQUlOPXkNCj4g
Q09ORklHX0RNX1JFU0VUPXkNCj4gQ09ORklHX1JFU0VUX1pZTlFNUD15DQo+IENPTkZJR19WSURF
T19aWU5RTVBfRFBTVUI9eQ0KDQpUaGVzZSBjb25maWdzIGRvIG5vdCBhcHBlYXIgc3BlY2lmaWMg
dG8gS3JpYS4gIFNob3VsZCB3ZSBiZSB1c2luZyB0aGVtIGZvciBvdGhlciB6eW5xbXAgYm9hcmRz
IGFzIHdlbGw/DQpTdWNoIGFzIHRoZSB6Y3UxMDIgYW5kIHpjdTEwNj8NCg0KV2UgYXJlIGN1cnJl
bnRseSBqdXN0IHVzaW5nIHRoZSB4aWxpbnhfenlucW1wX3ZpcnRfZGVmY29uZmlnIHdpdGggdGhl
IENPTkZJR19ERUZBVUxUX0RFVklDRV9UUkVFDQpmb3IgZWFjaCBpbmRpdmlkdWFsIGJvYXJkLiAg
SXMgdGhpcyBzdWZmaWNpZW50IGZvciB0aGUgemN1MTAyIGFuZCB6Y3UxMDYgYm9hcmRzPw0KDQpC
ZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1EDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
