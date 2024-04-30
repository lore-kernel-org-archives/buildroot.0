Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C54C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 13:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B871D81FAF;
	Tue, 30 Apr 2024 13:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVMxLStv35su; Tue, 30 Apr 2024 13:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F7781FAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F7781FAC;
	Tue, 30 Apr 2024 13:38:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97E761BF348
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 13:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9123B41495
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 13:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q901yjmNmhOl for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 13:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17FDE40446
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FDE40446
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17FDE40446
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 13:38:16 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-572669fd9f9so4836509a12.0
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 06:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714484294; x=1715089094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gaBrk954ElFTmbIJ61WH9w9+O7XCAnb2GHfiefw+Nyk=;
 b=KOmBiJa0JCbd3qPZYGFtKMGdXjHQhLj7B2nxLJ3uv7aREykbE9cCrMYMImRDeWTN5Q
 HG/+qlGdM0VZLPws4NV352RkzLjJympyPuP6OyecrCs6Gz9WAwyw4csMMZjg//jeQKqS
 Z4uCCdidr+YDjk1zNsHXEXdJPVXAhxJzDyiGHgaRMf2m+VrpY1WavXs2gYSGlAUsVsTp
 b8mrOkiR1YT8qEIG6TnVCtgRUsOGPSvGlSQ0Y8wyrExS5ei9TX/vf+QL2ssgUEx3Q1d8
 D+1cbMAaEWhv3ugKmYsnIXcX7nMBCTqt/CZssBkf8X0U2ibz5GhY0RJcYqKvqqtPbP+3
 XvYg==
X-Gm-Message-State: AOJu0YzHOsdbQ8UJeB0NEMikChXCGGB1o1fW9tIuWPTvh4TDcv/+5yWZ
 DWH/rIz/sCWq9GzgTubxCznXOd+mxM1vpcMbR6cL3zqpiRDm1fygGHXuFg0J6R64UOV1ClY1jcl
 KdWm4XSJHrbZHcIfvZKMhFhPOyMjyY/1gfzjdAvPU7Lfhede/Zj3r3U1Uo8ci5M3NpkydGhdSt1
 WttAQiHxjtDI4oSyKja2NLtjTXv//dsgmiSuObVzWOyO1jFpc+SzPb9yapGD8=
X-Google-Smtp-Source: AGHT+IHPmT+r/pmXpTYBZfoJJo1/b69fdgQJ2iY1aoC5nB/anM8UDoX+szpgl/AgkYinv2u4khu5Hg==
X-Received: by 2002:a17:907:987:b0:a58:c09d:199d with SMTP id
 bf7-20020a170907098700b00a58c09d199dmr10918506ejc.73.1714484294234; 
 Tue, 30 Apr 2024 06:38:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8109:8abb:b200:831c:6fac:95a9:d72e])
 by smtp.gmail.com with ESMTPSA id
 lf17-20020a170906ae5100b00a526fd6362asm15199901ejb.117.2024.04.30.06.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 06:38:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 15:37:51 +0200
Message-ID: <20240430133754.1288162-1-gero.schwaericke@grandcentrix.net>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20230907003002.474334-1-patrick.oppenlander@gmail.com>
References: <20230907003002.474334-1-patrick.oppenlander@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1714484294; x=1715089094; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gaBrk954ElFTmbIJ61WH9w9+O7XCAnb2GHfiefw+Nyk=;
 b=w+rb4mKW6RfmeG68lsFP0pnxGHuT0DEhIwMqdcZpPozhDZw3Co9Qpv+i7NzlKcARmN
 68LVk57TTTsL6sJLI2LdMemh7zvxInc0OvFAL3fyHgjJ8phb93Fg2r2UkueGDyjQlIS4
 QGkRlM/O3Z+r9gWVncGwQBzYRpo4W4Dfe3DpAmCVFqhkq59CgKbk8uo5xsJNa85jNwZO
 JtnBNle/k/JpHLnDt8zdTvE2oi19VS/f7t0KQOZNJlvtpo179o7gipUaegYVoIIrCtM6
 si1c0SKeqv9PDur/Kg5tqLc73Jh+Ir2o1Nz8LArPGYrH11kvO+3CF/7zumwFdBH4ruqI
 g83w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=w+rb4mKW
