Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33DFCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DB4980DB7;
	Mon,  2 Sep 2024 20:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oF2xUwtpmOdR; Mon,  2 Sep 2024 20:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C74A580DA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74A580DA3;
	Mon,  2 Sep 2024 20:21:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5702A1BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45088605AE
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVBGaKb2nhqR for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 117E06058D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 117E06058D
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 117E06058D
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:21:49 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1slDYY-008TWH-Nl; Mon, 02 Sep 2024 22:21:46 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 982e392e;
 Mon, 2 Sep 2024 20:21:44 +0000 (UTC)
Date: Mon, 2 Sep 2024 23:21:44 +0300
Message-ID: <20240902232144.GH1449890@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240802230644.69b29bac@windsurf>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240627193335.4069574-3-aperez@igalia.com>
 <20240802230644.69b29bac@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vvWTIxdsoAFidxeiHc41H/FfZcK9OM8pWybXd/R5ZbQ=; b=Dy1al91k7x3/ITHvFupKSxhv/j
 Co57LHXeziKsIJFnlyNwxNMqHVMDg4fR4DUo+1njBtayQcC5srHqy/d8zkJkO4TAWrW3FHQF5E5/P
 7ucpPaeJZuhMXuLNIv+QYYLeN6zH4DREvJnAsig15xhGfsuglcKmh/Awgn4AX1pGJUfASt5pRCS+w
 MhDc29/EXqm0SldCoEJhe0Du3y1Q0rI8gc3ekXi+S0S+MjbR1Fk1JFzwXbtpqhHytzJGMCRU86GnA
 IX65P0gXSHjLdCClPiAp7QKqH0enWb8EYyZ/9am87acf51trCCLmfmFbzniUt30U9P9dlotcyPrE7
 HgNbJdnQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Dy1al91k
