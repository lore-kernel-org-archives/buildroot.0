Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD38C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 10:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF91A60DFF;
	Wed, 14 Feb 2024 10:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLuWuOoOMK2V; Wed, 14 Feb 2024 10:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C66A260E1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C66A260E1E;
	Wed, 14 Feb 2024 10:58:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E65361BF5B4
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1ACB60E1E
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeRD0gT7EoK8 for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 10:58:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AD7D60DFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD7D60DFF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AD7D60DFF
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 10:58:36 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-411d76c9ce3so8042625e9.3
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 02:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707908313; x=1708513113;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1jA00MJPXDUiBEwZfQvW/sW8iOtpJzuc21l3pWNTrFk=;
 b=TfdTwITXQG3L/jp0683ojCLK/AL0aM7fSXd3/nxUZU+tUG1TO+IR7gVKyielsxr4ka
 HyPxX4HA1HmEEVmBOXV+3caY3EnUzYu2uC4VjTHk+aui+VYUx7WZQTO7fsDD20l69xw0
 Vz1Y1TaYl/G37q3/rIaWtVJGohhQzNSdU0BViwvCqhxem0mlVYJpbya9J39sh2l8xTDz
 YseJ0l5/U2xnwfg4j7BUjIk9tY4vOQ8DqF+qvB20hezSZ8RprGNy+rXY5TJP+3weZozO
 lTGSErWoXO3AVOP7saBslV0Fo8i3thIvsGu9qQIf4zo1qZzHEFAYcS2C9zvCU6XqQUWX
 ySEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxy6fpPOI298AT31P5nv+2aG5K7ploxTr1gWs8sEjPGh3AgeK3aG6jfl16AhjYcDQE2DrS311WRC7tzGVe2NwHyOo4ninxSA==
X-Gm-Message-State: AOJu0Ywq9Pb+fCiHrXOXJT0I15sF5FF74Y8atZVVOPHSgTEcgOlPVNRO
 fnHquwc7r19KvcSXXILQz1xpMKMjgLpu+gVUcmT7JOUUX5cm8pPo
X-Google-Smtp-Source: AGHT+IGMlwADRrcA10SRDSL6NJDlqgXk1zfstPoBo3oCj/GzkNvXsw9WUWuu1SM1EEd/0H4iePZ/5Q==
X-Received: by 2002:a05:600c:1907:b0:410:4630:1467 with SMTP id
 j7-20020a05600c190700b0041046301467mr1764473wmq.38.1707908313370; 
 Wed, 14 Feb 2024 02:58:33 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a05600c0ad900b0040ffd94cd27sm1571118wmr.45.2024.02.14.02.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:58:32 -0800 (PST)
Message-ID: <a050801df600d8eb955e847f741e6d5344120bdd.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 11:58:32 +0100
In-Reply-To: <20240213172817.2872849-10-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-10-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707908313; x=1708513113; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jA00MJPXDUiBEwZfQvW/sW8iOtpJzuc21l3pWNTrFk=;
 b=LARrbhTEONVVTRtQ9NOiArxLH2/QzX7YIhm/wmFEEKroLMzbYy1tnHy9I8kTH9SLD9
 SB5qKE9ON7E/LwnWm2e51x0GsehY5GJQYhyVTmlqH9Szx1qh4HDo64mwf73QbFH2fV9s
 cCd6aJzEL90WUyYNkDs0OE1Vk3nqMuzwUQ0m2PhRzA28P5O5gve+L5PmbD+Gw5vcEAIe
 GDUNBiwZFEjwP+mq2adGN8S/wtyFIYuhX6xNvINgOeHJTsrdcZFZER9p735GpnYdRY6e
 tGZfAh3SlfLZWgr28E1+UQn5xl70jvGtFPAQ/Dx18ha3/T6PzxQPDBYA/O8/OjuaN4iC
 eMgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LARrbhTE
