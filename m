Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4424C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B3BD848F3;
	Fri, 14 Feb 2025 11:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzzI7UHC7Rgv; Fri, 14 Feb 2025 11:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76A2684912
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76A2684912;
	Fri, 14 Feb 2025 11:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E54BC2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A352340B86
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uvELIFgv2iH for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 747524064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747524064E
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 747524064E
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:57 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5de3c29ebaeso2429046a12.3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532115; x=1740136915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zaMqx80y+iG7zqIxFLdYPg5Jb5M3mBZIfe9En4eVAaQ=;
 b=MlsfjnKngBQlZLJ0NExYolNbT8j44e+w2YELhRxump8oEllnIkGZQhRQagvqUN1MTN
 uu/DAjs1UY3KbzPvRiLDQxyCmqptzjHOG5nanVpyBY7S7xJYBHoYShkHmLeY7b/TR36v
 e2avPlbfvsvtWMhO2sg8nETz7lVSvWJ55iUN1kR+jddPrOll/omMjQY9+WvuOXzYtDhe
 QwWKDEQTWAPW9nbvIMvwibdAA/K95t8ZBYHZch4TgpJ2+0FIhTPkFaYeiEldR5TwNssj
 RyZ5MU7N7j7HaWDLh0sA5cZrkypCrHYbGC54JVlMlc34zsFCfoeKihQdmi/cmp3zGNAJ
 RGkg==
X-Gm-Message-State: AOJu0YxZAinEqOm10SPAuUz6NOHjy4UBe3NMjkIH2Jbll0uvUwYtLrJ2
 dogEyyJfxnFqzkLLq76wg1BPJHG/W5Tg64UiWLfQlBid4Dhfsj59WSTArU+nHesWNHU9/wHgmf8
 y
X-Gm-Gg: ASbGncsjeVJrL+o66VMXkiGORrhqSGZ8es4+pIRQ8La/bYdHBGjBzzFTkEcrfo75zEI
 a/bhbzclFN5Y6HDdaTFVg6m9bogPTmgs86zqWL2tdfipzrgktCglSpbINnRM6Mc8Oi0f64IcQ7i
 Il2GkBGE3JZH4GSMBF7Zjd5F6nagE64R4qYuaiamYVE7Fe0xWhLomB9YCeudOwr5AKToSkP5VSO
 z432JtpoJOXqtrC7OuvaZ6T35/aJCNp17SPbBIbx6RO1WVYIcVwTgMSHnZ3QS3deZ8kAyLHD8/L
 7iJS+sjAuLeKOZZBhJN2tCjKPsfeueqKUuiqiS8pZs0=
X-Google-Smtp-Source: AGHT+IH5AQ1bopz7e6jU4cPtwXgjcihT4zErOKDatn1W/U/FIX2XjZFa4X+TA1EtJSs+RokAoG1qaQ==
X-Received: by 2002:a05:6402:274e:b0:5de:d45e:d7e5 with SMTP id
 4fb4d7f45d1cf-5ded45eda3fmr4537211a12.31.1739532115388; 
 Fri, 14 Feb 2025 03:21:55 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece270b17sm2725181a12.62.2025.02.14.03.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:21:54 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 12:21:39 +0100
Message-ID: <20250214112140.1862254-4-sairon@sairon.cz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214112140.1862254-1-sairon@sairon.cz>
References: <20250214112140.1862254-1-sairon@sairon.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1739532115; x=1740136915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zaMqx80y+iG7zqIxFLdYPg5Jb5M3mBZIfe9En4eVAaQ=;
 b=J5nyXN9eX/o+ie/g8H44Ki52yYkF+mvWxw5aP49mX7TBrMWZ+b/pumumVamG3ijESt
 A5J1mfP5JSb//1PqpJfoOcSk4rdZWZl2Lh0fQfvlxukmCM9oRAR32EtKzTW9Jf7aDVUL
 gYyaehM6PMR1xVQ4bndoctyVEPY6qrASdVvddYW9C5IjReqcBySSjL31pBo+NVmJ3jiZ
 0o6tZ11Jyd58pRpRpuzkUCFPknNc04SWqm8A9paa22VqmYazVJNZg5ChbInEtuEpWaQa
 Ckf7eHAYFMfiD5xzT58dIjMAobBx46BznRu+eHmVj+6hVWDxKiwXRg99wjR8+BKQIEEz
 O4LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=J5nyXN9e
