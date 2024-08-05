Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DDCC3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 13:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F6A4029B;
	Mon,  5 Aug 2024 13:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K50sVJWzpzL5; Mon,  5 Aug 2024 13:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1FA340281
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1FA340281;
	Mon,  5 Aug 2024 13:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A11681BF334
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AF8F40281
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUczZyS2apO3 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 13:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23DE440232
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23DE440232
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23DE440232
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 13:24:44 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1saxhY-0087GW-KE; Mon, 05 Aug 2024 15:24:40 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id e45f30ac;
 Mon, 5 Aug 2024 13:24:39 +0000 (UTC)
Date: Mon, 5 Aug 2024 16:24:39 +0300
Message-ID: <20240805162439.GD3474121@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240712173734.30592e67@windsurf>
References: <20240627220223.6687-1-aperez@igalia.com>
 <20240627220223.6687-3-aperez@igalia.com> <20240712173734.30592e67@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mhGXG6xTCgNkJZuY8ZkSWwfecTyLz31xx7nMTZqjp+A=; b=hRGFfjzVGfEsbHSn+vOaliqkx6
 Ajyd1fpXHV5cxuvdDZLfDsHww4NwF7aJJb8NZ/iuE17DeEi8PDHMSEwsjaoJlcrLu6HLCcf07zQ/e
 72gFONv4mmqWnEocuUOyR71QCsNcAzRWj7+8MV3GjB3dczR4zC9o79eRZlxcPeFeDVz/4M+UQNv5J
 VRLiaUnNFJCqJxU4xVRfruq8XSpMTqvGNkePvQj1hRw0BGpsHJrT10MRK5L9rIk4PqiVcSGXqMq0K
 +tTXrD0Do4AXfkX5m292aH+px53uTDc+lE4i+ct2sLOb4Y8BNIQYhYhLe+a+EXUyZpkSZ0SsW1OEZ
 goGKEbPg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=hRGFfjzV
