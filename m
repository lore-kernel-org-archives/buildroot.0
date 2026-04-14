Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BD9F9D0E4
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A923D42AA8;
	Tue, 14 Apr 2026 16:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOKKRk2pOIcX; Tue, 14 Apr 2026 16:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45B042A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776183632;
	bh=PVhhWytUtRUiC06ce7DMln8emTygKRyvk8DWJrfpwxQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pfpTY78G7kMu2Wv4kbG1spRiho03xSs0CZJWlz+CY6XT4II+24o2bEnwJnZopke7U
	 PoMUoKduaHYRzyW1mCAQfukagu1QxQeK95JqtsDFXxHFZl2DkSfw9bN67w3CslNoSn
	 ZIvhceE06WvdnUvKssC2t9lTLFeEWhz6YTusFuUCtG5H8K3W3WEp4+ME1J3l1/q6xy
	 nyO+G07BcWmBd/22bM6YGY9XimZe96Oos9VSdYMRH31qr2ntz3UfbhxdfnekrdjTPS
	 qj0JwL3hhF5RgVDmw/6JCsWbsrN4aLXc1WqcNP4yVI/6OPn14/Uo2HQbiwceHS9Z7y
	 /6TDwLnkOa7xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D45B042A8E;
	Tue, 14 Apr 2026 16:20:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CC77283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E72C403C8
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxhFz5VHYA5x for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2067B40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2067B40055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2067B40055
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2A979A4C059A;
 Tue, 14 Apr 2026 18:20:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36316)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgV2-000000005zN-24Oj;
 Tue, 14 Apr 2026 16:20:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 14 Apr 2026 18:20:25 +0200
Message-ID: <20260414162028.2141018-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776183629;
 bh=bhlK04nqCQEFXXOmyXylZTWXD94zvgjjdGbHHDwjkmA=;
 h=From:To:Cc:Subject:Date:From;
 b=HhXsvne5NcGXQAV/KX0gXrUud/EmhnVkeYv3V4pN5WNWvjpCKlOR2IrO3wTDlU4Wx
 CqF9cQaFHT8eQOFzWu/8UvP3C2/fqKk2EH2v3ZJ5/k+xtY0xHp9KPFnpuVhf3x4064
 6HAeiDWfud3G2ZH72WY2Kb3SSUY+pEM1O7gUy14oklpySRJFjSDshySPvmYygg7ydg
 v0yqyCQ+droPMnlUGc6ZSW6bjoqGLZt48qirdYOXUX0WUpGXjBFpNVuExgcDL0WgVy
 ka3Y2TQlpv2p52FxEo0MtOolKRUGTuhCbrrXenP4SnwsFbjPnIXnG6ngdPK0MzF2L9
 0+AbN5sm5DVEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HhXsvne5
Subject: [Buildroot] [PATCH 1/4] package/pipewire: bump version to 1.6.3
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

