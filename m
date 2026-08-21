Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C1C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 17:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0727340A13;
	Fri, 21 Aug 2026 17:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHgjsrXvUot2; Fri, 21 Aug 2026 17:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787332324;
	bh=h1Uuv6agHcN3sipymnbwI12KJ1n2KxWXHJtktXCAzT8=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MJUJe9+2ufMgHbvCaVeiU7RWKX1DveT4gN/sSuESq9iGe3wdfCw5RNtRnfR56bMpS
	 XsvcOEzrrCY97pgW0CWFzXQJlLD+dPwgZLvlcnw6apas+G2MjURd3kVYpSt5gf661m
	 cSM+MM/Y/xE6BlRkwFx/Yy44cbITV4JXWkzWh3EbYpKLWgvCEI2VYmrzMRnCZGbcxW
	 u4zBKIKS7AeYXLSCmY9zrixuDBZx2j6YiF1NcI+alSN8Z6PZdcK9jroY/WylkDbAHb
	 xregpFo7O7+u9fEJodS1IxjrvluillplFhrrZAYmG/pUR5wg70H4RM649BsuRp4Ezh
	 NyH1nmTcw98Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E62A40A26;
	Fri, 21 Aug 2026 17:12:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98B7B93F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 17:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A73F60A6D
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 17:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uhsl1L2oUZpk for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 17:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DEFE60A64
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 17:12:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E559D4E4131C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 17:11:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA9ED604AA;
 Fri, 21 Aug 2026 17:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49AC411C77474; 
 Fri, 21 Aug 2026 19:11:50 +0200 (CEST)
Date: Fri, 21 Aug 2026 19:11:42 +0200
MIME-Version: 1.0
Message-Id: <20260821-qt5_allow_other_openssl_implementations-v2-1-7f3f82c610ca@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Oyw7CIBBFf6VhLYaHfbnyP0xDKE4thkIFrJqm/
 y6tce9iFie5OWdmFMBrCOiYzcjDpIN2NgHbZUj10l4B60tixAgrSMUIvsdcSGPcU7jYgxduBBu
 CEXoYDQxgo4xJEXDBuOp4nk7WKNlGD51+baVz8+XwaG+g4qpfF70O0fn39spE192vSv+uThRT3
 AI98KokJa/5qXUuGm33yg2oWZblA1y0DGryAAAA
