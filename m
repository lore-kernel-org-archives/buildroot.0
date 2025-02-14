Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51E2C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC3F24084C;
	Fri, 14 Feb 2025 11:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elaoKFozZokl; Fri, 14 Feb 2025 11:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB4F40768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB4F40768;
	Fri, 14 Feb 2025 11:21:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B3CBC2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48D324160F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z90z41jDsYZe for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E3A0415EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E3A0415EF
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E3A0415EF
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:53 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5ded69e6134so2369215a12.0
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532111; x=1740136911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZX3uHBLKP3iY8o0Jh26nlDVMXqKOix0SALAagHJMtBw=;
 b=BcR2NkzXObD4o3syhrmj4eeYd+MxmXyhex3T9Faf86RD4Zupda+1EWH9pzoxnz1ol5
 TgmmPCeaOYfv8sqy+z5T1DOMvNYGocXKYAjh4dSl1sq3CmNhua/3h/IbO3BBYaYqeRvZ
 xbSo3zcSlo61V7DS32/tgTn/gn6VqmrHezd2qyVvJXlB5kh9apK/EoCbOXIxcm6394cg
 gMkiWeNeSLXdu6D/iC8+OH5PbS8auPdNWUBSkY6LNFEKdhOBsinRL4q1xe61BdBbYVih
 pRFNmoysaO8DCHR1s99t9tspp4hiSh11dwggWT1nvh/mu28xcqfyedPwrukdtHK9Dy+y
 qKug==
X-Gm-Message-State: AOJu0Yz2xm4qXft77wVpgEMCCjrJQoCAYCSfyZpjG+SFFIyLgTlDoU3f
 jxQmhlxZhJ6HXYW4UIoBoyTlsjwXg+yz/bqq7zfWRRUqhsFXlT/lVCLIjuKhhT0MtJJh0QD8Rql
 3
X-Gm-Gg: ASbGncsfBrNm/g5Xwd58qPlnUislJWvVNZIcMESEoNcOyAa3ANLNx9JwDxTeGDMkpHq
 z7OA2hWyZBtuHye0PMv2cV1c7lcsxD3TijYPJihmChRHmdSvdV6aEJBmp/cijHJAqGx+MNV/wap
 cOqEVykf9+VQyvn79aSINSjHcHC2eftsLSo8xZ3fp5vVQjaZJsPo1c/H0rvpjbZQYbC5ADtUNTa
 Z07lQfVA3vd6/jpApZ26hikR6BotxCHOS0kWjH0w8QW64UA/dhX22zsgBAkx4dXqc8TX3xqzPoF
 75/XBXl3Oa5IVTRtOIa8QKEuMCzSY5vw+rk6ljbCAu8=
X-Google-Smtp-Source: AGHT+IHzq1/B2TdNc0wAvpxk0+yA5VRmEo4iumO3MBK1DErHSdx2T70FdTGqhvs2NEW1+j6XBlfCIw==
X-Received: by 2002:a05:6402:40d1:b0:5dc:7fbe:72ff with SMTP id
 4fb4d7f45d1cf-5deadd7b87fmr9725282a12.2.1739532111143; 
 Fri, 14 Feb 2025 03:21:51 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece270b17sm2725181a12.62.2025.02.14.03.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:21:50 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 12:21:37 +0100
Message-ID: <20250214112140.1862254-2-sairon@sairon.cz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214112140.1862254-1-sairon@sairon.cz>
References: <20250214112140.1862254-1-sairon@sairon.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1739532111; x=1740136911; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZX3uHBLKP3iY8o0Jh26nlDVMXqKOix0SALAagHJMtBw=;
 b=U1X3zJ8Ncnm58ScvwT9hShcOkR91/i3QBM90MeFPc87StokXwsFN0/9jVCs1/8dHSu
 qyhrvWUIrZ+EQLuhqNjQoV2lBCdU+ONMAHixYODDYjrD6D4QjaP+E3DPPp/b5MFn6wnb
 WGNjAK9XZu/F32sQ+foyyiSzlmmGPOpcB4Wx8rTQu0/aVcGXn9PGcnicuVzk9RVRbcgi
 i4a1HUoNbDrVg/f3L/4Sn4T4ko/hHYowGrWR8AetZA+mNKbAh8PTyiuorGMqzDfKJJ0X
 Z7ODA/87MV8Gklq/ReiYP6MDPH3xM/W3Yo+RzdQhxjy/K4lINX7lDfDfCMOElushTO3u
 9GGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=U1X3zJ8N
