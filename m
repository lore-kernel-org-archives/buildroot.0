Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26371CAC594
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E097D84DA4;
	Thu, 11 Sep 2025 21:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpRmxJ6mUomU; Thu, 11 Sep 2025 21:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 072C784D94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 072C784D94;
	Thu, 11 Sep 2025 21:28:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBCE12D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0228284D83
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDhFbGxCBNJn for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 043F984D7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 043F984D7F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 043F984D7F
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45dd505a1dfso9904255e9.2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626082; x=1758230882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A7EE/eehjq+oX6FBuHKJIXKpv6dq4DSecLSu6vtnzP0=;
 b=PlxiLVMKbXvxClJC1ipujaNZ8PPkKKVw/38AsjzAC1P/t0B/YD17wgNVxNSIS+TP/k
 bZ6cRAgFGb3M5X/s9PxiBjUwwNJT1RwGsPnb4FC1ztp0AGg9tndQmM3J2V3quWYgsRsr
 R3aX92xyNp4j2835BM5T3derJbJrFSHyMCAbfXjJmA4NRajL3IVQKbZxMGBMYSdfVr51
 LTq7xyjhm3aU2NjHQQeddpRqq/WuLtghPfuSmmbqgOTqnBnFBe+CPBS4xHjCVJs3YA7F
 XAnPhXgkORyoAmWOZU6GLaSq3qQ7REpdhyJJLHfIPQLTaW/+P9zrGcfTiN3NSESQa8yu
 R2tg==
X-Gm-Message-State: AOJu0Yx4SIBLRBF/G2JuGqaDEn6FCD502lkbnfpKa0BlgjduKi1orO1/
 jrl+cDRd1BM2YaxS/mAmCDAqkp+lznGPe3Xf4+DQsaoBMmRz46Cbn1eSlbTPi9r10Uvni4nEHBq
 +q05W074=
X-Gm-Gg: ASbGncsBx5DT84gORDg90nezZFGDBpvJftHAjlWi14Lf1Cb6UBBiQ303XRL0Mt3Tr8t
 lrLRE+xcGTtJnfYGOfceAZXiVNiwpoMG6e6+6IpdJozoUoxH5qbk0ySxrh2wUFK+TgVaaKc5fqq
 lnAMcdPMbIzl2N6sjeuBtauD9SD+NmjGed9tfj/UpVfn0t0ArGcUuwpIx0050l8xD0paKglNKuj
 qxK9AxnTYHRHNdhsrusgETJNgg1DP0VOFrh8FTcbpUgd2Mo83re7D0wvhmqWWcZsMi/fBzd1lnj
 B+IeLVxnwU4bS5jKRyTysUEZkdAVystRozGoCGSHuFpistDpCoURirFSNGoL0MHDwIMUIlNgrpU
 gXF9EOvhGzI6XUCXLeyUCU30=
X-Google-Smtp-Source: AGHT+IH5vDTcvHGed2klCIN7R9RPIMvv0+0ttklPQb94k0ieXVGeD+a45OqsGMXnIUZHhWBz72CHRQ==
X-Received: by 2002:a05:600c:1384:b0:45d:f897:fbe1 with SMTP id
 5b1f17b1804b1-45f211ff17fmr6261875e9.32.1757626082224; 
 Thu, 11 Sep 2025 14:28:02 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607770cesm3859752f8f.9.2025.09.11.14.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CE36B5F8DC;
 Thu, 11 Sep 2025 22:27:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:49 +0100
Message-ID: <20250911212752.266940-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626082; x=1758230882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7EE/eehjq+oX6FBuHKJIXKpv6dq4DSecLSu6vtnzP0=;
 b=GcmkZ8XwWt8b+Ntq96oFi4lpQeCJAjCqA+BuvmgGfc6wuLpGBx7+z9lQlCGilNFoki
 kskU0eLFhygTKQiGfsv6vK0W0FRliB+mzIcNEKGrCMf/r/aC/bFVg2mSIlQ6Fs/dSvVk
 x4mm85qLEuewOBUdAVJMOJJqKBEceDeCheH0p/ymLmmZJKX17rWF70zU42xqEkAmB8zR
 9Bv53b34uqPUqlYl+E4jrk6n1QvtX1LdTrlOfbZYWFD/hZHvPuCGbtGrX0LgcOHvq5h8
 p8LdT0pIYlQxW42+yogabddSLuM8reoERetNPcfJq7DEHDhIFiYlV8YCMOPcOXAC9e5p
 LJOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=GcmkZ8Xw
