Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52CBFEFB6A
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 16:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA96540B7F;
	Fri, 27 Feb 2026 16:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHe4rwteTOEo; Fri, 27 Feb 2026 16:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAC9B40B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772210283;
	bh=bqvQ/M2kYDBkTFVQXpwjkbapwdfM+rAlOj1MSbKivt8=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=enbaUbM1nkC4JYyPssKUqQE9W3FsWVvXNnH61K0Pq8pVrBw8Ut8qDaMIZpelaZrjD
	 0ohtpjECtgsXwWx3+j01MhuhT+Q0VlPMsdaQVVrGfSI2WuJzsPoW/n8pfKFOQJr8Rt
	 b9Oc1L5LrrZsVToBhq+l8OgdT6faRa29i4bDet5JV2SHmIeXkIvYOyNgXt3UB62KlE
	 UzUVzr69nq3TG75g4uEA9DX5+WBma0R6VmC5bj4ut7AusaGzQtv83qbO1B0SKGobCr
	 bcVqvqCgaCQmwbhkvj6hgZIRCWmvGSR4ZgY1gUfMkqxGVlJm2hwc6b+AD/3HKhHzg2
	 8L+5M19JGP2lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC9B40B3F;
	Fri, 27 Feb 2026 16:38:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D88CD8A
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32FC040B38
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hq1jUsbtu3DP for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 16:38:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0110E40B17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0110E40B17
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0110E40B17
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:37:59 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 27 Feb
 2026 17:37:49 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Fri, 27 Feb 2026 17:37:49 +0100
To: Arnout Vandecappelle <arnout@rnout.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Jonas Blixt <jonas.blixt@actia.se>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Jacob Chen <chenhao37@lixiang.com>
Thread-Topic: [Buildroot] [PATCH v2] package/pkg-utils: Prevent per-package
 syncing stale deps
Thread-Index: AQHbWHlKGKIGcm93JUua5l2Pj41V5bV1JqqAgCQmcAA=
Date: Fri, 27 Feb 2026 16:37:49 +0000
Message-ID: <206cc0fa-3213-4bb3-8494-8b9577d5b00a@actia.se>
References: <20241227160622.1654822-1-john.ernberg@actia.se>
 <961e39e7-8a98-4780-b847-c799dac04442@rnout.be>