Subject: Re: [Buildroot] [PATCH v2 2/4] package/cog: depend on
 wpebackend-fdo only if needed
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5968571042635959621=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5968571042635959621==
Content-Type: multipart/signed; boundary="wCdDoYAFtPBPzm2r"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--wCdDoYAFtPBPzm2r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBGcmksIDAyIEF1ZyAyMDI0IDIzOjA2OjQ0ICswMjAwIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgogCj4gT24g
VGh1LCAyNyBKdW4gMjAyNCAyMjozMzozMCArMDMwMAo+IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8g
PGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiAKPiA+IE1ha2UgdGhlIENvZyBoZWFkbGVzcyBw
bGF0Zm9ybSBwbHVnLWluIHNlbGVjdGFibGUsIGFsbG93aW5nIHRvIGNvbmZpZ3VyZQo+ID4gdGhl
IGJ1aWxkIHdpdGhvdXQgYW55IHBsdWctaW4gYXQgYWxsLiBXaGVuIGFsbCBwbHVnLWlucyBhcmUg
ZGlzYWJsZWQsCj4gPiBDb2cgZG9lcyBub3QgcmVxdWlyZSB3cGViYWNrZW5kLWZkbyBhdCBidWls
ZCB0aW1lLCBhbmQgaXQgaXMgc3RpbGwKPiA+IGFibGUgdG8gdXNlIGl0cyBidWlsdC1pbiAiZmFs
bGJhY2siIHN1cHBvcnQgdG8gbG9hZCBvdGhlciBXUEUgYmFja2VuZHMKPiA+IGxpa2Ugd3BlYmFj
a2VuZC1yZGsuCj4gCj4gVGhpcyBzZWVtcyB0byBtYWtlcyBzZW5zZSB0byBtZSwgYnV0IEkgY29t
cGxldGVseSBmYWlsIHRvIHVuZGVyc3RhbmQKPiB0aGUgY29tcGxpY2F0ZWQgaW1wbGVtZW50YXRp
b24geW91IGFyZSBwcm9wb3NpbmcgYmVsb3cuCgpPb3BzIE86LSkKCj4gVGhlcmUgaXMgaW4gZmFj
dCBzb21ldGhpbmcgYWxyZWFkeSBzdXBlciB3cm9uZyBpbiBwYWNrYWdlL2NvZzogaXQgaGFzCj4g
d3BlYmFja2VuZC1mZG8gaW4gQ09HX0RFUEVOREVOQ0lFUywgYnV0IGl0IGRvZXNuJ3Qgc2VsZWN0
IGl0LiBJdCB3b3Jrcwo+IGJlY2F1c2UgaXQgZGVwZW5kcyBvbiB3cGV3ZWJraXQsIHdoaWNoIGl0
c2VsZiBzZWxlY3RzIHdwZWJhY2tlbmQtZmRvLAo+IGJ1dCB0aGF0J3MgcmVhbGx5IHdyb25nLiBU
aGlzIHNob3VsZCBiZSBmaXhlZCBpbiBhIGZpcnN0IHBhdGNoLgoKWW91J3JlIHJpZ2h0IQogCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNv
bT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvY29nL0NvbmZpZy5pbiB8IDI4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrLS0KPiA+ICBwYWNrYWdlL2NvZy9jb2cubWsgICAgfCAxMyArKysrKysrKysr
LS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+ID4gCj4gPiAtLS0KPiA+IHYxIC0+IHYyOgo+ID4gLSBVbmNoYW5nZWQuCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2NvZy9Db25maWcuaW4gYi9wYWNrYWdlL2NvZy9Db25maWcuaW4K
PiA+IGluZGV4IGQyYTkxMGY5Yjg5Li5kNzA2YjA0NWIxNSAxMDA2NDQKPiA+IC0tLSBhL3BhY2th
Z2UvY29nL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9jb2cvQ29uZmlnLmluCj4gPiBAQCAt
MTksNiArMTksMTAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0NPRwo+ID4gIAo+ID4gIGlmIEJSMl9Q
QUNLQUdFX0NPRwo+ID4gIAo+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9DT0dfTkVFRFNfV1BFQkFD
S0VORF9GRE8KPiA+ICsJYm9vbAo+ID4gKwlkZWZhdWx0IG4KPiAKPiBJIGJlbGlldmUgdGhpcyBp
cyBub3QgbmVlZGVkLgo+IAo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9DT0dfUFJPR1JBTVNfSE9N
RV9VUkkKPiA+ICAJc3RyaW5nICJob21lIHVyaSIKPiA+ICAJZGVmYXVsdCAiaHR0cHM6Ly93cGV3
ZWJraXQub3JnIgo+ID4gQEAgLTMwLDYgKzM0LDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX0NPR19Q
Uk9HUkFNU19IT01FX1VSSQo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9DT0dfUExBVEZPUk1fRkRP
Cj4gPiAgCWJvb2wgIldheWxhbmQgYmFja2VuZCIKPiA+ICAJZGVmYXVsdCB5Cj4gPiArCWRlcGVu
ZHMgb24gQlIyX1BBQ0tBR0VfV1BFQkFDS0VORF9GRE8KPiA+ICsJc2VsZWN0IEJSMl9QQUNLQUdF
X0NPR19ORUVEU19XUEVCQUNLRU5EX0ZETwo+IAo+IElmIHRoZSBXYXlsYW5kIGJhY2tlbmQgbmVl
ZHMgd3BlYmFja2VuZC1mZG8sIGp1c3Qgc2VsZWN0IGl0Ogo+IAo+IAlzZWxlY3QgQlIyX1BBQ0tB
R0VfV1BFQkFDS0VORF9GRE8KPiAKPiA+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhLQkNPTU1P
Tgo+ID4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfV0FZTEFORF9QUk9UT0NPTFMKPiA+ICAJaGVscAo+
ID4gQEAgLTQzLDYgKzQ5LDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX0NPR19QTEFURk9STV9EUk0K
PiA+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfTElCR0JNCj4gPiAgCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfTElCR0JNX0hBU19GRUFUVVJFX0RNQV9CVUYKPiA+ICAJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9MSUJHQk1fSEFTX0ZFQVRVUkVfRk9STUFUX01PRElGSUVSX1BMQU5FX0NPVU5U
Cj4gPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfV1BFQkFDS0VORF9GRE8KPiA+ICsJc2VsZWN0
IEJSMl9QQUNLQUdFX0NPR19ORUVEU19XUEVCQUNLRU5EX0ZETwo+IAo+IElmIHRoZSBEUk0gYmFj
a2VuZCBuZWVkcyB3cGViYWNrZW5kLWZkbywganVzdCBzZWxlY3QgaXQ6Cj4gCj4gCXNlbGVjdCBC
UjJfUEFDS0FHRV9XUEVCQUNLRU5EX0ZETwo+IAo+ID4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElC
RFJNCj4gPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJJTlBVVAo+ID4gIAloZWxwCj4gPiBAQCAt
NTAsMTYgKzU4LDMyIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9DT0dfUExBVEZPUk1fRFJNCj4gPiAg
CSAgd2l0aCB2aWRlbyBkcml2ZXJzIHRoYXQgc3VwcG9ydCBrZXJuZWwgbW9kZS1zZXR0aW5nIChL
TVMpCj4gPiAgCSAgdmlhIHRoZSBEUk0gdXNlci1zcGFjZSBBUEkuCj4gPiAgCj4gPiArY29uZmln
IEJSMl9QQUNLQUdFX0NPR19QTEFURk9STV9IRUFETEVTUwo+ID4gKwlib29sICJIZWFkbGVzcyBi
YWNrZW5kIgo+ID4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1dQRUJBQ0tFTkRfRkRPCj4gPiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9DT0dfTkVFRFNfV1BFQkFDS0VORF9GRE8KPiAKPiBTYW1lLCBq
dXN0IHNlbGVjdCB3cGViYWNrZW5kLWZkby4KPiAKPiA+ICsJaGVscAo+ID4gKwkgIEVuYWJsZSB0
aGUgaGVhZGxlc3MgcGxhdGZvcm0gYmFja2VuZC4KPiA+ICsKPiA+ICBjb25maWcgQlIyX1BBQ0tB
R0VfQ09HX1VTRV9TWVNURU1fREJVUwo+ID4gIAlib29sICJleHBvc2Ugc3lzdGVtIEQtQnVzIGNv
bnRyb2wgaW50ZXJmYWNlIgo+ID4gIAloZWxwCj4gPiAgCSAgRXhwb3NlIHJlbW90ZSBjb250cm9s
IGludGVyZmFjZSBvbiBzeXN0ZW0gYnVzCj4gPiAgCj4gPiAtY29tbWVudCAiRFJNIHBsYXRmb3Jt
IG5lZWRzIEVHTCBhbmQgR0JNIgo+ID4gK2NvbW1lbnQgIkhlYWRsZXNzIHBsYXRmb3JtIG5lZWRz
IHdwZWJhY2tlbmQtZmRvIgo+ID4gKwlkZXBlbmRzIG9uIFwKPiA+ICsJCSFCUjJfUEFDS0FHRV9X
UEVCQUNLRU5EX0ZETwo+ID4gKwo+ID4gK2NvbW1lbnQgIkRSTSBwbGF0Zm9ybSBuZWVkcyBFR0ws
IEdCTSwgd3BlYmFja2VuZC1mZG8iCj4gPiAgCWRlcGVuZHMgb24gXAo+ID4gIAkJIUJSMl9QQUNL
QUdFX0hBU19MSUJFR0wgfHwgXAo+ID4gIAkJIUJSMl9QQUNLQUdFX0hBU19MSUJHQk0gfHwgXAo+
ID4gIAkJIUJSMl9QQUNLQUdFX0xJQkdCTV9IQVNfRkVBVFVSRV9ETUFfQlVGIHx8IFwKPiA+IC0J
CSFCUjJfUEFDS0FHRV9MSUJHQk1fSEFTX0ZFQVRVUkVfRk9STUFUX01PRElGSUVSX1BMQU5FX0NP
VU5UCj4gPiArCQkhQlIyX1BBQ0tBR0VfTElCR0JNX0hBU19GRUFUVVJFX0ZPUk1BVF9NT0RJRklF
Ul9QTEFORV9DT1VOVCB8fCBcCj4gPiArCQkhQlIyX1BBQ0tBR0VfV1BFQkFDS0VORF9GRE8KPiA+
ICsKPiA+ICtjb21tZW50ICJXYXlsYW5kIHBsYXRmb3JtIG5lZWRzIHdwZWJhY2tlbmQtZmRvIgo+
ID4gKwlkZXBlbmRzIG9uIFwKPiA+ICsJCSFCUjJfUEFDS0FHRV9XUEVCQUNLRU5EX0ZETwo+IAo+
IERyb3AgYWxsIHRob3NlIGNoYW5nZXMuCj4gCj4gPiAgZW5kaWYKPiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2NvZy9jb2cubWsgYi9wYWNrYWdlL2NvZy9jb2cubWsKPiA+IGluZGV4IDdmNjgwYmI3
MDA1Li4xNjZmMDk1MTE4YiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvY29nL2NvZy5tawo+ID4g
KysrIGIvcGFja2FnZS9jb2cvY29nLm1rCj4gPiBAQCAtOCw3ICs4LDcgQEAgQ09HX1ZFUlNJT04g
PSAwLjE4LjQKPiA+ICBDT0dfU0lURSA9IGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlcwo+
ID4gIENPR19TT1VSQ0UgPSBjb2ctJChDT0dfVkVSU0lPTikudGFyLnh6Cj4gPiAgQ09HX0lOU1RB
TExfU1RBR0lORyA9IFlFUwo+ID4gLUNPR19ERVBFTkRFTkNJRVMgPSBkYnVzIHdwZXdlYmtpdCB3
cGViYWNrZW5kLWZkbyB3YXlsYW5kCj4gPiArQ09HX0RFUEVOREVOQ0lFUyA9IGRidXMgd3Bld2Vi
a2l0IHdheWxhbmQKPiA+ICBDT0dfTElDRU5TRSA9IE1JVAo+ID4gIENPR19MSUNFTlNFX0ZJTEVT
ID0gQ09QWUlORwo+ID4gIENPR19DT05GX09QVFMgPSBcCj4gPiBAQCAtMTksOCArMTksNiBAQCBD
T0dfQ09ORl9PUFRTID0gXAo+ID4gIAktRGNvZ19ob21lX3VyaT0nJChjYWxsIHFzdHJpcCwkKEJS
Ml9QQUNLQUdFX0NPR19QUk9HUkFNU19IT01FX1VSSSkpJyBcCj4gPiAgCS1EcGxhdGZvcm1zPSck
KHN1YnN0ICQoc3BhY2UpLCQoY29tbWEpLCQoc3RyaXAgJChDT0dfUExBVEZPUk1TX0xJU1QpKSkn
Cj4gPiAgCj4gPiAtQ09HX1BMQVRGT1JNU19MSVNUID0gaGVhZGxlc3MKPiA+IC0KPiA+ICBpZmVx
ICgkKEJSMl9QQUNLQUdFX1dFU1RPTikseSkKPiA+ICBDT0dfQ09ORl9PUFRTICs9IC1Ed2F5bGFu
ZF93ZXN0b25fZGlyZWN0X2Rpc3BsYXk9dHJ1ZQo+ID4gIENPR19ERVBFTkRFTkNJRVMgKz0gd2Vz
dG9uCj4gPiBAQCAtMjgsNiArMjYsMTEgQEAgZWxzZQo+ID4gIENPR19DT05GX09QVFMgKz0gLUR3
YXlsYW5kX3dlc3Rvbl9kaXJlY3RfZGlzcGxheT1mYWxzZQo+ID4gIGVuZGlmCj4gPiAgCj4gPiAr
aWZlcSAoJChCUjJfUEFDS0FHRV9DT0dfUExBVEZPUk1fSEVBRExFU1MpLHkpCj4gPiArQ09HX1BM
QVRGT1JNU19MSVNUICs9IGhlYWRsZXNzCj4gPiArQ09HX0RFUEVOREVOQ0lFUyArPSB3cGViYWNr
ZW5kLWZkbwo+ID4gK2VuZGlmCj4gPiArCj4gPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9DT0dfUExB
VEZPUk1fRkRPKSx5KQo+ID4gIENPR19QTEFURk9STVNfTElTVCArPSB3YXlsYW5kCj4gPiAgQ09H
X0RFUEVOREVOQ0lFUyArPSBsaWJ4a2Jjb21tb24gd2F5bGFuZC1wcm90b2NvbHMKPiA+IEBAIC00
OCw0ICs1MSw4IEBAIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCTUFORVRURSkseSkKPiA+ICBDT0df
REVQRU5ERU5DSUVTICs9IGxpYm1hbmV0dGUKPiA+ICBlbmRpZgo+ID4gIAo+ID4gK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfQ09HX05FRURTX1dQRUJBQ0tFTkRfRkRPKSx5KQo+ID4gK0NPR19ERVBFTkRF
TkNJRVMgKz0gd3BlYmFja2VuZC1mZG8KPiA+ICtlbmRpZgo+IAo+IERyb3AgdGhpcywgYW5kIGlu
c3RlYWQgZG86Cj4gCj4gaWZlcSAoJChCUjJfUEFDS0FHRV9DT0dfUExBVEZPUk1fSEVBRExFU1Mp
LHkpCj4gQ09HX1BMQVRGT1JNU19MSVNUICs9IGhlYWRsZXNzCj4gQ09HX0RFUEVOREVOQ0lFUyAr
PSB3cGViYWNrZW5kLWZkbwo+IGVuZGlmCj4gCj4gaWZlcSAoJChCUjJfUEFDS0FHRV9DT0dfUExB
VEZPUk1fRkRPKSx5KQo+IENPR19QTEFURk9STVNfTElTVCArPSB3YXlsYW5kCj4gQ09HX0RFUEVO
REVOQ0lFUyArPSBsaWJ4a2Jjb21tb24gd2F5bGFuZC1wcm90b2NvbHMgd3BlYmFja2VuZC1mZG8K
PiBlbmRpZgo+IAo+IGlmZXEgKCQoQlIyX1BBQ0tBR0VfQ09HX1BMQVRGT1JNX0RSTSkseSkKPiBD
T0dfUExBVEZPUk1TX0xJU1QgKz0gZHJtCj4gQ09HX0RFUEVOREVOQ0lFUyArPSBsaWJkcm0gbGli
aW5wdXQgbGliZ2JtIGxpYmVnbCB1ZGV2IHdwZWJhY2tlbmQtZmRvCj4gZW5kaWYKCldpdGggdGhl
IGFkZGl0aW9uYWwgQlIyX1BBQ0tBR0VfQ09HX05FRURTX1dQRUJBQ0tFTkRfRkRPIGNvbmZpZ3Vy
YXRpb24Kc3ltYm9sIEkgd2FzIHRyeWluZyB0byBhdm9pZCBhZGRpbmcgd3BlYmFja2VuZC1mZG8g
bW9yZSB0aGFuIG9uY2UgdG8KQ09HX0RFUEVOREVOQ0lFUy4gSWYgaXQncyBmaW5lIHRvIGhhdmUg
aXQgdGhlcmUgKGFzIGl0IHNlZW1zIHRvIGJlIHRoZQpjYXNlKSB0aGVuIHllcywgSSBhbSBhYm9h
cmQgZm9yIGFsbCB0aGUgc2ltcGxpZmljYXRpb25zLgogCj4gQ291bGQgeW91IHJld29yayBhIHYz
IGFjY29yZGluZyB0byB0aG9zZSBzdWdnZXN0aW9ucz8KClllcywgd2lsbCByZS1zcGluIHRoaXMg
aW50byBhIHYzIGF0IHNvbWUgcG9pbnQuIFRoYW5rcyBmb3IgYWxsIHRoZQpyZWNvbW1lbmRhdGlv
bnMhCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--wCdDoYAFtPBPzm2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZtYeWAAKCRCRxVnb5MkS
O8z6AJ9C/jqe95dTN7jc6hJYt/0ugY02igCfUiKl+49Rt5Tq6PemjG5Mmfb0JQQ=
=OiPE
-----END PGP SIGNATURE-----

--wCdDoYAFtPBPzm2r--

--===============5968571042635959621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5968571042635959621==--
