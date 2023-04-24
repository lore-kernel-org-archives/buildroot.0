Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFB0C7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 12:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7045B4159C;
	Mon, 24 Apr 2023 12:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7045B4159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_AqTX4RhLX7; Mon, 24 Apr 2023 12:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B239D4160B;
	Mon, 24 Apr 2023 12:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B239D4160B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FEF01C2AA3
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48B5640CBC
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48B5640CBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqWuNq00TYLY for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 12:12:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6498D40CB9
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6498D40CB9
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 12:12:03 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqv30-00AruW-16; Mon, 24 Apr 2023 14:11:58 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id f6cd9cab;
 Mon, 24 Apr 2023 12:11:56 +0000 (UTC)
Date: Mon, 24 Apr 2023 15:11:52 +0300
Message-ID: <20230424151152.GB3960430@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230227105838.358916-1-thomas.devoogdt@barco.com>
References: <20230227105838.358916-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1eSvLrPFxtwrghg2f1fpMDl7iaXG5PzdLo84bwz5Rmo=; b=XRE5Wr200a28Ad4hVHnPStwsI9
 K9ryHJxrtFl24vmhHtp5od8/phuBGniDSHMnHZXQB1Vno53iN/4TwUjahlfA0R99unN8+jlhZdOmX
 kTdpnSJhgRgXq3LeNWhZjoJ6JC3nHjbHPzIpTDjZ5bYSFSUrGrxg1uuNXlqmvrf0fRYnZ2UK5sq2L
 CZlvthzBMERV5Zrhbnnm1dPlGVUQs9fazjCm55/jTC3fAatN66flehx5qxy3dP7I/aXsj7rPbhr9e
 EOVeVUTPMbB1tmcnbiMJgUsdQM3m6RD3vI9tDmuGphOnkYn68sqCgAdj2mM0nCYFDSO/NRuVYbOSY
 Kim7HLiQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=XRE5Wr20
