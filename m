Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D9AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 14:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9450940190;
	Sun, 20 Feb 2022 14:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maWtVaye8kI8; Sun, 20 Feb 2022 14:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4694D4037C;
	Sun, 20 Feb 2022 14:38:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E77B71BF403
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 14:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD6BE605AF
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 14:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ye2C4jFmraKk for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 14:38:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4EBC605AB
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 14:38:46 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id l25so2700297oic.13
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DfW1yKV1jKmXtc4ADlG4EnZtibCdS1UENj/MRmUM4a8=;
 b=Oo+kZ/amar5tijjjMgvg0MTjG6sI4VfmQSYJhC6AFS6zXLyWH70jKECs76dbzchK6h
 0rQAq6oRRjbCW1YUZbZ41OPp9w0/rCZCFsjuSasVCLqgGCI7VAOjupxg1VaXv4qpZGyi
 jSizq7OgftDfaP+G9fHegK+hmBR3KWP1XQ3RC4n6GFR74O7Baf5JEy4Hye8V4bVRkARy
 ZqUt+rBxhm8PYWkqKZBAVBdkFRdbvrTNWklCqks5uDKs+24LwVMMn3X473Md4aAQ43bN
 JH+g4B9K3UvPg4m0sHxTbv4r8pNyBM365Zo0eEod/t7W6XcPU7qzSZLO5XvdPCC3GJHF
 B2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DfW1yKV1jKmXtc4ADlG4EnZtibCdS1UENj/MRmUM4a8=;
 b=nbCm9s5h0Ww/Qmhgnu+QjmNIJWjBsR9NrZCJc/G4HoLAD56AfXmJ0LMqfrYpmY5l0D
 r2tshxTiH3LVDwLdRM8VlBcaV2mULRc3V12pwJ+BXbI9k3whxipe2WWg1uYkRRaS9C5P
 JoAUMtE0iyZPXX9Kp+tVOsv4S7daVJ06gWJFXu1xlDaxiV851/hyLlPqZiyrsmwlzt73
 //imzXgz83hegIIVL+8a1uM9/k25uQQXSZfSWkTnpCZBE3Z0rLNXurZksVrMsIdA8STp
 Trl/U4cywZmemTEe9MTWIenCkak9PTN9GxlWUugEezBxYgyd9pfL8mAJumLRhKumkndI
 AOpg==
X-Gm-Message-State: AOAM532mGc6XZ6E6w7VxZZ8WulcC/iYmWMSvvoviO0LoLL2hy6JvHhDD
 jl7a3pvOhFbt42qafk5hUp7f30F6ZFW3+tfYa4Y=
X-Google-Smtp-Source: ABdhPJw1D7Aa5UvmBU1XTcytuPNVHoALNS+AB60mjNOBg4buk+lDbzAVetnGZVipWc8g56Pg3CaVieDn1sWLZA4La+s=
X-Received: by 2002:a54:4698:0:b0:2d4:377f:d8cf with SMTP id
 k24-20020a544698000000b002d4377fd8cfmr7191649oic.143.1645367925726; Sun, 20
 Feb 2022 06:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20220219142104.3753374-1-fontaine.fabrice@gmail.com>
 <20220220100846.GU522310@scaer>
