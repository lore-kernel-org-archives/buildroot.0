Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE97BCEBF8A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 08:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C90807EF;
	Sun, 16 Nov 2025 08:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdLeATOagp_T; Sun, 16 Nov 2025 08:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27326834BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27326834BA;
	Sun, 16 Nov 2025 08:56:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4391A158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35ACD405BD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6c0OGUXHN-9s for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 08:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB3C4403AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB3C4403AD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB3C4403AD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47825A4C6787;
 Sun, 16 Nov 2025 09:56:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44434)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKYYO-00000000559-3cEO;
 Sun, 16 Nov 2025 08:56:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 16 Nov 2025 09:56:09 +0100
Message-ID: <20251116085612.5120-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763283373;
 bh=uiBswyJMvI6Tml45dXvIioJIqAFKnT9q7knHApzOtTw=;
 h=From:To:Cc:Subject:Date:From;
 b=B53B1Hor/JkjDd/ul7dUAUUfguq/sZy7qS5IdT6TC9+m22Mm6VrYSDhzLuzMSmxKO
 WvDV3xMWr+zCF0xKWhWTLR9SgW+8E7/oCC9BaBFXZZ8qxf4TDRqHhHvAfkBwr741FJ
 pzRzAFA8l8nh62/Wr7EAB0tQmsrQeybACR/YsWYSZpXynPKCAaj0w4IE7VdQR3nIQR
 /8B23GM9b4knSZSqMMcfzevJk8kqBEVee0uXXhlUrgfwPK2l+Wjn/kRxGQwrF3SbNZ
 K6ggN4VwB/BHg+Ou0ThOjnwHCBaK2s+aO9GbJ4M1OpQ+/nzpfKT+QOALaZ++hXuLAw
 bzaWyw0koAEkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=B53B1Hor
Subject: [Buildroot] [PATCH 1/3] package/libdvdcss: bump version to 1.5.0
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

