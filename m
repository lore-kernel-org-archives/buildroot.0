Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897C7CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B35084705;
	Thu, 16 Oct 2025 14:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYsmZ1wlJl7t; Thu, 16 Oct 2025 14:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD71C84718
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD71C84718;
	Thu, 16 Oct 2025 14:47:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 661EC93E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0127441F91
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUfpYOyy8vk7 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 14:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA7A141F8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA7A141F8D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA7A141F8D
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 218F64E410EF;
 Thu, 16 Oct 2025 14:46:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ED6306062C;
 Thu, 16 Oct 2025 14:46:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D3D3C102F2317; 
 Thu, 16 Oct 2025 16:46:50 +0200 (CEST)
Date: Thu, 16 Oct 2025 16:46:34 +0200
MIME-Version: 1.0
Message-Id: <20251016-openscap-v3-1-d7b28e958f5f@bootlin.com>
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
In-Reply-To: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760626011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=A74CUS1RsQdbAIs6iMw/i7UHvunh4FEgB3jUIdTZOsM=;
 b=NoUEt7gMPTNBb8AcVkyKU+mIfjKw4jBKBj+wiU79yKN3TZ/cCbMuyPysGorfaiVriCWXEO
 Yb5n3C4GBEkWmhwoB+AowO8Nh6ivYkwzAAoIWHoTQtYFZjfmH/Y9Wmj6U79CypbiqNtRvL
 rELxMRc52PMT0UrNaw6g2TfnJEicHjbfgRKTIrDIouoD0NFcPCd0ZKw6qtctbxA55kVGV8
 WV0oPc6PQNZ/08H4Vba83/w/hG4jSH8rDGzQtAEyRk6/3jmteLpySPsw63T387CoKBWbRi
 wFrEEKz/ExNJQlSx9smZen2iH7Of0yk6DEi8B74csJj3IIOk5rBG7Sa4Db3hwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NoUEt7gM
