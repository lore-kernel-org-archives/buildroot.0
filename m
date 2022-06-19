Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF23C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD72E81BCB;
	Sun, 19 Jun 2022 15:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD72E81BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjjSKw11jtq1; Sun, 19 Jun 2022 15:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20A181842;
	Sun, 19 Jun 2022 15:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20A181842
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 673041BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE4081842
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE4081842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5Pw_YcIiYfa for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:54:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3760481819
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3760481819
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:54:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z7so11978071edm.13
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=GdEEbbtx/wQsblujJ10rtDfdjNSz+NOjFKQsrW3zeck=;
 b=Hxu1dqGMMzCj7RIJyyiTXT90jnywomIlU+4zYBuaTNBrVLHAFUr1UYBV0Q346f3vNI
 9zK5BKL4Z4DGSwPfE/ZUvkEZ4hCqL+nKXGe0E7Bki1pGHIV0JxuToNIgT05K8KhMYmve
 ZLrOTnPZVL5W5SU/ibhDArU+oXBM7akSVMr4BiocHs7kiAkSawc+rZj3e84hIVfauUnb
 lnr7/vOWHsqOlm6uV/HYVPcBXNfvlqplg/G4ed2Xohy3KrULLY4daYCULEn2Bd13GGtB
 RrvXnZv6vhEwbYeGhsEMYJlTSbp3Lz+ht2VgPxaLO2KuXqnyEs8N1oWmprBCQmNt0iux
 pSZg==
X-Gm-Message-State: AJIora+gyhKyR+gHi3TxjNIxAGLiAde7Au71+2Nau/tlzYZgBUBjSxjP
 /zCXgtyFM4MUX2GXRMLMX12o3+A0SQPT/g==
X-Google-Smtp-Source: AGRyM1tUKcLSiycYDTOvIC0cmbGt0FYDBj9S67bcASyVkU2xmJUZDIh1xLeMGFCUitAhQoVqrpV4sQ==
X-Received: by 2002:a05:6402:378d:b0:435:2de9:d24c with SMTP id
 et13-20020a056402378d00b004352de9d24cmr23257375edb.165.1655654070481; 
 Sun, 19 Jun 2022 08:54:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056402270b00b0042e1cbc4471sm8273599edd.3.2022.06.19.08.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:54:30 -0700 (PDT)
Message-ID: <a694ec95-e197-968d-5de7-4f28609f151b@mind.be>
Date: Sun, 19 Jun 2022 17:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220613200620.292365-1-fontaine.fabrice@gmail.com>
 <ee3bb199-4f03-b816-bf00-a979874b52b7@mind.be>
