Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25632CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 17:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC1B782AAA;
	Sat, 18 Oct 2025 17:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAMikDFL-Lot; Sat, 18 Oct 2025 17:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9BEA82AC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9BEA82AC3;
	Sat, 18 Oct 2025 17:08:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B28C71CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 17:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B00BA4090B
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 17:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIRSJf4dBi2h for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 17:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AD9640904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AD9640904
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AD9640904
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 17:08:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47112a73785so22223615e9.3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760807285; x=1761412085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sGPkRqn/P4/pvmzbk37lHVve7QIMdEE7wDq8EIV6nxg=;
 b=GdA4ixD3YgepyBLlIcO8sWNE56J2O8qbvLthFrSLzJnKjmv6lbpSRFGGZzkyHXtJRS
 QlgyNhBqiNRHCyAcYtJtR98K8DKgRstU8xB3IAn4F6eVEPjdDajTV/5w1O2RyFy8nHXx
 z/00502ikiqTrikKwDbFP6iadRXTxpDegubWx3R6BF5pGDFQ4ppe8zd4IW2KJKHNkw53
 5yw93gRWVOPLDLgapjWUVjg+scdcS/elNt0v12yN9RBEqV3q0zzx4rxii9cTwIKZMpSz
 ZWodXHrAmZQKHP/cT97AMZELNwNRIK2ShsbdmoDL7X1uoTQA9rJNIaWjY3zETShCrFpv
 6X8A==
X-Gm-Message-State: AOJu0YxVzH//YhtXq0rhfT6fI2nadRF3rKP4ekBJ91CvRBrhfnnPqd/y
 gnZgz414SfVghHhSzVdov7IRMq4hpxdV6Ly+NUNob3Z69wTf3fLg3j9/
X-Gm-Gg: ASbGncsP2JSXuOcJ6vrHKUpzngSQego9ZVZMhXfnTbMF6/2qe3yQfHepZ/sxjZxesvs
 hiPbzrF6GTx6RoFCt5b5cztU+RykUiBcPenCh4IF4MiERikuiLqYjR7+51J9TyQq6sIFZ8eBk/Z
 Ae3n3SUrP0uWZHcAya+obL5Hbs1N6S6MYgd+hu1oU+2G3rXIAe9dgsJXSFLeo0yb3wPFpcq/uX8
 3aAUPbA/z2xXqgAKLBw9cG+G+TjlD+eD7dS7zsVqrifka9rUse/r+bsjBobTIr5ru4Z4e40KdlO
 MyV/sTTntA0yEZSXU5UyoveheYcun2t1v6RYCmF1t+QP9pV4ZS3EFXJuZa3XL75cShcpbr5zNJg
 9Pf/hu2/wInSWciETRfekqdYdKHcVC/8TxeC5DwrxXF4orG9s6VSHvxPqt7XiUIW0nYIu50W8GH
 HrJ2xcH1STKsmpz50CZ+ZOcnY90HRVykCFtNGLM+jyIl7Nympxdj15IKgIcBur1wKTE1A=
X-Google-Smtp-Source: AGHT+IHC0ZbDY70wu6ttDG8A2Zbmzpy6CztgwcnuHIw00snFLpJlqJee0pYYX7QBqUx7jB2U75heMA==
X-Received: by 2002:a05:600c:4fd4:b0:456:1b6f:c888 with SMTP id
 5b1f17b1804b1-471179123a2mr52485595e9.23.1760807285199; 
 Sat, 18 Oct 2025 10:08:05 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47154d3843csm54477215e9.11.2025.10.18.10.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 10:08:04 -0700 (PDT)