UmVsZWFzZSBub3RlczoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3Bp
cGV3aXJlLy0vYmxvYi8xLjYuMy9ORVdTCgpmZm1wZWcgc3VwcG9ydCBuZWVkcyBzd3NjYWxlIHN1
cHBvcnQ6Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXBld2lyZS9waXBld2lyZS8t
L2NvbW1pdC8yY2JjZGJjNTc5YmJmZmE2ODIwODhmYmVkYmNhMTBlMjc4ZTA2MWRkCgpSZW5hbWVk
IGNvbmZpZ3VyZSBvcHRpb24gJ3N5c3RlbWQnIHRvICdsaWJzeXN0ZW1kJyBkdWUgdG8gY29tbWl0
Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXBld2lyZS9waXBld2lyZS8tL2NvbW1p
dC9mMmM4NzhhMmMxNzVkMGJlY2U0NTcxZGY2OTFhOGFmMDJlN2EzYWI3CgpEaXNhYmxlZCBqYWNr
MiBzdXBwb3J0IGZvciB1Q2xpYmMgdG8gZml4IGEgYnVpbGQgZXJyb3I6CgouLi9waXBld2lyZS1q
YWNrL3NyYy9waXBld2lyZS1qYWNrLmM6MTM6MTA6IGZhdGFsIGVycm9yOiB0aHJlYWRzLmg6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKICAgMTMgfCAjaW5jbHVkZSA8dGhyZWFkcy5oPgoKUmVt
b3ZpbmcgdGhpcyBpbmNsdWRlIHdpbGwgbm90IGZpeCB0aGUgcHJvYmxlbToKCi4uL3BpcGV3aXJl
LWphY2svc3JjL3BpcGV3aXJlLWphY2suYzoxMjc6MjA6IGVycm9yOiBleHBlY3RlZCDigJg74oCZ
IGJlZm9yZSDigJhmbG9hdOKAmQogIDEyNyB8IHN0YXRpYyB0aHJlYWRfbG9jYWwgZmxvYXQgbWlk
aV9zY3JhdGNoW01JRElfU0NSQVRDSF9GUkFNRVNdOwoKRml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yMTcvMjE3ZjQ1MDBhN2RhZGYwODliOTA0MzhlMWViMDZh
YWE5YzUwZjRjNS8KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+
Ci0tLQogcGFja2FnZS9waXBld2lyZS9Db25maWcuaW4gICAgIHwgMSArCiBwYWNrYWdlL3BpcGV3
aXJlL3BpcGV3aXJlLmhhc2ggfCAyICstCiBwYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rICAg
fCA5ICsrKysrLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXBld2lyZS9Db25maWcuaW4gYi9wYWNrYWdl
L3BpcGV3aXJlL0NvbmZpZy5pbgppbmRleCA5ZDJkZTZjODY2Li4zOGEzMjFkNTAwIDEwMDY0NAot
LS0gYS9wYWNrYWdlL3BpcGV3aXJlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3BpcGV3aXJlL0Nv
bmZpZy5pbgpAQCAtNyw2ICs3LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BJUEVXSVJFCiAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0FMU0FfTElCX1VDTSBpZiBCUjJfUEFDS0FHRV9BTFNBX0xJQgogCXNl
bGVjdCBCUjJfUEFDS0FHRV9BTFNBX0xJQl9TRVEgaWYgQlIyX1BBQ0tBR0VfQUxTQV9MSUIKIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfQkxVRVo1X1VUSUxTX1BMVUdJTlNfQVVESU8gaWYgQlIyX1BBQ0tB
R0VfQkxVRVo1X1VUSUxTICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9GRk1QRUdfU1dT
Q0FMRSBpZiBCUjJfUEFDS0FHRV9GRk1QRUcKIAloZWxwCiAJICBQaXBlV2lyZSBpcyBhIHNlcnZl
ciBhbmQgdXNlciBzcGFjZSBBUEkgdG8gZGVhbCB3aXRoCiAJICBtdWx0aW1lZGlhIHBpcGVsaW5l
cy4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUuaGFzaCBiL3BhY2thZ2Uv
cGlwZXdpcmUvcGlwZXdpcmUuaGFzaAppbmRleCAyZTZhOWFlM2FhLi5iZDQ3NzY5OWZlIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLmhhc2gKKysrIGIvcGFja2FnZS9waXBl
d2lyZS9waXBld2lyZS5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
LXNoYTI1NiAgNzY3MGY2MTcyMjBjYzA1Mzk0OGZjOGYyYzFmZjc4ODE5MjQ3OWVmNWQ0ZjM3M2Q4
NzhhYzhhN2NhYjc2YTcxYyAgcGlwZXdpcmUtMS4yLjgudGFyLmJ6Mgorc2hhMjU2ICBlZmFhMjVm
OTgwMzg3Mzg5NzM3MThkODZlMGMwZDVkM2EyMDI0OTk4MTMyYjQ0NjEyN2RiNDEwZDk2YzQ1ODdj
ICBwaXBld2lyZS0xLjYuMy50YXIuYnoyCiBzaGEyNTYgIDg5MDljMzE5YTdlMjdkYmIzM2ExNWI5
MDM1Zjg5YWIzYjdiMmY2YTEyZjhiY2RkYzc1NTIwNmE4ZGIxYWRhNDQgIENPUFlJTkcKIHNoYTI1
NiAgYmU0YmU1ZDc3NDI0ODMzZWRmMzFmNTNmYzFmMWNlY2I2OTk2YjllMmQ3NDdkOWU2ZmI4Zjg3
ODM2MmViYzkyYiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXBld2lyZS9waXBld2ly
ZS5tayBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUubWsKaW5kZXggYzFkYzJhYTBjYy4uMTQ3
OTNjZTc2OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9waXBld2lyZS9waXBld2lyZS5taworKysgYi9w
YWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotUElQRVdJUkVfVkVSU0lPTiA9IDEuMi44CitQSVBFV0lSRV9WRVJT
SU9OID0gMS42LjMKIFBJUEVXSVJFX1NPVVJDRSA9IHBpcGV3aXJlLSQoUElQRVdJUkVfVkVSU0lP
TikudGFyLmJ6MgogUElQRVdJUkVfU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9waXBld2lyZS9waXBld2lyZS8tL2FyY2hpdmUvJChQSVBFV0lSRV9WRVJTSU9OKQogUElQRVdJ
UkVfTElDRU5TRSA9IE1JVCwgTEdQTC0yLjErIChsaWJzcGEtYWxzYSksIEdQTC0yLjAgKGxpYmph
Y2tzZXJ2ZXIpCkBAIC03MCwxMyArNzAsMTMgQEAgZW5kaWYKIAogaWZlcSAoJChCUjJfUEFDS0FH
RV9TWVNURU1EKSx5KQogUElQRVdJUkVfQ09ORl9PUFRTICs9IFwKLQktRHN5c3RlbWQ9ZW5hYmxl
ZCBcCisJLURsaWJzeXN0ZW1kPWVuYWJsZWQgXAogCS1Ec3lzdGVtZC1zeXN0ZW0tc2VydmljZT1l
bmFibGVkIFwKIAktRHN5c3RlbWQtdXNlci1zZXJ2aWNlPWVuYWJsZWQKIFBJUEVXSVJFX0RFUEVO
REVOQ0lFUyArPSBzeXN0ZW1kCiBlbHNlCiBQSVBFV0lSRV9DT05GX09QVFMgKz0gXAotCS1Ec3lz
dGVtZD1kaXNhYmxlZCBcCisJLURsaWJzeXN0ZW1kPWRpc2FibGVkIFwKIAktRHN5c3RlbWQtc3lz
dGVtLXNlcnZpY2U9ZGlzYWJsZWQgXAogCS1Ec3lzdGVtZC11c2VyLXNlcnZpY2U9ZGlzYWJsZWQK
IGVuZGlmCkBAIC0xMDAsNyArMTAwLDggQEAgZWxzZQogUElQRVdJUkVfQ09ORl9PUFRTICs9IC1E
YXZhaGk9ZGlzYWJsZWQKIGVuZGlmCiAKLWlmZXEgKCQoQlIyX1BBQ0tBR0VfSkFDSzIpLHkpCisj
IHVDbGliYyBkb2VzIG5vdCBpbXBsZW1lbnQgdGhyZWFkX2xvY2FsCitpZmVxICgkKEJSMl9QQUNL
QUdFX0pBQ0syKTokKEJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMpLHk6KQogUElQRVdJUkVfQ09O
Rl9PUFRTICs9IC1EcGlwZXdpcmUtamFjaz1lbmFibGVkIC1EamFjaz1lbmFibGVkCiBQSVBFV0lS
RV9ERVBFTkRFTkNJRVMgKz0gamFjazIKIGVsc2UKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
