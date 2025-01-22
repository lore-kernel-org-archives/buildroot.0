Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E60C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 11:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2E561296;
	Wed, 22 Jan 2025 11:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlhPZfk5PL1K; Wed, 22 Jan 2025 11:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F1F4612AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F1F4612AE;
	Wed, 22 Jan 2025 11:06:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2528D7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 11:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F9DD41E79
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 11:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeyMp6RYv-Pa for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 11:06:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF36341E75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF36341E75
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF36341E75
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 11:06:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so69453095e9.1
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 03:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737543985; x=1738148785;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hvAHx8qfj9cdPWOO5AlGe/jNv9CPrAsDzo4/bTOjfgs=;
 b=MgCNukAJ3xUzbRinngzGqUs6GU55Yj8YNQrgIu+shdvxCJ7px8t28aYB5TNuZO3Lv4
 K47rSnyWsVSA5d31CrahkgAC4ihT1H9JXwDXqamEsyxiZUHkhA6cTKB1pW+Yw5iyDY84
 ABJ6owDyfUazNncFVH1WxVAZr+V1+70lJ4akqzqQ0sA0UBeft3KxHRuhkexnPoJgXzCT
 amkb8XMQWovBxgtiJiYCS3HMryhN+CIsS2NgAlEGSLPv8uEfqFI0zP1fqPjqvlcxDWFI
 R14oEveQ321S8wt8nEGGebcQmgD47BfOAx4uCr/sWUaB3C3a7t9QfkJQwBPpd/Q07KWy
 7ozw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXgBxP1yHUEIMjkyapudoDCKwPNkxHlpYFZQW9dNfjCcvf5xXtyWSOoSzhH2mmNIb//hAaKSkf3Os=@buildroot.org
X-Gm-Message-State: AOJu0YxBW6/7O5Xii2NAl0Ikx4Bw8OjqVHpjBPMVF7fs5uImYvm7ULls
 5rfYf1M60KZxC/TliECqdit1255+5KQLHzMLzXo4umQsr/PBI1SBVqkc+018q8Q=
X-Gm-Gg: ASbGncuWQDH1i5DcEfROTkSkzCdeqNzHr9pSpM1oQQj7z0j4wXh6QVmbqsWAgwn1uex
 eWIHIwq+wSsh8spSK9U9xz/6c96j/ohJIJvrldyuGeJS+jVScNLFHdSSpd2cXfFajTseQkcnHyR
 klLofcTeVS/RZDjIG4xLlQncC7bKg11grYMVO50m/yzeMrv1LY66w9L+uhrPDUQyog046/CkSO+
 eQLKZaHzeA/mQmSfoCqfGPdVGWNV9v54pvtbyHY2vxWe2fy3D3apnYNxuHlgI9ilsz5cDrWKbAJ
 w6XIC5wpwX2CiGeOq2T7a0Mc+/GYi7J7V+skzNRi3jGEabypVlosN2GL4g==
X-Google-Smtp-Source: AGHT+IG7+phQxIND5uM4i2XGi4UfK+ocStWoxUZlHzqfDL1sPYWp+yNXVOeBWiog4CO/n7/wtTH9Yg==
X-Received: by 2002:a05:600c:1f8f:b0:431:93d8:e1a1 with SMTP id
 5b1f17b1804b1-43891430defmr167666545e9.27.1737543984610; 
 Wed, 22 Jan 2025 03:06:24 -0800 (PST)
Received: from [10.5.90.34]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31afb70sm20440595e9.19.2025.01.22.03.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 03:06:24 -0800 (PST)
Message-ID: <3675f282-da36-49f5-90e5-628dffab23f1@smile.fr>
Date: Wed, 22 Jan 2025 12:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, Michael Walle <mwalle@kernel.org>, 
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
Cc: Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
References: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
 <D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org>
 <5576c173-c1a6-4c85-91dc-b8a6b0a54ba6@smile.fr>
 <5de84d6d-dafb-432c-9308-0b8d7e93fdd3@mind.be>
Content-Language: en-US
In-Reply-To: <5de84d6d-dafb-432c-9308-0b8d7e93fdd3@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1737543985; x=1738148785; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hvAHx8qfj9cdPWOO5AlGe/jNv9CPrAsDzo4/bTOjfgs=;
 b=ivJoS2sybXRNIXkAH/YdbkGwRMFuRWax6xCGI3E7L/HctBPGhHgQ4POGUVOEJcW41I
 OXCJ7D+5OSmhYgWgYulAB7kigUqer10SvmA1X1M39tVBB9SNtGU+LpsOtNnKCvO8cC45
 SBo+xish39pcDIzLFRA2F1LvXuGubFnp58BTM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ivJoS2sy
Subject: Re: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work
 with newest kernels
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

