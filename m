Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B648CEFCFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EAE740253;
	Tue,  6 Jan 2026 20:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKYlGNc5oRkZ; Tue,  6 Jan 2026 20:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42525408E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767729693;
	bh=SrobR/a9uSlvOx5pEZ4KceTUd94nSrydoDowx5phy28=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hebvgs40fEEYpdnzYbW0DX/YdngFHv2Uo/+6UgW3KobHpKhvYDNoD0Ebnb7q8r+3I
	 fH1NdCynnqg8Y4e6pKYBs1kUsC0hhMSmahNjyJADDJ6SvP53tdJwXyDypqd7Fh/bYx
	 sbyJL3QzCLHZHxIPXpBOWy71YlheCSHU22Q2ZrAPNQnN4/bVWdPRA6HADypxoM6md1
	 ve2xT0eki6m134tiDZqUw+8sBDUhg8GrEt8QA8GT3FK0zCo2XXV6t9rLLEQCeHkTML
	 pmGDG4it5LnVC6z+lQI3wmrjJ2LImpohl6cv7/dRLnvw1/PW2QRNpOr9j/ubZFqZ/a
	 +dCgdCZwQGrDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42525408E6;
	Tue,  6 Jan 2026 20:01:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C208249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E48080CA2
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhHaHjZVrkeL for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E98A80C8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E98A80C8E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E98A80C8E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:01:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE612A4C3702;
 Tue,  6 Jan 2026 21:01:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdDF0-000000002Vv-1K26;
 Tue, 06 Jan 2026 20:01:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  6 Jan 2026 21:01:06 +0100
Message-ID: <20260106200115.1985522-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106200115.1985522-1-bernd@kuhls.net>
References: <20260106200115.1985522-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767729678;
 bh=pthTry8pTlQsaGFZnih2sRgvmHN/qm3Aa0GVrAPI3Jw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EMNrTE7pGblhWzYlNxHInmKCJSkqLABs03pa+wrkjYxez+f7CPvtmqeuRou5SWpaV
 5nsfxfbKFVnmjFSJQO3jUgAJ0yiLeejeF4VyRwOn1fKXWT9DYNKMXFAznQsaMIK39A
 AyYb64TnkVI39Sj1CS4TObdrZckZZe0sR3KnZw73bflj8ezLxKV3ijArxIn2bnJH6X
 OUq9JrKI2oeZVC9F8iO+ggbhrC9StNJXIwZbpUZAJIAvA4aX/NsgFWNMFtxhdCKuIS
 xau/+R1m4MzGI/BtnYPlugsv1ZI92KFN5tGJAQxn9L0plX/xiWFtIwvNiQnWk7D3ro
 9XUzvADzEM8Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EMNrTE7p
Subject: [Buildroot] [PATCH v2 1/9] package/libsvg-cairo: remove package
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

RnJvbTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KClRo
aXMgcGFja2FnZSBpcyBubyBsb25nZXIgbWFpbnRhaW5lZCwgbm8gcmVsZWFzZSBzaW5jZSAyMDA1
LCBhbmQgaXRzCmRlcGVuZGVuY3kgbGlic3ZnIGhhcyBidWlsZCBpc3N1ZXMgYXMgaXQgdXNlcyB0
b28gb2xkIFhNTCBBUElzOgoKL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9o
b3N0L2Jpbi8uLi9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVk
ZS9saWJ4bWwyL2xpYnhtbC9TQVguaDoxODo0OiB3YXJuaW5nOiAjd2FybmluZyAibGlieG1sL1NB
WC5oIGlzIGRlcHJlY2F0ZWQiIFstV2NwcF0KICAgMTggfCAgICN3YXJuaW5nICJsaWJ4bWwvU0FY
LmggaXMgZGVwcmVjYXRlZCIKICAgICAgfCAgICBefn5+fn5+CgpzdmdpbnQuaDo0Mjo5OiBlcnJv
cjogdW5rbm93biB0eXBlIG5hbWUgJ3htbFBhcnNlckN0eHRQdHInCiAgIDQyIHwgdHlwZWRlZiB4
bWxQYXJzZXJDdHh0UHRyIHN2Z194bWxfcGFyc2VyX2NvbnRleHRfdDsKICAgICAgfCAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+Ci0tLQogQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgICAgICAgICAgICAg
fCAgOCArKysrKysrKwogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSAtCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIHBhY2th
Z2UvbGlic3ZnLWNhaXJvL0NvbmZpZy5pbiAgICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KIHBhY2th
Z2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWlyby5oYXNoIHwgIDYgLS0tLS0tCiBwYWNrYWdlL2xp
YnN2Zy1jYWlyby9saWJzdmctY2Fpcm8ubWsgICB8IDE2IC0tLS0tLS0tLS0tLS0tLS0KIDYgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2xpYnN2Zy1jYWlyby9Db25maWcuaW4KIGRlbGV0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2xpYnN2Zy1jYWlyby9saWJzdmctY2Fpcm8uaGFzaAogZGVsZXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWlyby5tawoKZGlmZiAtLWdpdCBhL0Nv
bmZpZy5pbi5sZWdhY3kgYi9Db25maWcuaW4ubGVnYWN5CmluZGV4IGNlN2E0NzU4MzguLjAxMDIw
M2M2OWQgMTAwNjQ0Ci0tLSBhL0NvbmZpZy5pbi5sZWdhY3kKKysrIGIvQ29uZmlnLmluLmxlZ2Fj
eQpAQCAtMTQ2LDYgKzE0NiwxNCBAQCBlbmRpZgogCiBjb21tZW50ICJMZWdhY3kgb3B0aW9ucyBy
ZW1vdmVkIGluIDIwMjYuMDIiCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJTVkdfQ0FJUk8KKwli
b29sICJsaWJzdmctY2Fpcm8gcGFja2FnZSByZW1vdmVkIgorCXNlbGVjdCBCUjJfTEVHQUNZCisJ
aGVscAorCSAgVGhlIGxpYnN2Zy1jYWlybyBwYWNrYWdlIGhhcyBiZWVuIHJlbW92ZWQuIEl0cyBs
YXRlc3QKKwkgIHVwc3RyZWFtIHJlbGVhc2Ugd2FzIGZyb20gMjAwNSwgYW5kIGl0IHdhc24ndCB1
c2VkIGJ5IGFueQorCSAgb3RoZXIgQnVpbGRyb290IHBhY2thZ2UuCisKIGNvbmZpZyBCUjJfUEFD
S0FHRV9IT1NUX0pTTUlOCiAJYm9vbCAiaG9zdC1qc21pbiBoYXMgYmVlbiByZW1vdmVkIgogCXNl
bGVjdCBCUjJfTEVHQUNZCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRl
eCBmOTgyZTMxMjNhLi5kZGFkMzdjMmM2IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RF
VkVMT1BFUlMKQEAgLTU5Miw3ICs1OTIsNiBAQCBGOglwYWNrYWdlL3N1bnhpLWJvYXJkcy8KIE46
CUNhcnN0ZW4gU2Nob2VuZXJ0IDxjLnNjaG9lbmVydEBnbWFpbC5jb20+CiBGOglwYWNrYWdlL2xp
YmR2YnNpLwogRjoJcGFja2FnZS9saWJzdmcvCi1GOglwYWNrYWdlL2xpYnN2Zy1jYWlyby8KIAog
TjoJQ8OpZHJpYyBDaMOpcGllZCA8Y2VkcmljLmNoZXBpZWRAZ21haWwuY29tPgogRjoJcGFja2Fn
ZS96bmMvCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmlu
CmluZGV4IDM1MmZkNjI2ZTAuLjlkMTFjOTMyNTIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmln
LmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0xNzczLDcgKzE3NzMsNiBAQCBtZW51ICJH
cmFwaGljcyIKIAlzb3VyY2UgInBhY2thZ2UvbGlicmF3L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvbGlicnN2Zy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2xpYnN2Zy9Db25maWcu
aW4iCi0Jc291cmNlICJwYWNrYWdlL2xpYnN2Zy1jYWlyby9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL2xpYnZhL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbGlidmEtaW50ZWwtZHJp
dmVyL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbGlidmRwYXUvQ29uZmlnLmluIgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJzdmctY2Fpcm8vQ29uZmlnLmluIGIvcGFja2FnZS9saWJzdmct
Y2Fpcm8vQ29uZmlnLmluCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0NjAyZTkzYzJh
Li4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvbGlic3ZnLWNhaXJvL0NvbmZpZy5pbgorKysgL2Rl
di9udWxsCkBAIC0xLDExICswLDAgQEAKLWNvbmZpZyBCUjJfUEFDS0FHRV9MSUJTVkdfQ0FJUk8K
LQlib29sICJsaWJzdmctY2Fpcm8iCi0Jc2VsZWN0IEJSMl9QQUNLQUdFX0NBSVJPCi0Jc2VsZWN0
IEJSMl9QQUNLQUdFX0NBSVJPX1BORwotCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJTVkcKLQloZWxw
Ci0JICBMaWJzdmctY2Fpcm8gcHJvdmlkZXMgdGhlIGFiaWxpdHkgdG8gcmVuZGVyIFNWRyBjb250
ZW50IGZyb20KLQkgIGZpbGVzIG9yIGJ1ZmZlcnMuIEFsbCByZW5kZXJpbmcgaXMgcGVyZm9ybWVk
IHVzaW5nIHRoZSBjYWlybwotCSAgcmVuZGVyaW5nIGxpYnJhcnkuCi0KLQkgIGh0dHA6Ly9jYWly
b2dyYXBoaWNzLm9yZwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNh
aXJvLmhhc2ggYi9wYWNrYWdlL2xpYnN2Zy1jYWlyby9saWJzdmctY2Fpcm8uaGFzaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZDljZmJmZmE3YS4uMDAwMDAwMDAwMAotLS0gYS9wYWNr
YWdlL2xpYnN2Zy1jYWlyby9saWJzdmctY2Fpcm8uaGFzaAorKysgL2Rldi9udWxsCkBAIC0xLDYg
KzAsMCBAQAotIyBGcm9tIGh0dHA6Ly9jYWlyb2dyYXBoaWNzLm9yZy9zbmFwc2hvdHMvbGlic3Zn
LWNhaXJvLTAuMS42LnRhci5nei5tZDUKLW1kNSAgZDc5ZGE3YjNhNjBhZDhjOGU0YjkwMmM5YjM1
NjMwNDcgIGxpYnN2Zy1jYWlyby0wLjEuNi50YXIuZ3oKLQotIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
LXNoYTI1NiAgYTM4MGJlNmE3OGVjMjkzODEwMGNlOTA0MzYzODE1YTk0MDY4ZmNhMzcyYzY2NmI4
Y2M4MmFhODcxMWEwMjE1YyAgbGlic3ZnLWNhaXJvLTAuMS42LnRhci5negotc2hhMjU2ICBkODBj
OWQwODRlYmZiNTBlYTFlZDkxYmZiYzI0MTBkNmNlNTQyMDk3YTMyYzQzYjAwNzgxYjgzYWRjYjhj
NzdmICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnN2Zy1jYWlyby9saWJzdmctY2Fp
cm8ubWsgYi9wYWNrYWdlL2xpYnN2Zy1jYWlyby9saWJzdmctY2Fpcm8ubWsKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IGY3YTEwNWUwM2UuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9s
aWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLm1rCisrKyAvZGV2L251bGwKQEAgLTEsMTYgKzAsMCBA
QAotIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKLSMKLSMgbGlic3ZnLWNhaXJvCi0jCi0jIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwotCi1MSUJTVkdfQ0FJUk9fVkVSU0lPTiA9IDAuMS42Ci1MSUJTVkdf
Q0FJUk9fU0lURSA9IGh0dHA6Ly9jYWlyb2dyYXBoaWNzLm9yZy9zbmFwc2hvdHMKLUxJQlNWR19D
QUlST19ERVBFTkRFTkNJRVMgPSBjYWlybyBsaWJzdmcKLUxJQlNWR19DQUlST19JTlNUQUxMX1NU
QUdJTkcgPSBZRVMKLUxJQlNWR19DQUlST19MSUNFTlNFID0gTEdQTC0yLjErCi1MSUJTVkdfQ0FJ
Uk9fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKLQotTElCU1ZHX0NBSVJPX0NPTkZfT1BUUyA9IC0t
d2l0aG91dC14Ci0KLSQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKLS0gCjIuNDcuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
