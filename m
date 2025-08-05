Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC7AC87FDA
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8579883EE4;
	Tue,  5 Aug 2025 15:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jzfYCXGmc-j; Tue,  5 Aug 2025 15:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A8183EFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A8183EFA;
	Tue,  5 Aug 2025 15:18:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AEEA1A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5149783EE3
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y3_YMdO2MmE for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AADC83ED2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AADC83ED2
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AADC83ED2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so3914808f8f.3
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407098; x=1755011898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGy7/+SXkPPccDG5mhgPpKTaP+DD/62GyvNeGi3oc3M=;
 b=tXztlj6TmYdJ6Pm4XL1UUM0eCYa75YfAtX96DrcseFVKY57HPB40AUgvsNmUjKrDAM
 V9NcGOKrXN/Pqv6M67eARo55WnEI6EZrATyT4zRgairQjHrh+ev715MJz7y8R7bjMCKq
 vNym2GJ3VCMl6LUtUZA1X9hwtJNfTbvAm7J6bIKj/TfH8JTOwKU37qMsseUgnRSZ7qHL
 F1HyE592+Y8imL2GSgdwDfOH7i8linSA+IIfT2+PMk8Nc+qyDiapN6WunBXQfF7uijif
 tGuWQDNXOekMUrg6YWONMPmu67jkuAs/K2uR4mzILd4y6waUOFm6su1UIVl+cx0Bw2Ei
 IiUw==
X-Gm-Message-State: AOJu0YzV+W1AGVKPdzPubFtZyir81lWXdtxB/9ShYFfXrqrsmaDG3yZ1
 rSm5HVUk5OFqRc0gQaRbCxUenbLR6AA55cDor3I7+Zj8fnaTg/93/7zNURqtcf/Qpo1YxujyWUW
 DBIuw
X-Gm-Gg: ASbGncum185uGq5Y7uShsHtI2u2Jk8/gFTcfCKW/aFKCD8a9qYfxv0lIMpkgiINcEWN
 M/lpsw8KU9QFR8aYEoklUQOI3XGhSGnhNt9EXeoGMPWUKkQwnu7It6uO6dlsyLXlFwq4ZuxZBX9
 gA1LDUufUvUZ2bW1r8SQBXYDVcpT39AY9rm9njSw+qSxCP37y7RmydzhJkJBe11dBQnKmtx6Jvb
 zVSvf6WRgpaAjwYvS44AB7oTYRlURJNVPmkNB5z1I7DrrH1lZ5Q993fYMV199wcS56W8tOCBlpO
 45Xkycxx7aoWqnFjGUqIskFJas3Up/RCA9frFdYLcTgdgxRt8RmJxkHP0TYoXmFbeagGa0v/K41
 OtB2ewfxn5D4Vo7MmDuaOczM=
X-Google-Smtp-Source: AGHT+IHlxuwEzK4PvzN+FNDIGhWR6uXqDPIHm+2r77o5KPj3H+mAvp80KDlzXpid3Y4o+BZKgPxLag==
X-Received: by 2002:a05:6000:2912:b0:3b7:9d87:97ad with SMTP id
 ffacd0b85a97d-3b8d94bc889mr10719483f8f.37.1754407097822; 
 Tue, 05 Aug 2025 08:18:17 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4533e6sm20153614f8f.35.2025.08.05.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3AB005F89A;
 Tue, 05 Aug 2025 16:18:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:06 +0100
Message-ID: <20250805151814.1114414-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407098; x=1755011898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGy7/+SXkPPccDG5mhgPpKTaP+DD/62GyvNeGi3oc3M=;
 b=YOADmmruzZgVzVVfAOqnC1If7cr4d7MXFtPW94b26dQWL0ue0s3Gbal0jiwSHv0sra
 +mZj39mWSzEMzk2hz+yi3UZq7j2L3a0I84MkXRY4/UyK4q/YsfY8Y5DGancCUa5cPz63
 Xo/hwJM7Cw8DpYJAJFsb8X/aP0847QSAr4qbVh6eW/EtueuintIjxrjnxL4WTNNjzC2v
 X/MA1dhpnfeay926dDUyJNjerr32ZEyFUanU4i99lJBqAQ9poIKiP6LEjQiYE5MZSLR3
 xyB88ZDckqybuUMPlttika1dee1PrKxmNw1ep9yqDPJRs5+OLaXDDWQLCXot3fr4zPhF
 xahA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YOADmmru
Subject: [Buildroot] [PATCH v4 4/9] package/qemu: introduce kvm and tcg
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
bXUvQ29uZmlnLmluIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgppbmRleCAyZDE1YWIxZWE5Li40
OWM3OGQyNmVjIDEwMDY0NAotLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCisrKyBiL3BhY2th
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
c2VyIFwKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
