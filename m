Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5638CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63049843CB;
	Fri, 15 May 2026 16:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDbTVi8_Bbup; Fri, 15 May 2026 16:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DCF7843CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778861006;
	bh=LlLrn9obChouoBsRxqxNaf8nDePcHDYBedhq3GKvWLc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IUdqLyvVooWLH7yG6JW6SrtCvgfGs4N2tsXtXu+yTZbwpbajQozmstGfecNjudvOk
	 JalsqL7VdGdrZCSAdTNZdx5eSrC0fE/1X0SgtpANkpmvtJAupx5SKdU/4pC1+R+gdf
	 bh69LkPsFjEb3uMZzssdenTbrvD7EiJSwjHpyg7Mwuneo0OtWGHBZtGqn/LFPfJZD1
	 SOEBYX4R64LL+eeXvHvCHKAEEBR3somPYloFm97gRaDbH/YAlK+V0F+uZmvTWuYQMp
	 xz7/dhd9xUXuvBAvbzvM8BHCR0xy+beR5pVn8oxblbZlCRtmNjWF9OWPBlnQ40Syvc
	 g4fcE8OhTcA5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DCF7843CE;
	Fri, 15 May 2026 16:03:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1A1AE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6966162E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4DQSDYAxJjY for <buildroot@buildroot.org>;
 Fri, 15 May 2026 16:03:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39F2561623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39F2561623
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39F2561623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:03:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 914A013F854;
 Fri, 15 May 2026 18:03:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 18:03:16 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 18:03:16 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org, Romain Naour
 <romain.naour@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <5b126290-bc03-43ca-b11f-134a828235d9@smile.fr>
References: <20260514-qemu-v11-0-0-v3-1-e64cbadaa8e5@anodize.com>
 <5b126290-bc03-43ca-b11f-134a828235d9@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <df5404cb93cf7c23fcc27a8aed20a31a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778861001;
 bh=+tSxjr+qEJU3ZCW1KRdvl4JoYXUd0ZZy9QrIEDMxPQA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e+oaP1v37Lpo8tFE2T1Rrrt3bW4uc8KUT1Vo0nek+AJ7eZMV1TdLjRKLrPlJ9XHlW
 V27b995T2PLZKztks6M7dH5MnTZY5rU16jKvFyfMkun+W1h1XJ4/T9IRrx5KIW9jgi
 lEx1mN/0uOGsRPnVskoUcEmEbszkuD0YMJddXpWtBm0xaZKZ5PLmUk/29I9EHXIZ9d
 UG47drjUG/eKdx5I1OY28xEx7cGDSi6ua56IAQLLAtbGukVySgr0hTuMgQV3JXH0Dn
 BYv9GKYiOJYX4uGaIwWjlGG4y9zI6/qX/xjzlQYgKpgnLNqCXXeLaYFYd+HNq/BLjc
 W1FhaTssZHyYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e+oaP1v3