Message-ID: <e4ead0fc-2f26-4ae7-be17-0c0ad4f43d86@gmail.com>
Date: Sat, 18 Oct 2025 19:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
 <20251005-waffle-v1-1-4aab4f497a8a@gmail.com>
 <deb2e73feb27f480ad3dbb1e70939021@free.fr>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <deb2e73feb27f480ad3dbb1e70939021@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760807285; x=1761412085; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sGPkRqn/P4/pvmzbk37lHVve7QIMdEE7wDq8EIV6nxg=;
 b=OBQrDl649KjsCOm8d3wUwVVLNngr8WRfWyitNPcnAJdzZvjdW3+8fmiX1PoUdy8pMm
 FUU2v7SfqhoMjvnTQJmcgqVRFwHo6uW4cTokJaoTK3szwhpj8Ao9iohMQ3cskngyQ+7h
 3K5FfEHDWNOQ9i3xb6G7SiL6Crh4yd/TG9A98hSOAmvFAXTsfODeIvEQdsWMCZUBuoxR
 EEihjVQm71fzgLndqv/7aGZDx60LtVcugeztOkYPUIBv2wEzO/J6WmPhDIIpOvDGyX7l
 Ch317C1QZxZWWKGcOI0m2qS/a0Osm6JLSlIF34COJXh8T2FIxMPplanGyxj2wHpyrfFc
 PbRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OBQrDl64
Subject: Re: [Buildroot] [PATCH 1/4] package/waffle: fix website reference
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxOC8xMC8yMDI1IMOgIDE3OjU5LCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgo+IEhp
IFJhcGhhZWwsCj4gCj4gT24gMDUvMTAvMjAyNSAxNToyNCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3
cm90ZToKPj4gaHR0cDovL3d3dy53YWZmbGUtZ2wub3JnIHlpZWxkcyAiNDAzIEZvcmJpZGRlbiIu
Cj4+IFN3aXRjaCB0byBmcmVlZGVza3RvcC5vcmcgc3ViZG9tYWluLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+Cj4gCj4gSSBh
cHBsaWVkIHRoaXMgc2VyaWVzIG9uIG1hc3Rlci4gVGhhbmtzLgo+IAo+IEkgZGlkIGZldyBtaW5v
ciBjaGFuZ2VzLgo+IC0gSSBzcXVhc2hlZCBwYXRjaGVzIHJlbGF0ZWQgdG8gdGhlIGJ1bXAgYWx0
b2dldGhlcgo+IC0gSSBjaGFuZ2VkIF9WRVJTSU9OIHRvIHVzZSAiZ2l0IGRlc2NyaWJlIC0tYWJi
cmV2PTQwIiBmb3JtYXQKPiAtIEkgcmVtb3ZlZCAuY2hlY2twYWNrYWdlaWdub3JlIGVudHJpZXMg
dG8gZml4IGNoZWNrLXBhY2thZ2UgZXJyb3JzCj4gCj4gU2VlOgo+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tLyAKPiBjb21taXQvMTA2YjNkNDNhNDRmYjEyNmQ0
YmQ3ZmY2ODI4MTEwZTg1ZTNlY2EyMgo+IAo+IFdoaWxlIHJldmlld2luZyBhbmQgdGVzdGluZyB0
aGlzIHBhdGNoLCBJJ3ZlIHNlZW4gdGhhdCB0aGUgb25seQo+IHdhZmZsZSB1c2VyIHBhY2thZ2Ug
aXMgcGlnbGl0LCB3aGljaCBkaWQgbm90IHJlY2VpdmVkIGFueSB1cGRhdGUKPiBzaW5jZSAyMDIw
IGFuZCBubyBsb25nZXIgYnVpbGQuIEluIGNhc2UgeW91IGFyZSBpbnRlcmVzdGVkIHRvIHVwZGF0
ZQo+IGl0LCBwbGVhc2Ugc2VuZCBhIHBhdGNoLgoKVGhhbmtzIGZvciBhbGwgb2YgdGhhdC4KClll
cyBpbmRlZWQsIGl0IHdhcyB3aGlsZSB1cGRhdGluZyBQaWdsaXQgdGhhdCBJIGZvdW5kIG91dCBm
b3IgV2FmZmxlLgpQYXRjaGVzIGFyZSBpbmNvbWluZy4gOikKCkJlc3QgcmVnYXJkcywKUmFwaGHD
q2w+Cj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGllbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
