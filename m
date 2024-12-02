Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A07E69E81
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 19:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925BF81300;
	Mon,  2 Dec 2024 19:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ims_sFIqGaLS; Mon,  2 Dec 2024 19:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F61A8177A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F61A8177A;
	Mon,  2 Dec 2024 19:08:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2CAB1DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 19:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C205404B1
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 19:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLXi3NnPeDSZ for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 19:08:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 224B640134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 224B640134
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 224B640134
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 19:08:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c998.dip0.t-ipconnect.de [79.214.201.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D07B4A4C3D6A;
 Mon,  2 Dec 2024 20:06:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45796)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tIBkv-000000007RI-0Xof;
 Mon, 02 Dec 2024 19:06:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Dec 2024 20:06:47 +0100
Message-Id: <20241202190647.1211779-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202190647.1211779-1-bernd@kuhls.net>
References: <20241202190647.1211779-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1733166409;
 bh=jqNwotd/c3Yt9fOJDLnpT6T8xWlspiGtL/ghS34q4z8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chT0M5gh/Pv5csa7b3NDUEWGeKKTvCuS02VpQgrUAonJ0XM7n/HhWkrdIGMhYQRVZ
 TXgrMNFEAHotY4GSiO+QQwwhFfIsHLICQSouFz16jSEWNjqe6UFHHctdx6UYm6V64q
 +7IHhzdw8Dft0EaXHaA2+JjmgIoF5h3v2TsmcQrSUhZ7ufoO6ziW2hEH0rXedkEV7S
 yJgweOQrxKarvrEGKeMwyshc3Htg8qnCFtTqJ5PZA75lJ+MDvzo8uyRHJWeFrDVj1a
 +tLZ28EnYSXvQjRhNj3nJziVOgHbjSApfiEWf2HAxxKokvdfUdI3PkoebLmAeiACIj
 rw8ZkxUwHPDBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=chT0M5gh
