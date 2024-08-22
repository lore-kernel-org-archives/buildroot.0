Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6EAC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 15:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93CE440577;
	Thu, 22 Aug 2024 15:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujdhOBmVGlzB; Thu, 22 Aug 2024 15:57:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A65B40B5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A65B40B5B;
	Thu, 22 Aug 2024 15:57:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDA8B1BF36D
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 15:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAF1560E1B
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 15:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uia7JRlNx5xt for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 15:57:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BD6E60E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BD6E60E22
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BD6E60E22
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 15:57:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2E69113F8B5;
 Thu, 22 Aug 2024 17:56:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 22 Aug 2024 17:56:55 +0200
Date: Thu, 22 Aug 2024 17:56:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Message-ID: <Zsdfx5CUXg8ARG75@landeda>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
 <20240822130220.4135741-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822130220.4135741-5-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724342220;
 bh=xneHMuF8I7UsaB5e2eeWE9R5XchoCuzY6JvfmFcjjuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ND/wenq0UUnNMHFJ2d+xm44CSPk5nFTvogUqnWQgLorIS632HT+Xsmiw5cMJjU8Yq
 DF4flPYOPcQ14mUGpw+P0imrdjZGw8mJ0VShNfhfdtgO3JaeF7SbfkzhRgHFsZBXoh
 FrBdXmK4hUN7T6TEZYejleSm4YWoThjODFe05xt0sl1Jfr1DlXm7SDe1fbBxVuv4sT
 XqMdtz6maP2cvtOUd/mR7eoZIm7sKVkXNodp8ZYus0RdPHDpAoUdCz0b/dHyu1eGll
 3UlSNqmmfkwDnYPdUHxnvrP3pD4Q7E2oKu+j1y2GunK4SPyrfGpVpTIwBdC+AbHzlR
 KMwl1BoIsL+bQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ND/wenq0
