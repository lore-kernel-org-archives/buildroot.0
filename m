Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99E3D3E787
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 10:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5231B81418;
	Sun, 14 Dec 2025 10:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2x4xSrNnTBPq; Sun, 14 Dec 2025 10:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E81E8141F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765709293;
	bh=droU2XaYunkSZG+SZtU6JRK6JIDGXbyVcAvbDcOBCb8=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E8wkaGjqF79HCb47vEG0h+g3PQGz4zaus6RmFZtFA3qjScAzZOf98EG9LiTjwr0/F
	 SFbJVzE9z+e3lwn2HMaf+mGSOIMRbA/fPD3Iykwi2OZle7uNPA7XPF7TmxtT4GeMj1
	 1aZKDlH5c5fSWnZB3e1qBY4VJSyUHvNIetRHcmnjbC/TmKnH3JSBmGoN2GSywBEech
	 NTeegprWxYa07MFYZNIKnpYY031trt+Goy0MIpkAujDm8NgXvrtZpHQF5LV4eVP4sf
	 7PIUvcd9sGD8l/c50SuMQjLUHI8zCJBf4fuaEagiiJJ++fknwbaujBpiiBOZzLIIkt
	 ruQ+Kx/9IaQrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E81E8141F;
	Sun, 14 Dec 2025 10:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13981117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 10:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1061A605C0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 10:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPoT-M_2MLfI for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 10:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.72;
 helo=smtpcmd0872.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4096605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4096605B1
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4096605B1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 10:48:08 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id Uje0v3KG8ZCONUje1v1TzX; Sun, 14 Dec 2025 11:48:05 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 14 Dec 2025 11:48:04 +0100
Message-Id: <0CE22F44-19C0-480A-A2D1-D4622642380F@benettiengineering.com>
References: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (23C55)
X-CMAE-Envelope: MS4xfPRGaqrRD/6/7njnUNchVNOE3RIOQXqkIYLbgZyXnNs1C0ZhpiAhouTd605H34cii8JBI/5fjRc7wIwtuK+OjcsvLmrrOPLQrRoNeHcI4PoRLTw2XtUb
 /Ea+Qge5xHd9Xr+n7T8dnYY5LEDHe5Sc3bHN4b9VFwwDPFrY2CurJC+H+8KnONNe+55lbLmDDyFGulgmqj/0VhwgH7lBZ18AyQKgOJcevVGdtMJFrUmx2UpX
 oaBAo0TrTOLU/ttkY4dmUVjz5rf+lQo70UE/KtseI2MSIDcpX1HCVfUV+oXVODhD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765709285; bh=9mDGCxyE9rDq4e3Pm5qtQnhbCqCFkSo4YBt41S2XTEs=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=biUvJ1SADaldkzu80UxfF+jTLYVE2Vj+Y9RlyXykEbSEoMi6olPGvBNVxnSQV93s8
 ztWR8zw5rU9bBncKG2AsYZhK08ves/Q83bWmOov8T1xdzQotqkRy0Zm9pxrU+LyhMZ
 cdFFjRQXD0D8RDwJjFwBLZneV5DMTOHcQwlG7ATfMpf30senc16sGPME0R4Bg7xktR
 2aRyOpZ/nejT2R61DgMLY0DkxmEe2REe877Gtw6nuxoVTII9nOuF4biGM63dyMrMox
 YFg0FjUn5fpw4aYhdJwxCT2XY5KfNMoJs3sojMke+gFX4iMtlptI3BwAxgnp7fFmqo
 hOt8cHOvnI3QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=biUvJ1SA
