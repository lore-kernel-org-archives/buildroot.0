Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629C8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 01:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E4D40297;
	Wed,  6 Apr 2022 01:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXCJfvQIgux5; Wed,  6 Apr 2022 01:58:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36DF040286;
	Wed,  6 Apr 2022 01:58:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 097F01BF255
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 01:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E73C6823E0
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 01:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UTmWxwmyNBY for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 01:58:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B481823CF
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 01:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWOy99lvC/iBJ2K3FHMd0DnmKQh8KmsByVZRMokDyVz5+KnI5AeCi5UM71Al6dFBlAEz2Eh7kOrzqysHnr4rcWW76jxOn131fvHVSiMZywL+o9qwPxlbwwocnSrEiOVUF+dnm4+7WsWe+vtMrGnYYi8+mTn+9TRZDSuDF8Te2U2CNcomgDZq6xksFp+mTAxhCweKtcNT7TD6eeRG99hd36+ASNbhUKVmTLqC63n+EgDbZ3NMy1wBsotAo+SAMlSRmATG74a38LhHXa5rqe5cxNMxDMyDy38gAZ+gCBHdzsYOgt8Vimdx+FnszxoCc93M3wlTri0vELN++k5czxlE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysuM4TSaNCsSzgZ9kLnOXltXHFcfdc3S0/Q4oeL3lRU=;
 b=e8+KBvWvGOK2oVAEH+QrcigCTWQB499Kl07RcwyzqsuROKyS8XwRNxoKDOxBzBQBqhuDcankZcyhAeptb4a9IKyUSIzQrBwZNqcKpA3lktgUOJvspLaT1cCo+IRMByzj7Xjh1Svp8eK6L9xD3688xxBXf0EWnuJ6HnnJ4l596iT99eNUr1qkG7z2aBgh8CDCJj77aKilt89LJheF5hqLbbsnXmsZQepf2vrTsqKgWF21WDfGnlKLrQIk9HPPC3BUSH9JqjHramOBOqVJSoXr9/oy5aXbK0YP2xi1hZEbqIxVHCjLcXU0Ei3kEaJGWzcJhY75rJuN4QsUZ7n3sNsJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysuM4TSaNCsSzgZ9kLnOXltXHFcfdc3S0/Q4oeL3lRU=;
 b=aNvqCF8ffGSxQD+NZQ7dTjFyQIaTiCGSSomTWcVIO6Cn1jeB7LP/S2yYg6zpdAjMyT6Y73ce/vSJL+K9b36k8IAKNJkP3FYmecLnvwrLq5//Rw4ZZK2tl3dddXTZfr0a+/2CqXcv6K+U/hiR6fEeCEs1JCERdmlVwOFOGl6Bc5k=
Received: from GV1P251MB0771.EURP251.PROD.OUTLOOK.COM (2603:10a6:150:63::6) by
 DU0P251MB0963.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3e3::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.30; Wed, 6 Apr 2022 01:58:11 +0000
