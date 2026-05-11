Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145AECD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 18:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B799940740;
	Mon, 11 May 2026 18:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lqsw5nnAVcYK; Mon, 11 May 2026 18:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 996B94073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778523443;
	bh=tfJrqif6Xos8yRimHC3DkFUy57g24Fzx3NrMe42mQZs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K3vBKJzzdBxhwRVVk78oI+2uz/9vjfgs5j6Pp9WllbbhiETTX+J4Y70IyPcmrFORK
	 CTIVVfB3VD9v7/nMwP5jBjZeyjhRnHp7E8AZRr5Dkbo1duL+1NwGnXOjUZpiuRCNxj
	 wwTIb0kOposrzO+L/+czir7ZZ+C7WXmPLYe5LY83BlgjuDkmpce9E+pKcnSNT+6T0k
	 6oOXwcNCY1bCTqSRBToiDh8RHvi2zKr1xOju49uvj18WJ7W+5KnpeBihRiBD8k7rIh
	 7YGdGr3cagiXbryL94TcPKqaQid1qnstHnalCTf7tl2a+cGEJ0G/ovpp38eSSOqk5d
	 Ce41Cjenp2t3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 996B94073A;
	Mon, 11 May 2026 18:17:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7532D272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A8FD40065
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9Mmo2OyxRwI for <buildroot@buildroot.org>;
 Mon, 11 May 2026 18:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A97874005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A97874005E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A97874005E
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:17:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08079A4C335E;
 Mon, 11 May 2026 20:17:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58712)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMVBs-000000006BM-1B4r;
 Mon, 11 May 2026 18:17:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 May 2026 20:17:13 +0200
Message-ID: <20260511181716.2258868-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778523437;
 bh=0m1hK9LM8Ztv9SM/wTinQfKav1micnMATrjdt3u8qHE=;
 h=From:To:Cc:Subject:Date:From;
 b=vlQqY0eBHPsW85m6Q0tDlw833a94xjluwDwA+EoF8Z63FVXOkzZ9TYpipAlp3fL3u
 MQx0Vf2OHZuVG5YbML5PwZNBUHtkrUdbAkpIWoKKAFpZrdIsGxk6ex2GVhU0NU9WYV
 pZFnuqYXRxjGaASN50hpzBaipma3UmaQuWrdfhOPdQzEZvD55XmOoVRd6Q8AJW9AN3
 ur4Bln6GlhsVXHwrTC6WzvxnLP+ZAGQEQQ8LJlgQ6DpMjBi5QxafgV6QUmmQZHSxpn
 DbNMc05gywwzwK8yK7+a5J+qTKt0Gqt4p+ZJzCLNws2Mf25vYRbjm9xvfvnGWNaCzf
 RmGxtFYc8Mzug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vlQqY0eB
Subject: [Buildroot] [PATCH 1/4] package/pipewire: bump version to 1.6.4
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
cGV3aXJlLy0vYmxvYi8xLjYuNC9ORVdTCgpmZm1wZWcgc3VwcG9ydCBuZWVkcyBzd3NjYWxlIHN1
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
cGlwZXdpcmUvcGlwZXdpcmUuaGFzaAppbmRleCAyZTZhOWFlM2FhLi4zYWZmMWE1NDgxIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLmhhc2gKKysrIGIvcGFja2FnZS9waXBl
d2lyZS9waXBld2lyZS5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
LXNoYTI1NiAgNzY3MGY2MTcyMjBjYzA1Mzk0OGZjOGYyYzFmZjc4ODE5MjQ3OWVmNWQ0ZjM3M2Q4
NzhhYzhhN2NhYjc2YTcxYyAgcGlwZXdpcmUtMS4yLjgudGFyLmJ6Mgorc2hhMjU2ICAyZmNlM2Fi
ZDJjOGJjODliZmZjOTQzNWZiOWU0ZTI4NmE1MDlhYmNmNDQ3OWVhZmM0NWQyZDgxMjc1YmFhYTYx
ICBwaXBld2lyZS0xLjYuNC50YXIuYnoyCiBzaGEyNTYgIDg5MDljMzE5YTdlMjdkYmIzM2ExNWI5
MDM1Zjg5YWIzYjdiMmY2YTEyZjhiY2RkYzc1NTIwNmE4ZGIxYWRhNDQgIENPUFlJTkcKIHNoYTI1
NiAgYmU0YmU1ZDc3NDI0ODMzZWRmMzFmNTNmYzFmMWNlY2I2OTk2YjllMmQ3NDdkOWU2ZmI4Zjg3
ODM2MmViYzkyYiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXBld2lyZS9waXBld2ly
ZS5tayBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUubWsKaW5kZXggYzFkYzJhYTBjYy4uZjli
YWQ1YTk4OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9waXBld2lyZS9waXBld2lyZS5taworKysgYi9w
YWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotUElQRVdJUkVfVkVSU0lPTiA9IDEuMi44CitQSVBFV0lSRV9WRVJT
SU9OID0gMS42LjQKIFBJUEVXSVJFX1NPVVJDRSA9IHBpcGV3aXJlLSQoUElQRVdJUkVfVkVSU0lP
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
