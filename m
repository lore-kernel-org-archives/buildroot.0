Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BFAC83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF62414E0;
	Mon, 21 Jul 2025 15:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9k3pYV5Kq5C; Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B9524137F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B9524137F;
	Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1040CDA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA1BF83D04
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYNR2NHGe2Js for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15FDC83D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15FDC83D03
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15FDC83D03
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ae0a0cd709bso1017097666b.0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112895; x=1753717695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qe3toRqimTPznc81BeiyPdn9R6ROEg51uyRLOMQyrH8=;
 b=XE4HnZ+4DyopGBq0cwtYEU/oy7u/1doShsciRbcH1HUoWM5J4KhEfifNGQ++HZIXNx
 krV5NLstedIhyNj8FFbv8BGZsgKI7Ngc9NDCqTcCNlkTjwnkEXJ9mkxfMujxsAUyj9lK
 pnTh93b0LgCvGq7BEyg9iTrKgT/a5wvNA48Qiu8BFKcwCaivXk1HLBDlwzoj/1zqziNB
 +cezK7DnXHNK2nOxsVvlPB9yor3XG2q+IbvDSURfPV3XIKLr/NVirvBmJR+iaT+ExuBY
 9pO9iqQT3ieKbSOEyfW/GueBU0P4r2zZFpotU473X2q3ZMccXUeNcvlviC28mPyTfxov
 gO+Q==
X-Gm-Message-State: AOJu0YwcMNrIXPjFiLTNUl97wvE2yHm0DMPIKZ1kaM2qI196LTbKbB2h
 48h/Q797vDc1KrcmlUD4pnxCPCqrS6ywTqGh4/9j2CMi2IQnZfMDhwWrUEcZ0/1WgSY=
X-Gm-Gg: ASbGncuJ8TUBnA2nKy8wEu0/l4nge2tO0na/pv+cdIzfgU258/QKvzZx2qMAizb/XLl
 ZH62NdFvn8yxAKguarUgBnXQfY5hdl9EkqpZmYFIW627WVADYkz29gawA8jm2OtK+4UKzDdB6Bi
 wC1KRSC4kzOPKALcX4BazmUTOL73QrOtYEh78qJ5EW68psrM/tMIvBNQCpetENM0ExujgdyTXNY
 CBfuiBlqqojEEW0qcxk82Q1qwuZPqx+3pDSRgLuBwxvQwwsjLbM1RVAkn6fEwobSFqjsr2ii7So
 LLP9GhinJEq+S0Do9dswrkk+TNsO3vimY9uo8E0XrRkuUc+6tWf2XpOqRlaLMkEN2YjbG2m86k0
 zmDoXFAlm/ogWb8DHimDKnmc=
X-Google-Smtp-Source: AGHT+IFPke2yT9HgGuWaWRv4nVvOLi387xXm9bLLGpOtJ6whBoXYAKsOgZTsZUhr1cPl0TQoKuzjfA==
X-Received: by 2002:a17:907:608d:b0:ad8:942b:1d53 with SMTP id
 a640c23a62f3a-af155477befmr1503866b.27.1753112894953; 
 Mon, 21 Jul 2025 08:48:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7c7ebdsm695977566b.37.2025.07.21.08.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EDD5E5F888;
 Mon, 21 Jul 2025 16:48:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:02 +0100
Message-ID: <20250721154812.787883-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112895; x=1753717695; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qe3toRqimTPznc81BeiyPdn9R6ROEg51uyRLOMQyrH8=;
 b=AGrnYTFOKeh/v0xDOQ37oSCCfvpialEwze6WrRbM33p1TPkAbbFt3A9iAFW6MF9xJ+
 Y63laBRPpcb7p9+DkwvstMD7AWxXl5nyAbNDqrNi/KGrbv/opl5dfE9zTK4UW7PoIz+V
 J22pN2Y0fDD4gYXgHCVLkz2f4Z4rtiD4i/MZzuxrwQq5C7mGAlI3PLgqAmDiICV4e8I4
 x0SE6QCn8OgWaZ+HwZwRWIFZE4mXty0QOQ6wW0QHp77cDBeHceZir+SdKkDDOVW/xrm7
 8ZbuQFeIejekPSESim6VpksuxlWUOZXO68n82qV44pQUPcfFILakgl4Z+ylXkdV8SO0U
 UDmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AGrnYTFO
Subject: [Buildroot] [PATCH v3 1/9] toolchain/external: allow installing of
 libc utils
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
