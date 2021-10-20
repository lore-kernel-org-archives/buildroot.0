Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFEFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 00:10:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 190E1610A2
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 00:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 190E1610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF7A4055D;
	Wed, 20 Oct 2021 00:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLtBIxsTuRzW; Wed, 20 Oct 2021 00:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A8D4056F;
	Wed, 20 Oct 2021 00:10:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CB501BF285
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 00:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B2414010A
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 00:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5k6rG9dzWsVU for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 00:10:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9A1C400F1
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 00:10:38 +0000 (UTC)
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id czBkmS0KuXRKtczBkm4rZb; Wed, 20 Oct 2021 02:10:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634688637; bh=Gh6S+S74KHDMdajG8pq6t33XxqeCHvzfAeSjn9be+ic=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Q7kLrAj1mwd+29gIh6/ZcO+IsNYfxOo4VJJw7tz8zThjf4Dn+jmYzT9CIABErtvZt
 uYFUmxUs5puYHDrH6QB83k5ngbLOG7Vq3XH5YF9sC6bQpJIoMXmtM0O+JjueJc9QN/
 2zJv9W7Az38weBzqyVqlPklTs5pV8NTLpMAGf7N0M+Rdl7De7KU/5n+vITU6dTVcAt
 OmFZcIpCQSIdx/zn7H1YAec0IC8LgPsfZMoWvXSS/w6Pnzgyq15Sl8YtZeWkoLoSs9
 WwsLT9DltmMJHtoj7u2iIim3jAQ1zTLhHocqY3ujAzvLpSWQmet7dUbsu3G4FQPOXf
 3WxXWhmf8d93w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 20 Oct 2021 02:10:36 +0200
Message-Id: <CB281AC4-7CA2-4C41-9175-CF752DB29CE7@benettiengineering.com>
References: <20211013202529.2113239-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20211013202529.2113239-1-giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfLeIuzrxMR/yq6yrV7F2H1lxAhate8sxSyZtJWQPv7tPgIn0fYj0sxZUmD1JFX1MtF/uZBPN96Lgaot3uw8sY/jdeiWf3JyWJmAiLcBgc01Vjhly5UAh
 9YEy64FgjEfVm3FCBOEK7srGkBE8H6TojSr7+/YcR8J7dSNUaSUVLnaNYVVwV9IYk09Owajx58C8R4BPP7IHh3uiANXtBwCkB4uFZumFw6RxCeU+rkyla9/f
 yiOcDxIoAbG3EldGk7nJgA==
