Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3B1C54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 17:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3D314144F;
	Tue, 27 Feb 2024 17:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOsF0wLNziOF; Tue, 27 Feb 2024 17:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7471541450
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7471541450;
	Tue, 27 Feb 2024 17:49:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30AFB1BF3F2
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 17:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 179F341193
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 17:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWzY6wKANK6k for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 17:48:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4872C402C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4872C402C3
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4872C402C3
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 17:48:58 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so29046a12.0
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 09:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709056136; x=1709660936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qi1lSA5tXIldis0706mDiFey0vziS4+f4JgZmLNVhvI=;
 b=jXdSF5QkWN0LASUdUWyGIsUBd24R4jLa2LYoh/2Hkla/UgGTgoQhHxQm7D78+KfTQo
 zQGrbH3fpyEjqgeYbAxLvKc2KaORvy5EWusjZLG6aNMxQcXVJTjm5uqepYn16b63Ww/A
 hjwXD2vIMVSRGgZYJyvrf3vWBq6za1kYMo0u8/CfjmmZG13oAQ0q0+llbBvrjnThTna7
 fUYtWTgm2vzRwRXGHGQlJ4VL93kISu11Qn/gWx0Khd5nKAReZGrMd+lF1yuptbCG3Pzt
 gRs2k13eByBBigeKn/FHq5gpqdOarobi8YljalqtYbcZ01HDjaSU5kZAX+2IEUhE3Z0Y
 PH0A==
X-Gm-Message-State: AOJu0Yzg6lx0nGFl/2q8QR0rzu2BX9rE+P188kTtlsmhu5Kg7U5kw2In
 AoeYOgPe4Q0F36awcoBF+OV8bXoDXtllt0tqcbjCt7XGQ7CuZzLbmxPLncvY0bbeOaO2JjTBbvL
 9utE=
X-Google-Smtp-Source: AGHT+IER+R29giKwYEOrwUEwyZ/z1oMv407q1mpa+vOlaExtRYgbGScq+TXYBp3n54/Occ3h5URmug==
X-Received: by 2002:a05:6402:4342:b0:564:78bf:a7a7 with SMTP id
 n2-20020a056402434200b0056478bfa7a7mr32959edc.19.1709056136406; 
 Tue, 27 Feb 2024 09:48:56 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa7c408000000b0056200715130sm965264edq.54.2024.02.27.09.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 09:48:55 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 18:48:23 +0100
Message-Id: <20240227174823.3504777-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1709056136; x=1709660936; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qi1lSA5tXIldis0706mDiFey0vziS4+f4JgZmLNVhvI=;
 b=dfmDC47gb7El91rEUpf0T2lQR/J6om2SxNW041Xn372uchJBkoLZbK574pwew15Bc0
 lNUYc4ykOu0USJ+5I87OO+Y9UNRV1hjgPUEFxo2C6ljzqrCD0xE64P9CIN54azoWczWK
 j2s9JmPLcGr4jLkJsqY/fu6pxMvgNP/lW6jmI+kX/TNXq9FAgxPzJfxQAQoanuiOhhSo
 6UxE6o9IorMnJ4SCu3RvOrZU6jK2cE80TUkDZUWGiBhMxR11JNQeptHKbydWyNh2c/mm
 9+wN6dE348IneZkes9aECXCZqLHOeZrxRHzpLaxfu4GrtBnTKGdsrPGe3U8PR/EigUtP
 7ckA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=dfmDC47g
