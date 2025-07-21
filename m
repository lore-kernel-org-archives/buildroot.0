Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A065C83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C55614AB;
	Mon, 21 Jul 2025 15:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajkub_auArR3; Mon, 21 Jul 2025 15:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D156B60DDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D156B60DDF;
	Mon, 21 Jul 2025 15:48:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA950DA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C147660DDF
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9U2AUeZjjd8t for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D957A610AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D957A610AE
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D957A610AE
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so9480724a12.1
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112898; x=1753717698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGy7/+SXkPPccDG5mhgPpKTaP+DD/62GyvNeGi3oc3M=;
 b=t4CxW4ugTBiL5k2RasRkPCy6dOGOot2zApM6t8SopIz/7s/q5qYS4r4OvRyDFR7pbt
 9eTV1lDx7lGveOpRhtkWpiCooI9bCp5FM3N7Tgi9RalFSnkjW8+a2+dSV+//SnTomkpN
 jsfv992hlnX4AsXMx77CTt2qFDuyeuohDVYOP8gmZwqcOST9c9BbDznvAFsqKZi4v4Ck
 qRBrNHGwnZ5CTnYIpgAXEOVvEEm59wVWBm5KSrHGSbCi6KX+oaNF5AlRoUKTwxjgjwi1
 DCIm0SVvN5ensxpALQrmH8E/p9y+Hn5t27g7x+K6Suy+O+04bWYhWierQOZ4og6fydsg
 pgyA==
X-Gm-Message-State: AOJu0YxxIkL+lSD4Jx3OrLSzPUIBehOs39klr2ABUZwq3uukRXGdU/IB
 oxddTqTtmhyu7gC8U+6Rssd2ivaul6eOe+gX4Iep1monyECBAbljG+FKfu1OhyC5T43fjm81ype
 p26mK
X-Gm-Gg: ASbGnctNBJuEUgw9YAKTmWFwjPCIbjEXkZcUMJ1Q5r9XdhgW6EtrTquRM+ECXIxy+g7
 ksUaCC1A6d1xTGEh+2fvGSN19Q58NMpdmt155yY/ovp2vjMLv27KXYk+AjBd8y3rE5AB7l48p4B
 c51PzEq5ZEh8YgtJPZIFPA3ftcP26gO9Da1F/zMpLujNHmBSQ6OuApXekOq1JfTVzLOoVjC1Eh3
 osYP/lKwtCuR+i8tiT5BbIXlCpF4Wg5HdonUIrCeIzP4NHtaHSqbuwdraD5t2GszJNNXah4AwFB
 CZZ0RJqnd0Nfg5cncYusG7EBOhMGsTx3mLGIqBUz0W/DJv2OtrtJq1Reheq/co2R4pbWfdL524r
 eKvIcRBTbwvmQ5wpFssmVDHQ=
X-Google-Smtp-Source: AGHT+IH7WVNb2onWd7zu0DsKmmvckzQCRZmUDvMyPLQ2FuJwJchIB4rASUFSY6zEqgFd7TnDM//jGw==
X-Received: by 2002:a05:6402:350b:b0:60b:9cf8:b218 with SMTP id
 4fb4d7f45d1cf-612c731f3b3mr11707674a12.7.1753112898307; 
 Mon, 21 Jul 2025 08:48:18 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c903fb80sm5642841a12.43.2025.07.21.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D058E5F89B;
 Mon, 21 Jul 2025 16:48:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:05 +0100
Message-ID: <20250721154812.787883-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112898; x=1753717698; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGy7/+SXkPPccDG5mhgPpKTaP+DD/62GyvNeGi3oc3M=;
 b=lbeieQNS5im4npQ/wwlowmCNUHmaYklKV8FMh79E2hzKfYyvAtnTQhVfi+m09mb7EO
 SSxIuICPqTvND1Xwul202Y+pFAPzFeXNLsiQmRyWQwQ14Gl36pkJpjdFg73uOYjho0Ij
 nr/ROeD4CAp31UCBJKdXWbnmccCB60AytuF+/rAp9yj19u+R8b3vdajkFcBYRI6wAlBX
 jF00pv2FE0M6MT51JW0LnUm/obDpQrKhnUv7OHMwgzM+hsw3OBcJ6sM9ZAau7DzvLtgB
 2g2aWNW+sQU1Bo9sLkd8R3ZkSkZJVyVFS5GhnoLwddgbE+E+LuhNvfqTdHG6MgF3gyz9
 /lSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lbeieQNS
Subject: [Buildroot] [PATCH v3 4/9] package/qemu: introduce kvm and tcg
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
