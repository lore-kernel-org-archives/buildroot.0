Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0928DC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 09:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A681F4030D;
	Tue, 22 Apr 2025 09:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93XejL8E7cuU; Tue, 22 Apr 2025 09:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B75402EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B75402EF;
	Tue, 22 Apr 2025 09:06:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BBB11A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C6D980CB3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSHlb0R_nTnb for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 09:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77C0F80CB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C0F80CB6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77C0F80CB6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 09:06:45 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so33786875e9.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 02:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745312803; x=1745917603;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9iopyISRcxrCocGd1ieL6eJqZ9ab9G69OrFUiMIgdzs=;
 b=GYycCUXsXlj/dKeNPExKu+ioxOokjbFpsHNPI/rqKDsP7SJHyuHD9ANthL3leunMhy
 V3uZmB6t7FVza56GU1ojzDcIyxZYE320c6Z8KXwAW41asZt3F5iQjRjO/842TfKTvxg1
 u/y4kD3f094QhIxeQVwTkJFW3lNQK0BxE9XegiEug1iTH1U+nByimhi2VobxhMfefBdq
 kyyuRDeU6e+D2Uldgy2/pv3M69zimtb9liOE3pO+KKaIpnWzDre7Co1YmeV6U1DP2MwL
 ZbpXjnUo3mysOetdONdZTwdTCBaPsffbhSubs3hDd4qRqtU1j+ApkrErKvwNE81d8zeA
 XvUg==
X-Gm-Message-State: AOJu0YwDyg60Y6ZlCDs82kpNX752rMj4SzUTN1OG9yu6zAan5hfrOqno
 paebivM3jmJn2lPFWvH0eaGTjQq9kCVrHCA7h5+ZZNY5fIqukkQ5o8y3Fy7FT6ahehDN6CQlGpb
 IawA=
X-Gm-Gg: ASbGncv9KLPU92JPi+3OgpB31ddmBRqgYJO8c/oIfbEq00tCl9TzRV7Ze+gfjqsuFNl
 RvrpAeFtb7L5BuCWO9T1eThcQGmQwfjPrKA/wldQsXO5ZSsLtf+sDjevmYfSdoONI7rrGtRJ0uj
 gF+o+gK0MV0hkmju2BrmHmkpkMTNNy1N1oCEs8SCZxm8mMMoslqBeEd38O+w8V0vf1JJj6naMrW
 qRgCeLmDsTJo0g5/4glICZMUezzxCVPagKXqpwo6dFV8hrgFBrZEYd2JFyTJ+FUWmCWeM4M5wgP
 UgbjS7g+ITkCF+RV0yIyXiajhtQ5z3MnZo/V8AGEjD/TK22rQ0wf2KWI7jUqGdDFEmPuUK7mw4S
 AWRUG6OuZ/rlXElPLR0/txmM3ft+FxQE=
X-Google-Smtp-Source: AGHT+IF4AJKYQu7G7nHMI4mhyjPFwInmrnPhs0EnA3ip26atDo0Q/XmqymrBcbJtZFUZd30ubm7ZIg==
X-Received: by 2002:a7b:cbd3:0:b0:43c:ed33:a500 with SMTP id
 5b1f17b1804b1-4406979083fmr106126805e9.10.1745312803193; 
 Tue, 22 Apr 2025 02:06:43 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43319csm14760864f8f.38.2025.04.22.02.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 02:06:43 -0700 (PDT)
Message-ID: <d420da00-f3f5-480d-be33-ba41aa016de6@smile.fr>
Date: Tue, 22 Apr 2025 11:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>
References: <20250422085337.901025-1-elmehdi.younes@smile.fr>
Content-Language: en-US
In-Reply-To: <20250422085337.901025-1-elmehdi.younes@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745312803; x=1745917603; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9iopyISRcxrCocGd1ieL6eJqZ9ab9G69OrFUiMIgdzs=;
 b=rJTYONUakdcXTiCpVEWDxS0aGrmbPF9MmJpHQS2iHcBTtsvwjzsvAFe3h0UoeoTGDl
 SV4n9AFu8SgyBtL0i9+GNBtSAbfDdzo3fCeD9c6HcCZGS1M0CCg2DHX+Tns3zYioJkDs
 b662f8vkq75AVOJd3SXP1Dl2Ml/JI8+JYUR+Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=rJTYONUa
