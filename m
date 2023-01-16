Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7ABC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 07:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D69D28175F;
	Mon, 16 Jan 2023 07:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D69D28175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwD9k69mMKOH; Mon, 16 Jan 2023 07:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB4C814A9;
	Mon, 16 Jan 2023 07:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB4C814A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBE981BF30A
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 07:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B2640407
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 07:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B2640407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PsmRk-8vZ5p for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 07:43:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BF10403A5
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2059.outbound.protection.outlook.com [40.107.6.59])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BF10403A5
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 07:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKZeEJX+LVopEXyIVkXtNeJiixpXoFuoCqPJ64RGTZT+6LQ/Bj0Lk6oclYFz/BbJWVYp24DRHa6Qwx/VsW0q6DEOW2ZQ5uHvE0E+RDmeVLVTomg8ZxDQwos1eljpHrTEGAF6elc/Bqe0YEkGBfsVIu5POVdZ/ztWZNls0y1skH0mhB2dRG2KXY8ayysvpocTbOdIRbrVCxio5lPACz+HgKxOY4XIvtJtbOZ9V5Tftx8tptcM9Gr9DFJ/TDfWSm0/4p2oy6meOX+rXyY0lkhKCy1oCjun7QuykxZkJ4bIkLHBuYVc9jlLrk8xt/++V+/L7NmXtYOj/pJd1iB5j3S4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOQ4eUo24KBvXEtVDyPWN+Vn15EqM9ieUM0PwBl8sMc=;
 b=eiP/KEINHxWa4XWbLL2/WMEOLBJps82dzx64jKU76nA3fT3IGfEHI47gR6oMHVE5C8nfp+G7U9uldAiCv0gxU4X3TD7rxACzXGV7SH6870etBzz1KOdwBh/FQ/uegqU3agaQFwwUl722HHMjTSPwrBgxEP3Wnl8lHhkOcir6qn0onALIp3wXQdc1xJGo6yD0+CVYNbuuGE3E1QYzUw3naEq4x44GlI6Qx7KfkDE51rQ+WmjNvixjGRhFJMcZE4/Ie6OjdEKsCRx4ktApMwNxSRxV0ID1wFfCZEd1xqtB67j3F+k10z6iXYwfltjL0z0qMVxxBWVswyfoz6Tkpaszpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by PAXP251MB0602.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:286::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 07:43:07 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236%8]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 07:43:07 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] package/pkg-generic.mk: no legal info WARNING if
 REDISTRIBUTE = NO
Thread-Index: AQHZJ1HFoR2Px2c9Wk+c612jfRFZNa6eYdGAgAAC6ICAAkj6AA==
Date: Mon, 16 Jan 2023 07:43:07 +0000
Message-ID: <b316e1bd103e7f9b091d2bed91edd9d64265f830.camel@orolia.com>
References: <d7d0dede27d4b3a026071a3019b58c5e8df9fe7b.camel@orolia.com>
 <20230114203859.GC199036@scaer> <20230114204923.GD199036@scaer>
