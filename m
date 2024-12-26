Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5147BE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 22:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED74B607B2;
	Thu, 26 Dec 2024 22:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KX3lCtTdGcme; Thu, 26 Dec 2024 22:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B27BC607BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B27BC607BE;
	Thu, 26 Dec 2024 22:45:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B21EBE0
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FD58607B2
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NX24ErrMvtaf for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 22:45:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8448A605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8448A605D0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8448A605D0
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:45:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E165078034E;
 Thu, 26 Dec 2024 23:45:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34944])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Dec 2024 23:45:32 +0100
MIME-Version: 1.0
Date: Thu, 26 Dec 2024 23:45:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241226205621.2398077-1-thomas.petazzoni@bootlin.com>
References: <20241226205621.2398077-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <499b8c32bec567f707e936fe2997bd61@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735253134;
 bh=0LqaiVcZfTc33WBwV7qbUoJr6e14E8sODQ7S/t17QQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SLHIe2guwyU0DXFO57/U1+VE9cVYkzLip+tPUzzNglMwez5tKur+rtSID/Zvm50qB
 tNJtvfeOWfK9NzQHGAOHGoSiXmPkwpwDloc1amkX0d6x0oL0IWiUHRmSH3QKlnnOzY
 yK81BzuFKRVatgT7YnzAcgZ5070lzDa1OvkC0kd78VxZ4TyfmshB1kMXTH1HzBI+23
 NiwaVRAcBAofpXjJ9v6AGLryOdfJc1y0/Ibn01t2zvN8/zaQ3LoYesTI5lGi/CN7BK
 81rQtR8lF32ZzUTlqwGx0yb5AI7AI/pdoS5vExNi8ZpTjaqJTt0cPijE+w3D7rQi5O
 s3HBWMUGMpXAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SLHIe2gu
Subject: Re: [Buildroot] [PATCH] package/cifs-utils: bump to version 7.1
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

