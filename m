Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADC2C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 09:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E83158579E;
	Fri, 28 Mar 2025 09:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITRsAKn3Ri_B; Fri, 28 Mar 2025 09:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E605D8562D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E605D8562D;
	Fri, 28 Mar 2025 09:51:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0408019A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 09:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87364EFF1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 09:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_IxiOdcGlk3 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 09:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.51.139;
 helo=mail-0301.mail-europe.com; envelope-from=stephane.railhet@protonmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EEEBF4EFE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEEBF4EFE3
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEEBF4EFE3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 09:51:20 +0000 (UTC)
Date: Fri, 28 Mar 2025 09:51:05 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <L9QOtnlCmeGwiS2DoexbZsK53YSYAekc_YY_xVWZ1Pp2M3ftPxK54dpxIllyMqv3lcfjd9HxKMH3IHkWx23am2PNvUe5OxEWGW_2UctGYAw=@protonmail.com>
Feedback-ID: 5314644:user:proton
X-Pm-Message-ID: 693537fb1de3478f1bd50d3789d8b8c979beb73c
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1743155473; x=1743414673;
 bh=p6K1AZYUxqiev8oTXuGsQ1nUcsmQvdGDTlordHobsPY=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=iNgUV5N6xdmhHGivxfqf6Qop2Br6/7wz591/GbPDkAJnyxONVBzUzA52rYG4QiZIo
 8XL82YCQHXVdEVCxJaEPEPe9J8IRuKdTkmObVMXCuyx4itt4eCp1IlU7PdFX/POdho
 +9xczCpL/5W4cPWHmuuY+sM5hD84I1O9rCClnhD9dzQUHY6BwIVZdnmo4QKVhI2voM
 phrlz1+JPep8rZIkQ3uVQ3fUAqB+jf8DPvmva6N1LTaxZJ0lkZ9io6O8NjNjPOqdyO
 iufvTEVslBUfsaiRshjaYlxYRjUl6TqMEIh6g762lSxE5ej8R97oQZu62iL8xZiAJN
 9VTe/PzeSuZUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=iNgUV5N6
