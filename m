Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190D3C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 08:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F9D41775;
	Wed,  3 Jul 2024 08:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBb_ihzNK0vY; Wed,  3 Jul 2024 08:29:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B0B40879
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B0B40879;
	Wed,  3 Jul 2024 08:29:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8F51BF2EC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 199AC80FE8
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDXM3G6fP5Dy for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 08:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F9E980E08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F9E980E08
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F9E980E08
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 08:29:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so3357003a12.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 01:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719995359; x=1720600159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cp9Bi9uBLes3UEKyUgW8fZF6EvNuJVnsuqrjl98VSw=;
 b=ALziWwLKmmI/0NYjiS1pFh6DMdkCCYOzOaVHEvExsH8IfleFE8DEIijFk5MwrU90jQ
 UAm3kqIM5hn4WfBfDh0H2dsz4NaLKm4lqRH8wzUnm2fXjwMMIcO6pJ9ZyD4hgYI3wYqc
 xs6EmKKv27rpBNUBNVkelM/fvsN6zTOhDoj2KAuNRZocNAFJKX8RxBxKdbrEz5pT6ela
 Gguk34qydLPL3eaIZuQdoDSYCIBfqsQUj0pKg66swhDDcr204Wz1IAWvSVGjxHQFho6e
 wNeHA1mVWDnwhzvBSxnmFwdTpAaGVjSL6lyqQr/yyHd97nIRs/Y71e104VUiJFmYk/aU
 L+zw==
X-Gm-Message-State: AOJu0YwcE3IqpfrktbP/LUmjjRiZ1sglEYrxB+e/5BivxFEFzia5LGV9
 2S04YiWAZ5axvMm/5jjZHusoMAJRM7ox66gJMH/jU8uqBcNPVvbCY0umirLZgA6OCZKNdI45Q5+
 E
X-Google-Smtp-Source: AGHT+IHKEX7t88FzzsOLdJahrigE5DmaQcwVSHF7wxd0UmZBGOJjsui84I4VhDpGXGYki2xEhAlwHQ==
X-Received: by 2002:a05:6402:2681:b0:58c:95eb:e59e with SMTP id
 4fb4d7f45d1cf-58c95ebe633mr943771a12.39.1719995359146; 
 Wed, 03 Jul 2024 01:29:19 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f0a3sm6725115a12.35.2024.07.03.01.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:29:18 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 10:28:49 +0200
Message-Id: <20240703082850.750420-4-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703082850.750420-1-sairon@sairon.cz>
References: <20240703082850.750420-1-sairon@sairon.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1719995359; x=1720600159; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cp9Bi9uBLes3UEKyUgW8fZF6EvNuJVnsuqrjl98VSw=;
 b=ac/J22lvjeW4DXYKehJax+JVzZ+FudfKz14nzjhUVRGvLC7lkC7JzFNEjw2TyyxXps
 eLzqVRKn6zzxsKIFhjCJ43kAepHbtmI/lp1R3XPwOX8r9vVFJlWmASbUMPupa+kchM4G
 06X+7B8xYXqD/mpWDfBXXlWEKq0c9eDrd9+A2k4GZFk2kmqCT+Thqm3a151xCvsciJEk
 JJDwMRTzapKpzlg3Hpm76PGITsRwBmQOxu6AGxzBKdM/ZXvIkB0PX3r5efNqfB45DbB8
 ZOwgquDVFa7lYKtMvgXl38yvIzgvWPRg7L/WpLlb1U+DvX++hLgQJn1roxl6T39eztOM
 ny9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=ac/J22lv
