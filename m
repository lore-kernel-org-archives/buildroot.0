Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F265DD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 19:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C23406CD;
	Sun,  7 Dec 2025 19:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nuYFMMVkoy_t; Sun,  7 Dec 2025 19:23:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46116406C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765135429;
	bh=GK3/V24TCmxcOm0EAxQUPJX1g4DnAMLWFmMWZPzFW5E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z2LPwtpQ06GAEaxcQ1d/Qe+X5TOtIdcvgXB6T4u8T9fz1unDm1kuH/Ydx+6fpSOBL
	 dDnpDI2lAW11H2E4TCY5pQjeJUrsVHlxcbr9yXhIu/rF0wTtdzWLfZsISWRFDofYTJ
	 XqJlivCm2+3f+tP2axNproreKqAOggt8C+4PK/ojMMvm5kOHFAUFmd76jvZsQlIcQw
	 7Pf1ZRysJUBSMLr/MWF3xNnHg+EvR1XELCOXj3NNTV5kS1HFb3i9zsmiUcQeTt35fT
	 hMTEH8Ur35Z0HbeMAJE4q29jlJdJBZ4ObFq9+GSLxFAQt2AlVdK+laENeof9lpwNwJ
	 mB2y4X3sZbPAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46116406C0;
	Sun,  7 Dec 2025 19:23:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94E862CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 19:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8677181D19
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 19:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdWp3OozPZyj for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 19:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1294481CAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1294481CAD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1294481CAD
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 19:23:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46E12A4C08F8
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:23:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50182)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSKMB-000000002rc-2T0f
 for buildroot@buildroot.org; Sun, 07 Dec 2025 19:23:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 20:23:42 +0100
Message-ID: <20251207192343.1089336-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765135424;
 bh=XXwHIZEjncu4G1nyisZrW6OWECjb1X/aJTWgW6k8sq4=;
 h=From:To:Subject:Date:From;
 b=uga5fCrrwFWs1IRSWLrEe181oh6ndzUshA1tC3NAOtAkQsBeHzGf+U+RAWfXW80FN
 V8o3qRTDEyOoqORTjR/vmyVpNSx56Dbo1Or38eN0u79W1VBDoonQjNHlqKYd/XvctU
 eublz+9qyuL9DCA9RF8VkmpKW/T2o+bxgZupQB28zMUHrxxwhx8N82ToMbT3uRnhS3
 I/ICn7hyeWUYygMxWxMAG6YuAFaqnzhkmZFZBdGxtFD/NUyUDz+RHnTvy+PQ+P/N+l
 7T2sc6ogGQb8h7wMQj4ACSeCxwrBALd3UzHuzBYSGI2mBdYL78dS+cCotOgn0gJPNu
 4iKdoEhQPIIbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=uga5fCrr
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: Fix build for
 Linux 6.18
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