X-Change-ID: 20260820-qt5_allow_other_openssl_implementations-623cf35cf3a9
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2] package/qt5: relax openssl constraint to
 allow compatible implementations
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UXQ1IGNhbiBiZSBidWlsdCB3aXRoIG9yIHdpdGhvdXQgb3BlbnNzbCBzdXBwb3J0LiBGb2xsb3dp
bmcgc29tZSBidWlsZApmYWlsdXJlcywgY29tbWl0IGE5NGQzOWQ2OTNkOCAoInBhY2thZ2UvcXQ1
OiBmaXggYnVpbGQgZmFpbHVyZSBkdWUgdG8KbGlicmVzc2wgdXNlIikgZW5mb3JjZWQgbGlib3Bl
bnNzbCBhcyB0aGUgb25seSB2YWxpZCBpbXBsZW1lbnRhdGlvbiBmb3IKUXQ1IG9wZW5zc2wgc3Vw
cG9ydC4KCldoaWxlIHRoaXMgc29sdXRpb24gaXMgZmluZSB0byBmaWx0ZXIgYmV0d2VlbiB0aGUg
dHdvIG9wZW5zc2wgdmFyaWFudHMKb2ZmaWNpYWxseSBzdXBwb3J0ZWQgYnkgQnVpbGRyb290LCBp
dCBwcmV2ZW50cyB1c2VycyBicmluZ2luZyB0aGVpciBvd24KT3BlblNTTCBpbXBsZW1lbnRhdGlv
bnMgKHRocm91Z2ggdGhlIHZpcnR1YWwgcGFja2FnZSBtZWNoYW5pc20pIGZyb20KYnVpbGRpbmcg
UXQ1IHdpdGggb3BlbnNzbCBzdXBwb3J0LCBldmVuIGlmIHRoZSBjdXN0b20gaW1wbGVtZW50YXRp
b24KbWF0Y2hlcyB0aGUgZXhwZWN0ZWQgT3BlblNTTCBBUEkuCgpBbGxvdyBjb21wYXRpYmxlIGV4
dGVybmFsIGltcGxlbWVudGF0aW9ucyB0byBiZSBwcm92aWRlZCBmb3IgUXQ1IG9wZW5zc2wKc3Vw
cG9ydC4gUmVsYXggdGhlIGNvbnN0cmFpbnQgYnkgcGFydGlhbGx5IHJldmVydGluZyBhOTRkMzlk
NjkzZDggYW5kCmNoZWNraW5nIHRoYXQgdGhlIHNlbGVjdGVkIG9wZW5zc2wgaW1wbGVtZW50YXRp
b24gaXNuJ3QgbGlicmVzc2wuIEl0CnRoZW4gYmVjb21lcyB1cCB0byB1c2VycyB0byBlbnN1cmUg
dGhhdCB0aGUgaW1wbGVtZW50YXRpb24gdGhleSBhcmUKcHJvdmlkaW5nIGlzIGZ1bGx5IGNvbXBh
dGlibGUgd2l0aCBsaWJvcGVuc3NsJ3MuIFNvbWUgcXQ1CnN1Yi1wYWNrYWdlcyBlbmZvcmNlIEJS
Ml9QQUNLQUdFX09QRU5TU0xfRk9SQ0VfTElCT1BFTlNTTCwgdGhleSBkb24ndApuZWVkIGFueSB1
cGRhdGUgYXMgaXQgZG9lcyBub3QgcmVhbGx5IHN0cmljdGx5IHNlbGVjdCBsaWJvcGVuc3NsLCBp
dApyYXRoZXIgcHJldmVudHMgbGlicmVzc2wsIHNvIGl0IHN0aWxsIGFsbG93cyBjdXN0b20gcHJv
dmlkZXJzLgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBi
b290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gcy9wcm92aWRlcyBtZWNoYW5pc20vdmly
dHVhbCBwYWNrYWdlIG1lY2hhbmlzbS8gKFRob21hcyBQLikKLSB1c2UgaWZlcSBvbiBwYWlyIG9y
IGtjb25maWcgdmFyaWFibGVzIHRvIGNsYXJpZnkgdGhlIGNvbmRpdGlvbiAoVGhvbWFzIFAuKQot
IExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDgyMS1xdDVfYWxsb3df
b3RoZXJfb3BlbnNzbF9pbXBsZW1lbnRhdGlvbnMtdjEtMS1iZTE0Mzg3MDczOTNAYm9vdGxpbi5j
b20KClRvOiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpDYzogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KQ2M6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVu
ZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgotLS0KVGhlIGlzc3VlIGFmZmVjdHMgMjAyNS4w
Mi54LCAyMDI2LjA1LngsIDIwMjYuMDgueCBhbmQgbWFzdGVyCi0tLQogcGFja2FnZS9xdDUvcXQ1
YmFzZS9xdDViYXNlLm1rIHwgMTIgKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3F0NS9xdDVi
YXNlL3F0NWJhc2UubWsgYi9wYWNrYWdlL3F0NS9xdDViYXNlL3F0NWJhc2UubWsKaW5kZXggMTU5
ZDQxMWRlODViLi4zZTU0NDY1ZWQ3ODkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcXQ1L3F0NWJhc2Uv
cXQ1YmFzZS5taworKysgYi9wYWNrYWdlL3F0NS9xdDViYXNlL3F0NWJhc2UubWsKQEAgLTIzMCw4
ICsyMzAsMTYgQEAgZWxzZQogUVQ1QkFTRV9DT05GSUdVUkVfT1BUUyArPSAtbm8tZWdsZnMKIGVu
ZGlmCiAKLVFUNUJBU0VfQ09ORklHVVJFX09QVFMgKz0gJChpZiAkKEJSMl9QQUNLQUdFX0xJQk9Q
RU5TU0wpLC1vcGVuc3NsLC1uby1vcGVuc3NsKQotUVQ1QkFTRV9ERVBFTkRFTkNJRVMgICArPSAk
KGlmICQoQlIyX1BBQ0tBR0VfTElCT1BFTlNTTCksb3BlbnNzbCkKKyMgUXQ1IG9mZmljaWFsbHkg
b25seSBzdXBwb3J0cyBPcGVuU1NMLiBVc2VycyBjYW4gYWxzbyBwcm92aWRlIHRoZWlyIG93bgor
IyBPcGVuU1NMIHZhcmlhbnQgdGhyb3VnaCB0aGUgdmlydHVhbCBwYWNrYWdlIG1lY2hhbmlzbSwg
YnV0IGl0IGlzIHRoZW4gdXAKKyMgdG8gdGhlbSB0byBlbnN1cmUgdGhhdCB0aGUgcHJvdmlkZWQg
QVBJIGlzIGV4YWN0bHkgY29tcGF0aWJsZSB3aXRoIHRoZQorIyBsaWJvcGVuc3NsIG9uZQoraWZl
cSAoJChCUjJfUEFDS0FHRV9PUEVOU1NMKTokKEJSMl9QQUNLQUdFX0xJQlJFU1NMKSx5OikKK1FU
NUJBU0VfQ09ORklHVVJFX09QVFMgKz0gLW9wZW5zc2wKK1FUNUJBU0VfREVQRU5ERU5DSUVTICAg
Kz0gb3BlbnNzbAorZWxzZQorUVQ1QkFTRV9DT05GSUdVUkVfT1BUUyArPSAtbm8tb3BlbnNzbAor
ZW5kaWYKIAogUVQ1QkFTRV9DT05GSUdVUkVfT1BUUyArPSAkKGlmICQoQlIyX1BBQ0tBR0VfUVQ1
QkFTRV9GT05UQ09ORklHKSwtZm9udGNvbmZpZywtbm8tZm9udGNvbmZpZykKIFFUNUJBU0VfREVQ
RU5ERU5DSUVTICAgKz0gJChpZiAkKEJSMl9QQUNLQUdFX1FUNUJBU0VfRk9OVENPTkZJRyksZm9u
dGNvbmZpZykKCi0tLQpiYXNlLWNvbW1pdDogNTI0NWM0MTQ0MWJhY2NhMjkyZDEyOWQ0MzM5ZTc5
ZTUxNzlhZjc5YwpjaGFuZ2UtaWQ6IDIwMjYwODIwLXF0NV9hbGxvd19vdGhlcl9vcGVuc3NsX2lt
cGxlbWVudGF0aW9ucy02MjNjZjM1Y2YzYTkKCkJlc3QgcmVnYXJkcywKLS0gIApBbGV4aXMgTG90
aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