Subject: [Buildroot] [PATCH 3/4] fs/erofs: add LZMA compression,
 allow configurable compression level
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Gao Xiang <hsiangkao@aol.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW5zdGVhZCBvZiBoYXZpbmcgYSBib29sIG9wdGlvbiBmb3IgZW5hYmxpbmcgdGhlIExaNEhDIGNv
bXByZXNzaW9uLCBjaGFuZ2UgdGhlCktjb25maWcgZGVmaW5pdGlvbiB0byBhIGNob2ljZSwgd2hp
Y2ggYWxzbyBhZGRzIG1vcmUgZmxleGliaWxpdHkgaW4gdGhlIGZ1dHVyZQooZS5nLiBmb3IgZW5h
YmxpbmcgWlNURCBjb21wcmVzc2lvbikuIFRoZSBuYW1lIG9mIHRoZSBvbGQgb3B0aW9uIHdhcyBw
cmVzZXJ2ZWQKc28gZGVmY29uZmlncyB1c2luZyBpdCB3b24ndCBiZSBhZmZlY3RlZC4KClR3byBt
b3JlIG9wdGlvbnMgZm9yIGNvbXByZXNzaW9uIHdlcmUgYWRkZWQsIHRoZSBzdGFuZGFyZCBMWjQg
KGkuZS4gbm9uLUhDKQpjb21wcmVzc2lvbiBhbGdvcml0aG0gYW5kIExaTUEuCgpBbHNvIGZvciBM
Wk1BIGFuZCBMWjRIQywgaXQncyBub3cgcG9zc2libGUgdG8gZGVmaW5lIGNvbXByZXNzaW9uIGxl
dmVsLgpQcmV2aW91c2x5IGl0IGRlZmF1bHRlZCB0byA5LCB3aGljaCBnZW5lcmF0ZXMgaW1hZ2Vz
IGxhcmdlciB0aGFuIHNxdWFzaGZzIHdpdGgKY29tcGFyYWJsZSBzZXR0aW5ncyAod2hpY2ggdXNl
cyBsZXZlbCAxMiBieSBkZWZhdWx0KS4gRm9yIExaNEhDIHRoZSBkZWZhdWx0IGlmCnVuc2V0IHdv
dWxkIGJlIHN0aWxsIDkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWly
b24uY3o+Ci0tLQogZnMvZXJvZnMvQ29uZmlnLmluIHwgNDMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLQogZnMvZXJvZnMvZXJvZnMubWsgIHwgIDggKysrKysrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9mcy9lcm9mcy9Db25maWcuaW4gYi9mcy9lcm9mcy9Db25maWcuaW4KaW5kZXggZTEx
MjU3MjY4OC4uZDU5N2RlMDk0MCAxMDA2NDQKLS0tIGEvZnMvZXJvZnMvQ29uZmlnLmluCisrKyBi
L2ZzL2Vyb2ZzL0NvbmZpZy5pbgpAQCAtNiwxMCArNiw0OSBAQCBjb25maWcgQlIyX1RBUkdFVF9S
T09URlNfRVJPRlMKIAogaWYgQlIyX1RBUkdFVF9ST09URlNfRVJPRlMKIAorY2hvaWNlCisJcHJv
bXB0ICJDb21wcmVzc2lvbiBhbGdvcml0aG0iCisJZGVmYXVsdCBCUjJfVEFSR0VUX1JPT1RGU19F
Uk9GU19MWjRIQworCWhlbHAKKwkgIFNlbGVjdCB0aGUgRVJPRlMgY29tcHJlc3Npb24gYWxnb3Jp
dGhtIHRvIHVzZS4KKworY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX05PTkUKKwlib29s
ICJubyBjb21wcmVzc2lvbiIKKworY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaNAor
CWJvb2wgImx6NCIKKwogY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaNEhDCi0JYm9v
bCAibHo0aGMgY29tcHJlc3Npb24iCisJYm9vbCAibHo0aGMiCisKK2NvbmZpZyBCUjJfVEFSR0VU
X1JPT1RGU19FUk9GU19MWk1BCisJYm9vbCAibHptYSIKKworZW5kY2hvaWNlCisKK2lmIEJSMl9U
QVJHRVRfUk9PVEZTX0VST0ZTX0xaNEhDCisKK2NvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19FUk9G
U19MWjRIQ19MRVZFTAorCWludCAibHo0aGMgY29tcHJlc3Npb24gbGV2ZWwiCisJZGVmYXVsdCA5
CisJcmFuZ2UgMSAxMgorCWhlbHAKKwkgIFNwZWNpZnkgdGhlIGNvbXByZXNzaW9uIGxldmVsIGZv
ciBsejRoYyBjb21wcmVzc2lvbi4KKworZW5kaWYgIyBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19M
WjRIQworCitpZiBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWk1BCisKK2NvbmZpZyBCUjJfVEFS
R0VUX1JPT1RGU19FUk9GU19MWk1BX0xFVkVMCisJaW50ICJsem1hIGNvbXByZXNzaW9uIGxldmVs
IgorCWRlZmF1bHQgNgorCXJhbmdlIDAgMTA5CiAJaGVscAotCSAgVXNlIGx6NCBoaWdoLWNvbXBy
ZXNzaW9uIHRvIGNvbXByZXNzIGRhdGEgaW4gdGhlIGZpbGVzeXN0ZW0uCisJICBTcGVjaWZ5IHRo
ZSBjb21wcmVzc2lvbiBsZXZlbCBmb3IgbHptYSBjb21wcmVzc2lvbi4KKwkgIFZhbHVlcyBmcm9t
IDAgdG8gOSBhcmUgdXNlZCBmb3IgdGhlIHN0YW5kYXJkIGNvbXByZXNzaW9uLAorCSAgdmFsdWVz
IGZyb20gMTAwIHRvIDEwOSBhcmUgdXNlZCBmb3IgdGhlIGV4dHJlbWUgY29tcHJlc3Npb24uCisK
K2VuZGlmICMgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFpNQQogCiBjb25maWcgQlIyX1RBUkdF
VF9ST09URlNfRVJPRlNfUENMVVNURVJTSVpFCiAJaW50ICJwY2x1c3RlciBzaXplIgpkaWZmIC0t
Z2l0IGEvZnMvZXJvZnMvZXJvZnMubWsgYi9mcy9lcm9mcy9lcm9mcy5tawppbmRleCBlNDNkNzQ5
MjdiLi5mMDBmYjcyYzk1IDEwMDY0NAotLS0gYS9mcy9lcm9mcy9lcm9mcy5taworKysgYi9mcy9l
cm9mcy9lcm9mcy5tawpAQCAtNiw4ICs2LDEyIEBACiAKIFJPT1RGU19FUk9GU19ERVBFTkRFTkNJ
RVMgPSBob3N0LWVyb2ZzLXV0aWxzCiAKLWlmZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfRVJPRlNf
TFo0SEMpLHkpCi1ST09URlNfRVJPRlNfQVJHUyArPSAtemx6NGhjCitpZmVxICgkKEJSMl9UQVJH
RVRfUk9PVEZTX0VST0ZTX0xaNCkseSkKK1JPT1RGU19FUk9GU19BUkdTICs9IC16bHo0CitlbHNl
IGlmZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFo0SEMpLHkpCitST09URlNfRVJPRlNf
QVJHUyArPSAtemx6NGhjLCQoc3RyaXAgJChCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWjRIQ19M
RVZFTCkpCitlbHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFpNQSkseSkKK1JP
T1RGU19FUk9GU19BUkdTICs9IC16bHptYSwkKHN0cmlwICQoQlIyX1RBUkdFVF9ST09URlNfRVJP
RlNfTFpNQV9MRVZFTCkpCiBlbmRpZgogCiBpZmVxICgkKEJSMl9SRVBST0RVQ0lCTEUpLHkpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