QnVpbGRyb290IGNvbW1pdCBhMDZkNzk4NjJhNjBkM2M4ZDVkZGQ2YTlhYjEyYjVjY2RkOTE5ODRj
IGJ1bXBlZCB0aGUKbGludXgga2VybmVsIHRvIHZlcnNpb24gNi4xOCB3aGljaCBicm9rZSB0aGUg
YnVpbGQgb2YgY3J5cHRvZGV2LWxpbnV4LgoKQWRkZWQgdXBzdHJlYW0gcGF0Y2ggdG8gZml4IHRo
ZSBwcm9ibGVtLgoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4K
LS0tCiAuLi4vMDAwMS1GaXgtYnVpbGQtZm9yLUxpbnV4LTYuMTgtcmMxLnBhdGNoICAgfCA1NSAr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvY3J5cHRvZGV2LWxpbnV4LzAwMDEtRml4LWJ1aWxkLWZv
ci1MaW51eC02LjE4LXJjMS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvY3J5cHRvZGV2LWxp
bnV4LzAwMDEtRml4LWJ1aWxkLWZvci1MaW51eC02LjE4LXJjMS5wYXRjaCBiL3BhY2thZ2UvY3J5
cHRvZGV2LWxpbnV4LzAwMDEtRml4LWJ1aWxkLWZvci1MaW51eC02LjE4LXJjMS5wYXRjaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mZWY1YWY0MDk5Ci0tLSAvZGV2L251
bGwKKysrIGIvcGFja2FnZS9jcnlwdG9kZXYtbGludXgvMDAwMS1GaXgtYnVpbGQtZm9yLUxpbnV4
LTYuMTgtcmMxLnBhdGNoCkBAIC0wLDAgKzEsNTUgQEAKK0Zyb20gMDg2NDRkYjAyZDQzNDc4Zjgw
Mjc1NTkwMzIxMmY1ZWU1MDZhZjczYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206ID0/
VVRGLTg/cT9Kb2FuPTIwQnJ1Z3VlcmE9MjBNaWM9QzM9QjM/PSA8am9hbmJydWd1ZXJhbUBnbWFp
bC5jb20+CitEYXRlOiBTYXQsIDYgU2VwIDIwMjUgMjA6MzY6MzggKzAwMDAKK1N1YmplY3Q6IFtQ
QVRDSF0gRml4IGJ1aWxkIGZvciBMaW51eCA2LjE4LXJjMQorTUlNRS1WZXJzaW9uOiAxLjAKK0Nv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAorCitJdCdzIG5vIGxvbmdlciByZXF1aXJlZCB0byB1c2UgbnRoX3BhZ2Uo
KSB3aGVuIGl0ZXJhdGluZyBwYWdlcyB3aXRoaW4gYQorc2luZ2xlIHNjYXR0ZXJsaXN0IGVudHJ5
LgorCitOb3RlIEkgYmVsaWV2ZSB0aGlzIGNvZGUgcGF0aCBpbiBgc2dfYWR2YW5jZWAgaXMgY3Vy
cmVudGx5IHVucmVhY2hhYmxlOgorSXQgaXMgb25seSBjYWxsZWQgZnJvbSBgZ2V0X3VzZXJidWZf
c3J0cGAsIHBhc3NpbmcgaW4gYSBzY2F0dGVybGlzdAorY29waWVkIGZyb20gb25lIGNyZWF0ZWQg
YnkgYF9fZ2V0X3VzZXJidWZgLCB3aGljaCBvbmx5IGdlbmVyYXRlcworZW50cmllcyBzdWNoIHRo
YXQgYHNnLT5vZmZzZXQgKyBzZy0+bGVuZ3RoIDw9IFBBR0VfU0laRWAuCitPbiB0aGUgb3RoZXIg
aGFuZCwgdGhpcyBjb2RlIHBhdGggaW4gYHNnX2FkdmFuY2VgIHJlcXVpcmVzIHRoYXQKK2BzZy0+
b2Zmc2V0ICsgc2ctPmxlbmd0aCA+IHNnLT5vZmZzZXQgKyBjb25zdW1lZCA+PSBQQUdFX1NJWkVg
LgorCitTZWUgYWxzbzogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9ZjhmMDNlYjVmMGY5MWZkZGM5YmI4
NTYzYzdlODJiZDdkM2JhMWRkMAorICAgICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWNlMDA4
OTdiOTRiYzVjNjJmYWI5NjI2MjVlZmNmMWFiODI0ZDM2ODgKKworU2lnbmVkLW9mZi1ieTogSm9h
biBCcnVndWVyYSBNaWPDsyA8am9hbmJydWd1ZXJhbUBnbWFpbC5jb20+CisKK1Vwc3RyZWFtOiBo
dHRwczovL2dpdGh1Yi5jb20vY3J5cHRvZGV2LWxpbnV4L2NyeXB0b2Rldi1saW51eC9jb21taXQv
MDg2NDRkYjAyZDQzNDc4ZjgwMjc1NTkwMzIxMmY1ZWU1MDZhZjczYgorCitTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgorLS0tCisgdXRpbC5jIHwgNSArKysrKwor
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL3V0aWwuYyBi
L3V0aWwuYworaW5kZXggOWViYTQ4MzYuLmQ0MjY3ODE2IDEwMDY0NAorLS0tIGEvdXRpbC5jCisr
KysgYi91dGlsLmMKK0BAIC0yMSw2ICsyMSw3IEBACisgCisgI2luY2x1ZGUgPGNyeXB0by9zY2F0
dGVyd2Fsay5oPgorICNpbmNsdWRlIDxsaW51eC9zY2F0dGVybGlzdC5oPgorKyNpbmNsdWRlIDxs
aW51eC92ZXJzaW9uLmg+CisgI2luY2x1ZGUgInV0aWwuaCIKKyAKKyAvKiBUaGVzZSB3ZXJlIHRh
a2VuIGZyb20gTWF4aW0gTGV2aXRza3kncyBwYXRjaCB0byBsa21sLgorQEAgLTQ0LDggKzQ1LDEy
IEBAIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dfYWR2YW5jZShzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNn
LCBpbnQgY29uc3VtZWQpCisgCXNnLT5sZW5ndGggLT0gY29uc3VtZWQ7CisgCisgCWlmIChzZy0+
b2Zmc2V0ID49IFBBR0VfU0laRSkgeworKyNpZiAoTElOVVhfVkVSU0lPTl9DT0RFID49IEtFUk5F
TF9WRVJTSU9OKDYsIDE4LCAwKSkKKysJCXN0cnVjdCBwYWdlICpwYWdlID0gc2dfcGFnZShzZykg
KyAoc2ctPm9mZnNldCAvIFBBR0VfU0laRSk7CisrI2Vsc2UKKyAJCXN0cnVjdCBwYWdlICpwYWdl
ID0KKyAJCQludGhfcGFnZShzZ19wYWdlKHNnKSwgc2ctPm9mZnNldCAvIFBBR0VfU0laRSk7Cisr
I2VuZGlmCisgCQlzZ19zZXRfcGFnZShzZywgcGFnZSwgc2ctPmxlbmd0aCwgc2ctPm9mZnNldCAl
IFBBR0VfU0laRSk7CisgCX0KKyAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
