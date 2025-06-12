Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A90C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 17:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6DB540636;
	Thu, 12 Jun 2025 17:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCVxSnfOJNL6; Thu, 12 Jun 2025 17:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D9940872
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27D9940872;
	Thu, 12 Jun 2025 17:18:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7935183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B832F60DF8
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExBxWxUbVAUP for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 17:18:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C832D60BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C832D60BC1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C832D60BC1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:18:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c09e.dip0.t-ipconnect.de [79.214.192.158])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2781FA4C0F44;
 Thu, 12 Jun 2025 19:18:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52930)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uPlZF-000000007Pb-0cm5;
 Thu, 12 Jun 2025 17:18:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 19:18:18 +0200
Message-Id: <20250612171818.3476876-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749748701;
 bh=iZ3j79nmEcs5OkCjV2Paz584MtjOMJYbx3T8DRI8bYg=;
 h=From:To:Cc:Subject:Date:From;
 b=MLXB887vWrre0RwECHK0sirntRYCsnpu8G3qGOCcZFdXRLehCD8Bjz/Ly5TWqwQG/
 1gd8bXgr/lOYGbkK0Wg0m+Bv6ChOWzPjMZTNE2ghvxGmfICpaqPEdH17m11C3Sh+kp
 fg85WyQhHmRktcd0Nxzkm6lpvOsh8eZndgr+euBpjV5EhtT9MXCTUaqFPOaSigc8HG
 aqmo8RKh6znOuPE6KtyPvGOqNl2mdUIlXWs4Tsxkc3o/M2kFHAkoylHzZ/5xUraiD5
 d6xrFqA19hw3A93Z/DD918Y5Ap8ExzRZL8AKLaxbZQbShsHd2RHFqTdreDrerzVDP6
 k1fi2ru4R7//w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=MLXB887v
