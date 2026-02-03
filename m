Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CCCE87852
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A9726063A;
	Tue,  3 Feb 2026 18:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1KDN2suBWGA; Tue,  3 Feb 2026 18:11:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5B3D608C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142272;
	bh=B/q95vmF5eSj0gjZhvAk8pp7FWtV4aRyB4Y+WfjB6iA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=leHJbEo5Q3fwZfmcfOyf2gi9kFPUkM57LN+2+T+OsCY3SZO4pmdK/vanu36OGR85l
	 fyeo63QVaVYl/wu33yY7068b0cOxjyv3eIc7h0jYYCoAHTqdRNuxlA7SyKmDPCEFqv
	 VBRpgdo0Jn+epx/ZHBp13rP/XlOMYA++gTer7w59CJoR/p4YAg6bapXM568uDlHAQw
	 fzcrSph5nZX+JiOs0m5E+Kn1Sp4JP3RiiJE4MKHJmCyBq+67kP6adLrubSlNsW4WUL
	 s/y7G+7EPOtqU2Re5glV2dtfOUWv0W/I62+1wi85r/TsHvk2TRkHSxz+L1gKnLREOw
	 DPSUHXxflPyxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B3D608C3;
	Tue,  3 Feb 2026 18:11:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA359F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A0898207D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpyPeuh_V57d for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:11:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60CFC82057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60CFC82057
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60CFC82057
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:11:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so3825294f8f.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 10:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770142267; x=1770747067;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pVnX0892hAkF9OohPoJ8M8t0x+mqrgJeTKWQxS/+1kM=;
 b=YwOemvZDAiTQwglofn1HDcq2Zwe4yzmS37ZH+LH0PE8eArKZc5oD372JXs/4MRkzpA
 PKFN004oa9EAUDfnzQsg28ESF/faDNT7m89pJW3nq41x6uBgU4xk4sd6aHSi2+n+14oO
 Sgw48EbPx/XJEByABKaqqdrTh/QOMwT9ZEg20f1GUD9NZlvAhamZ252r4qWfm3Edou/C
 2wVfLgE9ziHm7QtDMo0c1AeOceWuhpuMRyuMawGZ5v+j1nkFMLCT7HcXBOq/qMMYrbOU
 vjyYn9NHsgpXaQ9jrVGHRThTg7XR40x47p9/hr6n7mRakLdjiGa32NHlPZgIo4MSk+yk
 xpaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVwvmQ/D/uKUCsBw8clShqUpzmkrvcoTaC/xfJRKhQzd0QmZrowChDlKyFjaMwKwNvosFH57Ii0Ig=@buildroot.org
X-Gm-Message-State: AOJu0Yxr9bsM/R8d7io1Z41oc5DTNDXfdVbkCWWfpUXi25m4nyShdMYL
 n7scO/3xubknC1vnqw3knFwpTvBWArYzx+g9rb7631/RjnHAiBwPx159mMncBPMLg6GT0bncCAK
 c3FrwP7U=
X-Gm-Gg: AZuq6aLOhXuBNhhD/y4u6OlHJQXphTK/qqmFWHfDYcoa8bnyQ/bWJahB3XS29LpUVWy
 KlJCT/xtEy4x0eLhSRIFjU5YUbAZTQRuGcx85pYd+zO2Hd3tjYFIx86mf3fh8KfWrgQXnEBWMcz
 0iZNHe3V3XEqBWrVGwYidAEab1mf0OsS0UVQOCDXbyTDwyUkFYvgDkGImEZ9qcfNr1vjGZ2eUqj
 hVRZnlo6oJvoC5Wef32CdaD1Rtv45zNc0XD0am96XRY1YCavOCEmuwKrh4ZBJ2fqgKqDFdPpB9N
 /t9uz3mM1jgVBRURnb8QL6I5JS7uOVpGNELrff+EYPevd9EvCWpHREQE5CKXx5Ynfl/5Tp0dP65
 ugHhGdntPkLDqAuxkJhy7xTfvIfFlG/4qVvCNCXIae+iErQuvqG9fVCIMVtWk5ept2itr20lU8D
 3leXGY57ZXqxhR+4wYcPfW4RFJJ9MAGy34syEf0AsMOf3imSnJEj2HT85CzsC7IFE=
X-Received: by 2002:a05:6000:24c9:b0:435:8ad8:b7a with SMTP id
 ffacd0b85a97d-4361805d429mr350861f8f.46.1770142267216; 
 Tue, 03 Feb 2026 10:11:07 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e3a486sm433318f8f.16.2026.02.03.10.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 10:11:06 -0800 (PST)
