Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855DCCAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4283A42737;
	Thu, 11 Sep 2025 21:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N56qjq9um-ja; Thu, 11 Sep 2025 21:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3294A42734
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3294A42734;
	Thu, 11 Sep 2025 21:28:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 307F612D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1769D84D6F
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpQrVUiDBrc3 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2923C84D6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2923C84D6A
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2923C84D6A
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3e4b5aee522so819316f8f.1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626080; x=1758230880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pwQEE6iTpbrNtu3Tk6Gr3pB8HRLi16C8/PIUl8XAEz0=;
 b=lsyqUV4VL/yiqJJvmqYptRoywhRM0iIiA9MsO9VvrTFBb58d/lGPeFApEAz733W8PA
 je29tgF2A6LbXs2qXkud0/Au4U0hBZMCsbrWOAYnnOXVsUvFOfvVSRRLir89TavnG+tj
 S12hGFbwJBs7/hqi6rBZRUCTP9ILRH5Ozn8D7SUHWIULziTEWU9yFczgKu28OI8vmZt0
 0fpqbSgszhN0nrZrBAL4lh/4hsurg+hxxYZcxDVDE+tfPWsqKacVMk3DLBPfw/SmtSko
 BNg+uY2vXfzJ/fmN0Qze0X91cwIz106YoNt8hXYPQZNqvue5XMq3fbSjFUqg67V2VfQd
 BzNg==
X-Gm-Message-State: AOJu0YwACQHjXVbQHdr/UGmhexzVNDgvs0gFDG2GYmZbTt5bMXGExYDP
 CKpwViBI4xE+GAHdxoW0vc3AUGRyFLypmvXD3Qxc8nhkQ0n4h9N3fw+5pZqqt6EPt3UkjMIsbGf
 UWI+mov4=
X-Gm-Gg: ASbGnctudn5zmTpFqrjT10gfxfwKdUKUAOrwiUIAGWsigKtW4MFvkm6t95NhSer2nVj
 om9QUi40h42I3ZUphXwDdy4JMxHqKYG7SQP4br9t18qBabo9jDyRSM+pIPONF18ZdrNO2EKkOis
 SB5TmG6eVjn6K/1Lt3qA6kcexlBtM2pilO3jx2ZMy/hBrcJo8rbH/R6lSVCFK4SbCuMYTgJLUtq
 J7yZYR7L19ZQOLpNffzxXV0aUyDBgwaMxBi2IhN9vg7B8IhCwILasD32K1eNo3MfX47dSAyhzHj
 wNFGseiCIyyGNf2+fGl5WxOcXni95vGP4dhQBilrtYf3wgGmmLD437C64j25MZKMqnko4FzpEjC
 j4hMqIZrMRKzp+ngpeskDNiU=
X-Google-Smtp-Source: AGHT+IGq2qq39seNSw4mNgjogtjR+RYJluHMUNiMqHffJjDcwG8SV8hj9WMcouer2wBBoRbkGT0L/A==
X-Received: by 2002:a05:6000:178e:b0:3e4:957d:d00 with SMTP id
 ffacd0b85a97d-3e7659f5dd6mr660197f8f.58.1757626080544; 
 Thu, 11 Sep 2025 14:28:00 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607d7ff9sm3820124f8f.51.2025.09.11.14.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4CCA15F856;
 Thu, 11 Sep 2025 22:27:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:44 +0100
Message-ID: <20250911212752.266940-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626080; x=1758230880; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pwQEE6iTpbrNtu3Tk6Gr3pB8HRLi16C8/PIUl8XAEz0=;
 b=IJNga5z9+mX0KJj9kMahUQplBmXj2hvPmaafmUM/ivC8dX9OyD8ZXCMsm3dVbOV88H
 V18pqRhTbUud572aKm+z7tZ+CpwUr/0UvVSXljRe7juosy4OwLDO7i4dSYV5fe4b1mbJ
 WxnmTjvhc3E/ZUSRVtFvhArmqyD7yEkVMcz3N2eV/REMiSany1Su9gtuE5Xf16bG7iP1
 ZwqNyU195dXlBFj4eB2ARQCZspF5jE0DGa06SCrneIk6F/9IEENspQ22nwn5/36XAtQ8
 Ix5jwndzYJnZWmD7vPXNADYlV6R4YkDTns8+Xx0UlLTAad46BbRXRb7IUPVgNIjmo33b
 Bg7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=IJNga5z9
