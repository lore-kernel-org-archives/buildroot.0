Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17B8C83F20
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C982D40F93;
	Fri, 11 Jul 2025 16:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BrnFCfwX34g; Fri, 11 Jul 2025 16:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D913040F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D913040F96;
	Fri, 11 Jul 2025 16:44:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C4A0199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E4D083C00
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqKEYt32jHoB for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 16:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E9EF83BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9EF83BF5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E9EF83BF5
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so3588655e9.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 09:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252250; x=1752857050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qe3toRqimTPznc81BeiyPdn9R6ROEg51uyRLOMQyrH8=;
 b=tDJiERh/SXwBmno5hDnpXaNn89NIW8NsxexMBydmEMtlKDn+WlBE8O7JIlfEyacQEb
 4BiAyPm9gYIUH7grHsFfq6ShbUrt96F7UQXmtf7a03Z/Ul66bQaOEDRM4L0ecF83FXhF
 N1+8DCkMjz0vJkjLImfqAVcK0/Iw/Eg7wQ5onQoNQDogSa97Rn9iz33hCwq6QvtRqYR9
 +LN0GFFpmaXEZeIrvZJiPzSmPCgtSSFx0nOeNJGaT2TPdPass8oSZ8cAJ0SqyZTayXMz
 2JFSIaocZlvj+O2ur0zVNIm1M0ygAKa3IM/A2xON3UlFY5j6IqQ3quq1a2QtRagyW2x7
 F48w==
X-Gm-Message-State: AOJu0Yz70pSq4Twqrlg73LaofplLtkholsSYqKsvyAqqYkmxwkye9zpK
 QITMp0+GAMq1DsMASOnrJHmIW1NqlMq8aDydEdUjpTw7vSxvlLjQjD/rn5bzuleZmI4=
X-Gm-Gg: ASbGncswz0b2NJHk5MtkFtLVRHQZ4K8+WrUPSFMJe7cZO47uAyCTESRsWgLmtvEYMEj
 lfhigOlijIs/Kay7/jX2nvB9/bYW+0MWF9+LeYQDOOFXpvL5vY05HANqoy9A+/bMld6faV86axb
 BLSd9LPxxDECtwLlrq/KqdNutwVb6rNxBeDR66cOWAus3uZuXEOCjWEXN16PxcfZqEFmmyxZ4CK
 lOtR3V+dqM10imMm7d+FWJLi1nrvSv6L1LQuF+CJx+r2bi2bTQ9rRz4TIxCkBbOPmHHPrOzpcxD
 XXCV+NON3jOpTk6hy86xZjLj9F9Q1jGcYKmwF5Bj28UFK6wrx53V3Mep4YNv4OqFZgopZ5c1HOc
 4ToZHVT2XJImSL/09ROd7oPg=
X-Google-Smtp-Source: AGHT+IHuB5fCOMqxVac6aFr2UgbmAAcexMKZOofSDcBKrx9xonsPA0+zqPjuSZOIUDQUGB02gk1toQ==
X-Received: by 2002:a05:600c:34c5:b0:43c:fe5e:f040 with SMTP id
 5b1f17b1804b1-45565edc8f4mr31079735e9.23.1752252250484; 
 Fri, 11 Jul 2025 09:44:10 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455f7af4bf0sm8367375e9.13.2025.07.11.09.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 09:44:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 718FE5F834;
 Fri, 11 Jul 2025 17:44:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 17:43:59 +0100
Message-ID: <20250711164407.799041-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250711164407.799041-1-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752252250; x=1752857050; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qe3toRqimTPznc81BeiyPdn9R6ROEg51uyRLOMQyrH8=;
 b=EBhiCtGJo/q7kdFT3KeUic6Cv/5gj1rkb1+bXqCJ+6ck4CmWxHOm5j3pdSHAy4k4MX
 233X6OKP0bNHSMM7mlPePnxBLa7T0RwxHvfLcrfHokZdyAxTnTF3blrYikFxV/E3xH/8
 OoItq/lmr8YF1GIAkdzJIYw22Fii+L7HkpozjY21s2X8vA2d5Na2cfYzFwNjPpG7Q8J0
 eDGXJ40QoPwfcuv/KEGx3fuQqhb8gmmIwcVN2cGfNbfV5aaO2NerSxHIAPDXz9HvANl4
 FsFRo5+olmk2dRIrOPsXJCAuk7YHihf5lLP+waeIwPtBPpze+3XTvN+eI5Ejb9KpI2hj
 3qTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EBhiCtGJ