Subject: Re: [Buildroot] [PATCH v3 1/3] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_RPCDB
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgo+IElsIGdpb3JubyAxMyBkaWMgMjAyNSwgYWxsZSBvcmUgMjI6NDEsIEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiBoYSBzY3JpdHRvOgo+
IAo+IO+7v1BhY2thZ2UgbGlidGlycGMgd2l0aCBjb21taXRbMV0gZXhwb3NlcyAtLWVuYWJsZS1y
cGNkYgoKYW5kIGRpc2FibGVzIGl0IGJ5IGRlZmF1bHQgZGlmZmVyZW50bHkgZnJvbSBiZWZvcmUg
dGhhdCBjb21taXQuCgo+IFNvIG1ha2UgaXQKPiBzZWxlY3RhYmxlIHRvIGFsbG93IHBhY2thZ2Vz
IHRoYXQgdXNlIHJwY2RiIGZ1bmN0aW9ucyB0byBlbmFibGUgaXQKPiBhbmQgYnVpbGQgY29ycmVj
dGx5Lgo+IAo+IFsxXToKPiBodHRwczovL2dpdC5saW51eC1uZnMub3JnLz9wPXN0ZXZlZC9saWJ0
aXJwYy5naXQ7YT1jb21taXQ7aD03Y2VhOGFkNjZhZWNjMjFlNmNhYWUzMzBiNWQzMTA3NWFmMzk5
MTkzCj4gCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20+Cj4gLS0tCgpXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byByZXdv
cmQgYnkgYSBtYWludGFpbmVyIHdpdGggdGhlIGNoYW5nZSBhYm92ZT8KCkJlc3QgcmVnYXJkcyAK
R2l1bGlvCgo+IFYxLT5WMjoKPiAqIGFkZGVkIHBhdGNoIHRvIHNlcmllcwo+IFYyLT5WMzoKPiAq
IHJlbmFtZWQgQlIyX1BBQ0tBR0VfTElCVElSUENfUlBDREIgYW5kIGFkZGVkIHNlY3Rpb24gQlIy
X1BBQ0tBR0VfTElCVElSUEMKPiAgYXMgc3VnZ2VzdGVkIGJ5IFRob21hcyBQZXRhenpvbmkuCj4g
KiBpbXByb3ZlZCBjb21taXQgbG9nIHdpdGggY29tbWl0IGFzIHN1Z2dlc3RlZCBieSBQZXRyIFZv
cmVsIGFuZCBUaG9tYXMKPiAgUGV0YXp6b25pCj4gLS0tCj4gcGFja2FnZS9saWJ0aXJwYy9Db25m
aWcuaW4gICB8IDEwICsrKysrKysrKy0KPiBwYWNrYWdlL2xpYnRpcnBjL2xpYnRpcnBjLm1rIHwg
IDcgKysrKysrKwo+IDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnRpcnBjL0NvbmZpZy5pbiBiL3BhY2th
Z2UvbGlidGlycGMvQ29uZmlnLmluCj4gaW5kZXggMzFmMTYzNmVmNS4uNjFmYjIzYWY1ZSAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnRpcnBjL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGli
dGlycGMvQ29uZmlnLmluCj4gQEAgLTcsMTUgKzcsMjMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJ
QlRJUlBDCj4gCj4gICAgICBodHRwOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3RzL2xpYnRpcnBj
Lwo+IAo+ICtpZiBCUjJfUEFDS0FHRV9MSUJUSVJQQwo+ICsKPiBjb25maWcgQlIyX1BBQ0tBR0Vf
TElCVElSUENfR1NTCj4gICAgYm9vbCAiZ3NzIgo+ICAgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUg
IyBsaWJrcmI1Cj4gICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgbGlia3JiNQo+IC0g
ICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJUSVJQQwo+ICAgIHNlbGVjdCBCUjJfUEFDS0FH
RV9MSUJLUkI1Cj4gICAgaGVscAo+ICAgICAgRW5hYmxlIEdTU0FQSSBzdXBwb3J0Cj4gCj4gK2Nv
bmZpZyBCUjJfUEFDS0FHRV9MSUJUSVJQQ19SUENEQgo+ICsgICAgYm9vbCAicnBjZGIiCj4gKyAg
ICBoZWxwCj4gKyAgICAgIEVuYWJsZSBSUENEQiBzdXBwb3J0Cj4gKwo+ICtlbmRpZgo+ICsKPiBj
b21tZW50ICJsaWJ0aXJwYyBuZWVkcyBhIHRvb2xjaGFpbiB3LyB0aHJlYWRzIgo+ICAgIGRlcGVu
ZHMgb24gIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJ0aXJwYy9saWJ0aXJwYy5tayBiL3BhY2thZ2UvbGlidGlycGMvbGlidGlycGMubWsKPiBp
bmRleCBhYjE1OTU0NTYxLi5lYWRhY2VkZmNmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlidGly
cGMvbGlidGlycGMubWsKPiArKysgYi9wYWNrYWdlL2xpYnRpcnBjL2xpYnRpcnBjLm1rCj4gQEAg
LTI1LDUgKzI1LDEyIEBAIExJQlRJUlBDX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZ3NzYXBpCj4g
ZW5kaWYKPiBIT1NUX0xJQlRJUlBDX0NPTkZfT1BUUyA9IC0tZGlzYWJsZS1nc3NhcGkKPiAKPiAr
aWZlcSAoJChCUjJfUEFDS0FHRV9MSUJUSVJQQ19SUENEQikseSkKPiArTElCVElSUENfQ09ORl9P
UFRTICs9IC0tZW5hYmxlLXJwY2RiCj4gK2Vsc2UKPiArTElCVElSUENfQ09ORl9PUFRTICs9IC0t
ZGlzYWJsZS1ycGNkYgo+ICtlbmRpZgo+ICtIT1NUX0xJQlRJUlBDX0NPTkZfT1BUUyArPSAtLWRp
c2FibGUtcnBjZGIKPiArCj4gJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQo+ICQoZXZhbCAk
KGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQo+IC0tCj4gMi40Ny4zCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
