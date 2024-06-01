Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C53C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 21:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F8568477B;
	Sat,  1 Jun 2024 21:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oIUZ83tC52K; Sat,  1 Jun 2024 21:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1919B84777
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1919B84777;
	Sat,  1 Jun 2024 21:00:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDAE11BF239
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DACC784777
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgmWoVTomGgu for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 20:59:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FE0484776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FE0484776
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FE0484776
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 20:59:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B11AA13F861;
 Sat,  1 Jun 2024 22:59:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 22:59:53 +0200
Date: Sat, 1 Jun 2024 22:59:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZluLyQ7JHFYedvcv@landeda>
References: <20240529-ztext-v2-0-82985032f169@gmx.net>
 <20240529-ztext-v2-1-82985032f169@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529-ztext-v2-1-82985032f169@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717275596;
 bh=QnhhkfqAH9MCtFLaJiAN+i2Y6QuLINFbjYHgmyNf38Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJp0K/fpNqf9gaQg0V0Yb8lOs4jZAweJDDkSNZCNMJb294LfInkkUg1tjbimNKiq9
 2nrKu9ihFPTTdGSFUWxdtSIADx4UM7m+yGvIFVtYPSibieHyw9KGNkkW9zYoX2lyyq
 /3trdmfJsGEi3QQubbv0Jn8kLGFYcrLx9/s6RX5flW65VGTOqis8aRFX+9jGdDXCad
 gfavKPzZRoZ4XFkOIGDW9w5pKG5txgg76MSDDOA5R8wS4DpmG1xBpGto5EjH/SzcG4
 mw/6XwseamEZh+beQUi1Riys+5SDSonwcz+b2PFjarxUD011nPiJiVWgnxkcNELU+f
 PhZEmV5u6nTJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EJp0K/fp
