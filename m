Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32F2C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 17:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6712381DE4;
	Mon, 12 May 2025 17:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPYIp-2JdTeV; Mon, 12 May 2025 17:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBBB81B71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EBBB81B71;
	Mon, 12 May 2025 17:35:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68CEC17D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65A6E60596
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MY_7eEJQbASN for <buildroot@buildroot.org>;
 Mon, 12 May 2025 17:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 495A3607B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 495A3607B5
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 495A3607B5
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:18 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54b1095625dso5662881e87.0
 for <buildroot@buildroot.org>; Mon, 12 May 2025 10:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747071316; x=1747676116;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rcc2Yil8O+nuuAm3GT+iL88KvQlWypz4BotXLfuTCtc=;
 b=CrIO+aCF3mLcgVHPvjeExlaATwFxwc/T4vRHNchLut7TY66XMoZb0Kr071jVQTTeeh
 JGC0cSfRcdvpD7YOKrV+qed0GL4hXdCfOFblXiCDT1iWco/cb5TUkywM56JDyKSoVTot
 pSk3lwx0C3k4GdNtbCKhNeo6jff3FTgw0xNwG+Q7DAAPfJWyWgTS+VoyLM/RKZxknzEy
 Op2eCPiNOrZPHxWNvYzzxRW68eTvV5/0cUNh1p5nXnXm2gkksOntqTCAuw79Lphcr1kb
 8Q98t3GYpoKXynU2uOIC9NkIOmb6YNCKDf36kz22AeHZp2ZVfpXSwHbXxY159vWcYXFp
 5IaQ==
X-Gm-Message-State: AOJu0YzoQY3DeJvPNIHdXGH8+VfVciT0swCHedTibfUAQMm/n11/ic2l
 TRm5W7jKUGr/eSLpsJoBrhsA4mOL/LjTFsD7arqqYl9XUJzzsuuuQs6ePcWj
X-Gm-Gg: ASbGncs9QYStR8Duvmyst4XmXS2A81dcmoCGtnV9d0ZmobV2fjCyFg1HC6jyV0Hj6q/
 rIU+ph6F9mbedZcvzEXtPemcMhL6TTnSLwiCO9uJNOe8E4xCKADWnLLwcpSeEDbY9SAdPBYrHEO
 Ah6AND7WegEvoPUJ53dZoPrGFqJ5kVYs0EmfAGIrQCwz1ksTGlaE1nmUGhjQKYu205kwlK/eBH/
 jHfVmwI8aPFIX3H3EawSQXDQa812YkifGnBf7h2QoFq+dkmPApK2VprDefTdxbVFw68omxSbeRu
 GS2ffi0ZgRnwXAFXGEnfq7MBjPVR6gvssUYR2LlKMiYMwKlr9fPfVfPrhSqvXTnJkXMMwwQGI4E
 =
X-Google-Smtp-Source: AGHT+IH/RroZRiH8ECWY5t4VpLIfQ5c9bi0pYxrsM5sxj4nsnbx18c1sF4QYKKrTt3DsO694omgghQ==
X-Received: by 2002:a05:6512:b86:b0:549:7394:2ce5 with SMTP id
 2adb3069b0e04-54fc67d6347mr5053165e87.41.1747071315445; 
 Mon, 12 May 2025 10:35:15 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645d93asm1582086e87.101.2025.05.12.10.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 10:35:14 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Mon, 12 May 2025 19:35:04 +0200
Message-ID: <20250512173506.3179898-5-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512173506.3179898-1-lazzer@gmail.com>
References: <20250512173506.3179898-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747071316; x=1747676116; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rcc2Yil8O+nuuAm3GT+iL88KvQlWypz4BotXLfuTCtc=;
 b=iNPofXH/chjGgSM7HAhKReWPW9oOhX12OWVVhvSwqe0GQbNMoUzhlKTrWHGT1YKtKg
 RRmBYoAd293K8eKg2UwxgISiincwssl8KS22iQCJ1L1WYL75mpwrZNAFaQh07LcUyY7m
 ownYMpjKA9JGbyqpbqCDkzwH4mi2rLrxPSLtWRgckQvWj3UxoK+Ymg3k3343Cbyt+Xs2
 fUfRv0hTsrRuwNQY3iprsPBR2fmGrVYLeQatvSvpVpx1naKXKJAbIE3AtrLPLLP2DB49
 hRmNe/jDGayJhHscHDuuqWrUD1sZjjra1dC540CiKUkCcuQXau5SRyJdeWwn984g2ORd
 RulA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iNPofXH/
