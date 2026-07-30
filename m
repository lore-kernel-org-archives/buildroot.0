Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D84C55160
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 16:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 764EC40B7C;
	Thu, 30 Jul 2026 16:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypD7xkOS2cMr; Thu, 30 Jul 2026 16:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9027C40C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785429486;
	bh=a6c9mrtYFFqCZ2+oZOlPdeeSUEBbC39oGu/hmOLbSIU=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ja1iwevDfLQ2coe/AE1jjDAAFRsgIS0iVsdtH5RZ/2WiUJd477C+M9cN6MTbQ+gLc
	 pEVQsEnBntxbHKfW+pdCXX0AXHuts/JnOAwp6IfXT4+5xgGFSj73q3PYb7Ur1GQoOt
	 EQ1EUy0kG3CuokTN63ebCzcnDbkBIfYvYDIJRSSAR+G3PLiBqbdaGdVAKypaT2AC29
	 yygSLCr/B91fyfr0vap36hYTP1dY7GdV6SJFSu8rMey8aE3nWgeLVd8wiFf3BRtMVL
	 8VhlNFANiqd1EubwQ/nphNoLSJrdA9IWwQfrF/t9+1AxGxeTkzd6pLVg+ep8wxzPk8
	 CzQHCLYLY8PcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9027C40C3E;
	Thu, 30 Jul 2026 16:38:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A88C69
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B53E40C40
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWaGL2QIy6Su for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 16:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0676B40B23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0676B40B23
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0676B40B23
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:37:15 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 30 Jul
 2026 18:37:10 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Thu, 30 Jul 2026 18:37:10 +0200
To: Arnout Vandecappelle <arnout@rnout.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Correct approach for supporting multiple SoCs with
 otherwise same board?
Thread-Index: AQHdEqAdLuqpbqLp5USFhR9RG3g2zbaGOWKAgAADKoA=
Date: Thu, 30 Jul 2026 16:37:10 +0000
Message-ID: <13bed764-3a89-4379-8d6e-c5c2d887e8f7@actia.se>
References: <3c4de0c8-dcd8-444d-ad65-a023e782a346@actia.se>
 <2424f6f7-89d4-4e65-ab69-370a1eee29e1@rnout.be>
In-Reply-To: <2424f6f7-89d4-4e65-ab69-370a1eee29e1@rnout.be>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14556677664
Content-ID: <18019FF30D96C848BA1359FB7858E07F@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] Correct approach for supporting multiple SoCs with
 otherwise same board?
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