T24gMjYvMTIvMjAyNCAyMTo1NiwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IEZyb20gaHR0cHM6Ly93aWtpLnNhbWJhLm9yZy9pbmRleC5waHAvTGludXhDSUZTX3V0aWxz
Ogo+IAo+IC0gT2N0b2JlciwgMjAyNDogUmVsZWFzZSA3LjEKPiAgIExEQVAgUGluZyBjYXBhYmls
aXR5Cj4gICBzbWJpbmZvIGFkZHMgZ2V0dGNvbmluZm8gY29tbWFuZAo+ICAgVmFyaW91cyBpbXBy
b3ZlbWVudHMgdG8gbWFuIHBhZ2VzCj4gICAKPiBodHRwczovL2xpc3RzLnNhbWJhLm9yZy9hcmNo
aXZlL3NhbWJhLXRlY2huaWNhbC8yMDI0LU9jdG9iZXIvMTM5MTQ2Lmh0bWwKPiAtIEF1Z3VzdCwg
MjAyMjogUmVsZWFzZSA3LjAKPiAgIEFkZCBHU1MtUHJveHkgc3VwcG9ydAo+ICAgCj4gaHR0cHM6
Ly9saXN0cy5zYW1iYS5vcmcvYXJjaGl2ZS9zYW1iYS10ZWNobmljYWwvMjAyMi1BdWd1c3QvMTM3
NTI4Lmh0bWwKPiAKPiBOb3RlOiA3LjAgd2FzIHRoZSByZWxlYXNlIGltbWVkaWF0ZWx5IGFmdGVy
IHRoZSA2LjE1IGN1cnJlbnRseSBpbgo+IEJ1aWxkcm9vdC4KPiAKPiBPbmUgbm90YWJsZSBjaGFu
Z2UgaXMgdGhhdCB0aGlzIHZlcnNpb24gNy4xIG1ha2VzIGxpYnRhbGxvYyBhCj4gbWFuZGF0b3J5
IGRlcGVuZGVuY3kuIEFsc28sIGEgc21hbGwgcGF0Y2gsIHN1Ym1pdHRlZCB1cHN0cmVhbSwgaXMK
PiBhZGRlZCB0byBmaXggdGhlIGJ1aWxkIHdpdGggbXVzbCBkdWUgdG8gYSBtaXNzaW5nIGhlYWRl
ciBpbmNsdWRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKPiAtLS0K
PiAgLi4ubmcuYy1hZGQtbWlzc2luZy1zeXMtdHlwZXMuaC1pbmNsdWRlLnBhdGNoIHwgMzggKysr
KysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL2NpZnMtdXRpbHMvQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgfCAgOCArKystCj4gIHBhY2thZ2UvY2lmcy11dGlscy9jaWZzLXV0aWxzLmhhc2gg
ICAgICAgICAgICB8ICAyICstCj4gIHBhY2thZ2UvY2lmcy11dGlscy9jaWZzLXV0aWxzLm1rICAg
ICAgICAgICAgICB8ICA0ICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+IHBhY2thZ2UvY2lmcy11dGls
cy8wMDAxLWNsZGFwX3BpbmcuYy1hZGQtbWlzc2luZy1zeXMtdHlwZXMuaC1pbmNsdWRlLnBhdGNo
Cj4gCj4gZGlmZiAtLWdpdCAKPiBhL3BhY2thZ2UvY2lmcy11dGlscy8wMDAxLWNsZGFwX3Bpbmcu
Yy1hZGQtbWlzc2luZy1zeXMtdHlwZXMuaC1pbmNsdWRlLnBhdGNoIAo+IGIvcGFja2FnZS9jaWZz
LXV0aWxzLzAwMDEtY2xkYXBfcGluZy5jLWFkZC1taXNzaW5nLXN5cy10eXBlcy5oLWluY2x1ZGUu
cGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmJmNzg2NGUw
MWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIAo+IGIvcGFja2FnZS9jaWZzLXV0aWxzLzAwMDEtY2xk
YXBfcGluZy5jLWFkZC1taXNzaW5nLXN5cy10eXBlcy5oLWluY2x1ZGUucGF0Y2gKPiBAQCAtMCww
ICsxLDM4IEBACj4gK0Zyb20gNjIyOTdlOTA2MTQ5ZjlkMmNhN2IxODdhNjBmN2M1YWI5OWVmNWRk
NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiArRGF0ZTogVGh1LCAyNiBEZWMgMjAyNCAyMToz
OTowNSArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGNsZGFwX3BpbmcuYzogYWRkIG1pc3Npbmcg
PHN5cy90eXBlcy5oPiBpbmNsdWRlCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlw
ZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5n
OiA4Yml0Cj4gKwo+ICtGaXhlczoKPiArCj4gK2NsZGFwX3BpbmcuYzogSW4gZnVuY3Rpb24g4oCY
cmVhZF9kbnNfc3RyaW5n4oCZOgo+ICtjbGRhcF9waW5nLmM6NzI6Mzc6IGVycm9yOiDigJh1X2No
YXLigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgCj4gZnVuY3Rpb24pCj4gKwo+ICt3
aGVuIGJ1aWxkaW5nIHdpdGggdGhlIG11c2wgQyBsaWJyYXJ5LCBidXQgZXZlbiB3aXRoIGdsaWJj
IHVfY2hhciBpcwo+ICtkZWZpbmVkIGluIDxzeXMvdHlwZXMuaD4sIGl0IGhhcHBlbnMgdG8gd29y
ayB3aXRoIGdsaWJjIDxzeXMvdHlwZXMuaD4KPiArZ2V0cyBpbmNsdWRlZCBieSBhbm90aGVyIGhl
YWRlci4KPiArCj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+Cj4gK1Vwc3RyZWFtOiAKPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1jaWZzLzIwMjQxMjI2MjA0MjM1LjIzMTEzNzEtMS10aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tLwo+ICstLS0KPiArIGNsZGFwX3BpbmcuYyB8IDEgKwo+ICsgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvY2xkYXBfcGluZy5jIGIvY2xk
YXBfcGluZy5jCj4gK2luZGV4IDkxODNiMjcuLmE2MDNiZTMgMTAwNjQ0Cj4gKy0tLSBhL2NsZGFw
X3BpbmcuYwo+ICsrKysgYi9jbGRhcF9waW5nLmMKPiArQEAgLTIwLDYgKzIwLDcgQEAKPiArICNp
bmNsdWRlIDx0YWxsb2MuaD4KPiArICNpbmNsdWRlIDxzdHJpbmcuaD4KPiArICNpbmNsdWRlIDxz
eXMvc29ja2V0Lmg+Cj4gKysjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gKyAjaW5jbHVkZSA8YXJw
YS9pbmV0Lmg+Cj4gKyAjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gKyAjaW5jbHVkZSA8cmVzb2x2Lmg+
Cj4gKy0tCj4gKzIuNDcuMAo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jaWZzLXV0aWxzL0Nv
bmZpZy5pbiAKPiBiL3BhY2thZ2UvY2lmcy11dGlscy9Db25maWcuaW4KPiBpbmRleCBkMWIxNDA2
YTNlLi42ODEzZTM2MzdkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvY2lmcy11dGlscy9Db25maWcu
aW4KPiArKysgYi9wYWNrYWdlL2NpZnMtdXRpbHMvQ29uZmlnLmluCj4gQEAgLTEsNyArMSwxMyBA
QAo+ICtjb21tZW50ICJjaWZzLXV0aWxzIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGli
cmFyeSIKPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiArCWRlcGVuZHMgb24gQlIyX1NUQVRJ
Q19MSUJTCj4gKwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfQ0lGU19VVElMUwo+ICAJYm9vbCAiY2lm
cy11dGlscyIKPiAtCSMgdXNlcyBmb3JrKCkKPiArCSMgdXNlcyBmb3JrKCksIGxpYnRhbGxvYwo+
ICAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJT
ICMgbGlidGFsbG9jCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCVEFMTE9DCj4gIAloZWxwCj4g
IAkgIFRoZSBpbi1rZXJuZWwgQ0lGUyBmaWxlc3lzdGVtIGlzIGdlbmVyYWxseSB0aGUgcHJlZmVy
cmVkCj4gIAkgIG1ldGhvZCBmb3IgbW91bnRpbmcgU01CL0NJRlMgc2hhcmVzIG9uIExpbnV4LiBU
aGUgaW4ta2VybmVsCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2lmcy11dGlscy9jaWZzLXV0aWxz
Lmhhc2ggCj4gYi9wYWNrYWdlL2NpZnMtdXRpbHMvY2lmcy11dGlscy5oYXNoCj4gaW5kZXggZWM2
ZWE1NTk2MS4uOTQyZjhhYWEzOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2NpZnMtdXRpbHMvY2lm
cy11dGlscy5oYXNoCj4gKysrIGIvcGFja2FnZS9jaWZzLXV0aWxzL2NpZnMtdXRpbHMuaGFzaAo+
IEBAIC0xLDUgKzEsNSBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBw
Z3Agc2lnbmF0dXJlCj4gLXNoYTI1NiAgCj4gYTdiNjk0MGU5MzI1MGMxNjc2YTZmYTY2YjZlYWQ5
MWI3OGNkNDNhNWZlZTk5Y2M0NjI0NTljOGI5Y2YxZTZmNCAgCj4gY2lmcy11dGlscy02LjE1LnRh
ci5iejIKPiArc2hhMjU2ICAKPiBhMjExMjNmNzZhNGE2YTM2Yzk2NTMxODliYTQ5MThlYmRmM2Nm
Y2QzZjkwOTI3MzBhNDdmZjM0NTBiNWI1YjJhICAKPiBjaWZzLXV0aWxzLTcuMS50YXIuYnoyCj4g
Cj4gICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlOgo+ICBzaGEyNTYgIAo+IDhjZWI0YjllZTVhZGVk
ZGU0N2IzMWU5NzVjMWQ5MGM3M2FkMjdiNmIxNjVhMWRjZDgwYzdjNTQ1ZWI2NWI5MDMgIAo+IENP
UFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jaWZzLXV0aWxzL2NpZnMtdXRpbHMubWsgCj4g
Yi9wYWNrYWdlL2NpZnMtdXRpbHMvY2lmcy11dGlscy5tawo+IGluZGV4IGVkZjA4ZDRiNGQuLmU4
ZWVmZGUyNzUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9jaWZzLXV0aWxzL2NpZnMtdXRpbHMubWsK
PiArKysgYi9wYWNrYWdlL2NpZnMtdXRpbHMvY2lmcy11dGlscy5tawo+IEBAIC00LDcgKzQsNyBA
QAo+ICAjCj4gIAo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gCj4gLUNJRlNfVVRJTFNfVkVS
U0lPTiA9IDYuMTUKPiArQ0lGU19VVElMU19WRVJTSU9OID0gNy4xCj4gIENJRlNfVVRJTFNfU09V
UkNFID0gY2lmcy11dGlscy0kKENJRlNfVVRJTFNfVkVSU0lPTikudGFyLmJ6Mgo+ICBDSUZTX1VU
SUxTX1NJVEUgPSBodHRwOi8vZnRwLnNhbWJhLm9yZy9wdWIvbGludXgtY2lmcy9jaWZzLXV0aWxz
Cj4gIENJRlNfVVRJTFNfTElDRU5TRSA9IEdQTC0zLjArCj4gQEAgLTEyLDcgKzEyLDcgQEAgQ0lG
U19VVElMU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICBDSUZTX1VUSUxTX0NQRV9JRF9WRU5E
T1IgPSBzYW1iYQo+ICAjIE1pc3NpbmcgaW5zdGFsbC1zaCBpbiByZWxlYXNlIHRhcmJhbGwKPiAg
Q0lGU19VVElMU19BVVRPUkVDT05GID0gWUVTCj4gLUNJRlNfVVRJTFNfREVQRU5ERU5DSUVTID0g
aG9zdC1wa2djb25mCj4gK0NJRlNfVVRJTFNfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGxp
YnRhbGxvYwo+IAo+ICAjIExldCdzIGRpc2FibGUgUElFIHVuY29uZGl0aW9uYWxseS4gV2Ugd2Fu
dCBQSUUgdG8gYmUgZW5hYmxlZCBvbmx5IGJ5Cj4gICMgdGhlIGdsb2JhbCBCUjJfUkVMUk9fRlVM
TCBvcHRpb24uCj4gLS0KPiAyLjQ3LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
