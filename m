Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C04C7EE32
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34828814C7;
	Thu, 26 Jun 2025 11:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3TqJD7cnF6A; Thu, 26 Jun 2025 11:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C34F813FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C34F813FB;
	Thu, 26 Jun 2025 11:16:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00EB8154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBBBF813FB
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tW25gzlluU2b for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33052814C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33052814C7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33052814C7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450cf214200so6106485e9.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 04:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750936609; x=1751541409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxDJzduOm8dJuYywNZnYt5p+ovUb3fZHk+wATRXtZKg=;
 b=u3vDsugdTZ55Mo/bSgCCeRdSQ0kqk4VaikVvRfuKbLIbxqLQ5W7uz5I2VBkpXrwHcJ
 maExsza2yX1uEmHsj+/LUknkHHS6xrXtYXL9d8iqzPtcNPVBH7vmGm5DRHUnjEpCrf0J
 mi5f8/GAfb2KJGjhRwPOmCbOhB7DkG7G3uDQ5fDJp1Xp/twl8vlS4Gp2TS/NeXXEEjxJ
 ie1UwbX1oOyS1sHkVYrP5KzHH1sfvnlxwwOYbFhr1px/vr1+WjdrqdUZ919Us7VlM7ey
 xfJXzrs0Uej6F266YQLEqejwq05+Gdr1gFAKLE8JGEttHIm+e3i8JdW7xEkMcyhH8hnW
 f+5w==
X-Gm-Message-State: AOJu0YyeCpGL3kBcRCRSRe28IX8Omh5ut5JBtE8s75Sv4t2ucXUjcDO+
 sDsclZdxNJhvjfjlT4CeiLBvSeyS/8xONpt8S9KxKMGXVz3DbcBoMJhDXIetX8g6RbpGlSmJW+E
 jfnC4Tic=
X-Gm-Gg: ASbGncsAFVkPzOsn+h47e//gnRwtK+iX4zjTbr0vfqmJH7TcsxMHQUpOE6i/VAZeKLu
 f0Waghowdj23N799N0y8lDnAhv9C4GLbq1lQtlLmANLJcaw9aDsfEittohDOS1EgAQhIPr2L+KP
 ySvLhGpJBbuOpvIDSRussgU6/6B3VCBYP49aWdMOB7UUFAx/D/vQsosA3KAG0nxUMVWxm73kVxN
 7bHauF0OgyCXKt+dKYgUMTT2yWlKREy99udkdcy/eyrcAKRHIFB6QoQ9LcDpFeIAnORn+Bux4gY
 bMoMYNsnPJYDQJu2IRXG6GrS9d7uZvJjTAP9rjCNWjMG9LLmCUkiw0ldT7AmN1s=
X-Google-Smtp-Source: AGHT+IGUE6HNI7D3rnykmXcMkhnNyItXrEefDmHdXmwphq17JDocYg0NBMZD5R2bcplggDcpDOHqmA==
X-Received: by 2002:a05:600c:1c0e:b0:43d:45a:8fc1 with SMTP id
 5b1f17b1804b1-45381a9c9c1mr73798105e9.4.1750936608758; 
 Thu, 26 Jun 2025 04:16:48 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80f27besm7135458f8f.57.2025.06.26.04.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 04:16:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7F5E55F905;
 Thu, 26 Jun 2025 12:16:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 12:16:41 +0100
Message-ID: <20250626111642.228223-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626111642.228223-1-alex.bennee@linaro.org>
References: <20250626111642.228223-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750936609; x=1751541409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxDJzduOm8dJuYywNZnYt5p+ovUb3fZHk+wATRXtZKg=;
 b=XPZ+4f1kXH/euFITgAGRlJbaD+PxDmIYvWws8QfkpXhd18GM52IzavQ/A0KyJ9H90E
 SC+4kfv6fdDo0/IKU9eicAiICOw/Em5yvV7Qbh7H/0bKtR1agApFrfdDFbLXM62AS5zL
 6sZQ27S2MFmzkocdwYfm5DZ4E/vsCfy4tEBQrtDxR1G9klf1603+1FYazyJZniS4GMDk
 0Q3nqLsMOw9Q05x+qbQA7QOkxxWnvyA0yas39fBAqbyNQOF7jrQGsWHgOc721EQ3S6tC
 E7iphuIpI/Oxz6V4maptuJswp8ZmKmTndy+lk3Rvl7WSYwNBDb8l7wxpS5XaQA1h5PF9
 xszQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=XPZ+4f1k