Subject: Re: [Buildroot] [PATCH v3] package/qemu: bump to version 11.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gMTUvMDUvMjAyNiAxNTozNywgUm9tYWluIE5hb3VyIHZpYSBidWlsZHJv
b3Qgd3JvdGU6Cj4gSGVsbG8gSm9zZXBoLAo+IAo+IExlIDE0LzA1LzIwMjYgw6AgMjI6NDYsIEpv
c2VwaCBLb2d1dCBhIMOpY3JpdMKgOgo+PiBDaGFuZ2Vsb2c6Cj4+IGh0dHBzOi8vd2lraS5xZW11
Lm9yZy9DaGFuZ2VMb2cvMTEuMAo+PiAKPj4gTm90ZToKPj4gICAtIFN1cHBvcnQgZm9yIGFsbCAz
Mi1iaXQgaG9zdCBzeXN0ZW1zIGhhcyBiZWVuIHJlbW92ZWQuCj4+ICAgLSBTdXBwb3J0IGZvciBt
aWNyb2JsYXplZWwgaGFzIGJlZW4gZm9sZGVkIGludG8gdGhlIG1pY3JvYmxhemUgCj4+IHRhcmdl
dAo+PiAKPj4gUWVtdSB2MTEuMC4wIGRyb3BzIDMyLWJpdCBzdXBwb3J0IGZvciBob3N0cywgYWxs
IHFlbXUgYnVpbGRzIG11c3Qgbm93IAo+PiBiZQo+PiA2NC1iaXQuIEhvc3RzIHJ1bm5pbmcgNjQt
Yml0IHFlbXUgYnVpbGRzIGNhbiBzdGlsbCBlbXVsYXRlIDMyLWJpdAo+PiB0YXJnZXRzLgo+PiAK
Pj4gQ29uZnVzaW5nbHksIHRoZSBxZW11IHBhY2thZ2UgaXMgYWxzbyBjYXBhYmxlIG9mIGJlaW5n
IGJ1aWx0IGFuZCAKPj4gcnVubmluZwo+PiBvbiBidWlsZHJvb3QgaG9zdHMsIGFuZCB0YXJnZXRz
LiBJbiBhbnkgY2FzZSwgcWVtdSBvbmx5IHN1cHBvcnRzIAo+PiBydW5uaW5nCj4+IG9uIDY0LWJp
dCBob3N0cyAod2hpY2ggbWF5IGJlIGJ1aWxkcm9vdCB0YXJnZXRzKSwgc28gYWRqdXN0Cj4+IEJS
Ml9QQUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQgdG8gaW5kaWNhdGUgbm8gc3VwcG9y
dCBmb3IgCj4+IDMyLWJpdAo+PiBidWlsZHJvb3QgdGFyZ2V0cywgYW5kIGRyb3AgY29uZmlncyBm
b3IgYXJjaGl0ZWN0dXJlcyBsaWtlIEJSMl9hcm0gCj4+IHRoYXQKPj4gYXJlIGltcGxpY2l0bHkg
MzItYml0IG9ubHkuCj4+IAo+PiBTZXBhcmF0ZWx5LCB0aGUgcWVtdSBtaWNyb2JsYXplZWwgdGFy
Z2V0IHdhcyByZW1vdmVkIHdpdGggY29tbWl0Cj4+IDQ2YTI1YWUzZjBlNzVlMjMwYzA2ZTIxNDM1
ODUwYjFjZDFjNDRmMDcsIGFzIHRoZSBtaWNyb2JsYXplIChxZW11KQo+PiB0YXJnZXQgc3VwcG9y
dHMgYm90aCBlbmRpYW5uZXNzZXMsIHNvIHRoYXQncyBmaXhlZCB1cCBpbiB0aGUgcGFja2FnZQo+
PiBNYWtlZmlsZSBhcyB3ZWxsLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxq
b3NlcGhAYW5vZGl6ZS5jb20+Cj4gCj4gUnVudGltZSB0ZXN0ZWQgZm9yIGhvc3QtcWVtdToKPiAK
PiBodHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yNTI1NTg5
Njk4Cj4gCj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYzOgo+PiAtIFVwZGF0ZSBDb25maWcuaW4gdG8g
cHJvcGVybHkgZmlsdGVyIG91dCAzMi1iaXQgYnVpbGRzIFtSb21haW5dCj4+IC0gRGlzYWJsZSBk
b3dubG9hZHMgZnJvbSBQeVBJIFtSb21haW5dCj4+IC0gQWRkIGRlcGVuZGVuY2llcyBmb3IgaG9z
dC1weXRob24tc2V0dXB0b29scyBhbmQgaG9zdC1weXRob24td2hlZWwKPiAKPiBJIHdhcyBub3Qg
c3VyZSBpZiBpdCBzdHJpY2x0eSBuZWNlc3Nhcnkgc2luY2Ugd2UgZGlzYWJsZSBkb3dubG9hZHMu
Cj4gV2UgZm9sbG93IHVwc3RyZWFtICJCdWlsZCBJbmZvcm1hdGlvbiIgcmVjb21tZW5kYXRpb25z
Ogo+IAo+IGh0dHBzOi8vd2lraS5xZW11Lm9yZy9DaGFuZ2VMb2cvMTEuMCNCdWlsZF9JbmZvcm1h
dGlvbgo+IAo+ICJXaGVuIGludGVybmV0IGFjY2VzcyBpcyBub3QgYWxsb3dlZCwgdGhpcyBmdW5j
dGlvbnMgYXMgYSAKPiBjb25maWd1cmUtdGltZSBjaGVjawo+IGVuc3VyaW5nIHRoYXQgb3VyIGVu
dmlyb25tZW50IGhhcyB0aGUgbmVjZXNzYXJ5IG1pbmltdW0gdmlhYmxlIHZlcnNpb25zIAo+IGZv
cgo+IHRoZXNlIHBhY2thZ2luZyB0b29scyBhdmFpbGFibGUuIgo+IAo+IGh0dHBzOi8vZ2l0bGFi
LmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2NvbW1pdC80ZTU1YmI0YmU1M2JjN2E1ZTNmZTE0Mjlh
ZjEyZDJlMzA5MDA0OWE1Cj4gCj4+IC0gUmV3b3JkIGxlZ2FjeSBjb25maWcgdG8gY2xhcmlmeSB0
aGF0IG1pY3JvYmxhemVlbCBpcyBub3QgZHJvcHBlZAo+PiAgIFtSb21haW5dCj4+IC0gTGluayB0
byB2MjogCj4+IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUxMy1xZW11LXYxMS0wLTAt
djItMS1kZTJlOGUzYzU4NjlAYW5vZGl6ZS5jb20KPj4gCj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0g
QWRkZWQgQ29uZmlnLmluIGNvbW1lbnQgZG9jdW1lbnRpbmcgNjQtYml0IHJlcXVpcmVtZW50Cj4+
IC0gRXhwYW5kZWQgY29tbWl0IG1lc3NhZ2UgdG8gZXhwbGFpbiAzMi1iaXQgcmVtb3ZhbCBbQmFy
dWNoXQo+PiAtIEZpeGVkIGJ1aWxkIGZhaWx1cmUgd2l0aCBtaWNyb2JsYXplZWwgdGFyZ2V0Cj4+
IC0gQWRkZWQgbGVnYWN5IGNvbmZpZyBmb3IgbWljcm9ibGF6ZWVsCj4+IC0gTGluayB0byB2MTog
Cj4+IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUxMi1xZW11LXYxMS0wLTAtdjEtMS03
NzZlYmZmYmIzYWZAYW5vZGl6ZS5jb20KPj4gCj4+IFRvOiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+PiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiAtLS0KPj4g
IENvbmZpZy5pbi5sZWdhY3kgICAgICAgfCAgOCArKysrKysrKwo+PiAgcGFja2FnZS9xZW11L0Nv
bmZpZy5pbiB8IDEyICstLS0tLS0tLS0tLQo+PiAgcGFja2FnZS9xZW11L3FlbXUuaGFzaCB8ICAy
ICstCj4+ICBwYWNrYWdlL3FlbXUvcWVtdS5tayAgIHwgMTUgKysrKysrKysrKysrLS0tCj4+ICA0
IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+PiAKPj4g
ZGlmZiAtLWdpdCBhL0NvbmZpZy5pbi5sZWdhY3kgYi9Db25maWcuaW4ubGVnYWN5Cj4+IGluZGV4
IGVhZDljZWFhMDguLjkwNjA2ZWJkNGIgMTAwNjQ0Cj4+IC0tLSBhL0NvbmZpZy5pbi5sZWdhY3kK
Pj4gKysrIGIvQ29uZmlnLmluLmxlZ2FjeQo+PiBAQCAtMTQ2LDYgKzE0NiwxNCBAQCBlbmRpZgo+
PiAKPj4gIGNvbW1lbnQgIkxlZ2FjeSBvcHRpb25zIHJlbW92ZWQgaW4gMjAyNi4wNSIKPj4gCj4+
ICtjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9UQVJHRVRfTUlDUk9CTEFaRUVMCgpTaW5jZSB5b3Ug
YXBwbGllZCB0aGlzIGludG8gdGhlIGJyYW5jaCAibmV4dCIsIHRoaXMgbGVnYWN5IG9wdGlvbiBz
aG91bGQgCmhhdmUKYmVlbiBtb3ZlZCB0byBhIG5ldyAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBp
biAyMDI2LjA4IiBibG9jaywgcmlnaHQ/Cgo+PiArCWJvb2wgInFlbXUgdGFyZ2V0IG1pY3JvYmxh
emVlbCByZW1vdmVkIgo+PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9NSUNST0JM
QVpFCj4+ICsJc2VsZWN0IEJSMl9MRUdBQ1kKPj4gKwloZWxwCj4+ICsJICBWZXJzaW9uIDExLjAu
MCBvZiBxZW11IGZvbGRlZCBtaWNyb2JsYXplZWwgc3VwcG9ydCBpbnRvCj4+ICsJICB0aGUgbWlj
cm9ibGF6ZSB0YXJnZXQuCj4+ICsKPj4gIGNvbmZpZyBCUjJfS0VSTkVMX0hFQURFUlNfNl8xOQo+
PiAgCWJvb2wgImtlcm5lbCBoZWFkZXJzIHZlcnNpb24gNi4xOS54IGFyZSBubyBsb25nZXIgc3Vw
cG9ydGVkIgo+PiAgCXNlbGVjdCBCUjJfTEVHQUNZCgpbLi4uXQoKQmVzdCByZWdhcmRzLAoKSnVs
aWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
