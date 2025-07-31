Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C95C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 17:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65E8846F7;
	Thu, 31 Jul 2025 17:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57oTMSnoCYyq; Thu, 31 Jul 2025 17:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0602E846F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0602E846F0;
	Thu, 31 Jul 2025 17:28:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0FFC168
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C207641EAE
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfF0Dz-Aq1w9 for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 17:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F58341E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F58341E19
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F58341E19
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:28:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3DEEA4C0CF4;
 Thu, 31 Jul 2025 19:28:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58430)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uhX4c-000000003OH-3ZfY;
 Thu, 31 Jul 2025 17:28:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 31 Jul 2025 19:28:10 +0200
Message-Id: <20250731172810.2935094-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753982891;
 bh=MnszmBkNdyGrpoxQOpkp0TQ3nMaq5WYgMbkXok/rK1o=;
 h=From:To:Cc:Subject:Date:From;
 b=fEO4i4b7X9iY0bSxgjoSU8xqECrjCjsc3UKjEqmhbSzXDP3nY4Gr7riji2vJpHL1a
 ytLkU7Wk0WA28NFamExd03SVH6T5p4PPTEEejTfvB5LKgyAdW2QzH3FoSNLZ8mobGf
 tTB8z0RHeGpEfJzNKBVdYv0lK0RHsTrKNiNbgnnPUaRVg/AcoVXnSj0wB8i8Iwhc6S
 BUBqOlFdOGBmTBCrd9LJN+lGRgEIAYtyUML21oK81BwFJSUVy13kvOlIPP6Qy3GT4x
 /HTd36w9rfmopqHNp/bmgqYfkrWUqaN+9hMnwVm940o9KasiJkViACoZqV3SnM3xnh
 C6WYl+TOcxQig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=fEO4i4b7
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: Fix build with glibc-2.42
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