Subject: [Buildroot] [PATCH v5 4/9] package/qemu: introduce kvm and tcg
 system options
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBidWlsZGluZyBzeXN0ZW0gYmluYXJpZXMgeW91IG1heSBub3QgZXZlbiB3YW50IFRDRyBz
dXBwb3J0IGlmIHlvdQphcmUgb25seSBpbnRlbmRpbmcgdG8gdXNlIEtWTS4gUHJvdmlkZSB0aGUg
b3B0aW9ucyBzbyB0aGUgdXNlciBjYW4Kc2VsZWN0IG9ubHkgd2hhdCB0aGV5IG5lZWQuCgpXaXRo
IG9ubHkgS1ZNIHNlbGVjdGVkIHRoZSBRRU1VIGJ1aWxkIHdpbGwgZ2VuZXJhbGx5IG9ubHkgYnVp
bGQgdGhlCmJpbmFyeSBmb3IgeW91ciB0YXJnZXQgc3lzdGVtLiBXZSBrZWVwIFRDRyBzdXBwb3J0
IG9uIGJ5IGRlZmF1bHQgc28gYXMKbm90IHRvIGJyZWFrIGV4aXN0aW5nIGRlZmNvbmZpZ3MuCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLS0K
djIKICAtIGNsZWFuLXVwIHdoaXRlc3BhY2UKICAtIGRlZmF1bHQgVENHPXkKICAtIGZpeCB0eXBv
cwogIC0gZHJvcCAtLWVuYWJsZS1rdm0gZnJvbSBkZWZhdWx0IGNvbmZpZ3VyZSBsaXN0Ci0tLQog
cGFja2FnZS9xZW11L0NvbmZpZy5pbiB8IDIzICsrKysrKysrKysrKysrKysrKy0tLS0tCiBwYWNr
YWdlL3FlbXUvcWVtdS5tayAgIHwgMTQgKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MzEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Fl
bXUvQ29uZmlnLmluIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgppbmRleCBmZjc0MjNiYzRjLi5h
ZDUzZjEzM2UzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCisrKyBiL3BhY2th
Z2UvcWVtdS9Db25maWcuaW4KQEAgLTU5LDYgKzU5LDIwIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9R
RU1VX1NZU1RFTQogCiBpZiBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTQogCitjb25maWcgQlIyX1BB
Q0tBR0VfUUVNVV9TWVNURU1fS1ZNCisJYm9vbCAiRW5hYmxlIEtWTSBzeXN0ZW0gdmlydHVhbGlz
YXRpb24iCisJZGVmYXVsdCB5CisJaGVscAorCSAgU2F5ICd5JyBoZXJlIHRvIGVuYWJsZSBhIFFF
TVUgd2l0aCBLVk0gc3VwcG9ydC4KKwkgIElmIHVuc3VyZSwgc2F5ICd5JworCitjb25maWcgQlIy
X1BBQ0tBR0VfUUVNVV9TWVNURU1fVENHCisJYm9vbCAiRW5hYmxlIFRDRyBzeXN0ZW0gZW11bGF0
aW9uIgorCWRlZmF1bHQgeQorCWhlbHAKKwkgIFNheSAneScgaGVyZSB0byBlbmFibGUgUUVNVSBi
aW5hcmllcyB3aGljaCBjYW4gZW11bGF0ZSBmb3JlaWduCisJICBhcmNoaXRlY3R1cmVzIHVzaW5n
IHRoZSBUQ0cgSklULgorCiBjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9CTE9CUwogCWJvb2wgIklu
c3RhbGwgYmluYXJ5IGJsb2JzIgogCWRlZmF1bHQgeQpAQCAtMTMwLDEyICsxNDQsMTEgQEAgY29u
ZmlnIEJSMl9QQUNLQUdFX1FFTVVfTElOVVhfVVNFUgogCiBjb25maWcgQlIyX1BBQ0tBR0VfUUVN
VV9DSE9PU0VfVEFSR0VUUwogCWJvb2wgIlNlbGVjdCBpbmRpdmlkdWFsIGVtdWxhdG9yIHRhcmdl
dHMiCi0JZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSB8fCBCUjJfUEFDS0FHRV9R
RU1VX0xJTlVYX1VTRVIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNX1RDRyB8
fCBCUjJfUEFDS0FHRV9RRU1VX0xJTlVYX1VTRVIKIAloZWxwCi0JICBCeSBkZWZhdWx0LCBhbGwg
dGFyZ2V0cyAoc3lzdGVtIGFuZC9vciB1c2VyLCBzdWJqZWN0IHRvIHRoZQotCSAgY29ycmVzcG9u
ZGluZyBvcHRpb25zLCBhYm92ZSkgYXJlIGJ1aWx0LiBJZiB5b3Ugb25seSBuZWVkIGEKLQkgIHN1
YnNldCBvZiB0aGUgZW11bGF0ZWQgdGFyZ2V0cywgc2F5ICd5JyBoZXJlIGFuZCBlbmFibGUgYXQK
LQkgIGxlYXN0IG9uZSB0YXJnZXQsIGJlbG93LgorCSAgQnkgZGVmYXVsdCwgYWxsIHRhcmdldHMg
c3lzdGVtIHRhcmdldHMgYXJlIGJ1aWx0IHdoZW4gVENHIGlzCisJICBlbmFibGVkLiBJZiB5b3Ug
b25seSBuZWVkIGEgc3Vic2V0IG9mIHRoZSBlbXVsYXRlZCB0YXJnZXRzLAorCSAgc2F5ICd5JyBo
ZXJlIGFuZCBlbmFibGUgYXQgbGVhc3Qgb25lIHRhcmdldCwgYmVsb3cuCiAKIGlmIEJSMl9QQUNL
QUdFX1FFTVVfQ0hPT1NFX1RBUkdFVFMKIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUu
bWsgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawppbmRleCBmZGM4NTkxZTU0Li41ZTYzMTY2NTQ1IDEw
MDY0NAotLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5taworKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5t
awpAQCAtNDgsNiArNDgsMTkgQEAgUUVNVV9WQVJTID0gTElCVE9PTD0kKEhPU1RfRElSKS9iaW4v
bGlidG9vbAogaWZlcSAoJChCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSkseSkKIFFFTVVfREVQRU5E
RU5DSUVTICs9IHBpeG1hbgogUUVNVV9PUFRTICs9IC0tZW5hYmxlLXN5c3RlbQorCitpZmVxICgk
KEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNX0tWTSksIHkpCitRRU1VX09QVFMgKz0gLS1lbmFibGUt
a3ZtCitlbHNlCitRRU1VX09QVFMgKz0gLS1kaXNhYmxlLWt2bQorZW5kaWYKKworaWZlcSAoJChC
UjJfUEFDS0FHRV9RRU1VX1NZU1RFTV9UQ0cpLCB5KQorUUVNVV9PUFRTICs9IC0tZW5hYmxlLXRj
ZworZWxzZQorUUVNVV9PUFRTICs9IC0tZGlzYWJsZS10Y2cKK2VuZGlmCisKIFFFTVVfVEFSR0VU
X0xJU1RfJChCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9BQVJDSDY0KSArPSBhYXJjaDY0LXNvZnRt
bXUKIFFFTVVfVEFSR0VUX0xJU1RfJChCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9BTFBIQSkgKz0g
YWxwaGEtc29mdG1tdQogUUVNVV9UQVJHRVRfTElTVF8kKEJSMl9QQUNLQUdFX1FFTVVfVEFSR0VU
X0FSTSkgKz0gYXJtLXNvZnRtbXUKQEAgLTMyNiw3ICszMzksNiBAQCBkZWZpbmUgUUVNVV9DT05G
SUdVUkVfQ01EUwogCQkJLS1kaXNhYmxlLXdocHggXAogCQkJLS1kaXNhYmxlLXhlbiBcCiAJCQkt
LWVuYWJsZS1hdHRyIFwKLQkJCS0tZW5hYmxlLWt2bSBcCiAJCQktLWVuYWJsZS12aG9zdC1uZXQg
XAogCQkJLS1kaXNhYmxlLWRvd25sb2FkIFwKIAkJCS0tZGlzYWJsZS1oZXhhZ29uLWlkZWYtcGFy
c2VyIFwKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