Subject: [Buildroot] [RFC PATCH 3/3] package/llvm-project: reduce the build
 size of llvm
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWx0aG91Z2ggd2UgcmVxdWVzdCBhIFJlbGVhc2UgYnVpbGQgdGhlIGRlZmF1bHQgQ01BS0UgZmxh
Z3MgaW4KdG9vbGNoYWluLmNtYWtlIGluY2x1ZGUgLU9nIC1nMyB3aGljaCBlbmFibGVzIGRlYnVn
IHN5bWJvbHMgZm9yIHRoZQpidWlsZCBpbmZsYXRpbmcgdGhlIG92ZXJhbGwgc2l6ZSBvZiB0aGlu
Z3MuCgpGb3Igbm93IGp1c3QgY29weSB0aG9zZSBkZWZhdWx0cyBpbnRvIHRoZSBwcm9qZWN0IG1r
IGZpbGUgYW5kIGRyb3AgdGhlCi1PZyBhbmQgLWczIGxpbmVzLiBUaGlzIGRyb3BzIHRoZSBzaXpl
IG9mIHRoZSBsbHZtIGJ1aWxkIGRpcmVjdG9yeSBvbgpteSBhcm02NCBidWlsZCBmcm9tIDE3R2Ig
dG8gYSBtb3JlIHJlYXNvbmFibGUgNC40R2IuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUg
PGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0tLQogcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9s
bHZtLm1rIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsgYi9wYWNrYWdl
L2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsKaW5kZXggNzhhYTZmZTQ2Ny4uMDM2ODQwODRjNCAx
MDA2NDQKLS0tIGEvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rCisrKyBiL3BhY2th
Z2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawpAQCAtMTY3LDYgKzE2NywxNiBAQCBMTFZNX0NP
TkZfT1BUUyArPSAtRExMVk1fSEFWRV9URkxJVEU9IiIKIEhPU1RfTExWTV9DT05GX09QVFMgKz0g
LURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgLUcgTmluamEKIExMVk1fQ09ORl9PUFRTICs9IC1E
Q01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCiAKKyMgUmVkdWNlIHRoZSBvcHBvcnR1
bml0eSBmb3IgZGVmYXVsdCBbQ3xDWFhdX0ZMQUdTIHRvIGZhdHRlbiB0aGUgYnVpbGQKK0hPU1Rf
TExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VOQUJMRV9BU1NFUlRJT05TPU9GRgorTExWTV9DT05G
X09QVFMgKz0gLURMTFZNX0VOQUJMRV9BU1NFUlRJT05TPU9GRgorCitIT1NUX0xMVk1fQ09ORl9P
UFRTICs9IC1EQ01BS0VfQ19GTEFHUz0iLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2
NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9GT1JUSUZZX1NPVVJDRT0xIgorTExW
TV9DT05GX09QVFMgKz0gLURDTUFLRV9DX0ZMQUdTPSItRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xB
UkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0ZPUlRJRllfU09VUkNF
PTEiCisKK0hPU1RfTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9DWFhfRkxBR1M9Ii1EX0xBUkdF
RklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQg
LURfRk9SVElGWV9TT1VSQ0U9MSIKK0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX0ZMQUdT
PSItRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNF
VF9CSVRTPTY0IC1EX0ZPUlRJRllfU09VUkNFPTEiCisKICMgQ29tcGlsZSBsbHZtIHdpdGggdGhl
IEMrKzE0IChJU08gQysrIDIwMTQgc3RhbmRhcmQpLgogSE9TVF9MTFZNX0NPTkZfT1BUUyArPSAt
RENNQUtFX0NYWF9TVEFOREFSRD0xNAogTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9DWFhfU1RB
TkRBUkQ9MTQKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
