Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9870CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 13:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B41F60BB0;
	Sat, 18 Oct 2025 13:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6amvLtCFbcvp; Sat, 18 Oct 2025 13:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5294E60D58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5294E60D58;
	Sat, 18 Oct 2025 13:56:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3170C1CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 13:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EECD408A4
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 13:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIN0WWzuGBFd for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 13:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AE2140854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AE2140854
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AE2140854
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 13:56:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A929FA4C109F;
 Sat, 18 Oct 2025 15:56:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44010)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vA7Q3-000000002jC-0ys9;
 Sat, 18 Oct 2025 13:56:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>
Date: Sat, 18 Oct 2025 15:56:26 +0200
Message-ID: <20251018135626.788605-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760795787;
 bh=3caf+Ze6bfdJgylKPLLpucq0CKHCiZk4t9ov1U07/fI=;
 h=From:To:Cc:Subject:Date:From;
 b=Z2jY24cU4QGOIrulLbWlRY0UzX4Wi9P3f4aEOmrOnGNRI63s5YTfIrC0P1VF7ObzX
 M0MKwR71O5bh0u8uh30toAjZXA7ZOWQVA+EaRyhCJ6ZWWmitrE8CQjUaEPLu+ux6qg
 CQ0uu4ebAqZpA2Q1ZJRzO1vllxPl/C9DSaNRFa9luQqtxCvSTblw5NYqUZO0ATU3SB
 ZGxp0PtmvTY6zBFYBmM1vkwKBj6v2VCAyNyxcai3uKLzOGZN8zTHMv9vw0RlwPcdwA
 nxRTxaQG8eqVDk+WFWpDeSP+hZ+CoMDNrBAOZSeb8MG0O3m8XQcsNOYNrUU2nNtdJz
 obfe4jSozKyBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Z2jY24cU
Subject: [Buildroot] [PATCH 1/1] package/siproxd: Add upstream patch to fix
 build with gcc >= 14
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