Subject: Re: [Buildroot] [PATCH v2 1/2] Config.in: ban textrels on musl
 toolchains
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAyNC0wNS0yOSAyMDoyMiArMDIwMCwgSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCBz
cGFrZSB0aHVzbHk6Cj4gbXVzbC1saWJjIGRvZXNuJ3Qgc3VwcG9ydCBURVhUUkVMc1sxXSBhbmQg
cHJvZ3JhbXMgd2l0aCBURVhUUkVMcyB3aWxsCj4gY3Jhc2ggb24gc3RhcnQtdXAgdW5kZXIgbXVz
bC4KPiAKPiBUaGlzIHBhdGNoIGZvcmJpZHMgdGhlIHVzZSBvZiBURVhUUkVMcyBvbiBtdXNsLCBi
dXQgYWRkcyBhbiBvcHRpb24gdG8KPiBlaXRoZXIgZm9yYmlkIHRoZW0gb24gb3RoZXIgbGliY3Mg
YXMgd2VsbCwgb3IgYWxsb3cgdGhlbSBvbiBtdXNsLgoKSW4geW91ciB2MSwgVGhvbWFzIHN1Z2dl
c3RlZCB0aGF0IHRleHRyZWxzIGJlIHNpbXBseSBhbHdheXMgZGlzYWJsZWQgZm9yCm11c2wsIGJl
Y2F1c2UgdGhlcmUgaXMgbm8gd2F5IHRoZXkgY2FuIHdvcmsuIEFsbG93aW5nIHBlb3BsZSB0byBl
bmFibGUKdGhlbSBvbiBtdXNsIHdpbGwgb25seSBtYWtlIHRoaW5ncyByZWFrIGF0IHJ1bnRpbWUs
IHJhdGhlciB0aGFuIGF0IGJ1aWxkCnRpbWUuCgpJJ20gb24gdGhlIHNhbWUgcGFnZSBhcyBUaG9t
YXMgaGVyZTogaWYgdGV4dHJlbHMgYXJlIHVuc3VwcG9ydGVkIG9uCm11c2wsIHRoZW4gbGV0J3Mg
bm90IGFsbG93IHRoZW0gYXQgYWxsLgoKPiBbMV06IGh0dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9s
aXN0cy9tdXNsLzIwMjAvMDkvMjUvNAo+IAo+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVy
IDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gLS0tClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEv
Q29uZmlnLmluIGIvQ29uZmlnLmluCj4gaW5kZXggYjVhOTQzMjVjNC4uOTJlODllZDMyZCAxMDA2
NDQKPiAtLS0gYS9Db25maWcuaW4KPiArKysgYi9Db25maWcuaW4KPiBAQCAtOTEwLDYgKzkxMCwy
MCBAQCBlbmRjaG9pY2UKPiAgY29tbWVudCAiUkVMb2NhdGlvbiBSZWFkIE9ubHkgKFJFTFJPKSBu
ZWVkcyBzaGFyZWQgbGlicmFyaWVzIgo+ICAJZGVwZW5kcyBvbiAhQlIyX1NIQVJFRF9MSUJTCj4g
Cj4gK2NvbmZpZyBCUjJfTElOS19aVEVYVAo+ICsJYm9vbCAiRGlzYWxsb3cgdGV4dCBzZWN0aW9u
IHJlbG9jYXRpb25zIChURVhUUkVMcykiCgpXZSBwcmVmZXIgcG9zaXRpdmUgbG9naWM6CgogICAg
Y29uZmlnIEJSMl9MSU5LX1pURVhUCiAgICAgICAgYm9vbCAiQWxsb3cgdGV4dCBzZWN0aW9uIHJl
bG9jYXRpb25zIChURVhUUkVMcykiCiAgICAgICAgZGVmYXVsdCB5ICAjIExlZ2FjeQogICAgICAg
IGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19NVVNMCiAgICAgICAgZGVwZW5kcyBvbiAh
QlIyX1NUQVRJQ19MSUJTCgphbmQgaW4gdGhlIC5tazoKCiAgICBpZmVxICgkKEJSMl9MSU5LX1pU
RVhUKSwpCiAgICBUQVJHRVRfTERGTEFHUyArPSAteiB0ZXh0CiAgICBlbmRpZgoKKE5vdGUgdGhl
ICdkZWZhdWx0IHknOiB0ZXh0cmVscyB3ZXJlIHByZXZpb3VzbHkgYWx3YXlzIGFsbG93ZWQsIHNv
IHdlCndhbnQgdG8ga2VlcCB0aGF0IGJlaGF2aW91ciBieSBkZWZhdWx0KQoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCj4gKwlkZWZhdWx0IEJSMl9UT09MQ0hBSU5fVVNFU19NVVNMCj4gKwlkZXBl
bmRzIG9uICFCUjJfU1RBVElDX0xJQlMKPiArCWhlbHAKPiArCSAgUGFzcyAiLXogdGV4dCIgdG8g
dGhlIGxpbmtlciB0byBkZXRlY3QgVEVYVFJFTHMgYW5kIHRocm93IGFuCj4gKwkgIGVycm9yIGlm
IHRoZXkgb2NjdXIuCj4gKwo+ICsJICBUaGlzIGlzIHJlY29tbWVuZGVkIHdoZW4gYnVpbGRpbmcg
YSBzeXN0ZW0gd2l0aCBtdXNsLWxpYmMsCj4gKwkgIGJlY2F1c2UgVEVYVFJFTHMgYXJlIG5vdCBz
dXBwb3J0ZWQgb24gbXVzbC1saWJjJ3MgZHluYW1pYwo+ICsJICBsb2FkZXIgYW5kIHdpbGwgcmVz
dWx0IGluIGEgcnVuLXRpbWUgY3Jhc2g6Cj4gKwo+ICsJICAgIGh0dHBzOi8vd3d3Lm9wZW53YWxs
LmNvbS9saXN0cy9tdXNsLzIwMjAvMDkvMjUvNAo+ICsKPiAgY29uZmlnIEJSMl9GT1JUSUZZX1NP
VVJDRV9BUkNIX1NVUFBPUlRTCj4gIAlib29sCj4gIAlkZWZhdWx0IHkKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9NYWtlZmlsZS5pbiBiL3BhY2thZ2UvTWFrZWZpbGUuaW4KPiBpbmRleCBmNDE1ZTU1
Zjg0Li42OGVmZDM5ZGJhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvTWFrZWZpbGUuaW4KPiArKysg
Yi9wYWNrYWdlL01ha2VmaWxlLmluCj4gQEAgLTE0OSw2ICsxNDksMTAgQEAgZW5kaWYKPiAKPiAg
VEFSR0VUX0xERkxBR1MgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9MREZMQUdTKSkKPiAK
PiAraWZlcSAoJChCUjJfTElOS19aVEVYVCkseSkKPiArVEFSR0VUX0xERkxBR1MgKz0gLXogdGV4
dAo+ICtlbmRpZgo+ICsKPiAgIyBCeSBkZXNpZ24sIF9GT1JUSUZZX1NPVVJDRSByZXF1aXJlcyBn
Y2Mgb3B0aW1pemF0aW9uIHRvIGJlIGVuYWJsZWQuCj4gICMgVGhlcmVmb3JlLCB3ZSBuZWVkIHRv
IHBhc3MgX0ZPUlRJRllfU09VUkNFIGFuZCB0aGUgb3B0aW1pemF0aW9uIGxldmVsCj4gICMgdGhy
b3VnaCB0aGUgc2FtZSBtZWNoYW5pc20sIGkuZSBjdXJyZW50bHkgdGhyb3VnaCBDRkxBR1MuIFBh
c3NpbmcKPiAKPiAtLQo+IDIuNDMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