In-Reply-To: <961e39e7-8a98-4780-b847-c799dac04442@rnout.be>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.59]
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445E607260
Content-ID: <7D19B30C55AF6C4A8383842E33388689@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [PATCH v2] package/pkg-utils: Prevent per-package
 syncing stale deps
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
From: John Ernberg via buildroot <buildroot@buildroot.org>
Reply-To: John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LA0KDQpPbiAyLzQvMjYgNTozNCBQTSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3Jv
dGU6DQo+ICDCoEhpIEpvaG4sIEpvbmFzLA0KPiANCj4gT24gMjcvMTIvMjAyNCAxNzowNiwgSm9o
biBFcm5iZXJnIHdyb3RlOg0KPj4gRnJvbTogSm9uYXMgQmxpeHQgPGpvbmFzLmJsaXh0QGFjdGlh
LnNlPg0KPj4NCj4+IEZyb206IEpvbmFzIEJsaXh0IDxqb25hcy5ibGl4dEBhY3RpYS5zZT4NCj4+
DQo+PiBUaGlzIGZpbHRlcnMgb3V0IHRoZSBkZXBlbmRlbmN5IGlucHV0cyB3aGVuIHN5bmNpbmcg
dGhlIHBlci1wYWNrYWdlDQo+PiB0YXJnZXQgZGlyZWN0b3J5IHRvIG9ubHkgaW5jbHVkZSAnc2tl
bGV0b24nIGFuZCBpdHMgZGVwZW5kZW5jaWVzLCBpZg0KPj4gdGhleSBleGlzdC4gU2luY2Ugb3Ro
ZXIgZGVwZW5kZW5jaWVzIGFyZSBub3QgbmVlZGVkIGluIHRoZSB0YXJnZXQgZGlyDQo+PiBmb3Ig
c3VjY2Vzc2Z1bCBidWlsZGluZyB0aGV5IGNhbiBiZSBpZ25vcmVkIGFuZCBkZXBlbmQgb24gdGhl
IHBwZC1tZXJnZQ0KPj4gdG8gcG9wdWxhdGUgdGhlIGZpbGVzIGZyb20gdGhlIG90aGVyIHBhY2th
Z2VzLCB1bmxpa2UgdGhlIHN0YWdpbmcgZGlyDQo+PiB3aGljaCBpcyB1bnRvdWNoZWQgaGVyZS4N
Cj4gDQo+ICDCoEkgbWF5IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgZG9lc24ndCB0aGlzIGJy
ZWFrIHRoZSBjb21iaW5hdGlvbiBvZiANCj4gYnVzeWJveA0KPiB3aXRoIGUuZy4gYXR0cj8gVGhl
IGJ1c3lib3ggaW5zdGFsbCBzY3JpcHQgY2hlY2tzIGlmIHRoZSBmaWxlIGFscmVhZHkgDQo+IGV4
aXN0cyBhbmQNCj4gZG9lcyBub3QgY3JlYXRlIHRoZSBzeW1saW5rIHdoZW4gaXQgZG9lcy4gYnVz
eWJveCBkZXBlbmRzIG9uIGF0dHIgKGFuZCANCj4gZG96ZW5zIG9mDQo+IG90aGVyIHBhY2thZ2Vz
KSBmb3IgZXhhY3RseSB0aGF0IHJlYXNvbi4NCj4gDQo+ICDCoFRoZXJlIGFyZSBvdGhlciBwYWNr
YWdlcyBhcyB3ZWxsIHRoYXQgcmVseSBvbiB0aGUgcHJlc2VuY2Ugb2YgDQo+IHNvbWV0aGluZyBp
biB0aGUNCj4gdGFyZ2V0IGRpcmVjdG9yeS4NCg0KV2UgZGlkbid0IG5vdGljZSBhbnkgYnJlYWth
Z2VzIG9mIGJ1c3lib3gsIGJ1dCB3ZSBhbHNvIG9ubHkgdXNlIGFib3V0DQoxMCB1dGlscyBvdXQg
b2YgYnVzeWJveCAobm9uZSBvZiB0aGVtIGFyZSBwYXJ0IG9mIHRoZSBjb25mbGljdA0KcGFja2Fn
ZXMgb24gb3VyIGNvbmZpZykuDQoNCkl0IGRpZCBub3QgZXZlbiBjcm9zcyBteSBtaW5kIHBhY2th
Z2VzIG1pZ2h0IGRvIHRoYXQuIFRoYW5rIHlvdSBmb3INCmJyaW5naW5nIGl0IHVwIQ0KDQooSSBo
YXZlbid0IGludmVudG9yaWVkIHdoaWNoIG90aGVyIHBhY2thZ2VzIHlldCwgd2lsbCBkbyBpZiBp
dCBiZWNvbWVzDQpuZWNlc3NhcnkgYWZ0ZXIgYmVsb3cgcG9pbnRzIGNvbnNpZGVyZWQpDQoNCkkg
Y3VycmVudGx5IHNlZSAyIHdheXMgdG8gYXBwcm9hY2ggdGhpcyBwcm9ibGVtLCBwbGVhc2UgbGV0
IG1lIGtub3cNCndoYXQgeW91IHRoaW5rIGFib3V0IHRoZW0uDQoNCjEpIFdlIG1vdmUgc3VjaCBz
dGVwcyAoc3VjaCBhcyBnZW5lcmF0aW5nIHRoZSBidXN5Ym94IGFwcGxldCBsaW5rcykNCiAgICB0
byB0aGUgVEFSR0VUX0ZJTkFMSVpFX0hPT0tTIHN0YWdlLiBUaGlzIHdpbGwgbmVlZCB1cyB0byBp
bnN0YWxsDQogICAgbW9yZSBmaWxlcyBpbnRvIHRhcmdldC8gdGhhdCB3aWxsIG5lZWQgdG8gYmUg
aWdub3JlZCBsYXRlciBsaWtlDQogICAgdGhlIFRBUkdFVF9ESVJfV0FSTklOR19GSUxFIGlzIGln
bm9yZWQuDQoNCiAgICBQYWNrYWdlcyBtYXkgbmVlZCB0byBiZSBhYmxlIHRvIGRlZmluZSBhZGRp
dGlvbmFsIGZpbGVzIHRoZW1zZWx2ZXMNCiAgICB0aGF0IG5lZWQgdG8gYmUgc2tpcHBlZCBpbiBy
b290ZnMgZ2VuZXJhdGlvbi4NCg0KICAgIExvb2tpbmcgYXQgYnVzeWJveCBpdCBtaWdodCBub3Qg
YmUgZXhhY3RseSB0cml2aWFsIGJ1dCBpdCBzaG91bGQNCiAgICBiZSBkb2FibGUuDQoNCjIpIElu
dHJvZHVjZSA8cGtnPi1yZWJ1aWxkLXJkZXBlbmRzIGFuZCA8cGtnPi1yZWNvbmZpZ3VyZS1yZGVw
ZW5kcywNCiAgICB3aGljaCB0cmlnZ2VyIHRoZSBhcHByb3ByaWF0ZSByZWJ1aWxkIG9mIGFsbCB0
aGUgcmRlcGVuZHMuDQoNCiAgICBUaGlzIHdvdWxkIGJlIHRoZSBzYW1lIHRoaW5nIHdlIGRvIHRv
ZGF5IHRvIHdvcmsgYXJvdW5kIHRoZQ0KICAgIHByb2JsZW0gKG1ha2UgPHBrZz4tcmVidWlsZCAm
JiBtYWtlIDxyZGVwMT4tcmVjb25maWd1cmUgLi4uKSBidXQNCiAgICBhdXRvbWF0aWNhbGx5IGZy
b20gaW5zaWRlIGJ1aWxkcm9vdC4NCg0KPiANCj4+IFRoaXMgc29sdmVzIHRoZSBwcm9ibGVtIHdo
ZXJlIHN0YWxlIGZpbGVzIGZyb20gZGVwZW5kZW5jaWVzIHdpbGwNCj4+IGxpbmdlciBpbiB0aGUg
cGVyLXBhY2thZ2UgdGFyZ2V0IGRpcmVjdG9yaWVzIGFuZCBtYXkgdXAgaW4gdGhlIGZpbmFsDQo+
PiB0YXJnZXQgZGlyZWN0b3J5IGFmdGVyIHRoZSBwcGQtbWVyZ2UsIG92ZXJ3cml0aW5nIHRoZSBm
cmVzaCBvbmVzLA0KPj4gY2F1c2luZyB1bmVjZXNzYXJseSBtYW55IHJlYnVpbGQgc3RlcHMgdG8g
ZW5zdXJlIHRoYXQgdGhlIGxhdGVzdA0KPj4gdmVyc2lvbiBvZiBhIGRlcGVuZGVuY3kgaXMgaW5j
bHVkZWQgaW4gdGhlIGZpbmFsIHRhcmdldCBkaXJlY3RvcnkuDQo+IA0KPiAgwqBZZXAsIHdlJ3Jl
IGF3YXJlIG9mIHRoaXMgcHJvYmxlbSwgYW5kIGhhdmVuJ3QgZm91bmQgYSBzb2x1dGlvbiA6LSkN
Cg0KSXQgaXMgaW5kZWVkIGEgdHJpY2t5IHByb2JsZW0sIGl0IGlzIGJvdGhlcmluZyBtZSBlbm91
Z2ggdGhvdWdoIHRoYXQNCkknbSB3aWxsaW5nIHRvIHdvcmsgb24gaXQgYXMgbXVjaCBhcyBJIGNh
bi4NCg0KQmVzdCByZWdhcmRzIC8vIEpvaG4gRXJuYmVyZw0KDQo+IA0KPiAgwqBSZWdhcmRzLA0K
PiAgwqBBcm5vdXQNCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
