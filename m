Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835DEFD9E1A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B85340291;
	Thu, 26 Feb 2026 22:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLVcKoA-e4aG; Thu, 26 Feb 2026 22:11:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 263D140262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772143909;
	bh=bYpc6PMc9PF/7IqLh1A8ar68Ti+LGfSlMuqNfqQVyew=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OUQEeEzJnspG+r3kFEidk4knFHUd2x8q8+0c3tpQuZCHih+VSvl+VeNYBwEWXKrKn
	 rX4E4Xevh3MUzx62a5nLBFTxG+1ZKfavm92k02l7ghLrJV8S+H+7OZRAteW+yjmyE4
	 7nj3sPR5o7zID0YSynVhlPt5YJJY4T7asyEc/BXoZi4Tg/14SKIpKWrerPo8k7WrlJ
	 6fSK8YSXCERKRUFdstjLjFn1fBpi5M0EtmEdSZaBoJIS7u61jPpouc74hXOkDpEtwe
	 F2E/E1CrmRUl5gF7iVAkXT2NtUYPv/tWECIjzKLBq7lA9FLnym/Bb/0T6eIv6d7hr+
	 j9S2DjrhFnilA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 263D140262;
	Thu, 26 Feb 2026 22:11:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7242823D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 22:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64439803B1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 22:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Osba7w7o2zty for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 22:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08B7D803A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B7D803A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08B7D803A5
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 22:11:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0591DA4C0DA0;
 Thu, 26 Feb 2026 23:11:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44010)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvjaA-000000007rB-3niu;
 Thu, 26 Feb 2026 22:11:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Feb 2026 23:11:39 +0100
Message-ID: <20260226221142.2888118-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772143903;
 bh=zMbqiereEunp20648ahlDdwuM3kXKPKzw2spjO0bVjk=;
 h=From:To:Cc:Subject:Date:From;
 b=gMhF1tSzY/2ULGi3OYuR1ifme8PT5KpwPsZIXSjPSr5Uxwb8xQha7ekSWnkKECPlH
 //2q5SzcbkGgpWqXW/w77S+l+L9UGyaYU8I5jWxrtSAbzxLXk82BbbRs9VUapJncL8
 FPl6VCl5IwSU/FrGtTuzub0adSkyfrER9/o6Bd24xxtphGGaKU9nMeKxoU+9S1bh8K
 RCXVhwrCSLRw7pcnFFUbTLn33S83c51XqhdZETNH2sME24xUGRzoqyX+A2QAoG+c0g
 rAhM3ks6efd0QBA/xZknJv2wVN2N8oxQZw4nX2q9IZlR/V0ssBjAxFCgYKF8n7se9r
 zqvQynWmc3A2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gMhF1tSz
Subject: [Buildroot] [PATCH 1/4] package/pipewire: bump version to 1.6.0
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
cGV3aXJlLy0vYmxvYi8xLjYuMC9ORVdTCgpmZm1wZWcgc3VwcG9ydCBuZWVkcyBzd3NjYWxlIHN1
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
cGlwZXdpcmUvcGlwZXdpcmUuaGFzaAppbmRleCAyZTZhOWFlM2FhLi4yNjM5ZmM5YjQ0IDEwMDY0
NAotLS0gYS9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLmhhc2gKKysrIGIvcGFja2FnZS9waXBl
d2lyZS9waXBld2lyZS5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
LXNoYTI1NiAgNzY3MGY2MTcyMjBjYzA1Mzk0OGZjOGYyYzFmZjc4ODE5MjQ3OWVmNWQ0ZjM3M2Q4
NzhhYzhhN2NhYjc2YTcxYyAgcGlwZXdpcmUtMS4yLjgudGFyLmJ6Mgorc2hhMjU2ICAzYWRlNjQ3
MDgyOGNhNzZhN2ExN2ZkMzE3NGQ4OWJiYjQzNWEzNGU4MWU0YmE5MDY0NjcwYTcxMWQyZDgxNmEw
ICBwaXBld2lyZS0xLjYuMC50YXIuYnoyCiBzaGEyNTYgIDg5MDljMzE5YTdlMjdkYmIzM2ExNWI5
MDM1Zjg5YWIzYjdiMmY2YTEyZjhiY2RkYzc1NTIwNmE4ZGIxYWRhNDQgIENPUFlJTkcKIHNoYTI1
NiAgYmU0YmU1ZDc3NDI0ODMzZWRmMzFmNTNmYzFmMWNlY2I2OTk2YjllMmQ3NDdkOWU2ZmI4Zjg3
ODM2MmViYzkyYiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXBld2lyZS9waXBld2ly
ZS5tayBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUubWsKaW5kZXggYzFkYzJhYTBjYy4uNzM3
NzljZGRiYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9waXBld2lyZS9waXBld2lyZS5taworKysgYi9w
YWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotUElQRVdJUkVfVkVSU0lPTiA9IDEuMi44CitQSVBFV0lSRV9WRVJT
SU9OID0gMS42LjAKIFBJUEVXSVJFX1NPVVJDRSA9IHBpcGV3aXJlLSQoUElQRVdJUkVfVkVSU0lP
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