Subject: [Buildroot] [v2 1/3] fs/erofs: add LZMA compression,
 allow configurable compression level
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

SW5zdGVhZCBvZiBoYXZpbmcgYSBib29sIG9wdGlvbiBmb3IgZW5hYmxpbmcgdGhlIExaNEhDIGNv
bXByZXNzaW9uLCBjaGFuZ2UgdGhlCktjb25maWcgZGVmaW5pdGlvbiB0byBhIGNob2ljZSwgd2hp
Y2ggYWxzbyBhZGRzIG1vcmUgZmxleGliaWxpdHkgaW4gdGhlIGZ1dHVyZQooZS5nLiBmb3IgZW5h
YmxpbmcgWlNURCBjb21wcmVzc2lvbikuIFRoZSBuYW1lIG9mIHRoZSBvbGQgb3B0aW9uIHdhcyBw
cmVzZXJ2ZWQKc28gZGVmY29uZmlncyB1c2luZyBpdCB3b24ndCBiZSBhZmZlY3RlZC4KCkFsc28g
Ym90aCBmb3IgTFpNQSBhbmQgTFo0SEMsIGl0J3Mgbm93IHBvc3NpYmxlIHRvIGRlZmluZSBjb21w
cmVzc2lvbiBsZXZlbC4KUHJldmlvdXNseSBpdCBkZWZhdWx0ZWQgdG8gOSwgd2hpY2ggZ2VuZXJh
dGVzIGltYWdlcyBsYXJnZXIgdGhhbiBzcXVhc2hmcyB3aXRoCmNvbXBhcmFibGUgc2V0dGluZ3Mg
KHdoaWNoIHVzZXMgbGV2ZWwgMTIgYnkgZGVmYXVsdCkuIEZvciBMWjRIQyB0aGUgZGVmYXVsdCBp
Zgp1bnNldCB3b3VsZCBiZSBzdGlsbCA5LgoKU2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxz
YWlyb25Ac2Fpcm9uLmN6PgotLS0KIGZzL2Vyb2ZzL0NvbmZpZy5pbiB8IDUxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIGZzL2Vyb2ZzL2Vyb2ZzLm1rICB8
ICA0ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9mcy9lcm9mcy9Db25maWcuaW4gYi9mcy9lcm9mcy9Db25maWcuaW4K
aW5kZXggZTExMjU3MjY4OC4uMjA0MWEwMDM0ZSAxMDA2NDQKLS0tIGEvZnMvZXJvZnMvQ29uZmln
LmluCisrKyBiL2ZzL2Vyb2ZzL0NvbmZpZy5pbgpAQCAtNiwxMCArNiw1NyBAQCBjb25maWcgQlIy
X1RBUkdFVF9ST09URlNfRVJPRlMKIAogaWYgQlIyX1RBUkdFVF9ST09URlNfRVJPRlMKIAorY2hv
aWNlCisJcHJvbXB0ICJDb21wcmVzc2lvbiBhbGdvcml0aG0iCisJZGVmYXVsdCBCUjJfVEFSR0VU
X1JPT1RGU19FUk9GU19MWjRIQworCWhlbHAKKwkgIFNlbGVjdCB0aGUgRVJPRlMgY29tcHJlc3Np
b24gYWxnb3JpdGhtIHRvIHVzZS4KKworCSAgTFo0SEMgKExaNCBIaWdoIENvbXByZXNzaW9uKSBp
cyB0aGUgZGVmYXVsdCBhbGdvcml0aG0gYW5kCisJICBwcm92aWRlcyBhIGdvb2QgYmFsYW5jZSBi
ZXR3ZWVuIGNvbXByZXNzaW9uIHJhdGlvIGFuZCBzcGVlZCwKKwkgIHdpdGggaW5jcmVhc2luZyBs
ZXZlbHMgdGhlIGNvbXByZXNzaW9uIHJhdGlvIGluY3JlYXNlcyBhdCB0aGUKKwkgIHBlbmFsdHkg
b2YgaGlnaGVyIGNvbXByZXNzaW9uIHRpbWVzLCB3aXRob3V0IHNpZ25pZmljYW50CisJICBkZWNv
bXByZXNzaW9uIHBlbmFsdHkuCisKKwkgIExaTUEgcHJvdmlkZXMgdGhlIGJlc3QgY29tcHJlc3Np
b24gcmF0aW8gYnV0IGlzIHNpZ25pZmljYW50bHkKKwkgIHNsb3dlciBib3RoIGluIGNvbXByZXNz
aW9uIGFuZCBkZWNvbXByZXNzaW9uLCBhbmQgaGlnaGVyCisJICBjb21wcmVzc2lvbiBsZXZlbHMg
Y2FuIGhhdmUgbm90aWNlYWJsZSBtZW1vcnkgcmVxdWlyZW1lbnRzLgorCitjb25maWcgQlIyX1RB
UkdFVF9ST09URlNfRVJPRlNfTk9ORQorCWJvb2wgIm5vIGNvbXByZXNzaW9uIgorCiBjb25maWcg
QlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFo0SEMKLQlib29sICJsejRoYyBjb21wcmVzc2lvbiIK
Kwlib29sICJsejRoYyIKKworY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaTUEKKwli
b29sICJsem1hIgorCitlbmRjaG9pY2UKKworaWYgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFo0
SEMKKworY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaNEhDX0xFVkVMCisJaW50ICJs
ejRoYyBjb21wcmVzc2lvbiBsZXZlbCIKKwlkZWZhdWx0IDkKKwlyYW5nZSAxIDEyCiAJaGVscAot
CSAgVXNlIGx6NCBoaWdoLWNvbXByZXNzaW9uIHRvIGNvbXByZXNzIGRhdGEgaW4gdGhlIGZpbGVz
eXN0ZW0uCisJICBTcGVjaWZ5IHRoZSBjb21wcmVzc2lvbiBsZXZlbCBmb3IgTFo0SEMgY29tcHJl
c3Npb24uCisKK2VuZGlmICMgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFo0SEMKKworaWYgQlIy
X1RBUkdFVF9ST09URlNfRVJPRlNfTFpNQQorCitjb25maWcgQlIyX1RBUkdFVF9ST09URlNfRVJP
RlNfTFpNQV9MRVZFTAorCWludCAibHptYSBjb21wcmVzc2lvbiBsZXZlbCIKKwlkZWZhdWx0IDYK
KwlyYW5nZSAwIDEwOQorCWhlbHAKKwkgIFNwZWNpZnkgdGhlIGNvbXByZXNzaW9uIGxldmVsIGZv
ciBMWk1BIGNvbXByZXNzaW9uLgorCisJICBWYWx1ZXMgZnJvbSAwIHRvIDkgYXJlIHVzZWQgZm9y
IHRoZSBzdGFuZGFyZCBjb21wcmVzc2lvbiwKKwkgIHZhbHVlcyBmcm9tIDEwMCB0byAxMDkgYXJl
IHVzZWQgZm9yIHRoZSBleHRyZW1lIGNvbXByZXNzaW9uLgorCitlbmRpZiAjIEJSMl9UQVJHRVRf
Uk9PVEZTX0VST0ZTX0xaTUEKIAogY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX1BDTFVT
VEVSU0laRQogCWludCAicGNsdXN0ZXIgc2l6ZSIKZGlmZiAtLWdpdCBhL2ZzL2Vyb2ZzL2Vyb2Zz
Lm1rIGIvZnMvZXJvZnMvZXJvZnMubWsKaW5kZXggZTQzZDc0OTI3Yi4uZThkMzBiYWNlOCAxMDA2
NDQKLS0tIGEvZnMvZXJvZnMvZXJvZnMubWsKKysrIGIvZnMvZXJvZnMvZXJvZnMubWsKQEAgLTcs
NyArNyw5IEBACiBST09URlNfRVJPRlNfREVQRU5ERU5DSUVTID0gaG9zdC1lcm9mcy11dGlscwog
CiBpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaNEhDKSx5KQotUk9PVEZTX0VST0ZT
X0FSR1MgKz0gLXpsejRoYworUk9PVEZTX0VST0ZTX0FSR1MgKz0gLXpsejRoYywkKEJSMl9UQVJH
RVRfUk9PVEZTX0VST0ZTX0xaNEhDX0xFVkVMKQorZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfUk9P
VEZTX0VST0ZTX0xaTUEpLHkpCitST09URlNfRVJPRlNfQVJHUyArPSAtemx6bWEsJChCUjJfVEFS
R0VUX1JPT1RGU19FUk9GU19MWk1BX0xFVkVMKQogZW5kaWYKIAogaWZlcSAoJChCUjJfUkVQUk9E
VUNJQkxFKSx5KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
