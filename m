Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034CBC5AD5A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 21:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E25607E6;
	Wed, 12 Aug 2026 21:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cA8hCtweqcf0; Wed, 12 Aug 2026 21:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 773D9607E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786570360;
	bh=ZI8zSCwOpfTZvViJCE/kLLz7oI2w0E9R04W/42l29Wc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IfwOwOJRoPxs32Ih+CCx2wB1j4e8PE+t8eagtg0/XT3GWxqyblYL6M6K/YqG5JdQ6
	 B3U/Pm4J0tEDmxhlBiOvCpiwD85d5Ae9ORp94Ex0prw7dy/1hXjX3FeMtEnVwhpZ/C
	 5hZGmcTZXAjGcEUmxFmCl5oWqjHW6MA1vbU8zlQTABYcVM6K2I8ewuNUBOe5Ff5tZ/
	 jj2u+e3ZxLvzbtTahXX3tsNz/LLt4+EEYZuBwG8UQ+NB9fIlxJD7yva2LlzCOf8pVX
	 89kE6X51TPO6X30vzsO5NkeBYB/fbf6VNj+2rcawIhpqGnG9nAFbadwSJ0ZeCe8wg3
	 KN3pdr10Dr99Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 773D9607E2;
	Wed, 12 Aug 2026 21:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B28301AF
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A47F480F29
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44QpBj4SA1Ks for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 21:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29CB680EEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29CB680EEC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29CB680EEC
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:32:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D8E1A4C4B06;
 Wed, 12 Aug 2026 23:32:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wuGYr-00000000424-2mn3;
 Wed, 12 Aug 2026 21:32:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>
Date: Wed, 12 Aug 2026 23:32:31 +0200
Message-ID: <20260812213233.4141296-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812213233.4141296-1-bernd@kuhls.net>
References: <20260812213233.4141296-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786570354;
 bh=PMQtQT0TQvf1NnVZlkES6cotQ66VoriHRBHiVxDHm8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cqssMolpAgxqAU06Ib2cYG7PaBNP57Ae4VkwjEAw+u80NsWPhe0AqDuAbVGIkoluc
 zwHYw76+dKB1fxurNRuCkBWkC58qlQH1Ei2eJHkN2p1ty7ppZR/DI3LY0K2h24rd8O
 KHght4OyXQYygkRsdnFYGC0/TzG6wCehqSAEPSMbv5nD1soX5FRQQOuc90iBqNH7tl
 I8Yz5gLl/7JeUYo+6DW5ZwhKtNdsGc7/ooDtaM80MDoNafeb0K6gyj5hBpvtnFw45F
 5LwsTZ51pcGy5vcUtGqcdQD4F8XVNeTANWlZJh/pEgbaax3yGYRRfeMFfAbAAnDsbH
 WVJcycFfQ8Y+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cqssMolp
Subject: [Buildroot] [PATCH 2/3] package/libdvdcss: bump version to 1.6.0
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

