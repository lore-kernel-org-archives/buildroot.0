Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6751EFC618A
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 19:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 151984066D;
	Sat,  3 Jan 2026 19:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U61OALpdVNeD; Sat,  3 Jan 2026 19:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0C4840651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767466987;
	bh=+dpslw0YsJabK7tt7LVNsKc1cMXrXjRVIycsm4Kg86s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l6Z4Fm8cUHM0ZEe3BDRLVhehVP4gcmGXHsN4DqIjRigHoKFkehTDRhcdBl/2m4y0p
	 /qy9chwK67liIlhyL8vhNP6plipbkXDCSIqx8cFXtOPjzqbg3DgUWpe+aaMSjKCViZ
	 QckpFTGlKJpqFetwsspF9GH6GPyXcWz+7qzN6Kj4DoB+lA+eoqfEPbAcYiD0xw7t4V
	 UJwfL0oaoRvMg0Gmz/7ggojlRmBWV3IMfsGLxdtxln8fVDi54XCRAYcAazhEUHFQ/z
	 TWrcvCu1mPsRxoL6yR1aUZMM0ljD8aIMNrJlYX40ySSzgirAR53Rp6WAuAsvUXdTc9
	 jO6NTeyTuA2Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C4840651;
	Sat,  3 Jan 2026 19:03:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA40351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3E67605F1
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsXWEX4tTRj0 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 19:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED0CC605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED0CC605D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED0CC605D2
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:03:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D1CDA4C2CA8;
 Sat,  3 Jan 2026 20:03:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56276)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc6tv-000000001bT-2ukw;
 Sat, 03 Jan 2026 19:02:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Sat,  3 Jan 2026 20:02:57 +0100
Message-ID: <20260103190259.1904724-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767466980;
 bh=cC8Pm3W41Ge2BxHUr+pO4o1VdeXvd6ec9BJRoYNx9Iw=;
 h=From:To:Cc:Subject:Date:From;
 b=MlUctXeRdG7lne3zNpMfjzh30/qjx4E/xVJFAGBg3KlUMMtSXFZ5vTXT7vTiJiFFp
 ihZ5mZUy9FZWUeJyAT+dVCpvkn53C8U0EImdGq2dYZ9QanbcW+IpHzPPUoSXnN+L72
 E6GcP7+Du6M0h3P1juEzcc4DBkmAD5jXrZt1HVzJKrrH7JqtC8Ilt4sbGJt71gZ05e
 DuASVSQJBq6jETm1sCnxSbUniJVBeeDZNWqc3oLUjTjSrrxH5kTxV/wPZpQ2aoAAFr
 pjLl5dnqzsxHmfZZjM9yP99CaSxO3sw+rCyPkEv0I83HvEwH67BkZfkcSNN5IHU4Bf
 DYBJ5+NViBMMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=MlUctXeR
Subject: [Buildroot] [PATCH 1/2] package/bitcoin: broken on m68k
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