Subject: Re: [Buildroot] [PATCH 4/4] package/mesa3d: bump to 24.2.0
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxleCwgQWxsLAoKT24gMjAyNC0wOC0yMiAxNDowMiArMDEwMCwgQWxleCBCZW5uw6llIHNwYWtl
IHRodXNseToKPiBXaGlsZSBWaXJ0SU8gVmVudXMgc3VwcG9ydCB3ZW50IGluIGVhcmxpZXIgdGhp
cyBpcyB0aGUgZmlyc3QgdmVyc2lvbgo+IHRoYXQgaXMga25vd24gdG8gd29yayB3ZWxsLgoKVGhp
cyBjb21taXQgbG9nIGlzIGNvbmZ1c2luZzogaXQgdGFsa3MgYWJvdXQgVmlydElPIFZlbnVzLCBi
dXQgdGhlcmUgaXMKbm8gc3VjaCBhZGRpdGlvbiBpbiB0aGUgcGF0Y2guIEl0IGhvd2V2ZXIgYWRk
cyBhIGRlcGVuZGVuY3kgb24KaG9zdC1weXRob24tcHl5YW1sLCBidXQgdGhhdCBpcyBub3QgZXhw
bGFpbmVkLCBhbmQgZG9lcyBub3Qgc2VlbSByZWxhdGVkCnRvIFZpcnRJTyBWZW51cyBlaXRoZXIu
Li4KCkNvdWxkIHlvdSBjbGFyaWZ5LCBwbGVhc2U/CgpBbHNvLCBzZWUgYmVsb3cuLi4KCj4gU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+IC0tLQo+
ICBwYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rIHwgMiArLQo+ICBwYWNr
YWdlL21lc2EzZC9tZXNhM2QuaGFzaCAgICAgICAgICAgICAgIHwgNSArKy0tLQo+ICBwYWNrYWdl
L21lc2EzZC9tZXNhM2QubWsgICAgICAgICAgICAgICAgIHwgMyArKy0KPiAgMyBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsgYi9wYWNrYWdlL21lc2EzZC1o
ZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCj4gaW5kZXggMzNjNjBiMjg1Zi4uOThhZmI3N2E5YyAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCj4g
KysrIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5tawo+IEBAIC0xMiw3
ICsxMiw3IEBAIGVuZGlmCj4gIAo+ICAjIE5vdCBwb3NzaWJsZSB0byBkaXJlY3RseSByZWZlciB0
byBtZXNhM2QgdmFyaWFibGVzLCBiZWNhdXNlIG9mCj4gICMgZmlyc3Qvc2Vjb25kIGV4cGFuc2lv
biB0cmlja2VyeS4uLgo+IC1NRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjQuMC45Cj4gK01FU0Ez
RF9IRUFERVJTX1ZFUlNJT04gPSAyNC4yLjAKPiAgTUVTQTNEX0hFQURFUlNfU09VUkNFID0gbWVz
YS0kKE1FU0EzRF9IRUFERVJTX1ZFUlNJT04pLnRhci54ego+ICBNRVNBM0RfSEVBREVSU19TSVRF
ID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcKPiAgTUVTQTNEX0hFQURFUlNfRExfU1VCRElS
ID0gbWVzYTNkCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoIGIvcGFj
a2FnZS9tZXNhM2QvbWVzYTNkLmhhc2gKPiBpbmRleCBkNTA2ZDM5OGI4Li4xZmYxMWY5YmQ4IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCj4gKysrIGIvcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLmhhc2gKPiBAQCAtMSw1ICsxLDQgQEAKPiAtIyBGcm9tIGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1KdW5lLzAwMDc2
NC5odG1sCj4gLXNoYTI1NiAgNTFhYTY4NmNhNDA2MGUzODcxMWE5ZThmNjBjOGYxZWZhYTUxNmJh
ZjQxMTk0NmVkN2YyYzI2NWNkNTgyY2E0YyAgbWVzYS0yNC4wLjkudGFyLnh6Cj4gLXNoYTUxMiAg
ZGUyZWU2YzlkZjFmYzEwNmVlMTBiZWZlMGE3NmJlMWU5Y2ZlODNkNjVkYmRiODNiYWQ2ZDhkN2Nm
YWEwODUyMzJmYjExNTI5M2ExYTc5MGIzN2I1MGIxZmUxNGJkNThhYWZiY2ZlNWExNWU5NTNiNTkw
MWE3MTA1ZDU3NTY5YTUgIG1lc2EtMjQuMC45LnRhci54ego+ICsjIEZyb20gaHR0cHM6Ly9kb2Nz
Lm1lc2EzZC5vcmcvcmVsbm90ZXMvMjQuMi4wLmh0bWwKPiArc2hhMjU2ICBjMDJiYjcyY2VhMjkw
Zjc4YjExODk1YTBjOTVjN2M5MjM5NGYxODBkN2ZmNjZkNGE3NjJlYzY5NTBhNThhZGRmICBtZXNh
LTI0LjIuMC50YXIueHoKClRoZXJlIHByZXZpb3VzbHkgd2FzIHNoYTI1NiBfYW5kXyBzaGE1MTIg
aGFzaGVzLCBidXQgbm93IHlvdSBvbmx5IGFkZCBhCnNoYTI1NiBvbmUuIENhbiB5b3UgZXh0ZW5k
IGEgbGl0dGxlIGJsdXJiIGFib3V0IHRoYXQsIHBsZWFzZT8KClJlZ2FyZHMsCllhbm4gRS4gTU9S
SU4uCgo+ICAjIExpY2Vuc2UKPiAgc2hhMjU2ICBhMDAyNzVhNTMxNzhlMjY0NWZiNjViZTk5YTc4
NWMxMTA1MTM0NDZhNTA3MWZmMmM2OThlZDI2MGFkOTE3ZDc1ICBkb2NzL2xpY2Vuc2UucnN0Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tayBiL3BhY2thZ2UvbWVzYTNkL21l
c2EzZC5tawo+IGluZGV4IGQzYjUwMTA2NDguLjI5ZjI2YzU2NjMgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4gKysrIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4g
QEAgLTUsNyArNSw3IEBACj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+ICAjIFdoZW4g
dXBkYXRpbmcgdGhlIHZlcnNpb24sIHBsZWFzZSBhbHNvIHVwZGF0ZSBtZXNhM2QtaGVhZGVycwo+
IC1NRVNBM0RfVkVSU0lPTiA9IDI0LjAuOQo+ICtNRVNBM0RfVkVSU0lPTiA9IDI0LjIuMAo+ICBN
RVNBM0RfU09VUkNFID0gbWVzYS0kKE1FU0EzRF9WRVJTSU9OKS50YXIueHoKPiAgTUVTQTNEX1NJ
VEUgPSBodHRwczovL2FyY2hpdmUubWVzYTNkLm9yZwo+ICBNRVNBM0RfTElDRU5TRSA9IE1JVCwg
U0dJLCBLaHJvbm9zCj4gQEAgLTIxLDYgKzIxLDcgQEAgTUVTQTNEX0RFUEVOREVOQ0lFUyA9IFwK
PiAgCWhvc3QtYmlzb24gXAo+ICAJaG9zdC1mbGV4IFwKPiAgCWhvc3QtcHl0aG9uLW1ha28gXAo+
ICsJaG9zdC1weXRob24tcHl5YW1sIFwKPiAgCWV4cGF0IFwKPiAgCWxpYmRybSBcCj4gIAl6bGli
Cj4gLS0gCj4gMi4zOS4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