aHR0cHM6Ly9jb2RlLnZpZGVvbGFuLm9yZy92aWRlb2xhbi9saWJkdmRjc3MvLS9ibG9iLzEuNi4w
L05FV1MKClJlbW92ZWQgc2hhMSBoYXNoLCBzaGEyNTYgaXMgZW5vdWdoLgoKUmVtb3ZlZCBwYXRj
aCB3aGljaCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCgpTaWduZWQtb2ZmLWJ5OiBCZXJu
ZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6Cmh0
dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy8wODQwY2NmYjE5YTk5
NDQ5Yjc0Zjc3ZjY1MWFmMzUwYTVjMDFhNWFhCgogLi4uZC1jb21waWxhdGlvbi1wcm9ibGVtcy13
aXRoLVBBVEhfTUFYLnBhdGNoIHwgNDYgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9saWJk
dmRjc3MvbGliZHZkY3NzLmhhc2ggICAgICAgICAgICAgIHwgIDYgKy0tCiBwYWNrYWdlL2xpYmR2
ZGNzcy9saWJkdmRjc3MubWsgICAgICAgICAgICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvbGliZHZkY3NzLzAwMDEtRml4ZWQtY29tcGlsYXRpb24tcHJvYmxlbXMtd2l0aC1QQVRI
X01BWC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZHZkY3NzLzAwMDEtRml4ZWQtY29t
cGlsYXRpb24tcHJvYmxlbXMtd2l0aC1QQVRIX01BWC5wYXRjaCBiL3BhY2thZ2UvbGliZHZkY3Nz
LzAwMDEtRml4ZWQtY29tcGlsYXRpb24tcHJvYmxlbXMtd2l0aC1QQVRIX01BWC5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMzVlYmY0ZjRkMS4uMDAwMDAwMDAwMAotLS0gYS9w
YWNrYWdlL2xpYmR2ZGNzcy8wMDAxLUZpeGVkLWNvbXBpbGF0aW9uLXByb2JsZW1zLXdpdGgtUEFU
SF9NQVgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0NiArMCwwIEBACi1Gcm9tIGJlMzRkMDI2
ZjQ0Mzg5NzQ1ZTI5YTdkYTk3N2Y4NDcxMjA2NmQzZDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Ci1Gcm9tOiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotRGF0ZTogU2F0LCAxNSBOb3Yg
MjAyNSAxOTo0MTowOSArMDEwMAotU3ViamVjdDogW1BBVENIXSBGaXhlZCBjb21waWxhdGlvbiBw
cm9ibGVtcyB3aXRoIFBBVEhfTUFYCi1NSU1FLVZlcnNpb246IDEuMAotQ29udGVudC1UeXBlOiB0
ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Ci1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
Ci0KLUluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9zcmMvY3B4bS5jOjM4OgotLi4vc3JjL2xpYmR2
ZGNzcy5oOjY1OjI2OiBlcnJvcjog4oCYUEFUSF9NQVjigJkgdW5kZWNsYXJlZCBoZXJlIChub3Qg
aW4gYSBmdW5jdGlvbikKLSAgIDY1IHwgICAgIGNoYXIgICBwc3pfY2FjaGVmaWxlW1BBVEhfTUFY
XTsKLQotSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL3NyYy9lcnJvci5jOjI2OgotLi4vc3JjL2xp
YmR2ZGNzcy5oOjY1OjI2OiBlcnJvcjog4oCYUEFUSF9NQVjigJkgdW5kZWNsYXJlZCBoZXJlIChu
b3QgaW4gYSBmdW5jdGlvbikKLSAgIDY1IHwgICAgIGNoYXIgICBwc3pfY2FjaGVmaWxlW1BBVEhf
TUFYXTsKLQotSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL3NyYy9saWJkdmRjcHhtLmM6NDc6Ci0u
Li9zcmMvbGliZHZkY3NzLmg6NjU6MjY6IGVycm9yOiDigJhQQVRIX01BWOKAmSB1bmRlY2xhcmVk
IGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKQotICAgNjUgfCAgICAgY2hhciAgIHBzel9jYWNoZWZp
bGVbUEFUSF9NQVhdOwotCi1VcHN0cmVhbTogaHR0cHM6Ly9jb2RlLnZpZGVvbGFuLm9yZy92aWRl
b2xhbi9saWJkdmRjc3MvLS9tZXJnZV9yZXF1ZXN0cy8yNAotCi1TaWduZWQtb2ZmLWJ5OiBCZXJu
ZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0tCi0gc3JjL2xpYmR2ZGNzcy5oIHwgNSArKysr
KwotIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL3NyYy9s
aWJkdmRjc3MuaCBiL3NyYy9saWJkdmRjc3MuaAotaW5kZXggZjlkMzZiYS4uOTk3YWYzNCAxMDA2
NDQKLS0tLSBhL3NyYy9saWJkdmRjc3MuaAotKysrIGIvc3JjL2xpYmR2ZGNzcy5oCi1AQCAtMjYs
NiArMjYsMTEgQEAKLSAKLSAjaW5jbHVkZSA8bGltaXRzLmg+Ci0gCi0rI2luY2x1ZGUgPGNvbmZp
Zy5oPgotKyNpZmRlZiBIQVZFX1NZU19QQVJBTV9ICi0rIyAgIGluY2x1ZGUgPHN5cy9wYXJhbS5o
PgotKyNlbmRpZgotKwotICNpbmNsdWRlICJkdmRjc3MvZHZkY3NzLmgiCi0gI2luY2x1ZGUgImNw
eG0uaCIKLSAjaW5jbHVkZSAiY3NzLmgiCi0tLSAKLTIuNDcuMwotCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpYmR2ZGNzcy9saWJkdmRjc3MuaGFzaCBiL3BhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNz
cy5oYXNoCmluZGV4IDgzNTE1NWJlODAuLmE2Yjk5OTJhMTMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bGliZHZkY3NzL2xpYmR2ZGNzcy5oYXNoCisrKyBiL3BhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNz
cy5oYXNoCkBAIC0xLDcgKzEsNSBAQAotIyBGcm9tIGh0dHBzOi8vZG93bmxvYWQudmlkZW9sYW4u
b3JnL3B1Yi92aWRlb2xhbi9saWJkdmRjc3MvMS41LjAvbGliZHZkY3NzLTEuNS4wLnRhci54ei5z
aGExCi1zaGExICBiYjIxYTI3YTMyZmEyYTFkMWU4MTQ0ODcyMmZkYzYyYzUyMWE4ODAzICBsaWJk
dmRjc3MtMS41LjAudGFyLnh6Ci0jIEZyb20gaHR0cHM6Ly9kb3dubG9hZC52aWRlb2xhbi5vcmcv
cHViL3ZpZGVvbGFuL2xpYmR2ZGNzcy8xLjUuMC9saWJkdmRjc3MtMS41LjAudGFyLnh6LnNoYTI1
Ngotc2hhMjU2ICA1Mjk0NjNlNGQxYmVmZWY4MmU1YzZlNDcwZGI3NjYxYTJkYjAzNDNlMDkyYTJm
YjBkNmMwMzdjYWI4YTVjMzk5ICBsaWJkdmRjc3MtMS41LjAudGFyLnh6CisjIEZyb20gaHR0cDov
L2Rvd25sb2FkLnZpZGVvbGFuLm9yZy9wdWIvdmlkZW9sYW4vbGliZHZkY3NzLzEuNi4wL2xpYmR2
ZGNzcy0xLjYuMC50YXIueHouc2hhMjU2CitzaGEyNTYgIDdlYTU1NmM4NDZiN2JmYzMyZDQ3YjQx
Y2FlNTZkMTg2M2E2YjZkNWY3MDZiYjE2Mjc3OGQ2ZjI5ODQ5MDk3N2MgIGxpYmR2ZGNzcy0xLjYu
MC50YXIueHoKIAogIyBIYXNoIGZvciBsaWNlbnNlIGZpbGU6CiBzaGEyNTYgIDgxNzdmOTc1MTMy
MTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENP
UFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5tayBiL3BhY2th
Z2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5tawppbmRleCBkYWU2MmZiNTkyLi5hOTUzMTQ1NTQ3IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2xpYmR2ZGNzcy9saWJkdmRjc3MubWsKKysrIGIvcGFja2FnZS9s
aWJkdmRjc3MvbGliZHZkY3NzLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKIAotTElCRFZEQ1NTX1ZFUlNJT04gPSAxLjUuMAorTElCRFZEQ1NTX1ZFUlNJT04g
PSAxLjYuMAogTElCRFZEQ1NTX1NPVVJDRSA9IGxpYmR2ZGNzcy0kKExJQkRWRENTU19WRVJTSU9O
KS50YXIueHoKIExJQkRWRENTU19TSVRFID0gaHR0cHM6Ly9kb3dubG9hZC52aWRlb2xhbi5vcmcv
cHViL3ZpZGVvbGFuL2xpYmR2ZGNzcy8kKExJQkRWRENTU19WRVJTSU9OKQogTElCRFZEQ1NTX0lO
U1RBTExfU1RBR0lORyA9IFlFUwotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