Subject: Re: [Buildroot] [PATCH 2/2] package/sysprof: update to version 46.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3105109562021269633=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3105109562021269633==
Content-Type: multipart/signed; boundary="T9vK2dLrgHlvC4uR"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--T9vK2dLrgHlvC4uR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAxMiBKdWwgMjAyNCAxNzozNzozNCArMDIwMCBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiBIZWxsbyBBZHJpYW4s
Cj4gCj4gT24gRnJpLCAyOCBKdW4gMjAyNCAwMTowMjoxOSArMDMwMAo+IEFkcmlhbiBQZXJleiBk
ZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiAKPiA+IEJyaW5nIFN5c3Byb2Yg
dHdlbHZlIHllYXJzIGludG8gdGhlIGZ1dHVyZSBieSB1cGRhdGluZyBpdCB0byB0aGUgbW9zdAo+
ID4gcmVjZW50IHJlbGVhc2UuIFRoZSBHVUkgbm93IHVzZXMgR1RLNCwgZm9yIHdoaWNoIHRoZXJl
IGlzIG5vdCB5ZXQgYQo+ID4gcGFja2FnZSwgc28gZm9yIG5vdyB0aGUgb3B0aW9uIGlzIHJlbW92
ZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJl
ekBpZ2FsaWEuY29tPgo+IAo+IFdvdWxkIHlvdSB3YW50IHRvIGJlIGFkZGVkIGluIHRoZSBERVZF
TE9QRVJTIGZpbGUgZm9yIHRoaXMgcGFja2FnZT8gWW91Cj4ganVzdCBkaWQgYSBiaWcgYnVtcCwg
aXQgd291bGQgbWFrZSBzZW5zZSBpZiB5b3UgaGVscGVkIGZpeGluZyB0aGUgYnVpbGQKPiBmYWls
dXJlcyB0aGF0IG1pZ2h0IHJlc3VsdHMgZm9yIHRoaXMgYnVtcCA6LSkKCkkgc3VwcG9zZSBpdCBt
YWtlcyBzZW5zZSwgSSB3aWxsIHNlbmQgYSBwYXRjaCBhZGRpbmcgbXlzZWxmIGFzIG1haW50YWlu
ZXIKZm9yIHRoZSBwYWNrYWdlIGxhdGVyIDotKQogCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9z
eXNwcm9mLzAwMDEtZGVmaW5lLU5UX0dOVV9CVUlMRF9JRC5wYXRjaCBiL3BhY2thZ2Uvc3lzcHJv
Zi8wMDAxLWRlZmluZS1OVF9HTlVfQlVJTERfSUQucGF0Y2gKPiA+IGRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gaW5kZXggZGNjMmNiZTY3Y2MuLjAwMDAwMDAwMDAwCj4gPiAtLS0gYS9wYWNr
YWdlL3N5c3Byb2YvMDAwMS1kZWZpbmUtTlRfR05VX0JVSUxEX0lELnBhdGNoCj4gPiArKysgL2Rl
di9udWxsCj4gCj4gRHJvcHBpbmcgdGhpcyBwYXRjaCByZXF1aXJlZCBhbiB1cGRhdGVkIGluIC5j
aGVja3BhY2thZ2VpZ25vcmUuCiAKT2gsIEkgc2VlLCB0aGFua3MgZm9yIGhhbmRsaW5nIGl0Lgog
Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXNwcm9mL0NvbmZpZy5pbiBiL3BhY2thZ2Uvc3lz
cHJvZi9Db25maWcuaW4KPiA+IGluZGV4IDM5MTMyNzRiZTRmLi40ZWExZDNlYmYxZCAxMDA2NDQK
PiA+IC0tLSBhL3BhY2thZ2Uvc3lzcHJvZi9Db25maWcuaW4KPiA+ICsrKyBiL3BhY2thZ2Uvc3lz
cHJvZi9Db25maWcuaW4KPiA+IEBAIC0xLDMxICsxLDI2IEBACj4gPiAgY29uZmlnIEJSMl9QQUNL
QUdFX1NZU1BST0YKPiA+ICAJYm9vbCAic3lzcHJvZiIKPiA+IC0JZGVwZW5kcyBvbiBCUjJfVVNF
X1dDSEFSICMgZ2xpYjIKPiA+IC0JZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURT
ICMgZ2xpYjIKPiA+IC0JZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGdsaWIyCj4gPiAtCSMgSW4g
aXRzIHV0aWwuaCBmaWxlLCBzeXNwcm9mIGNvbnRhaW5zIGFyY2hpdGVjdHVyZS1zcGVjaWZpYwo+
ID4gLQkjIGNvZGUKPiA+IC0JZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0IHx8IEJS
Ml9wb3dlcnBjIHx8IEJSMl9zaDRhIHx8IEJSMl9zaDRhZWIKPiA+ICsJZGVwZW5kcyBvbiBCUjJf
VVNFX1dDSEFSICMgZ2xpYjIsIGxpYmRleCwganNvbi1nbGliCj4gPiArCWRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGdsaWIyLCBsaWJkZXgsIGpzb24tZ2xpYiwgcG9sa2l0
Cj4gPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBnbGliMiwgbGliZGV4LCBqc29uLWdsaWIK
PiA+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83ICMgbGlidW53aW5k
LCBwb2xraXQKPiA+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJVTldJTkRfQVJDSF9TVVBQ
T1JUUwo+ID4gKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBwb2xraXQKPiAKPiBBbHNv
IGJlY2F1c2Ugb2YgbGlidW53aW5kLgo+IAo+ID4gKwlkZXBlbmRzIG9uICFCUjJfT1BUSU1JWkVf
RkFTVCAjIHBvbGtpdAo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSlNPTl9HTElCCj4gPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9MSUJERVgKPiA+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkdMSUIy
Cj4gPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJVTldJTkQKPiA+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX1BPTEtJVAo+ID4gIAloZWxwCj4gPiAgCSAgU3lzcHJvZiBpcyBhIHN0YXRpc3RpY2FsLCBz
eXN0ZW0td2lkZSBwcm9maWxlciB0aGF0IGNhbgo+ID4gIAkgIHByb2ZpbGUgdXNlciBhbmQga2Vy
bmVsIGNvZGUgdXNpbmcgdGhlIHBlcmYgQVBJLgo+ID4gIAo+ID4gIAkgIGh0dHA6Ly9zeXNwcm9m
LmNvbQo+ID4gIAo+ID4gLWlmIEJSMl9QQUNLQUdFX1NZU1BST0YKPiA+IC0KPiA+IC1jb25maWcg
QlIyX1BBQ0tBR0VfU1lTUFJPRl9HVUkKPiA+IC0JYm9vbCAic3lzcHJvZiBHVUkiCj4gPiAtCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCR1RLMgo+ID4gLQlzZWxlY3QgQlIyX1BBQ0tBR0VfTElC
R0xBREUKPiA+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX0dES19QSVhCVUYKPiA+IC0JaGVscAo+ID4g
LQkgIEdVSSBmb3IgdGhlIHN5c3Byb2Ygc3lzdGVtLXdpZGUgc3RhdGlzdGljYWwgcHJvZmlsZXIu
Cj4gPiAtCj4gPiAtZW5kaWYKPiA+IC0KPiA+IC1jb21tZW50ICJzeXNwcm9mIG5lZWRzIGEgdG9v
bGNoYWluIHcvIHdjaGFyLCB0aHJlYWRzIgo+ID4gK2NvbW1lbnQgInN5c3Byb2YgbmVlZHMgYSB0
b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJheSwgd2NoYXIsIHRocmVhZHMsIGdjYyA+PSA3Igo+
ID4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4gPiAtCWRlcGVuZHMgb24gQlIyX2kzODYgfHwg
QlIyX3g4Nl82NCB8fCBCUjJfcG93ZXJwYyB8fCBCUjJfc2g0YSB8fCBCUjJfc2g0YWViCj4gPiAt
CWRlcGVuZHMgb24gIUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMK
PiA+ICsJZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hBUiB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhS
RUFEUyB8fCBcCj4gPiArCQkhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyB8fCBcCj4gPiAr
CQkhQlIyX1BBQ0tBR0VfTElCVU5XSU5EX0FSQ0hfU1VQUE9SVFMgfHwgXAo+IAo+IEJSMl9QQUNL
QUdFX0xJQlVOV0lORF9BUkNIX1NVUFBPUlRTIGlzIGFuIGFyY2hpdGVjdHVyZSBkZXBlbmRlbmN5
LCBzbwo+IGl0IHNob3VsZCBoYXZlIGJlZW4gaGFuZGxlZCBsaWtlIEJSMl9VU0VfTU1VLgo+IAo+
ID4gKwkJQlIyX1NUQVRJQ19MSUJTIHx8IEJSMl9PUFRJTUlaRV9GQVNUCj4gCj4gSSBjaGFuZ2Vk
IHRoZSBoYW5kbGluZyBvZiBCUjJfT1BUSU1JWkVfRkFTVCB0byBiZSBsaWtlIHdoYXQgcG9sa2l0
IGRvZXM6Cj4gCj4gY29tbWVudCAic3lzcHJvZiBjYW4ndCBiZSBidWlsdCB3aXRoIE9wdGltaXpl
IGZvciBmYXN0Igo+IAlkZXBlbmRzIG9uIEJSMl9PUFRJTUlaRV9GQVNUCj4gCj4gbm90IGFtYXpp
bmcsIGJ1dCBhdCBsZWFzdCBjb25zaXN0ZW50IHdpdGggcG9sa2l0Lgo+IAo+IEJUVywgcHJldHR5
IG1pbmQtYmxvd2luZyB0aGF0IHN5c3Byb2YgYWJzb2x1dGVseSByZXF1aXJlcyBwb2xraXQuLi4K
ClllYWgsIEkgd2FzIGhvcGluZyB0aGF0IHRoZXJlIHdvdWxkIGJlIGEgd2F5IG9mIGNvbmZpZ3Vy
aW5nIHRoZSBidWlsZCB0bwpkaXNhYmxlIHRoZSBwb2xraXQgZGVwZW5kZW5jeSwgYnV0IG5vdCBh
dCB0aGUgbW9tZW50LiBXZSdyZSBpbiBjb250YWN0IHdpdGgKQ2hyaXN0aWFuIEhlcmdlcnQgKHRo
ZSBjdXJyZW50IHN5c3Byb2YgbWFpbnRhaW5lcikgYW5kIGhlIGlzIG9wZW4gdG8gaGF2ZSBhCnBh
dGNoIHVwc3RyZWFtZWQgdG8gbWFrZSBwb2xraXQgb3B0aW9uYWwgYXQgYnVpbGQgdGltZS4gSSBk
b24ndCBoYXZlIGFuIEVUQQpidXQgSSBtaWdodCBiZSBhYmxlIHRvIHdvcmsgb24gdGhhdCBpbiB0
aGUgY29taW5nIHdlZWtzLiBPbmNlIHdlIGhhdmUgdGhhdApkb25lLCBJIHBsYW4gdG8gYnJpbmcg
dGhlIHBhdGNoIGludG8gQnVpbGRyb290ID0pCiAKPiA+IC1TWVNQUk9GX1ZFUlNJT04gPSAxLjIu
MAo+ID4gLVNZU1BST0ZfU0lURSA9IGh0dHA6Ly9zeXNwcm9mLmNvbQo+ID4gLVNZU1BST0ZfREVQ
RU5ERU5DSUVTID0gbGliZ2xpYjIKPiA+IC1TWVNQUk9GX0xJQ0VOU0UgPSBHUEwtMi4wKwo+ID4g
K1NZU1BST0ZfVkVSU0lPTl9NQUpPUiA9IDQ2Cj4gPiArU1lTUFJPRl9WRVJTSU9OID0gJChTWVNQ
Uk9GX1ZFUlNJT05fTUFKT1IpLjAKPiA+ICtTWVNQUk9GX1NPVVJDRSA9IHN5c3Byb2YtJChTWVNQ
Uk9GX1ZFUlNJT04pLnRhci54ego+ID4gK1NZU1BST0ZfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQu
Z25vbWUub3JnL3NvdXJjZXMvc3lzcHJvZi8kKFNZU1BST0ZfVkVSU0lPTl9NQUpPUikKPiA+ICtT
WVNQUk9GX0xJQ0VOU0UgPSBHUEwtMy4wKwo+ID4gIFNZU1BST0ZfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcKPiA+ICtTWVNQUk9GX0RFUEVOREVOQ0lFUyA9IGxpYmdsaWIyIGxpYmRleCBsaWJ1bndp
bmQganNvbi1nbGliIHBvbGtpdAo+ID4gK1NZU1BST0ZfQ09ORl9PUFRTICs9IFwKPiAKPiA9IGlu
c3RlYWQgb2YgKz0KCkFoLCBmaXJzdCBhc3NpZ25tZW50LCByaWdodC4gL21lIGZhY2VwYWxtcwog
Cj4gQXBwbGllZCB3aXRoIHRob3NlIGNoYW5nZXMuIFRoYW5rcyEKClxvLwoKQ2hlZXJzLArigJRB
ZHJpw6FuCg==

--T9vK2dLrgHlvC4uR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZrDSlwAKCRCRxVnb5MkS
O6muAJ9AtQgncy8p47xeF75cZGJRB7cpQQCfXXJhQGLZ0GEn3uzJmkgMVQvhjCE=
=X2uF
-----END PGP SIGNATURE-----

--T9vK2dLrgHlvC4uR--

--===============3105109562021269633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3105109562021269633==--