Subject: Re: [Buildroot] [PATCH 09/21] boot/uboot: add
 BR2_TARGET_UBOOT_USE_BINMAN option
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gUmVjZW50IHZlcnNpb24gb2YgVS1Cb290IHVzZSBiaW5tYW4gdG8gcHJvdmlk
ZSBhIG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcKPiBpbWFnZXMsIGZyb20gc2ltcGxlIFNQTCArIFUt
Qm9vdCBjb21iaW5hdGlvbnMsIHRvIG1vcmUgY29tcGxleAo+IGFycmFuZ2VtZW50cyB3aXRoIG1h
bnkgcGFydHMuCj4gCj4gVGhpcyB0b29sIHVzZXMgYWRkaXRpb25hbCBob3N0IHB5dGhvbiBtb2R1
bGVzIHRoYXQgbXVzdCBiZSBwcm92aWRlZCBieQo+IEJ1aWxkcm9vdC4gU28gaW50cm9kdWNlIGEg
bmV3IG9wdGlvbiBCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4gdG8KPiBhZGQgYWRkaXRpb25h
bCBob3N0IHBhY2thZ2VzIGluIFUtQm9vdCBidWlsZCBkZXBlbmRlbmN5IHRvIHVzZSBiaW5tYW4u
Cj4gCj4gVGhlIGJpbm1hbiByZXF1aXJlbWVudCBpcyBkaXJlY3RseSBpbmNsdWRlZCBpbiBidWls
ZG1hbiBkZXBlbmRlbmN5Cj4gKHRvb2xzL2J1aWxkbWFuL3JlcXVpcmVtZW50cy50eHQpIHNpbmNl
IHdpdGhpbiBVLUJvb3QsIGJpbm1hbiBpcwo+IGludm9rZWQgYnkgdGhlIGJ1aWxkIHN5c3RlbSwg
aGVyZSBidWlsZG1hbiBbMV0uCj4gCj4gWzFdIGh0dHBzOi8vZG9jcy51LWJvb3Qub3JnL2VuL3Yy
MDI0LjAxL2RldmVsb3AvcGFja2FnZS9iaW5tYW4uaHRtbCNpbnZva2luZy1iaW5tYW4td2l0aGlu
LXUtYm9vdAo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNt
aWxlLmZyPgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJk
bGluQGdtYWlsLmNvbT4KCj4gLS0tCj4gTm90ZToKPiDCoCBiaW5tYW4gaXMgYnVuZGxlZCBpbiBV
LUJvb3Qgc291cmNlIGNvZGUuIFVzZSAiVVNFX0JJTk1BTiIgaW5zdGVhZCBvZgo+IMKgICJORUVE
U19CSU5NQU4iIHNpbmNlIGl0J3Mgbm90IGFuIGV4dGVybmFsIFUtQm9vdCBkZXBlbmRlbmN5Lgo+
IC0tLQo+IMKgYm9vdC91Ym9vdC9Db25maWcuaW4gfCAxMSArKysrKysrKysrKwo+IMKgYm9vdC91
Ym9vdC91Ym9vdC5ta8KgIHzCoCA4ICsrKysrKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC91Ym9vdC9Db25maWcuaW4gYi9ib290
L3Vib290L0NvbmZpZy5pbgo+IGluZGV4IGJlYWZiMzg5MzAuLmU2ZTc5NTZhZGMgMTAwNjQ0Cj4g
LS0tIGEvYm9vdC91Ym9vdC9Db25maWcuaW4KPiArKysgYi9ib290L3Vib290L0NvbmZpZy5pbgo+
IEBAIC0yOTAsNiArMjkwLDE3IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX05FRURTX1JPQ0tD
SElQX1JLQklOCj4gwqAJwqAgVGhpcyBvcHRpb24gbWFrZXMgc3VyZSB0aGF0IHRoZSBuZWVkZWQg
YmluYXJ5IGJsb2JzIGFyZSBjb3BpZWQKPiDCoAnCoCBpbnRvIHRoZSBVLUJvb3Qgc291cmNlIGRp
cmVjdG9yeS4KPiDCoAo+ICtjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOCj4gKwli
b29sICJVLUJvb3QgdXNlIGJpbm1hbiIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9S
VVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyAjIHB5dGhvbi1ycGRzLXB5IC0+IHB5dGhvbi1qc29u
c2NoZW1hCj4gKwlzZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRIT04zCj4gKwlzZWxl
Y3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUVMRlRPT0xTCj4gKwlzZWxlY3QgQlIyX1RBUkdF
VF9VQk9PVF9ORUVEU19QWUxJQkZEVAo+ICsJaGVscAo+ICsJwqAgVXNlIGJpbm1hbiB0b29sIGZv
ciBnZW5lcmF0aW9uIGFuZCBzaWduaW5nIG9mIGJvb3QgaW1hZ2VzLgo+ICsKPiArCcKgIGh0dHBz
Oi8vZG9jcy51LWJvb3Qub3JnL2VuL3YyMDI0LjAxL2RldmVsb3AvcGFja2FnZS9iaW5tYW4uaHRt
bAo+ICsKPiDCoG1lbnUgIlUtQm9vdCBiaW5hcnkgZm9ybWF0Igo+IMKgCj4gwqBjb25maWcgQlIy
X1RBUkdFVF9VQk9PVF9GT1JNQVRfQUlTCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3Qu
bWsgYi9ib290L3Vib290L3Vib290Lm1rCj4gaW5kZXggZGRhNjA2YTg4MC4uMDcxNDUyMjU1MCAx
MDA2NDQKPiAtLS0gYS9ib290L3Vib290L3Vib290Lm1rCj4gKysrIGIvYm9vdC91Ym9vdC91Ym9v
dC5tawo+IEBAIC0yNjksNiArMjY5LDE0IEBAIGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVE
U19YWEQpLHkpCj4gwqBVQk9PVF9ERVBFTkRFTkNJRVMgKz0gaG9zdC12aW0KPiDCoGVuZGlmCj4g
wqAKPiAraWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4pLHkpCj4gKyMgaHR0cHM6
Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wMS90b29scy9idWls
ZG1hbi9yZXF1aXJlbWVudHMudHh0Cj4gK1VCT09UX0RFUEVOREVOQ0lFUyArPSBcCj4gKwlob3N0
LXB5dGhvbi1qc29uc2NoZW1hIFwKPiArCWhvc3QtcHl0aG9uLXB5eWFtbAo+ICtVQk9PVF9NQUtF
X09QVFMgKz0gQklOTUFOX0lORElSUz0kKEJJTkFSSUVTX0RJUikKPiArZW5kaWYKPiArCj4gwqAj
IHByaW9yIHRvIHUtYm9vdCAyMDEzLjEwIHRoZSBsaWNlbnNlIGluZm8gd2FzIGluIENPUFlJTkcu
IENvcHkgaXQgc28KPiDCoCMgbGVnYWwtaW5mbyBmaW5kcyBpdAo+IMKgZGVmaW5lIFVCT09UX0NP
UFlfT0xEX0xJQ0VOU0VfRklMRQoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
