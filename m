Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA8EC7115C
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 14:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1917381DCB;
	Thu, 19 Jun 2025 14:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TC4HcU1cXhT9; Thu, 19 Jun 2025 14:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4609581567
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4609581567;
	Thu, 19 Jun 2025 14:48:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B9D181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C258660AAC
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vy7hG8m3jnuS for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 14:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09DDC607C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09DDC607C1
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09DDC607C1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so10557955e9.3
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750344519; x=1750949319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DRAZ1UvCk5czvADrqqLmjEorkLIRXT9jOEmwR5vZTbw=;
 b=g2Rxf0RtuRLC6TIHRrPkq+scoYFHD67t0lNZwmUdGGD0ox/dKBBXuyHzMQY5LaTvmL
 rte42BJ3baUj++GF8IxwXiUxjBTvfhilvqe2d5LfEIdh/URpQrvY5Yi8RFC1alepvtss
 OkDPXVnFNdgHdgeelI1c9RhHLpoL4Q/eQBsZH07UO+6MdcHlCHBTwA3eVgCb/FNgBFmm
 ZEUIhYZFYyuKs59/+SL2xH/R9C6sGeFeGO4Dy0ZvQUOUstj38fP3zKgkB5SaY9Mc0OFZ
 +WQMjSIGVUpBcHNXiRclpKTWmEWB2BaMTAu9vMwc5UYE+fP6JS7sHw/6jDlpOq9bm9IO
 CrPg==
X-Gm-Message-State: AOJu0Yw4FiOBRVZDm3A0v4KMGRnNv9W/5r3wIuIIBOwzQ+0qZc1ZArNv
 m1Ikvhib8myi/SIz9DYzFod3nz+Ez/ToOCJzKfsnACOgTpVdGW6dv9/1Azc1RDs3ePxk3lgze52
 FcOZyXAA=
X-Gm-Gg: ASbGnctwD2nYqmePPfIkIx9L15cB8GQjituaG8CcZQi1VFMsjOTHDbrYVuluq4rwkEj
 5w1MgkFbx1jk+BCcshAxhD84tsWdkeYEPCBomsQADSR0xqSKnsAxpd1UkSKBtp0+eas7XWm3EJ5
 f8DJrkSvuC3jnfeevmcWZzmzmNZnZ7N9ldqDtO+0nFMzbati5NtMftXiewQYUEFKjTEUaX1k9QY
 ZM+THz9OST+CzywvfA8FQ1UIP8BBfv5H1zK19CRA19GrZPnfM0SAmLCIciaFsc8STitidk8O8kM
 3+499LHFPD2oe3SZIA5hWK0azaJT0Smrku12mqgsdtzA36VCu2WogA1aF88bTI0=
X-Google-Smtp-Source: AGHT+IEKH2u5INN0R+tvxKOTYhJLTODQdabpkQwJsQEmasUt7Kk0Q08GuIIT+BDixeao+O5wpBLCqA==
X-Received: by 2002:a05:600c:8b65:b0:44b:eb56:1d45 with SMTP id
 5b1f17b1804b1-4533ca6e6a8mr233889825e9.15.1750344519442; 
 Thu, 19 Jun 2025 07:48:39 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45360b1ffacsm16441725e9.36.2025.06.19.07.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 07:48:39 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5B0825F889;
 Thu, 19 Jun 2025 15:48:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 19 Jun 2025 15:48:36 +0100
Message-ID: <20250619144837.1298990-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250619144837.1298990-1-alex.bennee@linaro.org>
References: <20250619144837.1298990-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750344519; x=1750949319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRAZ1UvCk5czvADrqqLmjEorkLIRXT9jOEmwR5vZTbw=;
 b=TubJmhnRwgQm7rLqbJj3QtSTuQEGeftC1MB4c4II4VB1IkSdHc0MMOK0Cu32QLPnsS
 u+xayBprM8wJxFeaI79CzUqkD212WGfiFQWhu+TCkrEOrJ/3mt0Hu2IjG/HrSdr50IFf
 vI3gCoH63KYHwefEmdtAftnsuCGGce0HInRbnRjobqgG5lIfA909YKx9hes+usy0mOnd
 rDenPM8tttWSk67hXTrEL5JPmgx7XACE/FxE2DZvjxATm08rYzUHp7CVw99H4RnG9k4I
 C24uwsW2tMJIsaCIGihRG7Hhs6PH+ApuBdKOtB053JmAeCfCQ74rBYp3V5WkiRelYa1a
 LLbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TubJmhnR
