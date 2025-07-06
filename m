Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D4C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 07:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD26A6066E;
	Sun,  6 Jul 2025 07:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbeqEJukU80U; Sun,  6 Jul 2025 07:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1547D6081F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1547D6081F;
	Sun,  6 Jul 2025 07:06:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28FE319C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 07:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A42C81CAF
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 07:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OlIKG5gflbO for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 07:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5D1C81CA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D1C81CA3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5D1C81CA3
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 07:06:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41479A4C2ED7
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 09:06:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36544)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYJS4-000000003pO-0pBH
 for buildroot@buildroot.org; Sun, 06 Jul 2025 07:06:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Jul 2025 09:06:15 +0200
Message-Id: <20250706070615.543413-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751785576;
 bh=EgRaNuhcSrSqIsx6MsMV/LB/S5V5HHoK7lFl/A9lEB4=;
 h=From:To:Subject:Date:From;
 b=Wp87OTfTmpWI2wRR4NkWNDcqisU1xofn0GRazCtQEe+pVdjYX9DhcQUUYkFvV39ns
 q/9QcW91iFfnzAsFgUNmtKrbdvpRy8kGZaSUjQmj4RMOavqanJaAwokrJuR2527xSs
 6b5/KCSHFES6EL8LN6FskOcYlj4H1P78+WtF+eADHbHp1xMEXHTcAAS4Oy+0Kz9T/1
 2/qyVgzGvTzapnv/n6dfwlz0JpbNeghGFnbZM15IZASSQ6hT3PzcbzhORxu9+YTMTA
 lBmTpcMhZOiKIII8k741p3eyTBgvGkSyJzYSHrVSC0UzqeNfoxIpaC7Dxp8Nz49LJZ
 fSKYht397n02w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Wp87OTfT
Subject: [Buildroot] [PATCH 1/1] package/hddtemp: fix build without nls
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

Rml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8wNmI0NGRmMjYx
MzE4Y2UxZDA3ZjZjYjIwYjI2ZTRhZDY0MjIyOTQwLwoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3Vo
bHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi4vaGRkdGVtcC8wMDAxLWZpeC1idWlsZC13aXRo
b3V0LW5scy5wYXRjaCAgfCA0MCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NDAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaGRkdGVtcC8wMDAx
LWZpeC1idWlsZC13aXRob3V0LW5scy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaGRkdGVt
cC8wMDAxLWZpeC1idWlsZC13aXRob3V0LW5scy5wYXRjaCBiL3BhY2thZ2UvaGRkdGVtcC8wMDAx
LWZpeC1idWlsZC13aXRob3V0LW5scy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi4zNTZiOTRiMDEwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9oZGR0ZW1w
LzAwMDEtZml4LWJ1aWxkLXdpdGhvdXQtbmxzLnBhdGNoCkBAIC0wLDAgKzEsNDAgQEAKK0Zyb20g
YzlkMGQyNDlmZjAxM2QzM2NmMWZkNWE1ODZjMTZlZTMwMDk1Y2M5MCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb206IE5pY29sYXMgUEFSTEFOVCA8bmljb2xhcy5wYXJsYW50QHBhcmh1ZXQu
ZnI+CitEYXRlOiBGcmksIDE0IEZlYiAyMDI1IDEwOjA4OjQzICswMTAwCitTdWJqZWN0OiBbUEFU
Q0hdIGZpeCBidWlsZCB3aXRob3V0IG5scworTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlw
ZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAorCis+IGhkZHRlbXAuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKKz4gaGRkdGVtcC5j
OjI3NDozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYYmluZHRl
eHRkb21haW7igJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCis+ICAgMjc0IHwg
ICBiaW5kdGV4dGRvbWFpbiAoUEFDS0FHRSwgTE9DQUxFRElSKTsKKz4gICAgICAgfCAgIF5+fn5+
fn5+fn5+fn5+Cis+IGhkZHRlbXAuYzoyNzU6MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mIGZ1bmN0aW9uIOKAmHRleHRkb21haW7igJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCis+ICAgMjc1IHwgICB0ZXh0ZG9tYWluIChQQUNLQUdFKTsKKz4gICAgICAgfCAgIF5+
fn5+fn5+fn4KKz4gbWFrZVsyXTogKioqIFtNYWtlZmlsZTo0OTY6IGhkZHRlbXAtaGRkdGVtcC5v
XSBFcnJvciAxCisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vdml0bGF2L2hkZHRlbXAv
cHVsbC8xNgorCitTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgor
LS0tCisgc3JjL2hkZHRlbXAuYyB8IDIgKysKKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCisKK2RpZmYgLS1naXQgYS9zcmMvaGRkdGVtcC5jIGIvc3JjL2hkZHRlbXAuYworaW5kZXgg
NjRkMDAwZS4uYmZlYTU1NiAxMDA2NDQKKy0tLSBhL3NyYy9oZGR0ZW1wLmMKKysrKyBiL3NyYy9o
ZGR0ZW1wLmMKK0BAIC0yNzAsOSArMjcwLDExIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyKiBh
cmd2W10pIHsKKyAgIGJhY2t0cmFjZV9zaWdpbGwoKTsKKyAgIGJhY2t0cmFjZV9zaWdidXMoKTsK
KyAKKysjaWYgRU5BQkxFX05MUworICAgc2V0bG9jYWxlIChMQ19BTEwsICIiKTsKKyAgIGJpbmR0
ZXh0ZG9tYWluIChQQUNLQUdFLCBMT0NBTEVESVIpOworICAgdGV4dGRvbWFpbiAoUEFDS0FHRSk7
CisrI2VuZGlmCisgCisgICBzaG93X2RiID0gZGVidWcgPSBudW1lcmljID0gcXVpZXQgPSB3YWtl
dXAgPSBhZl9oaW50ID0gc3lzbG9nX2ludGVydmFsID0gZm9yZWdyb3VuZCA9IDA7CisgICB1bml0
ID0gREVGQVVMVDsKLS0gCjIuMzkuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
