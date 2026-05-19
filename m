Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBD6CD4F52
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 08:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE55A40AF6;
	Tue, 19 May 2026 08:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91vF2SRe_q6O; Tue, 19 May 2026 08:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D847040B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779179400;
	bh=T/5IB2wTrSw07sSv+5w+BkgS6v+vYrL5914YxQioIjw=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F1sZE3elk7svNHEhlKB10w1xukfi1Wew6QZx/pM4o1XOl2T9PWsA8w68R+18ySms9
	 wDQsAPAZKOQ1mRmhTJCIo8nhutWiTMiPThESL3nDDQosAclpRlBtg/1I2IHQY5IuHQ
	 b+JkGdffwrKJzhEbCU/YFATX7x8J/ppqdlLDDGMO+3du7w57hxTyN4rzjWMuJiUmV9
	 raxA28tItTJwPDK50Sdz8RUpFm1246E1+oSwR7VRoCJQAd4cMp8wE6fDLneBGBtkMs
	 /YZTJThVOA8xfKlhPh9WXSsyPEBcha+LaWvcFEXIiOMTyZAalrUeb1cRgH5ivPFaox
	 FnHnpI8pwwQsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D847040B0C;
	Tue, 19 May 2026 08:30:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2EF7265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 08:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6E660891
 for <buildroot@buildroot.org>; Tue, 19 May 2026 08:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rujkHO86AvZ for <buildroot@buildroot.org>;
 Tue, 19 May 2026 08:29:57 +0000 (UTC)
X-Greylist: delayed 905 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 May 2026 08:29:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9FC46088D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9FC46088D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9FC46088D
 for <buildroot@buildroot.org>; Tue, 19 May 2026 08:29:55 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 19 May
 2026 10:14:46 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Tue, 19 May 2026 10:14:46 +0200
To: Arnout Vandecappelle <arnout@rnout.be>, John Ernberg <j@j-ernberg.se>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [RESEND PATCH 6/8] package/pkg-generic: Purge files
 that should not be installed by INSTALL_CMDS
Thread-Index: AQHc4LSeZUofNSCdq0KBdEFuo3n2ArYUGLgAgADTcYA=
Date: Tue, 19 May 2026 08:14:46 +0000
Message-ID: <319a870a-1ea0-4bb9-ac93-cded4c2b6373@actia.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-7-j@j-ernberg.se>
 <a9341fd4-57b1-4964-926a-81a7a27770bf@rnout.be>
In-Reply-To: <a9341fd4-57b1-4964-926a-81a7a27770bf@rnout.be>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445F617164
Content-ID: <4C6476FC3360154B92ECAAAA052A3720@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [RESEND PATCH 6/8] package/pkg-generic: Purge files
 that should not be installed by INSTALL_CMDS
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

SGkgQXJub3V0LA0KDQpPbiA1LzE4LzI2IDk6MzcgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdy
b3RlOg0KPiANCj4gDQo+IE9uIDEwLzA1LzIwMjYgMjE6MzgsIEpvaG4gRXJuYmVyZyB3cm90ZToN
Cj4+IFBhY2thZ2VzIHN1Y2ggYXMgbXV0dCwgYmFzaCBhbmQgZ2RiIGFyZSBlaXRoZXIgZ2VuZXJh
dGluZyB0aGVpciB0YXItYmFsbHMNCj4+IGluY29ycmVjdGx5LCBvciBicmVhayBhdXRvbWFrZSB3
aXRoIGN1c3RvbSBkaXJlY3RpdmVzLCBpbiBzdWNoIGEgd2F5IHRoYXQNCj4+IEFNX1VQREFURV9J
TkZPX0RJUj1ubyBkb2Vzbid0IHdvcmsgdG8gYXZvaWQgdXBkYXRpbmcgdGhlDQo+PiAvdXNyL3No
YXJlL2luZm8vZGlyIGZpbGUuDQo+Pg0KPj4gQWRkIGEgcG9zdC1pbnN0YWxsIGhvb2sgdG8gYm90
aCBzdGFnaW5nIGFuZCB0YXJnZXQgdG8gZGVsZXRlIGZpbGVzIA0KPj4gdGhhdCBhcmUNCj4+IG5l
ZWRsZXNzbHkgZ2VuZXJhdGVkIGFuZCBjb25mbGljdCB3aXRoIG90aGVyIHBhY2thZ2VzIHBvc3Qt
aW5zdGFsbCB3aGVuDQo+PiBidWlsZGluZyB3aXRoIFBQRCBlbmFibGVkLg0KPj4NCj4+IFNpbmNl
IHRoZSBjdXJyZW50bHkgbGlzdGVkIGZpbGUgaXMgZG9jdW1lbnRhdGlvbiByZWxhdGVkLCB3aGlj
aCBlbmRzIHVwDQo+PiBkZWxldGVkIGFueXdheSwgdGhlcmUgaXMgbm8gVEFSR0VUX0ZJTkFMSVpF
IGhvb2sgcHJvdmlkZWQgdG8gZ2VuZXJhdGUgdGhlDQo+PiBmaWxlIGF0IGEgbGF0ZXIgcG9pbnQu
DQo+Pg0KPj4gVGhlIHBvc3QtaW5zdGFsbCBob29rIGlzIGFkZGVkIGF0IHRoZSBnbG9iYWwgbGV2
ZWwgZm9yIGVhc2llciANCj4+IGV4dGVuc2lvbiBhbmQNCj4+IGFsc28gY292ZXIgbm9uLWF1dG9t
YWtlIGJhc2VkIHBhY2thZ2VzIHRoYXQgY291bGQgYmUgc2ltaWxhcmx5IGJyb2tlbi4NCj4gDQo+
ICDCoElzbid0IHRoaXMgYWxyZWFkeSBkb25lIGJ5IHJlbW92ZS1jb25mbGljdGluZy11c2VsZXNz
LWZpbGVzPyBJZiB0aGF0IA0KPiBkb2Vzbid0DQo+IHdvcmssIHBsZWFzZSB0cnkgdG8gZml4IGl0
IHJhdGhlciB0aGFuIGFkZGluZyB5ZXQgYW5vdGhlciBtZWNoYW5pc20uDQo+IA0KPiAgwqAoTWFy
a2VkIGFzIENoYW5nZXMgUmVxdWVzdGVkIGluIHBhdGNod29yay4pDQo+IA0KPiAgwqBSZWdhcmRz
LA0KPiAgwqBBcm5vdXQNCj4gDQpJIHdhcyBsb29raW5nIGZvciBhbiBleGlzdGluZyBtZWNoYW5p
c20gYW5kIGNvbXBsZXRlbHkgbWlzc2VkIGl0LCBoZW5jZSANCnRoaXMgb25lLg0KDQpMb29raW5n
IGF0IGl0LCBpdCBsb29rcyBsaWtlIGl0J3MgYWxyZWFkeSB0cnlpbmcgdG8gaGFuZGxlIHRoaXMg
c2FtZSANCmZpbGUgYW5kIGZhaWxzIGJlY2F1c2UgdGhlIHBhdGggaXMgd3JvbmcuLi4gSSdsbCBo
YXZlIGEgZGlnIGFuZCBzZW5kIFYyIA0Kd2hlbiBJIGhhdmUgc29tZXRoaW5nLg0KDQpUaGFua3Mh
IC8vIEpvaG4gRXJuYmVyZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