Subject: [Buildroot] [v2 3/3] fs/erofs: add custom compression option with
 optional compress-hints file
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGFub3RoZXIgb3B0aW9uIGZvciBGUyBjb21wcmVzc2lvbiB0aGF0IGFsbG93cyBmaW5lLWdy
YWluZWQgY29udHJvbCB1c2luZyBhCmxpc3Qgb2YgYWxnb3JpdGhtcyBhbmQgb3B0aW9uYWwgY29t
cHJlc3MtaGludHMgZmlsZS4gVGhpcyB3YXkgbXVsdGlwbGUKYWxnb3JpdGhtcyBhbmQgcGNsdXN0
ZXIgc2l6ZXMgY2FuIGJlIHVzZWQgZm9yIGRpZmZlcmVudCBmaWxlcywgZnVsbHkgZXhwb3NpbmcK
RVJPRlMgY29tcHJlc3Npb24gYWJpbGl0aWVzLgoKU2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6Fr
IDxzYWlyb25Ac2Fpcm9uLmN6PgotLS0KIGZzL2Vyb2ZzL0NvbmZpZy5pbiB8IDM2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZnMvZXJvZnMvZXJvZnMubWsgIHwgIDUgKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2Vy
b2ZzL0NvbmZpZy5pbiBiL2ZzL2Vyb2ZzL0NvbmZpZy5pbgppbmRleCBmZWM4ZWZhMTVlLi41Nzc5
ODhhMTk4IDEwMDY0NAotLS0gYS9mcy9lcm9mcy9Db25maWcuaW4KKysrIGIvZnMvZXJvZnMvQ29u
ZmlnLmluCkBAIC0yMiw2ICsyMiwxMCBAQCBjaG9pY2UKIAkgIHNsb3dlciBib3RoIGluIGNvbXBy
ZXNzaW9uIGFuZCBkZWNvbXByZXNzaW9uLCBhbmQgaGlnaGVyCiAJICBjb21wcmVzc2lvbiBsZXZl
bHMgY2FuIGhhdmUgbm90aWNlYWJsZSBtZW1vcnkgcmVxdWlyZW1lbnRzLgogCisJICBDdXN0b20g
Y29tcHJlc3Npb24gYWxsb3dzIGZvciBhZHZhbmNlZCBjb25maWd1cmF0aW9uIG9mIHRoZQorCSAg
Y29tcHJlc3Npb24gYWxnb3JpdGhtcywgYW5kIGFkZHMgdGhlIHBvc3NpYmlsaXR5IG9mCisJICBm
aW5lZ3JhaW5lZCBwZXItZmlsZSBjb21wcmVzc2lvbiB1c2luZyBjb21wcmVzc2lvbiBoaW50cy4K
KwogY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX05PTkUKIAlib29sICJubyBjb21wcmVz
c2lvbiIKIApAQCAtMzEsNiArMzUsOSBAQCBjb25maWcgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNf
TFo0SEMKIGNvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWk1BCiAJYm9vbCAibHptYSIK
IAorY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0NVU1RPTV9DT01QUkVTU0lPTgorCWJv
b2wgImN1c3RvbSIKKwogZW5kY2hvaWNlCiAKIGlmIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xa
NEhDCkBAIC01OCw2ICs2NSwzNSBAQCBjb25maWcgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFpN
QV9MRVZFTAogCiBlbmRpZiAjIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaTUEKIAoraWYgQlIy
X1RBUkdFVF9ST09URlNfRVJPRlNfQ1VTVE9NX0NPTVBSRVNTSU9OCisKK2NvbmZpZyBCUjJfVEFS
R0VUX1JPT1RGU19FUk9GU19DT01QUkVTU0lPTl9BTEdPUklUSE1TCisJc3RyaW5nICJjb21wcmVz
c2lvbiBhbGdvcml0aG1zIgorCWRlZmF1bHQgImx6NGhjLDEyIgorCWhlbHAKKwkgIFNwZWNpZnkg
YXJiaXRyYXJ5IGNvbXByZXNzaW9uIG9wdGlvbiwgdXNlZnVsIGluIGNvbWJpbmF0aW9uCisJICB3
aXRoIGNvbXByZXNzaW9uIGhpbnRzLiBJbmRpdmlkdWFsIGFsZ29yaXRobXMgYXJlIHNlcGFyYXRl
ZAorCSAgYnkgY29sb24gd2l0aCBvcHRpb25hbCBsZXZlbCwgZS5nLiAibHo0aGMsMTI6bHptYSIu
CisJICBTZWUgZXJvZnMtdXRpbHMgZG9jdW1lbnRhaW9uIGZvciBkZXRhaWxlZCBpbmZvcm1hdGlv
bi4KKworY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0NPTVBSRVNTSU9OX0hJTlRTCisJ
c3RyaW5nICJwYXRoIHRvIGNvbXByZXNzaW9uIGhpbnRzIGZpbGUiCisJZGVmYXVsdCAiIgorCWhl
bHAKKwkgIFBhdGggdG8gZmlsZSBjb250YWluaW5nIGNvbXByZXNzaW9uIGhpbnRzLiBFYWNoIGxp
bmUgaW4gdGhlCisJICBmaWxlIGlzIGRlZmluZWQgYnkgdG9rZW5zIHNlcGFyYXRlZCBieSBzcGFj
ZXMgaW4gdGhlCisJICBmb2xsb3dpbmcgZm9ybS4gT3B0aW9uYWxseSwgaW5zdGVhZCBvZiB0aGUg
Z2l2ZW4gcHJpbWFyeQorCSAgYWxnb3JpdGhtLCBhbGdvcml0aG1zIGNhbiBiZSBzcGVjaWZpZWQg
d2l0aCB6ZXJvLWJhc2VkCisJICBhbGdvcml0aG0taW5kZXggZXhwbGljaXRseToKKworCSAgPHBj
bHVzdGVyLXNpemUtaW4tYnl0ZXM+IFthbGdvcml0aG0taW5kZXhdIDxtYXRjaC1wYXR0ZXJuPgor
CisJICBtYXRjaC1wYXR0ZXJucyBhcmUgZXh0ZW5kZWQgcmVndWxhciBleHByZXNzaW9ucywgbWF0
Y2hlZAorCSAgYWdhaW5zdCBhYnNvbHV0ZSBwYXRocyB3aXRoaW4gdGhlIG91dHB1dCBmaWxlc3lz
dGVtLCB3aXRoIG5vCisJICBsZWFkaW5nIC8uCisKK2VuZGlmICMgQlIyX1RBUkdFVF9ST09URlNf
RVJPRlNfTFpNQQorCiBjb25maWcgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfREVEVVBFCiAJYm9v
bCAiZW5hYmxlIGRhdGEgZGVkdXBsaWNhdGlvbiIKIAlkZXBlbmRzIG9uICFCUjJfVEFSR0VUX1JP
T1RGU19FUk9GU19OT05FCmRpZmYgLS1naXQgYS9mcy9lcm9mcy9lcm9mcy5tayBiL2ZzL2Vyb2Zz
L2Vyb2ZzLm1rCmluZGV4IDNiNjRjYjFjNmUuLjY1NDNhMzY0ZjEgMTAwNjQ0Ci0tLSBhL2ZzL2Vy
b2ZzL2Vyb2ZzLm1rCisrKyBiL2ZzL2Vyb2ZzL2Vyb2ZzLm1rCkBAIC0xMCw2ICsxMCwxMSBAQCBp
ZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaNEhDKSx5KQogUk9PVEZTX0VST0ZTX0FS
R1MgKz0gLXpsejRoYywkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaNEhDX0xFVkVMKQogZWxz
ZSBpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaTUEpLHkpCiBST09URlNfRVJPRlNf
QVJHUyArPSAtemx6bWEsJChCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWk1BX0xFVkVMKQorZWxz
ZSBpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0NVU1RPTV9DT01QUkVTU0lPTikseSkK
K1JPT1RGU19FUk9GU19BUkdTICs9IC16JChzdHJpcCAkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZT
X0NPTVBSRVNTSU9OX0FMR09SSVRITVMpKQoraWZuZXEgKCQoc3RyaXAgJChCUjJfVEFSR0VUX1JP
T1RGU19FUk9GU19DT01QUkVTU0lPTl9ISU5UUykpLCkKK1JPT1RGU19FUk9GU19BUkdTICs9IC0t
Y29tcHJlc3MtaGludHMgJChzdHJpcCAkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0NPTVBSRVNT
SU9OX0hJTlRTKSkKK2VuZGlmCiBlbmRpZgogCiBpZmVxICgkKEJSMl9SRVBST0RVQ0lCTEUpLHkp
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