Subject: [Buildroot] [PATCH v3 1/5] package/libxmlsec1: new package
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
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW50cm9kdWNlIHRoZSBsaWJ4bWxzZWMxIGxpYnJhcnkgcGFja2FnZS4gbGlieG1sc2VjIGltcGxl
bWVudHMgWE1MCnNlY3VyaXR5IHN0YW5kYXJkcy4KClRoZSBsaWJyYXJ5IGhhcyBvbmx5IGEgZmV3
IG1hbmRhdG9yeSBkZXBlbmRlbmNpZXMobGlieG1sMiBhbmQgbGlieHNsdAphbmQgYSBjcnlwdG8g
bGlicmFyeSkuICBJdCBuZWVkcyBvbmUgb2YgdGhlIGZvbGxvd2luZyBjcnlwdG9ncmFwaGljCmxp
YnJhcmllczogT3BlblNTTCwgTlNTLCBvciBHY3J5cHQvR05VVExTLiBEZWZhdWx0IHRvIG9wZW5z
c2wgZm9yIG5vdyB0bwprZWVwIHRoZSBwYWNrYWdlIHNpbXBsZS4KClNpZ25lZC1vZmYtYnk6IEFs
ZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpDaGFuZ2VzIGlu
IHYyOgotIHJld29yZCBjb21taXQgdGl0bGUKLSBhZGQgbWFpbnRhaW5lciBlbnRyeQotIHJlbW92
ZSBkdXBsaWNhdGUgY29tbWVudCBpbiBoYXNoIGZpbGUKLSByZWZvcm1hdCBjb25mIG9wdHMgbGlz
dAotIHJlbW92ZSBoYXJkY29kZWQgc3RhdGljIGJ1aWxkIGNvbmYgb3B0Ci0gcHJvcGVybHkgZHVw
bGljYXRlIGNvbmYgb3B0cyBmb3IgaG9zdCB2YXJpYW50Ci0tLQogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAg
ICAgICB8ICAxICsKIHBhY2thZ2UvbGlieG1sc2VjMS9Db25maWcuaW4gICAgICAgfCAxMyArKysr
KysrKysrKysrCiBwYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5oYXNoIHwgIDMgKysrCiBw
YWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tayAgIHwgMzIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDg0MDNkYjYzNmY3MmQxY2U1NjAy
NWJhZjE1MjExZjMxOWY1NDFiYTYuLjQ3NGRlMzZlYWQ1ZjkyOWQ0M2Y2NGJiZjMyYTViMjEyMTQ5
YTM1MTkgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTUzLDYg
KzE1Myw5IEBAIEY6CWNvbmZpZ3MvY3ViaWVib2FyZDJfZGVmY29uZmlnCiBOOglBbGV4ZXkgTHVr
eWFuY2h1ayA8c2tpZkBza2lmLXdlYi5ydT4KIEY6CXBhY2thZ2UvemFiYml4LwogCitOOglBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgorRjoJcGFja2FnZS9saWJ4
bWxzZWMxLworCiBOOglBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPgog
RjoJYm9hcmQvc2lmaXZlLwogRjoJYm9vdC9vcGVuc2JpLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9D
b25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA4NTkyODUwOWY4ZjEyN2EyMWZjZWIx
ODQ5N2M0MzA0MDgyMmIxYzZjLi5mZWQ0N2I2MjkxZDEzMDMzY2UzODA3ZWFkOGZlZGU5YjA0OGI5
Nzg3IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5p
bgpAQCAtMTkzNSw2ICsxOTM1LDcgQEAgbWVudSAiSlNPTi9YTUwiCiAJc291cmNlICJwYWNrYWdl
L2xpYnhtbGIvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9saWJ4bWxwcC9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL2xpYnhtbHJwYy9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdl
L2xpYnhtbHNlYzEvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9saWJ4c2x0L0NvbmZpZy5p
biIKIAlzb3VyY2UgInBhY2thZ2UvbGlieWFtbC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdl
L214bWwvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ4bWxzZWMxL0NvbmZpZy5p
biBiL3BhY2thZ2UvbGlieG1sc2VjMS9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMTU1ZWZhYzgyNWMw
NzFkMGQzNTE4YTkyY2EzNWNhZjdkN2RlY2Y5ZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
bGlieG1sc2VjMS9Db25maWcuaW4KQEAgLTAsMCArMSwxMyBAQAorY29uZmlnIEJSMl9QQUNLQUdF
X0xJQlhNTFNFQzEKKwlib29sICJsaWJ4bWxzZWMxIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVO
U1NMCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhNTDIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElC
WFNMVAorCWhlbHAKKwkgIFhNTFNlYyBsaWJyYXJ5IHByb3ZpZGVzIEMgYmFzZWQgaW1wbGVtZW50
YXRpb24gZm9yIG1ham9yIFhNTAorCSAgU2VjdXJpdHkgc3RhbmRhcmRzOgorCSAgICAtIFhNTCBT
aWduYXR1cmUgU3ludGF4IGFuZCBQcm9jZXNzaW5nCisJICAgIC0gWE1MIEVuY3J5cHRpb24gU3lu
dGF4IGFuZCBQcm9jZXNzaW5nCisKKwkgIGh0dHBzOi8vd3d3LmFsZWtzZXkuY29tL3htbHNlYy8K
KwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2VjCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYnhtbHNlYzEvbGlieG1sc2VjMS5oYXNoIGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNl
YzEuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwLi5kYjFkYzc3ZWZmZDdjNzU2ZjdkYTBmYjk5ZjRhM2UzZjlhYWU0
NTE2Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFz
aApAQCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBjb21wdXRlZAorc2hhMjU2ICBkODJlOTNiNjli
OGFhMjA1YTYxNmI2MjkxN2EyNjkzMjJiZjYzYTNlYWFmYjM3NzUwMTRlNjE3NTJiMjAxM2VhICB4
bWxzZWMxLTEuMy43LnRhci5negorc2hhMjU2ICBkNWU5Mzg4NTM0MjU2MzYwYzZhMDA5ZDRmMTlh
YjJiOGQ2ZWMwYWE3ZmYzMmE1MWUyMmQ4OTllZDdiZWI1YzQ4ICBDb3B5cmlnaHQKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rIGIvcGFja2FnZS9saWJ4bWxzZWMx
L2xpYnhtbHNlYzEubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMTZiM2JjZjg0ODg3MjQ0ZWQ2M2E1NzQ2MTk0MjQ5
ZjMzOWI4YTIwZgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxz
ZWMxLm1rCkBAIC0wLDAgKzEsMzIgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIGxp
YnhtbHNlYzEKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK0xJQlhNTFNFQzFfVkVSU0lP
TiA9IDEuMy43CitMSUJYTUxTRUMxX1NPVVJDRSA9IHhtbHNlYzEtJChMSUJYTUxTRUMxX1ZFUlNJ
T04pLnRhci5negorTElCWE1MU0VDMV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2xzaDEyMy94
bWxzZWMvcmVsZWFzZXMvZG93bmxvYWQvJChMSUJYTUxTRUMxX1ZFUlNJT04pCitMSUJYTUxTRUMx
X0xJQ0VOU0UgPSBNSVQKK0xJQlhNTFNFQzFfTElDRU5TRV9GSUxFUyA9IENvcHlyaWdodAorTElC
WE1MU0VDMV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKK0xJQlhNTFNFQzFfREVQRU5ERU5DSUVTID0g
bGlieG1sMiBsaWJ4c2x0IG9wZW5zc2wKK0hPU1RfTElCWE1MU0VDMV9ERVBFTkRFTkNJRVMgPSBo
b3N0LWxpYnhtbDIgaG9zdC1saWJ4c2x0IGhvc3Qtb3BlbnNzbAorTElCWE1MU0VDMV9BVVRPUkVD
T05GID0gWUVTCisKK0xJQlhNTFNFQzFfQ09ORl9PUFRTID0gXAorCS0tZW5hYmxlLWNyeXB0by1k
bD1ubyBcCisJLS13aXRoLW9wZW5zc2wgXAorCS0td2l0aG91dC1nbnV0bHMgXAorCS0td2l0aG91
dC1nY3J5cHQgXAorCS0td2l0aG91dC1uc3MKKworSE9TVF9MSUJYTUxTRUMxX0NPTkZfT1BUUyA9
IFwKKwktLWVuYWJsZS1jcnlwdG8tZGw9bm8gXAorCS0td2l0aC1vcGVuc3NsIFwKKwktLXdpdGhv
dXQtZ251dGxzIFwKKwktLXdpdGhvdXQtZ2NyeXB0IFwKKwktLXdpdGhvdXQtbnNzCisKKyQoZXZh
bCAkKGF1dG90b29scy1wYWNrYWdlKSkKKyQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2Up
KQoKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