In-Reply-To: <20230114204923.GD199036@scaer>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1+deb11u1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|PAXP251MB0602:EE_
x-ms-office365-filtering-correlation-id: db0f2ed6-4979-4f10-8f9f-08daf7954f09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CinhktHMtLMbKNQQB6crnyZlg9as1ctSrXZW6ML5TmvfSlr1VhqiRPoUCqfSRa+ifi7fzB2Ve7UdpPjALdJx5mlVlnSfOXgyc0BNdRpovQZo1L7P78olZcXy1r7eJJ22g6cVtJmF1vtLjS6ngNkg4E63GqfMeqBpdCyLmSDQ5+iJtFGNzZjWbilSSK/D1kJlEFDcJfiVtnKsUK5FsYATAXD9SrRMEo4SBWhTVTPAvK19op5/bi4UgaeDWqOam6VHKQR6x5FTWyXkXFI3GIuYiUDygtcPnRM2r5S/Gkb+ZQAViJIQlkyILTyeREFLk3Ka9x6np+ZLxYbWyZSvFrNVxJphwBrijP1iEOdTdShVC1E7ZFdvloyAs6AzGDbNC1bMXfr4Mi3U0gmDP80MS6a0jZvuoajFuoMPJ1KvWNV/Fda9b4kD3BmXhIVxh4ayZloIiz0OTHe4g2ANhjdsEpBlQVPLrkKqZ6ZFTxE68Bl20+IuVxhRUUdx0c9DpV3Cl4MzUZLgKds6nJJv0JWNLfKK0yls6OzjUub0CiscZItnkyFrJJZl8B962whe1cHTkmb0GRbaCqAqyN279Pjts/F9UitDQQQSuPbulm/x5TGUsdTrhyMepT0M46p5mJJgwPMFP8RTIdr4Iw8I4OuaXI6yUiDNLfvTFqa4w9wyr1jg68ziNFpi+WooYuC0Fprw/O45UBor+HaImmZhveo8YBMRbvEKHjwIThHkpNSXASnxqo7VSrdGpJQggEDe1vUuL9U/7xQVcfi8mJNPZNtlo4ka5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(396003)(39840400004)(451199015)(36756003)(86362001)(38070700005)(4326008)(76116006)(8936002)(66476007)(64756008)(6916009)(66446008)(8676002)(66556008)(66946007)(2906002)(83380400001)(122000001)(38100700002)(5660300002)(966005)(478600001)(6486002)(71200400001)(54906003)(316002)(91956017)(41300700001)(2616005)(6512007)(6506007)(186003)(41533002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1d0eFQ0WkdSQ3V0Rk9HMmQ3RTRLUkt2SFU5dEIzenVadDlFckdaRnc1ME43?=
 =?utf-8?B?aHd6YmV0eFQ3dWdDZzNDUmlpV0tNOWErQnRWc2doQytuUkNINFNYSWtDZlp3?=
 =?utf-8?B?aURoOXdaZW96TUhsMW92cFFqR2Q4NGhMUFE4UDFCclFXV2VVNFZZQUMvei9L?=
 =?utf-8?B?bWZJTlRqRXl0VUFoTzNnTnl4alJYSEQ0WEI3ZjB1Y2tSRDlrS2k5aXQ1cTZB?=
 =?utf-8?B?LzB0Sk5BLzhDeWdJMjV6U2hHM2dMbHRaMXdwKzFIODJZZDhzYzFYM2dJU0xQ?=
 =?utf-8?B?OGFtUTc0T3E2N1RobC9PYzFiWW9veit0MWdVa3dEb0lFYUJFYVVrWmpyNGlV?=
 =?utf-8?B?QjBwSDJnWlZLc1AzdGtnbUhYTWd0d3N6bGxBQ3BZa01YVWU4M1NBSEtxZFBU?=
 =?utf-8?B?TUp3YkxEY2ZSM1B3S0pVSTlKMkpYYnFHdTVyL2hWZ25xb3krOTBkMDl2MUhz?=
 =?utf-8?B?TnNWQU5XSkpkbFc0a0doZlF6cTZWdzFsMXkyakxZbG5DRzYwOUo0blNCa2U3?=
 =?utf-8?B?dVdwdUdCanNmTzlKdnQwZ2xab0FtSU1XZFlUZWFCQXRoYW9YTkVINE9GZGJ2?=
 =?utf-8?B?SVB2dGlyQkhNeE5DU3BMNzk3OWM1WVZCanRibEVjdlRkMjFJbzdFWFdZRUxD?=
 =?utf-8?B?bU91WWtKNHBLNkRoanVJbjE0UXlhVDd5R2FuVG90azlVNzZpSkg4R2JMaElk?=
 =?utf-8?B?Mkc4b21mTWRrODBLY3ZGakt6TnZYSGlNR0pVakVTYXFhRyt6ZEYyTkd5N015?=
 =?utf-8?B?bWVxQUp6SUdwM1pnVmxDY3NIVEhtREY2MStxWUQxQnNwVXRaSU9lbUpvd3NK?=
 =?utf-8?B?TFBraGVpckhvY015V2pSYmdGU3dqSHc1VGZoQmlqYmN5REVjVTZFd2diQkk0?=
 =?utf-8?B?cWhDOGNuT1k1UzVFQ210SUgxRUtKNGo5SDdxckg0cm5wemVDY2hhOExOVmQ3?=
 =?utf-8?B?UEx1cVdUYkplQ3hmUDJNQ0QrRFNqMkVZRVFiVzN6TVNVOFhWeWllRGlrMnU2?=
 =?utf-8?B?VWFPT3ROSHFvSVpuR0txVVQ0d1Z3NVZ4QVdqYjRITFJlWTdDTWJVcG8zRkI4?=
 =?utf-8?B?NVUrZk1tbXNUdjJjNEF4bVFESFBIVnlXODN6NHJFVDNLY3RydE1MeEFTeUtC?=
 =?utf-8?B?N0szcXN1QmE0bCtBOEwxRVRkR1BRUERQVUFnQWpZdnp2SHgxVHFXbWtRZUdu?=
 =?utf-8?B?bHhZUkdySnRGRE00ZHV5dFBXTVpqSm5QRFdTWE1vYzQ5UEthTTlDL3hyZ2Ey?=
 =?utf-8?B?ZGNpRjZkcC8wYngvT3VLZWVmTlFRKzNlTmI1ODlFTXNWaVN0b3A3bTMvbC9P?=
 =?utf-8?B?VnE4Y3lIN0lwUWRNaGRmSTVoYVUvRlR1NnQwYk9zUWQ4T21jb0NzalJhaHhj?=
 =?utf-8?B?cUF2RGs1VWhHV1lzS09TZ0hDUUZvbE5WTTl5dExUTFVXbHBwQ3MzN29uWEFs?=
 =?utf-8?B?VmwvYjBCRmVmVmlkSzE5MEYvSmFtZ2JhSGdCQ2pHbVoxUW1VdkdLejNuTmtD?=
 =?utf-8?B?WEc2TkVxeGlIU1FCMW95TTBxYW5vTFhyMGlja2xHMGpEZ0VmMFRRdDNJcllL?=
 =?utf-8?B?QnBGRnhhQU5mb1FiYmR6TkZNSlBqS0lDMGs0SFZxZG5lTUNzME1DYnFLNlk0?=
 =?utf-8?B?ZHFSVC9CZ084Tko5U0xVUEJaRzFMeWpJR0RuZG1zZUc4alNPdGZRMTVKbHg2?=
 =?utf-8?B?MVVjMStxMFJIdkhPUGw3aDhPQ2U1Ylo3b2RxV05UZGlSL29uSUZ1cGJGT1Ji?=
 =?utf-8?B?TTZmd1pZMXVGeC9UQzlVTis1bkc3WnNBR1lkM0JncGR3cFRhZlhPeEdNMXJX?=
 =?utf-8?B?QnlPdElPVmtWdW81anR1MHVGVGlNRkl4M1gxL0lzcC9WYTFmSmIwN3FmaHkz?=
 =?utf-8?B?cDBRVTdlMjNmWWtkbmJDOWc0Yjl2ajFZak9MTkhzV0lYRXNrZ3Z0aE1tOG9z?=
 =?utf-8?B?T0VjUUVqTEFjWU1VckFMVXF6a21lZEpsRDRQenZBNDZtR0lOM21WSnllNFlH?=
 =?utf-8?B?UUJCejhQdlVOY0doVzFTWERZSlNLMTRRa1haaytkamFzT1ZMZ1F6Q0tObnlL?=
 =?utf-8?B?cFVNbTNCVXNsZURhUEIrUkFiSURQRjRRK1l5em9mYzZCYldSYzBlRW85Tmdi?=
 =?utf-8?B?WmdtcWJ1WVN1c0VrYklNSndwRlplWFhPTmEySmZoU0d0VUM2VFJ4elVmWFFP?=
 =?utf-8?B?dWlyZjlvUFZtMHgvR2JKbG0xUzRBN3A2c25OQTVzVk5SenFyeUNBRTl3OXMr?=
 =?utf-8?Q?sY0URumqLfgTWoPzXQJ/MY/YzFPOvOcMkihq0LvqVw=3D?=
Content-ID: <4BA4FCEF2EE3F645B423219642E74312@EURP251.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: db0f2ed6-4979-4f10-8f9f-08daf7954f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 07:43:07.4404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ryJBgSrQvRzVSQN0hk8NvmYpc2JRVYHqzRUh/EjMr/2zdt9S1YmG0MiiYLvSTHc9KmHfm2K9ppqRviOfNzmFPg9Nchk+106ex7R4jL0Nkqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0602
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOQ4eUo24KBvXEtVDyPWN+Vn15EqM9ieUM0PwBl8sMc=;
 b=OyKLCABV81jGjripUqPQNvUBD8Zw7UgoseE3BRVxE6uP427H2saaP+JvkdPdQN5UyW+R7XDPfXfVYIn7nuhvgVrKjoyfrH+Peynm6TSU5dBzwl2cEFFMcIN0yjljoj/Pj7brIMIEBRa45UbwZKWYBXPKRl+xLV9zJuIBbZna7qM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=OyKLCABV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Subject: Re: [Buildroot] package/pkg-generic.mk: no legal info WARNING if
 REDISTRIBUTE = NO
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGEgeWVzLCBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJIGhhZCB1bmRlcnN0b29kIHRoZSBjb250cmFy
eSwgdGhhbmsgeW91IGZvciBsaWZ0aW5nIHRoZSBhbWJpZ3VpdHkgYW5kDQphYm92ZSBhbGwsIHRo
YW5rIHlvdSBmb3IgaGF2aW5nIGFjY2VwdGVkIG15IGJyb2tlbiBwYXRjaGVzLg0KDQpJJ2xsIHRy
eSB0byBidWcgbXkgSVQgZGVwYXJ0bWVudCBhcyBoYXJkIGFzIEkgY2FuIHNvIHRoYXQgdGhleSBy
ZS1lbmFibGUgU01UUC4NCg0KT24gU2F0LCAyMDIzLTAxLTE0IGF0IDIxOjQ5ICswMTAwLCBZYW5u
IEUuIE1PUklOIHdyb3RlOg0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBv
dXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uDQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhl
IGNvbnRlbnQgaXMNCj4gc2FmZS4NCj4gDQo+IE5pY29sYXMsIEFsbCwNCj4gDQo+IE9uIDIwMjMt
MDEtMTQgMjE6MzggKzAxMDAsIFlhbm4gRS4gTU9SSU4gc3Bha2UgdGh1c2x5Og0KPiA+IE9uIDIw
MjMtMDEtMTMgMTM6MjAgKzAwMDAsIE5pY29sYXMgQ2FycmllciBzcGFrZSB0aHVzbHk6DQo+IFst
LVNOSVAtLV0NCj4gPiA+IEJ1dCBpbiB0aGUgc2l0dWF0aW9uIHdoZXJlIHRoZSBwYWNrYWdlcyBo
YXMgZXhwbGljaXRseSBkZWZpbmVkDQo+ID4gPiBGT09fUkVESVNUUklCVVRFID0gTk8NCj4gPiA+
IGluIGl0cyAubWsgZmlsZSwgaXQgbWFrZXMgbm8gc2Vuc2Ugc2luY2UgdGhlIHNvdXJjZXMgd291
bGRuJ3QgYmUgc2F2ZWQNCj4gPiA+IGFueXdheS4NCj4gPiBZZXMsIGl0IG1ha2VzIHNlbnNlLg0K
PiANCj4gSSBub3cgcmVhbGlzZSB0aGF0IG15IGNvbW1lbnQgd2FzIGFtYmlndW91ZywgZ2l2ZW4g
d2hhdCBJIHdhcyBjb21tZW50aW5nDQo+IG9uLiBTbywgbGV0IG1lIHJlcGhyYXNlOg0KPiANCj4g
SW5kZWVkLCBlbWl0dGluZyB0aGUgd2FybmluZyBkb2VzIG5vdCBtYWtlIHNlbnNlLiBJbmRlZWQs
IHdoYXQgeW91DQo+IGV4cGxhaW5lZCBkb2VzIG1ha2Ugc2Vuc2UuDQo+IA0KPiBUaGVyZSwgYW1i
aWd1aXR5IHJlc29sdmVkLiA7LSkNCj4gDQo+IFJlZ2FyZHMsDQo+IFlhbm4gRS4gTU9SSU4uDQo+
IA0KPiAtLQ0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLg0KPiA+IMKgWWFubiBFLiBNT1JJTsKg
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8DQo+ID4gKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmXCoCBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTsKgwqDCoMKgIHzCoCBfX1/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4g
PiArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOsKgIFjCoCBBR0FJTlNUwqDC
oMKgwqDCoCB8wqAgXGUvwqAgVGhlcmUgaXMgbm/CoCB8DQo+ID4gaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnL8KgfCBfLypcXyB8IC8gXCBIVE1MIE1BSUzCoMKgwqAgfMKgwqAgdsKgwqAgY29u
c3BpcmFjeS7CoCB8DQo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