Subject: [Buildroot] [RFC PATCH v2 1/7] toolchain/external: allow installing
 of libc utils
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGJ1aWxkcm9vdCdzIG93biB0b29scyB3ZSBoYXZlIEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxT
IChhbmQgc2ltaWxhcgpmb3IgdWxpYmMpLiBBcyB3ZSBuZWVkIHRoZSB0b29scyBmb3Igc29tZXRo
aW5ncyB3ZSBzaG91bGQgYWxzbyBzdXBwb3J0CnRoaXMgZm9yIGV4dGVybmFsIHRvb2xjaGFpbnMu
CgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0t
LQogdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9Db25maWcuaW4gICAgICAgIHwgIDcgKysr
KysrCiAuLi4vcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tayAgICAgICAgICAgICAgICAgfCAyNCAr
KysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL0NvbmZpZy5pbiBiL3Rvb2xj
aGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluCmluZGV4IGU5MWFhMTYzMjYuLmNiZjUx
ZmIwMTkgMTAwNjQ0Ci0tLSBhL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmlu
CisrKyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluCkBAIC0xNDMsNCAr
MTQzLDExIEBAIGNvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0dEQl9TRVJWRVJfQ09QWQog
CSAgQ29weSB0aGUgZ2Ric2VydmVyIHByb3ZpZGVkIGJ5IHRoZSBleHRlcm5hbCB0b29sY2hhaW4g
dG8gdGhlCiAJICB0YXJnZXQuCiAKK2NvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJQkNf
VVRJTFNfQ09QWQorCWJvb2wgIkluc3RhbGwgbGliYyB1dGlsaXRpZXMiCisJZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0VYVEVSTkFMCisJaGVscAorCSAgRW5hYmxpbmcgdGhpcyBvcHRpb24gd2ls
bCBjb21waWxlIGFuZCBpbnN0YWxsIHRoZSBnZXRjb25mLAorCSAgbGRkIGFuZCBsb2NhbGUgZ2li
YyB1dGlsaXRpZXMgZm9yIHRoZSB0YXJnZXQuCisKIGVuZGlmICMgQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTApkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9wa2ctdG9vbGNo
YWluLWV4dGVybmFsLm1rIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9wa2ctdG9vbGNo
YWluLWV4dGVybmFsLm1rCmluZGV4IDJjMmFmYTc2YzAuLjQyODFjMjQwYWYgMTAwNjQ0Ci0tLSBh
L3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tawor
KysgYi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwu
bWsKQEAgLTQ1MCw2ICs0NTAsMjkgQEAgZGVmaW5lIFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxM
X1RBUkdFVF9HREJTRVJWRVIKIGVuZGVmCiBlbmRpZgogCitpZmVxICgkKEJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfTElCQ19VVElMU19DT1BZKSx5KQorZGVmaW5lIFRPT0xDSEFJTl9FWFRFUk5BTF9J
TlNUQUxMX1RBUkdFVF9MSUJDX1VUSUxTCisJJChRKSQoY2FsbCBNRVNTQUdFLCJDb3B5aW5nIGxp
YmMgdXRpbHMiKQorCSQoUSlBUkNIX1NZU1JPT1RfRElSPSIkKGNhbGwgdG9vbGNoYWluX2ZpbmRf
c3lzcm9vdCwkKFRPT0xDSEFJTl9FWFRFUk5BTF9DQykgJChUT09MQ0hBSU5fRVhURVJOQUxfQ0ZM
QUdTKSkiIDsgXAorCXV0aWxzX2ZvdW5kPTAgOyBcCisJZm9yIGQgaW4gJCR7QVJDSF9TWVNST09U
X0RJUn0gXAorCSAgICAgICAgICQke0FSQ0hfU1lTUk9PVF9ESVJ9L3VzciBcCisJCSAkKFRPT0xD
SEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUik7IGRvIFwKKwkJaWYgdGVzdCAtZiAkJHtkfS9iaW4v
Z2V0Y29uZiA7IHRoZW4gXAorCQkJZm9yIGYgaW4gZ2V0Y29uZiBsZGQgbG9jYWxlOyBkbyBcCisJ
CQkJaW5zdGFsbCAtbSAwNzU1IC1EICQke2R9L2Jpbi8kJHtmfSAkKFRBUkdFVF9ESVIpL3Vzci9i
aW4gOyBcCisJCQlkb25lIDsgXAorCQkJdXRpbHNfZm91bmQ9MSA7IFwKKwkJCWJyZWFrIDsgXAor
CQlmaSA7IFwKKwlkb25lIDsgXAorCWlmIFsgJCR7dXRpbHNfZm91bmR9IC1lcSAwIF0gOyB0aGVu
IFwKKwkJZWNobyAiQ291bGQgbm90IGZpbmQgbGliYyB1dGlscyBpbiBleHRlcm5hbCB0b29sY2hh
aW4iIDsgXAorCQlleGl0IDEgOyBcCisJZmkKK2VuZGVmCitlbmRpZgorCiBkZWZpbmUgVE9PTENI
QUlOX0VYVEVSTkFMX0lOU1RBTExfU1lTUk9PVF9MSUJTCiAJJChRKVNZU1JPT1RfRElSPSIkKGNh
bGwgdG9vbGNoYWluX2ZpbmRfc3lzcm9vdCwkKFRPT0xDSEFJTl9FWFRFUk5BTF9DQykpIiA7IFwK
IAlBUkNIX1NZU1JPT1RfRElSPSIkKGNhbGwgdG9vbGNoYWluX2ZpbmRfc3lzcm9vdCwkKFRPT0xD
SEFJTl9FWFRFUk5BTF9DQykgJChUT09MQ0hBSU5fRVhURVJOQUxfQ0ZMQUdTKSkiIDsgXApAQCAt
NjMxLDYgKzY1NCw3IEBAIGVuZGVmCiBkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdFVF9DTURTCiAJ
JCQoVE9PTENIQUlOX0VYVEVSTkFMX0NSRUFURV9UQVJHRVRfTElCX1NZTUxJTkspCiAJJCQoVE9P
TENIQUlOX0VYVEVSTkFMX0lOU1RBTExfVEFSR0VUX0xJQlMpCisJJCQoVE9PTENIQUlOX0VYVEVS
TkFMX0lOU1RBTExfVEFSR0VUX0xJQkNfVVRJTFMpCiAJJCQoVE9PTENIQUlOX0VYVEVSTkFMX0lO
U1RBTExfVEFSR0VUX0dEQlNFUlZFUikKIAkkJChUT09MQ0hBSU5fRVhURVJOQUxfRklYVVBfVUNM
SUJDTkdfTERTTykKIAkkJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9UQVJHRVRfTEREKQot
LSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