UmVsZWFzZSBub3RlczoKaHR0cHM6Ly9jb2RlLnZpZGVvbGFuLm9yZy92aWRlb2xhbi9saWJkdmRj
c3MvLS9ibG9iLzEuNS4wL05FV1MKCkFkZGVkIHBhdGNoIHRvIGZpeCBidWlsZCBlcnJvcnMuCgpV
cGRhdGVkIF9TSVRFLCBzd2l0Y2hlZCB0YXJiYWxsIHRvIHh6IGFuZCBidWlsZCBzeXN0ZW0gdG8g
bWVzb24uCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0K
IC4uLmQtY29tcGlsYXRpb24tcHJvYmxlbXMtd2l0aC1QQVRIX01BWC5wYXRjaCB8IDQ2ICsrKysr
KysrKysrKysrKysrKysKIHBhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5oYXNoICAgICAgICAg
ICAgICB8ICA4ICsrLS0KIHBhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5tayAgICAgICAgICAg
ICAgICB8ICA4ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmR2ZGNzcy8wMDAxLUZpeGVk
LWNvbXBpbGF0aW9uLXByb2JsZW1zLXdpdGgtUEFUSF9NQVgucGF0Y2gKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYmR2ZGNzcy8wMDAxLUZpeGVkLWNvbXBpbGF0aW9uLXByb2JsZW1zLXdpdGgtUEFU
SF9NQVgucGF0Y2ggYi9wYWNrYWdlL2xpYmR2ZGNzcy8wMDAxLUZpeGVkLWNvbXBpbGF0aW9uLXBy
b2JsZW1zLXdpdGgtUEFUSF9NQVgucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uMzVlYmY0ZjRkMQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbGliZHZkY3Nz
LzAwMDEtRml4ZWQtY29tcGlsYXRpb24tcHJvYmxlbXMtd2l0aC1QQVRIX01BWC5wYXRjaApAQCAt
MCwwICsxLDQ2IEBACitGcm9tIGJlMzRkMDI2ZjQ0Mzg5NzQ1ZTI5YTdkYTk3N2Y4NDcxMjA2NmQz
ZDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PgorRGF0ZTogU2F0LCAxNSBOb3YgMjAyNSAxOTo0MTowOSArMDEwMAorU3ViamVjdDog
W1BBVENIXSBGaXhlZCBjb21waWxhdGlvbiBwcm9ibGVtcyB3aXRoIFBBVEhfTUFYCitNSU1FLVZl
cnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0luIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9z
cmMvY3B4bS5jOjM4OgorLi4vc3JjL2xpYmR2ZGNzcy5oOjY1OjI2OiBlcnJvcjog4oCYUEFUSF9N
QVjigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbikKKyAgIDY1IHwgICAgIGNo
YXIgICBwc3pfY2FjaGVmaWxlW1BBVEhfTUFYXTsKKworSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4u
L3NyYy9lcnJvci5jOjI2OgorLi4vc3JjL2xpYmR2ZGNzcy5oOjY1OjI2OiBlcnJvcjog4oCYUEFU
SF9NQVjigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbikKKyAgIDY1IHwgICAg
IGNoYXIgICBwc3pfY2FjaGVmaWxlW1BBVEhfTUFYXTsKKworSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC4uL3NyYy9saWJkdmRjcHhtLmM6NDc6CisuLi9zcmMvbGliZHZkY3NzLmg6NjU6MjY6IGVycm9y
OiDigJhQQVRIX01BWOKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKQorICAg
NjUgfCAgICAgY2hhciAgIHBzel9jYWNoZWZpbGVbUEFUSF9NQVhdOworCitVcHN0cmVhbTogaHR0
cHM6Ly9jb2RlLnZpZGVvbGFuLm9yZy92aWRlb2xhbi9saWJkdmRjc3MvLS9tZXJnZV9yZXF1ZXN0
cy8yNAorCitTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgorLS0t
Cisgc3JjL2xpYmR2ZGNzcy5oIHwgNSArKysrKworIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKKworZGlmZiAtLWdpdCBhL3NyYy9saWJkdmRjc3MuaCBiL3NyYy9saWJkdmRjc3MuaAor
aW5kZXggZjlkMzZiYS4uOTk3YWYzNCAxMDA2NDQKKy0tLSBhL3NyYy9saWJkdmRjc3MuaAorKysr
IGIvc3JjL2xpYmR2ZGNzcy5oCitAQCAtMjYsNiArMjYsMTEgQEAKKyAKKyAjaW5jbHVkZSA8bGlt
aXRzLmg+CisgCisrI2luY2x1ZGUgPGNvbmZpZy5oPgorKyNpZmRlZiBIQVZFX1NZU19QQVJBTV9I
CisrIyAgIGluY2x1ZGUgPHN5cy9wYXJhbS5oPgorKyNlbmRpZgorKworICNpbmNsdWRlICJkdmRj
c3MvZHZkY3NzLmgiCisgI2luY2x1ZGUgImNweG0uaCIKKyAjaW5jbHVkZSAiY3NzLmgiCistLSAK
KzIuNDcuMworCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmR2ZGNzcy9saWJkdmRjc3MuaGFzaCBi
L3BhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5oYXNoCmluZGV4IDRkMjBmMTllZmMuLmFlZGE2
NjI5NmEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5oYXNoCisrKyBi
L3BhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5oYXNoCkBAIC0xLDcgKzEsNyBAQAotIyBGcm9t
IGh0dHA6Ly9kb3dubG9hZC52aWRlb2xhbi5vcmcvcHViL3ZpZGVvbGFuL2xpYmR2ZGNzcy8xLjQu
My9saWJkdmRjc3MtMS40LjMudGFyLmJ6Mi5zaGExCi1zaGExICBmY2VhOGIyNzQ5ZWFkODE4MzYz
NmU0ODMwMGJlYTg3OTFhYmM3OWVlICBsaWJkdmRjc3MtMS40LjMudGFyLmJ6MgotIyBGcm9tIGh0
dHA6Ly9kb3dubG9hZC52aWRlb2xhbi5vcmcvcHViL3ZpZGVvbGFuL2xpYmR2ZGNzcy8xLjQuMy9s
aWJkdmRjc3MtMS40LjMudGFyLmJ6Mi5zaGEyNTYKLXNoYTI1NiAgMjMzY2M5MmY1ZGMwMWM1ZDNh
OTZmNWIzNTgyYmU3ZDVjZWU1YTM1YTUyZDNhMDgxNTg3NDVkM2Q4NjA3MDA3OSAgbGliZHZkY3Nz
LTEuNC4zLnRhci5iejIKKyMgRnJvbSBodHRwczovL2Rvd25sb2FkLnZpZGVvbGFuLm9yZy9wdWIv
dmlkZW9sYW4vbGliZHZkY3NzLzEuNS4wL2xpYmR2ZGNzcy0xLjUuMC50YXIueHouc2hhMQorc2hh
MSAgYmIyMWEyN2EzMmZhMmExZDFlODE0NDg3MjJmZGM2MmM1MjFhODgwMyAgbGliZHZkY3NzLTEu
NS4wLnRhci54egorIyBGcm9tIGh0dHBzOi8vZG93bmxvYWQudmlkZW9sYW4ub3JnL3B1Yi92aWRl
b2xhbi9saWJkdmRjc3MvMS41LjAvbGliZHZkY3NzLTEuNS4wLnRhci54ei5zaGEyNTYKK3NoYTI1
NiAgNTI5NDYzZTRkMWJlZmVmODJlNWM2ZTQ3MGRiNzY2MWEyZGIwMzQzZTA5MmEyZmIwZDZjMDM3
Y2FiOGE1YzM5OSBsaWJkdmRjc3MtMS41LjAudGFyLnh6CiAKICMgSGFzaCBmb3IgbGljZW5zZSBm
aWxlOgogc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRk
NGU2OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmR2
ZGNzcy9saWJkdmRjc3MubWsgYi9wYWNrYWdlL2xpYmR2ZGNzcy9saWJkdmRjc3MubWsKaW5kZXgg
ZjRkNzIxNzcxZi4uZGFlNjJmYjU5MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJkdmRjc3MvbGli
ZHZkY3NzLm1rCisrKyBiL3BhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5tawpAQCAtNCwxMSAr
NCwxMSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCRFZEQ1NTX1ZFUlNJT04g
PSAxLjQuMwotTElCRFZEQ1NTX1NPVVJDRSA9IGxpYmR2ZGNzcy0kKExJQkRWRENTU19WRVJTSU9O
KS50YXIuYnoyCi1MSUJEVkRDU1NfU0lURSA9IGh0dHA6Ly93d3cudmlkZW9sYW4ub3JnL3B1Yi92
aWRlb2xhbi9saWJkdmRjc3MvJChMSUJEVkRDU1NfVkVSU0lPTikKK0xJQkRWRENTU19WRVJTSU9O
ID0gMS41LjAKK0xJQkRWRENTU19TT1VSQ0UgPSBsaWJkdmRjc3MtJChMSUJEVkRDU1NfVkVSU0lP
TikudGFyLnh6CitMSUJEVkRDU1NfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQudmlkZW9sYW4ub3Jn
L3B1Yi92aWRlb2xhbi9saWJkdmRjc3MvJChMSUJEVkRDU1NfVkVSU0lPTikKIExJQkRWRENTU19J
TlNUQUxMX1NUQUdJTkcgPSBZRVMKIExJQkRWRENTU19MSUNFTlNFID0gR1BMLTIuMCsKIExJQkRW
RENTU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwogCi0kKGV2YWwgJChhdXRvdG9vbHMtcGFja2Fn
ZSkpCiskKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