Subject: Re: [Buildroot] [PATCH 1/2] package/bat:bump to version 0.25.0
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYWxsLAoKVGhpcyBwYXRjaCBpcyBtb3N0bHkgc2hhcmVkIHRvIGxldCB5b3Uga25vdyB3
aGF0IEkndmUgYmVlbiB3b3JraW5nIG9uIApyZWNlbnRseS4KCknigJltIGF3YXJlIHRoYXQgdGhp
cyBgYmF0YCB1cGRhdGUgd2lsbCBsaWtlbHkgY29uZmxpY3Qgd2l0aCBteSBvdGhlciAKcGF0Y2gg
c2VyaWVzIHVwZGF0aW5nCgpSdXN0IHRvIHZlcnNpb24gMS44Ni4wIGFuZCBtaWdyYXRpbmcgY3Jh
dGVzIHRvIHRoZSBjYXJnbzMgYXJjaGl2ZSBmb3JtYXQuCgpTaW5jZSBgYmF0YCBzdGlsbCB1c2Vz
IGNhcmdvMiBpbiB0aGlzIHBhdGNoICh3aXRoIFJ1c3QgMS44Mi4wKSwgaXQgd2lsbCAKbmVlZCB0
byBiZSBhbGlnbmVkCgpvbmNlIHRoZSBSdXN0IGJ1bXAgaXMgbWVyZ2VkLgoKSeKAmWxsIHdhaXQg
Zm9yIHJldmlld3MgYW5kIHRlc3QgcmVzdWx0cyBiZWZvcmUgcHJvY2VlZGluZyB0byByZXNvbHZl
IGFueSAKcmVzdWx0aW5nIGNvbmZsaWN0cwoKd2hldGhlciB0aGV5IHJlbGF0ZSB0byBoYXNoIHVw
ZGF0ZXMgd2l0aGluIHRoaXMgcGF0Y2ggaXRzZWxmLCBvciBkdWUgdG8gCnRoZSBnbG9iYWwgY2Fy
Z28zCgpoYXNoIHVwZGF0ZXMgaW4gdGhlIFJ1c3QgcGF0Y2ggc2VyaWVzLgoKVGhhbmtzIGluIGFk
dmFuY2UgZm9yIHlvdXIgZmVlZGJhY2shCgpCZXN0IHJlZ2FyZHMsCkVsIE1laGRpIFlPVU5FUwoK
TGUgMjIvMDQvMjAyNSDDoCAxMDo1MywgRWwgTWVoZGkgWU9VTkVTIGEgw6ljcml0wqA6Cj4gQ2hh
bmdlbG9nOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9zaGFya2RwL2JhdC9ibG9iL21hc3Rlci9DSEFO
R0VMT0cubWQKPgo+IFNpZ25lZC1vZmYtYnk6IEVsIE1laGRpIFlPVU5FUyA8ZWxtZWhkaS55b3Vu
ZXNAc21pbGUuZnI+Cj4gLS0tCj4gICBwYWNrYWdlL2JhdC9iYXQuaGFzaCB8IDIgKy0KPiAgIHBh
Y2thZ2UvYmF0L2JhdC5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9iYXQvYmF0Lmhh
c2ggYi9wYWNrYWdlL2JhdC9iYXQuaGFzaAo+IGluZGV4IGU4MDMwMWZmNDkuLmYzMDUwZjYzNTQg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9iYXQvYmF0Lmhhc2gKPiArKysgYi9wYWNrYWdlL2JhdC9i
YXQuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAgIyBMb2NhbGx5IGdlbmVyYXRlZAo+IC1zaGEy
NTYgIDQ1ZmNkZDYwNzZkYzFiNDU2OThhN2I2YzBmNGQxZjVkOWFlNjc2ZjNjYTNiMTU1NDAyYWQy
NDY4MGQ1YjRkZjYgIGJhdC0wLjI0LjAtY2FyZ28yLnRhci5nego+ICtzaGEyNTYgIGQ3OTNhOGYz
YTZlNDdiOTZlZTgxZDYyNGQyYjRiNDcwZjAwNWI2ODIzZWY2YjBmMzhjMGNjMTA3MjZkMzVmZGMg
IGJhdC0wLjI1LjAtY2FyZ28yLnRhci5nego+ICAgc2hhMjU2ICBjNzFkMjM5ZGY5MTcyNmZjNTE5
YzZlYjcyZDMxOGVjNjU4MjA2MjcyMzJiMmY3OTYyMTllODdkY2YzNWQwYWI0ICBMSUNFTlNFLUFQ
QUNIRQo+ICAgc2hhMjU2ICBkY2NkYTllYjk1MzNmNWM2NTYyNGExMTA2NTM2YzZjZmRlNDYwMDhk
NThlNjBiM2ZhZjE1NGU4YjlmZDViNDZlICBMSUNFTlNFLU1JVAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2JhdC9iYXQubWsgYi9wYWNrYWdlL2JhdC9iYXQubWsKPiBpbmRleCBiOTVjZGIyNWFjLi43
ZTg5ZDM2MWFmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYmF0L2JhdC5tawo+ICsrKyBiL3BhY2th
Z2UvYmF0L2JhdC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiAgIAo+IC1CQVRfVkVSU0lPTiA9IDAuMjQuMAo+ICtCQVRfVkVSU0lPTiA9IDAu
MjUuMAo+ICAgQkFUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHNoYXJrZHAsYmF0LHYkKEJBVF9WRVJT
SU9OKSkKPiAgIEJBVF9MSUNFTlNFID0gQXBhY2hlLTIuMCBvciBNSVQKPiAgIEJBVF9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRS1BUEFDSEUgTElDRU5TRS1NSVQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