QnVpbGRyb290IGNvbW1pdCBhM2E4OGZmMWM4NWJhMDA2N2FmMTAyOGJjMjMyZjhmNjFiNjI4OTc5
IGJ1bXBlZCBiaXRjb2luCnRvIHZlcnNpb24gMjYuMCB3aGljaCBpbmNsdWRlcyB1cHN0cmVhbSBj
b21taXQKaHR0cHM6Ly9naXRodWIuY29tL2JpdGNvaW4vYml0Y29pbi9jb21taXQvYjg0MDFjMzI4
MTk3OGJlZWQ2MTk4YjJmOTc4MmI2YThkZDM1Y2JkNwpjYXVzaW5nIGFuIGFzc2VydGlvbiBvbiBt
NjhrOgoKL2hvbWUvdGhvbWFzL2F1dG9idWlsZC9pbnN0YW5jZS03L291dHB1dC0xL2J1aWxkL2Jp
dGNvaW4tMzAuMC9zcmMvc3VwcG9ydC9hbGxvY2F0b3JzL3Bvb2wuaDo5MjozNjoKIGVycm9yOiBz
dGF0aWMgYXNzZXJ0aW9uIGZhaWxlZDogVW5pdHMgb2Ygc2l6ZSBFTEVNX1NJWkVfQUxJR04gbmVl
ZCB0bwogYmUgYWJsZSB0byBzdG9yZSBhIExpc3ROb2RlCiAgIDkyIHwgICAgIHN0YXRpY19hc3Nl
cnQoc2l6ZW9mKExpc3ROb2RlKSA8PSBFTEVNX0FMSUdOX0JZVEVTLCAiVW5pdHMKICAgICAgfCAg
ICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn4KIG9m
IHNpemUgRUxFTV9TSVpFX0FMSUdOIG5lZWQgdG8gYmUgYWJsZSB0byBzdG9yZSBhIExpc3ROb2Rl
Iik7CgovaG9tZS90aG9tYXMvYXV0b2J1aWxkL2luc3RhbmNlLTcvb3V0cHV0LTEvYnVpbGQvYml0
Y29pbi0zMC4wL3NyYy9zdXBwb3J0L2FsbG9jYXRvcnMvcG9vbC5oOjkyOjM2Ogogbm90ZTogdGhl
IGNvbXBhcmlzb24gcmVkdWNlcyB0byAnKDQgPD0gMiknCgpUbyBmaXggdGhlIHByb2JsZW0gd2Ug
ZGlzYWJsZSBiaXRjb2luIG9uIG02OGsuCgpGaXhlczoKMzAuMDogaHR0cHM6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm5ldC9yZXN1bHRzLzI2OC8yNjg4ZTRhMmFhOGRjMzQzNDNmMDIxOGZkNjcyN2Qw
YWUzYWRiMTMyLwoyNi4wOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
ZmIwL2ZiMDU0MDFjN2RlMjg5ZTBmODdmNWM5ZTNhN2Y5MmY1NTg5YjU5MGIvCgpTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvYml0Y29pbi9D
b25maWcuaW4gfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2JpdGNvaW4vQ29uZmlnLmluIGIvcGFja2FnZS9iaXRjb2luL0NvbmZp
Zy5pbgppbmRleCAzMjQwNDYyZjU2Li5lZWRiMDg5N2E1IDEwMDY0NAotLS0gYS9wYWNrYWdlL2Jp
dGNvaW4vQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvYml0Y29pbi9Db25maWcuaW4KQEAgLTYsNiAr
NiwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQklUQ09JTl9BUkNIX1NVUFBPUlRTCiAJIyBzdXBw
b3J0LiBCUjJfVE9PTENIQUlOX0hBU19BVE9NSUMgZG9lcyBub3QgcHJvdmlkZSBhCiAJIyBzaXpl
LWxldmVsIGdyYW51bGFyaXR5IHRvIGV4cHJlc3MgdGhpcyBkZXBlbmRlbmN5LgogCWRlcGVuZHMg
b24gIShCUjJfYXJtIHx8IEJSMl9hcm1lYikgfHwgQlIyX1VTRV9NTVUKKwkjIGVycm9yOiBzdGF0
aWMgYXNzZXJ0aW9uIGZhaWxlZDogVW5pdHMgb2Ygc2l6ZSBFTEVNX1NJWkVfQUxJR04KKwkjIG5l
ZWQgdG8gYmUgYWJsZSB0byBzdG9yZSBhIExpc3ROb2RlCisJIyBub3RlOiB0aGUgY29tcGFyaXNv
biByZWR1Y2VzIHRvIOKAmCg0IDw9IDIp4oCZCisJZGVwZW5kcyBvbiAhQlIyX202OGsKIAogY29u
ZmlnIEJSMl9QQUNLQUdFX0JJVENPSU4KIAlib29sICJiaXRjb2luIgotLSAKMi40Ny4zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