SGkgQXJub3V0LA0KDQpPbiA3LzMwLzI2IDY6MjUgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdy
b3RlOg0KPiAgwqBIaSBKb2huLA0KPiANCj4gDQo+IE9uIDEzLzA3LzIwMjYgMTA6MTcsIEpvaG4g
RXJuYmVyZyB2aWEgYnVpbGRyb290IHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gV2UgaGF2ZSBhIGJv
YXJkIHdpdGggYSBmZXcgZGlmZmVyZW50IGlNWDhYIHNlcmllcyBTb0NzLA0KPj4gd2hpY2ggd2Ug
aGF2ZSB3b3JrZWQgYXJvdW5kIGJ5IGhhdmluZyBhIGN1c3RvbSBpbXgtc2VjbyBwYWNrYWdlIHRo
YXQNCj4+IGluc3RhbGxzIHRoZSBkaWZmZXJlbnQgQUhBQiBjb250YWluZXJzIHdlIG5lZWQuDQo+
Pg0KPj4gTm93IHdlJ3JlIGludHJvZHVjaW5nIGEgbmV3IFNvQyBvbnRvIHRoaXMgYm9hcmQgdGhh
dCBpcyBub3QgY29tcGF0aWJsZQ0KPj4gd2l0aCB0aGUgaU1YOFguIEhvd2V2ZXIsIExpbnV4IGFu
ZCB1c2Vyc3BhY2Ugd2lsbCBiZSB0aGUgc2FtZSBmb3IgYWxsDQo+PiBib2FyZHMgYXMgdGhleSBu
ZWVkIHRvIGJlIGludGVyY2hhbmdlYWJsZSB3aXRoIGVhY2ggb3RoZXIuDQo+Pg0KPj4gVGhlIG9u
bHkgdGhpbmdzIHdlIG5lZWQgdG8gZ2VuZXJhdGUgZGlmZmVyZW50bHkgbm93IGlzIHRoZSBib290
bG9hZGVyDQo+PiBhbmQgQVRGLg0KPj4NCj4+IFRoZSBib290ZmxvdyBpcyBib290bG9hZGVyIC0+
IEFURiAtPiBMaW51eA0KPj4NCj4+IFdoYXQgaXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGhhbmRsZSB0
aGlzPw0KPj4gU2hvdWxkIHdlIHNlcGFyYXRlIHRoZSBmaXJtd2FyZXMgKyBib290bG9hZGVyICsg
QVRGIGNvbmZpZ3MgZnJvbQ0KPj4gdGhlIExpbnV4ICsgdXNlcnNwYWNlIGJ1aWxkIGNvbmZpZz8N
Cj4gDQo+ICDCoEFzc3VtaW5nIHlvdSBkb24ndCB3YW50IHRvIHRyeSB0byBnZW5lcmF0ZSBhIHNp
bmdsZSB1c2Vyc3BhY2UgaW1hZ2UgDQo+IGZvciBib3RoDQo+IGJvYXJkcywgdGhlIGJlc3QgYXBw
cm9hY2ggaXMgdG8gY3JlYXRlIGEgc2VwYXJhdGUgY29uZmlnIGZvciBlYWNoIGJvYXJkIA0KPiB0
eXBlLiBJZg0KPiB5b3Ugd2FudCB0byBtYWtlIGl0IGV4cGxpY2l0IHRoYXQgaXQncyBtb3N0bHkg
dGhlIHNhbWUsIHlvdSBjYW4gc3BsaXQgdGhhdA0KPiBjb25maWcgaW50byBhICJib290IiBwYXJ0
IGFuZCBhICJ1c2Vyc3BhY2UiIHBhcnQsIHdoZXJlIHRoZSBzYW1lIA0KPiB1c2Vyc3BhY2UgcGFy
dA0KPiBpcyB1c2VkIGZvciBib3RoLiBZb3Ugc2ltcGx5IGFkZCBhIE1ha2VmaWxlIG9yIG90aGVy
IHNjcmlwdCAodG8geW91ciANCj4gZXh0ZXJuYWwsIEkNCj4gcHJlc3VtZSkgdGhhdCBjb25jYXRl
bmF0ZXMgdGhlbSBhbmQgdGhlbiBjYWxscyBgbWFrZSBkZWZjb25maWcgDQo+IERFRkNPTkZJRz0u
Li5gDQo+IHBvaW50aW5nIHRvIHRoZSBnZW5lcmF0ZWQgZmlsZS4NCj4gDQo+ICDCoE5vdGUgdGhh
dCB0aGVyZSdzIGFsc28gYSBzY3JpcHQsIHN1cHBvcnQva2NvbmZpZy9tZXJnZV9jb25maWcuc2gu
IEl0IA0KPiBjaGVja3MNCj4gZm9yIGNvbmZsaWN0aW5nIG9wdGlvbnMsIGJ1dCBpdCdzIGZhciBm
cm9tIGZvb2xwcm9vZi4gYGNhdGAgbW9zdGx5IHdvcmtzIA0KPiBhcyB3ZWxsLg0KPiANCj4gIMKg
VGhlIGFubm95aW5nIHBhcnQgb2YgYSBzcGxpdCBjb25maWcgaXMgdGhhdCB5b3UgY2FuJ3QgZWFz
aWx5IGNoYW5nZSBpdCANCj4gd2l0aA0KPiBtZW51Y29uZmlnIGZvbGxvd2VkIGJ5IHNhdmVkZWZj
b25maWcuIEFmdGVyIHRoZSBzYXZlZGVmY29uZmlnLCB5b3UgaGF2ZSB0bw0KPiBleHRyYWN0IHRo
ZSBjaGFuZ2VkIHBhcnQuIFRoZXJlIGlzIGEgc2NyaXB0IHV0aWxzL2RpZmZjb25maWcgdGhhdCBj
YW4gDQo+IGhlbHAsIGJ1dA0KPiBpdCdzIHByb2JhYmx5IGJlc3QgdG8gbWFudWFsbHkgYXBwbHkg
dGhlIGNoYW5nZXMgdG8gdGhlIG9yaWdpbmFsIHNwbGl0DQo+IGNvbmZpZ3VyYXRpb25zLg0KPiAN
Cj4gDQo+PiBTZXBhcmF0aW9uIGZlZWxzIG9kZCB0aG91Z2ggYXMgdGhhdCBtZWFucyB3ZSBuZWVk
IHRvIGxldCB0aGUNCj4+IHBvc3QtaW1hZ2Uuc2ggc2NyaXB0IHdlIGhhdmUgZm9yIHByb2R1Y2lu
ZyBib290IGltYWdlcyAoQVRGICsgTGludXggKw0KPj4gRFRCcynCoCB3YW5kZXIgaW50byBvdGhl
ciBidWlsZCBkaXJlY3Rvcmllcy4NCj4gIMKgT0ssIHRoaXMgZG9lcyBzb3VuZCBsaWtlIHRoZSBp
ZGVhIGlzIHRvIHJldXNlIHRoZSBzYW1lIHVzZXJzcGFjZSBpbWFnZSANCj4gZm9yDQo+IGJvdGgu
IEZvciBtZSwgaXQgZG9lc24ndCBzb3VuZCB3ZWlyZCBhdCBhbGwgdG8gbG9vayBmb3IgaW1hZ2Vz
IGluIG90aGVyIA0KPiBidWlsZA0KPiBkaXJlY3Rvcmllcy4gRm9yIGV4YW1wbGUsIEkgdHlwaWNh
bGx5IGhhdmUgYSBzZXBhcmF0ZSBjb25maWcgZm9yIA0KPiBnZW5lcmF0aW5nIGENCj4gY3VzdG9t
IHRvb2xjaGFpbiB0aGF0IGNhbiBiZSBidWlsdCBhcyBhbiBleHRlcm5hbCB0b29sY2hhaW4uIEkg
cHV0IGFsbCANCj4gdGhlIGJ1aWxkDQo+IGRpcmVjdG9yaWVzIGluIGEgZml4ZWQgcGxhY2UgdW5k
ZXIgdGhlIGV4dGVybmFsLCBzbyBJIGNhbiByZWZlciB0byB0aGUgDQo+IGV4dGVybmFsDQo+IHRv
b2xjaGFpbiBhcyAkKEJSMl9FWFRFUk5BTF8uLi5fUEFUSCkvb3V0cHV0L2hvc3QvYmluL2djYy4N
Cg0KV2UnbGwgYmUgc2hhcmluZyBldmVyeXRoaW5nIGJ1dCB0aGUgYm9vdGxvYWRlciBhbmQgZGV2
aWNlIHRyZWUuDQoNCklmIGl0J3MgdGhlIGV4cGVjdGVkIGFwcHJvYWNoIHRoZW4gSSB3aWxsIHNl
dCBpdCB1cCB0aGlzIHdheS4NClNpbmNlIHdlJ3JlIHNoYXJpbmcgdGhlIHVzZXJzcGFjZSwga2Vy
bmVsLCBhbmQgc28gb24sIGZ1bGx5LCBJJ20gDQp0aGlua2luZyBJIHNob3VsZCBqdXN0IGhhdmUg
ZGVmY29uZmlncyBmb3IgZWFjaCBib290bG9hZGVyIGJ1aWxkIGFuZCANCmFub3RoZXIgZGVmY29u
ZmlnIGZvciB0aGUgcmVzdCwgYW5kIGp1c3QgY29tYmluZSBldmVyeXRoaW5nIGluIHBvc3QuDQoN
ClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQ0KDQpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJn
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