Subject: Re: [Buildroot] [PATCH v5 1/5] package/at-spi2-core: bump to
 version 2.47.1
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
Cc: Daniel Lang <d.lang@abatec.at>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5424053243840724901=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5424053243840724901==
Content-Type: multipart/signed; boundary="feHu+4JERElH97rq"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--feHu+4JERElH97rq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgYWxsLAoKT24gTW9uLCAyNyBGZWIgMjAyMyAxMTo1ODozNCArMDEwMCBUaG9tYXMgRGV2b29n
ZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IEZyb206IERhbmllbCBMYW5nIDxkLmxh
bmdAYWJhdGVjLmF0Pgo+IAo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9hdC1zcGky
LWNvcmUvLS9ibG9iL0FUX1NQSTJfQ09SRV8yXzQ3XzEvTkVXUwo+IAo+IC0gWDExIGlzIG5vdyBv
cHRpb25hbC4KPiAtIGxpYnhtbDIgaXMgbm8gbG9uZ2VyIG9wdGlvbmFsLgo+IC0gYXRrIGFuZCBh
dC1zcGkyLWF0ayBoYXZlIGJlZW4gbWVyZ2VkIGludG8gYXQtc3BpMi1jb3JlLgo+IC0gYXRrIGlu
dHJvc3BlY3Rpb24gb3B0aW9uIGFkZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMYW5n
IDxkLmxhbmdAYWJhdGVjLmF0Pgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhv
bWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KCkkgdGVzdGVkIHRoaXMgcGF0Y2ggc2VyaWVzIGFuZCBp
bmRlZWQgaXQgYWxzbyBzb2x2ZXMgdGhlIFdlYktpdEdUSyBidWlsZAppc3N1ZXMgY2F1c2VzIGJ5
IGF0ay1icmlkZ2UgYmVpbmcgbWlzc2luZy4gT3ZlcmFsbCBJIHByZWZlciB0aGlzIGFwcHJvYWNo
CmJldHRlciB0aGFuIHBhdGNoaW5nIGxpYmd0azMncyBNZXNvbiBidWlsZCBzeXN0ZW0gYXMgc3Vn
Z2VzdGVkIGluIGFub3RoZXIKcGF0Y2guCgpUaGVyZSBpcyBvbmUgaHVyZGxlLCB0aG91Z2g6IEkg
aGF2ZSB0byBtYWtlIG9uZSBwYXRjaCBmb3IgYXQtc3BpMi1jb3JlCmJlY2F1c2UgSSBoYXZlIGRi
dXMtYnJva2VyIGluc3RhbGxlZCBpbiBvbmUgb2YgbXkgY29tcHV0ZXJzIGFuZCB0cnlpbmcgdG8K
YnVpbGQgdGhlcmUgcmVzdWx0IGluIHRoZSBidWlsZCBjb25maWd1cmF0aW9uIHRoaW5raW5nIHRo
YXQgaXQgbmVlZHMgdG8KdXNlIGxpYnN5c3RlbWQgd2hlbiB0aGUgQnVpbGRyb290IGNvbmZpZ3Vy
YXRpb24gaGFzIGl0IGRpc2FibGVkLiBJIG1hZGUKdGhpcyBwYXRjaCB3aGljaCBzb2x2ZWQgdGhl
IGlzc3VlIGZvciBtZSwgYWx0aG91Z2ggSSBhbSBub3QgMTAwJSBzdXJlIGl0CmlzIHRoZSBiZXN0
IHdheSB0byBnbzoKCiAgaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2F0LXNwaTItY29y
ZS8tL21lcmdlX3JlcXVlc3RzLzEzNAoKV2UgbWF5IHdhbnQgdG8gaW5jbHVkZSB0aGlzIHBhdGNo
IChvciBhIHNpbWlsYXIgb25lKSB3aGlsZSB1cHN0cmVhbSBkb2VzCm5vdCBoYXZlIGEgc29sdXRp
b24gZm9yIHRoaXMgaXNzdWUuCgo+IC0tLQo+IHYzOgo+ICAtIHJlYmFzZWQgb24gaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzM2MjU0
Cj4gIC0gbmVlZGVkIHRvIGZpeCB0aGUgd2Via2l0Z3RrIDIuMzguNSBjb21waWxhdGlvbgo+ICAg
IChodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIw
MjMwMjIwMDkwOTIzLjIxNTU2MzUtMi10aG9tYXMuZGV2b29nZHRAYmFyY28uY29tLykKPiB2NTog
cmViYXNlZCArIGdyb3VwZWQgcGF0Y2hlcwo+IC0tLQo+ICBwYWNrYWdlL2F0LXNwaTItY29yZS9D
b25maWcuaW4gICAgICAgICB8ICA4ICsrLS0tLS0tCj4gIHBhY2thZ2UvYXQtc3BpMi1jb3JlL2F0
LXNwaTItY29yZS5oYXNoIHwgIDQgKystLQo+ICBwYWNrYWdlL2F0LXNwaTItY29yZS9hdC1zcGky
LWNvcmUubWsgICB8IDIwICsrKysrKysrKysrKysrKysrLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvYXQtc3BpMi1jb3JlL0NvbmZpZy5pbiBiL3BhY2thZ2UvYXQtc3BpMi1jb3JlL0NvbmZpZy5p
bgo+IGluZGV4IGY1NmM1YjkzYzQuLjFmNmM0MjE3NzcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9h
dC1zcGkyLWNvcmUvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9hdC1zcGkyLWNvcmUvQ29uZmln
LmluCj4gQEAgLTEsMTIgKzEsMTIgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0FUX1NQSTJfQ09S
RQo+ICAJYm9vbCAiYXQtc3BpMi1jb3JlIgo+IC0JZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9YT1JH
NyAjIHhsaWItbGlieHRzdAo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURT
ICMgZGJ1cywgZ2xpYjIKPiAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBnbGliMgo+ICAJZGVw
ZW5kcyBvbiBCUjJfVVNFX1dDSEFSICMgZ2xpYjIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9EQlVT
Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCR0xJQjIKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9Y
TElCX0xJQlhUU1QKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJYTUwyCj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfWExJQl9MSUJYVFNUIGlmIEJSMl9QQUNLQUdFX1hPUkc3ICMgb3B0aW9uYWxseSBm
b3IgWDExCj4gIAloZWxwCj4gIAkgIFRoZSBBdC1TcGkyIENvcmUgcGFja2FnZSBpcyBhIHBhcnQg
b2YgdGhlIEdOT01FCj4gIAkgIEFjY2Vzc2liaWxpdHkgUHJvamVjdC4gSXQgcHJvdmlkZXMgYSBT
ZXJ2aWNlIFByb3ZpZGVyCj4gQEAgLTE5LDcgKzE5LDMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0FU
X1NQSTJfQ09SRQo+ICBjb21tZW50ICJhdC1zcGkyLWNvcmUgbmVlZHMgYSB0b29sY2hhaW4gdy8g
d2NoYXIsIHRocmVhZHMiCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4gIAlkZXBlbmRzIG9u
ICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCj4gLQo+IC1jb21t
ZW50ICJhdC1zcGkyLWNvcmUgZGVwZW5kcyBvbiBYLm9yZyIKPiAtCWRlcGVuZHMgb24gQlIyX1VT
RV9NTVUKPiAtCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX1hPUkc3Cj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5oYXNoIGIvcGFja2FnZS9hdC1zcGkyLWNv
cmUvYXQtc3BpMi1jb3JlLmhhc2gKPiBpbmRleCA3NjRlNGMzNjYxLi40NTMxYmYzOTZjIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5oYXNoCj4gKysrIGIv
cGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAK
PiAtIyBGcm9tIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvYXQtc3BpMi1jb3Jl
LzIuMzYvYXQtc3BpMi1jb3JlLTIuMzYuMC5zaGEyNTZzdW0KPiAtc2hhMjU2ICA4OGRhNTdkZTBh
N2UzYzYwYmMzNDFhOTc0YTgwZmRiYTA5MTYxMmRiMzU0N2M0MTBkNmRlYWIwMzljYTVjMDVhICBh
dC1zcGkyLWNvcmUtMi4zNi4wLnRhci54ego+ICsjIEZyb20gaHR0cHM6Ly9kb3dubG9hZC5nbm9t
ZS5vcmcvc291cmNlcy9hdC1zcGkyLWNvcmUvMi40Ny9hdC1zcGkyLWNvcmUtMi40Ny4xLnNoYTI1
NnN1bQo+ICtzaGEyNTYgIGM2YmE3YzE2MDQzNGVkZWJmMDlkMjkzNjkzMzU2OWM5MzZmNmVjOTcy
MzAxNzY2ZjJiZGFjNWE0ZDQxODE1M2MgIGF0LXNwaTItY29yZS0yLjQ3LjEudGFyLnh6Cj4gIAo+
ICAjIGxvY2FsbHkgY2FsY3VsYXRlZAo+ICBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYz
ZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJTkcKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLm1rIGIvcGFja2FnZS9h
dC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLm1rCj4gaW5kZXggZjBiMDE5YzBlZC4uZTk4ZTc3OTg4
NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2F0LXNwaTItY29yZS9hdC1zcGkyLWNvcmUubWsKPiAr
KysgYi9wYWNrYWdlL2F0LXNwaTItY29yZS9hdC1zcGkyLWNvcmUubWsKPiBAQCAtNCwxNyArNCwz
MSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1BVF9TUEkyX0NPUkVf
VkVSU0lPTl9NQUpPUiA9IDIuMzYKPiAtQVRfU1BJMl9DT1JFX1ZFUlNJT04gPSAkKEFUX1NQSTJf
Q09SRV9WRVJTSU9OX01BSk9SKS4wCj4gK0FUX1NQSTJfQ09SRV9WRVJTSU9OX01BSk9SID0gMi40
Nwo+ICtBVF9TUEkyX0NPUkVfVkVSU0lPTiA9ICQoQVRfU1BJMl9DT1JFX1ZFUlNJT05fTUFKT1Ip
LjEKPiAgQVRfU1BJMl9DT1JFX1NPVVJDRSA9IGF0LXNwaTItY29yZS0kKEFUX1NQSTJfQ09SRV9W
RVJTSU9OKS50YXIueHoKPiAgQVRfU1BJMl9DT1JFX1NJVEUgPSBodHRwczovL2Rvd25sb2FkLmdu
b21lLm9yZy9zb3VyY2VzL2F0LXNwaTItY29yZS8kKEFUX1NQSTJfQ09SRV9WRVJTSU9OX01BSk9S
KQo+ICBBVF9TUEkyX0NPUkVfTElDRU5TRSA9IExHUEwtMi4xKwo+ICBBVF9TUEkyX0NPUkVfTElD
RU5TRV9GSUxFUyA9IENPUFlJTkcKPiAgQVRfU1BJMl9DT1JFX0lOU1RBTExfU1RBR0lORyA9IFlF
Uwo+IC1BVF9TUEkyX0NPUkVfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGRidXMgbGliZ2xp
YjIgeGxpYl9saWJYdHN0IFwKPiArQVRfU1BJMl9DT1JFX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtn
Y29uZiBkYnVzIGxpYmdsaWIyIGxpYnhtbDIgXAo+ICAJJChUQVJHRVRfTkxTX0RFUEVOREVOQ0lF
UykKPiAgQVRfU1BJMl9DT1JFX0NPTkZfT1BUUyA9IC1EZGJ1c19kYWVtb249L3Vzci9iaW4vZGJ1
cy1kYWVtb24KPiAgCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfWE9SRzcpLHkpCj4gK0FUX1NQSTJf
Q09SRV9DT05GX09QVFMgKz0gLUR4MTE9ZW5hYmxlZAo+ICtBVF9TUEkyX0NPUkVfREVQRU5ERU5D
SUVTICs9IHhsaWJfbGliWHRzdAo+ICtlbHNlCj4gK0FUX1NQSTJfQ09SRV9DT05GX09QVFMgKz0g
LUR4MTE9ZGlzYWJsZWQKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfR09CSkVD
VF9JTlRST1NQRUNUSU9OKSx5KQo+ICtBVF9TUEkyX0NPUkVfQ09ORl9PUFRTICs9IC1EaW50cm9z
cGVjdGlvbj1lbmFibGVkCj4gK0FUX1NQSTJfQ09SRV9ERVBFTkRFTkNJRVMgKz0gZ29iamVjdC1p
bnRyb3NwZWN0aW9uCj4gK2Vsc2UKPiArQVRfU1BJMl9DT1JFX0NPTkZfT1BUUyArPSAtRGludHJv
c3BlY3Rpb249ZGlzYWJsZWQKPiArZW5kaWYKPiArCj4gIEFUX1NQSTJfQ09SRV9MREZMQUdTID0g
JChUQVJHRVRfTERGTEFHUykgJChUQVJHRVRfTkxTX0xJQlMpCj4gIAo+ICAkKGV2YWwgJChtZXNv
bi1wYWNrYWdlKSkKPiAtLSAKPiAyLjM5LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--feHu+4JERElH97rq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZEZyCAAKCRCRxVnb5MkS
Oz2XAJ9ZmJ5BKVtgcw2ABLSbz3donYZ5xgCdFgDjxMoLymOp4LlYHSBjTcVV5xQ=
=GVAv
-----END PGP SIGNATURE-----

--feHu+4JERElH97rq--

--===============5424053243840724901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5424053243840724901==--
