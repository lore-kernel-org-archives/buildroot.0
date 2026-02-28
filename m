Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2958CFEE4D9
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 09:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63004418E3;
	Sat, 28 Feb 2026 09:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zWPUtRc5NGw; Sat, 28 Feb 2026 09:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A1C418D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772269709;
	bh=p67C1sNONvjB7J8543VgGlLqGjhnZDblGqVY2mYHk10=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=e6YmbgJvLuxATZTCuM5VHjzPRB/EwQFbikdjX9d1/8F6sKT6dHQQgP+iluDMZStQM
	 4GQQSKlOgWlriIt1Y4RC4fsKIcLhYZkLednXFGx/GT7Fbpn6d1towA2eXldX7qLm81
	 GQ7o+8VBBGmgU5p11TJpunilcp9KE8YxmW6p/spaYg3ceY4Jul6IP0sBcrQV2hbbtP
	 +wnmWlHnivQwRHj/sV93Kyf5urUxBw9XBCDpSUWJh35Y0zTugd23KB3JRk3/uT5OsI
	 DxIGLVzLTCyMOretXDa0d85yRIjF5tqHf1Rmt3bmWXbIb+QBoCPuW5rZSPrKntxJhA
	 uqW5nCzCJnneQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A1C418D9;
	Sat, 28 Feb 2026 09:08:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E1481D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 09:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BCB040177
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 09:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zL7rXnvKBdz for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 09:08:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0DCB40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0DCB40018
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0DCB40018
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 09:08:26 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-389fa352b0eso21512571fa.1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 01:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772269704; x=1772874504;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3Y0H7O5kFRF+MO6QOB8sglXEdT2PgRN15OK1YpVOflc=;
 b=n5QyvDbEF40xkc4lRuuaTIaJVdL/ldwMWPYyBoTRgI3PaJs+LkzNGpWPqGCOpT79xL
 RPcWqq3AS+TN7edWDh4JfjVT1/u0WRu5EjQEf2Wb0aQjaHO8/7j+TzFIEVQiipr/TFbs
 FJvfmFBnpQ9caack7Cr+OPdaH2ot370UaKAL0EdNoKv1ft4sq+CnLJtIRnu9+n/7dCcz
 nkkhvcia3BqG1BAPOFaTKIXU2kR1PRK1VjFSHQHWpZmkuh4eyGxxXEnIvIO7M6rrB/gE
 68WlHsduR5bzZwn3KnfHiPF3meX1pgMfT0Mc4b0ttCTf266IicFv2HRdI3yetPrQblt2
 +lVA==
X-Gm-Message-State: AOJu0YzVsWXIbuSQi21qrEeJgc/BLs6gzmv/2uDhgV3qnzGozCIIBAgK
 QZFM5g60LLS+CuCZDPthfEj5g9QyV4vRv8U95NTysGalQ6L/85VOvuaatDGBf2Bf
X-Gm-Gg: ATEYQzz4DLJhcv8BqgPLaXMq+TeHDHoKwktPRZXvZ6eMsn7kRb9j1iATaG6gDN9nWNL
 Op84WqdcXYor7pEzieMfjlk6qEckGBCICSAe00RlNO2X41FYOQKoO4dr/6tusSPgdw75VXLnaQe
 5CRTymVZ5hAnCk9s7kjlps6OQAZcEiMdpt1zfELc1QSv/Z9ATXg6icXUV9iXlv+jDfjPGQ4/cNI
 smjMv6UVortfGmKw+81MedVCvkcYWnyWr+T4Ftfm01PU7TyHBHSUWmu6CdIyZCtqAltY858DXG0
 J6yrZdpL9S39KrqK6w/Nf1B8yGJR5NVvMbWzQw4uFOXkkngZXjRcuBKZx2vc3hdpxMs7YNA6PXK
 fj6tPZKYf/a8dcBLMDnkpOjcdW99Tw4TDu0Gxr5kFRJl8TClmabCnpNvxKiCYnhO1UnjURPV8ks
 aWri/2YFnxhFM/LcCpupLhi6+VdPzWTNj6OtxJ26xjj5p65jZGnQi3eHQU0PDJ+A==
