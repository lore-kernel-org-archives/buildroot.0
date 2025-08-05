Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33768C87FD2
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D4383FC1;
	Tue,  5 Aug 2025 15:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVdhUYhahLj5; Tue,  5 Aug 2025 15:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFDC683FC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFDC683FC6;
	Tue,  5 Aug 2025 15:18:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FE5D12C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56CEC401CB
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aL2iaX8aUtq7 for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17A32403E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17A32403E6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17A32403E6
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso3753651f8f.0
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407104; x=1755011904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBIUbIySMYECl9x5Ek0cbERZ5a/9PK/psVfU5gQi9c4=;
 b=EJwlwn6s3F3deV1NtrszXVh9/xcFoL/USEFJ3+ZdkcS/g9g7JTTUJYMAiwwRBu+BEk
 6MQvBS/W+070zCb9qdNS08VbA0nI6qLqYnt77l8UPZwHe95o76GA4NOmFUjKKFrwfMOX
 Ua44qVRriMm3PkKbD5miTbWbRsh3aN/Aoe9AIOsgSPitJ7eUw8p/VAC+Z5WHm/5wpwxz
 mhTZKG8CxYtZOvv93fqqmD0nyEGkMzlVnw40TGMelmW5nFcAoN3X1xMHk7kHh5AIUVv6
 xD8lfTHt9r14sPAVXuDwXklNcAZjBDLWGLBHX7ulaMlqzWDuXRjdTO2mwvRfB0pr1llh
 OICw==
X-Gm-Message-State: AOJu0YzkT6OCsf/fegUuPDwTTYbS+iYPoUQ6KawRNaHJX3N9c8NS9upJ
 FLmQDOJI0YxqbQxf9ppxQFZuv/5IwDL0i1YWftdwJ1Kcei+5JjMODRaBazFVDC/418g2PGbZCAX
 l9OZG
X-Gm-Gg: ASbGncvEHBP/BEn1WiRu5JVv3D2fstry9tMsMh5InBQEqWuPENQAhdDJbdPQCTvdH2o
 llqsRjULalDjNRT1hgm1ez+Def8d/djRos/oGifEM/cQX+V2fx9FNxrQvFA2myEtwd1rKXxkUIG
 NORPxm00E9LXs1g3Gtg9qNG5WLUtnhMayZ19ANpVGhDXFllSotU4Y0CpIbJ5Q+NpUTWTSZ7Ve1x
 Ik0yngnAf29yuXyMgo60Esz8CgpH2Yj0QB8oxI6Co+3N7tEphjRc3g0gIoD5dThp2eH5IY5SLiD
 n4/2EYG0zS+t/BjtNon5aSb7W8YSIvQ6sXxeOHWnSWEZrpX/5qsd+6/IS6Th7y8NC/4vBGh0fg/
 ozOfqB9MRTmO2aLuWgo0I+2I=
X-Google-Smtp-Source: AGHT+IEEEaxf6VWSUCJv5Y0hK9zSGKTPw5wrgYAKP+yaB7UKfalzfWzSgR2RMd2EeuSW3TLjXLT6jg==
X-Received: by 2002:a05:6000:25ca:b0:3b7:90c7:325d with SMTP id
 ffacd0b85a97d-3b8f323fddcmr148069f8f.6.1754407103738; 
 Tue, 05 Aug 2025 08:18:23 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4f9e952sm149052885e9.9.2025.08.05.08.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:20 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B06865F892;
 Tue, 05 Aug 2025 16:18:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:11 +0100
Message-ID: <20250805151814.1114414-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407104; x=1755011904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBIUbIySMYECl9x5Ek0cbERZ5a/9PK/psVfU5gQi9c4=;
 b=hNmjz39SFNUbMmf9TOETYIo1M7nwakQ542zi7SKvKuexFAu9hN6cyIDJRNiWCCDK+R
 Nj/ofmb76dOQyCDjE4e6GK1chlbP53yST9Ldt5E2PZQCIgM5urFIvZMs2lSXI0FiQDtp
 h4zzVE7TxZ2DcO5PWcKkjIMU4Ru4c6BdLjsyHfuZHWVeYGJS6MWWAt7rZX3ku1le8rtg
 Ej6JO2EcFI2PRijaOv93LOijC85JZgJk5JvaOBfa6H1XUvWkh9uuj5AmB6BVPaHkbsQ5
 JtMSVE95Cuq/mkq6+00j9MKFCARs6zDKYEb2DkLsQYlLVSF5dr9yzRxNNmEq04JAsfqo
 Ltlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=hNmjz39S