Received: from GV1P251MB0771.EURP251.PROD.OUTLOOK.COM
 ([fe80::5d30:a209:8487:8cf5]) by GV1P251MB0771.EURP251.PROD.OUTLOOK.COM
 ([fe80::5d30:a209:8487:8cf5%5]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 01:58:11 +0000
From: Tim Hammer <Tim.Hammer@orolia.com>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYSLVQ1NO7vzXZKUeYGkY5EMcBFKzhOUPggABG04CAAJ+9cA==
Date: Wed, 6 Apr 2022 01:58:11 +0000
Message-ID: <GV1P251MB0771B70C2179F1A7FEFD76FBE3E79@GV1P251MB0771.EURP251.PROD.OUTLOOK.COM>
References: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
 <DU0P251MB07793F7BF68D17755B50F5F1E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <20220405181815.5dd6d85e@gmx.net>
In-Reply-To: <20220405181815.5dd6d85e@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c882c4ff-babd-4a55-101a-08da1770e79f
x-ms-traffictypediagnostic: DU0P251MB0963:EE_
x-microsoft-antispam-prvs: <DU0P251MB096379881B302BD9582D61FFE3E79@DU0P251MB0963.EURP251.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IRkXm73pmgw9k8zO0+mwo9HDgHqVHy606B6GNnSkiB1EQ5jn5OPmrJ02H2cHiuU09mnkPBCWp1UQxfCog8ODOsbxRQtijSDUt8LXKh53yzwQJqlIhQ18tM4V8ouzg1dd9iS05anhR7aOBczReLh45HvoF3DktABfX58sqioanbJz8+v8vtAXFyEhkgk1PYgIYw6Uk6BNpdYO0EdLt/EaH8IGdsqAvNv0cr+1XXxN3p5l+9izxTRKxvYI7YUNambsocMM+qtwqZmmBBZsynRtqwBXGQQNuktzUtk+aMk+3Rg7GNjsPeY9x10T5U7NBT1hjettFXyduAbX1XaKaa5bHMnDUHxcXZNpLt4FJi3Xdy0NdY+5RpNG3rOfnYhYN3Ojojiw7O8D1lqXVg2PnBH/Dqe58ii99ZMifuQeAJ5vw1M4I3cbBgHraptfflPkd7nsev67EQeqm3LEs3c/2UCh734ImIpnUEI6OkEoz9t+Gr5U1wxk4B15E1m91FUfjZC5nUQCeEw0Ne284/p05Bklw64HW0AdSIEprqZF+Efjpx+8y+GmSI9J7DY8+vD6auOwlqFyOyyBU2z3WIu2kvL7ETX1JBUziVazQvTaCydZjXskO6JmUE/AhhDTzZIHBChtnstG5CWnm0Mkl57qfdCs4/EgWhUU1HRCoyh33lcbzRR3/93aHLo+ny+qqF99Ii8sUcueQzXvpU5Lwj1fwWLnghLpVts6pcsk5hsP0Q7ilmj76xZTgfu9xzUsuzLX0n+Wx2YJqGPrJgJduqJOQ68MmPD/VcbqGZ1o7nJEIPSfycE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1P251MB0771.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(8936002)(5660300002)(38100700002)(122000001)(2906002)(7696005)(6506007)(966005)(38070700005)(186003)(71200400001)(508600001)(55016003)(52536014)(83380400001)(66574015)(66446008)(33656002)(76116006)(6916009)(66946007)(66476007)(66556008)(64756008)(316002)(54906003)(8676002)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clA2bGkyWDg1eCtTVkM1ODU0dkpUVzlwYnEwcDBXeENTQUhhRldJa09CQ3cy?=
 =?utf-8?B?WGo4ZkdKRHFuSytZdUwzYzBlZDU2R24xMjlvaGtPMHNTcG13d0owaE9wTFVM?=
 =?utf-8?B?cXJwbVYwYzJKc0NzTEtrUWJValRYUHptOVhhem5FUko2elhCamVzUk03VThH?=
 =?utf-8?B?eDkwNUkzYTd1QWxRdEFPV0JHZWhlUFBKb05jV3dEWndrdUtTbXpNTHhSOERB?=
 =?utf-8?B?VTc0MXNIR1NTV1BSeStERDdIMHQ2SUpwUjJkeWhKUlFvQjI0dmtXcVJkdmZQ?=
 =?utf-8?B?L0cvVzJNSVBuUERYeVlpTHRTRW1HY25hNFBlc2lDbEN1bFNOYkx4RnFRMnp1?=
 =?utf-8?B?S2tlWUJZNyswVldIU3ArWThVTDJxVit6YVYxc0REb0hpN2lEdDlUeUQ0SDVQ?=
 =?utf-8?B?MGVSaEdGam1NMkRUMHhBelJ6dWloU0wzUkM3WnVBMlFveVVvL0JWS0NpcVVJ?=
 =?utf-8?B?S01kamkvMjlsMEErZ2lSU1Q1enhOSTVBdkgvWXQ2SUx2NlJ0ZGlEUDJ6bHkz?=
 =?utf-8?B?U2JKUzZjVGoyeGk2ZXZFd0h0OXdPQ1NLUTFzek9zUHFqa3FBUEJzSlNHZmhR?=
 =?utf-8?B?NVpXVVEzQXhvK2c5TnVQUlh5Q1NkUVp5bU9OQTR3SVM2L1hCSENITENUd0Vw?=
 =?utf-8?B?ajR1YzYwNE9nQVRJckE4RDdTVitocXlXeERXOThaNmhGN3U1Nnh3ekF4Rjk2?=
 =?utf-8?B?NVI3WjN2UHcxM01WRDlhUDU4ZTBqTkJEYnFHNmxOTWVlbXJ5K3lRN1B4QkUx?=
 =?utf-8?B?a0Z0aloxOTFpZzNBbCtiaDhJR2xWeGRGcU9NQUV5VEw0Ujg1d2VrVThLTk84?=
 =?utf-8?B?SlBSNGNWdFlibmlROFVJbW1HK1BqV2YwVzU4dm5kMmo0SUF3a0MrcTF2TXNj?=
 =?utf-8?B?dzd1RFlIWkxqYjl3RlJkRU9HblVIY0c0UDFhQkVrRm02ZDJLc0pVbytaSGVX?=
 =?utf-8?B?RGlOQ3VIS3hPSmVKSTBpazFsSG5YM1J0UzU1TlBDeWlIMTNwZXVqREhvQlBD?=
 =?utf-8?B?QmhYRTdkUzR4a2txRnFZL0VyY3I2ZytPNlkzYVpKdUdoTXVad3F5cmZRRlBH?=
 =?utf-8?B?aGhGNS9HSUk5NnNpdWQ5Q3NQdi9NS3pOeXBFT25qL1Bmc1BKNnRZTEVENWFn?=
 =?utf-8?B?R2puTUg5c2tDOUdJajZkMVZIZmU0UVBFazk1cnNKelllTkF2Rm1sS0JGL2J2?=
 =?utf-8?B?cVNrZDhEbU5ZTTAycUJpWnVJZ09oRURxUmF5Y0pUMXdQQU95MUdjYkpvWk5X?=
 =?utf-8?B?NkRsaDNBdTdYSGlLemFha0R4L2ozVUxoaVFyWmFKWGRBNXAyUGxjL3BSZzVU?=
 =?utf-8?B?YXlhYmFxZUhTdHpFNUlJTW1Fc3dXTUhKNnhWbGtCVTRhWkdMNEN0aFl5eHFQ?=
 =?utf-8?B?NSt5WDNuUlA5ZEMzOWxxSVNjU0wxSEpsY3VndVA4TnJQREl1b1BYWjZPUkZr?=
 =?utf-8?B?eWlQRy9oRDA3NnJZbTB2eWVUcjc0cHozRzhQQ2dRY3hPRjAwWUZxRVNITXNS?=
 =?utf-8?B?M2xEdTV6YXNYRWlIUFBlQk93dDhkWWNkMlMyeEdIb0xOUFJkZytVVUpQVXBo?=
 =?utf-8?B?akFteDJ6N1dGbjg3R2ZIU3FIQnU2NjJtQ2xveldRVkprMVV2VEFmOUxLTjRN?=
 =?utf-8?B?YXpFbk9EckxqbnJDTmpJQ2tmK2g0dGJGbE5OaXpPZ3o3OUo2UElEVEsyNDA1?=
 =?utf-8?B?S21aWjc1Y3NMWHl1c3FLRjlqdHV3K21FMVBoeDhONTdUVk15ajJ2UEFXSUtq?=
 =?utf-8?B?QW5wVnBLdWlYbS9RdVYzNi9wSXBBdG1QVk00WVFRNjZpVzQwNWxWdDJKZnBo?=
 =?utf-8?B?ZFU5SGg1MjFicWFKQVBIcE9jVHR1ZmcvMWpzSGlPbzh0MFZKWVQ4UXdlVmNw?=
 =?utf-8?B?RVo2Qklja0ZlV0NRUHgzcDkweDFlWTZ6ZXNYVE5qWHpiTjFydDJocTBjb0dE?=
 =?utf-8?B?K3N6M0l3MVpzaHZDbkdmS2xDT1Nlb2VNME1SdGp5TUNPS0ZxN2FLZmZ0MUxR?=
 =?utf-8?B?R2l2T2tYL254Z2RiaTNHSjFzTW44c0tYakhuenpJM1RYaG5QY21OaXpjMEti?=
 =?utf-8?B?OFV1L05CQkpMcDBKUkpqRHpSVlMxVHVINHphMmU3dXBESjJ0WldaKzBqb3dU?=
 =?utf-8?B?NkF4S2J2UHdveVhwbENaY3pmSHVKWWpTai82ek1MRUoyWWtQK0E0b3FDMmZJ?=
 =?utf-8?B?T1l2S21aUFlNZ09odUZSZGtZNDQ4THVoVzBVZEVQR2ZhcldIYi82WGpUUExo?=
 =?utf-8?B?WEZ0aDNKK081S24yb2QwaTNmVTBpSExwOVVBQksvbzZNS29PR0t3V2dYQlVG?=
 =?utf-8?B?emNOQ0x6YzRpY0VCSWgyNEJUdFhkbUs1VDZxSk5ialpCWi9DbjdWVmtkeUk0?=
 =?utf-8?Q?7Wnpr0IZBeskQt+/uVXvLGyBdNyF1z0gPqbRUNYaMJxlz?=
x-ms-exchange-antispam-messagedata-1: nVegF4dYnj0mNw==
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1P251MB0771.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c882c4ff-babd-4a55-101a-08da1770e79f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 01:58:11.4053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /RdCHFBpmInKuVlk38W78yYkD9DEpA2Tb5rzqAzrt1+bl/0B9neAwunnxEvKYNlnci5CbC+u75bEo5etWvflBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0963
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBcHIgMDUsIDIwMjIgYXQgMDY6MTg6MTVQTSArMDIwMCwgUGV0ZXIgU2VpZGVyZXIg
d3JvdGU6DQo+IEhlbGxvIFRpbSwNCj4gDQo+IE9uIFR1ZSwgNSBBcHIgMjAyMiAxMjoxNToxNCAr
MDAwMCwgVGltIEhhbW1lciA8VGltLkhhbW1lckBvcm9saWEuY29tPiB3cm90ZToNCj4gDQo+ID4g
T24gVHVlLCBBcHIgMDUsIDIwMjIgYXQgMDg6MTk6MDhBTSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSB3cm90ZToNCj4gPiA+IERlYXIgVGltLA0KPiA+ID4gDQo+ID4gPiBMZSBtYXIuIDUgYXZyLiAy
MDIyIMOgIDA1OjU0LCBUaW0gSGFtbWVyIDxUaW0uSGFtbWVyQG9yb2xpYS5jb20+IGEgw6ljcml0
IDogIA0KPiA+ID4gPg0KPiA+ID4gPiBPbiBTdW4sIEFwciAwMywgMjAyMiBhdCAxMjowMzoxOFBN
ICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOiAgDQo+ID4gPiA+ID4gVXNlIGludGVybmFs
IGJpbmQgYXMgZGhjcCBkb2Vzbid0IGJ1aWxkIHNpbmNlIGJ1bXAgb2YgYmluZCB0byB2ZXJzaW9u
DQo+ID4gPiA+ID4gOS4xNi4yNiBpbiBjb21taXQgOGFkZWFlYzhhZmFjYmM2ODBlZGViYWU5MTUy
NGY2MTQ0OTI2YWM5MiBhbmQgdXBzdHJlYW0NCj4gPiA+ID4gPiBkb2Vzbid0IHBsYW4gdG8gZml4
IGl0IGFueSB0aW1lIHNvb246DQo+ID4gPiA+ID4gaHR0cHM6Ly9naXRsYWIuaXNjLm9yZy9pc2Mt
cHJvamVjdHMvZGhjcC8tL2lzc3Vlcy8yMzMjbm90ZV8yNzY4ODMNCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlcy9kaGNwZC5oOjkxLA0KPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgZnJvbSBjdHJhY2UuYzoyOToNCj4gPiA+ID4gPiAuLi9pbmNs
dWRlcy9vbWFwaXAvaXNjbGliLmg6NTE6MTA6IGZhdGFsIGVycm9yOiBpc2MvYm9vbGVhbi5oOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ID4gPiA+ID4gICAgNTEgfCAjaW5jbHVkZSA8aXNj
L2Jvb2xlYW4uaD4NCj4gPiA+ID4gPiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gICAuLi4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAjIHVzZSBs
aWJ0b29sLWVuYWJsZWQgY29uZmlndXJlLmFjDQo+ID4gPiA+ID4gIGRlZmluZSBESENQX0xJQlRP
T0xfQVVUT1JFQ09ORg0KPiA+ID4gPiA+IEBAIC0yMSwxMSArMjMsMTIgQEAgREhDUF9DT05GX0VO
ViA9IFwNCj4gPiA+ID4gPiAgICAgICBDUFBGTEFHUz0nLURfUEFUSF9ESENQRF9DT05GPVwiL2V0
Yy9kaGNwL2RoY3BkLmNvbmZcIiBcDQo+ID4gPiA+ID4gICAgICAgICAgICAgICAtRF9QQVRIX0RI
Q0xJRU5UX0NPTkY9XCIvZXRjL2RoY3AvZGhjbGllbnQuY29uZlwiJyBcDQo+ID4gPiA+ID4gICAg
ICAgQ0ZMQUdTPSckKFRBUkdFVF9DRkxBR1MpIC1ESVNDX0NIRUNLX05PTkU9MScNCj4gPiA+ID4g
PiArREhDUF9CSU5EX0VYVFJBX0NPTkZJRyA9IEJVSUxEX0NDPSckKFRBUkdFVF9DQyknDQo+ID4g
PiA+ID4gIA0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgb25seSBwbGFjZSBCVUlMRF9DQyBpcyB1c2Vk
IGluIHRoZSBidW5kbGVkIGJpbmQtOS4xMSBpcyB0byBidWlsZCBsaWIvZG5zL2dlbiwgd2hpY2gg
bmVlZHMgdG8gcnVuIG9uIHRoZSBob3N0Lg0KPiA+ID4gPiBTbyB0aGlzIHNob3VsZCBiZSB0aGUg
aG9zdCBjb21waWxlciwgbm90IHRoZSB0YXJnZXQuDQo+ID4gPiA+IEkgZG8gbm90IGtub3cgdGhl
IGJlc3QvY29ycmVjdCB3YXkgdG8gaW5kaWNhdGUgdGhpcy4gVG8gZ2V0IHBhc3QgdGhlIGlzc3Vl
IEkgY2hhbmdlZCBpdCB0byAnL3Vzci9iaW4vZ2NjJy4uLiAgDQo+ID4gPiANCj4gPiA+IFRoYW5r
cyBmb3Igc3BvdHRpbmcgdGhpcywgSSBiYXNpY2FsbHkgY29weS9wYXN0ZWQgd2hhdCB3YXMgZG9u
ZSBpbiBiaW5kLm1rLg0KPiA+ID4gVGhlIGNvcnJlY3Qgd2F5IHRvIGRvIHRoaXMgaXMgdG8gdXNl
ICQoSE9TVF9DQykgaW5zdGVhZCBvZiAkKFRBUkdFVF9DQykuDQo+ID4gPiAgIA0KPiA+IA0KPiA+
IFRoaXMgaXMgd2h5IEkgc2FpZCBJIGRvIG5vdCBrbm93IHRoZSBjb3JyZWN0IHdheS0gd2hlbiBJ
IHVzZSAkKEhPU1RfQ0MpLCBJIGdldA0KPiA+ICAgICAgPj4+IGRoY3AgNC40LjItUDEgQnVpbGRp
bmcgIA0KPiA+ICAgICAgUEFUSD0iL2hvbWUvdGhhbW1lci9QdWJsaWMvYnVpbGRyb290L1RFU1Qv
aG9zdC9iaW46L2hvbWUvdGhhbW1lci9QdWJsaWMvYnVpbGRyb290L1RFU1QvaG9zdC9zYmluOi9o
b21lL3RoYW1tZXIvLmxvY2FsL2JpbjovaG9tZS90aGFtbWVyL2JpbjovdXNyL2xvY2FsL3NiaW46
L3Vzci9sb2NhbC9iaW46L3Vzci9zYmluOi91c3IvYmluOi9zYmluOi9iaW46L3Vzci9nYW1lczov
dXNyL2xvY2FsL2dhbWVzOi9zbmFwL2Jpbjovb3B0L2FsdGVyYS9uaW9zMmVkcy9iaW4vZ251L0gt
eDg2XzY0LXBjLWxpbnV4LWdudS9iaW46L29wdC9hbHRlcmEvbmlvczJlZHMvc2RrMi9iaW46L29w
dC9hbHRlcmEvbmlvczJlZHMvYmluOi9vcHQvYWx0ZXJhL3F1YXJ0dXMvYmluOi9vcHQvYWx0ZXJh
L3F1YXJ0dXMvc29wY19idWlsZGVyL2JpbiIgIC91c3IvYmluL21ha2UgLWoxICAtQyAvaG9tZS90
aGFtbWVyL1B1YmxpYy9idWlsZHJvb3QvVEVTVC9idWlsZC9kaGNwLTQuNC4yLVAxLw0KPiA+ICAg
ICAgTWFraW5nIGFsbCBpbiAuL2JpbmQNCj4gPiAgICAgIENvbmZpZ3VyaW5nIEJJTkQgbGlicmFy
aWVzIGZvciBESENQLg0KPiA+ICAgICAgY29uZmlndXJlOiBXQVJOSU5HOiB1c2luZyBjcm9zcyB0
b29scyBub3QgcHJlZml4ZWQgd2l0aCBob3N0IHRyaXBsZXQNCj4gPiAgICAgIGNvbmZpZ3VyZTog
ZXJyb3I6IEJVSUxEX0NDIG5vdCBzZXQNCj4gPiAgICAgIG1ha2VbM106ICoqKiBbTWFrZWZpbGU6
NDI6IGJpbmQxXSBFcnJvciAxDQo+ID4gDQo+ID4gDQo+ID4gPiBIb3dldmVyLCBJIGFzc3VtZSB0
aGF0IEJVSUxEX0NDIGFuZCBCVUlMRF9DRkxBR1MgaW4gYmluZC5tayBzaG91bGQNCj4gPiA+IGFs
c28gYmUgdXBkYXRlZD8gIA0KPiA+IA0KPiA+IEkgZG8gbm90IGhhdmUgdGhlIGlzc3VlIGJ1aWxk
aW5nIGJpbmQgKDkuMTYuMjYpLCB0aGVyZSBsaWIvZG5zL01ha2VmaWxlLmluIHNlZW1zIHRvIGJl
IGJldHRlciB3cml0dGVuOg0KPiA+IA0KPiA+ICAgICAgZ2VuOiBnZW4uYw0KPiA+IAkke0hPU1RD
Q30gJHtIT1NUX0NGTEFHU30gLUkke3RvcF9zcmNkaXJ9L2xpYi9pc2MvaW5jbHVkZSBcDQo+ID4g
CSR7SE9TVF9MREZMQUdTfSAtbyAkQCAke3NyY2Rpcn0vZ2VuLmMNCj4gPiANCj4gPiBQZXJoYXBz
IHdlIHNob3VsZCBiZSBwYXRjaGluZyB0aGF0IGZpbGUgaW5zdGVhZCBvZiB0aGUgY29uZmlnPw0K
PiANCj4gU2VlIGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3RyZWUvcGFja2Fn
ZS9iaW5kLzAwMDEtY3Jvc3MucGF0Y2gNCj4gDQo+IFJlZ2FyZHMsDQo+IFBldGVyDQo+IA0KDQpZ
ZXMsIHRoYXQgcmVpbmZvcmNlcyBteSB0aGlua2luZy4gVW5mb3J0dW5hdGVseSwgdGhlIGJ1bmRs
ZWQgYmluZCBpcyBub3QgdW56aXBwZWQgdW50aWwgdGhlIGJ1aWxkIHN0ZXANCmFuZCBJIGhhdmUg
bm90IGZpZ3VyZWQgb3V0IGEgZ29vZCB3YXkgdG8gZ2V0IHRoaXMgZGlmZiBpbiBwbGFjZS4NClBl
cmhhcHMgc29tZW9uZSB3aXRoIG1vcmUgZXhwZXJpZW5jZSBjYW4gc2VlIHRoZSBzb2x1dGlvbiB0
aGF0IGlzIGVsdWRpbmcgbWU/DQoNCi5UaW0NClRpbSBELiBIYW1tZXINCnRpbS5oYW1tZXJAb3Jv
bGlhLmNvbQ0KDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBDb3VsZCB5b3Ugc2VuZCB0aG9zZSB0
d28gcGF0Y2hlcyAoZGhjcCBhbmQgYmluZCkgdG8gdGhlIGJ1aWxkcm9vdA0KPiA+ID4gbWFpbGlu
ZyBvciBkbyB5b3UgcHJlZmVyIHRoYXQgSSBzZW5kIHRoZW0/DQo+ID4gPiAgIA0KPiA+IA0KPiA+
IEkgY2FuIHRyeSBvdXQgbXkgb3RoZXIgdGhvdWdodCBhbmQgc2VuZCB0aGF0IGluIGEgd2hpbGUg
KGlmIGl0IHNlZW1zIHRvIHdvcmspLg0KPiA+IA0KPiA+ID4gPiAuLi4NCj4gPiA+ID4gIA0KPiA+
ID4gDQo+ID4gPiBCZXN0IFJlZ2FyZHMsDQo+ID4gPiBGYWJyaWNlICANCj4gPiANCj4gPiAuVGlt
DQo+ID4gVGltIEQuIEhhbW1lcg0KPiA+IHRpbS5oYW1tZXJAb3JvbGlhLmNvbQ0KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gYnVpbGRyb290
IG1haWxpbmcgbGlzdA0KPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+ID4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290DQo+IA0KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