Subject: [Buildroot] [PATCH v7 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.3
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKU2lnbmVkLW9mZi1i
eTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBC
ZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KdjcgKEJlcm5kKQogIC0gcmViYXNlZCwg
a2VwdCBvbmx5IHZlcnNpb24gYnVtcAp2NgogIC0gdmVyc2lvbiBidW1wIHRvIGxhdGVzdCBtZXNh
M2QKICAtIHVwZGF0ZSAuY2hlY2twYWNrYWdlaWdub3JlCgogcGFja2FnZS9tZXNhM2QtaGVhZGVy
cy9tZXNhM2QtaGVhZGVycy5tayB8IDIgKy0KIHBhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoICAg
ICAgICAgICAgICAgfCA2ICsrKy0tLQogcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rICAgICAgICAg
ICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRl
cnMubWsgYi9wYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCmluZGV4IDQ1
YjdlOTA4NGEuLjJjZTA0NjVhMDggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMv
bWVzYTNkLWhlYWRlcnMubWsKKysrIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVh
ZGVycy5tawpAQCAtMTIsNyArMTIsNyBAQCBlbmRpZgogCiAjIE5vdCBwb3NzaWJsZSB0byBkaXJl
Y3RseSByZWZlciB0byBtZXNhM2QgdmFyaWFibGVzLCBiZWNhdXNlIG9mCiAjIGZpcnN0L3NlY29u
ZCBleHBhbnNpb24gdHJpY2tlcnkuLi4KLU1FU0EzRF9IRUFERVJTX1ZFUlNJT04gPSAyNS4xLjEK
K01FU0EzRF9IRUFERVJTX1ZFUlNJT04gPSAyNS4xLjMKIE1FU0EzRF9IRUFERVJTX1NPVVJDRSA9
IG1lc2EtJChNRVNBM0RfSEVBREVSU19WRVJTSU9OKS50YXIueHoKIE1FU0EzRF9IRUFERVJTX1NJ
VEUgPSBodHRwczovL2FyY2hpdmUubWVzYTNkLm9yZwogTUVTQTNEX0hFQURFUlNfRExfU1VCRElS
ID0gbWVzYTNkCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCBiL3BhY2th
Z2UvbWVzYTNkL21lc2EzZC5oYXNoCmluZGV4IGVlOTllOGI2MzUuLmMwMWQ2YWU3NjIgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCisrKyBiL3BhY2thZ2UvbWVzYTNkL21l
c2EzZC5oYXNoCkBAIC0xLDYgKzEsNiBAQAotIyBGcm9tIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNS1NYXkvMDAwODA0Lmh0bWwKLXNoYTI1
NiAgY2Y5NDJhMThiN2I5ZTliODg1MjRkY2JmMGIzMWZlZDNjZGUxOGU2ZDUyYjMzNzViMGFiNjU4
N2ExNDQxNWJjZSAgbWVzYS0yNS4xLjEudGFyLnh6Ci1zaGE1MTIgIDgwMDBmZWM2MWRhM2I3YzAz
NTViNzQ0NThjNTJmOGZhZWI1NjIzOThhMTg4MmQ2OGNkMzFhMjUzODQ4ZWRkMzMzMzA3MjUyMWVj
NTJmOGM1YzFhNjJkOTA5YWZkNjY2NzgwM2Q0M2NiNTQwMjdkMGFmM2Q5NDRmMWFkZDI3YWFlICBt
ZXNhLTI1LjEuMS50YXIueHoKKyMgRnJvbSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9h
cmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjUtSnVuZS8wMDA4MDcuaHRtbAorc2hhMjU2ICBmZmNi
NmNhZGI1ZmQzNTZkNTYwMDhlNjMwODY0MWRmZTRiMjkyOWYzMDEzOWY2NTg1NDM2Y2E2ZTNjZGRi
YTdmICBtZXNhLTI1LjEuMy50YXIueHoKK3NoYTUxMiAgMjBiNzJhYzRlMzllNTU5ZTM2YmUwN2Yw
MDM3MDdjZjVlMjVjNWViYWMyMjc0NmQ3MTQzOGVkZWNiOWQ5MTFmNTM0MTM3M2IxNjMyZmYwOGMw
MGI1N2FjMTVmYzg4MGNlNWEyMDNhYjkxNjVlNWU3MTA1NzgxNmJlMzEzNDRmZDcgIG1lc2EtMjUu
MS4zLnRhci54ejIKICMgTGljZW5zZQogc2hhMjU2ICAwZDFhMDQ3MmVjYzgxODMwZTc1YzIwZDU5
YjBlYTAyODQxZTNkYjIxMjU1ZTBlYmFkOTdhYjY4MmM1NGQ2NjE1ICBkb2NzL2xpY2Vuc2UucnN0
CiBzaGEyNTYgIDMyM2M1ODdkMGNjZjEwZTM3NmY4YmY5YTdmMzFmYjRjYTYwNzgxMDUxOTRiNDJl
MGIxZTBlZTJiYzliZGU3MWYgIGxpY2Vuc2VzL01JVApkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNh
M2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCmluZGV4IDAwMGI5MTUwZjEu
Ljc2Nzg5ZjY0N2UgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5taworKysgYi9w
YWNrYWdlL21lc2EzZC9tZXNhM2QubWsKQEAgLTUsNyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCiAjIFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNpb24sIHBsZWFzZSBhbHNvIHVwZGF0
ZSBtZXNhM2QtaGVhZGVycwotTUVTQTNEX1ZFUlNJT04gPSAyNS4xLjEKK01FU0EzRF9WRVJTSU9O
ID0gMjUuMS4zCiBNRVNBM0RfU09VUkNFID0gbWVzYS0kKE1FU0EzRF9WRVJTSU9OKS50YXIueHoK
IE1FU0EzRF9TSVRFID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcKIE1FU0EzRF9MSUNFTlNF
ID0gTUlULCBTR0ksIEtocm9ub3MKLS0gCjIuMzkuNQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
