Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C2ACD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC2F584E54;
	Sun, 31 May 2026 06:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2usBfDz5aDEj; Sun, 31 May 2026 06:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C88984E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208731;
	bh=l0xhsUikPufs7xDkxT392VZfAuVw325Vqa2YKFgz6tY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h90AZR4wJw8XBCwYF/ZbFZQ33WfWZYdl+Ite3dzhfX76z1KVABNMtUYg2X5iYrT2o
	 B6+0l4JEPw4F9oYELtezyhhtJLN8XBjSJjAQ7mKGDiRM+6J+B7TX8pk2XrYzToMPlb
	 TEpdsmVD+k7xela8VWBKqs4j/jbwJFrVsuDD4jTGSmpq84bPjTHdsvM6jDq7bSUKqs
	 aVe5HD7q8/J5FdLL5bog119ae7bNecSJekd4MytAQZtwdjLgcGLpNGo2f9KSCGGt9l
	 a4u60XoULvBdjIKKxCBjsZ8oJRgyIkLQ1dH2vBlt3qdyI9xINnmfyKRXPaC/HVMcrm
	 Im+SmGr4JvseA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C88984E5C;
	Sun, 31 May 2026 06:25:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 167D7389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08479429C2
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJS6hNGQwQ6b for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:25:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA54F429BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA54F429BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA54F429BE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B592FA4C115A;
 Sun, 31 May 2026 08:25:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50040)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTZby-000000000BO-33DC;
 Sun, 31 May 2026 06:25:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 31 May 2026 08:25:23 +0200
Message-ID: <20260531062526.7792-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780208726;
 bh=s0Sm/9w10exaDwl8JjRMQcxgu2fh6YLVkWu4Akm3GBM=;
 h=From:To:Cc:Subject:Date:From;
 b=j2nIc80K2VTx4OCya0M5hg9OAIjttXozWVjgMXhMznPypHje9WHVilpaN3e4SgfpN
 FsL8CKWxdwd6lB6/nCy21/KYohMWImzQf2HDL4fB1oTT3MbOroAWQNK31TeOOuKKx+
 ya/0YjaVc0MDVvxy99Qg4Qk+TzbSVgspAmEfFuSw1vCYxyhVvcZYRkVepk5+Dmds5d
 ENhCjEK7fAdBhnzk+4mnj26dzTX+pf3ewwxCrZ4UQFv5aofBVT0OSlDQmY8qpWcfP2
 Rb3w4uMpMWKB+pneaDVvDeWqxXO6M8q1ijhuG3S8AgC9Skdo/+tLD2MfecsA8/sbso
 bZRiZgKny5kGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=j2nIc80K
