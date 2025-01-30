Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D8DC0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 18:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9EC4258C;
	Thu, 30 Jan 2025 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-x4EJ0pPcpZ; Thu, 30 Jan 2025 18:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A10A8424C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A10A8424C2;
	Thu, 30 Jan 2025 18:12:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C18D16B
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8195040342
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEs0NnpBy5Xt for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 18:12:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 129434013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 129434013B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 129434013B
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:12:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so11428165e9.3
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 10:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738260751; x=1738865551;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fpy1+qlKJBwZcuFsnZiLki/HVuQArHReUCMzRKnQFP8=;
 b=aiEl4QbtUv71RAaM6PEHDWIMc223vIgQeDZuqgOBEKspiDBYT/08MJ5kcSsvs69Wlg
 +ojTjpHWE6jArFQv6f0on94ghT4yKc2r3BVNvTQB9lcGOXcqPzM4vVYjsFUscVtDt7nv
 j4IgXH8zEzfTSzzwzgPnACCNvT1rnLTCF3aRxVlE10qgXq5+zyO80pI+MQkmPV0JqLx5
 2TD8inlIZHo9oPbr7uv7Qu12AF5LBlCreaqCccW4FyevulpYekUhSt5XJL/QLJd3j3Np
 XJSQo+2qRtj4ryBiBEIa0OQrBGxHoHdYhYAR9no70msJwgcP85C1JrJNbnXhsVUkPqAD
 fvCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLz7Gfh0iiLVngkvpEb0IeZxDt8Bf3nWCk+f4NZvXZ2+7udZHzVWyvirMw8947oruSbpONJbJmEok=@buildroot.org
X-Gm-Message-State: AOJu0Yw6UbXO0nuLXV/4Ve22Dnvkl96LHO9yAX4hxK6VJ4SIfsGfoTKd
 LauxmB4fFIm8aNaHUiJWQzLQyLCNXh4V8Y7/CTZmlCmkT54RmDyLbqpPbMMQhxg=
X-Gm-Gg: ASbGnct/Qq318Bp0TBvFOoohhTYyuwl5wOf2oclPkvth1LOW190SfOzEwH8mpMsolDU
 /2m4cDSW/5r5ITT3HnQHa9GqmQmHQAtsyKr8acHh+QjxzXvYtgCMvONcZmtcW8Faj9n4Tzw8h6A
 Uau8HXhxxfwXAbHqA3E5rJVaQTM/eV+JJ8AKEwCDOlU87DBJ6CiDJN/xiotbyS5YHbCJxu9esrQ
 sQNZO8rqUIh5AfOgqCpcOaKxsx/wWIdVbfZtXROs+lPhzF+/wzrbIbDeYlYW0thnvLrLqG6kcfV
 RsyBcJjCarXnSA/ayh9zXGRnlsmQ1ARoe8qmfbjte4UTaWFAFsmHHHpgGzFMxzHSsvx93nGtMGB
 h2irGJ7UrR3WeNrl3qwlonXAD0u18MqU5pP69lxvITYfhFwYQ0VQ=
X-Google-Smtp-Source: AGHT+IEm5WCmVWQM3234LGTO5YcnnhcxA8d67Fbyy4qO/KSVqdhGxoFD1UJJ6F/8GTdkegyuiRi8IQ==
X-Received: by 2002:a05:600c:c17:b0:438:a290:3ce0 with SMTP id
 5b1f17b1804b1-438dc3be2efmr77513895e9.8.1738260751422; 
 Thu, 30 Jan 2025 10:12:31 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5a03sm2645614f8f.71.2025.01.30.10.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 10:12:31 -0800 (PST)
Message-ID: <a7df22d1-1ee1-41ca-98f7-2a3a11a7df78@smile.fr>
Date: Thu, 30 Jan 2025 19:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Fiona Klute <fiona.klute@gmx.de>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>,
 Michael Walle <mwalle@kernel.org>, Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 "dlemoal@kernel.org" <dlemoal@kernel.org>
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
 <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
 <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
 <f6d14b70-cf74-4a03-80fd-5e4fc4325a47@gmx.de>
 <d01683ed-cc7e-4c0d-a807-7a76ce7129ba@smile.fr> <Z5tU0zCAiReVPvPY@ryzen>
Content-Language: fr, en-US
In-Reply-To: <Z5tU0zCAiReVPvPY@ryzen>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738260751; x=1738865551; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fpy1+qlKJBwZcuFsnZiLki/HVuQArHReUCMzRKnQFP8=;
 b=vtmdm0o5pPpEWtS9tf8RGF01P33bUTSRi8FMs2fFCEDATCVmkDrdnhVzhsDgQRxnAb
 YqKZWJtW3EoL7ANaASguiAd2zS/iZa/9ssDNa4I9tYbCj/EZvJ+s1foNAqlGXLNr4Tcm
 H/SYd47AbK4SCjkySJnVYDt2Vt0gIvf7oUn2Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vtmdm0o5
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work
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