Subject: [Buildroot] [PATCH v2] ti-k3-r5-loader: support devicetree
 customization
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Gero=20Schw=C3=A4ricke?=
 <gero.schwaericke@grandcentrix.net>
Cc: Xuanhao Shi <X15000177@gmail.com>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>,
 Patrick Oppenlander <patrick.oppenlander@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBkdXBsaWNhdGVkIGZyb20gdGhlIFUtQm9vdCBtYWtlZmlsZSAmIEtjb25maWcuCgpT
aW1pbGFybHkgdG8gVS1Cb290IGN1c3RvbSBib2FyZHMgc29tZXRpbWVzIG5lZWQgdG8gYWRqdXN0
IHRoZSBVLUJvb3QKZGV2aWNldHJlZS4gRm9yIGV4YW1wbGUsIHRoZSBBTTY0eCBTRFJBTSBjb250
cm9sbGVyIHN1cHBvcnRzIGlubGluZSBFQ0MKd2hpY2ggbmVlZHMgdG8gYmUgZW5hYmxlZCBpbiB0
aGUgUjUgbG9hZGVyIGRldmljZXRyZWUuCgpQbGVhc2Ugbm90ZSB0aGF0IHNvbWUgdmVyc2lvbnMg
b2YgVS1Cb290IGhhdmUgYnJva2VuIGV4dGVybmFsIGRldmljZXRyZWUKc3VwcG9ydCBhbmQgbWF5
IHJlcXVpcmUgbWFudWFsIHBhdGNoaW5nIHRvIGJ1aWxkLiBTZWUgY29tbWl0CjM2MDllMWRjNWY0
ZDRjMjM4ZGNkMjNlMDQ1YmE2MjIzMzEwZmVmZmEgaW4gdGhlIFUtQm9vdCB0cmVlLgoKU2lnbmVk
LW9mZi1ieTogUGF0cmljayBPcHBlbmxhbmRlciA8cGF0cmljay5vcHBlbmxhbmRlckBnbWFpbC5j
b20+ClNpZ25lZC1vZmYtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAZ3Jh
bmRjZW50cml4Lm5ldD4KLS0tCnYxIC0+IHYyOgogIC0gbWFrZSBpdCBhcHBseSBvbiBjdXJyZW50
IG1hc3RlcgogIC0gbW92ZSB0aGUgY29uZmlnIG9wdGlvbiBpbnRvICBpZiBCUjJfVEFSR0VUX1RJ
X0szX1I1X0xPQURFUgogIC0gZml4IGhlbHAgc3RyaW5nIG1lbnRpb25pbmcgQVJDSCB0aG91Z2gg
aXQncyBmaXhlZCB0byBhcm0gaW4gLm1rCi0tLQogYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmln
LmluICAgICAgICAgIHwgMTAgKysrKysrKysrKwogYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMt
cjUtbG9hZGVyLm1rIHwgIDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiBiL2Jvb3QvdGkt
azMtcjUtbG9hZGVyL0NvbmZpZy5pbgppbmRleCA2ZDFhZGJlYWMzLi5kZjg4NWNjMmFmIDEwMDY0
NAotLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KKysrIGIvYm9vdC90aS1rMy1y
NS1sb2FkZXIvQ29uZmlnLmluCkBAIC05NSw2ICs5NSwxNiBAQCBjb25maWcgQlIyX1RBUkdFVF9U
SV9LM19SNV9MT0FERVJfQ1VTVE9NX0NPTkZJR19GSUxFCiAJaGVscAogCSAgUGF0aCB0byB0aGUg
VEkgSzMgUjUgTG9hZGVyIGNvbmZpZ3VyYXRpb24gZmlsZS4KIAorY29uZmlnIEJSMl9UQVJHRVRf
VElfSzNfUjVfTE9BREVSX0NVU1RPTV9EVFNfUEFUSAorCXN0cmluZyAiRGV2aWNlIFRyZWUgU291
cmNlIGZpbGUgcGF0aHMiCisJaGVscAorCSAgU3BhY2Utc2VwYXJhdGVkIGxpc3Qgb2YgcGF0aHMg
dG8gZGV2aWNlIHRyZWUgc291cmNlIGZpbGVzCisJICB0aGF0IHdpbGwgYmUgY29waWVkIHRvIGFy
Y2gvYXJtL2R0cy8gYmVmb3JlIHN0YXJ0aW5nIHRoZQorCSAgYnVpbGQuCisKKwkgIFRvIHVzZSB0
aGlzIGRldmljZSB0cmVlIHNvdXJjZSBmaWxlLCB0aGUgVS1Cb290IGNvbmZpZ3VyYXRpb24KKwkg
IGZpbGUgbXVzdCByZWZlciB0byBpdC4KKwogY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9B
REVSX1RJQk9PVDNfQklOCiAJc3RyaW5nICJ0aWJvb3QzLmJpbiBiaW5hcnkgbmFtZSIKIAlkZWZh
dWx0ICJ0aWJvb3QzLmJpbiIKZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWsz
LXI1LWxvYWRlci5tayBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawpp
bmRleCA4OTE3ODNlNDBmLi45OGE2ZDQ3M2YxIDEwMDY0NAotLS0gYS9ib290L3RpLWszLXI1LWxv
YWRlci90aS1rMy1yNS1sb2FkZXIubWsKKysrIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMt
cjUtbG9hZGVyLm1rCkBAIC04OCw3ICs4OCwxMiBAQCBkZWZpbmUgVElfSzNfUjVfTE9BREVSX0lO
U1RBTExfU1dTRldfSVRCCiAJZmkKIGVuZGVmCiAKK1RJX0szX1I1X0xPQURFUl9DVVNUT01fRFRT
X1BBVEggPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9N
X0RUU19QQVRIKSkKKwogZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCisJJChpZiAk
KFRJX0szX1I1X0xPQURFUl9DVVNUT01fRFRTX1BBVEgpLAorCQljcCAtZiAkKFRJX0szX1I1X0xP
QURFUl9DVVNUT01fRFRTX1BBVEgpICQoQEQpL2FyY2gvYXJtL2R0cy8KKwkpCiAJJChUQVJHRVRf
Q09ORklHVVJFX09QVFMpICQoVElfSzNfUjVfTE9BREVSX01BS0UpIC1DICQoQEQpICQoVElfSzNf
UjVfTE9BREVSX01BS0VfT1BUUykKIGVuZGVmCiAKLS0gCjIuNDMuMgoKCi0tIAoKCgrigJPigJPi
gJMKCgpncmFuZGNlbnRyaXggR21iSCB8IEEgVm9kYWZvbmUgQ29tcGFuecKgwrfCoEhvbHptYXJr
dCAxwqDCt8KgNTA2NzYgCipDb2xvZ25lKsKgfMKgUGhvZW5peHNlZXN0cmFzc2UgMTjCoMK3wqA0
NDI2MyAqRG9ydG11bmQqwqDCt8KgR2VybWFueQp8wqBpbiAKPGh0dHBzOi8vd3d3LmxpbmtlZGlu
LmNvbS9jb21wYW55L2dyYW5kY2VudHJpeD4gfCBwaG9uZTogKzQ5LTIyMS02NzctODYwLTAgCnzC
oGVtYWlsOiBoZWxsb0BncmFuZGNlbnRyaXgubmV0IDxtYWlsdG86aGVsbG9AZ3JhbmRjZW50cml4
Lm5ldD4KCgpncmFuZGNlbnRyaXggY2FyZXMgYWJvdXTCoHByaXZhY3kgCjxodHRwczovL2dyYW5k
Y2VudHJpeC5uZXQvZGUvcGFnZXMvcHJpdmFjeW1haWwvPgoKQW10c2dlcmljaHQgS8O2bG4gfCBI
UkIgwqAKNzAxMTkgfCBHZXNjaMOkZnRzZsO8aHJlcjogTS4gS3LDtm1lcizCoCBSLiBIw6RuZWwg
fCBVU3QuLUlkTnIuOiBERTI2NjMzMzk2OQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
