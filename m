Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27016E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 14:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFDE9402B5;
	Sat, 14 Dec 2024 14:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6yt5zD2msnI; Sat, 14 Dec 2024 14:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B59340347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B59340347;
	Sat, 14 Dec 2024 14:12:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C08D1C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB404004A
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUJrJVowreJf for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 14:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78FF9400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78FF9400DD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78FF9400DD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:12:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8C80F19F58A;
 Sat, 14 Dec 2024 15:12:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48730])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 15:12:47 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 15:12:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214114808.2934481-1-peter@korsgaard.com>
References: <20241214114808.2934481-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6b4f687ccfba83e50f826b9f5790739c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734185568;
 bh=oQidbNOlRX/prSujFSghXS1+g2t0shQ6aVSQuoEhK+w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rhl7bhJknJiOT8QxFDSFwdL2Xc8he01DAtsHFr5quXks3CdUNqI4zctH3tn7cxah6
 V6tp5iMuY/oiVO2rBvJSgZpgI19yXAtSeicGCEIHoxcKUNSwfxIFe3xQ2lmSgABeQj
 DP3MIXzq2OvGxcQsXYxOIeDZFJ7sVkXog9GF2KYqbeTVFKHK9qSKtmfCVTW676vSUP
 CZ7Lm+0S0QqNcl8/CnsVj07ioqDt6RzyjLiYcsp3LqqZEBG7qmPq8a2OPGyzc2P6QS
 kqHZ+1vibTofnZFXzi/F/jhszXHAvu4kOCjfsMa+JldN9I1+1grdQtx0Z5Q/rS+3X4
 qyYDVmod3hlDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rhl7bhJk
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to version
 4.2.9
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTQvMTIvMjAyNCAxMjo0OCwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+IEZpeGVzIHRoZSBm
b2xsb3dpbmcgdnVsbmVyYWJpbGl0aWVzOgo+IAo+IDQuMi45Ogo+IAo+IENWRS0yMDI0LTExNTk1
OiB3bnBhLXNlYy0yMDI0LTE0IMK3IEZpdmVDbyBSQVAgZGlzc2VjdG9yIGluZmluaXRlIGxvb3AK
PiBodHRwczovL3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5L3ducGEtc2VjLTIwMjQtMTQKPiAK
PiBDVkUtMjAyNC0xMTU5Njogd25wYS1zZWMtMjAyNC0xNSDCtyBFQ01QIGRpc3NlY3RvciBjcmFz
aAo+IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNC0xNQo+
IAo+IDQuMi44Ogo+IAo+IENWRS0yMDI0LTk3ODE6IHducGEtc2VjLTIwMjQtMTMgwrcgQXBwbGVU
YWxrIGFuZCBSRUxPQUQgRnJhbWluZyAKPiBkaXNzZWN0b3IKPiBjcmFzaGVzCj4gaHR0cHM6Ly93
d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI0LTEzCj4gCj4gNC4yLjc6Cj4g
Cj4gQ1ZFLTIwMjQtODI1MDogd25wYS1zZWMtMjAyNC0xMSDCtyBOVExNU1NQIGRpc3NlY3RvciBj
cmFzaAo+IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNC0x
MQo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNv
bT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgo+IC0tLQo+ICBwYWNrYWdlL3dpcmVzaGFy
ay93aXJlc2hhcmsuaGFzaCB8IDYgKysrLS0tCj4gIHBhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFy
ay5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJrLmhh
c2ggCj4gYi9wYWNrYWdlL3dpcmVzaGFyay93aXJlc2hhcmsuaGFzaAo+IGluZGV4IDA2MTE5ODYx
ZjIuLjY0MmJjNTg2NmQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJr
Lmhhc2gKPiArKysgYi9wYWNrYWdlL3dpcmVzaGFyay93aXJlc2hhcmsuaGFzaAo+IEBAIC0xLDYg
KzEsNiBAQAo+IC0jIEZyb20gCj4gaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9kb3dubG9hZC9z
cmMvYWxsLXZlcnNpb25zL1NJR05BVFVSRVMtNC4yLjYudHh0Cj4gLXNoYTEgIGRiMDM3NGRjZTM2
MGI5OWQ4YWJiOWEzZjM0NzFmM2ZjOThkNmQwOTkgIHdpcmVzaGFyay00LjIuNi50YXIueHoKPiAt
c2hhMjU2ICAKPiA1ZWM2MDI4ZGYyOTA2OGQ4ODljOTg0ODliZjE5NGE4ODRiMDA4MzExMDZmZWEx
ZTkyMWZlYTNjNjVmMjAwM2Y1ICAKPiB3aXJlc2hhcmstNC4yLjYudGFyLnh6Cj4gKyMgRnJvbSAK
PiBodHRwczovL3d3dy53aXJlc2hhcmsub3JnL2Rvd25sb2FkL3NyYy9hbGwtdmVyc2lvbnMvU0lH
TkFUVVJFUy00LjIuOS50eHQKPiArc2hhMSAgZDFhYmJlMTEwNDUxZGFiOWU1N2M5ZWUxZmUwODky
ZTBkNmE3ZDUxNSAgd2lyZXNoYXJrLTQuMi45LnRhci54ego+ICtzaGEyNTYgIAo+IDYyYzJiNjY1
MmQ3ZjlhNTA2Njg4NjdiZDU3YjIxNjA5YzlhOWI2OTUwZjI2ZTdmMzBhMjRiMmRlMGU3MmRlZDMg
IAo+IHdpcmVzaGFyay00LjIuOS50YXIueHoKPiAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAg
c2hhMjU2ICAKPiA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2
OGE0MDQwMTA1MjFiODgwNjQzICAKPiBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2ly
ZXNoYXJrL3dpcmVzaGFyay5tayAKPiBiL3BhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5tawo+
IGluZGV4IDI0MjQzMDE5NGYuLmJhZGU2OGYyNTggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93aXJl
c2hhcmsvd2lyZXNoYXJrLm1rCj4gKysrIGIvcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJrLm1r
Cj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAK
PiAtV0lSRVNIQVJLX1ZFUlNJT04gPSA0LjIuNgo+ICtXSVJFU0hBUktfVkVSU0lPTiA9IDQuMi45
Cj4gIFdJUkVTSEFSS19TT1VSQ0UgPSB3aXJlc2hhcmstJChXSVJFU0hBUktfVkVSU0lPTikudGFy
Lnh6Cj4gIFdJUkVTSEFSS19TSVRFID0gaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9kb3dubG9h
ZC9zcmMvYWxsLXZlcnNpb25zCj4gIFdJUkVTSEFSS19MSUNFTlNFID0gd2lyZXNoYXJrIGxpY2Vu
c2UKPiAtLQo+IDIuMzkuNQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