Subject: [Buildroot] [PATCH 3/3] package/qemu: introduce kvm and tcg system
 options
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
bGQgdGhlCmJpbmFyeSBmb3IgeW91ciB0YXJnZXQgc3lzdGVtLiBJdCBhbHNvIGltcGxpZXMgeW91
IGNhbm5vdCBzZWxlY3QKYWRkaXRpb25hbCB0YXJnZXRzIHVubGVzcyB5b3UgZW5hYmxlIHVzZXIt
bW9kZSBvciBUQ0cgc3VwcG9ydCBmb3IKc3lzdGVtLgoKU2lnbmVkLW9mZi1ieTogQWxleCBCZW5u
w6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgotLS0KIHBhY2thZ2UvcWVtdS9Db25maWcuaW4g
fCAyMyArKysrKysrKysrKysrKysrKystLS0tLQogcGFja2FnZS9xZW11L3FlbXUubWsgICB8IDEz
ICsrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluIGIvcGFja2FnZS9x
ZW11L0NvbmZpZy5pbgppbmRleCAyZDE1YWIxZWE5Li5hZjIxODU4M2ZlIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3FlbXUvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KQEAgLTU5
LDYgKzU5LDIwIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTQogCiBpZiBCUjJfUEFD
S0FHRV9RRU1VX1NZU1RFTQogCitjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU1fS1ZNCisg
ICAgICAgYm9vbCAiRW5hYmxlIEtWTSBzeXN0ZW0gdmlydHVhbGlzYXRpb24iCisgICAgICAgZGVm
YXVsdCB5CisgICAgICAgaGVscAorICAgICAgICAgU2F5ICd5JyBoZXJlIHRvIGVuYWJsZSBhIFFF
TVUgd2l0aCBLVk0gZW5hYmxlZC4gSWYgdW5zdXJlLCBzYXkgJ3knCisKK2NvbmZpZyBCUjJfUEFD
S0FHRV9RRU1VX1NZU1RFTV9UQ0cKKyAgICAgICBib29sICJFbmFibGUgVENHIHN5c3RlbSBlbXVs
YXRpb24iCisgICAgICAgZGVmYXVsdCBuCisgICAgICAgaGVscAorICAgICAgICAgU2F5ICd5JyBo
ZXJlIHRvIGVuYWJsZSBRRU1VIGJpbmFyeXMgd2hpY2ggY2FuIGVtdWxhdGUgZm9yaWVnbgorICAg
ICAgICAgYXJjaGl0ZWN0dXJlcyB1c2luZyB0aGUgVENHIEpJVC4KKworCiBjb25maWcgQlIyX1BB
Q0tBR0VfUUVNVV9CTE9CUwogCWJvb2wgIkluc3RhbGwgYmluYXJ5IGJsb2JzIgogCWRlZmF1bHQg
eQpAQCAtMTMwLDEyICsxNDQsMTEgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfTElOVVhfVVNF
UgogCiBjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9DSE9PU0VfVEFSR0VUUwogCWJvb2wgIlNlbGVj
dCBpbmRpdmlkdWFsIGVtdWxhdG9yIHRhcmdldHMiCi0JZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9R
RU1VX1NZU1RFTSB8fCBCUjJfUEFDS0FHRV9RRU1VX0xJTlVYX1VTRVIKKwlkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX1FFTVVfU1lTVEVNX1RDRyB8fCBCUjJfUEFDS0FHRV9RRU1VX0xJTlVYX1VTRVIK
IAloZWxwCi0JICBCeSBkZWZhdWx0LCBhbGwgdGFyZ2V0cyAoc3lzdGVtIGFuZC9vciB1c2VyLCBz
dWJqZWN0IHRvIHRoZQotCSAgY29ycmVzcG9uZGluZyBvcHRpb25zLCBhYm92ZSkgYXJlIGJ1aWx0
LiBJZiB5b3Ugb25seSBuZWVkIGEKLQkgIHN1YnNldCBvZiB0aGUgZW11bGF0ZWQgdGFyZ2V0cywg
c2F5ICd5JyBoZXJlIGFuZCBlbmFibGUgYXQKLQkgIGxlYXN0IG9uZSB0YXJnZXQsIGJlbG93Lgor
CSAgQnkgZGVmYXVsdCwgYWxsIHRhcmdldHMgc3lzdGVtIHRhcmdldHMgYXJlIGJ1aWx0IHdoZW4g
VENHIGlzCisJICBlbmFibGVkLiBJZiB5b3Ugb25seSBuZWVkIGEgc3Vic2V0IG9mIHRoZSBlbXVs
YXRlZCB0YXJnZXRzLAorCSAgc2F5ICd5JyBoZXJlIGFuZCBlbmFibGUgYXQgbGVhc3Qgb25lIHRh
cmdldCwgYmVsb3cuCiAKIGlmIEJSMl9QQUNLQUdFX1FFTVVfQ0hPT1NFX1RBUkdFVFMKIApkaWZm
IC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUubWsgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawppbmRl
eCBmZGM4NTkxZTU0Li4xOTcwM2JhM2UzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5t
aworKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawpAQCAtNDgsNiArNDgsMTkgQEAgUUVNVV9WQVJT
ID0gTElCVE9PTD0kKEhPU1RfRElSKS9iaW4vbGlidG9vbAogaWZlcSAoJChCUjJfUEFDS0FHRV9R
RU1VX1NZU1RFTSkseSkKIFFFTVVfREVQRU5ERU5DSUVTICs9IHBpeG1hbgogUUVNVV9PUFRTICs9
IC0tZW5hYmxlLXN5c3RlbQorCitpZmVxICgkKEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNX0tWTSks
IHkpCitRRU1VX09QVFMgKz0gLS1lbmFibGUta3ZtCitlbHNlCitRRU1VX09QVFMgKz0gLS1kaXNh
YmxlLWt2bQorZW5kaWYKKworaWZlcSAoJChCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTV9UQ0cpLCB5
KQorUUVNVV9PUFRTICs9IC0tZW5hYmxlLXRjZworZWxzZQorUUVNVV9PUFRTICs9IC0tZGlzYWJs
ZS10Y2cKK2VuZGlmCisKIFFFTVVfVEFSR0VUX0xJU1RfJChCUjJfUEFDS0FHRV9RRU1VX1RBUkdF
VF9BQVJDSDY0KSArPSBhYXJjaDY0LXNvZnRtbXUKIFFFTVVfVEFSR0VUX0xJU1RfJChCUjJfUEFD
S0FHRV9RRU1VX1RBUkdFVF9BTFBIQSkgKz0gYWxwaGEtc29mdG1tdQogUUVNVV9UQVJHRVRfTElT
VF8kKEJSMl9QQUNLQUdFX1FFTVVfVEFSR0VUX0FSTSkgKz0gYXJtLXNvZnRtbXUKLS0gCjIuNDcu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