Rml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82NzkvNjc5ZmU4
NmVlYTIwMDFhZWQyYmFmMDY2YWJmM2FlNDNiMzg1NjdiNS8KClNpZ25lZC1vZmYtYnk6IEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogLi4uLzAwMDEtRml4LWNvbXBpbGF0aW9uLW9u
LWdjYy0xNC5wYXRjaCAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9zaXBy
b3hkL3NpcHJveGQubWsgICAgICAgICAgICAgICAgICAgIHwgIDIgKwogMiBmaWxlcyBjaGFuZ2Vk
LCA1MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zaXByb3hkLzAw
MDEtRml4LWNvbXBpbGF0aW9uLW9uLWdjYy0xNC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
c2lwcm94ZC8wMDAxLUZpeC1jb21waWxhdGlvbi1vbi1nY2MtMTQucGF0Y2ggYi9wYWNrYWdlL3Np
cHJveGQvMDAwMS1GaXgtY29tcGlsYXRpb24tb24tZ2NjLTE0LnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjBhNTU5Njk3MDMKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL3NpcHJveGQvMDAwMS1GaXgtY29tcGlsYXRpb24tb24tZ2NjLTE0LnBhdGNoCkBAIC0w
LDAgKzEsNTAgQEAKK0Zyb20gOTg1YzJjZDE5ODIxM2IyNTBjNjFkOGM2NjIxYWY1MmUzMThjNGMx
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGNydW1wbGVkLWFjcm9ueW0gPDYwMDYx
NzQ0K2NydW1wbGVkLWFjcm9ueW1AdXNlcnMubm9yZXBseS5naXRodWIuY29tPgorRGF0ZTogTW9u
LCAzMCBKdW4gMjAyNSAxMjozMjowMiArMDIwMAorU3ViamVjdDogW1BBVENIXSBGaXggY29tcGls
YXRpb24gb24gZ2NjID49IDE0CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisK
K2AuL2NvbmZpZ3VyZWAgZmFpbHMgZm9yIGdjYyA+PSAxNCB3aXRoIHRoZSBmb2xsb3dpbmcgZXJy
b3IKKworYGBgCitjaGVja2luZyAibGlib3NpcCBwcmVmaXgiLi4uCitjaGVja2luZyBmb3Igb3Np
cF9pbml0IGluIC1sb3NpcDIuLi4geWVzCitjaGVja2luZyBmb3IgcGFyc2VyX2luaXQgaW4gLWxv
c2lwcGFyc2VyMi4uLiB5ZXMKK2NoZWNraW5nIGxpYm9zaXAyIHZlcnNpb24gPiAzLjAuMC4uLiAq
KiogRVJST1I6IGxpYm9zaXAyLTMueC54IGlzIHJlcXVpcmVkIQorYGBgCisKK3doaWNoIGluIGZh
Y3QgaXMgY2F1c2VkIGJ5IHRoZSB0ZXN0IHByb2dyYW0gaW4gYEFDWF9DSEVDS19MSUJPU0lQX1ZF
UlNJT05gIGZ1bmN0aW9uIGluIGBhY2luY2x1ZGUubTRgIGR1ZSB0bworCitgYGAKK2NvbmZ0ZXN0
LmM6NDozOiBlcnJvcjogcmV0dXJuIHR5cGUgZGVmYXVsdHMgdG8g4oCYaW504oCZIFstV2ltcGxp
Y2l0LWludF0KKyAgICA0IHwgbWFpbigpIHsKKyAgICAgIHwgXn5+fgorYGBgCisKK1RoaXMgcGF0
Y2ggZml4ZXMgdGhlIGlzc3VlIQorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2hiOXhh
ci9zaXByb3hkL2NvbW1pdC85ODVjMmNkMTk4MjEzYjI1MGM2MWQ4YzY2MjFhZjUyZTMxOGM0YzEy
CisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBh
Y2luY2x1ZGUubTQgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9hY2luY2x1ZGUubTQgYi9hY2luY2x1ZGUubTQKK2lu
ZGV4IDZmYTQ4MjguLjgxNjQyNDYgMTAwNjQ0CistLS0gYS9hY2luY2x1ZGUubTQKKysrKyBiL2Fj
aW5jbHVkZS5tNAorQEAgLTM0MCw3ICszNDAsNyBAQCBkbmwgcG9pbnRlciB0byB0aGUgc3RydWN0
dXJlIChiYWQpCisgQUNfQ09NUElMRV9JRkVMU0UoCisgW0FDX0xBTkdfU09VUkNFKFsKKyAgICNp
bmNsdWRlIDxvc2lwcGFyc2VyMi9vc2lwX3BhcnNlci5oPgorLSAgbWFpbigpIHsKKysgIGludCBt
YWluKCkgeworICAgb3NpcF9tZXNzYWdlX3QgdDsKKyAgIGludCAgZTsKKyAgIGU9dC5jb250YWN0
cy5uYl9lbHQ7CistLSAKKzIuNDcuMworCmRpZmYgLS1naXQgYS9wYWNrYWdlL3NpcHJveGQvc2lw
cm94ZC5tayBiL3BhY2thZ2Uvc2lwcm94ZC9zaXByb3hkLm1rCmluZGV4IDIyOGYwODU1YTYuLmZh
YWJiNjhhMjQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc2lwcm94ZC9zaXByb3hkLm1rCisrKyBiL3Bh
Y2thZ2Uvc2lwcm94ZC9zaXByb3hkLm1rCkBAIC0xMiw2ICsxMiw4IEBAIFNJUFJPWERfTElDRU5T
RV9GSUxFUyA9IENPUFlJTkcKIAogU0lQUk9YRF9ERVBFTkRFTkNJRVMgPSBsaWJvc2lwMiBsaWJ0
b29sIHNxbGl0ZQogCisjIDAwMDEtRml4LWNvbXBpbGF0aW9uLW9uLWdjYy0xNC5wYXRjaAorU0lQ
Uk9YRF9BVVRPUkVDT05GID0gWUVTCiBTSVBST1hEX0NPTkZfT1BUUyA9IC0td2l0aG91dC1pbmNs
dWRlZC1sdGRsCiAKICQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKLS0gCjIuNDcuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