Subject: Re: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288: bump to Linux
 kernel 5.14 and u-boot 2021.10
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDEzIG90dCAyMDIxLCBhbGxlIG9yZSAyMjozMiwgR2l1bGlvIEJlbmV0dGkg
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhhIHNjcml0dG86Cj4gCj4g
77u/VGhpcyBidW1wcyB0byBsaW51eC9saW51eC1oZWFkZXJzIDUuMTQgYW5kIHUtYm9vdCB2ZXJz
aW9uIDIwMjEuMTAgYW5kIGRyb3AKPiBsb2NhbCB1Ym9vdCBwYXRjaCB3aGVyZSBDT05GSUdfU1lT
X0JPT1RNX0xFTiB3YXMgc2V0IHRvIDE2TUIgYmVjYXVzZSBvbgo+IHUtYm9vdCAyMDIxLjEwIGl0
J3Mgbm93IHNldCB0byA2NE1CIGFzIGRlZmF1bHQgdG8gbWFrZSByb29tIGZvciBMaW51eAo+IGlt
YWdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlA
YmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAtLS0KPiAuLi5JbmNyZWFzZS1DT05GSUdfU1lTX0JP
T1RNX0xFTi10by0xNk0ucGF0Y2ggfCAzNSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gY29uZmlncy9h
bWFydWxhX3Z5YXNhX3JrMzI4OF9kZWZjb25maWcgICAgICAgIHwgIDkgKysrLS0KPiAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCj4gZGVsZXRlIG1vZGUg
MTAwNjQ0IGJvYXJkL2FtYXJ1bGEvdnlhc2EvcGF0Y2hlcy91Ym9vdC8wMDAxLWluY2x1ZGUtY29u
Zmlncy1JbmNyZWFzZS1DT05GSUdfU1lTX0JPT1RNX0xFTi10by0xNk0ucGF0Y2gKPiAKPiBkaWZm
IC0tZ2l0IGEvYm9hcmQvYW1hcnVsYS92eWFzYS9wYXRjaGVzL3Vib290LzAwMDEtaW5jbHVkZS1j
b25maWdzLUluY3JlYXNlLUNPTkZJR19TWVNfQk9PVE1fTEVOLXRvLTE2TS5wYXRjaCBiL2JvYXJk
L2FtYXJ1bGEvdnlhc2EvcGF0Y2hlcy91Ym9vdC8wMDAxLWluY2x1ZGUtY29uZmlncy1JbmNyZWFz
ZS1DT05GSUdfU1lTX0JPT1RNX0xFTi10by0xNk0ucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCA2NGExNDdjMDllLi4wMDAwMDAwMDAwCj4gLS0tIGEvYm9hcmQvYW1hcnVs
YS92eWFzYS9wYXRjaGVzL3Vib290LzAwMDEtaW5jbHVkZS1jb25maWdzLUluY3JlYXNlLUNPTkZJ
R19TWVNfQk9PVE1fTEVOLXRvLTE2TS5wYXRjaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwzNSAr
MCwwIEBACj4gLUZyb20gOGVlMmIwMzAzOWNjY2Y2NDQwMmE3MmRlYTIxODVkN2ZlMTk3MjcyOSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJvbTogU2h5YW0gU2FpbmkgPHNoeWFtLnNhaW5p
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC1EYXRlOiBNb24sIDE1IEFwciAyMDE5IDE2OjE2OjE2
ICswNTMwCj4gLVN1YmplY3Q6IFtQQVRDSF0gaW5jbHVkZTogY29uZmlnczogSW5jcmVhc2UgQ09O
RklHX1NZU19CT09UTV9MRU4gdG8gMTZNQgo+IC0KPiAtVGhlIGRlZmF1bHQgdmFsdWUgb2YgQ09O
RklHX1NZU19CT09UTV9MRU4gaXMgMHg4MDAwMDAgaS5lLCA4TUIgd2hpY2gKPiAtY2F1c2VzIGJv
YXJkIHJlc2V0IGJlY2F1c2Ugb2YgbGFyZ2VyIHVJbWFnZSBzaXplLgo+IC0KPiAtRXJyb3IgbG9n
IHNuaXBwZXQ6Cj4gLSAgIEJvb3RpbmcgdXNpbmcgdGhlIGZkdCBibG9iIGF0IDB4MWYwMDAwMAo+
IC0gICBMb2FkaW5nIEtlcm5lbCBJbWFnZSAuLi4gSW1hZ2UgdG9vIGxhcmdlOiBpbmNyZWFzZSBD
T05GSUdfU1lTX0JPT1RNX0xFTgo+IC1NdXN0IFJFU0VUIGJvYXJkIHRvIHJlY292ZXIKPiAtcmVz
ZXR0aW5nIC4uLgo+IC0KPiAtU2lnbmVkLW9mZi1ieTogU2h5YW0gU2FpbmkgPHNoeWFtLnNhaW5p
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLS0KPiAtIGluY2x1ZGUvY29uZmlncy9yazMyODhf
Y29tbW9uLmggfCAyICsrCj4gLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gLQo+
IC1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9jb25maWdzL3JrMzI4OF9jb21tb24uaCBiL2luY2x1ZGUv
Y29uZmlncy9yazMyODhfY29tbW9uLmgKPiAtaW5kZXggNzJhNTRiYzBhYi4uZWFiN2NmNGQ4NiAx
MDA2NDQKPiAtLS0tIGEvaW5jbHVkZS9jb25maWdzL3JrMzI4OF9jb21tb24uaAo+IC0rKysgYi9p
bmNsdWRlL2NvbmZpZ3MvcmszMjg4X2NvbW1vbi5oCj4gLUBAIC05LDYgKzksOCBAQAo+IC0gI2lu
Y2x1ZGUgPGFzbS9hcmNoL2hhcmR3YXJlLmg+Cj4gLSAjaW5jbHVkZSAicm9ja2NoaXAtY29tbW9u
LmgiCj4gLSAKPiAtKyNkZWZpbmUgQ09ORklHX1NZU19CT09UTV9MRU4gKDE2IDw8IDIwKSAvKiAx
Nk1CICovCj4gLSsKPiAtICNkZWZpbmUgQ09ORklHX1NLSVBfTE9XTEVWRUxfSU5JVF9PTkxZCj4g
LSAjZGVmaW5lIENPTkZJR19TWVNfTUFMTE9DX0xFTiAgICAgICAgKDMyIDw8IDIwKQo+IC0gI2Rl
ZmluZSBDT05GSUdfU1lTX0NCU0laRSAgICAgICAgMTAyNAo+IC0tLSAKPiAtMi4xMS4wCj4gLQo+
IGRpZmYgLS1naXQgYS9jb25maWdzL2FtYXJ1bGFfdnlhc2FfcmszMjg4X2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvYW1hcnVsYV92eWFzYV9yazMyODhfZGVmY29uZmlnCj4gaW5kZXggM2IxMmRhMDc3Yy4u
OTM0MzQ4ZTFiZCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2FtYXJ1bGFfdnlhc2FfcmszMjg4X2Rl
ZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvYW1hcnVsYV92eWFzYV9yazMyODhfZGVmY29uZmlnCj4g
QEAgLTMsMTQgKzMsMTQgQEAgQlIyX2FybT15Cj4gQlIyX2NvcnRleF9hMTc9eQo+IEJSMl9BUk1f
RlBVX05FT05fVkZQVjQ9eQo+IAo+IC0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEg
NS4xMSBzZXJpZXMKPiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzEx
PXkKPiArIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDUuMTQgc2VyaWVzCj4gK0JS
Ml9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xND15Cj4gCj4gIyBCb290bG9h
ZGVyCj4gQlIyX1RBUkdFVF9VQk9PVD15Cj4gQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1f
S0NPTkZJRz15Cj4gQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9UQVJH
RVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjEuMDEiCj4gK0JSMl9UQVJHRVRfVUJP
T1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjEuMTAiCj4gQlIyX1RBUkdFVF9VQk9PVF9CT0FS
RF9ERUZDT05GSUc9InZ5YXNhLXJrMzI4OCIKPiBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15
Cj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVD15Cj4gQEAgLTIyLDcgKzIyLDcgQEAg
QlIyX1RBUkdFVF9VQk9PVF9TUExfTkFNRT0ic3BsL3UtYm9vdC1zcGwtZHRiLmJpbiB0cGwvdS1i
b290LXRwbC5iaW4iCj4gIyBLZXJuZWwKPiBCUjJfTElOVVhfS0VSTkVMPXkKPiBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tl9WQUxVRT0iNS4xMSIKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
NS4xNCIKCkhlcmUgXl5eIEkgbmVlZCB0byBwYXNzIGxhdGVzdCBzdGFibGUgNS4xNC4xMyBub3Qg
b25seSA1LjE0Cgo+IEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJtdWx0aV92NyIKPiBCUjJf
TElOVVhfS0VSTkVMX1VJTUFHRT15Cj4gQlIyX0xJTlVYX0tFUk5FTF9VSU1BR0VfTE9BREFERFI9
IjB4MDIwMDAwMDAiCj4gQEAgLTQ0LDQgKzQ0LDMgQEAgQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9U
T09MUz15Cj4gQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dl
bmltYWdlLnNoIgo+IEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvYW1hcnVs
YS92eWFzYS9nZW5pbWFnZS5jZmciCj4gQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9h
cmQvYW1hcnVsYS92eWFzYS9wb3N0LWJ1aWxkLnNoIgo+IC1CUjJfR0xPQkFMX1BBVENIX0RJUj0i
Ym9hcmQvYW1hcnVsYS92eWFzYS9wYXRjaGVzLyIKPiAtLSAKPiAyLjI1LjEKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
