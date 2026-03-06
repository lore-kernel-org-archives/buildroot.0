Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AD1FCB619
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 16:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C3C6127C;
	Fri,  6 Mar 2026 16:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ap6bjJ6IWUcX; Fri,  6 Mar 2026 16:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F866126A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772813356;
	bh=UXaUBYxP3NsQrINZHox8ih7vZm28lhs90m9APiWHm2s=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bTTWGwBbHQYNEX8Updfou/ypwybFU8YwirB2S8+2aD+r66/QP1lWDFuil+Ayd/3v5
	 TFFYKHkbniilzYxviUh6zj1inHeOO5SL8TquECDOXraTzSJY0qEDKnzkyNlwAa3cnd
	 zIhH4adyjq4rHKznohHAIeteEIW0RLtvbSkzdJiLS5JHgI7fwtaV2wgcazWXLnGSLx
	 wne1heY4WRSa2NZ2tRKuPedm5tJn2G8c9awL8FEEEQ2i1OJVSzfu1MXVwlA0x6yhdm
	 IA/kqAjMcTfQyoKBvYMJBj9Zjco1u+rrN1ETKBfHFWCOW9mDwnkVGTV13zmcI2inDQ
	 ZdELO67HWqHMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F866126A;
	Fri,  6 Mar 2026 16:09:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F1F7339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 16:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B2241DEE
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 16:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMpHehrYinw3 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 16:09:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D6B541DEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6B541DEB
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D6B541DEB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 16:09:06 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 6 Mar
 2026 17:08:56 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Fri, 6 Mar 2026 17:08:56 +0100
To: Arnout Vandecappelle <arnout@rnout.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Jonas Blixt <jonas.blixt@actia.se>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Jacob Chen <chenhao37@lixiang.com>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v2] package/pkg-utils: Prevent per-package
 syncing stale deps
Thread-Index: AQHbWHlKGKIGcm93JUua5l2Pj41V5bV1JqqAgCQmcACABpq7AIAEXYYA
Date: Fri, 6 Mar 2026 16:08:56 +0000
Message-ID: <8eb1dde7-ac5b-41bf-849d-cc121257ed2a@actia.se>
References: <20241227160622.1654822-1-john.ernberg@actia.se>
 <961e39e7-8a98-4780-b847-c799dac04442@rnout.be>
 <206cc0fa-3213-4bb3-8494-8b9577d5b00a@actia.se>
 <434c54dd-ef43-4410-92cb-d504f695ef20@rnout.be>
In-Reply-To: <434c54dd-ef43-4410-92cb-d504f695ef20@rnout.be>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.59]
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445E63716A
Content-ID: <27EABD9B36ADDB49873EBF1C183C0D75@actia.se>
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