X-Received: by 2002:a2e:a541:0:b0:38a:27e:b91b with SMTP id
 38308e7fff4ca-38a027ebc18mr38048631fa.30.1772269702966; 
 Sat, 28 Feb 2026 01:08:22 -0800 (PST)
Received: from tollan.addiva.ad (h-79-136-37-74.A259.priv.bahnhof.se.
 [79.136.37.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a118894d33sm183831e87.68.2026.02.28.01.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 01:08:22 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 10:08:20 +0100
Message-ID: <20260228090820.1811802-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772269704; x=1772874504; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Y0H7O5kFRF+MO6QOB8sglXEdT2PgRN15OK1YpVOflc=;
 b=ifg+bM1V/we+E5GyMDaChyKyP7htDnFtbr3G/zmsJ7k3GC9/2Z+nvgzPjtjfl1u59X
 hAyVMFiBglyjaKccvsKsGj6NNPgwJIceYqFdS4yTSOuIZ8hqROn00bLa1BUpcNSOngKI
 0UgHlDZcsbWE/T84wXduyI+mPeoQl0cEek657+tB+HCkDFXDa8IwxUxUdLAYxGzzEyoR
 mz7CZxhNcFMsO2rgNJ9iBGT+n6C52vZ2kREZAfMCU83jGEWYKTRG6grOCPCCT5iyxXv5
 sgb/Fl6I+/eRbk+JPPamjS1misgzzzVGAUunNhuDpYkDILZkvEShHcjVHC6/RseA1sfB
 CjhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ifg+bM1V
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add option to
 select Airoha EN8811H
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpY2ggaXMgYSAyLjVHIEV0aGVybmV0IFBIWS4KClNpZ25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fs
c3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvbGludXgtZmlybXdhcmUvQ29u
ZmlnLmluICAgICAgICAgfCA1ICsrKysrCiBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZp
cm13YXJlLm1rIHwgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4gYi9wYWNrYWdlL2xp
bnV4LWZpcm13YXJlL0NvbmZpZy5pbgppbmRleCA0YTZlYWE5NDI4Li41YWQ0OTU3NzU2IDEwMDY0
NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2xp
bnV4LWZpcm13YXJlL0NvbmZpZy5pbgpAQCAtNTg5LDYgKzU4OSwxMSBAQCBlbmRtZW51CiAKIG1l
bnUgIkV0aGVybmV0IGZpcm13YXJlIgogCitjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdB
UkVfQUlST0hBX0VOODgxMUgKKwlib29sICJBaXJvaGEgRU44ODExSCAyLjVHIEV0aGVybmV0IFBI
WSIKKwloZWxwCisJICBGaXJtd2FyZSBmaWxlcyBmb3IgdGhlIEFpcm9oYSBFTjg4MTFIIDIuNUcg
RXRoZXJuZXQgUEhZLgorCiBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfQlJPQURD
T01fVElHT04zCiAJYm9vbCAiQnJvYWRjb20gTmV0WHRyZW1lL1RpZ29uMyIKIAloZWxwCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIGIvcGFja2Fn
ZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawppbmRleCA2ZTU4ODE0Mjc5Li4wYTM1
ZDcyYmM0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
Lm1rCisrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKQEAgLTY3
NSw2ICs2NzUsMTEgQEAgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLVF1Wi0qLnVjb2RlCiBMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNF
TkNFLml3bHdpZmlfZmlybXdhcmUKIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhf
RklSTVdBUkVfQUlST0hBX0VOODgxMUgpLHkpCitMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBhaXJv
aGEvRXRoTUQzMi5kbS5iaW4gYWlyb2hhL0V0aE1EMzIuRFNQLmJpbgorTElOVVhfRklSTVdBUkVf
QUxMX0xJQ0VOU0VfRklMRVMgKz0gTElDRU5TRS5haXJvaGEKK2VuZGlmCisKIGlmZXEgKCQoQlIy
X1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfQlJPQURDT01fVElHT04zKSx5KQogTElOVVhfRklSTVdB
UkVfRklMRVMgKz0gdGlnb24vKgogTElOVVhfRklSTVdBUkVfQUxMX0xJQ0VOU0VfRklMRVMgKz0g
TElDRU5DRS50aWdvbgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
