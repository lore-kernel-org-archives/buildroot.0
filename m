Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E44C0218F
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36B460848;
	Sat,  1 Feb 2025 14:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28FEUE3xVK8c; Sat,  1 Feb 2025 14:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F285C6FB3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F285C6FB3C;
	Sat,  1 Feb 2025 14:51:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D21E17D
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4426785979
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vavB9Sv_EQM6 for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 14:51:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D94A68596A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D94A68596A
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D94A68596A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:38 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5dc5a32c313so541575a12.3
 for <buildroot@buildroot.org>; Sat, 01 Feb 2025 06:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738421496; x=1739026296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=brzJjd8dcMunfUThkjPUBTRfJtuByIJ5MprzWCczvOU=;
 b=bvDIP+MBrE8Vqiz5M+cZaqOj+wQfs29qufgQtvjb45Okm9/ve3cxPr5JLTENbbmp6B
 Tf123FoV11D2G1LSmEVS5nQGgrG+q8zNkbF5ZVqTlgpGaSxtylWk3OusQUghRMJMiA0i
 GwXIPWEm3FZdMK3nN7x7rqQu3Ko+KeFsrK+q/bfN+wBuCl0OjNepLJSBT1oFJoEi04bV
 yYaxETP4GHAZvrYKF1BIhEDzEeRNEzE0ErP33x0Q+BEQiLw9Tnm+fwKwoCgkkJFDoHCL
 Hf9WFMlI3ikrypM6ZF5+pp6Ldr+vedcqGdxCz+EYUyXD3vZHSx9M1sTEj9OrNDJGbQyA
 AwIA==
X-Gm-Message-State: AOJu0YwlLzB5P2/XHRM97WQWUYg6dfHZLVQ0vhDxODtJC3EwiFjRCV07
 f5bJ2mFxlOPo+HczOg9i5l0hNtkwlvN4kG6O+FXNBYJ7btVR9dOkZ1+lhbVFnoM=
X-Gm-Gg: ASbGncvqJhmjCbD+crWVSgzK6EUWQxUZk1M8Tm+tZYGVYHYhbvzJryi1pl1XMQpVijY
 Y+5zmIyXfI+UwKSPN0yiPIrOXFuIDX4sJ3oPYZIdFq+vwY8KDDL+fi6WfPkoDRHAjthmSho7u6A
 yAP5Dkor4Vl8KkvRv1bLRTo8Tk6nT1yEk3ck/uW2dv75PWHMYEmEQ4WrhuifJVln3b+rV98KT4E
 CLXhsun3RhnasPGkrqAxfZWTO01d8d562mzv/NMX870bJ0aVz3vHqyVjLmJV5ajtJ/aQ1sDFLhX
 yrgHL6jdDaRKeC32JosNdpmIiUQ=
X-Google-Smtp-Source: AGHT+IHczGRrn+ADc4Bhc1zoBGVr3DSphob5w2HQgNn2iH+VbF+b0kpMgFhz3si8XHrTtbzKaIfRCw==
X-Received: by 2002:a17:907:1c17:b0:aa5:3e81:5abc with SMTP id
 a640c23a62f3a-ab6e03a4f0bmr472753566b.1.1738421495949; 
 Sat, 01 Feb 2025 06:51:35 -0800 (PST)