SGVsbG8gTmlrbGFzLCBBbGwsCgpMZSAzMC8wMS8yMDI1IMOgIDExOjMwLCBOaWtsYXMgQ2Fzc2Vs
IGEgw6ljcml0wqA6Cj4gSGVsbG8gUm9tYWluLAo+IAo+IE9uIFdlZCwgSmFuIDI5LCAyMDI1IGF0
IDExOjEwOjMxQU0gKzAxMDAsIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pgo+
PiBBRkFJSywgdGhlIGN1cnJlbnQgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggb3B0
aW9uIGRvZXNuJ3Qgc2VlbXMgdG8gdGFrZQo+PiBpbnRvIGFjY291bnQgYW55IGV4dGVybmFsIGRl
dmljZXRyZWUgb3ZlcmxheSBmaWxlcyAoZHRzbykuCj4+Cj4+IEkndmUgc2VuZCBhIG5ldyB2ZXJz
aW9uIG9mIHRoaXMgcGF0Y2ggKGJ1dCBkdHNvIGFyZSBub3Qgc3VwcG9ydGVkKToKPj4KPj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjUwMTI5MDk1NzE2LjI1MTE0MzQtMS1y
b21haW4ubmFvdXJAc21pbGUuZnIvVC8jdAo+Pgo+Pj4KPj4+IFdvdWxkIHNvbWV0aGluZyBsaWtl
IHRoYXQgYmUgaW50ZXJlc3RpbmcgZm9yIEJ1aWxkcm9vdCwgd2hldGhlciBhcyBhCj4+PiBnZW5l
cmljIERUQiBidWlsZCBwYWNrYWdlIG9yIGluZnJhc3RydWN0dXJlPwo+Pgo+PiBXaGlsZSByZXZp
ZXdpbmcgdGhpcyBwYXRjaCwgSSBoYWQgdG8gdGFrZSBhIGxvb2sgYXQgaG93IHRvIGJ1aWxkIGEg
ZHRiIGZpbGUKPj4gb3V0c2lkZSBvZiB0aGUga2VybmVsIGJ1aWxkIGluZnJhc3RydWN0dXJlIChs
aWtlIFlvY3RvIGRvZXMpIGJ1dCBpdCdzIG5vdCBlYXN5Lgo+PiBBY3R1YWxseSB3ZSBhcmUgaGFw
cHkgdG8ga2VlcCB0aGlzIGJ1aWxkIHByb2Nlc3MgaGlkZGVuIGluIHRoZSBrZXJuZWwgTWFrZWZp
bGVzLgo+Pgo+PiBTaW5jZSB0aGUgbmV4dCBCdWlsZHJvb3QgbWVldGluZyBpcyBuZXh0IHdlZWss
IHRoaXMgaXMgcHJvYmFibHkgYSB0b3BpYyB3ZSBjYW4KPj4gZGlzY3Vzcy4gRmVlbCBmcmVlIHRv
IHNlbmQgYSBwYXRjaCAoZXZlbiBhIGRyYWZ0KS4KPiAKPiBUaGUgcGF0Y2ggc2VyaWVzIHRoYXQg
eW91IGxpbmsgdG8gYWJvdmUgb25seSBjYXRlciB0byBvdXQtb2YtdHJlZSBkZXZpY2UKPiB0cmVl
cy4KPiAKPiBJJ3ZlIHNlbmQgYSBwYXRjaCBmb3IgaW4tdHJlZSBkZXZpY2UgdHJlZSBvdmVybGF5
cyAoLmR0c28pIHRoYXQgaGFzIGJlZW4KPiBpZ25vcmVkOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2J1aWxkcm9vdC9aMlZCalRCS1VrbjlNZWhyQHJ5emVuL1QvI3UKPiAKPiBJZiB0aGVyZSBp
cyBhIEJ1aWxkcm9vdCBtZWV0aW5nIG5leHQgd2VlaywgcGVyaGFwcyB5b3UgY291bGQgYmUgbmlj
ZSB0bwo+IGJyaW5nIHVwIHRoZSB1c2UgY2FzZSBvZiBpbi10cmVlIGRldmljZSB0cmVlIG92ZXJs
YXlzICguZHRzbykuCj4gCj4gSSB3b3VsZCBiZSBuaWNlIGlmIGVpdGhlcjoKPiAxKSBNeSBwYXRj
aCBpcyBtZXJnZWQuCj4gMikgU29tZSBvdGhlciBwYXRjaCB0aGF0IGFkZHMgc3VwcG9ydCBmb3Ig
aW4tdHJlZSBkZXZpY2UgdHJlZSBvdmVybGF5cwo+ICAgICguZHRzbykgZ2V0cyBhY2NlcHRlZC4K
ClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyIQoKQWN0dWFsbHksIEkgbWlzc2VkIHlvdXIgcGF0Y2gg
c2VyaWVzIGFuZCBub3RpY2VkIHRoYXQgZXh0ZXJuYWwgZHRzbyBzdXBwb3J0IGlzCmN1cnJlbnRs
eSBtaXNzaW5nIGluIEJ1aWxkcm9vdC4KCkknbGwgdGFrZSB5b3VyIGNvbnRyaWJ1dGlvbiBpbnRv
IGFjY291bnQgZHVyaW5nIHRoZSBtZWV0aW5nIDopCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
Cj4gCj4gS2luZCByZWdhcmRzLAo+IE5pa2xhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