In-Reply-To: <20220220100846.GU522310@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Feb 2022 15:38:45 +0100
Message-ID: <CAPi7W80ym=VL-GgDA=DCuwzp7s=mpcMzSFvMOFoxpei+Rb5y5A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/apr-util: drop
 APR_UTIL_FIX_{LIBTOOL, RULES_MK}
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCkxlIGRpbS4gMjAgZsOpdnIuIDIwMjIgw6AgMTE6MDgsIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBGYWJyaWNlLCBBbGwsCj4K
PiBPbiAyMDIyLTAyLTE5IDE1OjIxICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNs
eToKPiA+IERyb3AgQVBSX1VUSUxfRklYX3tMSUJUT09MLFJVTEVTX01LfSB3aGljaCB3ZXJlIGFk
ZGVkIGJ5IGNvbW1pdAo+ID4gODRiNGMxOWU1NTEyODg5MTFhMjMwYzJiNzNlOTZiYzZlMmVkMTJm
OSBidXQgaXMgbm90IG5lZWRlZCBzaW5jZSB0aGUKPiA+IGFkZGl0aW9uIG9mIFBQRF9GSVhVUF9Q
QVRIUyBpbiBjb21taXQKPiA+IGIwNjI5NGU5ODk3ZTkwODYyNjU2NDE2ZThiNjdmZGFjZTE1NDg4
ZDcKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJy
aWNlQGdtYWlsLmNvbT4KPgo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4KPiBUaGVyZSBp
cyBzdGlsbCBvbmUgb2NjdXJlbmNlIG9mIGEgc2ltaWxhciBjb25zdHJ1Y3QgaW4gcXQ1Ogo+Cj4g
ICAgMTQgIyBUaGUgZmlsZSAicXQuY29uZiIgY2FuIGJlIHVzZWQgdG8gb3ZlcnJpZGUgdGhlIGhh
cmQtY29kZWQgcGF0aHMgdGhhdCBhcmUKPiAgICAxNSAjIGNvbXBpbGVkIGludG8gdGhlIFF0IGxp
YnJhcnkuIFdlIG5lZWQgaXQgdG8gbWFrZSAicW1ha2UiIHJlbG9jYXRhYmxlIGFuZAo+ICAgIDE2
ICMgdHdlYWsgdGhlIHBlci1wYWNrYWdlIGluc3RhbGwgcGF0aGVzCj4gICAgMTcgZGVmaW5lIFFU
NV9JTlNUQUxMX1FUX0NPTkYKPiAgICAxOCDCuyAgIHJtIC1mICQoSE9TVF9ESVIpL2Jpbi9xdC5j
b25mCj4gICAgMTkgwrsgICBzZWQgLWUgInN8QEBIT1NUX0RJUkBAfCQoSE9TVF9ESVIpfCIgLWUg
InN8QEBTVEFHSU5HX0RJUkBAfCQoU1RBR0lOR19ESVIpfCIgXAo+ICAgIDIwIMK7ICAgwrsgICAk
KFFUNUJBU0VfUEtHRElSKS9xdC5jb25mLmluID4gJChIT1NUX0RJUikvYmluL3F0LmNvbmYKPiAg
ICAyMSBlbmRlZgo+ICAgIDIyCj4gICAgMjMgaWZlcSAoJChCUjJfUEVSX1BBQ0tBR0VfRElSRUNU
T1JJRVMpLHkpCj4gICAgMjQgZGVmaW5lIFFUNV9RVF9DT05GX0ZJWFVQCj4gICAgMjUgwrsgICAk
KFFUNV9JTlNUQUxMX1FUX0NPTkYpCj4gICAgMjYgZW5kZWYKPiAgICAyNyBlbmRpZgo+Cj4gVGhl
IGdlbmVyaWMgZml4dXAgc2NhbnMgJChIT1NUX0RJUiksIHNvIGl0IHNob3VsZCBoaXQgdGhpcyBm
aWxlIHRvbywgbm8/Cj4KPiBRVDVfUVRfQ09ORl9GSVhVUCBpcyB1c2VkIGluIHR3byBsb2NhdGlv
bnM6Cj4KPiAgIC0gcGtnLXFtYWtlLm1rIC0+IGFzIGEgcG9zdC1wcmVhcGFyZSBob29rLCB3aGlj
aCBpcyBleGFjdGx5IHdoZXJlIHRoZQo+ICAgICBnZW5lcmljIGZpeHVwIHJ1bnMgdG9vLCBzbyBR
VDVfUVRfQ09ORl9GSVhVUCBzaG91bGQgYmUgYSBuby1vcAo+ICAgICAod2VsbCwgaXQgZG9lcyBy
dW4gYmVmb3JlIHRoZSBnZW5lcmljIG9uZSkuCj4KPiAgIC0gcHl0aG9uLXB5cXQ1Lm1rIC0+IGFz
IGEgcHJlLWNvbmZpZ3VyZSBob29rLCB3aGljaCBpcyBpbmNvcnJlY3QKPiAgICAgYmVjYXVzZWQg
aXQgd2lsbCBhc3NpZ24gdGhhdCBmaWxlIHRvIHRoYXQgcGFja2FnZSwgYW5kIGFueXdheSB0aGUK
PiAgICAgZ2VuZXJpYyBmaXh1cCBob29rIGhhcyBhbHJlYWR5IGJlZW4gcnVuIGFueXdheSwgc28g
dGhpcyBzaG91bGQgYmUgYQo+ICAgICBuby1vcC4KPgo+IENhcmUgdHAgaGF2ZSBhIGxvb2ssIHBs
ZWFzZT8KSSBkb24ndCByZWFsbHkgbWFzdGVyIFF0IGJ1dCBpZiBJIHVuZGVyc3RhbmQgd2VsbCBj
b21taXQKNjBlM2EwOTY5MzcwM2YwYzkyMzMyMmQzOWNlMTIxMGJhZjE1NDk4MywKUVQ1X0lOU1RB
TExfUVRfQ09ORiBpcyBhbHNvIHVzZWQgdG8gbWFrZSBxbWFrZSAicmVsb2NhdGFibGUiIGluIHF0
NWJhc2UubWsuCgpTbywgcmV2ZXJ0aW5nIGNvbW1pdCA2MGUzYTA5NjkzNzAzZjBjOTIzMzIyZDM5
Y2UxMjEwYmFmMTU0OTgzIGlzIHByb2JhYmx5IG9rLgpIb3dldmVyIEkgYXNzdW1lIHRoYXQgd2Ug
c2hvdWxkIGtlZXAgYSBRVDVCQVNFX0lOU1RBTExfUVRfQ09ORiB0aGF0CmNyZWF0ZXMgYSBxdC5j
b25mLgoKU29tZW9uZSB3aXRoIGJldHRlciBRdCBrbm93bGVkZ2UgY291bGQgcHJvYmFibHkgY29u
ZmlybSB0aGlzIGFzc3VtcHRpb24uCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+
IC0tLQo+ID4gIHBhY2thZ2UvYXByLXV0aWwvYXByLXV0aWwubWsgfCAxNCAtLS0tLS0tLS0tLS0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9hcHItdXRpbC9hcHItdXRpbC5tayBiL3BhY2thZ2UvYXByLXV0aWwvYXByLXV0
aWwubWsKPiA+IGluZGV4IGY2Y2U3YWMwNjQuLmNmODQwN2NlZDAgMTAwNjQ0Cj4gPiAtLS0gYS9w
YWNrYWdlL2Fwci11dGlsL2Fwci11dGlsLm1rCj4gPiArKysgYi9wYWNrYWdlL2Fwci11dGlsL2Fw
ci11dGlsLm1rCj4gPiBAQCAtMTcsMjAgKzE3LDYgQEAgQVBSX1VUSUxfQ09ORl9PUFRTID0gXAo+
ID4gICAgICAgLS13aXRoLWFwcj0kKFNUQUdJTkdfRElSKS91c3IvYmluL2Fwci0xLWNvbmZpZwo+
ID4gIEFQUl9VVElMX0NPTkZJR19TQ1JJUFRTID0gYXB1LTEtY29uZmlnCj4gPgo+ID4gLWlmZXEg
KCQoQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTKSx5KQo+ID4gLWRlZmluZSBBUFJfVVRJTF9G
SVhfTElCVE9PTAo+ID4gLSAgICAgJChTRUQpICdzLCQoUEVSX1BBQ0tBR0VfRElSKS9hcHIvLCQo
UEVSX1BBQ0tBR0VfRElSKS9hcHItdXRpbC8sZycgXAo+ID4gLSAgICAgICAgICAgICAkKFNUQUdJ
TkdfRElSKS91c3IvYnVpbGQtMS9saWJ0b29sCj4gPiAtZW5kZWYKPiA+IC1BUFJfVVRJTF9QT1NU
X1BSRVBBUkVfSE9PS1MgKz0gQVBSX1VUSUxfRklYX0xJQlRPT0wKPiA+IC0KPiA+IC1kZWZpbmUg
QVBSX1VUSUxfRklYX1JVTEVTX01LCj4gPiAtICAgICAkKFNFRCkgJ3MsJChQRVJfUEFDS0FHRV9E
SVIpL2Fwci8sJChQRVJfUEFDS0FHRV9ESVIpL2Fwci11dGlsLyxnJyBcCj4gPiAtICAgICAgICAg
ICAgICQoQEQpL2J1aWxkL3J1bGVzLm1rCj4gPiAtZW5kZWYKPiA+IC1BUFJfVVRJTF9QT1NUX0NP
TkZJR1VSRV9IT09LUyArPSBBUFJfVVRJTF9GSVhfUlVMRVNfTUsKPiA+IC1lbmRpZgo+ID4gLQo+
ID4gICMgV2hlbiBpY29udiBpcyBhdmFpbGFibGUsIHRoZW4gdXNlIGl0IHRvIHByb3ZpZGUgY2hh
cnNldCBjb252ZXJzaW9uCj4gPiAgIyBmZWF0dXJlcy4KPiA+ICBBUFJfVVRJTF9ERVBFTkRFTkNJ
RVMgKz0gJChpZiAkKEJSMl9QQUNLQUdFX0xJQklDT05WKSxsaWJpY29udikKPiA+IC0tCj4gPiAy
LjM0LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKQmVz
dCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