SGkgQXJub3V0LA0KDQpPbiAzLzMvMjYgMTA6MjkgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdy
b3RlOg0KPiAgwqBIaSBKb2huLA0KPiANCj4gIMKgW0FkZGluZyBZYW5uIGZvciBob3BlZnVsbHkg
bW9yZSBpbnNpZ2h0cy5dDQo+IA0KPiBPbiAyNy8wMi8yMDI2IDE3OjM3LCBKb2huIEVybmJlcmcg
d3JvdGU6DQo+PiBIaSBBcm5vdXQsDQo+Pg0KPj4gT24gMi80LzI2IDU6MzQgUE0sIEFybm91dCBW
YW5kZWNhcHBlbGxlIHdyb3RlOg0KPj4+IMKgwqAgSGkgSm9obiwgSm9uYXMsDQo+Pj4NCj4+PiBP
biAyNy8xMi8yMDI0IDE3OjA2LCBKb2huIEVybmJlcmcgd3JvdGU6DQo+Pj4+IEZyb206IEpvbmFz
IEJsaXh0IDxqb25hcy5ibGl4dEBhY3RpYS5zZT4NCj4+Pj4NCj4+Pj4gRnJvbTogSm9uYXMgQmxp
eHQgPGpvbmFzLmJsaXh0QGFjdGlhLnNlPg0KPj4+Pg0KPj4+PiBUaGlzIGZpbHRlcnMgb3V0IHRo
ZSBkZXBlbmRlbmN5IGlucHV0cyB3aGVuIHN5bmNpbmcgdGhlIHBlci1wYWNrYWdlDQo+Pj4+IHRh
cmdldCBkaXJlY3RvcnkgdG8gb25seSBpbmNsdWRlICdza2VsZXRvbicgYW5kIGl0cyBkZXBlbmRl
bmNpZXMsIGlmDQo+Pj4+IHRoZXkgZXhpc3QuIFNpbmNlIG90aGVyIGRlcGVuZGVuY2llcyBhcmUg
bm90IG5lZWRlZCBpbiB0aGUgdGFyZ2V0IGRpcg0KPj4+PiBmb3Igc3VjY2Vzc2Z1bCBidWlsZGlu
ZyB0aGV5IGNhbiBiZSBpZ25vcmVkIGFuZCBkZXBlbmQgb24gdGhlIHBwZC1tZXJnZQ0KPj4+PiB0
byBwb3B1bGF0ZSB0aGUgZmlsZXMgZnJvbSB0aGUgb3RoZXIgcGFja2FnZXMsIHVubGlrZSB0aGUg
c3RhZ2luZyBkaXINCj4+Pj4gd2hpY2ggaXMgdW50b3VjaGVkIGhlcmUuDQo+Pj4NCj4+PiDCoMKg
IEkgbWF5IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgZG9lc24ndCB0aGlzIGJyZWFrIHRoZSBj
b21iaW5hdGlvbiBvZg0KPj4+IGJ1c3lib3gNCj4+PiB3aXRoIGUuZy4gYXR0cj8gVGhlIGJ1c3li
b3ggaW5zdGFsbCBzY3JpcHQgY2hlY2tzIGlmIHRoZSBmaWxlIGFscmVhZHkNCj4+PiBleGlzdHMg
YW5kDQo+Pj4gZG9lcyBub3QgY3JlYXRlIHRoZSBzeW1saW5rIHdoZW4gaXQgZG9lcy4gYnVzeWJv
eCBkZXBlbmRzIG9uIGF0dHIgKGFuZA0KPj4+IGRvemVucyBvZg0KPj4+IG90aGVyIHBhY2thZ2Vz
KSBmb3IgZXhhY3RseSB0aGF0IHJlYXNvbi4NCj4+Pg0KPj4+IMKgwqAgVGhlcmUgYXJlIG90aGVy
IHBhY2thZ2VzIGFzIHdlbGwgdGhhdCByZWx5IG9uIHRoZSBwcmVzZW5jZSBvZg0KPj4+IHNvbWV0
aGluZyBpbiB0aGUNCj4+PiB0YXJnZXQgZGlyZWN0b3J5Lg0KPj4NCj4+IFdlIGRpZG4ndCBub3Rp
Y2UgYW55IGJyZWFrYWdlcyBvZiBidXN5Ym94LCBidXQgd2UgYWxzbyBvbmx5IHVzZSBhYm91dA0K
Pj4gMTAgdXRpbHMgb3V0IG9mIGJ1c3lib3ggKG5vbmUgb2YgdGhlbSBhcmUgcGFydCBvZiB0aGUg
Y29uZmxpY3QNCj4+IHBhY2thZ2VzIG9uIG91ciBjb25maWcpLg0KPj4NCj4+IEl0IGRpZCBub3Qg
ZXZlbiBjcm9zcyBteSBtaW5kIHBhY2thZ2VzIG1pZ2h0IGRvIHRoYXQuIFRoYW5rIHlvdSBmb3IN
Cj4+IGJyaW5naW5nIGl0IHVwIQ0KPiANCj4gIMKgVGhlIGFubm95aW5nIHRoaW5nIGlzIHRoYXQg
d2UgZG9uJ3QgZXZlbiBfa25vd18gd2hpY2ggcGFja2FnZXMgZG8gdGhhdC4NCj4gDQo+ICDCoFNv
bHZpbmcgdGhpcyBpc3N1ZSBhY3R1YWxseSBoYXMgdGhlIG5pY2Ugc2lkZSBlZmZlY3QgdGhhdCB3
ZSBjYW4gaGF2ZSANCj4gYSBjaGVjaw0KPiB0aGF0IG5vIHR3byBwYWNrYWdlcyBpbnN0YWxsIHRo
ZSBzYW1lIGZpbGUuIFdlIGhhZCBhIHBhdGNoIGFkZGluZyBzdWNoIGEgDQo+IGNoZWNrDQo+IGlu
IHRoZSBiZWdpbm5pbmcgb2YgUFBELCBidXQgd2UgaGFkIHRvIGRyb3AgaXQgYmVjYXVzZSBpdCB0
cmlnZ2VyZWQgdG9vIA0KPiBtYW55DQo+IGZhaWx1cmVzIHRoYXQgd2VyZSBub3QgZWFzeSB0byBz
b2x2ZS4NCg0KVGhhbmtzIGZvciB0aGUgaGludCBhYm91dCB0aGlzIHNjcmlwdCwgSSdsbCBmaW5k
IGl0IGFuZCBzZWUgaWYgaXQgaGVscHMgDQptZSBsb2NhbGx5IGR1cmluZyB0ZXN0aW5nLg0KDQo+
IA0KPj4gKEkgaGF2ZW4ndCBpbnZlbnRvcmllZCB3aGljaCBvdGhlciBwYWNrYWdlcyB5ZXQsIHdp
bGwgZG8gaWYgaXQgYmVjb21lcw0KPj4gbmVjZXNzYXJ5IGFmdGVyIGJlbG93IHBvaW50cyBjb25z
aWRlcmVkKQ0KPj4NCj4+IEkgY3VycmVudGx5IHNlZSAyIHdheXMgdG8gYXBwcm9hY2ggdGhpcyBw
cm9ibGVtLCBwbGVhc2UgbGV0IG1lIGtub3cNCj4+IHdoYXQgeW91IHRoaW5rIGFib3V0IHRoZW0u
DQo+Pg0KPj4gMSkgV2UgbW92ZSBzdWNoIHN0ZXBzIChzdWNoIGFzIGdlbmVyYXRpbmcgdGhlIGJ1
c3lib3ggYXBwbGV0IGxpbmtzKQ0KPj4gwqDCoMKgwqAgdG8gdGhlIFRBUkdFVF9GSU5BTElaRV9I
T09LUyBzdGFnZS4gVGhpcyB3aWxsIG5lZWQgdXMgdG8gaW5zdGFsbA0KPj4gwqDCoMKgwqAgbW9y
ZSBmaWxlcyBpbnRvIHRhcmdldC8gdGhhdCB3aWxsIG5lZWQgdG8gYmUgaWdub3JlZCBsYXRlciBs
aWtlDQo+PiDCoMKgwqDCoCB0aGUgVEFSR0VUX0RJUl9XQVJOSU5HX0ZJTEUgaXMgaWdub3JlZC4N
Cj4gDQo+ICDCoEknbSBub3Qgc3VyZSB3aGF0IGV4YWN0bHkgeW91IG1lYW4gaGVyZSwgYnV0IEkg
Z3Vlc3MgdGhlIGlkZWEgaXMgImRvIA0KPiBzb21ldGhpbmcNCj4gZXhwbGljaXQgZm9yIGVhY2gg
cGFja2FnZSB0aGF0IGNhdXNlcyBhIGNvbmZsaWN0Ii4gSSBkZWZpbml0ZWx5IGxpa2UgDQo+IHRo
YXQgaWRlYSAtDQo+IGluIGdlbmVyYWwgaW4gQnVpbGRyb290IHdlIGxpa2UgdG8gZG8gdGhpbmdz
IGV4cGxpY2l0bHkgcmF0aGVyIHRoYW4gDQo+IG1hZ2ljYWxseS4NCj4gDQo+ICDCoFNwZWNpZmlj
YWxseSBmb3IgYnVzeWJveCwgSSBhY3R1YWxseSB0aGluayB0aGUgYXBwcm9hY2ggc2hvdWxkIGJl
IHRvIA0KPiBfcmVtb3ZlXw0KPiB0aGUgc3ltbGlua3MgdGhhdCB3b3VsZCBsZWFkIHRvIGNvbmZs
aWN0IChhbmQgYWxzbyByZW1vdmUgdGhlIA0KPiBkZXBlbmRlbmNpZXMgaW4NCj4gYnVzeWJveC5t
aykuIFNvIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gaWZlcSAoJChCUjJfUEFDS0FHRV9BVFRSKSx5
KQ0KPiBCVVNZQk9YX1JNX0ZJTEVTICs9IC91c3IvYmluL2F0dHIgL3Vzci9iaW4vZ2V0ZmF0dHIg
L3Vzci9iaW4vc2V0ZmF0dHINCj4gZW5kaWYNCj4gDQo+IGRlZmluZSBCVVNZQk9YX0lOU1RBTExf
VEFSR0VUDQo+ICDCoMKgwqDCoMKgwqAgLi4uDQo+ICDCoMKgwqDCoMKgwqAgJChSTSkgJChhZGRw
cmVmaXggJChUQVJHRVRfRElSKS8sJChCVVNZQk9YX1JNX0ZJTEVTKSkNCj4gZW5kZWYNCg0KVGhh
dCdzIGRlZmluaXRlbHkgYSBuaWNlciBhcHByb2FjaCB0aGFuIEkgY2FtZSB1cCB3aXRoLiBJJ2xs
IHRlc3QgdGhpcyANCm91dCBmaXJzdC4NCg0KPiANCj4gVGhpcyBpcyBzdGlsbCBhIGxpdHRsZSBi
aXQgdW4tbmljZSBiZWNhdXNlIGl0IGNvdWxkIHJlcXVpcmUgY2hhbmdlcyBpbiB0aGUNCj4gYnVz
eWJveCBwYWNrYWdlIHdoZW4geW91IHVwZGF0ZSBhdHRyLCBidXQgaW4gcHJhY3RpY2UgdGhhdCB3
aWxsIGhhcHBlbiANCj4gZXh0cmVtZWx5DQo+IHJhcmVseS4NCj4gDQo+IA0KPj4gwqDCoMKgwqAg
UGFja2FnZXMgbWF5IG5lZWQgdG8gYmUgYWJsZSB0byBkZWZpbmUgYWRkaXRpb25hbCBmaWxlcyB0
aGVtc2VsdmVzDQo+PiDCoMKgwqDCoCB0aGF0IG5lZWQgdG8gYmUgc2tpcHBlZCBpbiByb290ZnMg
Z2VuZXJhdGlvbi4NCj4gDQo+ICDCoEl0J3Mgbm90IGp1c3Qgc2tpcHBpbmcgdGhvdWdoLiBJdCBo
YXBwZW5zIGxlc3MgYW5kIGxlc3Mgbm93LCBidXQgdGhlcmUgDQo+IGFyZQ0KPiBhbHNvIHBhY2th
Z2VzIHRoYXQgX21vZGlmeV8gYW4gZXhpc3RpbmcgZmlsZSBhdCBpbnN0YWxsYXRpb24gdGltZS4g
VGhlDQo+IHRyYWRpdGlvbmFsIGV4YW1wbGUgb2YgdGhpcyBpcyB1cGRhdGluZyB0aGUgImRpcmVj
dG9yeSIgd2hlbiBpbnN0YWxsaW5nIA0KPiBpbmZvDQo+IGZpbGVzICh3aGljaCB3ZSBkb24ndCBh
Y3R1YWxseSBjYXJlIGFib3V0IGJlY2F1c2UgZG9jdW1lbnRhdGlvbiBnZXRzIA0KPiByZW1vdmVk
DQo+IGFueXdheSwgYnV0IGl0J3MgYW4gZWFzeSB0byB1bmRlcnN0YW5kIGV4YW1wbGUpLg0KPiAN
Cj4gIMKgQW55d2F5LCB0aG9zZSBhcyB3ZWxsIGNhbiBiZSBoYW5kbGVkIG9uIGEgY2FzZS1ieS1j
YXNlIGJhc2lzIGluDQo+IF9UQVJHRVRfRklOQUxJWkVfSE9PS1MuDQo+IA0KPiANCj4+IMKgwqDC
oMKgIExvb2tpbmcgYXQgYnVzeWJveCBpdCBtaWdodCBub3QgYmUgZXhhY3RseSB0cml2aWFsIGJ1
dCBpdCBzaG91bGQNCj4+IMKgwqDCoMKgIGJlIGRvYWJsZS4NCj4+DQo+PiAyKSBJbnRyb2R1Y2Ug
PHBrZz4tcmVidWlsZC1yZGVwZW5kcyBhbmQgPHBrZz4tcmVjb25maWd1cmUtcmRlcGVuZHMsDQo+
PiDCoMKgwqDCoCB3aGljaCB0cmlnZ2VyIHRoZSBhcHByb3ByaWF0ZSByZWJ1aWxkIG9mIGFsbCB0
aGUgcmRlcGVuZHMuDQo+Pg0KPj4gwqDCoMKgwqAgVGhpcyB3b3VsZCBiZSB0aGUgc2FtZSB0aGlu
ZyB3ZSBkbyB0b2RheSB0byB3b3JrIGFyb3VuZCB0aGUNCj4+IMKgwqDCoMKgIHByb2JsZW0gKG1h
a2UgPHBrZz4tcmVidWlsZCAmJiBtYWtlIDxyZGVwMT4tcmVjb25maWd1cmUgLi4uKSBidXQNCj4+
IMKgwqDCoMKgIGF1dG9tYXRpY2FsbHkgZnJvbSBpbnNpZGUgYnVpbGRyb290Lg0KPj4NCj4+Pg0K
Pj4+PiBUaGlzIHNvbHZlcyB0aGUgcHJvYmxlbSB3aGVyZSBzdGFsZSBmaWxlcyBmcm9tIGRlcGVu
ZGVuY2llcyB3aWxsDQo+Pj4+IGxpbmdlciBpbiB0aGUgcGVyLXBhY2thZ2UgdGFyZ2V0IGRpcmVj
dG9yaWVzIGFuZCBtYXkgdXAgaW4gdGhlIGZpbmFsDQo+Pj4+IHRhcmdldCBkaXJlY3RvcnkgYWZ0
ZXIgdGhlIHBwZC1tZXJnZSwgb3ZlcndyaXRpbmcgdGhlIGZyZXNoIG9uZXMsDQo+Pj4+IGNhdXNp
bmcgdW5lY2Vzc2FybHkgbWFueSByZWJ1aWxkIHN0ZXBzIHRvIGVuc3VyZSB0aGF0IHRoZSBsYXRl
c3QNCj4+Pj4gdmVyc2lvbiBvZiBhIGRlcGVuZGVuY3kgaXMgaW5jbHVkZWQgaW4gdGhlIGZpbmFs
IHRhcmdldCBkaXJlY3RvcnkuDQo+Pj4NCj4+PiDCoMKgIFllcCwgd2UncmUgYXdhcmUgb2YgdGhp
cyBwcm9ibGVtLCBhbmQgaGF2ZW4ndCBmb3VuZCBhIHNvbHV0aW9uIDotKQ0KPj4NCj4+IEl0IGlz
IGluZGVlZCBhIHRyaWNreSBwcm9ibGVtLCBpdCBpcyBib3RoZXJpbmcgbWUgZW5vdWdoIHRob3Vn
aCB0aGF0DQo+PiBJJ20gd2lsbGluZyB0byB3b3JrIG9uIGl0IGFzIG11Y2ggYXMgSSBjYW4uDQo+
IA0KPiAgwqBJJ20gcHJldHR5IHN1cmUgdGhlcmUgd2VyZSBvdGhlciBpc3N1ZXMgYXMgd2VsbC4g
SSd2ZSB0cmllZCB0byBkaWcgaW50bw0KPiByZXBvcnRzIGZyb20gcHJldmlvdXMgZGV2ZWxvcGVy
IG1lZXRpbmdzIFsxXVsyXSBidXQgY291bGRuJ3QgZmluZCBhbnl0aGluZw0KPiBjb25jcmV0ZS4g
UGVyaGFwcyBZYW5uIHN0aWxsIHJlbWVtYmVycyBzb21ldGhpbmc/IEkgZG8gcmVtZW1iZXIgd2Ug
DQo+IGxvb2tlZCBhdCBpdA0KPiBpbiBkZXB0aCBpbiB0aGUgaGFja2F0b24gYXQgWWFubidzIHBs
YWNlLCBidXQgb2YgY291cnNlIEkgZG9uJ3QgcmVtZW1iZXIgDQo+IHdoYXQNCj4gdGhlIHByb2Js
ZW0gd2FzIHRoYXQgd2UgY291bGRuJ3QgcmVzb2x2ZSBhdCB0aGUgdGltZS4uLg0KDQpUaGFua3Mg
Zm9yIHRob3NlIGxpbmtzLiBUaGV5IGxvb2tzIGxpa2UgYSByZWFsbHkgZ29vZCBzdGFydGluZyBw
b2ludC4NCkkndmUgYWxyZWFkeSBydW4gaW50byB0aGUgZGVwZW5kZW5jeSBpc3N1ZSB3aXRoIG92
ZXJ3cml0aW5nIGZpbGVzLCBhbmQgDQpoYXZlIHNvbWUgaWRlYXMgZm9yIHNvbHZpbmcgaXQgb25j
ZSB0aGlzIHN5bmNpbmcgaXNzdWUgaXMgcmVzb2x2ZWQuDQoNCkJlc3QgcmVnYXJkcyAvLyBKb2hu
IEVybmJlcmcNCg0KPiANCj4gIMKgUmVnYXJkcywNCj4gIMKgQXJub3V0DQo+IA0KPj4NCj4+IEJl
c3QgcmVnYXJkcyAvLyBKb2huIEVybmJlcmcNCj4+DQo+Pj4NCj4+PiDCoMKgIFJlZ2FyZHMsDQo+
Pj4gwqDCoCBBcm5vdXQNCj4gDQo+IA0KPiBbMV0gaHR0cHM6Ly9lbGludXgub3JnL0J1aWxkcm9v
dDpEZXZlbG9wZXJEYXlzRUxDRTIwMTcjVG9wLSANCj4gbGV2ZWxfcGFyYWxsZWxfYnVpbGQNCj4g
WzJdDQo+IGh0dHBzOi8vZWxpbnV4Lm9yZy9CdWlsZHJvb3Q6RGV2ZWxvcGVyRGF5c0ZPU0RFTTIw
MjAjU3RhdHVzX29mX3RvcC0gDQo+IGxldmVsX3BhcmFsbGVsX2J1aWxkX3N1cHBvcnQuMkNfd2hl
cmVfZG9fd2VfZ29fZnJvbV90aGVyZQ0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
