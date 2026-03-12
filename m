Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692EB106ACD0
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22B80802E1;
	Thu, 12 Mar 2026 16:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzbw05CmXdud; Thu, 12 Mar 2026 16:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E49802E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773334523;
	bh=l5BaP4vCCYxJLDLtUW7iLQFbicy5iXCmBK6MbOEX8tg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ltbSXCZ2BQNi6noz9MmxFJ8d4R5HUH2qyHSHQUQAC2YWIGpYldVHMOMntUW9BjN+J
	 Z/bo8jtzcMiVF1kOb4o9yirtWHfa7rWueGmamsCsVufW71jPy2PgGT5ymcvXjQktfY
	 sfGXa4uR15WDHfS8Z+uDKfSmE+VXa1Zr7UEPwLs10R8C8dXRi1JZ8buQwd1LoJvAbB
	 DN4V6OEBGDEMO2kAIpJVqrqUm/NVVjKnnxTNzaKbkGrgbcjLlcUyHF1lxBRgnLrmfB
	 zpUdHrJKFRgQ2jBJ3gCu4wh2PATE4QfcEjRY3c4R8KyJLKvCyQebNS5QAQhqvuJDWN
	 tIfkyIY7l97pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E49802E9;
	Thu, 12 Mar 2026 16:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 108DD228
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 022DF40022
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUT12NnfhPFX for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBA1040012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA1040012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBA1040012
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0BDCFA4C0D1B;
 Thu, 12 Mar 2026 17:55:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60208)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0jJf-0000000068u-0C0P;
 Thu, 12 Mar 2026 16:55:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Mar 2026 17:55:15 +0100
Message-ID: <20260312165518.3312453-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773334519;
 bh=LefxYW0+NSd28TuHSIokZcA6De4wovKo6PizYA94rCU=;
 h=From:To:Cc:Subject:Date:From;
 b=UDtouCupv8BI6xcftnDTgF6DgwACJKfCax9Dl0Q4R3R3b7noHab4PZDmwqySIrUkl
 bfPZulAloIpVv3PJ/fstPvJ2FVl0XTk62VZFu4GK4jfo72mU58tJZuJvG2aHlDp3hz
 Y8Ujv3ir7MjrYqUELNoR0H5QK5mgFBKK4cKWWuBT3cMHxO74WfpNa2a+WHaNhQDreF
 I9HHXI5WmT2av28NjfzPSNsbuWIK336r9jbda1fKk9swo2tNVE8udrx4NIvmI294/i
 58MmdlbwB/Rxkt/3U0cgMvZd/SjtZKpjfXcLiZOHYEEMdTYTnoweNIEw1cuK+QO5X5
 m/u/N8Eb6tkuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UDtouCup