Subject: [Buildroot] [PATCH/next v2 1/4] package/pipewire: bump version to
 1.6.6
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
cGV3aXJlLy0vYmxvYi8xLjYuNi9ORVdTCgpmZm1wZWcgc3VwcG9ydCBuZWVkcyBzd3NjYWxlIHN1
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
Ci0tLQp2MjogR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9ia3Vo
bHMvYnVpbGRyb290Ly0vY29tbWl0cy8xMzI5YTEzMDdiMmNhZWI5ODliOTBmNTIyODlkMmRlY2Zj
NGY2Y2UxCgogcGFja2FnZS9waXBld2lyZS9Db25maWcuaW4gICAgIHwgMSArCiBwYWNrYWdlL3Bp
cGV3aXJlL3BpcGV3aXJlLmhhc2ggfCAyICstCiBwYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1r
ICAgfCA5ICsrKysrLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXBld2lyZS9Db25maWcuaW4gYi9wYWNr
YWdlL3BpcGV3aXJlL0NvbmZpZy5pbgppbmRleCA5ZDJkZTZjODY2Li4zOGEzMjFkNTAwIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3BpcGV3aXJlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3BpcGV3aXJl
L0NvbmZpZy5pbgpAQCAtNyw2ICs3LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BJUEVXSVJFCiAJ
c2VsZWN0IEJSMl9QQUNLQUdFX0FMU0FfTElCX1VDTSBpZiBCUjJfUEFDS0FHRV9BTFNBX0xJQgog
CXNlbGVjdCBCUjJfUEFDS0FHRV9BTFNBX0xJQl9TRVEgaWYgQlIyX1BBQ0tBR0VfQUxTQV9MSUIK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfQkxVRVo1X1VUSUxTX1BMVUdJTlNfQVVESU8gaWYgQlIyX1BB
Q0tBR0VfQkxVRVo1X1VUSUxTICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9GRk1QRUdf
U1dTQ0FMRSBpZiBCUjJfUEFDS0FHRV9GRk1QRUcKIAloZWxwCiAJICBQaXBlV2lyZSBpcyBhIHNl
cnZlciBhbmQgdXNlciBzcGFjZSBBUEkgdG8gZGVhbCB3aXRoCiAJICBtdWx0aW1lZGlhIHBpcGVs
aW5lcy4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUuaGFzaCBiL3BhY2th
Z2UvcGlwZXdpcmUvcGlwZXdpcmUuaGFzaAppbmRleCAyZTZhOWFlM2FhLi44ZTcwMWJmZDRiIDEw
MDY0NAotLS0gYS9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLmhhc2gKKysrIGIvcGFja2FnZS9w
aXBld2lyZS9waXBld2lyZS5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBMb2NhbGx5IGNhbGN1bGF0
ZWQKLXNoYTI1NiAgNzY3MGY2MTcyMjBjYzA1Mzk0OGZjOGYyYzFmZjc4ODE5MjQ3OWVmNWQ0ZjM3
M2Q4NzhhYzhhN2NhYjc2YTcxYyAgcGlwZXdpcmUtMS4yLjgudGFyLmJ6Mgorc2hhMjU2ICAyZmRm
MDczODY5YmQxNzFkMjlhOTJkYzY4NTc5Nzk4NjRiNTNlM2RjMWE3OWFjNzZjMTVkYjc4ZTViMTJk
OWY4ICBwaXBld2lyZS0xLjYuNi50YXIuYnoyCiBzaGEyNTYgIDg5MDljMzE5YTdlMjdkYmIzM2Ex
NWI5MDM1Zjg5YWIzYjdiMmY2YTEyZjhiY2RkYzc1NTIwNmE4ZGIxYWRhNDQgIENPUFlJTkcKIHNo
YTI1NiAgYmU0YmU1ZDc3NDI0ODMzZWRmMzFmNTNmYzFmMWNlY2I2OTk2YjllMmQ3NDdkOWU2ZmI4
Zjg3ODM2MmViYzkyYiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXBld2lyZS9waXBl
d2lyZS5tayBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUubWsKaW5kZXggYzFkYzJhYTBjYy4u
YzUxMjdiOWE5ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9waXBld2lyZS9waXBld2lyZS5taworKysg
Yi9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotUElQRVdJUkVfVkVSU0lPTiA9IDEuMi44CitQSVBFV0lSRV9W
RVJTSU9OID0gMS42LjYKIFBJUEVXSVJFX1NPVVJDRSA9IHBpcGV3aXJlLSQoUElQRVdJUkVfVkVS
U0lPTikudGFyLmJ6MgogUElQRVdJUkVfU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9waXBld2lyZS9waXBld2lyZS8tL2FyY2hpdmUvJChQSVBFV0lSRV9WRVJTSU9OKQogUElQ
RVdJUkVfTElDRU5TRSA9IE1JVCwgTEdQTC0yLjErIChsaWJzcGEtYWxzYSksIEdQTC0yLjAgKGxp
YmphY2tzZXJ2ZXIpCkBAIC03MCwxMyArNzAsMTMgQEAgZW5kaWYKIAogaWZlcSAoJChCUjJfUEFD
S0FHRV9TWVNURU1EKSx5KQogUElQRVdJUkVfQ09ORl9PUFRTICs9IFwKLQktRHN5c3RlbWQ9ZW5h
YmxlZCBcCisJLURsaWJzeXN0ZW1kPWVuYWJsZWQgXAogCS1Ec3lzdGVtZC1zeXN0ZW0tc2Vydmlj
ZT1lbmFibGVkIFwKIAktRHN5c3RlbWQtdXNlci1zZXJ2aWNlPWVuYWJsZWQKIFBJUEVXSVJFX0RF
UEVOREVOQ0lFUyArPSBzeXN0ZW1kCiBlbHNlCiBQSVBFV0lSRV9DT05GX09QVFMgKz0gXAotCS1E
c3lzdGVtZD1kaXNhYmxlZCBcCisJLURsaWJzeXN0ZW1kPWRpc2FibGVkIFwKIAktRHN5c3RlbWQt
c3lzdGVtLXNlcnZpY2U9ZGlzYWJsZWQgXAogCS1Ec3lzdGVtZC11c2VyLXNlcnZpY2U9ZGlzYWJs
ZWQKIGVuZGlmCkBAIC0xMDAsNyArMTAwLDggQEAgZWxzZQogUElQRVdJUkVfQ09ORl9PUFRTICs9
IC1EYXZhaGk9ZGlzYWJsZWQKIGVuZGlmCiAKLWlmZXEgKCQoQlIyX1BBQ0tBR0VfSkFDSzIpLHkp
CisjIHVDbGliYyBkb2VzIG5vdCBpbXBsZW1lbnQgdGhyZWFkX2xvY2FsCitpZmVxICgkKEJSMl9Q
QUNLQUdFX0pBQ0syKTokKEJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMpLHk6KQogUElQRVdJUkVf
Q09ORl9PUFRTICs9IC1EcGlwZXdpcmUtamFjaz1lbmFibGVkIC1EamFjaz1lbmFibGVkCiBQSVBF
V0lSRV9ERVBFTkRFTkNJRVMgKz0gamFjazIKIGVsc2UKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
