Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772A5CAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 12:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 392C260AB7;
	Sat,  4 Oct 2025 12:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEb1yEnMCPzN; Sat,  4 Oct 2025 12:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CD3E60ADB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CD3E60ADB;
	Sat,  4 Oct 2025 12:18:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB00F909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CCC460ADB
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAUZsABXR0m3 for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 12:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8BCD960AB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BCD960AB7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BCD960AB7
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:18:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AEF4BA4C5BF4
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 14:18:18 +0200 (CEST)
Received: from [192.168.1.144] (port=45236 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51DO-000000002Ti-1DCW
 for buildroot@buildroot.org; Sat, 04 Oct 2025 12:18:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 14:18:16 +0200
Message-ID: <20251004121818.1973061-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759580298;
 bh=ibz2tXuBWxA35lTEXdj7KPGKI3oIeQor9OAJohnNUas=;
 h=From:To:Subject:Date:From;
 b=Ll2/90gLa01rNZWbYFNMEMm7ZnlFWXnQCY3KpZQiGy4mecT1fmpudCuvK51+uOuIw
 Sz4POJ2jLl3Iifjya+XoDrNzh+PRXhcxTYdh4E/tqEtrci3HfwROqwkskJQGB9iRmw
 Py61C5VNn+7U9XutTf/212CW6rW7z6noVMoGAMwBFSVU/Gg6fstaTgqjhqPo1Zi6UL
 4C86ok+A24d/6WfjtAQmAwWnph/3rUqnqP/eXZMbVOHF2JtMdvSCrsz3GUG92tY5HP
 9dTmk+IwJsbGFLDgCPjRLAoyVDn0mNFgRODoGCd/ZOshO6sdPzkQ8ax7rz+23Ui24X
 6pRBwa2cno0rQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Ll2/90gL
Subject: [Buildroot] [PATCH v2 1/1] package/libfreeglut: bump version to
 3.6.0
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

UmVtb3ZlZCBwYXRjaCAwMDAxIHdoaWNoIGlzIGluY2x1ZGVkIGluIHRoaXMgcmVsZWFzZSwgcmVu
dW1iZXJlZApyZW1haW5pbmcgcGF0Y2guCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVy
bmRAa3VobHMubmV0PgotLS0KdjI6IHJlLWFkZGVkIGFuZCByZW51bWJlcmVkIHJlbWFpbmluZyBw
YXRjaAoKIC4uLi1tZW1vcnktbGVhay10aGF0LWhhcHBlbnMtdXBvbi1lcnJvci5wYXRjaCB8IDU0
IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLm9ybURlc3Ryb3lDb250ZXh0LXByb3RvdHlwZS1mb3It
QzIzLnBhdGNofSB8ICAwCiBwYWNrYWdlL2xpYmZyZWVnbHV0L2xpYmZyZWVnbHV0Lmhhc2ggICAg
ICAgICAgfCAgMiArLQogcGFja2FnZS9saWJmcmVlZ2x1dC9saWJmcmVlZ2x1dC5tayAgICAgICAg
ICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlv
bnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmZyZWVnbHV0LzAwMDEtUGx1Zy1t
ZW1vcnktbGVhay10aGF0LWhhcHBlbnMtdXBvbi1lcnJvci5wYXRjaAogcmVuYW1lIHBhY2thZ2Uv
bGliZnJlZWdsdXQvezAwMDItZWdsLWZpeC1mZ1BsYXRmb3JtRGVzdHJveUNvbnRleHQtcHJvdG90
eXBlLWZvci1DMjMucGF0Y2ggPT4gMDAwMS1lZ2wtZml4LWZnUGxhdGZvcm1EZXN0cm95Q29udGV4
dC1wcm90b3R5cGUtZm9yLUMyMy5wYXRjaH0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aWJmcmVlZ2x1dC8wMDAxLVBsdWctbWVtb3J5LWxlYWstdGhhdC1oYXBwZW5zLXVwb24tZXJyb3Iu
cGF0Y2ggYi9wYWNrYWdlL2xpYmZyZWVnbHV0LzAwMDEtUGx1Zy1tZW1vcnktbGVhay10aGF0LWhh
cHBlbnMtdXBvbi1lcnJvci5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZDA5
ZTliZWZiMy4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL2xpYmZyZWVnbHV0LzAwMDEtUGx1Zy1t
ZW1vcnktbGVhay10aGF0LWhhcHBlbnMtdXBvbi1lcnJvci5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDU0ICswLDAgQEAKLUZyb20gOWFkMzIwYzFhZDFhMjU1NTg5OThkZGZlNDc2NzQ1MTE1Njdm
ZWM1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFNlYmFzdGlhbiBSYXNtdXNzZW4g
PHNlYnJhc0BnbWFpbC5jb20+Ci1EYXRlOiBNb24sIDEyIEZlYiAyMDI0IDE0OjQ2OjIyICswODAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIFBsdWcgbWVtb3J5IGxlYWsgdGhhdCBoYXBwZW5zIHVwb24gZXJy
b3IuCi0KLUlmIGZnU3RydWN0dXJlLkN1cnJlbnRNZW51IGlzIHNldCB3aGVuIGdsdXRBZGRNZW51
RW50cnkoKSBvcgotZ2x1dEFkZFN1Yk1lbnUoKSBpcyBjYWxsZWQgdGhlIGFsbG9jYXRlZCBtZW51
RW50cnkgdmFyaWFibGUgd2lsbAotbGVhay4gVGhpcyBjb21taXQgcG9zdHBvbmVzIGFsbG9jYXRp
bmcgbWVudUVudHJ5IHVudGlsIGFmdGVyIHRoZQotZXJyb3IgY2hlY2tzLCB0aGVyZWJ5IHBsdWdn
aW5nIHRoZSBtZW1vcnkgbGVhay4KLQotVGhpcyBmaXhlcyBDVkUtMjAyNC0yNDI1OCBhbmQgQ1ZF
LTIwMjQtMjQyNTkuCi1VcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2ZyZWVnbHV0L2ZyZWVn
bHV0L2NvbW1pdC85YWQzMjBjMWFkMWEyNTU1ODk5OGRkZmU0NzY3NDUxMTU2N2ZlYzU3Ci1TaWdu
ZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0t
LS0KLSBzcmMvZmdfbWVudS5jIHwgNCArKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9mZ19tZW51LmMgYi9zcmMv
ZmdfbWVudS5jCi1pbmRleCA1MzExMmRjMi4uMGRhODg5MDEgMTAwNjQ0Ci0tLS0gYS9zcmMvZmdf
bWVudS5jCi0rKysgYi9zcmMvZmdfbWVudS5jCi1AQCAtODY0LDEyICs4NjQsMTIgQEAgdm9pZCBG
R0FQSUVOVFJZIGdsdXRBZGRNZW51RW50cnkoIGNvbnN0IGNoYXIqIGxhYmVsLCBpbnQgdmFsdWUg
KQotIHsKLSAgICAgU0ZHX01lbnVFbnRyeSogbWVudUVudHJ5OwotICAgICBGUkVFR0xVVF9FWElU
X0lGX05PVF9JTklUSUFMSVNFRCAoICJnbHV0QWRkTWVudUVudHJ5IiApOwotLSAgICBtZW51RW50
cnkgPSAoU0ZHX01lbnVFbnRyeSAqKWNhbGxvYyggc2l6ZW9mKFNGR19NZW51RW50cnkpLCAxICk7
Ci0gCi0gICAgIGZyZWVnbHV0X3JldHVybl9pZl9mYWlsKCBmZ1N0cnVjdHVyZS5DdXJyZW50TWVu
dSApOwotICAgICBpZiAoZmdTdGF0ZS5BY3RpdmVNZW51cykKLSAgICAgICAgIGZnRXJyb3IoIk1l
bnUgbWFuaXB1bGF0aW9uIG5vdCBhbGxvd2VkIHdoaWxlIG1lbnVzIGluIHVzZS4iKTsKLSAKLSsg
ICAgbWVudUVudHJ5ID0gKFNGR19NZW51RW50cnkgKiljYWxsb2MoIHNpemVvZihTRkdfTWVudUVu
dHJ5KSwgMSApOwotICAgICBtZW51RW50cnktPlRleHQgPSBzdHJkdXAoIGxhYmVsICk7Ci0gICAg
IG1lbnVFbnRyeS0+SUQgICA9IHZhbHVlOwotIAotQEAgLTg4OCw3ICs4ODgsNiBAQCB2b2lkIEZH
QVBJRU5UUlkgZ2x1dEFkZFN1Yk1lbnUoIGNvbnN0IGNoYXIgKmxhYmVsLCBpbnQgc3ViTWVudUlE
ICkKLSAgICAgU0ZHX01lbnUgKnN1Yk1lbnU7Ci0gCi0gICAgIEZSRUVHTFVUX0VYSVRfSUZfTk9U
X0lOSVRJQUxJU0VEICggImdsdXRBZGRTdWJNZW51IiApOwotLSAgICBtZW51RW50cnkgPSAoIFNG
R19NZW51RW50cnkgKiApY2FsbG9jKCBzaXplb2YoIFNGR19NZW51RW50cnkgKSwgMSApOwotICAg
ICBzdWJNZW51ID0gZmdNZW51QnlJRCggc3ViTWVudUlEICk7Ci0gCi0gICAgIGZyZWVnbHV0X3Jl
dHVybl9pZl9mYWlsKCBmZ1N0cnVjdHVyZS5DdXJyZW50TWVudSApOwotQEAgLTg5Nyw2ICs4OTYs
NyBAQCB2b2lkIEZHQVBJRU5UUlkgZ2x1dEFkZFN1Yk1lbnUoIGNvbnN0IGNoYXIgKmxhYmVsLCBp
bnQgc3ViTWVudUlEICkKLSAKLSAgICAgZnJlZWdsdXRfcmV0dXJuX2lmX2ZhaWwoIHN1Yk1lbnUg
KTsKLSAKLSsgICAgbWVudUVudHJ5ID0gKCBTRkdfTWVudUVudHJ5ICogKWNhbGxvYyggc2l6ZW9m
KCBTRkdfTWVudUVudHJ5ICksIDEgKTsKLSAgICAgbWVudUVudHJ5LT5UZXh0ICAgID0gc3RyZHVw
KCBsYWJlbCApOwotICAgICBtZW51RW50cnktPlN1Yk1lbnUgPSBzdWJNZW51OwotICAgICBtZW51
RW50cnktPklEICAgICAgPSAtMTsKLS0tIAotMi40OC4xCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGliZnJlZWdsdXQvMDAwMi1lZ2wtZml4LWZnUGxhdGZvcm1EZXN0cm95Q29udGV4dC1wcm90b3R5
cGUtZm9yLUMyMy5wYXRjaCBiL3BhY2thZ2UvbGliZnJlZWdsdXQvMDAwMS1lZ2wtZml4LWZnUGxh
dGZvcm1EZXN0cm95Q29udGV4dC1wcm90b3R5cGUtZm9yLUMyMy5wYXRjaApzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gcGFja2FnZS9saWJmcmVlZ2x1dC8wMDAyLWVnbC1maXgtZmdQ
bGF0Zm9ybURlc3Ryb3lDb250ZXh0LXByb3RvdHlwZS1mb3ItQzIzLnBhdGNoCnJlbmFtZSB0byBw
YWNrYWdlL2xpYmZyZWVnbHV0LzAwMDEtZWdsLWZpeC1mZ1BsYXRmb3JtRGVzdHJveUNvbnRleHQt
cHJvdG90eXBlLWZvci1DMjMucGF0Y2gKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZnJlZWdsdXQv
bGliZnJlZWdsdXQuaGFzaCBiL3BhY2thZ2UvbGliZnJlZWdsdXQvbGliZnJlZWdsdXQuaGFzaApp
bmRleCAyNDlhNzgwZjA0Li4yMzNmYTU1NDU3IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYmZyZWVn
bHV0L2xpYmZyZWVnbHV0Lmhhc2gKKysrIGIvcGFja2FnZS9saWJmcmVlZ2x1dC9saWJmcmVlZ2x1
dC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDNjMGJj
YjkxNWQ5YjE4MGE5N2VkYWViZDAxMWI3YTFkZTU0NTgzYTgzODY0NGRjZDQyYmIwZWEwYzZmM2Vh
ZWMgIGZyZWVnbHV0LTMuNC4wLnRhci5negorc2hhMjU2ICA5YzNkNGQ2NTE2ZmJmYTAyODBlZGM5
M2M3NzY5OGZiNzMwM2U0NDNjMWFhYWYzN2QyNjllMzI4OGE2YzNlYTUyICBmcmVlZ2x1dC0zLjYu
MC50YXIuZ3oKIHNoYTI1NiAgYjY1OTNkNWVjNGMxMTNhMjc0YWJiODViMTBlODYxNTg5NWNiMGRk
Yjg5Zjc5MTJhZjVmZTVhYThkZjM4YTI3NSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aWJmcmVlZ2x1dC9saWJmcmVlZ2x1dC5tayBiL3BhY2thZ2UvbGliZnJlZWdsdXQvbGliZnJlZWds
dXQubWsKaW5kZXggMDkzMDlhZWNlYi4uYmNjYThiNGFiZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9s
aWJmcmVlZ2x1dC9saWJmcmVlZ2x1dC5taworKysgYi9wYWNrYWdlL2xpYmZyZWVnbHV0L2xpYmZy
ZWVnbHV0Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAot
TElCRlJFRUdMVVRfVkVSU0lPTiA9IDMuNC4wCitMSUJGUkVFR0xVVF9WRVJTSU9OID0gMy42LjAK
IExJQkZSRUVHTFVUX1NPVVJDRSA9IGZyZWVnbHV0LSQoTElCRlJFRUdMVVRfVkVSU0lPTikudGFy
Lmd6CiBMSUJGUkVFR0xVVF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL0ZyZWVHTFVUUHJvamVj
dC9mcmVlZ2x1dC9yZWxlYXNlcy9kb3dubG9hZC92JChMSUJGUkVFR0xVVF9WRVJTSU9OKQogTElC
RlJFRUdMVVRfTElDRU5TRSA9IE1JVAotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