QWRkIHVwc3RyZWFtIHBhdGNoIHRvIGZpeCBidWlsZCB3aXRoIGdsaWJjLTIuNDIuCgpTaWduZWQt
b2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIC4uLi8wMDAxLUZpeC1i
dWlsZC13aXRoLWdsaWJjLTIuNDIucGF0Y2ggICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9uZnMtdXRpbHMvMDAwMS1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjQyLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9uZnMtdXRpbHMvMDAwMS1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjQy
LnBhdGNoIGIvcGFja2FnZS9uZnMtdXRpbHMvMDAwMS1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjQy
LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjZiZjM2MjI1ODYK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25mcy11dGlscy8wMDAxLUZpeC1idWlsZC13aXRo
LWdsaWJjLTIuNDIucGF0Y2gKQEAgLTAsMCArMSw1OSBAQAorRnJvbSA5Zjk3NDA0NmMzN2I3YzI4
NzA1ZDU1NTgzMjg3NTlmZmY3MDhiMWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTog
WWFha292IFNlbGtvd2l0eiA8eXNlbGtvd2lAcmVkaGF0LmNvbT4KK0RhdGU6IEZyaSwgMjcgSnVu
IDIwMjUgMDQ6NTQ6MDggLTA1MDAKK1N1YmplY3Q6IEZpeCBidWlsZCB3aXRoIGdsaWJjLTIuNDIK
K01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworZXhwb3J0ZnMuYzogSW4gZnVu
Y3Rpb24g4oCYcmVsZWFzZV9sb2NrZmlsZeKAmToKK2V4cG9ydGZzLmM6ODM6MTc6IGVycm9yOiBp
Z25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYbG9ja2bigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1
dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV2Vycm9yPXVudXNlZC1yZXN1bHRdCisgICA4
MyB8ICAgICAgICAgICAgICAgICBsb2NrZihfbG9ja2ZkLCBGX1VMT0NLLCAwKTsKKyAgICAgIHwg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CitleHBvcnRmcy5jOiBJ
biBmdW5jdGlvbiDigJhncmFiX2xvY2tmaWxl4oCZOgorZXhwb3J0ZnMuYzo3NzoxNzogZXJyb3I6
IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhsb2NrZuKAmSBkZWNsYXJlZCB3aXRoIGF0dHJp
YnV0ZSDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XZXJyb3I9dW51c2VkLXJlc3VsdF0KKyAg
IDc3IHwgICAgICAgICAgICAgICAgIGxvY2tmKF9sb2NrZmQsIEZfTE9DSywgMCk7CisgICAgICB8
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CisKK2xvY2tmIGlzIG5v
dyBtYXJrZWQgd2l0aCBhdHRyaWJ1dGUgd2Fybl91bnVzZWRfcmVzdWx0OgorCitodHRwczovL3Nv
dXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1jb21taXRkaWZmO2g9ZjNjODJmYzFiNDEy
NjFmNTgyZjVmOWZhMTJmNzRhZjliY2JjODhmOQorCitTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBEaWNr
c29uIDxzdGV2ZWRAcmVkaGF0LmNvbT4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0LmxpbnV4LW5m
cy5vcmcvP3A9c3RldmVkL25mcy11dGlscy5naXQ7YT1jb21taXQ7aD05Zjk3NDA0NmMzN2I3YzI4
NzA1ZDU1NTgzMjg3NTlmZmY3MDhiMWNiCisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxi
ZXJuZEBrdWhscy5uZXQ+CistLS0KKyB1dGlscy9leHBvcnRmcy9leHBvcnRmcy5jIHwgMTAgKysr
KysrKystLQorIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CisKK2RpZmYgLS1naXQgYS91dGlscy9leHBvcnRmcy9leHBvcnRmcy5jIGIvdXRpbHMvZXhwb3J0
ZnMvZXhwb3J0ZnMuYworaW5kZXggYjAzYTA0N2IuLjc0OGMzOGUzIDEwMDY0NAorLS0tIGEvdXRp
bHMvZXhwb3J0ZnMvZXhwb3J0ZnMuYworKysrIGIvdXRpbHMvZXhwb3J0ZnMvZXhwb3J0ZnMuYwor
QEAgLTc0LDEzICs3NCwxOSBAQCBncmFiX2xvY2tmaWxlKHZvaWQpCisgeworIAlfbG9ja2ZkID0g
b3Blbihsb2NrZmlsZSwgT19DUkVBVHxPX1JEV1IsIDA2NjYpOworIAlpZiAoX2xvY2tmZCAhPSAt
MSkKKy0JCWxvY2tmKF9sb2NrZmQsIEZfTE9DSywgMCk7CisrCQlpZiAobG9ja2YoX2xvY2tmZCwg
Rl9MT0NLLCAwKSAhPSAwKSB7CisrCQkJeGxvZ193YXJuKCIlczogbG9ja2YoKSBmYWlsZWQ6IGVy
cm5vICVkICglcykiLAorKwkJCV9fZnVuY19fLCBlcnJubywgc3RyZXJyb3IoZXJybm8pKTsKKysJ
CX0KKyB9Cisgc3RhdGljIHZvaWQKKyByZWxlYXNlX2xvY2tmaWxlKHZvaWQpCisgeworIAlpZiAo
X2xvY2tmZCAhPSAtMSkgeworLQkJbG9ja2YoX2xvY2tmZCwgRl9VTE9DSywgMCk7CisrCQlpZiAo
bG9ja2YoX2xvY2tmZCwgRl9VTE9DSywgMCkgIT0gMCkgeworKwkJCXhsb2dfd2FybigiJXM6IGxv
Y2tmKCkgZmFpbGVkOiBlcnJubyAlZCAoJXMpIiwKKysJCQlfX2Z1bmNfXywgZXJybm8sIHN0cmVy
cm9yKGVycm5vKSk7CisrCQl9CisgCQljbG9zZShfbG9ja2ZkKTsKKyAJCV9sb2NrZmQgPSAtMTsK
KyAJfQorLS0gCitjZ2l0IHYxLjIuMworCi0tIAoyLjM5LjUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