Subject: [Buildroot] [PATCH] package/systemd-netlogd: new package
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
From: =?utf-8?q?St=C3=A9phane_Railhet_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?St=C3=A9phane_Railhet?= <stephane.railhet@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU3TDqXBoYW5lIFJhaWxoZXQgPHN0ZXBoYW5lLnJhaWxoZXRAcHJvdG9u
bWFpbC5jb20+LS0tCsKgcGFja2FnZS9Db25maWcuaW4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfCDCoDEgKwrCoC4uLi8wMDAxLWRpc2FibGUtZG9jLWJ1aWxkLnBh
dGNoIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCDCoDkgKysrKysrKysKwqBwYWNrYWdlL3N5c3RlbWQt
bmV0bG9nZC9Db25maWcuaW4gwqAgwqAgwqAgwqAgwqAgwqAgfCDCoDkgKysrKysrKysKwqBwYWNr
YWdlL3N5c3RlbWQtbmV0bG9nZC9zeXN0ZW1kLW5ldGxvZ2QuaGFzaCDCoHwgwqA0ICsrKysKwqBw
YWNrYWdlL3N5c3RlbWQtbmV0bG9nZC9zeXN0ZW1kLW5ldGxvZ2QubWsgwqAgwqB8IDIxICsrKysr
KysrKysrKysrKysrKysKwqA1IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKwqBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zeXN0ZW1kLW5ldGxvZ2QvMDAwMS1kaXNhYmxlLWRvYy1i
dWlsZC5wYXRjaArCoGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3N5c3RlbWQtbmV0bG9nZC9D
b25maWcuaW4KwqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zeXN0ZW1kLW5ldGxvZ2Qvc3lz
dGVtZC1uZXRsb2dkLmhhc2gKwqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zeXN0ZW1kLW5l
dGxvZ2Qvc3lzdGVtZC1uZXRsb2dkLm1rCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4g
Yi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA0YTgxYTYyZWM0Li4xODI5YjQyNzIzIDEwMDY0NAot
LS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMjkwMCw2
ICsyOTAwLDcgQEAgbWVudSAiU3lzdGVtIHRvb2xzIgrCoCBzb3VyY2UgInBhY2thZ2Uvc3lzbG9n
LW5nL0NvbmZpZy5pbiIKwqAgc291cmNlICJwYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluIgrCoCBz
b3VyY2UgInBhY2thZ2Uvc3lzdGVtZC1ib290Y2hhcnQvQ29uZmlnLmluIgorIHNvdXJjZSAicGFj
a2FnZS9zeXN0ZW1kLW5ldGxvZ2QvQ29uZmlnLmluIgrCoCBzb3VyY2UgInBhY2thZ2Uvc3lzdmlu
aXQvQ29uZmlnLmluIgrCoCBzb3VyY2UgInBhY2thZ2UvdGFyL0NvbmZpZy5pbiIKwqAgc291cmNl
ICJwYWNrYWdlL3RlYWxkZWVyL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVt
ZC1uZXRsb2dkLzAwMDEtZGlzYWJsZS1kb2MtYnVpbGQucGF0Y2ggYi9wYWNrYWdlL3N5c3RlbWQt
bmV0bG9nZC8wMDAxLWRpc2FibGUtZG9jLWJ1aWxkLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjdmYTliYTEzOWUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdl
L3N5c3RlbWQtbmV0bG9nZC8wMDAxLWRpc2FibGUtZG9jLWJ1aWxkLnBhdGNoCkBAIC0wLDAgKzEs
OSBAQAorLS0tIGEvbWVzb24uYnVpbGQKKysrKyBiL21lc29uLmJ1aWxkCitAQCAtMTQwLDcgKzE0
MCw2IEBACisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAn
c3JjL25ldGxvZycpCisKKyBzdWJkaXIoJ3VuaXRzJykKKy1zdWJkaXIoJ2RvYycpCisKKyAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC1uZXRsb2dkL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
c3lzdGVtZC1uZXRsb2dkL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi5iYzYwMjg5MTUxCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zeXN0ZW1kLW5l
dGxvZ2QvQ29uZmlnLmluCkBAIC0wLDAgKzEsOSBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1NZU1RF
TURfTkVUTE9HRAorIGJvb2wgInN5c3RlbWQtbmV0bG9nZCIKKyBkZXBlbmRzIG9uIEJSMl9JTklU
X1NZU1RFTUQKKyBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX09QRU5TU0wKKyBoZWxwCisgwqBGb3J3
YXJkcyBtZXNzYWdlcyBmcm9tIHRoZSBqb3VybmFsIHRvIG90aGVyIGhvc3RzIG92ZXIgdGhlIG5l
dHdvcmsgdXNpbmcKKyDCoHRoZSBTeXNsb2cgUHJvdG9jb2wgKFJGQyA1NDI0KS4KKworIMKgaHR0
cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1uZXRsb2dkClwgTm8gbmV3bGluZSBhdCBl
bmQgb2YgZmlsZQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kLW5ldGxvZ2Qvc3lzdGVtZC1u
ZXRsb2dkLmhhc2ggYi9wYWNrYWdlL3N5c3RlbWQtbmV0bG9nZC9zeXN0ZW1kLW5ldGxvZ2QuaGFz
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43ZjdhOWNmYTEyCi0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9zeXN0ZW1kLW5ldGxvZ2Qvc3lzdGVtZC1uZXRsb2dkLmhh
c2gKQEAgLTAsMCArMSw0IEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2IDA0MTE0NGRi
YzMxOTZkNjU3ZmJhNDk0YTI4OGRlZTdhZmNlZjg3MTlhMGM1YzI1NzMwODZmNzdjYWJmZjk4NmEg
c3lzdGVtZC1uZXRsb2dkLXYxLjQuNC50YXIuZ3oKK3NoYTI1NiDCoGFiMTVmZDUyNmJkOGRkMThh
OWU3N2ViYzEzOTY1NmJmNGQzM2U5N2ZjNzIzOGNkMTFiZjYwZTJiOWI4NjY2YzYgwqBMSUNFTlNF
LkdQTDIKK3NoYTI1NiDCoGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRm
ZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgwqBMSUNFTlNFLkxHUEwyLjEKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3lzdGVtZC1uZXRsb2dkL3N5c3RlbWQtbmV0bG9nZC5tayBiL3BhY2thZ2Uvc3lzdGVt
ZC1uZXRsb2dkL3N5c3RlbWQtbmV0bG9nZC5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi44MDM4ZWZhMzcwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zeXN0ZW1k
LW5ldGxvZ2Qvc3lzdGVtZC1uZXRsb2dkLm1rCkBAIC0wLDAgKzEsMjEgQEAKKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCisjCisjIHN5c3RlbWQtbmV0bG9nZAorIworIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKKworU1lTVEVNRF9ORVRMT0dEX1ZFUlNJT04gPSB2MS40LjQKK1NZU1RFTURfTkVUTE9H
RF9TSVRFID0gJChjYWxsIGdpdGh1YixzeXN0ZW1kLHN5c3RlbWQtbmV0bG9nZCwkKFNZU1RFTURf
TkVUTE9HRF9WRVJTSU9OKSkKK1NZU1RFTURfTkVUTE9HRCA9IEdQTC0yLCBMR1BMLTIuMQorU1lT
VEVNRF9ORVRMT0dEX0ZJTEVTID0gTElDRU5TRS5HUEwyIExJQ0VOU0UuTEdQTDIuMQorCitTWVNU
RU1EX05FVExPR0RfREVQRU5ERU5DSUVTID0gc3lzdGVtZCBvcGVuc3NsCisKK1NZU1RFTURfTkVU
TE9HRF9DT05GX09QVFMgPSBcCisgLS1wcmVmaXg9L3Vzci9saWIvc3lzdGVtZAorCitkZWZpbmUg
U1lTVEVNRF9ORVRMT0dEX1VTRVJTCisgc3lzdGVtZC1qb3VybmFsLW5ldGxvZyAtMSBzeXN0ZW1k
LWpvdXJuYWwgLTEgKiAtIC0gLSBzeXN0ZW1kIEpvdXJuYWwgTmV0bG9nZAorZW5kZWYKKworJChl
dmFsICQobWVzb24tcGFja2FnZSkpCi0tCjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
