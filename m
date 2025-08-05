Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6056CC87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 089FF83EE3;
	Tue,  5 Aug 2025 15:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOjw62nrLxKo; Tue,  5 Aug 2025 15:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2692C83ED5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2692C83ED5;
	Tue,  5 Aug 2025 15:18:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8577612C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76F7241B83
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zd32gYoKm46j for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CE4041B5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE4041B5D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CE4041B5D
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b8db5e9b35so2281008f8f.1
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407096; x=1755011896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qe3toRqimTPznc81BeiyPdn9R6ROEg51uyRLOMQyrH8=;
 b=CQyrI6/5J1EN8Zh7NRaXDejVLRWYGQF2l7qjN7KlTVxkFbDqPwxLV15Zs8m9U/VfcZ
 vi8oLeSBOsSBE/ieBPAET6MLuc/ed1GpcDl5OzHQwB4YnfIxTS+e0dxPcWInqe6wNCmp
 PWPPlB/rznZzoHMfa8vIe6sSeXw8yoT3lF2Bl9jrw1vg0CIg8uytxucbM5iL/IBAuYii
 y+6ai59D2obAKhBEXCugmRoL2hsOdJROyWtRn0zxzF3dZAt4HZsJ2B5ctxaracx98X2G
 ZPTgh1qnKIQFTk9SFbu8kh1ABNUro8GsWQWTECITIi7Ojb75tFHoHh47akDy5MPpM1CC
 +bPw==
X-Gm-Message-State: AOJu0Yz44US5Y7u/G2RdOBlZtMyrRJ02G4UPSz5bGKFHuNtUQeoVlfzJ
 TGRktDUM+bBaV1ekGxDTZAJoRXeYZ2GAxaEycnmr8niH4r2qtRHuI7mRCA58ySKr2A289EFl7y9
 NeLkv
X-Gm-Gg: ASbGncsEyERZH9QILTIfX5Nfi3T1bxQgznkyNpNEfVYY8FB1N3KmqmfOFZdmkfIVuQb
 a+w7klBh+D6+NpMPdouF/42byv2dh6QVpkbAGG7o7Mg7Zp4XVSLilMjO3Du2T+F2/bYUAVlQt0j
 WEzsKEpDvTJUiEf9jsiKEnvZK2d+OxDaCM1tDbWCnGbCysrh0UjAu3hKlqj7JeMvOyMQg8MEVi9
 RVDbFKuV+OQgQ8wqAd8uTpamQG8rGAvZhnn/sqf3nykm/CZnMtOXS4pnGnJz5mZ/2vxg/mwHu8a
 osiJfH2BK2UQMEX/miDvmkhVwJW229KPrV25rsXZldE7QNv7EEo82xq2wtSLNtWYiL36w2alwGm
 CYemRT81xSmCf4xF5jptehTpswDA7/7yHDg==
X-Google-Smtp-Source: AGHT+IGecMajMIAR2IwuDfq+ajJ6ivv8gLe0likIKvIDFG+DWLwXkDgC+LOwaTOOKYpipcF4Wfdc5g==
X-Received: by 2002:a05:6000:2a82:b0:3b8:ebfb:4592 with SMTP id
 ffacd0b85a97d-3b8ebfb45e7mr2033418f8f.55.1754407096402; 
 Tue, 05 Aug 2025 08:18:16 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9160sm19648450f8f.21.2025.08.05.08.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 563FF5F892;
 Tue, 05 Aug 2025 16:18:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:03 +0100
Message-ID: <20250805151814.1114414-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407096; x=1755011896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qe3toRqimTPznc81BeiyPdn9R6ROEg51uyRLOMQyrH8=;
 b=LZjfPxK1yjhICM1pUWIWSMFA7eD33Zpea62uUnXqc/KiRDxRQ/aIB46rBo7L4UOWfb
 gEZPVzcJYUXNUO8BU3pAGnyUk53Wz1uoBvcUXrGBB5be+VplnGX00a6cR1S2MInodj1H
 rSsPYG4SIlAvzIClg73cR3KLy2Gu5esdrOFRKQaMExwDlRvfyBgm0DeMtDanvv/REVFf
 6bTxP3dvRrLUHmY0+5a6Oh9BGAw6CbuBrsnkxkNX4K+Bq3lqFz+UmECAh4XwSwy5Umxm
 eeCcAYPrMjan4X7j4GsAEhIHMai0OCPO6SYhdVxL7VBf+//cNqjlxpfGC/duLgvCCIOs
 rVew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LZjfPxK1
Subject: [Buildroot] [PATCH v4 1/9] toolchain/external: allow installing of
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