Subject: [Buildroot] [PATCH v2 1/4] package/pipewire: bump version to 1.6.1
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
cGV3aXJlLy0vYmxvYi8xLjYuMS9ORVdTCgpmZm1wZWcgc3VwcG9ydCBuZWVkcyBzd3NjYWxlIHN1
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
Ci0tLQp2MjogYnVtcGVkIHRvIDEuNi4xCgogcGFja2FnZS9waXBld2lyZS9Db25maWcuaW4gICAg
IHwgMSArCiBwYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLmhhc2ggfCAyICstCiBwYWNrYWdlL3Bp
cGV3aXJlL3BpcGV3aXJlLm1rICAgfCA5ICsrKysrLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXBld2ly
ZS9Db25maWcuaW4gYi9wYWNrYWdlL3BpcGV3aXJlL0NvbmZpZy5pbgppbmRleCA5ZDJkZTZjODY2
Li4zOGEzMjFkNTAwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3BpcGV3aXJlL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL3BpcGV3aXJlL0NvbmZpZy5pbgpAQCAtNyw2ICs3LDcgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX1BJUEVXSVJFCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0FMU0FfTElCX1VDTSBpZiBCUjJf
UEFDS0FHRV9BTFNBX0xJQgogCXNlbGVjdCBCUjJfUEFDS0FHRV9BTFNBX0xJQl9TRVEgaWYgQlIy
X1BBQ0tBR0VfQUxTQV9MSUIKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQkxVRVo1X1VUSUxTX1BMVUdJ
TlNfQVVESU8gaWYgQlIyX1BBQ0tBR0VfQkxVRVo1X1VUSUxTICMgcnVudGltZQorCXNlbGVjdCBC
UjJfUEFDS0FHRV9GRk1QRUdfU1dTQ0FMRSBpZiBCUjJfUEFDS0FHRV9GRk1QRUcKIAloZWxwCiAJ
ICBQaXBlV2lyZSBpcyBhIHNlcnZlciBhbmQgdXNlciBzcGFjZSBBUEkgdG8gZGVhbCB3aXRoCiAJ
ICBtdWx0aW1lZGlhIHBpcGVsaW5lcy4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGlwZXdpcmUvcGlw
ZXdpcmUuaGFzaCBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUuaGFzaAppbmRleCAyZTZhOWFl
M2FhLi5hYmFlMTY5ZjAxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLmhh
c2gKKysrIGIvcGFja2FnZS9waXBld2lyZS9waXBld2lyZS5oYXNoCkBAIC0xLDQgKzEsNCBAQAog
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNzY3MGY2MTcyMjBjYzA1Mzk0OGZjOGYyYzFm
Zjc4ODE5MjQ3OWVmNWQ0ZjM3M2Q4NzhhYzhhN2NhYjc2YTcxYyAgcGlwZXdpcmUtMS4yLjgudGFy
LmJ6Mgorc2hhMjU2ICAwZDI4ZDY1OThiNTI1ZmVlYmU0OGZlMjA5ZDM5YzhmNzVmMzNmMWU1Yzkw
ZTFkNGVjMWZhMmYwZGJmY2YyODc2ICBwaXBld2lyZS0xLjYuMS50YXIuYnoyCiBzaGEyNTYgIDg5
MDljMzE5YTdlMjdkYmIzM2ExNWI5MDM1Zjg5YWIzYjdiMmY2YTEyZjhiY2RkYzc1NTIwNmE4ZGIx
YWRhNDQgIENPUFlJTkcKIHNoYTI1NiAgYmU0YmU1ZDc3NDI0ODMzZWRmMzFmNTNmYzFmMWNlY2I2
OTk2YjllMmQ3NDdkOWU2ZmI4Zjg3ODM2MmViYzkyYiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9waXBld2lyZS9waXBld2lyZS5tayBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUubWsK
aW5kZXggYzFkYzJhYTBjYy4uMjEzMWI5MTZjYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9waXBld2ly
ZS9waXBld2lyZS5taworKysgYi9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rCkBAIC00LDcg
KzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUElQRVdJUkVfVkVSU0lPTiA9
IDEuMi44CitQSVBFV0lSRV9WRVJTSU9OID0gMS42LjEKIFBJUEVXSVJFX1NPVVJDRSA9IHBpcGV3
aXJlLSQoUElQRVdJUkVfVkVSU0lPTikudGFyLmJ6MgogUElQRVdJUkVfU0lURSA9IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXBld2lyZS9waXBld2lyZS8tL2FyY2hpdmUvJChQSVBF
V0lSRV9WRVJTSU9OKQogUElQRVdJUkVfTElDRU5TRSA9IE1JVCwgTEdQTC0yLjErIChsaWJzcGEt
YWxzYSksIEdQTC0yLjAgKGxpYmphY2tzZXJ2ZXIpCkBAIC03MCwxMyArNzAsMTMgQEAgZW5kaWYK
IAogaWZlcSAoJChCUjJfUEFDS0FHRV9TWVNURU1EKSx5KQogUElQRVdJUkVfQ09ORl9PUFRTICs9
IFwKLQktRHN5c3RlbWQ9ZW5hYmxlZCBcCisJLURsaWJzeXN0ZW1kPWVuYWJsZWQgXAogCS1Ec3lz
dGVtZC1zeXN0ZW0tc2VydmljZT1lbmFibGVkIFwKIAktRHN5c3RlbWQtdXNlci1zZXJ2aWNlPWVu
YWJsZWQKIFBJUEVXSVJFX0RFUEVOREVOQ0lFUyArPSBzeXN0ZW1kCiBlbHNlCiBQSVBFV0lSRV9D
T05GX09QVFMgKz0gXAotCS1Ec3lzdGVtZD1kaXNhYmxlZCBcCisJLURsaWJzeXN0ZW1kPWRpc2Fi
bGVkIFwKIAktRHN5c3RlbWQtc3lzdGVtLXNlcnZpY2U9ZGlzYWJsZWQgXAogCS1Ec3lzdGVtZC11
c2VyLXNlcnZpY2U9ZGlzYWJsZWQKIGVuZGlmCkBAIC0xMDAsNyArMTAwLDggQEAgZWxzZQogUElQ
RVdJUkVfQ09ORl9PUFRTICs9IC1EYXZhaGk9ZGlzYWJsZWQKIGVuZGlmCiAKLWlmZXEgKCQoQlIy
X1BBQ0tBR0VfSkFDSzIpLHkpCisjIHVDbGliYyBkb2VzIG5vdCBpbXBsZW1lbnQgdGhyZWFkX2xv
Y2FsCitpZmVxICgkKEJSMl9QQUNLQUdFX0pBQ0syKTokKEJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJ
QkMpLHk6KQogUElQRVdJUkVfQ09ORl9PUFRTICs9IC1EcGlwZXdpcmUtamFjaz1lbmFibGVkIC1E
amFjaz1lbmFibGVkCiBQSVBFV0lSRV9ERVBFTkRFTkNJRVMgKz0gamFjazIKIGVsc2UKLS0gCjIu
NDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