Subject: [Buildroot] [PATCH] linux-firmware: add options for missing Intel
 b/g/n cards
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGZpcm13YXJlIGZpbGVzIGZvciBtaXNzaW5nIGNhcmRzIGZyb20gdGhlIDgwMi4xMWJnbiBw
cm9kdWN0IGxpc3QKaW4gdGhlIExpbnV4IEZpcm13YXJlIFdpa2kgWzFdLgoKU28gZmFyIG9ubHkg
V2lyZWxlc3MtTiAxMzAgYW5kIDEwMzAgd2VyZSBzdXBwb3J0ZWQsIHdoaWNoIHVzZSB0aGUKNjAw
MEcyQiBtaWNyb2NvZGUuCgpbMV0gaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4v
dXNlcnMvZHJpdmVycy9pd2x3aWZpI3N1cHBvcnRlZF9kZXZpY2VzCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0tLQogcGFja2FnZS9saW51eC1maXJtd2Fy
ZS9Db25maWcuaW4gICAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKwogcGFja2Fn
ZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayB8IDMwICsrKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29u
ZmlnLmluCmluZGV4IDkyMGMwYTJlZjEuLjgwZTQ4OWJiZTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bGludXgtZmlybXdhcmUvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29u
ZmlnLmluCkBAIC0xOTUsNiArMTk1LDQyIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJN
V0FSRV9DWVBSRVNTX0NZVzU0WFhYCiAJaGVscAogCSAgRmlybXdhcmUgZmlsZXMgZm9yIHRoZSBD
eXByZXNzIGN5dzU0eHh4IEZ1bGxNQUMuCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJN
V0FSRV9JV0xXSUZJXzEwMAorCWJvb2wgIkludGVsIGl3bHdpZmkgMTAwIgorCWhlbHAKKwkgIEZp
cm13YXJlIGZpbGVzIGZvciB0aGUgSW50ZWwgV2lmaSAxMDAgZGV2aWNlcyBzdXBwb3J0ZWQgYnkK
KwkgIHRoZSBpd2x3aWZpIGtlcm5lbCBkcml2ZXIuCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5V
WF9GSVJNV0FSRV9JV0xXSUZJXzEwNQorCWJvb2wgIkludGVsIGl3bHdpZmkgMTA1IgorCWhlbHAK
KwkgIEZpcm13YXJlIGZpbGVzIGZvciB0aGUgSW50ZWwgV2lmaSAxMDUgZGV2aWNlcyBzdXBwb3J0
ZWQgYnkKKwkgIHRoZSBpd2x3aWZpIGtlcm5lbCBkcml2ZXIuCisKK2NvbmZpZyBCUjJfUEFDS0FH
RV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzEzNQorCWJvb2wgIkludGVsIGl3bHdpZmkgMTM1Igor
CWhlbHAKKwkgIEZpcm13YXJlIGZpbGVzIGZvciB0aGUgSW50ZWwgV2lmaSAxMzUgZGV2aWNlcyBz
dXBwb3J0ZWQgYnkKKwkgIHRoZSBpd2x3aWZpIGtlcm5lbCBkcml2ZXIuCisKK2NvbmZpZyBCUjJf
UEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzEwMDAKKwlib29sICJJbnRlbCBpd2x3aWZp
IDEzNSIKKwloZWxwCisJICBGaXJtd2FyZSBmaWxlcyBmb3IgdGhlIEludGVsIFdpZmkgMTAwMCBk
ZXZpY2VzIHN1cHBvcnRlZCBieQorCSAgdGhlIGl3bHdpZmkga2VybmVsIGRyaXZlci4KKworY29u
ZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0lXTFdJRklfMjAwMAorCWJvb2wgIkludGVs
IGl3bHdpZmkgMjAwMCIKKwloZWxwCisJICBGaXJtd2FyZSBmaWxlcyBmb3IgdGhlIEludGVsIFdp
ZmkgMjAwMCBkZXZpY2VzIHN1cHBvcnRlZCBieQorCSAgdGhlIGl3bHdpZmkga2VybmVsIGRyaXZl
ci4KKworY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0lXTFdJRklfMjAzMAorCWJv
b2wgIkludGVsIGl3bHdpZmkgMjAzMCIKKwloZWxwCisJICBGaXJtd2FyZSBmaWxlcyBmb3IgdGhl
IEludGVsIFdpZmkgMjAzMCBkZXZpY2VzIHN1cHBvcnRlZCBieQorCSAgdGhlIGl3bHdpZmkga2Vy
bmVsIGRyaXZlci4KKwogY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0lXTFdJRklf
MjIwMDAKIAlib29sICJJbnRlbCBpd2x3aWZpIDIyMDAwIgogCWhlbHAKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsgYi9wYWNrYWdlL2xpbnV4LWZp
cm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCmluZGV4IDYwZTg4NjFhYmUuLmIyNWM5NzI2MzQgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKKysrIGIv
cGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawpAQCAtNDg2LDYgKzQ4Niwz
NiBAQCBMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSB3aWw2MjEwLioKIExJTlVYX0ZJUk1XQVJFX0FM
TF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwawogZW5kaWYK
IAoraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzEwMCkseSkKK0xJ
TlVYX0ZJUk1XQVJFX0ZJTEVTICs9IGl3bHdpZmktMTAwLSoudWNvZGUKK0xJTlVYX0ZJUk1XQVJF
X0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZQorZW5kaWYKKwor
aWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzEwNSkseSkKK0xJTlVY
X0ZJUk1XQVJFX0ZJTEVTICs9IGl3bHdpZmktMTA1LSoudWNvZGUKK0xJTlVYX0ZJUk1XQVJFX0FM
TF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZQorZW5kaWYKKworaWZl
cSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzEzNSkseSkKK0xJTlVYX0ZJ
Uk1XQVJFX0ZJTEVTICs9IGl3bHdpZmktMTM1LSoudWNvZGUKK0xJTlVYX0ZJUk1XQVJFX0FMTF9M
SUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZQorZW5kaWYKKworaWZlcSAo
JChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzEwMDApLHkpCitMSU5VWF9GSVJN
V0FSRV9GSUxFUyArPSBpd2x3aWZpLTEwMDAtKi51Y29kZQorTElOVVhfRklSTVdBUkVfQUxMX0xJ
Q0VOU0VfRklMRVMgKz0gTElDRU5DRS5pd2x3aWZpX2Zpcm13YXJlCitlbmRpZgorCitpZmVxICgk
KEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0lXTFdJRklfMjAwMCkseSkKK0xJTlVYX0ZJUk1X
QVJFX0ZJTEVTICs9IGl3bHdpZmktMjAwMC0qLnVjb2RlCitMSU5VWF9GSVJNV0FSRV9BTExfTElD
RU5TRV9GSUxFUyArPSBMSUNFTkNFLml3bHdpZmlfZmlybXdhcmUKK2VuZGlmCisKK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfSVdMV0lGSV8yMDMwKSx5KQorTElOVVhfRklSTVdB
UkVfRklMRVMgKz0gaXdsd2lmaS0yMDMwLSoudWNvZGUKK0xJTlVYX0ZJUk1XQVJFX0FMTF9MSUNF
TlNFX0ZJTEVTICs9IExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZQorZW5kaWYKKwogaWZlcSAoJChC
UjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JV0xXSUZJXzIyMDAwKSx5KQogTElOVVhfRklSTVdB
UkVfRklMRVMgKz0gaXdsd2lmaS1RdVotKi51Y29kZSBpd2x3aWZpLVF1LSoudWNvZGUKIExJTlVY
X0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZQot
LSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