SGVsbG8gQXJub3V0LCBBbGwsCgpMZSAyMi8wMS8yMDI1IMOgIDExOjUyLCBBcm5vdXQgVmFuZGVj
YXBwZWxsZSBhIMOpY3JpdMKgOgo+IAo+IAo+IE9uIDIyLzAxLzIwMjUgMTE6NDAsIFJvbWFpbiBO
YW91ciB3cm90ZToKPiBbc25pcF0KPj4gVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBkZWZpbmUgdGhl
IHBhdGggdG8gdGhlIE9PVCBkdHMgZmlsZSBsaWtlIHRoaXM6Cj4+Cj4+IEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX0RUU19QQVRIPSJib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9hdDkxLQo+PiBz
YW1hNWQzX2FjcXVhLmR0cyIKPj4KPj4gU28gd2UgY2FuJ3QgZXh0cmFjdCB0aGUgdmVuZG9yIHBy
ZWZpeCBmcm9tIGl0IGV2ZW4gaWYgaXQgd291bGQgbG9vayBsaWtlIHRoaXM6Cj4+Cj4+IEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIPSJib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9k
dHMvbWljcm9jaGlwLwo+PiBhdDkxLXNhbWE1ZDNfYWNxdWEuZHRzIgo+Pgo+PiBOb3RlOiB0aGUg
dmVuZG9yIHByZWZpeCBpcyBub3QgYWx3YXlzIG9uZSBzdWItZGlyZWN0b3J5Ogo+Pgo+PiDCoMKg
IGFyY2gvYXJtL2Jvb3QvZHRzL3RpL29tYXAvZHJhNy5kdHNpCj4+IMKgwqAgYXJjaC9hcm02NC9i
b290L2R0cy9leHlub3MvZ29vZ2xlL2dzMTAxLmR0c2kKPj4KPj4gV2UgcHJvYmFibHkgbmVlZCBh
IG5ldyBvcHRpb24gdG8gcHJvdmlkZSBzb21ldGhpbmcgbGlrZSBhIGR0cyAib3ZlcmxheSIKPj4g
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX09WRVJMQVkgKHNpbWlsYXIgdG8gQlIyX1JPT1RG
U19PVkVSTEFZKSB0byBjb3B5IGEKPj4gZHRzIGRpcmVjdG9yeSBkaXJlY3RseSB0byAkKExJTlVY
X0FSQ0hfUEFUSCkvYm9vdC9kdHMvCj4+Cj4+IMKgwqAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
RFRTX09WRVJMQVk9ImJvYXJkL2FjbWVzeXN0ZW1zL2FjcXVhLWE1L2R0cyIKPj4KPj4gwqDCoCBi
b2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMvCj4+IMKgwqAg4pSU4pSA4pSAIG1pY3JvY2hp
cAo+PiDCoMKgwqDCoMKgwqAg4pSU4pSA4pSAIGF0OTEtc2FtYTVkM19hY3F1YS5kdHMKPj4KPj4g
RG9pbmcgc28sIHRoZSBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCBzaG91bGQgYmUg
ZGVwcmVjYXRlZC4KPiAKPiDCoEFsdGVybmF0aXZlbHksIHdlIGNhbiBkZWZpbmUgYW4gYWRkaXRp
b25hbCBjb25maWcgdmFyaWFibGUKPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfRElSRUNU
T1JZIHRoYXQgY29udGFpbnMgdGhlIHN1YmRpcmVjdG9yeSB0byB3aGljaAo+IHRoZSBjdXN0b20g
RFRTIGlzIGNvcGllZC4gU28gYG1pY3JvY2hpcGAsIGB0aS9vbWFwYCwgb3IgYGV4eW5vcy9nb29n
bGVgLgo+IAo+IMKgRGlzYWR2YW50YWdlOiB3ZSBjYW4ndCBzdXBwb3J0IG11bHRpcGxlIGR0cyBm
cm9tIGRpZmZlcmVudCB2ZW5kb3JzLiBOb3Qgc3VyZSBpZgo+IHRoYXQgaXMgZ29pbmcgdG8gYmUg
YW4gYWN0dWFsIHVzZSBjYXNlLCBidXQgcGVvcGxlIGRvIGNyYXp5IHRoaW5ncy4uLiBCdXQgSQo+
IHRoaW5rIGZvciB0aGUgY29tbW9uIGNhc2UgKG9mIG9ubHkgYSBzaW5nbGUgb3IgYSBsb3cgbnVt
YmVyIG9mIERUU2VzIHRoYXQgYWxsCj4gdXNlIHRoZSBzYW1lIENQVSAoZmFtaWx5KSBzbyBhcmUg
aW4gdGhlIHNhbWUgZGlyZWN0b3J5KSBpdCB3b3JrcyB3ZWxsIGFuZCBpcwo+IG11Y2ggZWFzaWVy
IGZvciB0aGUgdXNlci4KClRoYXQgd2FzIGFjdHVhbGx5IHRoZSBNaWNoYWVsJ3MgY29tbWVudDoK
CiJEb24ndCBhc3N1bWUgdGhlIHZlbmRvciBwYXJ0IHdpbGwgYWx3YXlzIGJlIHRoZSBzYW1lIGZv
ciBkaWZmZXJlbnQgZGV2aWNlIHRyZWVzLiIKCldoYXQgaWYgdGhlIHVzZXIgaGF2ZSB0byBjb3B5
IGEgZmlsZSB0byAkKExJTlVYX0FSQ0hfUEFUSCkvYm9vdC9kdHMvIGFuZCBhbm90aGVyCm9uZSB0
byAkKExJTlVYX0FSQ0hfUEFUSCkvYm9vdC9kdHMvPHZlbmRvcj4vID8KCkl0J3MgdHJ1ZSB0aGF0
IGl0J3MgdW5saWtlbHkgdG8gaGFwcGVuIGJ1dCB3aG8ga25vdz8KCldpdGggQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fRFRTX0RJUkVDVE9SWSBzb2x1dGlvbiwgdXNlcnMgY2FuIHN0aWxsIHBhdGNo
IHRoZWlyCmtlcm5lbHMgdG8gYWRkIGFsbCBtaXNzaW5nIGZpbGVzIGJ1dCBpdCdzIG5vdCByZWFs
bHkgbmljZS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiDCoFJlZ2FyZHMsCj4gwqBBcm5v
dXQKPiAKPj4KPj4gVGhvdWdodHM/Cj4+Cj4+IFsxXQo+PiBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS8KPj4gY29tbWl0LzhmYjUyMDk4ODU5ZmE1Y2Y3ZWNmNGRi
MzBmZjhlMDI3NjY4NzgzMmYKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4KPj4+
Cj4+PiAtbWljaGFlbAo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
