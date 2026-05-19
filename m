Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22B7CD4F52
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 08:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B32CD81303;
	Tue, 19 May 2026 08:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2mLTU0GUQPK; Tue, 19 May 2026 08:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF5681304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779179410;
	bh=idKTaqQHIcTLnXho9Of7FDG70mWe+T2c/ZRng81JURA=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=AEMJnZUXKkVXs13YKzWLPeaXJxGkgyRAiNU6jE0sIPvD2Bin7W5tzACu3B9sYBFmX
	 BtXqlgalLZ5v0l8MpWNgshyRHpLPXBh4vVb4C3yrbceryKos1AO3nOh0UPeCIc9NS8
	 674XprCBhbTalc0A8XIRRNKfmGAHbMDhf5es+g+LTRQbIZRr9/j86dvdeEq1qN+g10
	 Wy0cB5atAqpY1EKbf8JIj6Wfi28vWmhmXbg8HtOTBknYFlOxCoH3impjBS0+Qh+3Is
	 V1YCs8ozCzZNSowMIK3qtdtXy3zRWN8dH7epDm23vIo+u/KcFXDV66COxg4YCAbH0h
	 psUjiRakdOhVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBF5681304;
	Tue, 19 May 2026 08:30:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9EC3265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 08:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFFE960891
 for <buildroot@buildroot.org>; Tue, 19 May 2026 08:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sac5wZ5dYJKz for <buildroot@buildroot.org>;
 Tue, 19 May 2026 08:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A57C6088D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A57C6088D
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A57C6088D
 for <buildroot@buildroot.org>; Tue, 19 May 2026 08:30:08 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 19 May
 2026 10:30:03 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Tue, 19 May 2026 10:30:03 +0200
To: Arnout Vandecappelle <arnout@rnout.be>, John Ernberg <j@j-ernberg.se>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [RESEND PATCH 8/8] package/tpm2-tss: Correctly
 depend on util-linux-libs for fapi support
Thread-Index: AQHc4LSjPZZWXQ9OwkebnNmEgMwF+LYUHwYAgADRaoA=
Date: Tue, 19 May 2026 08:30:03 +0000
Message-ID: <0d3ac09e-9899-4cea-b929-f8c866645ff3@actia.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-9-j@j-ernberg.se>
 <9576707c-2397-4598-b083-fec5a0271d21@rnout.be>
In-Reply-To: <9576707c-2397-4598-b083-fec5a0271d21@rnout.be>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B1445F617164
Content-ID: <EE0398E794A41B44A455BF97B897AD00@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [RESEND PATCH 8/8] package/tpm2-tss: Correctly
 depend on util-linux-libs for fapi support
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

SGkgQXJub3V0LA0KDQpPbiA1LzE4LzI2IDEwOjAwIFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3
cm90ZToNCj4gDQo+IA0KPiBPbiAxMC8wNS8yMDI2IDIxOjM4LCBKb2huIEVybmJlcmcgd3JvdGU6
DQo+PiB0cG0yLXRzcyBpcyBhIGRlcGVuZGVuY3kgb2Ygc3lzdGVtZCwgd2hpY2ggd2hlbiBlbmFi
bGVkIGJlY29tZXMgYQ0KPj4gZGVwZW5kZW5jeSBvZiB1dGlsLWxpbnV4Lg0KPj4NCj4+IHRwbTIt
dHNzIG9ubHkgcmVhbGx5IHdhbnRzIGxpYnV1aWQsIHNvIGRlcGVuZCBvbiB1dGlsLWxpbnV4LWxp
YnMgaW5zdGVhZA0KPj4gYnJlYWtpbmcgdGhlIGRlcGVuZGVuY3kgY3ljbGUuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogSm9obiBFcm5iZXJnIDxqQGotZXJuYmVyZy5zZT4NCj4+IC0tLQ0KPj4NCj4+
IFJFU0VORDoNCj4+IMKgIC0gRm9yZ290IHRvIHN1YnNjcmliZSB0aGlzIGUtbWFpbCB0byB0aGUg
bGlzdA0KPj4NCj4+IMKgIHBhY2thZ2UvdHBtMi10c3MvdHBtMi10c3MubWsgfCAyICstDQo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS90cG0yLXRzcy90cG0yLXRzcy5tayBiL3BhY2thZ2UvdHBtMi10
c3MvdHBtMi10c3MubWsNCj4+IGluZGV4IDA4ZmY0MDEzMjguLjExZGEzN2E1YjQgMTAwNjQ0DQo+
PiAtLS0gYS9wYWNrYWdlL3RwbTItdHNzL3RwbTItdHNzLm1rDQo+PiArKysgYi9wYWNrYWdlL3Rw
bTItdHNzL3RwbTItdHNzLm1rDQo+PiBAQCAtMzMsNyArMzMsNyBAQCBUUE0yX1RTU19DT05GX09Q
VFMgPSBcDQo+PiDCoCBUUE0yX1RTU19DT05GX0VOViArPSBDRkxBR1M9IiQoVEFSR0VUX0NGTEFH
UykgLXN0ZD1jOTkiDQo+Pg0KPj4gwqAgaWZlcSAoJChCUjJfUEFDS0FHRV9UUE0yX1RTU19GQVBJ
KSx5KQ0KPj4gLVRQTTJfVFNTX0RFUEVOREVOQ0lFUyArPSBqc29uLWMgbGliY3VybCB1dGlsLWxp
bnV4DQo+PiArVFBNMl9UU1NfREVQRU5ERU5DSUVTICs9IGpzb24tYyBsaWJjdXJsIHV0aWwtbGlu
dXgtbGlicw0KPiANCj4gIMKgVGhpcyBhbHNvIHJlcXVpcmVzIHNlbGVjdGluZyBVVElMX0xJTlVY
X0xJQlMgaW4gQ29uZmlnLmluLCBvdGhlcndpc2UgDQo+IHlvdSBnZXQNCj4gdGhlIGZvbGxvd2lu
ZyBlcnJvciB3aGVuIG9ubHkgdHBtMi10c3MgaXMgc2VsZWN0ZWQgKGFuZCBub3QgZS5nLiBzeXN0
ZW1kKS4NCj4gDQo+ICoqKiB1dGlsLWxpbnV4LWxpYnMgaXMgaW4gdGhlIGRlcGVuZGVuY3kgY2hh
aW4gb2YgdHBtMi10c3MgdGhhdCBoYXMgDQo+IGFkZGVkIGl0IHRvDQo+IGl0cyBfREVQRU5ERU5D
SUVTIHZhcmlhYmxlIHdpdGhvdXQgc2VsZWN0aW5nIGl0IG9yIGRlcGVuZGluZyBvbiBpdCBmcm9t
IA0KPiBDb25maWcuaW4uDQo+IA0KDQpJIGRpZCBub3Qgc2VlIHRoYXQgZXJyb3Igd2hlbiBJIHdh
cyB0ZXN0aW5nIG15IHBhdGNoLiBJcyB0aGVyZSBzb21ldGhpbmcgDQpzcGVjaWZpYyBJIGNhbiBy
dW4gdGhhdCBJIG92ZXJsb29rZWQgdG8gYmV0dGVyIGNhdGNoIHRoZXNlIHRoaW5ncyBiZWZvcmUg
DQpzZW5kaW5nIHRoZSBwYXRjaGVzPw0KDQpUaGFua3MhIC8vIEpvaG4gRXJuYmVyZwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