Message-ID: <84d169f6-baed-4d91-b1ff-44aff7650cd6@smile.fr>
Date: Tue, 3 Feb 2026 19:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>
References: <20251204-k3-r5-loader-fragments-v1-1-08755f22c4f2@ti.com>
Content-Language: fr, en-US
In-Reply-To: <20251204-k3-r5-loader-fragments-v1-1-08755f22c4f2@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770142267; x=1770747067; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pVnX0892hAkF9OohPoJ8M8t0x+mqrgJeTKWQxS/+1kM=;
 b=vzbMUHPnF4HyYz0GtGvtJvbyY+PLeLGF6bVz9MO2KLhsRQ0z/l041rvw4VnaAiNkAa
 iMLl5IIFe3v6wk03ED3YKjhwxXStxfFaZy08MpplvGNtINXQ2TDtpTI9IjEChMoKeX8v
 fOc7O3KaC+RW2f3qYZ/Fv6AEnHGDzvO/ZQI84=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vzbMUHPn
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: add defconfig
 fragment support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQnJ5YW4sIEFsbCwKCkxlIDA0LzEyLzIwMjUgw6AgMTM6NTAsIEJyeWFuIEJyYXR0bG9m
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGVyZSBhcmUgbXVsdGlwbGUgZGVmY29uZmln
IGZyYWdtZW50cyB3ZSBjYW4gc2VsZWN0IHRvIG1vZGlmeSB0aGUgZmluYWwKPiB0aWJvb3QzLmJp
biBpbWFnZSB0byBzdXBwb3J0IGRpZmZlcmVudCBib290IG1ldGhvZHMgb3IgZW5hYmxlIGZlYXR1
cmVzCj4gc3VwcG9ydGVkIGJ5IGEgYm9hcmQuIEFsbG93IHRoZSB0aS1rMy1yNS1sb2FkZXIgcGFj
a2FnZSB0byBzZWxlY3QKPiBkZWZjb25maWcgZ3JhZ21lbnRzIGR1cmluZyBhIGJ1aWxkCgpJbmRl
ZWQsIGhhdmluZyBmcmFnbWVudCBzdXBwb3J0IGluIHRpLWszLXI1LWxvYWRlciB3aWxsIGJlIHVz
ZWZ1bCB0byBjdXN0b21pemUKdGhlIHI1IHVib290IGNvbmZpZ3VyYXRpb24gdXNpbmcgZm9yIGV4
YW1wbGUgdGhlIG5ldyBmYWxjb24gbW9kZSBmcmFnbWVudCBmb3IgazMKZGV2aWNlc8KgWzFdLgoK
WzFdCmh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2NvbW1pdC8xOTc0NTlk
MTk4YzcxMGU5Y2RhYjIwMzI3MGJlNjgxMzdlZTkwOTU1CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyeWFuIEJy
YXR0bG9mIDxiYkB0aS5jb20+Cj4gLS0tCj4gIGJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5p
biAgICAgICAgICB8IDYgKysrKysrCj4gIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxv
YWRlci5tayB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gYi9ib290L3RpLWszLXI1
LWxvYWRlci9Db25maWcuaW4KPiBpbmRleCBiNGZiNDZlNTViODNiNDdmNzI5NzExNjhhYjFhY2Q5
NjRmZjM5MGUzLi43ZWI0NzFlNmQ1MDRmOGQ2YzcyZWEwNTc3ZWI0NWViN2MzNjYyODZkIDEwMDY0
NAo+IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+ICsrKyBiL2Jvb3QvdGkt
azMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+IEBAIC05NSw2ICs5NSwxMiBAQCBjb25maWcgQlIyX1RB
UkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX0NPTkZJR19GSUxFCj4gIAloZWxwCj4gIAkgIFBh
dGggdG8gdGhlIFRJIEszIFI1IExvYWRlciBjb25maWd1cmF0aW9uIGZpbGUuCj4gIAo+ICtjb25m
aWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTCj4gKwlz
dHJpbmcgIkFkZGl0aW9uYWwgY29uZmlndXJhdGlvbiBmcmFnbWVudCBmaWxlcyIKPiArCWhlbHAK
PiArCSAgQSBzcGFjZS1zZXBhcmF0ZWQgbGlzdCBvZiBjb25maWd1cmF0aW9uIGZyYWdtZW50IGZp
bGVzLAo+ICsJICB0aGF0IHdpbGwgYmUgbWVyZ2VkIHRvIHRoZSB0aWJvb3QzLmJpbiBjb25maWd1
cmF0aW9uIGZpbGUuCj4gKwo+ICBjb25maWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VT
VE9NX0RUU19QQVRICj4gIAlzdHJpbmcgIkRldmljZSBUcmVlIFNvdXJjZSBmaWxlIHBhdGhzIgo+
ICAJaGVscAo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2Fk
ZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiBpbmRleCBk
YjVjM2NkYWY4YjY1ODAyOGM2OTZlYjM3MjAzMjdiZmI1ZDZlMGRhLi4xNzhkYjVjMGYzNWFkYzUx
NDBlNGU0MWE1NGNjMjNjZDQ5NzFiNmQ5IDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWsz
LXI1LWxvYWRlci5tawo+IEBAIC03Nyw2ICs3Nyw3IEBAIFRJX0szX1I1X0xPQURFUl9NQUtFX09Q
VFMgPSBcCj4gIAlIT1NUTERGTEFHUz0iJChIT1NUX0xERkxBR1MpIiBcCj4gIAlCSU5NQU5fSU5E
SVJTPSQoQklOQVJJRVNfRElSKQo+ICAKPiArVElfSzNfUjVfTE9BREVSX0tDT05GSUdfRlJBR01F
TlRfRklMRVMgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ09O
RklHX0ZSQUdNRU5UX0ZJTEVTKSkKPiAgVElfSzNfUjVfTE9BREVSX1RJQk9PVDNfQklOID0gJChj
YWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1RJQk9PVDNfQklOKSkKPiAg
Cj4gIGRlZmluZSBUSV9LM19SNV9MT0FERVJfSU5TVEFMTF9USUJPT1QzX0JJTgo+IAo+IC0tLQo+
IGJhc2UtY29tbWl0OiBiZDE4MzFkMTYxNTg2OTQ3MTQxNTQyZmRkNWE0N2YxMGRlM2U4M2YyCj4g
Y2hhbmdlLWlkOiAyMDI1MTIwNC1rMy1yNS1sb2FkZXItZnJhZ21lbnRzLTM2MTI0MmRiNGM5Mgo+
IAo+IEJlc3QgcmVnYXJkcywKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
