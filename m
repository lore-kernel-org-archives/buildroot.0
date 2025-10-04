Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450F2CAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 12:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172F160A7B;
	Sat,  4 Oct 2025 12:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjKs6Fp2I-d8; Sat,  4 Oct 2025 12:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3472460A86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3472460A86;
	Sat,  4 Oct 2025 12:28:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 001D0118
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAD4040459
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H13F5E3E7y1P for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 12:28:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D71034004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D71034004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D71034004D
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:28:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F12FCA4C5B4C
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 14:28:04 +0200 (CEST)
Received: from [192.168.1.144] (port=37610 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51Mq-000000004AX-2XXn
 for buildroot@buildroot.org; Sat, 04 Oct 2025 12:28:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 14:28:03 +0200
Message-ID: <20251004122804.2164771-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759580885;
 bh=wCoOytYkPaf2jhRy+Uu5NfRlgqryQ5/4tC41XyxWE6w=;
 h=From:To:Subject:Date:From;
 b=xaUkrIrAJ4XODQpXL9fcHrCWwAezQcFTriPR3S62op1gkPWY/mhzyz+/xBtTHTFoL
 hmMnlJ+pI4TwhNtsVTrNIdeAuXaYyBxg9dI4eFH4ogSr9hSk8Ov/5+MV5mOsxqMZLn
 GepuyyZm99Kxw8/ZRuULYQX9c7lhI1xJtAsdAHVzynbuFgt8u98vHq8kx8QyhfTES+
 W5xu/lqSKknoyP2uNcNZlluOzbJzpQ05NfdwGe1GHAjtkO7Ubv8DocnMx9G7p+7WE2
 j7B/fp2naaYrYM39MWOcODFiwkQHc25hRkiQ4M0Mybo0PNyC3EAZD5CMlPcTDYN0nV
 d9H8wUq1YKvVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=xaUkrIrA
Subject: [Buildroot] [PATCH 1/1] package/libgsm: bump version to 1.0.23
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

UmVtb3ZlZCBwYXRjaCB3aGljaCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCkFkZGVkIHNo
YTI1NiBoYXNoIHByb3ZpZGVkIGJ5IHVwc3RyZWFtLgoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3Vo
bHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi4vMDAwMi1GaXgtc2lnbmFsLWhhbmRsZXItcHJv
dG90eXBlLnBhdGNoICAgfCA2MSAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL2xpYmdzbS9s
aWJnc20uaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgMyArLQogcGFja2FnZS9saWJnc20vbGli
Z3NtLm1rICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2xpYmdzbS8wMDAyLUZpeC1zaWduYWwtaGFuZGxlci1wcm90b3R5cGUucGF0Y2gKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYmdzbS8wMDAyLUZpeC1zaWduYWwtaGFuZGxlci1wcm90b3R5cGUucGF0
Y2ggYi9wYWNrYWdlL2xpYmdzbS8wMDAyLUZpeC1zaWduYWwtaGFuZGxlci1wcm90b3R5cGUucGF0
Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGMyOGNmNTg0YTEuLjAwMDAwMDAwMDAK
LS0tIGEvcGFja2FnZS9saWJnc20vMDAwMi1GaXgtc2lnbmFsLWhhbmRsZXItcHJvdG90eXBlLnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsNjEgKzAsMCBAQAotRnJvbSA3ZmZhYjBhNTAyOGYwYmZj
Yjg2NGMyMzg3ZjQxYjhkNGViMzNmYjhlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTog
VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLURhdGU6IEZy
aSwgMjkgQXVnIDIwMjUgMTc6Mjc6NTUgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4IHNpZ25h
bCBoYW5kbGVyIHByb3RvdHlwZQotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAot
Ci1SZWNlbnQgdmVyc2lvbnMgb2YgZ2NjLCBzdGFydGluZyBmcm9tIGdjYyAxNS54LCBhcmUgbW9y
ZSBwaWNreSBhYm91dAotZnVuY3Rpb24gcHJvdG90eXBlcywgYW5kIHRoYXQgY2F1c2UgdGhlIGZv
bGxvd2luZyBpc3N1ZToKLQotdXNyL2luY2x1ZGUvc2lnbmFsLmg6OTM6MjM6IG5vdGU6IGV4cGVj
dGVkIOKAmF9fc2lnaGFuZGxlcl904oCZIHtha2Eg4oCYdm9pZCAoKikoaW50KeKAmX0gYnV0IGFy
Z3VtZW50IGlzIG9mIHR5cGUg4oCYdm9pZCAoKikodm9pZCnigJkKLQotdWx0aW1hdGVseSBjYXVz
aW5nIGEgYnVpbGQgZmFpbHVyZS4KLQotVGhpcyBwYXRjaCBmaXhlcyB0aGF0IGJ5IGVuc3VyaW5n
IHRoZSBzaWduYWwgaGFuZGxlciBoYXMgdGhlIHJpZ2h0Ci1wcm90b3R5cGUuIFRoZSBvbmludHIo
KSBmdW5jdGlvbiBpcyBub3Qgb25seSB1c2VkIGFzIGEgc2lnbmFsIGhhbmRsZXIsCi1idXQgYWxz
byBvbiBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlLCBpbiB3aGljaCBjYXNlIGEgZHVtbXkgdmFs
dWUgb2YKLTAgaXMgcGFzc2VkIGFzIGFyZ3VtZW50LCBzaW5jZSBhbnl3YXkgdGhpcyB2YWx1ZSBp
c24ndCB1c2VkIGJ5Ci1vbmludHIoKS4KLQotVXBzdHJlYW06IHNlbnQgYnkgZS1tYWlsIHRvIEp1
dHRhIERlZ2VuZXIgPGp1dHRhQHBvYm94LmNvbT4KLVNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRh
enpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci0tLS0KLSBzcmMvdG9hc3QuYyB8
IDYgKysrLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKLQotZGlmZiAtLWdpdCBhL3NyYy90b2FzdC5jIGIvc3JjL3RvYXN0LmMKLWluZGV4IDA1Y2Qw
YjMuLjcwYTE0YmEgMTAwNjQ0Ci0tLS0gYS9zcmMvdG9hc3QuYwotKysrIGIvc3JjL3RvYXN0LmMK
LUBAIC0yMTEsNyArMjExLDcgQEAgc3RhdGljIGNoYXIgKiBzdWZmaXggUDIoKG5hbWUsIHN1Ziks
IGNoYXIgKm5hbWUsIGNoYXIgKiBzdWYpCi0gfQotIAotIAotLXN0YXRpYyB2b2lkIGNhdGNoX3Np
Z25hbHMgUDEoKGZ1biksIFNJR0hBTkRMRVJfVCAoKmZ1bikgKCkpCi0rc3RhdGljIHZvaWQgY2F0
Y2hfc2lnbmFscyBQMSgoZnVuKSwgU0lHSEFORExFUl9UICgqZnVuKSAoaW50KSkKLSB7Ci0gI2lm
ZGVmCVNJR0hVUAotIAlzaWduYWwoIFNJR0hVUCwgICBmdW4gKTsKLUBAIC0yMzAsNyArMjMwLDcg
QEAgc3RhdGljIHZvaWQgY2F0Y2hfc2lnbmFscyBQMSgoZnVuKSwgU0lHSEFORExFUl9UICgqZnVu
KSAoKSkKLSAjZW5kaWYKLSB9Ci0gCi0tc3RhdGljIFNJR0hBTkRMRVJfVCBvbmludHIgUDAoKQot
K3N0YXRpYyBTSUdIQU5ETEVSX1Qgb25pbnRyIFAxKChzaWdubyksIGludCBzaWdubykKLSB7Ci0g
CWNoYXIgKiB0bXAgPSBvdXRuYW1lOwotIAotQEAgLTI1Myw3ICsyNTMsNyBAQCBzdGF0aWMgY2hh
ciAqIGVtYWxsb2MgUDEoKGxlbiksIHNpemVfdCBsZW4pCi0gCWlmICghKHMgPSBtYWxsb2MobGVu
KSkpIHsKLSAJCWZwcmludGYoc3RkZXJyLCAiJXM6IGZhaWxlZCB0byBtYWxsb2MgJWQgYnl0ZXMg
LS0gYWJvcnRcbiIsCi0gCQkJcHJvZ25hbWUsIChpbnQpbGVuKTsKLS0JCW9uaW50cigpOwotKwkJ
b25pbnRyKDApOwotIAkJZXhpdCgxKTsKLSAJfQotIAlyZXR1cm4gczsKLS0tIAotMi41MC4xCi0K
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ3NtL2xpYmdzbS5oYXNoIGIvcGFja2FnZS9saWJnc20v
bGliZ3NtLmhhc2gKaW5kZXggYjNhNDcwMjE1Mi4uMzZkOTBkOTNiZCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9saWJnc20vbGliZ3NtLmhhc2gKKysrIGIvcGFja2FnZS9saWJnc20vbGliZ3NtLmhhc2gK
QEAgLTEsMyArMSw0IEBACisjIEZyb20gaHR0cHM6Ly93d3cucXV1dC5jb20vZ3NtLworc2hhMjU2
ICA4Yjc1OTFhODVhYzlhZGNlODU4ZjIwNTMwMDVlNmIyZWIyMGMyM2I4YjhhODY4ZGZmYjI5Njk2
NDVmYTMyM2MwICBnc20tMS4wLjIzLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYg
IGYwMDcyZTkxZjZiYjg1YTg3OGIyZjZkYmY0YTBiN2M4NTBjNGRlYjgwNDlkNTU0YzY1MzQwYjNi
ZjY5ZGYwYWMgIGdzbS0xLjAuMjIudGFyLmd6CiBzaGEyNTYgIDgxYzY4YTMzNzQ5MzdlZDliNWU0
OTI5YzcwOWU4MWEyYzRiMzViNWQxZjQ1MGVjZjhjNDczZTJkYWVhNDZmZjYgIENPUFlSSUdIVApk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnc20vbGliZ3NtLm1rIGIvcGFja2FnZS9saWJnc20vbGli
Z3NtLm1rCmluZGV4IDFjN2I4NjBlY2UuLjBlNWFlOWRhNGEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bGliZ3NtL2xpYmdzbS5taworKysgYi9wYWNrYWdlL2xpYmdzbS9saWJnc20ubWsKQEAgLTQsNyAr
NCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJHU01fVkVSU0lPTiA9IDEu
MC4yMgorTElCR1NNX1ZFUlNJT04gPSAxLjAuMjMKIExJQkdTTV9TT1VSQ0UgPSBnc20tJChMSUJH
U01fVkVSU0lPTikudGFyLmd6CiBMSUJHU01fU0lURSA9IGh0dHA6Ly93d3cucXV1dC5jb20vZ3Nt
CiBMSUJHU01fTElDRU5TRSA9IGdzbQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