Subject: [Buildroot] [PATCH 8/8] package/vkmark: add vkmark benchmarking tool
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKV2UgYnVpbGQgZnJv
bSB0aGUgY3VycmVudCBtYXN0ZXIgYXMgd2UgbmVlZCBmYWlybHkgdXB0byBkYXRlIGJpdHMgZm9y
CmNyb3NzIGNvbXBpbGUgc3VwcG9ydC4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1
aGxzLm5ldD4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2Fn
ZS9Db25maWcuaW4gICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW4gICB8
IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3ZrbWFy
ay92a21hcmsuaGFzaCB8ICAyICsrCiBwYWNrYWdlL3ZrbWFyay92a21hcmsubWsgICB8IDM0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvQ29uZmlnLmluCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvdmttYXJrLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3ZrbWFyay92a21hcmsubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVW
RUxPUEVSUwppbmRleCBiZmJlN2JlMGQzLi5hYzFlNTc4OWIyIDEwMDY0NAotLS0gYS9ERVZFTE9Q
RVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTEzOCw2ICsxMzgsOSBAQCBGOglwYWNrYWdlL2xpYmxv
ZzRjLWxvY2FsdGltZS8KIE46CUFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBi
b290bGluLmNvbT4KIEY6CXBhY2thZ2UvdHovCiAKK046CUFsZXggQmVubsOpZSA8YWxleC5iZW5u
ZWVAbGluYXJvLm9yZz4KK0Y6CXBhY2thZ2UvdmttYXJrLworCiBOOglBbGV4YW5kcmUgRXNzZSA8
YWxleGFuZHJlLmVzc2UuZGV2QGdtYWlsLmNvbT4KIEY6CXBhY2thZ2Uva3ZhemFhci8KIEY6CXBh
Y2thZ2UvdjRsMmxvb3BiYWNrLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNr
YWdlL0NvbmZpZy5pbgppbmRleCAzY2YzMTJlYWYwLi5jZWFkNTY0MGY4IDEwMDY0NAotLS0gYS9w
YWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMzQyLDYgKzM0Miw3
IEBAIGNvbW1lbnQgIkdyYXBoaWMgYXBwbGljYXRpb25zIgogCXNvdXJjZSAicGFja2FnZS9zd2F5
YmcvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS90ZXNzZXJhY3Qtb2NyL0NvbmZpZy5pbiIK
IAlzb3VyY2UgInBhY2thZ2UvdGluaWZpZXIvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS92
a21hcmsvQ29uZmlnLmluIgogCiBjb21tZW50ICJHcmFwaGljIGxpYnJhcmllcyIKIAlzb3VyY2Ug
InBhY2thZ2UvY2VndWkvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92a21hcmsvQ29u
ZmlnLmluIGIvcGFja2FnZS92a21hcmsvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmUwMzk3ZDljMzAKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3Zr
bWFyay9Db25maWcuaW4KQEAgLTAsMCArMSw0NyBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFS
S19GTEFWT1JfQU5ZCisJYm9vbAorCitjb25maWcgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9L
TVMKKwlib29sCisJZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX0hBU19MSUJHQk0KKyAgICAgICAg
c2VsZWN0IEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfQU5ZCisKK2NvbmZpZyBCUjJfUEFDS0FH
RV9WS01BUktfRkxBVk9SX1dBWUxBTkQKKwlib29sCisJZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdF
X1dBWUxBTkQKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9BTlkKKworY29uZmln
IEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfWDExCisJYm9vbAorCWRlZmF1bHQgeSBpZiBCUjJf
UEFDS0FHRV9YT1JHNworICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9B
TlkKKworY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFSSworCWJvb2wgInZrbWFyayIKKwlkZXBlbmRz
IG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0Nf
QVRfTEVBU1RfNF85ICMgQysrMTQKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFW
T1JfQU5ZCisJc2VsZWN0IEJSMl9QQUNLQUdFX1ZVTEtBTl9IRUFERVJTCisJc2VsZWN0IEJSMl9Q
QUNLQUdFX1ZVTEtBTl9MT0FERVIKKyAgICAgICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJT
ICMgdnVsa2FuLWxvYWRlcgorICAgICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RI
UkVBRFMgIyB2dWxrYW4tbG9hZGVyCisJc2VsZWN0IEJSMl9QQUNLQUdFX0dMTQorICAgICAgICBk
ZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBhc3NpbXAKKyAgICAgICAgZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0dDQ19BVF9MRUFTVF83ICMgYXNzaW1wCisJZGVwZW5kcyBvbiBCUjJfSU5TVEFM
TF9MSUJTVERDUFAgIyB2dWxrYW4tbG9hZGVyLCBnbG0sIGFzc2ltcCwgdmttYXJrCisJc2VsZWN0
IEJSMl9QQUNLQUdFX0FTU0lNUAorCXNlbGVjdCBCUjJfUEFDS0FHRV9XQVlMQU5EX1BST1RPQ09M
UyBpZiBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX1dBWUxBTkQKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfTElCWENCIGlmIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfWDExCisJc2VsZWN0IEJSMl9Q
QUNLQUdFX0xJQkRSTSBpZiBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0tNUworCWhlbHAKKwkg
IHZtbWFyayBpcyBhbiBWdWxrYW4gR1BVIGJlbmNobWFyay4KKworCSAgaHR0cHM6Ly9naXRodWIu
Y29tL3ZrbWFyay92a21hcmsKKworaWYgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9BTlkKKwor
Y29tbWVudCAidmttYXJrIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgZHluYW1pYyBsaWJyYXJ5
LCB0aHJlYWRzIgorY29tbWVudCAiYW5kIHNvbWUgZm9ybSBvZiBiYWNrZW5kICh3YXlsYW5kLCB4
Y2Igb3IgZHJtKSIKKwlkZXBlbmRzIG9uICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgQlIyX1NU
QVRJQ19MSUJTIHx8IFwKKwkJIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKK2VuZGlmCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3ZrbWFyay92a21hcmsuaGFzaCBiL3BhY2thZ2UvdmttYXJrL3ZrbWFy
ay5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmVlODI0MWQ3ZGUK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3ZrbWFyay92a21hcmsuaGFzaApAQCAtMCwwICsx
LDIgQEAKKyMgTG9jYWxseSBjb21wdXRlZAorc2hhMjU2ICBkMDgxNDNlODgyOGQ1YjllZDAwNWNi
NmRjZWY0ZDg4YTQ5ZGYwYWM0YzllMTM1NmFjZTczOWI0NDljMTY1ZjU0ICB2a21hcmstYWI2ZTZm
MzQwNzc3MjJkNWFlMzNmNmJkNDBiMThlZjljMGU5OWExNS50YXIuZ3oKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvdmttYXJrL3ZrbWFyay5tayBiL3BhY2thZ2UvdmttYXJrL3ZrbWFyay5tawpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41NzQ5ZWJmODc4Ci0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS92a21hcmsvdmttYXJrLm1rCkBAIC0wLDAgKzEsMzQgQEAKKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCisjCisjIHZrbWFyaworIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
KworVktNQVJLX1ZFUlNJT04gPSBhYjZlNmYzNDA3NzcyMmQ1YWUzM2Y2YmQ0MGIxOGVmOWMwZTk5
YTE1CitWS01BUktfU0lURSA9ICQoY2FsbCBnaXRodWIsdmttYXJrLHZrbWFyaywkKFZLTUFSS19W
RVJTSU9OKSkKK1ZLTUFSS19MSUNFTlNFID0gTEdQTC0yLjEKK1ZLTUFSS19MSUNFTlNFX0ZJTEVT
ID0gQ09QWUlORy1MR1BMMi4xCitWS01BUktfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIHZ1
bGthbi1oZWFkZXJzIHZ1bGthbi1sb2FkZXIgZ2xtCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfVktN
QVJLX0ZMQVZPUl9LTVMpLHkpCitWS01BUktfREVQRU5ERU5DSUVTICs9IGxpYmRybSBsaWJnYm0K
K1ZLTUFSS19DT05GX09QVFMgKz0gLURrbXM9dHJ1ZQorZWxzZQorVktNQVJLX0NPTkZfT1BUUyAr
PSAtRGttcz1mYWxzZQorZW5kaWYKKworaWZlcSAoJChCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9S
X1dBWUxBTkQpLHkpCitWS01BUktfREVQRU5ERU5DSUVTICs9IHdheWxhbmQgd2F5bGFuZC1wcm90
b2NvbHMKK1ZLTUFSS19DT05GX09QVFMgKz0gLUR3YXlsYW5kPXRydWUKK2Vsc2UKK1ZLTUFSS19D
T05GX09QVFMgKz0gLUR3YXlsYW5kPWZhbHNlCitlbmRpZgorCitpZmVxICgkKEJSMl9QQUNLQUdF
X1ZLTUFSS19GTEFWT1JfWDExKSx5KQorVktNQVJLX0RFUEVOREVOQ0lFUyArPSBsaWJ4Y2IKK1ZL
TUFSS19DT05GX09QVFMgKz0gLUR4Y2I9dHJ1ZQorZWxzZQorVktNQVJLX0NPTkZfT1BUUyArPSAt
RHhjYj1mYWxzZQorZW5kaWYKKworJChldmFsICQobWVzb24tcGFja2FnZSkpCi0tIAoyLjM5LjUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