Subject: [Buildroot] [PATCH v3 4/6] package/libnetconf2: Update dependencies
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgbGlibmV0Y29uZjIgaXMgcG9zc2libGUgdG8gYnVpbGQgd2l0aG91dApPcGVuU1NMIGFz
IGxvbmcgYXMgRU5BQkxFX1NTSF9UTFMgaXMgbm90IHNldCwKYWRkaW5nIG9wdGlvbiBCUjJfUEFD
S0FHRV9MSUJORVRDT05GMl9TU0hfVExTIHRvCm9wdC1pbiB0aGlzIGZlYXR1cmUuCgpTaWduZWQt
b2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6emVyQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdl
L2xpYm5ldGNvbmYyL0NvbmZpZy5pbiAgICAgIHwgIDggKysrKysrKysKIHBhY2thZ2UvbGlibmV0
Y29uZjIvbGlibmV0Y29uZjIubWsgfCAxOSArKysrKysrKy0tLS0tLS0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGlibmV0Y29uZjIvQ29uZmlnLmluIGIvcGFja2FnZS9saWJuZXRjb25mMi9Db25maWcu
aW4KaW5kZXggMTc2MzI0MzEyMC4uOTcwYjJlMjg4OCAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJu
ZXRjb25mMi9Db25maWcuaW4KKysrIGIvcGFja2FnZS9saWJuZXRjb25mMi9Db25maWcuaW4KQEAg
LTEyLDYgKzEyLDE0IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJORVRDT05GMgogCiAJICBodHRw
czovL2dpdGh1Yi5jb20vQ0VTTkVUL2xpYm5ldGNvbmYyCiAKK2lmIEJSMl9QQUNLQUdFX0xJQk5F
VENPTkYyCitjb25maWcgQlIyX1BBQ0tBR0VfTElCTkVUQ09ORjJfU1NIX1RMUworCWJvb2wgIlNT
SC9UTFMgc3VwcG9ydCIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTCBpZiAhQlIyX1BBQ0tB
R0VfTUJFRFRMUworCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJDVVJMCisJc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQlNTSAorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJTU0hfU0VSVkVSCitlbmRpZgogY29t
bWVudCAibGlibmV0Y29uZjIgbmVlZHMgYSB0b29sY2hhaW4gdy8gdGhyZWFkcywgZHluYW1pYyBs
aWJyYXJ5IgogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fSEFTX1NZTkNfNApkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25m
Mi5tayBiL3BhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIubWsKaW5kZXggMGQ3NGJkNzM2
ZC4uNzlkODQxOWExMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25m
Mi5taworKysgYi9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLm1rCkBAIC0xNiwxOCAr
MTYsMTYgQEAgTElCTkVUQ09ORjJfQ09ORl9PUFRTID0gXAogCS1ERU5BQkxFX1RFU1RTPU9GRiBc
CiAJLURFTkFCTEVfVkFMR1JJTkRfVEVTVFM9T0ZGCiAKLWlmZXEgKCQoQlIyX1BBQ0tBR0VfTElC
U1NIX1NFUlZFUiksIHkpCi1MSUJORVRDT05GMl9DT05GX09QVFMgKz0gLURFTkFCTEVfU1NIPU9O
Ci1MSUJORVRDT05GMl9ERVBFTkRFTkNJRVMgKz0gbGlic3NoCitpZmVxICgkKEJSMl9QQUNLQUdF
X0xJQk5FVENPTkYyX1NTSF9UTFMpLHkpCitMSUJORVRDT05GMl9DT05GX09QVFMgKz0gLURFTkFC
TEVfU1NIX1RMUz1PTgorTElCTkVUQ09ORjJfREVQRU5ERU5DSUVTICs9IGxpYmN1cmwgbGlic3No
CitpZmVxICgkKEJSMl9QQUNLQUdFX01CRURUTFMpLHkpCitMSUJORVRDT05GMl9ERVBFTkRFTkNJ
RVMgKz0gbWJlZHRscwogZWxzZQotTElCTkVUQ09ORjJfQ09ORl9PUFRTICs9IC1ERU5BQkxFX1NT
SD1PRkYKLWVuZGlmCi0KLWlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCT1BFTlNTTCksIHkpCi1MSUJO
RVRDT05GMl9DT05GX09QVFMgKz0gLURFTkFCTEVfVExTPU9OCiBMSUJORVRDT05GMl9ERVBFTkRF
TkNJRVMgKz0gb3BlbnNzbAorZW5kaWYKIGVsc2UKLUxJQk5FVENPTkYyX0NPTkZfT1BUUyArPSAt
REVOQUJMRV9UTFM9T0ZGCitMSUJORVRDT05GMl9DT05GX09QVFMgKz0gLURFTkFCTEVfU1NIX1RM
Uz1PRkYKIGVuZGlmCiAKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCWENSWVBUKSx5KQpAQCAtMzcs
OCArMzUsNyBAQCBlbmRpZgogSE9TVF9MSUJORVRDT05GMl9DT05GX09QVFMgPSBcCiAJLURFTkFC
TEVfVEVTVFM9T0ZGIFwKIAktREVOQUJMRV9WQUxHUklORF9URVNUUz1PRkYgXAotCS1ERU5BQkxF
X1NTSD1PRkYgXAotCS1ERU5BQkxFX1RMUz1PRkYKKwktREVOQUJMRV9TU0hfVExTPU9GRgogCiAk
KGV2YWwgJChjbWFrZS1wYWNrYWdlKSkKICQoZXZhbCAkKGhvc3QtY21ha2UtcGFja2FnZSkpCi0t
IAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