Subject: [Buildroot] [PATCH v4 9/9] package/kvm-unit-tests: allow kvmtool to
 be used
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHNvbWUgdGFyZ2V0cyBsYXVuY2hpbmcgdGVzdHMgd2l0aCBrdm10b29sIGlzIGFuIG9wdGlv
biB3aGljaCBtYWtlcwpmb3IgYW4gZXZlbiBzbWFsbGVyIHRlc3QgaW1hZ2UuIENyZWF0ZSBhIG5l
dyBzeW1ib2wgd2hpY2ggY2FuIGJlCmV4cGFuZGVkIHdpdGggYWRkaXRpb25hbCB0YXJnZXRzIHRo
YXQgd2lsbCBhbGxvdyB0aGUgc2tpcHBpbmcgb2YgdGhlCnNlbGVjdGlvbiBvZiBRRU1VIGlmIG5v
dCBuZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFy
by5vcmc+Ci0tLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gICAgICAgICB8IDkg
KysrKysrKy0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIHwgNyAr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgppbmRleCBiODlmMDEzZjJhLi44MGViYzUwMGM2IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgpAQCAtMTMsNiArMTMsMTEgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKIAlkZWZhdWx0IHkgaWYgQlIyX3Bv
d2VycGM2NCB8fCBCUjJfcG93ZXJwYzY0bGUKIAlkZWZhdWx0IHkgaWYgQlIyX3MzOTB4CiAKKyMg
U29tZSBhcmNoaXRlY3R1cmVzIGNhbiB1c2Uga3ZtdG9vbCBpbnN0ZWFkIG9mIFFFTVUgdG8gbGF1
bmNoIHRoZSB0ZXN0cworY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0NBTl9VU0Vf
S1ZNVE9PTAorCWJvb2wKKwlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQgJiYgQlIyX1BBQ0tBR0Vf
S1ZNVE9PTAorCiBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMKIAlib29sICJrdm0t
dW5pdC10ZXN0cyIKIAlkZXBlbmRzIG9uIEJSMl9IT1NUQVJDSCA9ICJ4ODZfNjQiIHx8ICFCUjJf
eDg2XzY0CkBAIC0yMiw4ICsyNyw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNU
UwogCWRlcGVuZHMgb24gKEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKIAkJICAgIEJSMl9V
Q0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCiAJCSAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJ
QkNfVVRJTFNfQ09QWSkgIyBydW50aW1lIGdldGNvbmYKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVN
VQotCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSAjIHJ1bnRpbWUgZm9yIHFlbXUtc3lz
dGVtLSRBUkNICisJc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVUgaWYgIUJSMl9QQUNLQUdFX0tWTV9V
TklUX1RFU1RTX0NBTl9VU0VfS1ZNVE9PTAorCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RF
TSBpZiAhQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MICMgcnVudGlt
ZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQ09SRVVUSUxTICMg
cnVudGltZSBmb3IgdGltZW91dAogCXNlbGVjdCBCUjJfUEFDS0FHRV9CQVNIICMgcnVudGltZQog
CXNlbGVjdCBCUjJfUEFDS0FHRV9OTUFQCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRl
c3RzL2t2bS11bml0LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10
ZXN0cy5tawppbmRleCBlZmMzYzg1OWFhLi5jZjk5NWZmNTRlIDEwMDY0NAotLS0gYS9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKQEAgLTQwLDYgKzQwLDEzIEBAIEtWTV9VTklUX1RFU1RT
X0NPTkZfT1BUUyA9XAogCS0tcHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BVKSIgXAogCS0tZW5k
aWFuPSIkKEtWTV9VTklUX1RFU1RTX0VORElBTikiCiAKKyMgVGhlIGRlZmF1bHQgcnVubmVyIGlz
IFFFTVUgYnV0IGt2bXRvb2wgY2FuIGFsc28gYmUgdXNlZAoraWZlcSAoJChCUjJfUEFDS0FHRV9R
RU1VX1NZU1RFTSkseSkKK0tWTV9VTklUX1RFU1RTX0NPTkZfT1BUUyArPSAtLXRhcmdldD1xZW11
CitlbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfS1ZNVE9PTCkseSkKK0tWTV9VTklUX1RFU1RTX0NP
TkZfT1BUUyArPSAtLXRhcmdldD1rdm10b29sCitlbmRpZgorCiBpZmVxICgkKEJSMl9BUk02NF9Q
QUdFX1NJWkVfNEspLHkpCiBLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0gLS1wYWdlLXNpemU9
NGsKIGVsc2UgaWZlcSAoJChCUjJfQVJNNjRfUEFHRV9TSVpFXzE2SykseSkKLS0gCjIuNDcuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