Received: from archlinux.. ([2001:67c:1810:f055:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47ceb47sm449514266b.42.2025.02.01.06.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 06:51:34 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  1 Feb 2025 15:51:29 +0100
Message-ID: <20250201145129.921266-3-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201145129.921266-1-gael.portay+rtone@gmail.com>
References: <20250201145129.921266-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738421496; x=1739026296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brzJjd8dcMunfUThkjPUBTRfJtuByIJ5MprzWCczvOU=;
 b=GY4CfRnfcazKUENJS29D6e2whbwz3Mb0Ta7HvO9hAMKlIwQkRFukhd9eJk/ot9PxBo
 Z4HW3P5dkrhYZkcaeTAAHkeXWY2pF6XS6zy5PX3OLXtv302UB0B2476sdJm2/eZYn4M6
 4l/wV0F8v58SYHK93WidsGuSgTJwM8j1DH9H+4byYLJ/ALSzdf0nNJH7HQwM3xkYEQ71
 /eUYNF1SCIEnB0V/mwlEgNDh9/WQfLw0cghjpPNI2/AeI6Avr/00+hv/IpuLuKXDXmCx
 +qx0lSbYK6QiQXLhxE5+wLvLk+q3Kg7Lzvr/tK5cDuemj8dWcyIWomCneOeC4egqMAS6
 byMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GY4CfRnf
Subject: [Buildroot] [PATCH v3 2/2] configs/raspberrypizero2w_64: new
 defconfig
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

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeSBQaSBa
ZXJvIDIgVwooNjQtYml0KS4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0
YXkrcnRvbmVAZ21haWwuY29tPgotLS0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMndf
NjRiaXQudHh0IHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysKIGJvYXJkL3Jhc3BiZXJyeXBp
emVybzJ3LTY0ICAgICAgICAgICAgICAgIHwgIDEgKwogY29uZmlncy9yYXNwYmVycnlwaXplcm8y
d182NF9kZWZjb25maWcgICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDY0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9yYXNwYmVy
cnlwaS9jb25maWdfemVybzJ3XzY0Yml0LnR4dAogY3JlYXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Jh
c3BiZXJyeXBpemVybzJ3LTY0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9yYXNwYmVycnlw
aXplcm8yd182NF9kZWZjb25maWcKCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25m
aWdfemVybzJ3XzY0Yml0LnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMndfNjRi
aXQudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjg4MjA2ZTliMTQK
LS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3XzY0Yml0
LnR4dApAQCAtMCwwICsxLDMyIEBACisjIFBsZWFzZSBub3RlIHRoYXQgdGhpcyBpcyBvbmx5IGEg
c2FtcGxlLCB3ZSByZWNvbW1lbmQgeW91IHRvIGNoYW5nZSBpdCB0byBmaXQKKyMgeW91ciBuZWVk
cy4KKyMgWW91IHNob3VsZCBvdmVycmlkZSB0aGlzIGZpbGUgdXNpbmcgQlIyX1BBQ0tBR0VfUlBJ
X0ZJUk1XQVJFX0NPTkZJR19GSUxFLgorIyBTZWUgaHR0cDovL2J1aWxkcm9vdC5vcmcvbWFudWFs
Lmh0bWwjcm9vdGZzLWN1c3RvbQorIyBhbmQgaHR0cDovL2VsaW51eC5vcmcvUlBpY29uZmlnIGZv
ciBhIGRlc2NyaXB0aW9uIG9mIGNvbmZpZy50eHQgc3ludGF4CisKK3N0YXJ0X2ZpbGU9c3RhcnQu
ZWxmCitmaXh1cF9maWxlPWZpeHVwLmRhdAorCitrZXJuZWw9SW1hZ2UKKworIyBUbyB1c2UgYW4g
ZXh0ZXJuYWwgaW5pdHJhbWZzIGZpbGUKKyNpbml0cmFtZnMgcm9vdGZzLmNwaW8uZ3oKKworIyBE
aXNhYmxlIG92ZXJzY2FuIGFzc3VtaW5nIHRoZSBkaXNwbGF5IHN1cHBvcnRzIGRpc3BsYXlpbmcg
dGhlIGZ1bGwgcmVzb2x1dGlvbgorIyBJZiB0aGUgdGV4dCBzaG93biBvbiB0aGUgc2NyZWVuIGRp
c2FwcGVhcnMgb2ZmIHRoZSBlZGdlLCBjb21tZW50IHRoaXMgb3V0CitkaXNhYmxlX292ZXJzY2Fu
PTEKKworIyBIb3cgbXVjaCBtZW1vcnkgaW4gTUIgdG8gYXNzaWduIHRvIHRoZSBHUFUgb24gUGkg
bW9kZWxzIGhhdmluZworIyAyNTYsIDUxMiBvciAxMDI0IE1CIHRvdGFsIG1lbW9yeQorZ3B1X21l
bV8yNTY9MTAwCitncHVfbWVtXzUxMj0xMDAKK2dwdV9tZW1fMTAyND0xMDAKKworIyBFbmFibGUg
VUFSVDAgZm9yIHNlcmlhbCBjb25zb2xlIG9uIHR0eUFNQTAKK2R0b3ZlcmxheT1taW5pdWFydC1i
dAorCisjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhvdXQgbmVl
ZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKK2R0cGFyYW09a3JuYnQ9b24KKworIyBlbmFibGUgNjRi
aXRzIHN1cHBvcnQKK2FybV82NGJpdD0xCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaXpl
cm8ydy02NCBiL2JvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0Cm5ldyBmaWxlIG1vZGUgMTIwMDAw
CmluZGV4IDAwMDAwMDAwMDAuLmZjZGFmYzgxZWQKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9y
YXNwYmVycnlwaXplcm8ydy02NApAQCAtMCwwICsxIEBACityYXNwYmVycnlwaQpcIE5vIG5ld2xp
bmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndf
NjRfZGVmY29uZmlnIGIvY29uZmlncy9yYXNwYmVycnlwaXplcm8yd182NF9kZWZjb25maWcKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYWEwNzI3MjhhNAotLS0gL2Rldi9u
dWxsCisrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnCkBAIC0wLDAg
KzEsMzEgQEAKK0JSMl9hYXJjaDY0PXkKK0JSMl9BUk1fRlBVX1ZGUFY0PXkKK0JSMl9QQUNLQUdF
X0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82PXkKK0JSMl9UT09MQ0hBSU5fQlVJTERST09U
X0NYWD15CitCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvcmFzcGJlcnJ5cGkvcGF0Y2hlcyIK
K0JSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eQorQlIyX1JPT1RGU19QT1NUX0JVSUxE
X1NDUklQVD0iYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQvcG9zdC1idWlsZC5zaCIKK0JSMl9S
T09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0L3Bvc3Qt
aW1hZ2Uuc2giCitCUjJfTElOVVhfS0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RB
UkJBTEw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxs
IGdpdGh1YixyYXNwYmVycnlwaSxsaW51eCw1NzZjYzEwZTFlZDUwYTllYWNmZmM3YTA1Yzc5NjA1
MWQ3MzQzZWE0KS9saW51eC01NzZjYzEwZTFlZDUwYTllYWNmZmM3YTA1Yzc5NjA1MWQ3MzQzZWE0
LnRhci5neiIKK0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJiY21ycGkzIgorQlIyX0xJTlVY
X0tFUk5FTF9EVFNfU1VQUE9SVD15CitCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0i
YnJvYWRjb20vYmNtMjcxMC1ycGktemVyby0yLXciCitCUjJfTElOVVhfS0VSTkVMX05FRURTX0hP
U1RfT1BFTlNTTD15CitCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RIRVJTPXkKK0JSMl9QQUNL
QUdFX1haPXkKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRT15CitCUjJfUEFDS0FHRV9SUElfRklS
TVdBUkVfQk9PVENPREVfQklOPXkKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9WQVJJQU5UX1BJ
PXkKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DT05GSUdfRklMRT0iYm9hcmQvcmFzcGJlcnJ5
cGl6ZXJvMnctNjQvY29uZmlnX3plcm8yd182NGJpdC50eHQiCitCUjJfUEFDS0FHRV9LTU9EPXkK
K0JSMl9QQUNLQUdFX0tNT0RfVE9PTFM9eQorQlIyX1RBUkdFVF9ST09URlNfRVhUMj15CitCUjJf
VEFSR0VUX1JPT1RGU19FWFQyXzQ9eQorQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBN
IgorIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAorQlIyX1BBQ0tBR0VfSE9TVF9E
T1NGU1RPT0xTPXkKK0JSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQorQlIyX1BBQ0tBR0VfSE9T
VF9LTU9EX1haPXkKK0JSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKLS0gCjIuNDguMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