Subject: [Buildroot] [PATCH v5 9/9] package/kvm-unit-tests: allow kvmtool to
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
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHNvbWUgdGFyZ2V0cyBsYXVuY2hpbmcgdGVzdHMgd2l0aCBrdm10b29sIGlzIGFuIG9wdGlv
biB3aGljaCBtYWtlcwpmb3IgYW4gZXZlbiBzbWFsbGVyIHRlc3QgaW1hZ2UuIENyZWF0ZSBhIG5l
dyBzeW1ib2wgd2hpY2ggY2FuIGJlCmV4cGFuZGVkIHdpdGggYWRkaXRpb25hbCB0YXJnZXRzIHRo
YXQgd2lsbCBhbGxvdyB0aGUgc2tpcHBpbmcgb2YgdGhlCnNlbGVjdGlvbiBvZiBRRU1VIGlmIG5v
dCBuZWVkZWQuCgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5Lm9yZz4K
U2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKLS0t
CnYyCiAgLSBleHBhbmQgdG8gaW5jbHVkZSByaXNjdiwgZGlkbid0IGJvdGhlciB3aXRoIDMyIGJp
dCBhcm0gZ2l2ZW4gaXRzIGRlcHJlY2F0ZWQKICAtIG9ubHkgZXhwYW5kIHRhcmdldCB3aGVuIGFy
Y2ggY2FuIHN1cHBvcnQgaXQKICAtIHVwZGF0ZSBjb21tZW50IGRlcGVuZHMKLS0tCiBwYWNrYWdl
L2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiAgICAgICAgIHwgMTIgKysrKysrKysrLS0tCiBwYWNr
YWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIHwgMTEgKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluCmluZGV4IDBmZWY5NDc3NmMuLjAzMTc2NGU3Y2EgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluCkBAIC0xMyw2ICsxMywxMSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZN
X1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwogCWRlZmF1bHQgeSBpZiBCUjJfcG93ZXJwYzY0IHx8
IEJSMl9wb3dlcnBjNjRsZQogCWRlZmF1bHQgeSBpZiBCUjJfczM5MHgKIAorIyBTb21lIGFyY2hp
dGVjdHVyZXMgY2FuIHVzZSBrdm10b29sIGluc3RlYWQgb2YgUUVNVSB0byBsYXVuY2ggdGhlIHRl
c3RzCitjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MCisJ
Ym9vbAorCWRlZmF1bHQgeSBpZiAoQlIyX2FhcmNoNjQgfHwgQlIyX3Jpc2N2KSAmJiBCUjJfUEFD
S0FHRV9LVk1UT09MCisKIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwogCWJvb2wg
Imt2bS11bml0LXRlc3RzIgogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNf
QVJDSF9TVVBQT1JUUwpAQCAtMjQsOCArMjksOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VO
SVRfVEVTVFMKIAlkZXBlbmRzIG9uIChCUjJfUEFDS0FHRV9HTElCQ19VVElMUyB8fCBcCiAJCSAg
ICBCUjJfVUNMSUJDX0lOU1RBTExfVVRJTFMgfHwgXAogCQkgICAgQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGltZSBnZXRjb25mCi0Jc2VsZWN0IEJSMl9QQUNL
QUdFX1FFTVUKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBydW50aW1lIGZvciBx
ZW11LXN5c3RlbS0kQVJDSAorCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VIGlmICFCUjJfUEFDS0FH
RV9LVk1fVU5JVF9URVNUU19DQU5fVVNFX0tWTVRPT0wKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVN
VV9TWVNURU0gaWYgIUJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0NBTl9VU0VfS1ZNVE9PTCAj
IHJ1bnRpbWUgZm9yIHFlbXUtc3lzdGVtLSRBUkNICiAJc2VsZWN0IEJSMl9QQUNLQUdFX0NPUkVV
VElMUyAjIHJ1bnRpbWUgZm9yIHRpbWVvdXQKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQkFTSCAjIHJ1
bnRpbWUKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTk1BUApAQCAtNTUsNCArNjAsNSBAQCBjb21tZW50
ICJrdm0tdW5pdC10ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyB1dGlscywgZ2NjID49IDggYW5k
IHFlbXUiCiAJZGVwZW5kcyBvbiAhKEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKIAkJQlIy
X1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8IFwKIAkJQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJD
X1VUSUxTX0NPUFkpCi0JZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfUUVNVV9BUkNIX1NVUFBPUlRT
X1RBUkdFVAorCWRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9RRU1VX0FSQ0hfU1VQUE9SVFNfVEFS
R0VUIHx8IFwKKwkJQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MKQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayBiL3Bh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKaW5kZXggZWZjM2M4NTlhYS4u
MDIxOTEyNzVhMiAxMDA2NDQKLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10
ZXN0cy5taworKysgYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCkBA
IC00MCw2ICs0MCwxNyBAQCBLVk1fVU5JVF9URVNUU19DT05GX09QVFMgPVwKIAktLXByb2Nlc3Nv
cj0iJChHQ0NfVEFSR0VUX0NQVSkiIFwKIAktLWVuZGlhbj0iJChLVk1fVU5JVF9URVNUU19FTkRJ
QU4pIgogCisjIFRoZSBkZWZhdWx0IHJ1bm5lciBpcyBRRU1VIGJ1dCBrdm10b29sIGNhbiBhbHNv
IGJlIHVzZWQgb24gc29tZQorIyBhcmNoaXRlY3R1cmVzLiBUaGUgZmxhZyBvbmx5IHdvcmtzIGZv
ciB0aG9zZSBhcmNoaXRlY3R1cmVzIHRoYXQgY2FuCisjIHN1cHBvcnQgYm90aC4KK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MKSwgeSkKK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0pLHkpCitLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0g
LS10YXJnZXQ9cWVtdQorZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX0tWTVRPT0wpLHkpCitLVk1f
VU5JVF9URVNUU19DT05GX09QVFMgKz0gLS10YXJnZXQ9a3ZtdG9vbAorZW5kaWYKK2VuZGlmCisK
IGlmZXEgKCQoQlIyX0FSTTY0X1BBR0VfU0laRV80SykseSkKIEtWTV9VTklUX1RFU1RTX0NPTkZf
T1BUUyArPSAtLXBhZ2Utc2l6ZT00awogZWxzZSBpZmVxICgkKEJSMl9BUk02NF9QQUdFX1NJWkVf
MTZLKSx5KQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