Organization: Essensium/Mind
In-Reply-To: <ee3bb199-4f03-b816-bf00-a979874b52b7@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=GdEEbbtx/wQsblujJ10rtDfdjNSz+NOjFKQsrW3zeck=;
 b=QaLIs/uxBw/gS3AiOsMBswMz1ZJi8z6SUK05DMc/Z41qTyhEpQv2lZqjJRbo24uGxd
 8xkmUbnNcr4gI8Sn0TWTgSJF9anfyYDGr7Wnzv3X9ASvtXtLHJmSdoRh7ZtXpreOqlPW
 W9wFSAGq6Et2Azqn9hR6kHKLVtJ1Krgqalro5W6ef1xGb2yOP2LB0/XOq/i2r/GIbYHy
 ZV9SDp6VNL3OIVRltwIJp1FDy58BdSXx63zJeTfAJ/pkmkWafyiFMhgvhAZSBkE8WNAo
 TYg3FVJsZYWgeendIW+OSF2x78RuWhp5IzxSweZx/JLK3fRcZGXTeEp7l3opHPLwGO+b
 ZB5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QaLIs/ux
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: needs dynamic
 library with libcurl and mbedtls
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE5LzA2LzIwMjIgMTc6NTMsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxMy8wNi8yMDIyIDIyOjA2LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+PiBsaWJtb2RzZWN1
cml0eSBlbWJlZHMgc2V2ZXJhbCBtYmVkdGxzIHNvdXJjZSBmaWxlcyBzaW5jZSB2ZXJzaW9uIDMu
MC4wCj4+IGFuZAo+PiBodHRwczovL2dpdGh1Yi5jb20vU3BpZGVyTGFicy9Nb2RTZWN1cml0eS9j
b21taXQvYTNhZTY4NmYyNTU1YmRhY2JmYzllMTg4OWFkMDUwNjU3MTFhMTY1ZCAKPj4KPj4gcmVz
dWx0aW5nIGluIHRoZSBmb2xsb3dpbmcgc3RhdGljIGJ1aWxkIGZhaWx1cmUgaWYgY3VybCBpcyBi
dWlsdCB3aXRoCj4+IG1iZWR0bHMgc3VwcG9ydDoKPj4KPj4gL2hvbWUvYnVpbGRyb290L2F1dG9i
dWlsZC9pbnN0YW5jZS0wL291dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vbTY4ay1idWls
ZHJvb3QtdWNsaW51eC11Y2xpYmMvYmluL2xkLnJlYWw6IAo+PiAvaG9tZS9idWlsZHJvb3QvYXV0
b2J1aWxkL2luc3RhbmNlLTAvb3V0cHV0LTEvaG9zdC9iaW4vLi4vbTY4ay1idWlsZHJvb3QtdWNs
aW51eC11Y2xpYmMvc3lzcm9vdC91c3IvbGliL2xpYm1iZWRjcnlwdG8uYShtZDUuYy5vKTogCj4+
IGluIGZ1bmN0aW9uIGBtYmVkdGxzX21kNV9mcmVlJzoKPj4gbWQ1LmM6KC50ZXh0KzB4MTYpOiBt
dWx0aXBsZSBkZWZpbml0aW9uIG9mIGBtYmVkdGxzX21kNV9mcmVlJzsgCj4+IC4uLy4uL3NyYy8u
bGlicy9saWJtb2RzZWN1cml0eS5hKGxpYm1iZWR0bHNfbGEtbWQ1Lm8pOm1kNS5jOigudGV4dCsw
eDE2KTogCj4+IGZpcnN0IGRlZmluZWQgaGVyZQo+Pgo+PiBGaXhlczoKPj4gwqAgLSAKPj4gaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvOTg0NzJhM2E0MWNkYmNiM2QwMjI4
OWE0MzcwNzRhMjY3ZjRiMmU4ZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5l
IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPgo+IMKgQXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rcy4KPgo+IMKgU2luY2UgdXBzdHJlYW0gc2VlbWVkIHRvIHJpc2sgbm90IGFjY2VwdGluZyB0
aGUgcGFja2FnZSwgSSBhZGRlZCBhIGNvbW1lbnQgCj4gdGhhdCBob3BlZnVsbHkgd2lsbCB0aWNr
bGUgdGhlbS4KCiDCoEdhaCwgdGhpcyB3YXMgZm9yIGFub3RoZXIgcGF0Y2guCgoKIMKgUmVnYXJk
cywKIMKgQXJub3V0CgoKPgo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+Cj4+IC0tLQo+PiDCoCBw
YWNrYWdlL2xpYm1vZHNlY3VyaXR5L0NvbmZpZy5pbsKgwqDCoCB8IDUgKysrKysKPj4gwqAgcGFj
a2FnZS9uZ2lueC1tb2RzZWN1cml0eS9Db25maWcuaW4gfCA1ICsrKysrCj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJt
b2RzZWN1cml0eS9Db25maWcuaW4gYi9wYWNrYWdlL2xpYm1vZHNlY3VyaXR5L0NvbmZpZy5pbgo+
PiBpbmRleCA4N2Y3YTljMTAzLi5mNjVhYjNkZTkzIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2xp
Ym1vZHNlY3VyaXR5L0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL2xpYm1vZHNlY3VyaXR5L0Nv
bmZpZy5pbgo+PiBAQCAtMiw2ICsyLDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQk1PRFNFQ1VS
SVRZCj4+IMKgwqDCoMKgwqAgYm9vbCAibGlibW9kc2VjdXJpdHkiCj4+IMKgwqDCoMKgwqAgZGVw
ZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPj4gK8KgwqDCoCAjIGxpYm1vZHNlY3VyaXR5IGVtYmVk
cyBzZXZlcmFsIG1iZWR0bHMgc291cmNlIGZpbGVzCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiAhKEJS
Ml9TVEFUSUNfTElCUyAmJiBCUjJfUEFDS0FHRV9MSUJDVVJMX01CRURUTFMpCj4+IMKgwqDCoMKg
wqAgc2VsZWN0IEJSMl9QQUNLQUdFX1BDUkUKPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKg
wqDCoMKgIExpYm1vZHNlY3VyaXR5IGlzIG9uZSBjb21wb25lbnQgb2YgdGhlIE1vZFNlY3VyaXR5
Cj4+IEBAIC0xNywzICsxOSw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJNT0RTRUNVUklUWQo+
PiDCoCDCoCBjb21tZW50ICJsaWJtb2RzZWN1cml0eSBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyss
IHRocmVhZHMiCj4+IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElCU1REQ1BQ
IHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCj4+ICsKPj4gK2NvbW1lbnQgImxpYm1vZHNl
Y3VyaXR5IG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIKPj4gK8KgwqDCoCBk
ZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUyAmJiBCUjJfUEFDS0FHRV9MSUJDVVJMX01CRURUTFMK
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvQ29uZmlnLmluIAo+PiBi
L3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvQ29uZmlnLmluCj4+IGluZGV4IGIxZmNiYWRkN2Eu
LjVjYmU1N2E4NjYgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvQ29u
ZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvQ29uZmlnLmluCj4+IEBA
IC0zLDYgKzMsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTkdJTlhfTU9EU0VDVVJJVFkKPj4gwqDC
oMKgwqDCoCBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX05HSU5YX0hUVFAKPj4gwqDCoMKgwqDCoCBk
ZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUCAjIGxpYm1vZHNlY3VyaXR5Cj4+IMKgwqDC
oMKgwqAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGlibW9kc2VjdXJp
dHkKPj4gK8KgwqDCoCBkZXBlbmRzIG9uICEoQlIyX1NUQVRJQ19MSUJTICYmIEJSMl9QQUNLQUdF
X0xJQkNVUkxfTUJFRFRMUykgIyAKPj4gbGlibW9kc2VjdXJpdHkKPj4gwqDCoMKgwqDCoCBzZWxl
Y3QgQlIyX1BBQ0tBR0VfTElCTU9EU0VDVVJJVFkKPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDC
oMKgwqDCoMKgIFRoZSBNb2RTZWN1cml0eS1uZ2lueCBjb25uZWN0b3IgaXMgdGhlIGNvbm5lY3Rp
b24KPj4gQEAgLTE0LDMgKzE1LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX05HSU5YX01PRFNFQ1VS
SVRZCj4+IMKgIGNvbW1lbnQgIm5naW54LW1vZHNlY3VyaXR5IG5lZWRzIGEgdG9vbGNoYWluIHcv
IEMrKywgdGhyZWFkcyIKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX05HSU5Y
X0hUVFAKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwg
IUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPj4gKwo+PiArY29tbWVudCAibmdpbngtbW9kc2Vj
dXJpdHkgbmVlZHMgYSB0b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJ5Igo+PiArwqDCoMKgIGRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfTkdJTlhfSFRUUAo+PiArwqDCoMKgIGRlcGVuZHMgb24gQlIy
X1NUQVRJQ19MSUJTICYmIEJSMl9QQUNLQUdFX0xJQkNVUkxfTUJFRFRMUwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
